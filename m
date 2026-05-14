Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFAD3A7825
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741155; cv=none; b=ClNRPUw/k94BjHqxn7nNCO1LmaTjFpO9ksDxWKtsUQfLT66U0hD5maY/+tYGgIHCZvx9G3YzkEEu7mqwtf8s2AALCUDk0AH/xwYr4v2LYak9FFX5My1nvNwLYAnV1mSCWlsJ7Ao8CnteW/34BEYhDLS7h4uEUU2pw3MW/wl2H6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741155; c=relaxed/simple;
	bh=3IVpNrCnL5iyLexlh1ItaHWNOFiQFPAlQFdXWVl4ay8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/82rJt8zkwYW5ldwHyhvRUmx6igrq41aB/dW1cfxxQTHF7W1Z0dsEh999IEvXKMNDt3f6YzEtOuuuKLawZw19aHoh2fs0s2UxtI/R1eEyKCJelpob96DYDjL8GQELXAS9YqbyoE15rYQuHDSz2HSZLxpa5e1uAmanRGszvKgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI83Zwyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6jVW5TZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI83Zwyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6jVW5TZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E1qYLg1242793
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oG2Gr7C3LtHCj7Uu1Su6emNGQ/dJWK61lrcIhPPutY=; b=TI83ZwywBsZcbWcN
	SA+mCluD0eNd6+MkU+zZbUFKNbFGem9+vyzHJqOgBagxBrpqwtnT6ZCy6mrQ8szM
	Tu7lRF32rxA/XkNyP5744v8X9cDhhwkzKAlDWiEwB/Q9guxRFqkLkIZtRh0tpLfP
	e9VNzJNEYZ/n1dxTONcICAdLe4AAK/cNr0RvxmTfM2I2PMtmX2U+O7cAWCd7odFk
	CTmxPxGIMDjsl25ABiVpFIXbu+sz/F9PKr8lThORgExtBzdBWY4tCZclcHC/Lh7e
	EWk8n2cMqOnrvoCLI9ydVCxCJrMQno1QNSj8pzlKJqMuIM5G/4U+67lIZNoFRWgu
	F+ePTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4ttth8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so89897605ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741152; x=1779345952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oG2Gr7C3LtHCj7Uu1Su6emNGQ/dJWK61lrcIhPPutY=;
        b=a6jVW5TZK42+YzQrQkIlvGdVLt/4H4IcK+8r0AmYoIopghBvBCzVLPUlEjrSDyNTkS
         KL5mbgb1p1uDb9kyge0qg9pqQx2cqZeNXJCX84gRkyxxJCECmPfpYmJYHbD9/PgQ1hyR
         aw7s04Kyy059i06EHdJRBt0/PLa2PAwPuuYj2RdICcQ/b/VR3ZypdQtRytqZXunRnRmQ
         MiZsJ/YE/e0VWfnsComqrRXQ1lz6GSyPoZ2cVHyS93TOU7YzVuWTQRRrf1ezgFoBa7LQ
         Y4OwHNzItKu61xjogmEhlH0laUnlvSEKrPxJemQVrUYQK6it7G1wcnbPGBek/XLNWoiO
         +Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741152; x=1779345952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6oG2Gr7C3LtHCj7Uu1Su6emNGQ/dJWK61lrcIhPPutY=;
        b=qUMOPTNi6SM0kLAlx18BwLhixhFwpjJh+At+Gvw/TDZCS4nmihSvScWSVWzMITlmuf
         lPLVsU7OTxHZ3aYPEbsngY/3uVI9aqceDQlcna8EiZcvtTiLMOXYhKxyMJaXstiC8diy
         PwAg8ksaX4lQSnc7HIYwMai9nIa8U43RFFV+sOaX/CtUPCuotXkL/sRrgkUbgl8KTFJc
         SdroVOzh2KQRfPGtbHhhzWIxgPrzQ4QavOUvWf3vB9w83BLYsBqIxfRhNAbYbrHovTVM
         mv7NS0rO5CO8DTF/olwQidiGzofLxO80X829KalusnFb8gsE9dR5SsYuIZYnXDNLLphN
         3mtg==
