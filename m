Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85C388E63
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181335; cv=none; b=BoGh7O1Up5gGCnRJqTrqn5gjzQgVJFAGxKFPqPTXjrDhpJ5LM4Qk64vZHNG/T7ZWJUzkCcYviPnwXWu86Qt8y4V0jhNaPhCsxMUd8ODGioGHWpIB942s1uIMZOHxCxK0sRKgm0QNh4hYe4ubElGBDxvc+4AsKDLC/kAotUaVlqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181335; c=relaxed/simple;
	bh=g3lh3xv2fJOemJMqNdGCGf5chbAN1y19wJfzOCGzwLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTR9Fry1Yy6mBPKxPPNQSK4XcSWPUua+XHTsHr9hiXXHBHXdOqC6SpQ9XErzTm500TgW3aav8lHwlefdxp6wn5tKyU0uB3DH5TB3so3lhaSt+wijpvrDt5tsqKe7xOsHV9SZWXFLeqMrpOjL2vkHUNhWYzDDBopI+z2yvcpCdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J04Q5rs3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1Jnbncb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J04Q5rs3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1Jnbncb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wXXt1610237
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T31LVZtn7JiiyDj/D+0HVxLzonmSW7DXPuwYVl1T0g4=; b=J04Q5rs3t7iJMp8z
	zOG9L9Ty4EtD9fYpHsCrMAcQoeTIvT5ii9YnzM4AIXN/MF9UO/WoCgO/grjABeaZ
	P9S2VWMGd8pHEIqV2/y8yxSoIemAKvFYF+vrt0MZQ+UdkJrMPkf3PnEnAT4R1FGm
	Z1Y8LM0nb+p4PWM8XROlUXf6lV22lJmwbtf5+k7eeXIaTmOg50dsjR42lyPwfz68
	UI9WRK8tIEOTsG56mM6cH5sQY7JwR6fkW6tPv6yPtV65rrA+ADytKPV8tuLRscuW
	fxtX76KCJU7tRLeR+8WzenpzmEC7hyDhF+wvWYsO9Ydgyt+17v7ad4lyxlfTx6gw
	ic7cDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfkdtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so116301105ad.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181332; x=1784786132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T31LVZtn7JiiyDj/D+0HVxLzonmSW7DXPuwYVl1T0g4=;
        b=h1Jnbncb5LzoHgvJ1OoBBkLilz16mo8Mu62t3BTdoyjdgeUnZa5wmzvDRjlF3DlAQd
         P5Bf7lh6imr2ofT/rnO+R9npPN6V5bE5iQGYLthJmDnpDcANaaeWa7ItjUOos6gTVkPB
         5hlDtzXTLs2XXZZRdPhPH4VS4XoIp5tMs+ZMEAnbbDd8n05TazC8l8C65HQRLViGnTMX
         QFlR6xf+VOWAUkLP1vB6owdE1pEiKNFkRxpL7yVIngP/KLgVYtJ1pepsK2VHYFkxlLtA
         11ApHvEDW1tihCCZFfLrrpRyIUy5h50pWH7BNAmhOBSMNrtEbB19VTjF0KAQYkghiuSX
         EB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181332; x=1784786132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T31LVZtn7JiiyDj/D+0HVxLzonmSW7DXPuwYVl1T0g4=;
        b=HeZSR0g3oEIU85V0Gy/vvN9/0Xg3f2FvoK9mODtCazTMrrPebWQu4h+s9ZWArdNyz/
         laeTvBdihNyeIuIhKVDMngZ9TxbnrHqtVPfEjaQCpBiaARhpvAvZ7WfOVq8diMjJAeoE
         ug7T5z63maMQJ8JQVkWY9dWJWcygOKrvmQme8H5HJX+9ezBQitsNIcr+WTPCVfUjNoc1
         iHv93pU/dIO/mYNDulByo1ltzROmu8YzxR2H0PgGgA9Y1Y6r4G9lJaQkAYbQsTeQugcy
         8vvxNngDWun1cMvNpjIi+cZA66MU0qa1efrzBZjhHStNPfOjCgCh3WFaDstUQTJaGNFv
         5KKA==
