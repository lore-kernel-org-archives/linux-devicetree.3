Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172838;
	b=Nm1XrX8ETK5EQHclV4i/RCUjDbHd3N2ejLlgtkxcV2GKrzgxZUn2Uak0Kx+BW2iSFaei
	 wiHH9Sx2lt/2WMnR0XgVjf0+bV1EkbYT7S8G7fsDQT6UHIJo++sm2nQLYSmzMp7kh/ilu
	 VrD9mltSrrvtIL1d1AfAsxxJMo3OUANwXuiWmeuVlFpy/xBlGv34VYuYNQl5IhbEcpYhM
	 G1TH56jvByV4ADyEc/2bNmWeHvwuc/clpuAU1Efn9pZW+8Xs9mQaK90Ag58/9NCb7yTj1
	 iXq2BzdyViLWNgblBH4DK9SN4HEX1D4feXkAfR29oqu4HCC43+VXo2gaMLKeJXs7qKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
	b=exLViALlra/lazr9mWDbChCaElMuXfSEwWNIDRZtH/5xr+DkH0OSxdB2X0fsqYTob4uF
	 ANKcseeEFjQwzIrzFurQ9EnQ1V5h+BxSueB7UGLfOBaKu/3P67lr0tWSJn7n8zkZmVhEJ
	 AnPW8hG7V1t/RvLrOFISq8828567ARibd5h/b+YvIKtO2wOCgKkGjUTzi7K3VZRaTlc00
	 onYI04MTrEPoawnbR2gcwMxsUg/zuEVtybtMjo4h4o5ItFl9TfWQu+biNhewlNwQwETvm
	 F3B/bgKh/kVVD4bcygIw7CZJOlMca2LYHCa5lzF0+J4XbtlyIeA1PUaez7Y/mSDlSaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lGydtnL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RU8Lr8Di;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE4460A2605
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE4460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGydtnL/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RU8Lr8Di
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkEZQ1017083
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=lGydtnL/WG1DsZsr
	17EAMCvTzQgd9jOSLkYuBrFAuTXmuYZoViVwJwitUwXrFS0t4AO/5kXW8o+gLxm6
	UKbB1UZi2yCbzqPRsBvXnSOYtmQMNYHa8RqlT+/pdJ4q7Bx0Xywx3F8bfKO4zVPa
	MLQzdPCXKUItZg2FDvtKbrvXbd5FrXXp6fQznMHJFo41i+S797L+mMXYrLlatzpk
	BO4FUGusnZI4cVcip1JFi7mcXUt7tu4p8GTcbv1f896NT/3obcCeYElZW2CcHyB5
	oUXURG1tpmu51DWv3K9wZVt35YsMSSZt05tRmY7eXZ+bRMAzmRPPbSokqHR9wcV1
	/B4EHA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078312eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172836; x=1795777636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=RU8Lr8DiL4XwUu6SrSRsVZXDB/9/QeXPQ9DRCoewnxZWf/CyRgrDIGKh0WlZKcn6U6
         uk50u03b1h3UP6CYyO+HojsK9tPV4OhWZY62+GvfgU2wZcqhEIspi9n6svCw/WdDAIxi
         dhDOHw8LsqBWwv5UhYT17MUaLven5bskCptumQbYe6d6V8tF03Nz4sLIdivuOOSgttsK
         tNSn8647E/3OTMSLfj02RfDZd1JknuSgiHajC5jszqJkQgOlwrmAwXJMmABEZrivPdDG
         Mr7LkAGCDDU+arud0dXNyG3tlHZP2fKFNiRzUHMF1E9BSfP4X6Z1lXtTc/0CeXzyVOE7
         gvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172836; x=1795777636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=vSFEUU81JEjUw4lZGtH6AqTr+t1yzXVZBatM13GsXgmVesC0j3b/s6qCZLfYXF32Lj
         EOzGwEW3DQERCQkmf+5i/4ArUFBxLwGzmiCmTmgzsWiwnkj3GrsoMtjG6JY8j05HY7Ss
         A7NeyceVokMzCFUaO3sxccu9lGAtucPFXvcdZV9K2hf1AoNY1PC95I57VNwoHPHkQAxV
         RXDDH3fdpjgrr49gVplCGEQ3fSR5sAr/NbvGIDRjreMMzYLpVV62d5t94n1yk2sy9iv/
         dFmDNeU70Q2x+9KxOnNQQ9EfnSt5izMVeLGwCjcyOXZD42TU8sqcXbLNDTz6SfEfJJN/
         u+kA==
