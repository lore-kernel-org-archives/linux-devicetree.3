Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946883783DE
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776652679; cv=none; b=lFeHwBtCFvqwY2Jc8LAK8c+V4XIb+lQq7rJK91evLMcOJJvM0AuPQ09QMgw+AoXzfZof9OowDmu1U0cf3mjE+Y2RQecsYntJZEioM8W4STJNXuetFyPaynD6p1T5JJ8LX9uGXY/ZuAD0gKFyNWsfn+OUXUM7HsSThpHWwa/BZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776652679; c=relaxed/simple;
	bh=edi7ASQs4faQY0RBHHFXV7sYsMZdNk9LRoZpbng+BQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PzpO3leh49VIE1Yv1TpK7utOqkFqoirmSU4pkLCFAKpeHmqkgrn0U2WG2WxpNPJw8ugbvtvacRpjSOsKGlGwGzKlf8NppYiNM0EMRf8rAlQbto1djahWyjDpEoUQMAnjzdhq6Ugw56nqJKS/089Ucois4Yu16x9D2jwEgTqd6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnZOAr51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMtgAdWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnZOAr51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMtgAdWu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J1oaT1898295
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sk4Dj5hdlb9kf/ULIiGgAP
	bRPnBpzNiWF4D+Yyr9emw=; b=lnZOAr51yUm1cQjT4WYDc2WKYzIacZ7KN8O4DE
	/xgo5MqznKz8+LMyIJhhLOkJTuUbvl1nMdGnsBiE1vp5y6YDA/aJuC9mWahGFUlA
	/DyuhTMQLUH5s2ZV8pTJ1XAf0oI660U+I4SI/fFFOQF2snmI2+OILg14BDwFkDAQ
	A/dFPf+QEDPeZTBy9E2+aq81CtFDLSITmIUPuJanH5oSPuxVDoXK9SyFQn4IsLs5
	da7ii88X02gs67Kz4A2R+S86FNmNuCA92x1tz7wWpIs63MliXk+t/es2Zx2ZH/SM
	7xebzM0OW5n1hpi98aCYApW5bOoFhx5nJjQbqJouzgrkY8Yw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388kmmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:37:55 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c21dbc9c1so3057670c88.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776652675; x=1777257475; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk4Dj5hdlb9kf/ULIiGgAPbRPnBpzNiWF4D+Yyr9emw=;
        b=fMtgAdWunbS+AW83PxX5LhLCtHy6VqneUdkOa0GpSqlwPVGE+Wz2XQ0Ms89KiG1jZI
         xkgSY7gnwKb+gZMhGAYEW3xKCVzBlsQ6A/65ljtAivCC0sWevvYE0kysG1BeTepgxAW+
         4UgqBJRg9bdRWKEOyGa4JiAOG4U8OCEbQtG/RAWcItNwe7m4OtLe6s1lH0uV3audEG5+
         ra97y73QmldPart6tGRTu/K71ZexjjcCT3N+imYByXfklEDP/PuzPs180AwB2sE9CESy
         WLOxOISGmFslD4MzQyP0LQTPQHGWg6wkWJkc24/WSB9l3GqQyVZiCxCivj+xfiVINICc
         Ogag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776652675; x=1777257475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk4Dj5hdlb9kf/ULIiGgAPbRPnBpzNiWF4D+Yyr9emw=;
        b=oAnrm8wOvvLtfpc5mclqUCW1Br3GVl0yBDVHfvAE2S3vaWcGCygqMwWoQKUpRofyqj
         feuTEptgFCifPnE+VcOyZJ/PDV9h/XeeL+X9VRXbOW2cPeoge5klP0MoP4GmRTK5yO3z
         KMi3TYxMgbbrPpa9MtwV5FbN0dNbQfO/1Jm5KXndmkAZPj9Be4wJWfMsPXoYeikMTe/e
         ASgzakiv+TaQITiaJJ6sJlyYU+fA3Jo0ZBr3NgZ8JzhS5NmoP9oRvnkoIxP++Dcdp/uM
         YsIyPXF7T+oGQCF+ucvRNz36lzyLyLF5pAW9O4ZVdaMLdrpL2exRkLmQ/BuLOiRyhMuQ
         ZL3w==
X-Forwarded-Encrypted: i=1; AFNElJ9RLokaCsGL8lJGSRpITWzvjpjPvJ2ymUQCF0ctKVfSloGQl6cmV664EpSIAhlY0v2GDlQP+YL61KeL@vger.kernel.org
X-Gm-Message-State: AOJu0YwHvDpVDONaFl+I5K8ay1QVWGAqUkQN5ogzu1CUgTCEfmGc8YOd
	t4ZLD8uNp4LiMtPOmaPPI4dBkuD8hmN7Gph/2t/WtgSXeZmBcPib7fYcgI6Nw88E3DunA01ilm4
	PzUUjYPaMEGM14tsBSDZY8K3PbKi59Nkw3LJ9eP4KPLXkGffymJojQikN9/8lyXDj