X-Forwarded-Encrypted: i=1; AHgh+RqWVUjkdMEv/rVCIhiJovt1UrPoA0r26MqxXkwmMVUratLPDMNVzoROAoO2Zny5/E7yTrLPHtr1Po7p@vger.kernel.org
X-Gm-Message-State: AOJu0YybAxap131p2yHrGp0RPG5baA6u9qbhYupB0KwrQhsEZy8Bd1PU
	TULJUTeqsAl8UfW+x1R4tterTt6GHc2CBcRkjiTMIYIsygpidvxgfHtJLjmWWi6Nny4o0CLEgEF
	hD0fRynGFNnynzZEDfa8RlJalTD1vN8c8JoS7rpHgzgkEt4VCvItKwdFnSCMdChzm
X-Gm-Gg: AfdE7cnJLbbD8eAiAUblfSljSJ1fjOqI9B+pYhXxTMo3ibwf72luE5KmZpJLa/DLBod
	8uGwOl5n2OjBdRM+PJy8SLotTiLswC2elYb1KMY+g73Lw8zMjavBeR5zxjviwuc7rpEXlbUor1k
	6/SRWoEXD/TiJBzuJs68k6DUIKFvkRIn6vy1BtbSWq9MhRFJ0aHBRa9yMVH1LEmfW/T5Hw95CSw
	mStMApvT7idhwBgb7zpYpYOjja6Zs8A5MpTSEtXe+WbzbP2qXHi9cgEzTkxDlYvbT4hDW541jaG
	ZTVU57ghIDeUXTRKCwSaSXhYWR1Ck8Tui++0hCgbWd4dpQEAWlI0vbXYfChDVQEcvV8z3+r52mo
	oBYrv6hwNt+3OKwSm1WURp7P7Xy+t7q9OqZJWM84AGZPP7c3dRn37FY6Bz5FjRbX6n/YKN/6mSz
	kvionmT3iYaJA=
X-Received: by 2002:a05:6a21:497:b0:3c3:8bab:804 with SMTP id adf61e73a8af0-3c38bab394emr1543785637.49.1784181332444;
        Wed, 15 Jul 2026 22:55:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:497:b0:3c3:8bab:804 with SMTP id adf61e73a8af0-3c38bab394emr1543767637.49.1784181332006;
        Wed, 15 Jul 2026 22:55:32 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:31 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:25:14 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI
 mode for SPI-NAND
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-quad_dts-v1-3-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: OdygpWJcZZcbLnkS7gHU1UvxIBP24TY1
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a587255 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX9FrITiV2hn09
 9kIBMXuddc8Iir8OOiMa1zwK5OTjBt96vilKuq9h0/EThddJNWjMmEP6B/QRzU/2rwj/3o7nNWv
 RMefljmj60SKJnQViunNoZQeIzQzJ4l8l822lqN7vpYRonq48s4eWm2A6r+EDq2O4mARL3eoWzm
 PTJ4hHIXlB53pPy6JtNC4QU271FKyLdYHwpqqZzL3r1tn3TSMCv3VKiU+5YuUZZvScUzX+uW9Ku
 hxBDz7Yh19sIx44TUZ+QwNRroAaQAyizP1Xacn1lV3szbLRir8r4U/8b1oT9+95ezkTxLLFPLJJ
 PJkZaQT2odKoW7ah73UGS7SewaUp3ci/rzJ2ZLKmkLWVULslrgOxhocjjPyaw0q/TZmiKwa3TxF
 fjLRKiTRLj5uNt3BjJuHkCwz584ov2JOuB2pdGvRcKdXFSaAc9SsNdNCbii+cA28fneaxShASKy
 3C2SS5jrAD4tzAfRmtw==
X-Proofpoint-ORIG-GUID: OdygpWJcZZcbLnkS7gHU1UvxIBP24TY1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXzAe61d56RKU0
 PaSlKTL70R4b8E/y/yD5OnzIUZkplGN12Yz6sIxiFgbmVz3q20zF1BGaKmnTz92iXYP53LC2mr3
 4aWfxrbVbKj2hqZ+zB/rtvg3HA5hUTM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160058

The SPI-NAND device on the IPQ5332 RDP supports 4-bit data transfers, but
the device tree does not describe the bus width, so transfers use the
default single-bit mode.

Set spi-rx-bus-width and spi-tx-bus-width to 4 to enable quad read and
write transfers and improve SPI-NAND throughput.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 3bbf748f2e5c..6f5b193a204b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -141,5 +141,7 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };

-- 
2.34.1

