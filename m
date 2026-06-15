Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCDF18CBE1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546989; cv=none; b=fLm+gDx1ultySSG9KHydmCI2u2yj38g+bZwX7EmRiOQsBzKZ/0D4ft1BdkJh0M3on6GoIHaCP4TwocwHJPpYrnakRQluNraYFtw0fznEJWL1Gu9Mp+vxlw/KH/qIXyPNigP2OIS/UiSLPk+UvX2oVAQ8u+u/hyKFuaZdTBfff8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546989; c=relaxed/simple;
	bh=+/YIfAZx6Y1TDdcNE4r7VNCbv7pZjjigABYxTNijrxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6Z6GiV9AUqIMpow6TTv4xJzDFqVnjQ3i/GgH64Z5cZa0QzvuvqukyiC7ec4sSG37KmkrHk0vbI/yjuxWhgI0Fc3PfKrpHRZpua8pSsA8kFEY7l71hxNZPZU9v15scJGkTvxSGkLzjcTxx9Cik/gZ5jD6xgGCBxdyW02kQokyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpemTdun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhKOB5ai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpemTdun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhKOB5ai"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhIke3139309
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=; b=IpemTdun7BE4c8aM
	G6fZoFhhPOLEPP5lstIw3n4cwYIrk3xrb4FW9e65UKhxXWlylVWLyBPrtTCm3xBc
	NNZSY4rCfBVEiiLyvZVssDD7+lEtafo6qK2ef74/Vw1nC3OK4mLEL1pRSZs6K+VR
	jw+9zYofXd9aJfzR59fYbcqXpZgFoaxvr8dKnPGy3lFCUNINRfHidm4IYMvNtDZ7
	6++Ko5QqRDZcMIDzUWDL4KMLMXHNeiGspqJfvEkCloZ9leneZ8Le5RSgtM2Txkng
	rYhp7SzBv+Kq+/pnPHEWSGuuiRys6ki7+Scc4u/DpQKT/uACkQmXJ4bPpqVOFCfl
	L4Qoyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete982d64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so23297565ad.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781546986; x=1782151786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=;
        b=fhKOB5ai1F4PYg7vn29LzT85DzXwgg69jNQL+8bn9V95EsE5IP8eB2fTYk8CzyqgVT
         2tLBc/wFvFwiefRRMB5a5LxnqhctekgdvgKizi0yccbKMdz3/zVQ5FNUvhyhHkSdHR4V
         KVnpu3qE9WnG9Q47cJUg4hhiMAcabRJkV8UWj25yD4iDYRyxUxvqquVdOWYPHfediVnN
         JMxTzVWhstSOXFDKg9WC+oBcLcQZ/83s8vdK3aUqheFmDyEEmVHDeiX3/smUQRVUuE3q
         Tj9nyeGu0llUul5r8aT/UMzplL9zGCDnOpH9NTVdvq76d9dKfng5ItUHaKn6ovsWvhtr
         yOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546986; x=1782151786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=;
        b=BOsXq4GbSgSAvokQKG+QWiSd4WoNulAyeibicIOV6DUNN6JHGPSjHISDFcOq0djFNg
         qQcDjPlwcO30Wj34KUfJS/f0mEXWb/Zyu88Fx2bQZk/5qCmEox1hQKASmlrb1o8ut8l8
         hI9AGFKaF2WsLq/VXdcPrnRhGH0VqywrWwQpHFQbpcFNG51k2geoqQIOmkwNZ2jRpVfC
         pmrQWCbWVW5N0DBe1EdxUWU2dsIB68csbdymuCfi/4CV+nPcQY5MbHuU5Do3IFNk9Aqq
         8sZp9PVXCCL0WkzreuvSENBWCL1Q2gpQXJLlC/TiaejA3x77pb3GWmatQg/eLnK4LnXE
         DL6w==
X-Forwarded-Encrypted: i=1; AFNElJ/3/CiA3B4b5+ue/QaO5jMreNqVAbz/IKhK0necB4y6r3kIoBs3DF+cV4zA2T/9yYpTNn9wuTg9LFCb@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGCQalU3500P532YhilS+tRc1mcV/h65yMqm1iuX1+9k/AzGP
	fnkUNDzsS8neitzPT2RE/KKdA2In8EpyKAx8LzlhRRmJyD/iyJTXbTc10q61zvVzNsmlcUVc4y1
	RQkbCzllVW6+W34SdlfHcbb2loskNy640Clb5juaWHDY+sPFTXUHwuDXy/3Xg72S3
