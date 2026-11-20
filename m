Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182238;
	b=VWTTOoqxyu/ntZDfT25w7n+uIcM5h5i0DDiOXu028j9s1Sm+WUlmlQys12gn1MbZJXLj
	 1a8JDAKAeaGHr0jPOKtqvw7/TxW6nUyueWoZG3NP6MfzY5OotHOyZLems3kfsZ1CMLy1R
	 eYthBSeZ8GPZN27kzE6vMs6DYZYAXHI5uunECBRRdpkh1IrPvUIh95PcvmH9fnQX7/D37
	 fHy/VvzFp0gC1e8kGNxFpsl13EIysKgYP6oCu97Zt1uCyxIxMBp16LnJ2Yfwzq+3Yge/y
	 qkiFbF4rnCpUkJnVz/jX/79/BahcM8/3yUM7YnZ4XEiIZiSvBM9nRl/xc3WjlyX+SWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
	b=2rLrRS039DCy2lPF09epgSueKd1nU9eDX9jrUzUHmlT/RNkqC65U5Fx5rvGn3MDtrnVi
	 O0sLLctObnanRsISGj4aZMg19FWmO84UImRu3kc6rhznc4uVJ+I5gxR/H9iZPwNYeqJvO
	 6TSUop1qi9rFrY2NU+S2NkurfV3dQID/wbwieQ/JGrCZkowVdjIIBq0YIAvtH0ho2Mu/H
	 8i/8UlbmgYOdtIVxcftnHNwOPdilWnkfHrg4X74zoEJBigq4e9mMx+UXT4kXxp5d44+S4
	 MWqVdCD9cKdIXHyTyJx2nqHk2mJ61V7RBeG8mtJCkd2W6g61e2bd1mxB6dnX40mlXrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ALIrRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MoYy/okl";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3060A2617
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F3060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ALIrRl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoYy/okl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjr0p1463006
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=P0ALIrRlHSIpYwnF
	G7zeIIX381YdjzO5Tn+y8+uGwytHLwvvvCMV8Zn2ATImWYIuHDBlSNPbYj4HM5+N
	UAd+jeYYktMpph0XVMCk2zzQNAIC5ef/NIkpXZG9yDo9rzcAIP4goyyp+hstjDNM
	sSVG7oPuh/zet9xK48cYU8F+nO9fsl1y3aybLmYvffbrHB0ys39289NYvRtnMH9T
	Wy1l+KX0SNJC2KwCnU+JA8Vbb+yybaoXYW6u4csA2nZtaKrJ5PQg6XTlQUsbesEw
	CYy28QCLcGB6KAX1uG+/ce+1+91bQ5Pf22clCUSxs+34b/uHEYpG9aN7/GD06wRH
	W271xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so1303568eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182237; x=1795787037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=MoYy/oklkklBJGxYhwNTNXyS55sjkz6s2j1YN6DuFwuPaYXR9YkYM8ZMdhTK+qDxF/
         LGOVNYrPx7rdpaZx5aXye6lqsAdYt69zXXjzrl5NRn4foyt13ARjig4m9NKxlzKt8imN
         aVmRQALmXkuERHnoI6lHYX1LQ6YwprN1Qv60MYpHmKW8JASflriomHSMIF7GAB7C+jfx
         I7YpFgZ9pONtdthc/56MbBUqIz/T+2MaC0HAmhdsij6ErLynrCBe/YnNiG39nz8TiAO2
         tH/N/ofvj/8awCw4oRNAxql4AsdcTlIuruGBhDoplIojF/xnohOiUayoaadg7T/7oaMa
         /o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182237; x=1795787037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=KNHgHQ1yrFbtZjWUzWyIubxgyVyePrs19BjzEHIrjaVazcx0SdP5w9MOoXR0YNHEmd
         UfPnoqHDvYy3TC5kuZgA5SXIgOMr64z/wvmlGx3vbTJ7aek3QRxDzlGzDwkEBYm71QBY
         wbiAh7twRHw0NsLu+dUMcDsphIXhr3jjjhFUjDRrKOxUP6D3DQRrLof1zCa2kplIIW3P
         yNX5Sg+Xfh4dJQQ+/Lhso7tDGJAyrEVQPIw897Y4PSIniNI+AQxgmz2nwL8PUPiAxrFv
         TkgeH+Lp1NNMWuJaGlOwcYWClTFmcI3qJ7OlJR2fRhetrguJ+zWBLfpuamoQOSFn87eh
         8N3A==
