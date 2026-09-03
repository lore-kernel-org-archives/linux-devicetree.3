Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA82F4B1B3A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444463; cv=none; b=Sk7mvZbE33I/s4mULccsHq8udXWg7sNEXjCgx76W+ZweA7cD2GP5N6Ce7rvVHehEjgUgOaUdCM48JmClJMeMWoWPNYW1/tM5sBpeheEyES04YaHqAb1DKHpJfCRBmL0hJyF6LENb0XjeFswRj6iI01xwKGYmUY1JNCUmeckc1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444463; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZA8OK5lCKJ+GCnYsww5G7Zc1Z+X2908fNwvSfNrwiba2IuiX3EBTWaozYuEjOTuXpMSCPO52rOv3nJKAYqpZVTXriLPGv9y4zu4CjJ0RE0Pb71d8Khgr9A8yaCUgHMhGZCe3JepuZvAJjM2eb0hb5g2P4C0Z8KPDiynC+/mhUOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbLIUqbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gui5l7tu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbLIUqbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gui5l7tu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DB72N3580107
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 14:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=pbLIUqbvgz5NbLlACLX+l6oJMQX
	xozqop+HFdynlBsXIdRrO98BvaW0c68a9NSSLjdAVBcViv3oUNijTzR89oRStS4/
	Vjm7k7PzYaF1F1bQgx1PWqiaik/f8N6XFuLPP7g7OqqenhPYIdsXXLx7FAQWzuyu
	HDyLDfb0gQfFJ1Pc2zlqiBZtSBKYbQcMeExnAObIuf/2LUmm/A7U1grqXn0XJv62
	evPkUME6FTXBFq7PUl02LjwKxLnC3Kt14pyRi58OtxbwOlXmRgTSeo4ZtO2dSzDS
	NxGfqvwGmKl75j80BZyi46yi38ecS/OsxyNXM/ZpYSw/OIZRAssjDZKgSGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d119sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 14:07:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso55938315ad.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788444450; x=1789049250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=gui5l7tuJ7t8qLgmMC73E4apbZJ/KHttaMe6gndcUFlYsinlPuxcYTd3KdYjfX81Sz
         pUnAEdDOpQjC3tBzrCtVOLAdDJPQtYth2am3Ij/gty5/JB4a/xyuDWfc/KOUjAdlUmNi
         2wbMVP6BO2FRKdd0R/EEjN3FAELv70xsd9eGZILh40LS1NdZWTWBRQIQGydHvrr2JRKt
         prZiSLc4FRwuWnI9GW3KQPFmQU9SQF0FCEcuvpmutTYbGFlOCDkFa0bu3fR9loOSQfK3
         t2z0j1pvgEdaYQNJFsqwxC/A+CsfK82XOCHiCSsFKybE+V5YHwAQ+YOtOVXFylz91Y5D
         UtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444450; x=1789049250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=h45dCmGCOHSlEbVi2Uc2eN2fOXF+7SviWl2Tk3y6Iq13fza+feGaGmqx7y+xKPZgzf
         8suN7TqgnormQEz3mGgdYz8gP+txDsraD0mUjHO8RlRkewvBD442PL7gNlseqhG0dfQQ
         nzf9t9BOpAsBMA2F/YGOvFHOu9CF1oAK0OL0+EgvyBFdlOfAZFB9WpYFIhj6pIH72PqR
         wxxNjRmoZ/r/XA92kjNgScU/mTQ3lnMtKuVRsLWze9coWnL7Wp3NKK8n98t9bTgUhQj2
         /jSe1qcJLnGq7FZim4aoiMUeQsk2DVjtda5ZTV5wzNgHj8mz2UGS+4kkJf6E3uQFxwVN
         WEDg==
