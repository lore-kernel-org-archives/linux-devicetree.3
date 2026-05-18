Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06A19ABC6
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070153; cv=none; b=pzgTaKhKlN3gdwkg6QMgB+vyaM5AXTIvuCcQ8djkrk03DMXdjI2Te4xpNfZYP8yUqGhMal+vBjxv/Z54n5Nh26excJgHPBrtSZF4IN6Xa1XqtCKkv5wKKOB/Nnkjd/PDWVLqjCFghOmW3xVfBSw0JYDPsLlYDsjos4zTWLbKEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070153; c=relaxed/simple;
	bh=4qMlsWlkDwj1nvMcia+ORhDpe0OjOkalDC7scrpZ8sY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uka3I+gjyrXfo/u550BWXef8d4Fd87Y9MamEWd8JdjAvq1WyVJYJUhTHCYivqz48Z83uD8iIvFbBQi2Xjo0I0xzlHQVXuGd8QWGqJxi/Ph6aWj1ftqa8XOYCYs6rfGOs2923wNTV6sSwV/El8YZsIF9m8sv9lRtWyPlw8wiFzH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAeR5QuV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM+1HldX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAeR5QuV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM+1HldX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HLIbwx723619
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBxCeS4UhYXdkEEOJJe+jREWH7FHYalAxf7bqVMHYsU=; b=jAeR5QuV/ZI24Teo
	nJEW36epdhKVxF4TUto7l1oiubRAJD+3uAAKhkdQOEmuf88Gq9dySTJ1tbs7wVaM
	S0+svYGPY/JNgQtTjkfiPd6ICkp++k5qkYd4+NYXBmoIu1dsgCO/kUlKI3fSJBlu
	oh03tO1UOiJySpnEXOl5nsyflNm69qrBVOFkast/MwCBnibpZsBiWcmYDWjtkhkc
	1gjdGiEg3TDCNgen/GhB/3uRS7G1iYu0Un4+pImn4I4Cy8U3G339une7FzxDT7NI
	gt4tAJYDz2SvUVsWerA78a2KpSWo5Flnks+VgaM9rxYsi+2OBtm+FfWqt7EL7R/U
	VKxaRw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qc377-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:09:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so925506b3a.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779070149; x=1779674949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VBxCeS4UhYXdkEEOJJe+jREWH7FHYalAxf7bqVMHYsU=;
        b=QM+1HldXaG5GJjctLUOs/yRZYcMfUXF2Py8tzz8RNl1NjwkdgNFV0QwaCbS/KqSyNR
         05ZkwWtwKlvkOMsQ7HltCt6sM9/ykOKamSjr8hydjyAM1Mgere89k2wAEeRG4HJUo1TI
         4sdYnKh/pnz0J1Iqimk/7/U8OEgzes6ofsIuznITQJ8FGTTwkVHrH8UNoLLcjamivBeg
         adiNAmCv1ppSR9p8d0yg7ArHfqX+/8Uq4OzudEmkK0UN75UrNtkxIllpL8UBe0R/dx0B
         H5kqn909SaDY1byME1JHIEHsUxCBs0mXBB1J5I4l1VBYzj+HCDrHvmW3CmbiGssw3oJb
         o/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779070149; x=1779674949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBxCeS4UhYXdkEEOJJe+jREWH7FHYalAxf7bqVMHYsU=;
        b=DHQzjne/46Hw0dO8xoN+qt0basNAv+MqpkL7gmKmXj5agJTLVJzT1eziaOAP2QuRYy
         76yPGvECXDSHMnMDRlzcx/ilBXsMjljpmfFA/hFAASjJfey01GT0PiU0A1DtmzbP5e4A
         UrtxAUcbrgFfL7ZZpGDNHm7AILcxHc2yB1KFsB3MYuKIqSmd894KFEb617PGQn3cYlWP
         HQ/DxS+pbfzO690oL7KqYK2Vf4ylQxz7p2LrcUMfm59WyI6yztnHyHoY7p18dpQmY2pv
         Q/N7GNa0aDtJldiDefS5npNjTc91Th4/gXE4Zpa7wWQTsOiVL6CAtUeigd1Lt9v7EWwt
         VPIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kOu0k1gGfQsU48VqJPfzIMcuOkdCaOOrYPqBVx7z/7iWZTPILlaJOvFFFm0MDDgR4hJIGDa8rcUd6@vger.kernel.org
X-Gm-Message-State: AOJu0YzyXoLVQ90oxjumLbO5zI66mgQHuR/50XLHzZAB1/d/3jvvdHi8
	FKFnyyczRNydoTNqE1yetWPcmfs8P4Y+V7Oy2mK+eWrVqHNyld895tB0UYHYcnXK2GIXBgu9zkL
	611gi6p3+4ghpViIN2mScTRjZ37v0ceTbbeNDG2p/iIg4ru3+RD3b4ewcNw4XxK7B