X-Gm-Gg: Acq92OET0jRig7oa07k9pNGesUiXG6UK4ovaJY34RsJNl+S5C1T5M05KeosPPMOQlWI
	VtspI2DxxmbU99K0L1/AJIArnMXEQN1yWZ7bFuIi0svkfvyVU+4eeCjzqTkTpHWdfCBmUmOA6z/
	mgSeRlC4B/9OWlUOaPRs8r/qHnKULD4XQ0/30KPeHTlW2KlakqglTcJqg3NT41uzLweM4D1ykVl
	TERWboq1s/K0wGxXqtMC7R14hw7YR+T2Jv5crPmN+YLVmLa73WOBAw4CR8K1aC0c9xGTjR+NojF
	nc3W+VOkJPzNB+r7Y52CcFyMt100+eUijBEQ0wkXl+f4x/CeLPIZjcMuPjwicjfZmnpCFa8cksE
	zj4tbdCjur6bez+bXw/HqwGBuGKenAie1vQ8BADCx3PxyaReIft+f028z
X-Received: by 2002:a17:903:3a8b:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c699b739efmr3749535ad.23.1781546986462;
        Mon, 15 Jun 2026 11:09:46 -0700 (PDT)
X-Received: by 2002:a17:903:3a8b:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c699b739efmr3749245ad.23.1781546985957;
        Mon, 15 Jun 2026 11:09:45 -0700 (PDT)
Received: from [10.187.126.18] ([106.221.183.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm103379135ad.6.2026.06.15.11.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 11:09:45 -0700 (PDT)
Message-ID: <f4e0a95c-bd4b-9eaa-f06e-5b5dd7c6ee84@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:39:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a303feb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ym48ABLkKUHSTpi9L/JoRg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jI4A6vEBTXP-BcUGSgUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8lh5NdThBe_1-UHYGOujG080f0ZCeIMf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE5MiBTYWx0ZWRfX5bYgf0qHyBHK
 Z+9hsN3Wnw+JV5q3l1EigNGmZISzr54Kp9Fwr5YmU5GGKdQOVbLb/qRy9SxKGa6Nev2vhNYO15S
 SP6Mk6Mlv5oKCZYEBDHk6kae9p29aJA=
X-Proofpoint-ORIG-GUID: 8lh5NdThBe_1-UHYGOujG080f0ZCeIMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE5MiBTYWx0ZWRfXxnQkjJBwRq63
 Gutt5NuvyAOXkDNE4swgdwCufPteO9+WtNotoqJSYwIyAdGZdT0LwqaJyicL6yYSFT6gXdAJ+ik
 2oEqFYsWJo4NiY1m23uNQInHaxOG3kmOBZaKWmoC8MirMInw2u7/4aH8c5lWYRNP0Ms6ANz3LHV
 DKQzGLYJHSrt1RgTTvIV4KqAVpSfP2PALwmTGYfiW+T4yrlwH9f4K215lQrs5/kdXzeypBQWPz0
 3g1E+nwj3s2CfilKO+3phQM3FNb3RPBxQEpHpJBl+fmqkZhPdp8qQ6MtPllJuK/W56wvrGq3B1U
 CfhqcvN6IQ8CbRQGn8TDuAMgeDBSg4/ab3DRWOSjmhCDxlN+5fuDfDPdux9wnju1Ofx9OyGEqcQ
 KPfAaVMxfBsfgdZBrYFvmwHmRcVPMdv8qo518WbWrCSFDx7roLpervQGsr4X97pv+xTbkn1MbBF
 foCfYfNjnJOy4RGmkHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150192


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> AR50LT require explicit instantaneous bandwidth (IB) voting in addition
> to average bandwidth (AB) when configuring interconnect QoS. This
> requirement is due to QSB (Qualcomm System Bus) 128b to
> QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
> which is not needed for other IRIS cores.
>
> In preparation of adding support for AR50LT core, introduce
> platform-configurable IB multiplier and enable IB voting for all SoCs.
> Existing platforms default to IB == AB, while AR50LT requires 2x peak
> bandwidth.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
>  drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
>  drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
>  4 files changed, 9 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 81fcb2854772..accc1627defd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -316,6 +316,7 @@ struct iris_platform_data {
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	u32 wd_intr_mask;
> +	u32 icc_ib_multiplier;
>  	u32 max_session_count;
>  	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index eeef453c583f..e2fddc29abc7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
>  	.num_vpp_pipe = 1,
>  	.no_aon = true,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
>  	/* max spec for SC7280 is 4096x2176@60fps */
> @@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 261db38a013b..64cf182d67cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 2,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>  	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> @@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..caeaf199cef7 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -18,6 +18,7 @@
>  
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  {
> +	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
>  	unsigned long bw_kbps = 0, bw_prev = 0;
>  	const struct icc_info *icc_tbl;
>  	int ret = 0, i;
> @@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  				return ret;
>  
>  			core->icc_tbl[i].avg_bw = bw_kbps;
> +			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
>  
>  			core->power.icc_bw = bw_kbps;
>  			break;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