X-Forwarded-Encrypted: i=1; AFNElJ/FE+mW8W1fThlLkOBtcZQQxaVXYJOR2HQyYa6zr+cWFD3xdWfDKxR5zGnKR+0PBkgNsR7YYjR2Wns3@vger.kernel.org
X-Gm-Message-State: AOJu0YxLZ98YW+D8bfjuugKO0zebMdwc2tGA5GhnGduYQxfq8jbb1WdF
	3AzAz+wfUdDs72VRRjBwG7UWtTKjBjIDUzsH61Y6cfSKo8z9JF07zo16Dt3ElUDjA7RUr0zARz5
	id21XqZRkI4PpZpdL+IikCMU6cHkV60+ziJ8p6tp+4mC2P7yHJYF3Cpdg7DMAcaJ2
X-Gm-Gg: Acq92OF3C0LKlZ+SMavfOJnCwjLxsgDp/5ixXA7nMEDJjQXm3iDhHdlAmVnoHO7usPz
	La2BM/lRDQeEs0QrEJAg6BtL6+0PTrOavUOZwGT8oPTPdjzeOPeb+gboPf2Z4WCGgJaYoDorGxz
	p2Wr8DfSgCy54EWhed4CvUZEp/ozTyiVzCOv8887QZ7/FcKNOQotOkUkuxdRAyuN/oOKTVB57op
	IuC5NZowN70Oxiu1Ey0r5PzdOQwPBg4hK7BTdM6AiQtIyHGItGAUmOKkUJlOa0Yr0RNUeMbBpXI
	zkwtrLe14QbhKxszPMTbFQCl8l/c1w+szEWMiL2Ej9mmCbyB9SMdDIxOTxbx5TI2dTj4R2O20Nh
	4YW1lw0Q8ByUrrbV9t69GtZaitytyFc8dp8p0QODG9BGZj3tqnmrcrnT/USuNkdJM1zufTQWZg6
	FSjW73ckpx0GVUIskN9KAo0DoUpUTt55Tmo6E6K2Y4mEHwgfonWiw=
X-Received: by 2002:a17:902:cf01:b0:2ba:792a:18ac with SMTP id d9443c01a7336-2bd52b815b1mr23287065ad.30.1778741152434;
        Wed, 13 May 2026 23:45:52 -0700 (PDT)
X-Received: by 2002:a17:902:cf01:b0:2ba:792a:18ac with SMTP id d9443c01a7336-2bd52b815b1mr23286715ad.30.1778741151975;
        Wed, 13 May 2026 23:45:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm13387685ad.49.2026.05.13.23.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:45:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:15:31 +0530
Subject: [PATCH 1/2] spi: dt-bindings: spi-qpic-snand: Add ipq5210
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-ipq5210-nand-v1-1-cbdd7492e826@oss.qualcomm.com>
References: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
In-Reply-To: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a056fa1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sDV5ar4kFRZnHXHNo84A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfX8/om064QcPWm
 3tqMq7HnQxkwIGhk6gJLPXpRZJGNyp0mhEn8GsLDCnITz7pO20yHN9DxlzJs72QfgRJgnt1stcs
 bnWzVcm93rcZ0E/ynS5CTzswqWMEwe/OoDeaR62JD524qQwK1AiTr4xWmgrModFpPZBg06gMBKE
 p5A/ALlGwrweAxhggUth6GznxnoVzJ1EfuwJ0Wf0f2f/xJNlHA57QI+LXlZWBdVXD0gvtIozFtx
 8FW/dROBWPrqGUiPvyeA9qjUjJcHTPUsqtYCh/jZy0F+dtl1AqZYEgN9ZgkVnoI4Nhd3A47BauF
 7pjP/94UGD/VfZX2FU7xD4MIvrOscmB/qRmdBA7O0GU3tFLBLoHrMBY4LdQiFifLPMf3gma74Sv
 bsFL9V1bB2KzEGkSI3QbgaSiqnP5Z0He4OSJ1atKs2NVqjUUa98Kktk7fkdBg1oSa3nKyV5TuYU
 j9sFYiUDK5aS9dyWjZA==
X-Proofpoint-ORIG-GUID: x8aG1dNkBB54dmeQleuccgDK_-67HHw_
X-Proofpoint-GUID: x8aG1dNkBB54dmeQleuccgDK_-67HHw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140065

Since the QPIC-SPI-NAND flash controller present in ipq5210 is the same
as the one found in ipq9574, document the ipq5210 compatible and with
ipq9574 as the fallback.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
index 7d0571feb46d..829da22537d4 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-snand
+              - qcom,ipq5210-snand
               - qcom,ipq5332-snand
               - qcom,ipq5424-snand
           - const: qcom,ipq9574-snand

-- 
2.34.1

