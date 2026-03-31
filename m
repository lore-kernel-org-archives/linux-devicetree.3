Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362E38F92D
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982705; cv=none; b=s6okl2MVzROuzyUk9CbsRFpk/azrilDXtLS3GDmuU1+agQf626+o5PQEFRQcf65IEbL7lRUPk/8xOsm07/CfUCMPVW9p/oSInuU00Q4N2niWTXkgQh5YeAL7Uouk23hikbMz0t69ma8E6DwYPpxb6Mx92KhXtBJc7jP4Z/nOJDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982705; c=relaxed/simple;
	bh=7/65ePqG4yopQHr94k6g8n5+V5JBH1uc85cIWa4Qvp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3olBlpeDkcVoqJVbRTveXNzoufDXTRtaCjdI2cNh3VSlpLqhMf8RNiQMKfKqMAY2vuafHucGyrfYnPDTRFtj1YVCX3B4wQbft5W/HxoiAJB2LPaIswiGcE5n/bnCmlssQuJkZvc5w35wOomQdA2BN/D0QkdfS4DFRZGTUGzhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGAKWD/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvZ3LWQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGAKWD/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvZ3LWQY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdh3v3926858
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ctnIgyI6jogPY+2raF43nSJTPOcHOKf/vME6E39VLU=; b=CGAKWD/Pp1Vf04FB
	PPaW24aOvCgt3zOFzecw02ZkjWXgzW90VjcFgyiy3Z1yL1jp2abfjeRzi4DGBRDr
	E4qnIf5EDh8jxidxq0yqa56ZTaF8S0DQs/Z2oEq/rh//JAiDCmQnwDOhJanhSQ42
	Jhj+hf+aK3iiBvpu6VCnTA+6pYdnHuMfDJeg98OlfFzdKAMvo+0ehwlaqwyrtt5p
	m9Imuv4GNqmUB0OtLDwaO5ysMQ7WrDfSkv/NhqgMsriRgXBJm72eRykzZdgiS/Ff
	vlvqQBm/H/O/Q8JoQEtfD7DmSxu7sRi1bKraw58LXDBfy8BNpezCLglTI1bTELPf
	pFlzXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b932q4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:45:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ab344e3164so16678405ad.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982702; x=1775587502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ctnIgyI6jogPY+2raF43nSJTPOcHOKf/vME6E39VLU=;
        b=GvZ3LWQYLsTW495lbP0Myd+NFtr3hxnlMRkP1q1MhyCskOLbgu8hSxQI4LCvpOuyYo
         6yMfOJggMZdgdzPH3HboqQyu+FB3dzmf4zzW9eZHsRFDNFnXTDsGs3ne71a5rqr6xM6r
         8mpHHU82tQtJGwYk2ru25IOFB4IPjLuPTRqSyBevT7Fsr30f2fF8LH64M4Wc6W49Goc+
         aWqgcxZE4MC4aDd3ZFAkQgd/cGY0tzsdJ53RTwhoY96Fjnrhv/eo2tcjYJClFoeUSbYe
         U/MdUrnzQov5Qk7aQGMk/NV1oSWhjlPrJJE/0pOLm7nSWPKDu3Ijt0G4OnjB/M/f5/+i
         jQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982702; x=1775587502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ctnIgyI6jogPY+2raF43nSJTPOcHOKf/vME6E39VLU=;
        b=ibh2WTlS/81scVkesYz8tx0vqBeYFi0fBWRBSC7NDyTBSFWUywiy2GDAmkStr8LXSQ
         KfGzXnJPUDqK+lh/HhOU1X5hBdg4B3VOC9+4xujEizDzgXUFTVyRK2sM3rGpDCKEV5uC
         jwjCY2b1RPDfNlw38xADOos/Mt92ZZ59PbinqcQ/INNxzK8d6ydxdo4TwLiRiQIqFCzI
         Lkm5106QRFKQNUdQn6JZTAuzlATW7GaiL1sRCSDhM2tmxdu8EnS01MYzc7njpQ3xuYu1
         5jbNCXvzvxDDwxr0mDII4oO7bFK58A3VnHSr3bCHOpGTNfoRy0rRBNELuXc7O8VjcQg1
         iD4w==
