Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC23D4107
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147865; cv=none; b=JTiy4XqUb80abgmSTX/FoHp6C1Kr4J72Ufj54x7iEVCSGlTFhDigengT2jt4in2iu/0n1uLcikF3nzmJ/gGiIc9SGhuMRgy296C7fR32rpmPeEUaf5GO7dJ60VFH1QPjlBDTtU7nAdrHsYzUjfv0ChFu4AwEgvWzD3tIevZQdbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147865; c=relaxed/simple;
	bh=rF6TUJT4fFt0Xh6pN9n6/C+QLa7/YYWjtH1j7RXIVW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/MkRbTBYzO8zfn+LeeItL+g71il76wJVFp4ujTIJFY7tY+/DeP7B/Vv1n52toxgpJmX/RRE0b+3FWET+FloMoBsPrX6YZXa88KCCgzBcZq0DxTTHj0ljvo2PzVgYj3nkJn6uviJr9Sgw9aboER9gbw4H1EnLgNGDAcGGQ0B1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD8x4fgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHl+meQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JD8x4fgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHl+meQT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD07ce4045436
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=; b=JD8x4fgHKMf7jFzL
	Z6jaM2VOyiEt2LdaqLcvi4ghAzZnJ6z/tBrRJordwFc//ll4tLSQMCuKYGQgUIeU
	GGruYsZZVtyLarkWHyM8YODnqUJwHoUGVd7ov5oEIOxt49tGR1FAjRpyjn++uwTu
	DKqa81dC+Whonp5hcaLK1FQpaPQWVaeY1mUQtoMqLopF5XEt2Uvux0AZKY0Gy20Z
	eOr41aUM/MlZQsaIL802RLUMbF53CwIFCfE4RJyyN80IitF3G7sYkzhPs2hb0Fh2
	k4qAJjvmXTLd59vdH4nLRE9SMZ+OaTk+EBEGNdjdeHD1728cwk73y8IJyYWoktd3
	UO2cmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkkk27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca9da7b6c3so2371405ad.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147863; x=1787752663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=MHl+meQTo44E6eqVwY9gC0re2ag2PE0lbZY2yAC4YZE71Vq4Pk9CYaa6pg78L1AqzP
         DnuZePFVz8XQtiFjUdJ22aB76l0Wg10piYpj/YK4TXcSDZ9UazV8tx3KzMDZN1xBcBSx
         ERVjy/03ll9GK8CD0Z9Cb6ydg28mUZcjq3RhxIPrxpwdWiNYui8czQr27ltp19q/vhQM
         Ga7yfvD6OSZNOS+jMgzYxQre+DKsfdwMAHoOAlndvjFZeLlz5ilmQwtJbRuNL5vpZ9+K
         GFSjuc6kai5C3aBOpEb23i0JZJA0DP31yUnRNdWZTUVFGjofmNA9+r+npi2O6wmPEN2z
         6sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147863; x=1787752663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=YJQyLEcCwInafkM+wTnUTSzmPLduYxyVqX6E0+pq8U5aDek80g/9MGGEeRHENMTOVr
         K3ZuQAdPXWpbAt/8MNqZKw0oHgJGODRxGkKkRKjY3ug8qqpxfv8t5U9y0LRAAhV7bs2h
         Mu1a0QomVPPfisU2ZqEDTeRlCoA5B8iM1TP4bHvFMXYVVXWnQU+4ja0IO8+H56tbvZ6o
         Q8ZKR/THt2DiQC/3SsYx93JyRRHhbLAcd+/PfK8cfzVPtUgWAWhPM+7q20KmXeBslyX8
         okcsdSobrMBCQXIK1Nvnkt7WQif+907tDJo8B9LONZFzI85dhu+eU2mALu5TyZ/9uL9X
         uOBg==
