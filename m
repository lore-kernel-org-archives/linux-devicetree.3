Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182223;
	b=TWuyS9eTqkFy6MiYpXJk/cPTv+yG+tOUCv46A8IayHL6nbP0MoCOuEVH42CpmYerpekh
	 S+fwiRM492Ye+8EoUC+SQFkmV6QuuwRxWmj10Zy/pQuA+i/1Rv1H2PROuYx9ZoIVvBvni
	 Q+rKC5bQpu3S90m3ce5Tq4lYJ3yrMh7mbeoJxPVranZvWafj5dmPR6vvhmwfdzMFBXvMS
	 EHOzxp4ocJ94YITecZXSZuvhLuiSwc261cNgpEdLMK4rrd5zTt85S8mPw05fmVS+jyi4w
	 NQIFWCqNHAIfty82cRt+T0Ec0iX9xB8h9htxua/Ate/DXEqjME2HEiSuU9qMAfpWwQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
	b=nz1L7gUmQ0TFseiZX3x3K1CP4WRYp2+LRUHQZGogF0u9SCXA90DIJSVKIva64iB7XMa+
	 VFPpfeZvI8qQaMPNACSBIawAXVyayVzSmwuqRIp1rwSD73WS3ov7b+g3tLaCzgEne1l05
	 ylJU50sTxxwHUz5mjkx3waJyIqJGjQy4qen/6Du4EZqz+JDt6f0RK38ZMaDfqdgW9eN6k
	 LurJdiokVDICkoBuL1LqoH9YCTF2mgp0uY8+GFMLMoh842V2pxNbfyfBtu8bR/LeOUGDk
	 0ISO0iOG5iF5fwL9Dtuy4y72boWi/1TtayufYNzuAlpLAAmtRQXvNwbtqXt1heBF6jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIFuxn7P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKppiwsj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9360A2608
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B9360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIFuxn7P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKppiwsj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqUx1681886
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=; b=lIFuxn7P2imN2pAV
	Tme6IE7vbrfEh4VBG3ZmY+gFc5Yo3Cts/tO2ovzN0nb5ltc8BSnEVUbt0ooxN1KW
	Uk27FMs72PkvC0YSga7SHh+D+HaiFk9EukiEL6x1A5RLgJk8JZJwmTrUrpNiqZBG
	l/WorKmayiG2h/Tqofq7KpKQJ5jPbFyk1mtFCTlyduL5ifSbwiJ8knGeHg9Uv5uc
	+8n4P+4rVHuLpTI9TGZcChMKyc2msPPAUsfB+2PMXX3fF5aY2WkmdYJyWyF6MDFv
	Z+voFFBeVxuq0upyW5i6ni/nZbVo8uSu/dR2CPb2nFcn2rkWbhFWV/lO3EDsdDdM
	EOKUXQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tqck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so856070eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182221; x=1795787021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=eKppiwsjSKIkWwZ7Sq9sdwXtPNbEcsrWh+0Ui9GY0DZIU7VpGQrVpcG4x3kAZ7Y+zJ
         uj2wMc54pMSiGRJySbB0foRGsRA7p7Py7nRzAxgjQqxS6E4hF8Y2vockiZRYMo2a8fin
         KAXITB2BniF+mwX8J9MsLxvqykIRHqWE83fC2RfMoE8GCoRqmLUdzILZgoaYPXlY/F6A
         rHfu4NwJFDojXexBdgP0Im817H0+rTo+MEQQfM+9Z7vLg7C8Jkll8nOSIZHm9waAlgf1
         5Zd2YigobvqGGczBzXkvPjth+e2R5zDBu7KAHf6tVDX3t+Eq5pyM2/cQIVZA9Cz3WDny
         qvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182221; x=1795787021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=0KPJAbzQM+b44N72YUotFDRRqnW49YVdLuDCYqvqdX5rVLMqhp567Xk0e50Cpg9VdN
         uOYhvWPqhJlFyKQzoFaWUJNeO7TgAcMyFgQ7/wemZqT116cDLy8Fjh4JYF8qaC6idlJU
         AIehgT1nYzC7WjXKk8s12/c2y0Rkc/vAod8r+0kpLc7eF6bfOwcHIuFBFAOcuCzG5Pwo
         XwbL7OzEgD7hn890HqANm/hUtJFI6sr3s/zJQjQlMKHtWJa3MFxSI5WGlvX4APN/sRge
         ZxwPoQrnB6RhKhLp2DjVcRlFr/A9KIBg5978wmw0lK9vPLLmP50GB8WtRsjN+N5c/9IK
         JKoA==
