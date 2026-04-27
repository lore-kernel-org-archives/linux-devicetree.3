Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DE2253F13
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253264; cv=none; b=RZ5kEOUlM5k91eXZpP0BDtIeG1oLkPPLGJ8eFQxuWThy3OY0K8OXHt208W8gYfHd+BDMhRiuI98oUDrfeX/TXhD1Ch/grbWVNwMncjR6EvOCfpckmZhZdBLJBZxIbGLo4Tg21H6JsIfwWwgDZ/BumHfibuawjEMmuBEuf1G3ve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253264; c=relaxed/simple;
	bh=u1m+eBlOjBKApUV557TZ7F+w5Y0+w0HLy7J7OuOZqxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdneanzBKNgYFFYrccTd9vTnvh6mKWk9FQEG1tqbXkpeCME+oZgc/nf/RVt89JVZ811hjcBodORiqecMIFQm5OGAe3oLrB9uQcMMwBdYZ1fHUlQIFIPoI7e77EPJ60q5XR2HSechHyPpxeERRFuiK94Mx+1C8mEbPFFhK1BBLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQqL/5PT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ck4Psd3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQqL/5PT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ck4Psd3T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R19ds91188515
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nq0TDOcXpxhAAnClfplnWd2fgSnOAj++nN4
	/kbBkMow=; b=SQqL/5PTl9U8rSW1p8bVYmNTLOJqRbtoFYhcY4Ps7LeSd8Ve+vx
	+UthAf4XQXccmXSoQMO6uGu3JpSaUHDFfWBhSfwT0XR3fJqwrN0cHobD9YNx4dRv
	kMfbpjEhAMmD1XLAYWPYS2zqkCN3qEDdHvZ/yjo7CKlefjAYqCgBFVa3P2qf/cgF
	CNitUuYjphKWD1G+l4itiLXCxpluOpsuYkIz0QvhXwa7m/rxp0s/qZXhW/5wl/1W
	7QmoyP8fyy47OvjWDCdwPHR6rtqul3REnq6XxEftXJcIBpx2602b+O7PrziUhROD
	cYto91+mqfotNZuWBu6hoF3UnypwMxyYz6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw3wr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:27:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2cc75e79b97so26889393eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253261; x=1777858061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nq0TDOcXpxhAAnClfplnWd2fgSnOAj++nN4/kbBkMow=;
        b=ck4Psd3T/0ClbMF6DBRvc5cZUNQfBhRtdL72T4d6w6G7VlhoVExV+aF5lwsV3+23Vd
         GhanXzMD6Lw96D44jvG+wWBJmpCGdtk7aTroGcNVCvZQEHy+SMjK7BeEoV0O6uzlnUtE
         BzmCuDZZT5IzL0r6iYRqmEAdXT2qpTLF9MpH/DrSVvYNF5FfuGlLbfWxShdQFPD7Ld6+
         2EyvItkTQKGmjba0Mg+1f7VI41mQHXI8UsZMvagsmKdGeJBTiVH89lkhnNivSyuzGRpU
         IqUVFGJXw0F5PutcUNG3sbAxgSuQDdwuaVVixj8T9C2Dncw6Xf5BC2P0j5dmp1ZlQ4C+
         +J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253261; x=1777858061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq0TDOcXpxhAAnClfplnWd2fgSnOAj++nN4/kbBkMow=;
        b=hvjH/YZwxMRs1Wl7qWXE+7894Xtz1D1Eb3wj+dPJNoy9EKblONeBQGZucP4EBoeaN7
         f1SmxZjI7RDt9mBzspUR0kMcgxa8MW5DalhGxQfEguLeAgSy5wwj8XvsvZ1gCW7n3ST5
         QaKVkUy2HrXWwq/bnEtKNx9bvHZ45M5Z1kXW7GPpmZZfWvW2zOSNhoOr3KvEGrNyhoSU
         3iQWj+qKIBB/p3WFfdrCKu1udTKM3Y/m/YujXJLoiKm5tg5FKsWqa4gsqH//3SjR9Cp+
         Ze338xZwW/QvrknM7LrskB5a1L51rai8odeUdbnrOSUN5nPNP5h5fehsQySePU/IhYNm
         VaEA==