X-Gm-Gg: Acq92OEj6BXncJfBfPAkWdqA16Jb3HKj17UIO3GtxcZ6KrIFV7UdYaH0rV7uXzCZVep
	Vd/d82E6qZ8cWTau3oGKw+nbYrdgjkbDMabPrq12n/8wHZYA8xt+gZB8CosjhQJBuQ1BIemIcQo
	mlV47v9ZDdolmN4KQjOA/pOUuG98Lp4/5aQefhQADamDasc1iwO3BJ/eAqOYw/QawmvoGRH98BG
	XA7Mdz4lEnxmb5cxYO0tAa9UjF7486xn/MwOv3DfvfugZPilekTjB9Iob4ynJMuEfC6KHMuN+4U
	6E7m6jMBytY8X/vlVhjw0aNedq5KY7yxTMUb2rsXFVDX88AwkmNG5phomjf9yrbbCiZTo1YgxfQ
	WD+IU8izzKiWZRjSk5HpX8nJSUofQ0AXqNh4BgjaJ3BgWy4nAO5NglaPS9lKWEpHKPnJ7kbQKPi
	iDZdOypG3qBw==
X-Received: by 2002:a05:6a00:4191:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-83f33ba0afcmr13470188b3a.8.1779070148469;
        Sun, 17 May 2026 19:09:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4191:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-83f33ba0afcmr13470158b3a.8.1779070147892;
        Sun, 17 May 2026 19:09:07 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7c74fsm14867034b3a.49.2026.05.17.19.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 19:09:07 -0700 (PDT)
Message-ID: <08fc1b02-50a4-4ba3-9588-24d0a9d7d039@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:09:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur: add coresight nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260515-add-coresight-nodes-for-glymur-v3-1-83ab39db275d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260515-add-coresight-nodes-for-glymur-v3-1-83ab39db275d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ncO5jHmsex_NdWT_Z5iyMzcwEG49k_-H
X-Proofpoint-GUID: ncO5jHmsex_NdWT_Z5iyMzcwEG49k_-H
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0a74c5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=58TwSzCvQm6xR8B2D8cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAxOSBTYWx0ZWRfX3ytIbUbFgqu2
 ztFiIVtuyILPlAbhJpggYfu1Q2F2RRp4irPih9Wrsj2ojvFFJ+0qcsuNU2XhqvYngZjBYS6aCPd
 K9VDMBBUnvBYs+v/FQ5NOTE+T5/+jGWXs8BDzqOwxpAWV+irvsHcSB3FRhh4bfoqAu9US7bL0AK
 0/iC+u4R3iTEnJ/JXBxn5J1gZYs8DALPjU1zkeWJa/LmyNVgo8H1JCZW9k3+FRUdFt77ZLmI233
 gQUE5wXJWK1l5tohS07FDklsx45KrFfF47tmb+6mBcKQ1D26on76R395xeAXTOXprhdxz7PIRFX
 kE6AyJRAcILykfWSUw2d20Y0ZB7TnS6PVxpti0iaqxgGlV3QCKpcTX1dLD+JtTYOW6qqfCmg90e
 8RfpYo9F/WXNO6qBAjQ44TgEf9aHMlLCq3VolU4K87X9IiEfZMK0J1Aip4oAwuB1uhCdJmakEuJ
 SbWz/e8erWgHTPFj7DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180019



