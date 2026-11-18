Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973655;
	b=fKuq7MWHQCSlM3JKsN7yreXjhTigMLVSA5Prjhel+V+En4yv/PKZd3n4fX5H10CnmoKj
	 P/TlkU1qa4UYZatksiGNEF2zQNR785RZSPfwT2g2OUmBd8DQrKRC4foynxWRv9G1cbUqc
	 z5Fwbam7MBacxYdxPX61hIonZ3W5PEqON66xmP5HIPTuBvOvX7mpfS3ufyxVNggfHcJBc
	 gZL02CcVte7iZ424dZ3f1FSGvgqjVQOzu2Ac7+NlPDrb1taw8l3zG/Ru+uXcQMpUKU1tF
	 LEKFVLPKu0SAa9+CjkXxhNH6qvPNPz7CJ99KcTc5ukDl5GbTMH05x9VKRYb+dr47Qqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
	b=DrPmuGUDLg130sRV8CiHRptTRCheF0WUdebkuJsw9Cmtu/h9PfWprqa5JVPdidf/yf9b
	 wZBV6kz9AEo8/xAabIRb0WzFIO61gPW+HDR4FHy27TUdk+D0CvmGVNJ1d5WScHadsJyNZ
	 ABgwOh8EWkggBR8MOLKxufdDE4pfk+HxcJP+XuKF10v3SfWvUvr4fr2IABP11t/OzOJWh
	 Q56cAA2Zs/bC2nchrIu5ELzmRlwotIjXQgcmJ9mDrYcQWftN0FLaod8kAyv/qdmc6D85b
	 Ms3faHlWFfDz7Z6sLbqALov5TW0C73JmAIRjWBrc97OGvrK9N80Jyi2PBQouX+5Keqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URdO5GDu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuGOEOMn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1713606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1713606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URdO5GDu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuGOEOMn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvDH4059972
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=; b=URdO5GDumrbt7yQi
	t45ph71r36BGnxp4xR6UAasTVy+UyOXBD2UD+McP94p1qiI2LXt7+njAIdrVvR/r
	DWGGlXx4eMfHepT/zs/FXi1HQ9y8m2DGmIBZnKQVdWesbwvKIybwUrfO5NeJ/w/J
	47RwzofSmx/Qz0cxhFOzP/2kIEviNsxu4C6x7CadeUanaQZzdKkK2Fl8n7OJl6aD
	T5sqkCYbC/QhnJBb3pHute4G8Yh7F2/Xr53abuIXLQetzpCyJZyLsQuur9AW/KN/
	qkGrzHqmPMwzQC3vA+KevsSWJGvE1DEplBiDf6nzziTswmeOaODFjJBppY0al+L7
	BXSiQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvch2tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:47:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so643548a91.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794973653; x=1795578453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
        b=NuGOEOMnTZcVlrXyoF2+B4DqmvSA+y3upE8mnAhcwNFO8pcrb+HfNj+yNJstPIU53Y
         UOoH11REDeIismjafSNl0JLM33SFhT/ixSZ0yN70XZdFXTKl5i7ixtBgGwz67iAQodsK
         FaNqGDgOaFRMZ0qKNOPybEGEcICSXlFa2dfPmeFHXC6/gaaGwTUsuhc7SOn0mhFVxowE
         SU8njdvNbBQxYW5xmYmAedKWZwACGzTI21QX49nHoZCDRrwQyR8LLq4wph6AdPG8osma
         NuH5qkkN7ikezFclLT3mPfLqx2CJx012CBLcSHnq2riiYUV0v+aQ6W2MSIFsi1SjYW5S
         wMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973653; x=1795578453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
        b=UE5YFdJMSIH+iVtR8UT9E7YFZDoc4Jmf2G3v2s5vMxL8q21BZCsuFyfTf6NzH4zUiR
         lSmrHDfOjXDUPz8Ucoy4OylNOy2j6TrkWO+efGW250ck3/PRZQ0lhGk1oCf6yb752mo7
         KKr1r8H339XZeRTOqImmyvfdFw2hNvyFyhWZ8dODTo0RY4yWPOI9qmWilMCALoM/g+GC
         YFKHEgVc02Vuuiocl337kWDXAMD8IsNDqOzblYs6t4Jh2WcoVJXjIJXB1g6fDH0cR3W2
         xjPfhkCLPv6WYczS6jP91i1ViLAKXunlXxz4ZfoJMEBeQgDl1cmYEwRC224JzIEzLm+u
         wQgQ==
X-Forwarded-Encrypted: i=1; AL+hErGbVw01s7RSFp65Lbb/5+xUq7v0GKvfV0uJJNPAO67Cf4D1bh5j0TpgMMRD+lJ2mi/B42ikzFeKcgCQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9oeMiApxWrX4waKwgEQoinY083melDNupgbiGNG7OKLpEdtWB2
	p1XCVLvzzDN6qfH5GSDyRPz4IzuR+n/twOM9dCqBqmJnPqFbmMHUbN3AZYqRTlSODY2dA75cezz
	FJJCxu4OYTSh5zcm0k9JfhZkWjEYf+XZor92SI5UZHaT4yNECkhsu0lnfaEAonbrH