X-Forwarded-Encrypted: i=1; AHgh+RoJxnRzG/a9/I8FWOBtweV+1HoDi6URZ0D/E+HWHa4hXU3TZQNi7fpDQbSqJcdM1P5z7wqsRBUpJR5R@vger.kernel.org
X-Gm-Message-State: AOJu0Yysi6oh+tazWDe9KRWHBUtPIUnM1IuTsfQ6vPdtF4N8YgAv6BOL
	Z39UsINni3v3DDRjbQLRC1TVh0ge3NS1GBE9/pAuVIiPV2D/X/tjIOxf2nD/3s6uArF5xGjsZMe
	HFL94HFhH5AfYRmUiSuvcZclo4basb4DaXJ6avh6WWbGveUZR/L41HSnoO9KhqoUC
X-Gm-Gg: AR+sD11ToQMZgf72mbqnUyokuvSq/J2gpj3CH90RErw+L7uJr4ET0hhF5HFQpfeDO+K
	ArDqpHlBUNU0bQ2pWE8gHT89gb7esuZfCfBV8N12AzDjFUUnfAZl39LlxFERsGywblfHuvb76ZE
	xEOBOIX3bHEZgor5qev73//tmccfXPtiaVuBHwWC6uEXk5xtOZHBvQ6DS6yrHSvmifrBHd6RNLX
	euZLhM6OJhwwjrp8zUNgJOuaRjD+sg9y1D6UD3X7EspY6wxVZ43uBER1yjl4iKemc1P45c2G4tl
	uKGgOVScJYZb0tsWMPDzfn3ukSPqIskz/HTpgWTT8cNwL7Tlsv7TiUkaxGpdbcNa/Pkdk4xTsNv
	QLCI1A/WNZA1a3eRe9NHZK61YJgC6rek2zNxDTOXdidUiaGefLH4=
X-Received: by 2002:a17:903:32cb:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d5fd3da560mr43717925ad.0.1787147862819;
        Wed, 19 Aug 2026 06:57:42 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d5fd3da560mr43717535ad.0.1787147862297;
        Wed, 19 Aug 2026 06:57:42 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:42 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:27:32 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-1-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85b657 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=s3JIKy7HVgEvE3Gl7h0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: J-Sb1k2Jdt0tSWjbeZXqFxBRhfDvN9Jj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX/SY/7hk+6jeT
 2Um9b0XjTMj4GultHUbHNu0SIJTeP7edSL3IA4QyjH//MQX6p4e83613RsvJF2yM4y/QMAl40hF
 yTknw/3D5Qi5NyU9xrWPFS3FkR4YrZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX2lLa2R3uQKvF
 UmaX23cbW3l+Nuy2ncD6shipKxNIHZo/ve+QToTv2rOmDvEsgso/lFXNdhyr92iOK7c8UeAdb+7
 yHDpMDfi/coV3RQQPaxLuEpk/rVunQh9anq3omcJVH262dImeel1ALaC0W/nVn0qQD2JskF7+4k
 anSeVmMpjv3hmb01yjTCsRO9MW1RdOJ+szKIKQex+CM6fVmIoXy9QReOK335ckMAw5GA9HPOqkA
 H/bEB4NYoPAMn0s+0sSvR517/1edHXlXN9KD+2NYOwJIAeWu5BJt/sClwjECoOqAvAzKmK+B8Ok
 f92EQt3xqiGhq/jOu0FQsMuS39NXDNiD8hkZc/HFiANRTVgWLr/gia6hbGtTUuuUolTpXf+Ao+v
 hXiFMLFh65JcqlshSZUQYmH8fW1Z4RZPn9coSUVAHNklfryPq6T0SPFC3EUjvE645ioiCtgqvV0
 5/Xtrf5eE7U0WzbwMaQ==
X-Proofpoint-GUID: J-Sb1k2Jdt0tSWjbeZXqFxBRhfDvN9Jj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2393,6 +2393,7 @@ opp-32000000 {
 			};
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

