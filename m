Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551231;
	b=OIbm1nJJYovCcOiI0aBpQonDDdxoJUh9zxLRvYfieWO27E4CFrNP6L9JRxcDxp4nfQfr
	 LVuSZzEZe7zZWJLCr6ENUPT/Mi5NEs5GmZj2T/nl6t/X8BfNccK0Ij+VHmiSVpDxo+qSM
	 Ip0+AigYlcNI5xxs1BezpQdksbxSOsA/oCrVziSrSVGfgBV7axGM+qXM/DGb4am1vvT7c
	 LhB2kaVUYwZO7yGE1DTD+ZyRKRVsDD7g+Wkw+is3Xrt2YMmidWKGo5zjciRLhKlBvRCDp
	 1uyisCwGwSbFT0RHLluquSx8fNoPOJo8SC15oK3xU947lKvKJXz1bv2iYvXYN4y4gCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AlgFrUiA3pOQ3uGH57qpKKGg8XjQji+BQGfvlCSkshY=;
	b=STPpPuui/QpTfEH7ncp5+nT3PXGHwru+6peHo1qrOLaBQN47erD+6jy+f22oUXjeMKhy
	 OOzDna10xZPnc8coqfQCcb4I6OmNTW6a8lG3wGn9ykW6FWTgYWsauA2MX9qs34rXeIF7q
	 GjiMgKeX6G3fO3Q/JiW41mhVwsjzc88iIg6mBI8yIS45j1MYF+TXIhN5q1Q1051JBatdr
	 Z5GANZXithu6WeRcjhAvM3+h/y7Xx26YksbGBKT8H63UZMmWfcbvPCXYymEA8vnLiIe1J
	 NrxWLjSJQmJtEadkOEVy144DSPHb2EWuFbpfQGi99zCs6ugQ+udJEvOdhOLjljBKfFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lmzINXMx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S31CyudU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD01606A33B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD01606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lmzINXMx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S31CyudU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5aosr3147444
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AlgFrUiA3pOQ3uGH57qpKKGg8XjQji+BQGfvlCSkshY=; b=lmzINXMx0AmdeTqv
	TQv9Bx+8GBJzu9iAlM0skxs+1qq7+LEWCvOlL9ykD9RmL9sEo88/DP/5joFs9ezE
	wXbs87mfKQ5JpbFSKE4ELeIeof2IcuaehYkckVnbC3nF4sPEVNIVd0bEwWCVoIBI
	7/0fLqsKf3vpSBqtStS3IRHdZXutEvfRE7fAjIym6CGbP4Je47MEWwMaTZdj+YTq
	KCNdoVR57RcLaiPxN0reGKPCYfyTiONNM3wqMDlc04eqMLjPutJ4r6YQtG3lA0Do
	PJwG5mDB9N2x2EJbNsvKyF8M+IFhr5OAf1KnQLGF41US7z2XcaaNz1PhUDjfz80i
	YSO13A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja85bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:27:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so498475a91.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794551230; x=1795156030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlgFrUiA3pOQ3uGH57qpKKGg8XjQji+BQGfvlCSkshY=;
        b=S31CyudU2BtYAHssNXbWU6WfJ4C5edX1FTBwws9xvxNe3ULba2pgGnmKF95DzzsHtw
         sFCC9r3wO51xRww2KYcYGE1cwlU0wQ48qS4Gd1cWwqUmCbq6mW63UGLXWmG1Y2MyyMUr
         5kFOyRtSG0d3jUIET0w/qSTvYzonTB8Sj/IC2oDFSGf8xu1PwI5KpgIs5a1irkBgz/2V
         kyxLQ4TTOFm06/7Idjue7/cUbd3eyVYyoRFiHX2BIK89PvTp3bcjLbyXzI3Kt/HStjm/
         nD4FktwT0NxlnbX+h53YKS+BqSCQAMqJUpgb5T8U9Uqafg3wYpE1pmHg5ufOnwzH1c4F
         Wyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551230; x=1795156030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlgFrUiA3pOQ3uGH57qpKKGg8XjQji+BQGfvlCSkshY=;
        b=IgpdxSRs5kFjCtqcgs11odCrnayt3YGMJyGLNxQkryOpQekwqVzRHZi0xtIXVXmF88
         nRFYwSTYp9ig1de53oY9yQvzMF5HAbdUiinw3wrP/kAFkDnCBToPAZitmrU7/x6+1hJP
         eDV5STLSIGLKtnKXhS6BRlzrq5Z8s8hguevEJB+JB3F1p3pyZH0OqPcKjYiWprEfOVTX
         G2/bDYJ9+QZol7YG7D0QAY2LcqAVyELiGz3Y+EvVvsnqdac+yWZc8FBPm5IuKU1ghGX1
         3NACPk10Hx3Brs6QhkWuaa3viSZSnCqv+8wuJCTmaWs8U3O8xnn/KXHmI4LpA8VWgnhp
         DoHQ==
