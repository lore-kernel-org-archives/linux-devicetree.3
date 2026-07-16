Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22E26738C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181331; cv=none; b=IT8bdtRj+bMEs+q51Vn0hqZy27K+sLL7Jdqlny5tlz2Xsmur21Dr8jVKbPjmXSDPFH2P6lGwpcQezwHFI8xnP+isgch+852tFej6t5X6Sp7CBMZHmTwHolbVkQ1Npvp6QKrYzVymIPupdZnOY29BdZOIEJRDjUycMkhu3LConzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181331; c=relaxed/simple;
	bh=1srLiVBCFDIaFpMyeXpWcduVKJcbcac5eYq579cw2jY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2jKIHydeTLHWMbNSAbtEWZV6G+sabtJt2XDeAxFzkPrZtzyyzjWv2KindGVHRzrKU9ZbCJuSeKVlq7P0v+PevPrE+Ct/Ly7Jfn0hdSdC0rc3vV7WEvyGd+csUZ/iN86uAH0mKfNNbhjPUjq+efe+yxrUkT+ziiGnF1z2FFWPfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDPjlb62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3liOSiV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDPjlb62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3liOSiV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wJ2A1666920
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJMauIEmAsnVad7EuVfQLyGdrCSj+4Tgp89NPGr6fPQ=; b=KDPjlb62sZLD3cvc
	/ZLFJKG56OazZlYKFHNfyUnLFQBCJsnlor4+vdB8ngcPt40BCIw9Rze+KX+KItgT
	DFiFQGTNCH7cmgXdGG8hfpbFAxmRTc4Nuv86rMHSQMmJyizRQ6kmQEvnRPMoLCpF
	0RYHKnLFxrgTF3Mb1FaK+KOCf8DR1vw5PwHvJk579cpdugS4PJCjitttiv8fZE77
	iib/ezBsLgfo+BaFQ9d1h8TPqfOTw2u8NvnL+tX+vMW4S0VRT4WTS3WulFlm7bq0
	rNgPcTVH0g5IDbvr/W3M94LBiTWuGGLw6CvZgXVCPP2243NXVXgaftO/R2ganoiq
	HEX1aA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4w8vf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so308385a91.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181329; x=1784786129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJMauIEmAsnVad7EuVfQLyGdrCSj+4Tgp89NPGr6fPQ=;
        b=Y3liOSiVWPYuyI40A88+m1WA50eL0/XAiSrR/1CJEx0fguzskPGY9i4EBhGbRFNm16
         AKrlYtcitw7zsIfPlrLGdnA2OmGwJNzdt3XfvAnOvrnNZz30F50jhek3kXVAGGXck8NH
         SHYN7ZY2LL7UayzYj+2o6ZjcuU2yjDNq8PveXlXXp7QPbZI/VpuWulZSIR+815EO8TxF
         0O469Ju09DPyHrvlDJg8RLiVlDJPWB+Xg2QrGyE7Dfody+JJQ03mAN2h3+cnhvp8E8pv
         /ivIJQbHTws5iaEPXTda35/8k99HG3sNhtNHDApm15KnyAS08XZcwlCD4asqIOgzm1I1
         ErFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181329; x=1784786129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJMauIEmAsnVad7EuVfQLyGdrCSj+4Tgp89NPGr6fPQ=;
        b=eu6eziyv/fYAr5pZJw7RK4K6pPNvg6kI5Lx8Nr6hcuU0Ks51u+9UjOvrQRTiFAd7hx
         Ii2qwSvVMvxOfFzWnvSnGLakLOOMXKghaNe77sRD+lq0MapmBn7HF2ORodhiNowwkzeQ
         nH0Zx8PH5IMLDb4VymFoyAil03xMci6iJQCt+JHM2CbwfJuLve/vP5tKfGhWSon884zW
         f88RsmflO0cQMi+ZNc8legmEqSjuhG9A5RAdBFst0ouG5/ql6jxjAh5WSdkRgxnUWMLQ
         xBuXZIbNT0vUpSWKLpH3NMD+FU2NE8KnyUPThes2pCr9XHSFFh5307nKUmOO+PScWW1L
         tV2g==