On 5/15/2026 4:11 PM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
> on Mahua device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +
> +		tn@11200000  {
> +			compatible = "qcom,coresight-tnoc", "arm,primecell";
> +			reg = <0x0 0x11200000 0x0 0x4200>;

Made a mistake here, the MMIO size should be 0x3c00 for the traceNoC 
device on Glymur platform. Will send a new version to fix it.

Sorry for the mistake.

Thanks,
Jie

> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					tn_ag_in6: endpoint {
> +						remote-endpoint = <&mm_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <0x10>;
> +
> +					tn_ag_in16: endpoint {
> +						remote-endpoint = <&east_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@21 {
> +					reg = <0x21>;
> +
> +					tn_ag_in33: endpoint {
> +						remote-endpoint = <&west_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@23 {
> +					reg = <0x23>;
> +
> +					tn_ag_in35: endpoint {
> +						remote-endpoint = <&qm_tpdm_out>;
> +					};
> +				};
> +
> +				port@24 {
> +					reg = <0x24>;
> +
> +					tn_ag_in36: endpoint {
> +						remote-endpoint = <&gcc_tpdm_out>;
> +					};
> +				};
> +
> +				port@32 {
> +					reg = <0x32>;
> +
> +					tn_ag_in50: endpoint {
> +						remote-endpoint = <&pcie_rscc_tpda_out>;
> +					};
> +				};
> +
> +				port@35 {
> +					reg = <0x35>;
> +
> +					tn_ag_in53: endpoint {
> +						remote-endpoint = <&cdsp_funnel_out>;
> +					};
> +				};
> +
> +				port@3f {
> +					reg = <0x3f>;
> +
> +					tn_ag_in63: endpoint {
> +						remote-endpoint = <&center_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@40 {
> +					reg = <0x40>;
> +
> +					tn_ag_in64: endpoint {
> +						remote-endpoint = <&ipcc_cmb_tpdm_out>;
> +					};
> +				};
> +
> +				port@41 {
> +					reg = <0x41>;
> +
> +					tn_ag_in65: endpoint {
> +						remote-endpoint = <&qrng_tpdm_out>;
> +					};
> +				};
> +
> +				port@42 {
> +					reg = <0x42>;
> +
> +					tn_ag_in66: endpoint {
> +						remote-endpoint = <&pmu_tpdm_out>;
> +					};
> +				};
> +
> +				port@43 {
> +					reg = <0x43>;
> +
> +					tn_ag_in67: endpoint {
> +						remote-endpoint = <&rdpm_west_cmb0_tpdm_out>;
> +					};
> +				};
> +
> +				port@44 {
> +					reg = <0x44>;
> +
> +					tn_ag_in68: endpoint {
> +						remote-endpoint = <&rdpm_west_cmb1_tpdm_out>;
> +					};
> +				};
> +
> +				port@45 {
> +					reg = <0x45>;
> +
> +					tn_ag_in69: endpoint {
> +						remote-endpoint = <&rdpm_west_cmb2_tpdm_out>;
> +					};
> +				};
> +
> +				port@4b {
> +					reg = <0x4b>;
> +
> +					tn_ag_in75: endpoint {
> +						remote-endpoint = <&south_dsb2_tpdm_out>;
> +					};
> +				};
> +
> +				port@52 {
> +					reg = <0x52>;
> +
> +					tn_ag_in82: endpoint {
> +						remote-endpoint = <&south_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@53 {
> +					reg = <0x53>;
> +
> +					tn_ag_in83: endpoint {
> +						remote-endpoint = <&center_dsb1_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tn_ag_out: endpoint {
> +						remote-endpoint = <&funnel0_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11207000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11207000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mm_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1120b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1120b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					east_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11213000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11213000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					west_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in33>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11219000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11219000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					center_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in63>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ipcc_cmb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in64>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					qrng_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in65>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					pmu_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in66>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					rdpm_west_cmb0_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in67>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					rdpm_west_cmb1_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in68>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					rdpm_west_cmb2_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in69>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11220000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11220000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					center_dsb1_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in83>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11224000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11224000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					south_dsb2_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in75>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11228000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11228000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					south_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in82>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11470000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11470000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					pcie_rscc_tpdm_out: endpoint {
> +						remote-endpoint = <&pcie_rscc_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@11471000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x11471000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					pcie_rscc_tpda_in0: endpoint {
> +						remote-endpoint = <&pcie_rscc_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					pcie_rscc_tpda_out: endpoint {
> +						remote-endpoint = <&tn_ag_in50>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c03000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c03000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio4_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@11c04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x11c04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					aoss_funnel_in5: endpoint {
> +						remote-endpoint = <&aoss_tpda_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					aoss_funnel_in6: endpoint {
> +						remote-endpoint = <&funnel0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_funnel_out: endpoint {
> +						remote-endpoint = <&etf0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc_etf: tmc@11c05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x11c05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					etf0_in: endpoint {
> +						remote-endpoint = <&aoss_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etf0_out: endpoint {
> +						remote-endpoint = <&swao_rep_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@11c06000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x11c06000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					swao_rep_in: endpoint {
> +						remote-endpoint = <&etf0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					swao_rep_out1: endpoint {
> +						remote-endpoint = <&eud_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@11c08000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x11c08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					aoss_tpda_in0: endpoint {
> +						remote-endpoint = <&swao_prio0_tpdm_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					aoss_tpda_in1: endpoint {
> +						remote-endpoint = <&swao_prio1_tpdm_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					aoss_tpda_in2: endpoint {
> +						remote-endpoint = <&swao_prio2_tpdm_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					aoss_tpda_in3: endpoint {
> +						remote-endpoint = <&swao_prio3_tpdm_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					aoss_tpda_in4: endpoint {
> +						remote-endpoint = <&swao_prio4_tpdm_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					aoss_tpda_in5: endpoint {
> +						remote-endpoint = <&swao_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_tpda_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c09000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio0_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio1_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio2_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio3_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in5>;
> +					};
> +				};
> +			};
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,glymur-smmu-500",
>   				     "qcom,smmu-500",
> @@ -7132,4 +8173,60 @@ gpuss-1-critical {
>   			};
>   		};
>   	};
> +
> +	tpdm-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_llm_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_llm2_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-cmsr {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +		qcom,dsb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_cmsr_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-cmsr2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +		qcom,dsb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_cmsr2_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in4>;
> +				};
> +			};
> +		};
> +	};
>   };
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index 990a02c6afc1..22822b6b2e8b 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -21,6 +21,7 @@
>   /delete-node/ &cpu_pd15;
>   /delete-node/ &cpu_pd16;
>   /delete-node/ &cpu_pd17;
> +/delete-node/ &cti_wpss;
>   /delete-node/ &thermal_aoss_6;
>   /delete-node/ &thermal_aoss_7;
>   /delete-node/ &thermal_cpu_2_0_0;
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260515-add-coresight-nodes-for-glymur-49045aa9ede8
> 
> Best regards,