X-Forwarded-Encrypted: i=1; AL+hErFjVGh5sBPFTjODTmd0hJsZD0iIlA/+Ouc51jmOYYxMCW0HFY9aZg7tnNHsqizYFm1yQ+H5oLlOOda/@vger.kernel.org
X-Gm-Message-State: APuU4Z+mt5+auY0QTvaFjs42lGaeJS2zBnYL2op1QK7OBHDy2DGRiYwo
	VGTRKjyCYd/X/AEduXHBhv+OBnYKj26tSbpp23C/6mVIwdGqwS21AekMCtGomJi9HDxdS00XLOM
	rk3mvvr8MpCeRZQHyS/PZw73SNdSXZu2yX3y8/yaD3FFX/qvNf3DLMx9ga0AXB9XZ
X-Gm-Gg: AYBFou184T2P1X7aswTE8kUAnEv3qLyLbsf3ZRZRjx8xGOAYDemiVoJw66wcsAsihHr
	rPZo0DT2bqwKBS0sumKe+811A/FBq/YoO/r1oRJiQvQ9QpkSUZ91e/6wTcUQOpDC2v4aXgDt2+5
	9kR22Bcr89bVE0KbdKFE7VXVFzLK+t990bqtbuQG2o83Vncysg0Zc3LxwNuub8/dm0h6SXtG7/D
	ih7ZJiiJwBENVQ5LxtFRRvsZuoBiv72gd5EST8Giyd1TzZyZx3cA6k/qHU73Cs0lh6Y3NGaVeWQ
	e6FG3uib89WRUV3CQpB7BlUdWwczT0fIlHnIvv6nFkcwpz0vzL/girKtVHNbhyg9YrVo9XGkJAP
	UQk8CAcWIHtv/43lVDM45yMSQ7yFULfIwbGBMUDFeqe1TV0xoT53IL7cwvTnrc4ju8/aR0anYvb
	sUBeqrGCXHS8QL9litc2Yq//Z5yV2X86Sq5LHc53jEUT29
X-Received: by 2002:a17:90b:5647:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b1b0a0eafbmr1304902a91.37.1794551229538;
        Thu, 12 Nov 2026 22:27:09 -0800 (PST)
X-Received: by 2002:a17:90b:5647:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b1b0a0eafbmr1304887a91.37.1794551229084;
        Thu, 12 Nov 2026 22:27:09 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm1066615a91.1.2026.11.12.22.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:27:07 -0800 (PST)
Message-ID: <b3125fa1-6a7a-4f87-a7fa-64c42f6b98e2@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:27:02 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] cpufreq: tegra194: move MPIDR read to CPU hotplug
 callback
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261104181521.3003578-1-sumitg@nvidia.com>
 <20261104181521.3003578-2-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261104181521.3003578-2-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: js0Fm3TWSrHGMzhyYsMO3xjIQBmSqNaR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfX/stWeSYOkxRh
 3MzW74bnygqIwOdUSEvkb4TM6LeYB3yQTaJY8d5wnmrjlnChyhBYzeiR7z14EFCiSSaTGS4h4Tb
 V04cuzimuvYtL/BDrD0OQu14/rCaWvY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNSBTYWx0ZWRfX0wPuDQlYPmW+
 QnNGtX67Y1P7VHLHnOQBqZMVyFnnjPrlKX4xLDShLWfEz9XawZxziAtgZnw8dq0glql7Xw9M4Qh
 vFz+n/US8uOSdjVGbyowTm1Az5zMopytEoArbnbatZp9p5GpBroURoRXusFyl4f69wVy748I3zE
 ZgbsY/PCmaVOR6PQGB9b2uCSu1OaFgfcOCZ4eGr8NpcZRgaPHfrh4JmijYnj0l233wDmmzum3jr
 /VbGHCVEaqL8xWBv24/Ay7Ll6TFZMIZZUfyDsY2PFrUQdmvA4vCVlTniURyPsdN/mh+BavD/NQ5
 +ttDcyFAYl49NPYtEj51T2glDaWgPT9PaEwVvxd9rI0yLhNUOfhNiJR7QCBWTc293Sa7/HH3E5n
 hvDb4bj0g7ptKcFB2ycxJH8hIAO1SjTeaGDtljoP9ZMWMXFdafj0MmzU1ridvCBRN8vsx91i3Cd
 qr/4vyrGM5M9dd5mE/w==
X-Proofpoint-ORIG-GUID: js0Fm3TWSrHGMzhyYsMO3xjIQBmSqNaR
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6adbe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=YW4SVfrvFGduW5-3T3kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130025