X-Gm-Gg: AeBDiet/ZPMTTvV3px44QTn/NqKfuq5JXZrHaPizGm52DbeCH2xTYATHSRi1lblkHO5
	Q1pxabBLfQQ9+i8czXt3KZ0a50E/48velFY6AnOgb+EzikBKxmrJc85hOlVI5Jnfm94fm8jD3Wc
	Rf7VXQSTsthkbYtMJUrE6kDZQlueI16D8PqRRUvni/mxcOiR66PrvEpwdDsRkMdAvXKIAUXG0Hm
	o0rZQXLYxmDBXpKq6EJ/Wedyj9vV/toaMwbSpJqt3DIwU7d4PdbbNb+XtmI/tWOWQFTNz9QB403
	vaiDmhPuTG+QpipZdHPnwGLCAarscxiEycI27uDYpCKW8OC1PJ2CnhhUSoI+o9//LmoKwsjVcvj
	QOzg8LhFZoxExXY2HTFojdhyvLHT//69N1ptqQldtFXzdceymeOmx9jJWJdBjrfDICfDClE2bY6
	5h/p/B8BZq
X-Received: by 2002:a05:7301:9f12:b0:2e1:e3e6:2910 with SMTP id 5a478bee46e88-2e46577039dmr6929835eec.9.1776652674878;
        Sun, 19 Apr 2026 19:37:54 -0700 (PDT)
X-Received: by 2002:a05:7301:9f12:b0:2e1:e3e6:2910 with SMTP id 5a478bee46e88-2e46577039dmr6929814eec.9.1776652674251;
        Sun, 19 Apr 2026 19:37:54 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm12000421eec.25.2026.04.19.19.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:37:53 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 19:37:37 -0700
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi
 compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHCR5WkC/yXMTQqDMBBA4avIrDsQB6naq0gXMRl1tI2S+FMQ7
 26qy2/x3g6BvXCAV7KD51WCjC4ifSRgOu1aRrHRQIqeKlMFdnoTnL5isP2IG5BKWxOVOrW5gVh
 Nnhv5XcfqfTssdc9m/m/gOE5hZeyYcwAAAA==
X-Change-ID: 20260408-hawi-pmic-glink-29db229a1d7c
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776652673; l=1238;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=edi7ASQs4faQY0RBHHFXV7sYsMZdNk9LRoZpbng+BQA=;
 b=aye1Sft7hdu1VtYWT1egNkDDC7uQBo9LBEun9XqzAG2KVi605Zt2ehbdhius39pvsxRmVq5sj
 qISz3AwXjqdDZq4Nq4qcRLQUkLwRxUxFPo4KwUxht7F8M+AGs7BuX0F
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e59183 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vdZi5cMLbBxFiwGQSQwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Elm5IIlqs-QflPw6F-mcNeZ4MEWHfpHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMyBTYWx0ZWRfX4ckv7OexCocN
 tdlgdKItSl5+cftZ0CPpO45tGx8Ipoa4Y7Y0OAg9FDTKICNv29poFjU+RvXwefSnQYjwd+SCMKi
 VIAgIsFGYkR9wWTbT8qXTKLJ8JPR5N4f8wuSEQbZAngmo8ehrX6JHD1fMamAs//HQ+GVCb7B3sd
 o/130Wg9nxHOhjIRNd2McraOmVbuoHW17Ygzfz4SsNoj+fK+otXEHOmhpn9lsvExATArMmP+3Dv
 HKbsYVwWHG2rY16REVq6V9B/jh14r/pv/GmcIyxH1wnIiGVrEVqUTXkLYHuCCWp9h2oKTOkjjTI
 cE6lAjaFXKGV2yp9ScZJqpshEFj5GHMSL6LVAgKNAfKxZ2fVcd+7SPa+FVZQa56RY3T43tfEQQv
 MZtNhRxsNajOfnZ11vSRs5shxnKiA2YyuXDrB+M8B27ttSpGA6pEldW82LoO/kyIS/dW7brJ978
 VUXFZadGlGvQEZvn5jA==
X-Proofpoint-ORIG-GUID: Elm5IIlqs-QflPw6F-mcNeZ4MEWHfpHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200023

Hawi is a mobile platform that is compatible with Kaanapali platform
with respect to pmic-glink support. Add the Hawi compatible string
with Kaanapali as a fallback.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..2ba96d26126b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -32,6 +32,11 @@ properties:
               - qcom,sm8450-pmic-glink
               - qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,hawi-pmic-glink
+          - const: qcom,kaanapali-pmic-glink
+          - const: qcom,pmic-glink
       - items:
           - enum:
               - qcom,sm7325-pmic-glink

---
base-commit: 33b04b06d215c7381f76b70aff351f649ccce202
change-id: 20260408-hawi-pmic-glink-29db229a1d7c

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