X-Forwarded-Encrypted: i=1; AJvYcCVA0tkT3O2OLJV/tunw1xhL4MFA1ZQ9Egps8RSy8u/tRFWhxWC1FwnQZEPLZr4lax+LU3uW8jv+T3RE@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8bbnk6v9vkdnhCHVumXr3e/XBvAd1J0bkLpySQZo7JVtKDrb
	cGrkO5Ca7G1md8LfjrnlENjyo65Enw2LrXnzePuh/Si4nZ6ptS40UKGkm86E5qIRXVrMjE/adoE
	+oQrgHYUarK2CJoLdOxgDciUsDwy61f0YyCQrvCgeSw6rni1qdR/ucDkSPL5qHI+bQgCcxsle
X-Gm-Gg: ATEYQzxnfxzq3PBcCW85oIsKL1jP0hI36/ip6Wniaj3B4i0BukBlJKMt0lVpOUSAdvw
	m/KFJjgDQGXCXrOyas5pUfHsRIqefVP3IA3AO2IYBbNnJJtrA3SlNAPlxaxhtDL/3DQ7ZyakD4i
	rONGaAPKh4Vs6svlcQKOAfZ1uoNOZB0ZwKzrbRIqNgyTHehXODu07he/o7lFUsN/QHZO6L/EDNm
	N5GJHHjf3cLKD55b+lKIXf6DlVixJrp5M4HUhKY9w92fyCJlhm36cQmYXSftaQJgHeTADMhTTCE
	JPAowXyysYkzsUTXoAI9RvIh6qwfInIGOA9bUP2+VA02HOdaS/qNPWg8IcY0ODKuiSPAAU1/JGR
	Q0e30Tw+LIyNLIx/fdJsshZsL68b/0DVOq0VWXRpw43OUOgRVAYuw
X-Received: by 2002:a17:902:cec8:b0:2b0:c355:7d56 with SMTP id d9443c01a7336-2b269d42201mr1479925ad.8.1774982702265;
        Tue, 31 Mar 2026 11:45:02 -0700 (PDT)
X-Received: by 2002:a17:902:cec8:b0:2b0:c355:7d56 with SMTP id d9443c01a7336-2b269d42201mr1479775ad.8.1774982701751;
        Tue, 31 Mar 2026 11:45:01 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427af930sm153284635ad.70.2026.03.31.11.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:45:01 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 00:14:42 +0530
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
In-Reply-To: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>, netdev@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774982693; l=778;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=7/65ePqG4yopQHr94k6g8n5+V5JBH1uc85cIWa4Qvp0=;
 b=B8M6P8m+WrkDYks5hvvAEmHhrEiZmQQsNp6TqbsXUVmyPktPEmcjWqB7fMvcUGGZ4FaFLd3Ud
 qagim8WyvJPAy9aAnN8n1154TdD8fUcCYBFc9kCAR7vk2s+wnNmY/7v
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3OSBTYWx0ZWRfX5BM6B4VFTSxf
 uSj/UJzA9qkIX9FTMjT+ovSQItm+/3fL6mCjMR6BKbTtq4x4kziKgDAYXMuZSzzPt4AfBzrgqk+
 5XUF3IGReRJ4l6xKsYsHUIZw+bhnRm1uc+Yb7LE/gy4vtNuNrXnNq4lEjWSOhwvTigGPdVJXWf8
 b1m5rLERGsdIg61VAqE0Q8PGZHZwYfrzE/3I6/qPokZQmhXmcFnGK34VdkHfBApz59UahsVYEFU
 o0dCD7tIKAtSzBOr2pkcJqQaS32LKiLX4WNQnba+7RGU70VqwYfjJOktkDv7rtEUxt3iF0UHIFc
 b2B40/6ELsytzECNTWxBO2Fqx5cf+/PlX8kXRis+dqId4/iqi8d8Ql9r0a+GtJUHaibfeF1GYEf
 Jy93mQ0GT7j2SVOuh9REqdyroxGRy2Bke9nVcTMdBmNJkZKwUbDiEyrnxexXP9Flq56PvdmTfwq
 zedWNn2mEp9jG3hvPeQ==
X-Proofpoint-ORIG-GUID: QqqzX-YnqReY6vXHLrkPW-diz1uqtAET
X-Proofpoint-GUID: QqqzX-YnqReY6vXHLrkPW-diz1uqtAET
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc162f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9DcQwTZnXUZXOflEe_wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310179

Introduce bindings for the monaco-evk-ac IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..c76365a89687 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
           - enum:
               - arduino,monza
               - qcom,monaco-evk
+              - qcom,monaco-evk-ac
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
 

-- 
2.34.1

