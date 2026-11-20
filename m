Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182249;
	b=BQBlW5lfl5hXdd4JfRj8gVvMYUTJ26TmUNTtBkK1mXOh+Hj6PTKla1IMR7B0VxF/uIJO
	 6bjUOBxrXnOfYtqfDK8mPQmXCtzzqXtePgA2sKfG8v1mrtYu05Iau3ADyH2gHJzDe+JO/
	 iYAKmy8P9zaNL3BuXhSOPE9jvEGI9AmkNb05ZLE82DWPzqgD9nr55SrR8k2xTPqKhQVQj
	 uHzONwkpVTfaPQAWyE5j4EsJ85WtdlxQiiAgfaL9x46gHfcX1b8k8e5P7QWxaN9RHAxIs
	 DcOyD0dvKoq77VbIeUPnRI3iFX7FtD55XUWrblucTqtbEnEUKR/4uoKZvLScSvc/RdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
	b=N3kRKMPHr5d3dVijIrIprd8q7KWhvgi88O+P4GV7SnsdEnrNjIRNQ5j2cOOlRywiOVt5
	 CNIZFr4P85DPsohnn2aBcUu5cmTxOkjppmkdnYPdwn401Vb1m5UAh7f3Rwmm6d/R8JTzh
	 rcRFLAU87QKHX+BiooidRzmIFBdfJPrsSHjAkvhLGvhWb5IudZTFrq9UAeBda1jQ1tBHs
	 PykOtvvOa1Dhxo02/D9d2j6G2Scs3Q5ahKWeg/ZVi90/BqffOgsFw7nEGy5N71ZoqI6Ys
	 HJ7pzwDQAixgS6RQnD8dh9C/bJZTVRR0tUVCvmAVH6UXN+kJw2WZK6BgWaUunXoLPJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue94MDPu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X2kRj1/8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5DA60A262C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5DA60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue94MDPu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2kRj1/8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoIw1462864
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=Ue94MDPu53ssd99b
	5yrNxR81kRUlASxau7HIGQ82RGqSPI5d7tonixUXf8jZVUgM+UXr3Mk7VWP7HiAp
	bQjMHPB2qHXkV15DTPPrWzu75QqVnQqIU4Q9wTkGZz0n+HlCbVTPjPtAS0qQSHF0
	CjP/y7ulOliQZS55vDHv+kg+8Hn+NeR4wq2PF3T5zUFRRetgm22yQJPcnl+GBlTJ
	znDEM9wqc3tGrTDBlRptgMUoLhPiwDFHAeH8VVKU6jrBRAvvgLH/Ir4gBTPAEqgu
	r8E2oqtfqiRxglS5rijqi3XlHKSodiENY8XoNVZvdiYjlfL97iKbLlxVr53Jhqqr
	yWH1vw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so713866eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182248; x=1795787048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=X2kRj1/8W8bs8A9uZEzmykqdQ3wluzJ+O0vlv3B8IbdFHDgPSDLLF0MBQC4SfrcAK2
         ZLfeTmK8kolsaHW7r6u8RXUz1NwjkJsFjLiEtscCCkd0yjAMjslU99DSbdRU/lvJxbdm
         Gb670DWAwLxdEIavBboTYT/D+Y/qkWSn5wbG8syyW26M4eJwEh7Qg0p2o3XYAtWDruE6
         Wbt01pEneLilcspa7+rT6LkxXl3rb2qAzlfvEG144rIHZIwr61Bp2lQ2UW6bQQgMOHcw
         eUq35fapK3Dh4tHwG+edX1/5eK5NtYNN8hB3XNl9zrvK4gguGv1Ee7E57BFrCOHZ4PBY
         pbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182248; x=1795787048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=zhtQLjc143sPKtJto3kD+M5VcugUbp7AggX4oXcu39sT9bzIlp6LvPtyaYfLoqPpPG
         sCFu+ipR6EIYYdzCy4QZ01FdPHsmepjANRRF9hAgBcuCC4xKhevtgDkwGaCOeDCoSSJA
         7U/IiUWfoKB8o9Fn1bnKz6b+Rg+mM2mdittroqjWre84V1suglQukR7SS7NtRM0gRpHs
         jq4swwca+O+6tzeINOUpX+0hwOfShv86j7Iwm4PML84gTqhp4xPjrpFXX/4VAE2CXJhj
         W9RUrC1Y6/cdfloADKl5th/AYI5sFOKASydk8dlKv8KxrtR26ipaohUEl9CJeFkHG9qF
         R+KQ==