X-Forwarded-Encrypted: i=1; AL+hErESgfiVsrl0vPmAKfi9RTUIZKf38olb8v7UAeXSDG1Aa6v25PZtWZW9ZmoyMP2ypMtU7uDDhielNe2W@vger.kernel.org
X-Gm-Message-State: APuU4Z/xWhaharkUjTpfSMojNtLTdXEAwXHm1l9VGfEtQy63djbqNm2e
	Lbjd4v6O+r4cupWiBmYK/sjcCOry4H4JBbDdK2KNcLZj587o/rw6cqV1Dn/b/pxJGSu4iWIC/O6
	Tlhm2ZV3b2m0ixMO/9VqnAh/VRS7YTlm1e0aM0QugU+eDAU9UFy8bO+OWpM1awCAH
X-Gm-Gg: AYBFou0qSPH+0FaIyumDGbDm27MHjp5TLe3faX0jmobxJDJ7r9qfdKlw9IK9OdIe/g+
	4eiZBPU0LJuuR55QRb4PZlrloG9dRWGAVzCSn8OzbNDDs2uyMuVAlJGE705wyZR+iu4cvGcYw48
	bJnz1/5kB+QBtMtHgXoguOByOxtbhMSf7w+Cjhy0p23ByI662m0PO/FXlRza2uLm0uInfc0JHgp
	7e7Q5NH5LiqfncuLaIcFOpZzpDTtH12E/gKOK+FGUR/LL/51NSKQa6FFM/SjdTyPkdbsTd2TdB5
	yQdRQeyZji2HeVlUUO6MT4XNk2G+Sm9mJJCwYDHCyrVzMPW6RrnKMYA5JxB7QmLD6JU4/H4oYy9
	+Y5KinbIAj1sLQ5aZJzXBn5TdIY/TyLthKjIZ5JG1uFnVKEbCIo036YDS84auKRDEdt5DdrNJ5M
	eUN28=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866844eec.5.1795182221082;
        Fri, 20 Nov 2026 05:43:41 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866785eec.5.1795182220304;
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:45 +0530
Subject: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1038;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=QynpQTC+tS9ewt8cTvKXC0ob9aCwyQ1VtG/dFxw7GR0=;
 b=FZbDUQLy5/rKPk183XwUoaQlvO2xvFMjsoX/3ofTAfk1NBf2M06oyjxOPBXj87iMxDLttr+ro
 Ic+UGssZrIJCSIIiqPnXLE/1eFDIukT1LoV5Yoo2qcSPsdGc//rTOlV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004e8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LWIT_UWqXYlThNCXQxwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: e5u-KquIDRTo1yXobAbJlsCN3AcC8DY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6CDc2vXeVv8h
 gvSr7SrRavln7mXAb2zEZAy9aXrmEa2e0f04DvyTANM9J8zwax3HbeSmUmoMQJFrvhOtNgrsS6u
 K5jCMuU7WnmpF27qfje/D9CT4/C/7ID4b6R4/2zyHVKyxzDu46TPt4R9ja39k4Ln1VgAlcQ8DuK
 V3JL8SUKWvp81OtYvttKgUKOrAfi1zq6DOcKDl/YqqTwF2fQ8yebg9mO8sUOD7qZ6ezo1kmfnUX
 w2GyRiD5qOoYcfo/vGrzU3duggWMaHBt/dItmMjAe7GekOSRAyjG6qQbmza1jb3fH1Bg7Neihwq
 RWTdkPftQHi+E/LSJWHHmRIeCFaeOVzzg81kIWca8CepBzDXkYA0YT2D33bxenZ+h+HGRHeSphH
 Fmdb73hffGP5U0hozEizwpiqA4xgAFMqaZaUpm5kZL7fgubk7DaMEstWh+e1PueqIraII6EPQMT
 Fgi9yGHerQAHXBU7WSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2/K+s3ySIR9l
 wbDFKEF+Z+5P7judlgg8uknT5BKAjbTfVqBHiNdWPAXRz0Fx3i6FsEUFK0Sziue4QSvGb/BzVae
 sE0It4TnWDTkdvOWCJwemyF6QDkuYxc=
X-Proofpoint-ORIG-GUID: e5u-KquIDRTo1yXobAbJlsCN3AcC8DY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..ecd051ecd680 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4413,6 +4413,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