X-Forwarded-Encrypted: i=1; AKwUvBx2ccPO16dqguuOt6U4tJj5B+kCmxTvTZZsx9ReZcKycR4a5dRhpbVJWOL9ZDzMWOgcRpcILHT1kSw4@vger.kernel.org
X-Gm-Message-State: AFuF++nw1XY5ODIzjnpPN3SzVxLLYbI8pBsdeXfgBHnU0lXBjtKACApY
	KcN225phdkXSCK9lVYk13KL4GbjvJrqxUCHmaWumBqITht79XGiuWgXIsEr8HyvQDvEDLL9ZGxo
	/G2kUDCtSjlpWk1ppdug8CG7j7ld9O8bGsjh0DMrl8k7LBdHabllifhgBMwM7dX/x
X-Gm-Gg: AYBFou1n85/FmkVKdOgSbZhcI5LPtygmhO1FmRjr+VXaw5Dpfsf6wIQ0U4dKIY3BYdh
	oYIXP6xNohEhles23EzgVCGqwkk+8zDy0Cu+Tic6EF1b/992RLQX7mmy1agPFHfIctGJ3xZ71Dv
	Q6pT9olVq6slFoSD/I7vLJC31mc+dgjOb2+70Z7867Q6uXdXit23kMmQbmOGcMSTcr9ZcKxeEKW
	6FB3KTjE95+juF4EJdhlopTSLAJZU0EkCgvqlwFBcDclEv7sl25TKzpG7TJ8Kw8CJdYoXPccnMH
	M5Tmfp/iM3dNJ8issAfL0B7EH2UCJDE7FBRV0/4euORTywXbgoMCHt9CxnVkNpqr9sg1gIbIsYt
	VkQgKrjxkbTb6D2eJEwF87D9aS4vm/fHGFH+0j/Ic2aFPPwruhp5hZdxI3H0h
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr21894634a91.16.1788444449672;
        Thu, 03 Sep 2026 07:07:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr21894373a91.16.1788444448818;
        Thu, 03 Sep 2026 07:07:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm6809098c88.10.2026.09.03.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:07:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v14 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Thu,  3 Sep 2026 22:06:15 +0800
Message-ID: <20260903140617.441111-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
References: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX9t/GCTu+7F5E
 WgCEoHbbhKs5/1pgBqGYMdbFJdnjzbYqHXGzA+avi5ZvXPhPd4ExsaxqSKVZ1J9DmDcNYaE4GO6
 UaZgUaekuMOlA/dk25a8e7I3Nn/AU8ZXEnQ7xN3kCS0EJwpzw7abwdaOHFNB0+ZHUkzLTeSm3sS
 /lNM9DiZ5oyL2dw3HjGSGOvtmeeEUiMCOPS1y0TpTCnAqKZoxiYlLkG6zWlzUrRdF0frQBEnIuO
 8JJEGDdtqAJb64XcBkjzcq9auzjwV4+ocbJrrJ2HzNvo23zzpfidfR4ijk1T2WZnnzMYuOMDgsh
 gSY5bWappJXsXPIn2k63aoc0TpkHVfYhNuMOyIM9aPcemoBoLhkDhM69nduqh1pgv+DQ3rDkcIB
 0g3K3GyFkg/gfBUU3L6hlzjGqMrrhsMvsXwxZCN/tmPTWijujoaP5mdvAnONMjSAjuybd2gqE4d
 R3tCUXXAoUJQXqZOnzA==
X-Proofpoint-ORIG-GUID: XlvRDE2N_14GCI4ISF7tG6MIO-m2p6GU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfXz80Z4h7gdXND
 oKTIXu4nW/BawEvGYv1k2TkKWiLBI+0Fggr4k+d2kopVh4PRJr69/aX7d7NTIGZOvP4MjWNotsX
 HysCL2jyXrLVOPkhR6ZYMmOnQ+lTYXs=
X-Proofpoint-GUID: XlvRDE2N_14GCI4ISF7tG6MIO-m2p6GU
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a997f22 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030123

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

