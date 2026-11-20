Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172858;
	b=MN4RCKiqtYZboh5rLLQkGD3D3bakVwndEA00mUGLTWnoaKzDMOaG6UVDSJOenhJPHNaa
	 904XtqcGO3kNd1z4E+B3nNQrDbWid+CaFd9/uM52a43bYQitNn6kdKdplXK4vJo1eqNKf
	 /g8LjGX+A6AWnEV3pnwMFjx+Fi445lH/Do/QDPp7AsH95WxlztrDGd5VEYHiEzljfxb3M
	 Krvcbqfw+Enu2gwRKyHembZJ3QMYOmFTnkuvmdWMMoMzEt0ixv2oeeTNaEszcV0ICyist
	 TKIZZU3usBwBrJbtI+LpeaN/I+avXsm50Xdd9GhxyVGhtj3HmWIRv/YLL8fq3rVn8Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
	b=VB69rXiIC4X0Rht6nh5IvnAxaPwYAUWuXFh330lsdycyajsLqT8NJAeV0UqsbNWIcuel
	 dYtDiU8z37YvGNhLhZsf0ScXHCJt8wZ+/eEZUfXe3QNLshDwZ3XaVCVRWkYzyr0ff6LmH
	 EpSzieImbZZvDmwrcGQ/kYiRI58oYZGbnNZcHIe0iPkINwwDuAQT8DWX5Nx4sL3odL8Z+
	 xV3MDFZSNnDMk0HFrrV4Dhms2OYdu3yB06xlgUe2PqI1B/UNfhd+rbX6mzPFQyjmw18kJ
	 Q/aTiuleNKqS6GR4dk9DW55SX687z7CZdZQ7YzfPct45m9Z6zHsUUNDVgpLJGWa0yNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GTksC/Y0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cgTeMHV5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BCF60A3824
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BCF60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GTksC/Y0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cgTeMHV5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjsrq1681944
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=GTksC/Y0bKEnnPw9
	KWJMW/0LYKMseO9DPrOptuVo0CoIc1uzdDo/pGQvMUvP1Rvp9itBe4lxfI3YMrct
	hNlUsrpyWDkLVM2AharxTeVzkRw2n9VB/DT4wadGuvHh9b+NKRCRxql7pH7v2UhZ
	mZqqLkNFSwVCnkJYQ6l8xhsR0o3nVGXsD3cWmPJPdqWEiU2pL/iofmYDa+RErjze
	zIL/ZkJld/6+cX3JmMILKva6+SUTpEUn37O/cx2tHijkn57y5K4Vh1GkIqNzw/gV
	9xhyY7hbI1jHiKlk+CMPcKlAgvmcpMCyomuwfUhrzj4E/euJmn6bzVJ0PBKLPI4y
	D6Il1A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t3wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078698eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172857; x=1795777657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=cgTeMHV5uXmGkb3t05ajSI9lp6sTHFBEVAnoz17x57ol+B697LyK5pmS4/x0Sy1K4k
         kMcgpZhxylEgNT5hCjabkN3oREPhbLONawMN4WVYWperhoGPgyhEGSEAp0262jH+S2Sr
         QKia+9xVYQTxZI/2wkGbJbo8BQ6z5CNHdc89P+USgH9eVbpq2QuMb89Yck3u7TayUgts
         HGeePLLOqllL9RYGWuIkt1c8wJgQEz5Hl+/AJlEbOALYkhzau+MtLKIVJYI5OoHwns2y
         1cIHoM8Rrm4Nn1iEKKxC84YBtoNlreOGARxjwVOuAPbt2HIx1kCLas6cTC8axXAmVzdh
         2B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172857; x=1795777657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=iyaWpQobLN1+PIleH/xxB2MHppuOFwE2OC7cuAB2carnWMQPRDZjbJ3USb2rEVSiYZ
         l2MwSpSEAfOs+81cutvzBjlupqu/eDh70dg8ufXxGgE07xCDwK3TZgbUCKq+u65bLPaF
         sv4dIDTNAiawXoDOzu7Ks8e544P3QkiCe2LgxK8r5fusOWA8WgoowutTuH7RyRN6DR0X
         8c8FT9vhESgvG9ZQAv+6s2znEtwVOvIbcxEM1BX1/Wyxi4z1nfYTxbdUKvrqj93ioU7n
         qQIcY5C591CcS4/6YriLBn3/wgiCeE5aoePoSkX5qVRb39hE+oOdUTItNcih7t34zfst
         tE9w==
