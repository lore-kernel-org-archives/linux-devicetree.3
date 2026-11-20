Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172869;
	b=pxqPCxIwVPRx0lusiTr5Y5NE6NJpwh14SbOqvDOZHwOiRbLrm/9t630FmFtujg7SwLnf
	 1s02eiqVsiH8zyT6g0eLVNAf6IVCm+wIw2z1/leQQbJhxwU7CQUXwWdxhTO+aSKFtAtDp
	 hsLyWmYv2gvY5hy/Qt1QkUrc+d+vs4sHiUn3xUYwXRCVHUsAz9x1duMTVXlgGjC/oljXq
	 U82bHZdtlevDog+kSeP5L4dJUWPhiU1z212xsmEtkcitZVCBoepnuPdbnFEMp87YN2GhF
	 v2qtW6oq/huUYcHpWxET8CpfHKGylteEhumvt0rxBavrHSajZUC7cIS9CabFexBVCtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
	b=k6OYlKkl2cCI8fCv2RFReImvs/+ZtQrAPmsUukXS7hr2rovYmDtEkZRy62gOvKZXf1Eu
	 I0ZYCDV+doZTbPrFb7gl9yl14yONnvUSQNysb90mJWvI89gH79K+yRccTX/FBgS+2MwDY
	 PsQdSGwXjHRybTTFoTpHy2ISzI0Fa+n03b1bgrJmMa45QUKvkyXt3Lud0zJHf4xr+zU07
	 Iy10gOQnZnB3Wppx4yEiEBa26dzy+CBEs7ydpRsNWpEXhQimNNySIWduvf46qZ2T0ib6M
	 T5MtId3m6a30TfpUxlaG6jQrs82NLiJBiCykG2KI1tCZ2oPtBJE2irFDAI5wJTD3/+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m1CaV0Px;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dddS5FoE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCAF606D860
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCAF606D860
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m1CaV0Px;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dddS5FoE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkC9V1017053
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=; b=m1CaV0PxVcpSnDiH
	28HPG+7yoOHUsD6TQ/EMM+wsgLcFbA6mkd7Xv7572Jaq4kNDPtW329NS7BakGtCO
	nrxFpq7LsTV/3rrlRXweqMg7ZDsLj/EkxXKMDVS9T8Qe1xEWpX5fitey+N6hPETm
	vnlpcFqRFBcJ1iXbRmlSwsRoOjGiicm6NyCcQ4HWkoOtbdZfNV6C89IKE1r1y/eO
	i5ccwBVnU+IHv2iFd7OgPgDvlFfimE1TYVwMYilSA5giPHg0kCNiBmB5BOTHh3Tt
	uGjy8uaRyQ+4slp+ZzTZwn7ZtP5ybm/WAkO/OpGj0XMCmYiu1SZ1p9cHEkmzURPT
	PntkIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3821eb27024so1282474eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172867; x=1795777667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
        b=dddS5FoEf6/ykbwuJdtrdKKJ47NsZsJTuoRjGyqf3fmJVNBM71uO/uilYXDX2PQ0L9
         qLzkEnNJSDOniYXVfgsKDnmq/h5cjilelVJtfmitwk787crEKCLACih+g77waEiCeJHb
         Ihkj12xuHO5FkWMTWO5/4akTH8EI6h6FCVbB2qgvSSJZi2crCHZ7nNI7i8lWFWvpeidB
         8JdSnUB5AnMNYcxZv6/IqZ9HIBj/6B/VHeV6DwyoEYfD7MZNf8o/6kNzBQSRdgAM8nd4
         Q8CRoMRQVENsJ5kzAZo9qv+6PbjJxUq+eMu5clibSs8nkT8wSrI+yhimKm0+1egXtJU/
         B2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172867; x=1795777667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
        b=gQXSbQDcy+zoIXdKgz1TI2iM65a/zL6B79QH0ZIyp/LJa97WzpowEQhkWUaqw8ND/7
         s6j8tl5YLu2bTp+o2xoonF7HvXda4H5cj+hxzZIjqLS6ug/iKI8JmUyD9zaSqT5/dEl5
         KD04CgPtynUjxRqtd0i1U9FTjKYgrCYqBGrmU7zfA452YrIbcD0h5vuF+Hty2O2+rIoW
         ic6HN1vf7is0QWT28paSyE4WflYegAyri+yfIR35ikzw0dOkJJXbJgmSGiN0zt5iTRTA
         T4XzAWG+RtGwDxf2zU7RUygHyUekFb5TKMaDaS/24NMGhAcl4TmO3jeNsFLg49dnIYCw
         fbqg==