X-Forwarded-Encrypted: i=1; AFNElJ9WXVmLe9/MeInPLfjTx19MDcWpxTIDouNWsuDmZSoUW69Vh/DNsWUXHwGjBQD+rynR0Z1Ak5pnOLGr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sDzjgnnBaD8DwagxjhSaa6EmlpKX07//huzoh/H/hcZYnjfW
	umkAbONaMUykAUbTbElnAa2y+WE59zQHynCLJc+TV+PFJqi3KeFknPmu536rJmYKdZ13j7mVMBX
	fqih8c5W1iEgxguvVVidfiGD54xkjCKboAZdDfYFGt7zkSPwS86Ufr0MueW8wVz2w
X-Gm-Gg: AeBDies4Z5LrqKXhvCQcivxp4NgFZyy5L3A1bqytjpwCBOqRb/oAomYhMm9t1O/lqtw
	c435tb68EepnqScAKeibRVoD9i6UhP7nvRyvtk1d2zhLEmf9dDXt1WV0FwlYbZeU2TfbaOSSw4d
	nkWK7062a8sfO9BDmhNhXZml62WgsLAuRj2NXmkbtAgZ3Ox8VSqgUJ3eYWRrfBWTZduDWzjH1h7
	PsvsXNE3UWa8oDugTZbMBBohf60q49icxbv2XKbQ+Na/utjyB/18yxvvrtWeS+srPNe2YKJljGa
	I7ZnceOg12T/F1mnSYX7NXSdYnWuq2HfrxqqQVE8cBuAyuFG7viLMNIseK4V1vf3KglrzzCn952
	klwoFvhnH7NOTW8NybOAC2NtkT5/JdBT2379o2A6tt+BjxxjDe+5/dOBbYTOfGGN0n0tsVHzXQp
	d1CllTGsnkDAn1B2JL
X-Received: by 2002:a05:7300:748a:b0:2c4:ec89:bd3 with SMTP id 5a478bee46e88-2e479419855mr24934176eec.24.1777253261465;
        Sun, 26 Apr 2026 18:27:41 -0700 (PDT)
X-Received: by 2002:a05:7300:748a:b0:2c4:ec89:bd3 with SMTP id 5a478bee46e88-2e479419855mr24934154eec.24.1777253260949;
        Sun, 26 Apr 2026 18:27:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm41105411eec.2.2026.04.26.18.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:27:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
Date: Mon, 27 Apr 2026 09:27:32 +0800
Message-ID: <20260427012732.231611-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMyBTYWx0ZWRfX4gugwCNKkANX
 o36n8Tgj9jmvqHzzkqtxYpXCedbM2uT+7SRTS+KY6TGqCtqSYWX1q2oEP3+mRWA00TRECaWEYKD
 bHK1u1QUYKOz27yWFUbuceXOH7EoXVoZxFCKlfU4DTpDN8NxdVJnucEdjsSUG5PBgK2qYdzPmBj
 x5uhHuwPT8zLloxlP2c9zhI/IuRjL7lTa2t6ElmpZIusrft2vN7gq7tY5meq211cCUNcvscnuEo
 C7X39glEEa6wNjQfNDDNYHBUekk1GM3ZDciq4GzBZWC1HfXLu4iAKjwSyC8NMCEBY5m10GmrHjW
 pvd9+6ywY+mLBWXcjPnXBAD0EHgctllQ4YJYiRTiWiReHukTfKRsGa76eWS2a9KC/mVmAzmOGJQ
 iCAcLUMfN2lNN8aRQuasRR3gh/S1NADaExbB2uuw5C9IG/53RRzlbxI5bx8fn0lvMgHDTImVX6Q
 q9Px0PWUZ4NHJqRnzWg==
X-Proofpoint-ORIG-GUID: 86pqFwGBl0FMTaPFRFW18V_A-_GxgXkP
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eebb8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-P_PvXqPkIm6cR4a8nYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 86pqFwGBl0FMTaPFRFW18V_A-_GxgXkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270013

Document QMP UFS PHY on Qualcomm Nord SoC which is compatible with
'qcom,sm8650-qmp-ufs-phy'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Add Nord compatible to existing qcom,sm8650-qmp-ufs-phy item instead
   of duplicating (Thanks Krzysztof!)
 - Link to v1: https://lore.kernel.org/all/20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b2c5c9a375a3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-qmp-ufs-phy
+              - qcom,nord-qmp-ufs-phy
           - const: qcom,sm8650-qmp-ufs-phy
       - items:
           - enum:
-- 
2.43.0