X-Forwarded-Encrypted: i=1; AL+hErG/66f3dcVIb9NxpKC6L0Lx/QbJht14g9Lz3f73io4L+24gsvoy/tf7NaszY0ZhJPv/P/L3pB8VBJXD@vger.kernel.org
X-Gm-Message-State: APuU4Z+DX1XiIaia9Zyts7XzS6cVNzbx/WMyG821eDV0wSUHV4Xxto1U
	JPUE/aTcUofUarfEMIUOLxa8f5tjr5V2fxf9uwadnpGMfme7fzqEiPZ1kaCFP0vj+OfSQzz6/xP
	5vmU55K4XZw6T92bznrAx/v/7fJaffkYr91rqAsWFvFG295Dvwa1Gx8Klo1H18zih
X-Gm-Gg: AZFdTZfFDjjPJDQSbBoglrnRnY5YumxgnkGK9ojEuJrbnv/e/XEdxJr99n3lCl19foy
	JR+ahrD4tv2g6k0xfMRgzi09qBC2zPyiQqptI+yzqeLtLr/+6I+lfarjw3eZZH6VsN01riHK02P
	p+7V2BQT8yhM/lPTNNj4nAzs7mHpCi1OfU5CA3d8ubF6XSRGrzaihOlco/VqngEltdKNIPadnie
	jovhEOPhGhUlNoNsXB0jmNziIsZCcqAyseR2VjJuy+29fMjHQk4eKt/GgzE2jN/eRmkrijtlKxI
	YDJJnGW4F6i9bpl/Db1/WnYTtEua0DcpViXyIzF2AMwgB8nz2oEuVg1w03+qiiAvl2B+6OIrbVs
	eZc5hnaMsJJEdbE10eesxHwOChcXFCdBJXqtTSJiayvheGED+5KeEQ+4eQscDaWOO/dEncMj9sn
	FWv1Fs
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356050eec.36.1795172856940;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356002eec.36.1795172856199;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:35 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:50 +0530
Subject: [PATCH v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-9-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=KzrRMDQ38ir/SxKkvx+iCgru1CcWgzgR7RMiwJB8A/IB8fNZyYJbRgu2266qsmg84BVFLa9od
 DKvONyqaL8uDPLBnrRXftBGgOY2FyIAJWqfqhcL2OUH4V1i97q6YVJG
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0029f9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Wl0g2O_L6XGHHuIlLKpC4HBwR6iDT64L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8ztX4AoveJtg
 ieCDGNtmn5n6Ja50wgSjBKIn0zfU8W6A+dyaHsR1YSeiV8uACp+GYagA97xj6kKl9w3yOQiHWzy
 TXABPccHzudizPOEhpysWIQMe0jkOW3AT+Gf8IozDqy7sX6yM7EGdvsSJ+YKX0CZotWE9oJlaQQ
 LDopObaVGKwFS9BuRRApJBZM+N55b6aczg1DGu7q7Fsiy9PVMXjKES7RxKdczrrPjywkUqVSunz
 9cD82zVjUD6R9Rt9FwovhlMO5PPQuOhff/6rj7GjZpkTZ9kqm4mncJrlmPSzrUdJ5Y3XmbBuclp
 vIL+eiOEzNz0ia2xEq+Irwt9257/seTsw628mwa3VQt7id5Hah7qTWD1I0hIiOV6QPeqhrcngIV
 w+9BP+dQIxhMPgNgD26izOCoLRHWwhkSkhIy3l+zR4IJDOmuBVfkcbQkrw3I7s3h25VQyPvFZWS
 QF4H5A/3RBEXZiFs13A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXwvu+iaDAdmg5
 0WVFwSFzXOIJ0LzVGXqQqls/ySXqXdQ4yo6DpflDgOk2qYkCBpSkCzZK2rjiEwNIYAsy32u1egF
 Ii+xVXj6ujKQg82x9kvP1cTSqQuqO+c=
X-Proofpoint-ORIG-GUID: Wl0g2O_L6XGHHuIlLKpC4HBwR6iDT64L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7b9966e8fd4d..4edcb06dbae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2566,6 +2566,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