X-Forwarded-Encrypted: i=1; AL+hErFZE0oedpEIRVaw39Tc/reY85f506ngjHisXSA9oWzIV5n+DNwcKutsDP6PjqF2LkGKWiHabFe2sQhJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9GCHvRJRtnDKELf415RqTudmXb2D1qXDGrKG5NGEtrGgduPrHT
	3dxwDcehPn2K3Q3AOeHwNCMqB07uJ2yURA3yli02AG/lrx32TjaZt9UuHWYrns7V5SJwMD75Fj4
	x19qB5NT3I+ftOremVsoVt0Wjl7oN3vlcQMZ3XfN1b/zHLLyRBLAajh3RUC4XkGkf0+WFPv+4
X-Gm-Gg: AZFdTZf8XcQGpZsTW1RkLBJpLbc5HaUN+LCliwiTWjdlAoQ/UuZsvOOz0R7TzqCBSNa
	aW9qCPGOcIa4ciN3rond3JTT6Nb0F3/gd0YdjDpq3HYk0QRxTyZ6oKPlru7iGPrya/OnEwBqsCf
	DC1+NeZBsQn6ajGUyJTJ6TvlIh2rcHnm+z63H2mPKgHemGzrQO7zxpdKALJ+A2ExZU4c2SeiyYq
	60ugIviyPa+GXMdSZ0cLrn2Uizm0VyDyhk6wnAToNsPvUfO8W6d/2ILQ8kTbTPfvHG1AYzOKxDg
	ma+FqAPOahgEYGiCh2gNmtSq/Q79gh23yZ0pm/U3l1weDHjy00nGwAFk+AdIGxtvnb1X07A0Gob
	DhIc2vj4Xn+fiM+o/D4npo/bf7LZ0Rs5Hn5byWm/YKWQRGlPqTi/u71T3IZfNJLJ0tL6EyrT4lR
	2IviU=
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270304eec.37.1795182236924;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270274eec.37.1795182236327;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:48 +0530
Subject: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=PirKNama1rX6T3O90xikO3zJbs4R1zjvKCN9rN+lImGmZfjb6w8J3IBREFB0LIbBUhDXscinh
 nJcYe4iqZY+AV+QgHvh2Wx4pbn05gQe7wcOegQFFyLLe3xuIl+tN0Pg
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzinZkx7fkHlW
 MO9xyJP9F0B8MVMkkk31yFqrlJJcjBMEfSPfsHdJCd15Rxy8zBs+j6GPNtOtjqD+CP5zlNrLh5m
 rH10kRvQrogRPnpzih+EcCmjf7Y++TohFwd7KG0FXhOnry6uMl7uZ+1nprXKNjtfCIUNKhR5QzI
 SKUfwOmy0IZyaWJkPdQY4HP+VqbVzlwtn+e7NLlv5fW/9H09PtWjYGsJ0nniBpzgIvdpewOpnod
 dJk/QMhNqQmKCQ+D3r9C1/WLj1Y0oRheURs5PXCE3YcV4h7347+iCVYl1URQf/BInSTXpJzSJdU
 e5KsMRnSc/lOID8KK8sud4R3ryxMctFKRuFEiXvPMD4biEESckbwgVMDJQRKsuf9qxcYIRyeneE
 mBMT81vom7Achg/bL4uc5M1w8DMlbSyEvlFJbGPUki9pj2mvE5+1BZAgwHMAV7xAAwekQ3g6WtP
 kN0P863rgpuididdM8w==
X-Proofpoint-ORIG-GUID: uq59vhij6IjxTKzpS9Nd_6BMmWT3Ju1o
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004e9d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: uq59vhij6IjxTKzpS9Nd_6BMmWT3Ju1o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1qnm+Fzeoohm
 pUP8MAzOnQA7NwKpx+bSLUCwi/LSi57ebCmlo29BYKs1suDQSh3Ocp7R9HySHiAF/wfmF7fsvKX
 X1v2mKTQbH12ftR+xFi46ZoiA/SXghc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
interconnect bandwidth vote, the HSC_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index cdaf842814fb..ae3cedcaf9d8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4378,6 +4378,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipcc: mailbox@3e04000 {

-- 
2.34.1