X-Forwarded-Encrypted: i=1; AL+hErGftTLz0M6A5KBJqhuqto9Bp8e8K4sYyoGzV+UtNsFQwcuHPkI2HQqCSGH5SKYZ3aE/cKBHpBdC/Nbg@vger.kernel.org
X-Gm-Message-State: APuU4Z/PiRq7DynmS3HvJBKUoscrNsCRQGeWfvfdteuVNiGXEPUAbJwC
	9ClvgRJni7i7qvMKdq6lbuc9f+UXC0imEpy8or86SEwTl8S5J1n+kO802JG2dHIEQ8Ey1RU8L93
	udLAg0wWKF7v0uuRSJtHgHayoHib4x/+/srmvoNTmqx8r5INaat1Uy6AzeWR/LdlR
X-Gm-Gg: AZFdTZca2cVcExeD+o65zrZx82kNSOTVH1BJ/sBH24V5nsSVNYKU/8w9gZbMTp+xR0u
	VPpMrYrvVnZLBzydrfPeIPuVZPafBjhSdALbILO5TIgxl23QC+QsvUaY8TOtmPTxi8AVdikWiBO
	ZiVjjVuBXnK60uZh50zWL2omqeiek8sWCyx8S0DK/jyzVi9aPVwfZxYWrSO+5+6PCAbg37nwuQJ
	WRRIElsHo4KORWdM//mQp8VVDoV4twSNaVef+3acTfn/QSZnhhJyrsS4jB50mneA9NIvy5XaliU
	nloHObqRj10NJZsuMkp6G6axBziTanxJ7aA6sPD3RivITy1m3grPhsKb4gG31bu6RjZM2t1bUgD
	wL+ArDQegoa3p7hp4NNaAm3EJBAFmJ8TTBWDcoJvvFLck0jNZ+ZWlxz9djNlTfSRxvU8oZ1yN3H
	bVSlw=
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4505996eec.17.1795182247725;
        Fri, 20 Nov 2026 05:44:07 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4505955eec.17.1795182246955;
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:50 +0530
Subject: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=q0jAIPDrN516XpqWB22OPyiiHWhPk4OWO4JIauodmt8cg4tveppR8S6ZONPWykogDnxodyD4z
 imV2vWiod2ECCT/tBCJlHc3jWV0NxantFLQIjX5kyP9qJhyjQ92MeCK
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXxB4em3l0kKau
 NPcAQ5NMggVJZr7upVLS0xLgo0xZv/zd3tgqyIydqMEo9VdrpSAge0dlaE+CYm71y6+EUf/INjC
 7Ey/ZuZ0youLtpWUC4MothRIHOwlYnvXVTrhrLvG6a4HiUaXo63Ft1f0tzvQBU89C+eM0ioUco/
 SMhRHzQohyFuOFBolayxBKlvxDPQ6un9cRlhS3flTsqZXGctv6Iif0xfNlpau2Da+9JK5Se6JNX
 RarA8vjCG747BjHzh3u2KzBqPOYhx8Mm9AVspnxUDKgHPQlCxFKSj3r6icBwWy8/ygQC4u+xBSm
 HEaOA1LwXbXINTYM1rgD7j2FewxTn2WqYEEcCObFH0QciLExWZ1qPRW9V3kqEKKj6V1CPoijycL
 PwMoFAfPqKAx1m+YyyUSBe77m/mcCwcCfH812I34xLnhcdMU+5OheZXVWW8WQnNHoHfWdJFq7Ye
 czvb1ZdRqP/kc7W8KCw==
X-Proofpoint-ORIG-GUID: Tx5dw-yvgg5aoPRenjyYXD1oPKehgKIk
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004ea8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Tx5dw-yvgg5aoPRenjyYXD1oPKehgKIk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX98IdwzJgcC/i
 aR4i+s4n3F1YEV8uerkXeWhZGEZLTc4tVGZJC1LfzBgwf4t8TFNXM2VFLl73efdPoEWPwoPMxFe
 KZcExxn25VGrKr/SLBMGkcyr+dg6j28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1