X-Forwarded-Encrypted: i=1; AHgh+Rpl08NDfUm0EwByjGOpQrB6EMueUhbiRsXBC48diqDPgcK+lXPjaPYxSDIVfKcdPGSKqv66aYYqOBXj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2OnKRG1htGSEarfAU4IeeosD7pi7OmHZz8Cb4UBSktK8Xdop
	Se5AHowbBDlsyrlcNxw2F2ZS9hNasQ7YhGBeyX+K3ouxjcwpVet44JCLGd0H0dmUe8guDK7NwtM
	0z2IPBgw/LaOscAMXqcgYZhx1yVz64psBGu48dm+MzOPbNAjXOoDkw4LV89rxJM7F
X-Gm-Gg: AfdE7ckzuydowT4AleFLx0CDJfEz/MfSKvyc1xjU1jEPF9o0o9GlvHZFrX3TcEYpvWP
	rIp5BWNmkZOHhRIMRAI6D9QMhlSR37ER/b90SFCWLEBLaveNkosI9uOl1meaNavFciJ2/GnLmpC
	0g0ab9YQ2TGrxvNft2OK7n0Df/PFaBizwt+XX/reRFjkDarVL+cvHF3R3PNHTxKwH4gc4Jqm4Cb
	BtD2mCAAAR0jX7c5W1nmz4Ab4YY6y4fCqMgS1ZhHGQrwjalsb2L2OU5JxD8dzInZRwxIpmedlUr
	cxJ2BW5Wh0ledYUWtY6nt1+6NzSz1qRYTZ61DVOQsyGbQmzM9NxQmPUDCgxlQsXhCxL9RbvO91M
	+a6QZhV0XZvajmjdbhLBMLw3fFnD/MkAdBk6vsVJoWetXgcaerfHb1W/DMuxCiLBpTCRE6+CPJc
	C2mVZVK2+g1VA=
X-Received: by 2002:a17:90b:1d01:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38e3d13426cmr1250176a91.3.1784181329032;
        Wed, 15 Jul 2026 22:55:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1d01:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38e3d13426cmr1250154a91.3.1784181328516;
        Wed, 15 Jul 2026 22:55:28 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:28 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:25:13 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode
 for SPI-NAND
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a587251 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7mV663YIiae9hK7Uy8kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: XoMbH2gnQiBZiIrsik7w9AGdNQEIBDne
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX5VIldV9Qu3Uf
 j7FY/odcls+OaX5fnGACie0YMl+ZdddeAlJeUdUTOM4OMNeAQ7fBoB+WDLaYJmEd3if7LQRPU8R
 LQnHEoC9vftI2QSjE2zd7xXegasefB8=
X-Proofpoint-ORIG-GUID: XoMbH2gnQiBZiIrsik7w9AGdNQEIBDne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX1JdOiA3ZzxvU
 oB4UiYrmDwo78VnpP6+40y5LB9rOE9f/pMBu+WhEY5+HITVMx5aqC7aAgGQNwQP/AmdBqvU8A9X
 q+Hci/ImI7iMjuC/oTUxyoWY2aNPsYbjU/QRrqKodkq9m5A+vpn/1X532Ja9rjcSLHob2MuH/0D
 sG7SoX/vFz3hKoYGj6hB5arEpM30mVenCnnOVwC4Tfx1OiDjb6qP2z068qrqUVuJwW+P3ilGuCf
 693okY2gkYeWnFMWBfeV+8NdJGfKe4JXfq/rBmGj0vJxYBmB+X+OCOgniKH88y4+yVYVrCyqTOS
 rQdDXHe52MXPYo6SP2/rGIfPFv/nlsbGqL1jk95BpbaoMkpOOMwt7PFoM4za4Ff/t8MCNTPoxDU
 jixpeXqfaSji8/QhkmwYcgZYJ30nVy1h8iAGDulU9L6WbcrXMQToATX37POlSD8TIZUdadD1RcD
 JLkgSG9IOOFNKVcQ6Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160058

Enable quad SPI transfers for the SPI-NAND device by setting both spi-rx-
bus-width and spi-tx-bus-width to 4.

Without these properties, the device uses the default single-bit bus width.
Configure the board to use 4-bit read and write transfers so the controller
and flash can operate in quad SPI mode.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index be8657239c46..793afc3ee82e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -261,6 +261,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 

-- 
2.34.1