X-Gm-Gg: AZFdTZedCEVxwUsCnFvKT0CCB1YqKRVDf8xF/BLsgP6Qsoy0Y7GfnA/sGcnL3zDsnfN
	Sqg4tzz36XAe9TPcPNC3myrFYz2Iv5wt1IEJW0s1ZS6OYeCupUSIyebBHKHqIyvzoN1fMU3KKvT
	n/a+E4nXPPWXNzwd1KqOmtdBewDliWjnP2cVKtzMHz3P6NqvBe8cewpTOvr0i9FPdXxY1PbKvmx
	HWNCuJrF/7nHobA6OIBjO2JRJclccuSE3D9qqqsfHxuVMbIv1aAomR6EVJDRrLs0gpXZ7zsOEfw
	Dh1JA07rMXwkO943MS/EnfqG3RPbEGKg0gcIUzu/ubb3Plt2ZKWE44azIpoZhdAtJn5kL6UawGK
	2LZBgzGu4oieGSSEyIW7briHljNrZa9aUiBatTfvR4ONUczNsGp5eaSW0MptihvdGLqcbdARoYH
	N6m3s6h9W6IUxcEudO9tT7nlsfju9jCCtJWc9Whinx02Q=
X-Received: by 2002:a17:90b:2684:b0:3b3:b71e:b2ef with SMTP id 98e67ed59e1d1-3b3d07c83f9mr1488927a91.50.1794973652564;
        Tue, 17 Nov 2026 19:47:32 -0800 (PST)
X-Received: by 2002:a17:90b:2684:b0:3b3:b71e:b2ef with SMTP id 98e67ed59e1d1-3b3d07c83f9mr1488907a91.50.1794973652066;
        Tue, 17 Nov 2026 19:47:32 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm2003736a91.6.2026.11.17.19.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:47:31 -0800 (PST)
Message-ID: <6452ab41-2d7c-4995-9f6f-1e8207767cdb@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:47:27 +0800
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
Subject: Re: [PATCH v2 8/9] cpufreq: tegra194: Add support for Tegra264
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261117154954.625126-1-sumitg@nvidia.com>
 <20261117154954.625126-9-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261117154954.625126-9-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd1fd5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=jyGxVx0bnOFcdHMOUhQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _Hvg9ppWO5tkjTWx5ciFFoiwUPUJ-X7R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNCBTYWx0ZWRfX314Ge+rZ/4Wm
 ztnyo6DP3nrHtiGE/Sps4l19o10q1JDrCdgXUZw/GWvLIb9E0tLFLOtSBBSlSjnOT2OweGKBHIg
 AHfFTne2bUKHfuRg9eqaltJhWKocA6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNCBTYWx0ZWRfXz7uMH+UMmUmT
 QeYki57lx8yXgCFkecbJGuFN2YEGzqs5SqM+cbRjfOGdfPMm2uzn6DT8I84eBBgXxZkmZxhbAeD
 IVkYo8vB7LvdyBjqt1vy0Drbh4cmk3ygCy38/Dn63+AQ6btGQ+S/sLD0YBHfCcSerkkMgUPgd5c
 eEIwWxA2Y045dLfpwE2sQ81SzxArvUcKOo5UDiaJpxTz5xo39aDHs0V/Y42ullcnLTq4cquBbV/
 LLcKyNE0v/+0ljH2zuYSDSOSDt129g8QUvdRqB9As/JtkqrTaVx5XmaFEN+ZuK8u5PN1/7vbmK6
 7nMoXIPeoCAWfhkpBWXC/X3ruYoePiTKNwUTBEx9Esu8zutbgf9NfgA6WMB37IXMbOBpH9wzT/r
 lMgZAvG5hDL9LSvNU8pqk64RKc4J2495H5bI2HZm6IMIkM5uU/VARZt/SHbLNWjNLvuQSbewsyk
 BxoYMe/p8GVVZAnDYug==
X-Proofpoint-ORIG-GUID: _Hvg9ppWO5tkjTWx5ciFFoiwUPUJ-X7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180014

On 11/17/2026 11:49 PM, Sumit Gupta wrote:
> Add cpufreq support for Tegra264. It requests and reads the CPU
> frequency differently from earlier SoCs.
> 
> To request a frequency, the driver writes NDIV to a core_freq_req
> register in the CCPLEX register space. Two clusters share a clock and
> its register, so they always run at the same frequency. The driver
> exposes each pair as one performance domain and one cpufreq policy.
> Each CPU's "performance-domains" property gives the domain index, which
> selects the register. If the CCPLEX node declares
> "#performance-domain-cells", probe fails if any CPU lacks the property.
> 
> To read the frequency, the driver samples the per-CPU 64-bit AMU
> counters through system registers. The AMU constant counter is the
> reference. It ticks at the system counter rate, so the driver takes the
> reference rate from CNTFRQ instead of the fixed 408 MHz clock. Probe
> fails if CONFIG_ARM64_AMU_EXTN is disabled or a CPU lacks AMU.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>   drivers/cpufreq/Kconfig.arm        |   4 +-
>   drivers/cpufreq/tegra194-cpufreq.c | 161 ++++++++++++++++++++++++++++-
>   2 files changed, 158 insertions(+), 7 deletions(-)
> +}
> +
> +/*
> + * The AMU counters are per-CPU system registers, so this must run on the CPU
> + * it samples. tegra194_calculate_speed() queues it there with queue_work_on().
> + */
> +static void tegra264_sample_counters(struct tegra194_cpufreq_data *data,
> +				     struct tegra_cpu_ctr *c)
> +{
> +	c->coreclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CORE_EL0);
> +	c->refclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CONST_EL0);


The core cycle counter and the constant counter are read separately
here, with interrupts enabled. An interrupt, or a preemption after it,
between the two reads skews the pair, and the resulting error in the
computed frequency becomes more significant as the gap increases. How
about reading both with local_irq_save(), like arm64 does in
amu_read_core_const_ctrs()?





-- 
Thx and BRs,
Zhongqiu Han