X-Forwarded-Encrypted: i=1; AL+hErE4zVGRHUSZN345z38QdDO19kw5EMwmUVSORHg5YO07CQY1C6eV92feMWLt2UJImrK2ZT8Sfgq1mZfZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/oI8XBFM0mIEsgeyt1w14iIcHCjWrQLAn5/v1Qpd0y6a1TQL1O
	MfBnOaIHKLL0YfhCjW0zwa5WEdmoltlLXCrFlK0KAsRkp+F1nzG4kRzfsRnYNrHY+ZNC04/sBl1
	P88AMojOrRPEcfSRWYuInfOuyoG57En2x5MXoKuYZLDV5CrrlgZjq6rxpI3rId+dY
X-Gm-Gg: AZFdTZfA+4Eft9uc2yQoLPnrddPQTcSPQDGWwaNTYYig50lNhctFGS7ZPcN93nXXckn
	PVnU5bIav+d9kvZ5je1TCa61EbR4Kkvkfe+m6sOu0XInm1+/GBYe2uiw8+faKoBFRxnXYhKUfsk
	znewf7GNjEoMYccRLIr2OXlYdIp/PPZt2rWYeoR0JLp38qfTCUzLKgu3zqDRT6s5CCbuRGbE7nJ
	YJaJdPL8hjVfOGY6cykg6L6LIhmu+Pl5Ziz5o4O/jhlbnBMu12HITOUJZ+9byioN3rq0FhD83Xt
	fvhPSoOHEyFBqqNnRlg9FiMX1IAHqt4/b0LmWdZ3nmi5sDDSEsTapPhFx1zkKREHpWjA5nz4QYf
	/btng0zk32pYWLUi4NWcFd2R3Uo3T7kW/UQ9U3qIYDspWYTvlpJRSW/uRTthynRDCzQqCV7SPS0
	e6uWWD
X-Received: by 2002:a05:693c:884a:b0:386:319b:fb11 with SMTP id 5a478bee46e88-386319bfd2dmr534039eec.1.1795172867323;
        Fri, 20 Nov 2026 03:07:47 -0800 (PST)
X-Received: by 2002:a05:693c:884a:b0:386:319b:fb11 with SMTP id 5a478bee46e88-386319bfd2dmr534006eec.1.1795172866650;
        Fri, 20 Nov 2026 03:07:46 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:46 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:52 +0530
Subject: [PATCH v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-11-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1283;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=53qBBgRq2wi2XcZ5N+kmy8C1bgB9H+kOxJMHwtLtMZY=;
 b=TYQkalhmPfRM8mAGJ9GWhGPKxKVfz7ouAdcsaPaImMCvOGkdYQ7Rs52zM3FA3LYB//N4CyiWF
 uha/csTA3G4D314GdglDhRR7b1/8Q0yEdvi1WsHRpeEW5EWV4GKPUPC
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9vZfe42H7cYs
 vVul3zMyyfsK2qbUX5t66xKftkOxgDOJ08gT3jCEH9J8w0hecBOhD2gMqEctUb2VY1ClhuhOthw
 7cYSkED384hJHBfOcMpkRi8eP3+36cqFpfrqgBEUAaG8Tr0yQT3CEXQ4DZLX14F4nNUE5AifOCD
 Dd9YEvbMnB2yYkeryfDCheEG9x/zHCyiUKXz+9yM6o3hdx96Ktw1LWOTe8uUMx5aAYoqMzLKMge
 tDZbCIiEeD1ZBNG776yMUgEvO3D+yT+aatp5DEMSET8RdKS+rM24p1Awqsu1K8EXhPP7tpSKZJt
 6In4OJmRqZNH3CkPkecxWQsRw0RqvlpdYsB4UKCdFlwVI2OgOj8jXxvyAr3S2urBEG3H7WS3FEO
 jF+vt9n+69eVGxC7/ry86iDv+Gd4kDVCGdQRpShzK+riueYj+wMmmIhbCmZMR6qFwjof0kLrjBB
 demKO0bn5X1bRe7TYsw==
X-Proofpoint-GUID: F-XdzHDz9LSWtqlJ4T8xVrPiVrA1zqG9
X-Proofpoint-ORIG-GUID: F-XdzHDz9LSWtqlJ4T8xVrPiVrA1zqG9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8mUliqFGy0zB
 6lAXDnui9mGuV8FOtdw1nX9ulAX9FhUtqczQiXqOI+2G/ISghAAgzy5vlGP+J393zob6yDxtRSq
 Tvy8Bow5jEU9WlFLuboAP8ai0Pv7d7Y=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b002a04 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 703b4f4e2059..6eae42384a18 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3405,7 +3405,6 @@ gpu: gpu@3d00000 {
 
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "gfx-mem";
 			#cooling-cells = <2>;
 
 			status = "disabled";
@@ -3564,6 +3563,8 @@ gpu_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		sdc2: mmc@8804000 {

-- 
2.34.1