X-Forwarded-Encrypted: i=1; AL+hErFbrSRKJNTSC0KAZM3COXyekwwHtx1Q5DrXv2RLfDh+hDxR6cQ2MkxtrZWhlqjPHBNGhj3DcvCLnW1y@vger.kernel.org
X-Gm-Message-State: APuU4Z8D7JbT/JDXC6aXrVlOh4RkbYtN3TqFvCwjaiz3DKQuUk/BTq7T
	SaG0B17gHDeZm0th7gNd/xNeQP34/siFNwZEPRhZQsC2dgh69O7opQBLpwUPjNAD/j1k1cs7Mbf
	Y38jveyIq4iOe7TGJnm5f4XJ26Pnodnk+4eq5ggc5T0pEPpn4A+nGq6sjXUZJHhE8
X-Gm-Gg: AZFdTZf4xdynB1ZommbNa4UoK4Y2aorZO3N6mR2US62eFWgNCjdw7ATfAEEwMuajMrI
	ykll620qbC7IgcAUXpw3EwCNh7xcUKkq+6Ij/Ysyc39+cLyIVKAkQoHPWhDoEiCK0+K3M+lYOw7
	c8Dyd6ahT+pS8Sl9hRXrTQclp2aGGiPXVi6SLKB6rUSUx2nFUwjscVOmheb/fzV1oEJlfUXqBbd
	Bn6+LgPSDBFvUi8xvNGnhU7w4la4VBtM5cXA/CWUxIh9R4jc/HtK0q5vpr9HiK3gK6TAkvsFvsA
	pimHHm9ytb4azAFtgoehfz6753htVyKWJBmAphmWQ0KdHsDfyPtT28y1yFiM/8HJd2zsMcFFmOq
	Fi2LHDidwmWdoxu/6+pHO1qPiPW+9AHc0L0E7TS+UiANe92/0so7ejblQkCX/VbSuwqONbqH7Cw
	tUWiwA
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2125668eec.15.1795172836091;
        Fri, 20 Nov 2026 03:07:16 -0800 (PST)
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2125639eec.15.1795172835468;
        Fri, 20 Nov 2026 03:07:15 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:15 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:46 +0530
Subject: [PATCH v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
 interconnect for adreno SMMU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-5-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=1lPh+lGGWLKglbX1purFejDWg8n5fwBJBYl3rhWzR6U=;
 b=w7+YMTrpj/odsbvoZBGQJvWKHZSfz1g8C/fkwsgmPpO4XjyzY8ommBMbxvyjAoSlDyRaqpIGL
 0nBHrcLcbdtCZEPljT/X3t2bHMS8fnSMi8mpqaaQfepYWjPVWWOr4P7
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzpMsSrgDlnoC
 CImjG/ui6rA64F3Mlk1FFq+pBCrbZI7SzATr7uAV1C//G66hXMg4xJkumT+xp12BAe/Sc3FsxV4
 fhae7THvk71BlDfNyW5YFOVTX7jCUsgY1E1BCAEEjUFL8j95LXmFhcWI3lMw/3xyMGq4VjOj/2s
 QpC6IuzxWte2HUySLICwNULg2JcvwVzu+BIt5lMsXbDAFDQsKBwW7DqBv3Bcb9yIjHN3+8JcGPS
 mBP6SmrfSI/k6SIeNVBB7HWkex9OupTiyXZ6HjJqO3C/t1A9qK5P55sFWZDMAiISgtsYZa28rxR
 XoIHcnF0NDm4LepCNR2h84BqqV8+eHmLoLoQAu12+gAr6RJAtH3ZVfHHAeUE+Iby2lJB8IN4flS
 76gDNOY9IrgNgYiPjh2nDyzIRf/4JugWjAIJR0yly5fYeDQHq3MgO+KHbKf1Lelwxe36NHyx+gr
 V/R5wUZKVzrQvnoW74Q==
X-Proofpoint-GUID: JKFL3qZVbu4p5iH3uyyw9339ojWTd3wM
X-Proofpoint-ORIG-GUID: JKFL3qZVbu4p5iH3uyyw9339ojWTd3wM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXx1Yigg9ttMSk
 ty3VatPpIx1I77Lka9YxxcUL7JAG1iZ3FhhHN84wQx5ufcip10LWp/VOtXty8DC15UvK8+zPZq7
 TDHJTGYB+MJcHD2vpmzDhlGSfnOf7N0=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029e5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf..13214aa77279 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5113,6 +5113,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1