On 11/5/2026 2:15 AM, Sumit Gupta wrote:
> At probe the driver reads the MPIDR of every possible CPU with
> smp_call_function_single(). For a CPU that is offline at boot, the call
> fails and the error is ignored, so the CPU's core and cluster IDs come
> from an uninitialised variable.
> 
> Read MPIDR from a CPU-hotplug online callback instead, which runs on the
> target CPU and caches its core and cluster IDs and MMIO scratch address.
> This covers CPUs online at probe and CPUs onlined later.
> 
> The check that the SoC data covers all CPUs moves to probe, against
> nr_cpu_ids. A CPU whose MPIDR does not fit the SoC data gets no scratch
> address, and its NDIV access is skipped.
> 
> Fixes: 6b121b4cf7e1 ("cpufreq: tegra194: save CPU data to avoid repeated SMP calls")
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>   drivers/cpufreq/tegra194-cpufreq.c | 114 ++++++++++++++++++++---------
>   1 file changed, 79 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index 1eb96e9f3310..be81ffd23edd 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/cpu.h>
>   #include <linux/cpufreq.h>
> +#include <linux/cpuhotplug.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> @@ -13,7 +14,7 @@
>   #include <linux/slab.h>
>   #include <linux/units.h>
>   
> -#include <asm/smp_plat.h>
> +#include <asm/cputype.h>
>   
>   #include <soc/tegra/bpmp.h>
>   #include <soc/tegra/bpmp-abi.h>
> @@ -77,6 +78,8 @@ struct tegra194_cpufreq_data {
>   	const struct tegra_cpufreq_soc *soc;
>   	bool icc_dram_bw_scaling;
>   	struct tegra_cpu_data *cpu_data;
> +	enum cpuhp_state cpuhp_state;
> +	struct hlist_node cpuhp_node;
>   };
>   
>   static struct workqueue_struct *read_counters_wq;
> @@ -113,7 +116,7 @@ static void tegra234_get_cpu_cluster_id(u32 cpu, u32 *cpuid, u32 *clusterid)
>   {
>   	u64 mpidr;
>   
> -	smp_call_function_single(cpu, tegra_get_cpu_mpidr, &mpidr, true);
> +	tegra_get_cpu_mpidr(&mpidr);
>   
>   	if (cpuid)
>   		*cpuid = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> @@ -121,11 +124,44 @@ static void tegra234_get_cpu_cluster_id(u32 cpu, u32 *cpuid, u32 *clusterid)
>   		*clusterid = MPIDR_AFFINITY_LEVEL(mpidr, 2);
>   }
>   
> +static int tegra_cpufreq_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct tegra194_cpufreq_data *data;
> +	u32 cpuid, clusterid;
> +
> +	data = hlist_entry(node, struct tegra194_cpufreq_data, cpuhp_node);
> +
> +	data->soc->ops->get_cpu_cluster_id(cpu, &cpuid, &clusterid);
> +
> +	data->cpu_data[cpu].cpuid = cpuid;
> +	data->cpu_data[cpu].clusterid = clusterid;
> +
> +	/* Derive per-core register address only when ccplex MMIO is mapped. */
> +	if (data->regs) {
> +		if (clusterid >= data->soc->num_clusters ||
> +		    cpuid >= data->soc->maxcpus_per_cluster) {
> +			pr_warn_once("cpufreq: cpu%u: bad MPIDR (cluster %u, core %u)\n",
> +				     cpu, clusterid, cpuid);
> +		} else {
> +			u32 index = clusterid * data->soc->maxcpus_per_cluster + cpuid;
> +
> +			data->cpu_data[cpu].freq_core_reg =
> +				SCRATCH_FREQ_CORE_REG(data, index);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int tegra234_get_cpu_ndiv(u32 cpu, u32 cpuid, u32 clusterid, u64 *ndiv)
>   {
>   	struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
> +	void __iomem *reg = data->cpu_data[cpu].freq_core_reg;
> +
> +	if (!reg)
> +		return -EINVAL;
>   
> -	*ndiv = readl(data->cpu_data[cpu].freq_core_reg) & NDIV_MASK;
> +	*ndiv = readl(reg) & NDIV_MASK;
>   
>   	return 0;
>   }
> @@ -135,8 +171,12 @@ static void tegra234_set_cpu_ndiv(struct cpufreq_policy *policy, u64 ndiv)
>   	struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
>   	u32 cpu;
>   
> -	for_each_cpu(cpu, policy->cpus)
> -		writel(ndiv, data->cpu_data[cpu].freq_core_reg);
> +	for_each_cpu(cpu, policy->cpus) {
> +		void __iomem *reg = data->cpu_data[cpu].freq_core_reg;
> +
> +		if (reg)
> +			writel(ndiv, reg);
> +	}
>   }
>   
>   /*
> @@ -208,7 +248,7 @@ static void tegra194_get_cpu_cluster_id(u32 cpu, u32 *cpuid, u32 *clusterid)
>   {
>   	u64 mpidr;
>   
> -	smp_call_function_single(cpu, tegra_get_cpu_mpidr, &mpidr, true);
> +	tegra_get_cpu_mpidr(&mpidr);

.get_cpu_cluster_id() now reads the local MPIDR, so the cpu argument is
ignored. Could it be dropped?



-- 
Thx and BRs,
Zhongqiu Han
