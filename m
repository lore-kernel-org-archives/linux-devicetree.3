Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866740B11F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647827; cv=none; b=autkgDUtE3soTa3DNNXEdHoGdHGGUXnG73DOFHPIyOEPnmt8mH2wkMKqjgq+cDJxhzN4OreKZP0FXT5nSpQD/kkfqa3peM1u4U4EaduhMONXT4EbaXFW5f4J1sZCm70cNc1xhGzK08yZVWltqXUEnY6TS8tz1b3EhE1rnJzgkkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647827; c=relaxed/simple;
	bh=p23HmS5Oc/HQ4G5SQ0QRcGjhf9LBxEk5tF8QZWFR1Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnr9qrmORFUPaZF53pVR4f2hBlktIddDWS3MQSHBVwUHZoRzv7X26RyiIq1oscXr2NEBcmcWzpZKTZLWDrpotJaW3N0wEcXkXRrkNRb7OCbfHoAbZEEs6fYjViNMnD9qMDCbXY4Eq4NYmMLXyWTwUlBk2rQPl5ooCvO718wFhXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABHRr+HR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT+3RZpA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABHRr+HR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT+3RZpA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg0mC1841247
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvvTaJBjCK1gSEP+hrhr4VKO2fjkfMfNRsPx6/MAjBY=; b=ABHRr+HRE/Smu6ZK
	l6WlM5N0e9h+8oMRnzkDQt5s/tAtnYiRPRYuE2CLU33rE4MJ4ux04b0Y9ZUwdXwW
	r5TDdR8S9VFthKdBCXns8Nz7vywG+DCE835qDWW11g6/U69dioHHmjfgZaRdf+h6
	oJOF5AUzG91LkLeprgGT6roFzmXjFD965nyuwNMbHEfZE5J8/aL84rlZ/DSmKSfW
	07C0LH5xHga46VX1rVMw5wVpW4lIp6kfxv8Dl5iG2D/Fb/2ij2AoL09hgLZxZanY
	93klS8/JYTWewSmNhJ7NhlM3j++x6xsT5zEqTwPXt5KShBR/9BOHKdyJYL892Uof
	I3yAfw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se3155-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:30:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so14061108a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647821; x=1785252621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvvTaJBjCK1gSEP+hrhr4VKO2fjkfMfNRsPx6/MAjBY=;
        b=MT+3RZpAruCoKq7iT/gxMVUBW8BsaO+vaGZoPUTOvTCZS7SfhvSdpdzk50F2xX8hZG
         rnMRdlCtAti1hjNGs8cF1ukA0RGvL0LPG6h6tPY1TEdhxa9PwRTHMj9if7G2KHLRRatD
         LSiaF5mVVV6455yaNt9e1ZT3/MKu7g9JaG/gLRZGmOK6uGVNGYm4Qj+BeV3KmyGQ0NDl
         BBJC64ZjhPmpDWG/ijyuWu5zTteNWYnu56E+0uPs5sf2OPW28iwOXdQPkj2mVb1vk6WM
         nqgSJedrmJUo8MvS7eIc9FFzLH/zs4h+K9+lEpl5dTTzgv6UmQhUhHzleQsAYaOINqz2
         ay0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647821; x=1785252621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvvTaJBjCK1gSEP+hrhr4VKO2fjkfMfNRsPx6/MAjBY=;
        b=O61BUhdnduUzO8W1++49+uyCIHN8Cq1YcUHzhBFSPHl+KpE1LQ78Gi8U1+9siBFY3u
         6oJr7IT63BEduthHpMKU/MxZCpHqWDVtCszhGHNWg5SlqLkk+aIqH0vvt5kg75P4AsPv
         Q2GnZJmqOpNbi5TLtZAwmlnt4lRWfA73UW2Zc5Yr3GyIclibWfFwWNsCJWM3JqSzXmIw
         Zp+gv5PvJTWgbMJhDGBmumAiNRl6OwTNiHdzhOkrwp2fZmXauCz+v4xKHL8h4yglrIuA
         6PvCLGDa0sDnxcUgbSJRk6UzCulqAYQOrUhbh6ussD3PrgdWnvaR8fkpmLc/p3HgBVhw
         BCwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFlAjLFe542HRy60FPqygtmdDCxFrVytgHp8U0Wtnt8Eu9V9AbS59TeY2auXNFOqE7yk/RksvSa1Z2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3jklQ099HwTdHXBzFgiBaLSPRhnQI5iXJSrRiCNYHReC3gTG
	qxm8M92PFVrZL4fV9+nrISSruAFTJWv6WW+qkdm/MvqBGXx3PJQYpv+9pfAMEb/RoMYvtoQyVZw
	BOSeTG6g3ljMArC5okJuWvmu8/ayU5oldFx9cSbdwcIJgKnTqot85Ic/JYyzAJ4rw
X-Gm-Gg: AfdE7clpi9Qp8yUSuKgWvjMvASBKF7JW9RrMku9RF1hBifucvRza3U5kWUoBByCufK+
	8KR5k9+HXw0NgsaGrrMOUE5hz5xFygsorzY2IBbkfc9M0rxfGXZ+9FzN1OVSjlpygxiriPNBzlT
	pTyIwUTPG5nu+KXscGmUJBOEoPbz0ImnGz08qnEEEhyb1w+v4YnuR2PyJmqWte7ugUG8CVL+zOc
	17g93ZynaIdazHFG9O0uXyazr35/KvFpznO8tKrlYZXaAITmCi4IloiJfu+K4NuPwF6WDzjUoMF
	fSw3cuX9S7i//mmduxp1aAuELxRzhEFK9Rs++kums6on1u8bEkFerLtGRaHFO9GXw9holzgO305
	OOj4Pk8TsCziK1Vp9OBx9q4Um/PrxcI90
X-Received: by 2002:a05:6a20:9397:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c3ad8eccf3mr20255335637.38.1784647819856;
        Tue, 21 Jul 2026 08:30:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c3ad8eccf3mr20255264637.38.1784647819041;
        Tue, 21 Jul 2026 08:30:19 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm41977394c88.15.2026.07.21.08.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:30:18 -0700 (PDT)
Message-ID: <b5c4f8d5-25c3-4e84-bba2-ab30e4e247ab@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:00:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/18] media: iris: Introduce buffer size calculations
 for AR50LT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-15-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-15-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ty1FAVbtYJXRXCm5hzr19r4krDOs87WJ
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f908e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Ryj05oddrNNL81SrFIgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX+GjJIwbX7qYH
 cAMKUdZ6VEIQPJXMvle0lCYJNTpes3dqZh3/VJioCKBOq214X8YJcjQdebuA0lsBGjZd6jxvTiz
 n5p43U6dIbBUqBwb6aS5xezUHlDXUcQ=
X-Proofpoint-GUID: ty1FAVbtYJXRXCm5hzr19r4krDOs87WJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfXwpl2+1926nyk
 LTIeN6kwG/Sp9TEzoSjp/gyP0Nxmx2rrJL+orKrdmVoUfp8xOMEe5JDHmB64pMiGxjaf5G6JWgF
 9ENIAjcyM+bSxh3EewXuUivPPRjnHPPVxamxmzUq/KJPDrMh3bjeqBU+hVnriJ+4hwhieBc6BsJ
 vFehI5GX4eZa7RjHEtbAn+5hCZbjvPdlmKthxFgSrXCoMBF+SLmitpc4Zsq1LLo9REL0s3Zjh02
 oKbNBfhLbNnWL/j1LJQ24MiIQNH78BGtmSNFxJxcb6uxSU4FVi5NLKvbXkn9HkD5dGF1S/20XB2
 rDOS8qYasJmo4dY+4Xq7P7D2BY6BJ8WM8BO2PWnbxasX0zbLFtbys38VV4PN3c4UgkZU2tWrO4U
 PnqTow1K7xCWC7X7jjASOAqDU4AnA4YoyZC9TKVJWlLNPQZQ4NWma+wdJoYmDoM3DfFP6CgHt7b
 +GUDCQxjuooF5O0pf1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210163


On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Introduces AR50LT  buffer size calculation for both encoder and
> decoder. Reuse the buffer size calculation which are common, while
> adding the AR50LT specific ones separately.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 365 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 +++
>   2 files changed, 402 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 511502d4ea6c..00dbb091c54e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -50,6 +50,26 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>   	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>   }
>   
> +static u32 hfi_buffer_bin_h264d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 n_aligned_h = ALIGN(frame_height, 16);
> +	u32 n_aligned_w = ALIGN(frame_width, 16);
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = ((n_aligned_w * n_aligned_h * 3) >> 1);
> +	if (size_yuv <= 1920 * 1088 * 3 / 2) {
> +		size_bin_hdr = size_yuv * H264_CABAC_HDR_RATIO_SM_TOT;
> +		size_bin_res = size_yuv * H264_CABAC_RES_RATIO_SM_TOT;
> +	} else {
> +		size_bin_hdr = (size_yuv * 3) / 5;
> +		size_bin_res = (size_yuv * 3) / 2;
> +	}
> +	size_bin_hdr = ALIGN(size_bin_hdr, DMA_ALIGNMENT);
> +	size_bin_res = ALIGN(size_bin_res, DMA_ALIGNMENT);
> +
> +	return size_bin_hdr + size_bin_res;
> +}
> +
>   static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 size_yuv, size_bin_hdr, size_bin_res;
> @@ -103,6 +123,19 @@ static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32 num_vpp_pi
>   	return _size * num_vpp_pipes;
>   }
>   
> +static u32 hfi_buffer_bin_vp9d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 size_yuv, size;
> +
> +	size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3 / 2;
> +	size_yuv = ALIGN(size_yuv, DMA_ALIGNMENT);
> +
> +	size = ALIGN(((max(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 6) / 5, DMA_ALIGNMENT) +
> +		ALIGN(((max(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 4), DMA_ALIGNMENT);
> +
> +	return size;
> +}
> +
>   static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 n_aligned_w = ALIGN(frame_width, 16);
> @@ -111,6 +144,27 @@ static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>   	return size_h265d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>   }
>   
> +static u32 hfi_buffer_bin_h265d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 n_aligned_w = ALIGN(frame_width, 16);
> +	u32 n_aligned_h = ALIGN(frame_height, 16);
> +
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = ((n_aligned_w * n_aligned_h * 3) >> 1);
> +	if (size_yuv <= ((BIN_BUFFER_THRESHOLD * 3) >> 1)) {
> +		size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_SM_TOT;
> +		size_bin_res = size_yuv * H265_CABAC_RES_RATIO_SM_TOT;
> +	} else {
> +		size_bin_hdr = (size_yuv * 41) / 50;
> +		size_bin_res = (size_yuv * 59) / 50;
> +	}
> +	size_bin_hdr = ALIGN(size_bin_hdr, DMA_ALIGNMENT);
> +	size_bin_res = ALIGN(size_bin_res, DMA_ALIGNMENT);
> +
> +	return size_bin_hdr + size_bin_res;
> +}
> +
>   static u32 hfi_buffer_comv_h264d(u32 frame_width, u32 frame_height, u32 _comv_bufcount)
>   {
>   	u32 frame_height_in_mbs = DIV_ROUND_UP(frame_height, 16);
> @@ -174,6 +228,14 @@ static u32 size_h264d_bse_cmd_buf(u32 frame_height)
>   		SIZE_H264D_BSE_CMD_PER_BUF;
>   }
>   
> +static u32 size_h264d_bse_cmd_buf_ar50lt(u32 frame_height)
> +{
> +	u32 height = ALIGN(frame_height, 32);
> +
> +	return min_t(u32, (DIV_ROUND_UP(height, 16) * 12), H264D_MAX_SLICE) *
> +		SIZE_H264D_BSE_CMD_PER_BUF;
> +}
> +
>   static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
>   {
>   	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> @@ -185,6 +247,18 @@ static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
>   	return _size;
>   }
>   
> +static u32 size_h265d_bse_cmd_buf_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> +			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
> +			    NUM_HW_PIC_BUF, DMA_ALIGNMENT);
> +
> +	_size = min_t(u32, _size, H265D_MAX_SLICE_AR50LT + 1);
> +	_size = 2 * _size * SIZE_H265D_BSE_CMD_PER_BUF;
> +
> +	return _size;
> +}
> +
>   static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
>   {
>   	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
> @@ -195,6 +269,13 @@ static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
>   		     DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_persist_h265d_ar50lt(void)
> +{
> +	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
> +		      H265_NUM_TILE * sizeof(u32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA),
> +		     DMA_ALIGNMENT);
> +}
> +
>   static inline
>   u32 hfi_iris3_vp9d_comv_size(void)
>   {
> @@ -212,6 +293,13 @@ static u32 hfi_buffer_persist_vp9d(void)
>   		HDR10_HIST_EXTRADATA_SIZE;
>   }
>   
> +static u32 hfi_buffer_persist_vp9d_ar50lt(void)
> +{
> +	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
> +		ALIGN(hfi_iris3_vp9d_comv_size(), DMA_ALIGNMENT) +
> +		ALIGN(MAX_SUPERFRAME_HEADER_LEN, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
>   {
>   	u32 size, height = ALIGN(frame_height, 32);
> @@ -222,6 +310,16 @@ static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
>   	return size > VPP_CMD_MAX_SIZE ? VPP_CMD_MAX_SIZE : size;
>   }
>   
> +static u32 size_h264d_vpp_cmd_buf_ar50lt(u32 frame_height)
> +{
> +	u32 size, height = ALIGN(frame_height, 32);
> +
> +	size = min_t(u32, (DIV_ROUND_UP(height, 16) * 12), H264D_MAX_SLICE) *
> +		SIZE_H264D_VPP_CMD_PER_BUF;
> +
> +	return size > VPP_CMD_MAX_SIZE ? VPP_CMD_MAX_SIZE : size;
> +}
> +
>   static u32 hfi_buffer_persist_h264d(void)
>   {
>   	return ALIGN(SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264 +
> @@ -230,6 +328,11 @@ static u32 hfi_buffer_persist_h264d(void)
>   		    DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_persist_h264d_ar50lt(void)
> +{
> +	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264), DMA_ALIGNMENT);
> +}
> +
>   static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
>   {
>   	u32 comv_size, size;
> @@ -255,6 +358,17 @@ static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_
>   	return ALIGN(size, DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_non_comv_h264d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 size_bse = size_h264d_bse_cmd_buf_ar50lt(frame_height);
> +	u32 size_vpp = size_h264d_vpp_cmd_buf_ar50lt(frame_height);
> +	u32 size = ALIGN(size_bse, DMA_ALIGNMENT) +
> +		ALIGN(size_vpp, DMA_ALIGNMENT) +
> +		ALIGN(SIZE_HW_PIC(SIZE_H264D_HW_PIC_T), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
>   {
>   	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> @@ -269,6 +383,20 @@ static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
>   	return _size;
>   }
>   
> +static u32 size_h265d_vpp_cmd_buf_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> +			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
> +			  NUM_HW_PIC_BUF, DMA_ALIGNMENT);
> +	_size = min_t(u32, _size, H265D_MAX_SLICE_AR50LT + 1);
> +	_size = ALIGN(_size, 4);
> +	_size = 2 * _size * SIZE_H265D_VPP_CMD_PER_BUF_AR50LT;
> +	if (_size > VPP_CMD_MAX_SIZE)
> +		_size = VPP_CMD_MAX_SIZE;
> +
> +	return _size;
> +}
> +
>   static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 _size_bse = size_h265d_bse_cmd_buf(frame_width, frame_height);
> @@ -285,6 +413,20 @@ static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_
>   	return ALIGN(_size, DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_non_comv_h265d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 _size_bse = size_h265d_bse_cmd_buf_ar50lt(frame_width, frame_height);
> +	u32 _size_vpp = size_h265d_vpp_cmd_buf_ar50lt(frame_width, frame_height);
> +	u32 _size = ALIGN(_size_bse, DMA_ALIGNMENT) +
> +		ALIGN(_size_vpp, DMA_ALIGNMENT) +
> +		ALIGN(2 * sizeof(u16) *
> +		(ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> +		(ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS), DMA_ALIGNMENT) +
> +		ALIGN(SIZE_HW_PIC(SIZE_H265D_HW_PIC_T), DMA_ALIGNMENT);
> +
> +	return ALIGN(_size, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_vpss_lb(u32 frame_width, u32 frame_height)
>   {
>   	u32 opb_lb_wr_llb_y_buffer_size, opb_lb_wr_llb_uv_buffer_size;
> @@ -317,6 +459,13 @@ u32 size_h265d_lb_fe_top_data(u32 frame_width, u32 frame_height)
>   		(ALIGN(frame_width, 64) + 8) * 2;
>   }
>   
> +static inline
> +u32 size_h265d_lb_fe_top_data_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return ALIGN(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE *
> +		(ALIGN(frame_width, 64) + 8), DMA_ALIGNMENT) * 2;
> +}
> +
>   static inline
>   u32 size_h265d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
>   {
> @@ -348,6 +497,17 @@ u32 size_h265d_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
>   		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
>   }
>   
> +static inline
> +u32 size_h265d_lb_se_left_ctrl_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return max_t(u32, ((frame_height + 16 - 1) / 8) *
> +		MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT,
> +		max_t(u32, ((frame_height + 32 - 1) / 8) *
> +		MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT,
> +		((frame_height + 64 - 1) / 8) *
> +		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT));
> +}
> +
>   static inline
>   u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
>   {
> @@ -355,6 +515,13 @@ u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
>   		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
>   }
>   
> +static inline
> +u32 size_h265d_lb_pe_top_data_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE_AR50LT *
> +		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
> +}
> +
>   static inline
>   u32 size_h265d_lb_vsp_top(u32 frame_width, u32 frame_height)
>   {
> @@ -404,6 +571,25 @@ u32 hfi_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb, u32 nu
>   	return ALIGN((_size + vpss_lb_size), DMA_ALIGNMENT);
>   }
>   
> +static inline
> +u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 size;
> +
> +	size = ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height), DMA_ALIGNMENT) * 4 +

WARNING: line length of 106 exceeds 100 columns
#312: FILE: drivers/media/platform/qcom/iris/iris_vpu_buffer.c:587:
+               ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, 
frame_height), DMA_ALIGNMENT) * 4 +

> +		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static inline
>   u32 size_vpxd_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
>   {
> @@ -438,6 +624,17 @@ u32 size_vpxd_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
>   			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
>   }
>   
> +static inline
> +u32 size_vpxd_lb_se_left_ctrl_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return max_t(u32, ((frame_height + 15) >> 4) *
> +		     MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT,
> +		     max_t(u32, ((frame_height + 31) >> 5) *
> +			   MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT,
> +			   ((frame_height + 63) >> 6) *
> +			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT));
> +}
> +
>   static inline
>   u32 size_vpxd_lb_recon_dma_metadata_wr(u32 frame_width, u32 frame_height)
>   {
> @@ -492,6 +689,17 @@ u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   		ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
>   }
>   
> +static inline
> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min)
> +{
> +	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT);
> +}
> +
>   static inline
>   u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min, bool is_opb,
>   			 u32 num_vpp_pipes)
> @@ -529,6 +737,23 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>   	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_line_h264d_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 size;
> +
> +	size = ALIGN(size_h264d_lb_fe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_fe_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_fe_left_ctrl(frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_se_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_se_left_ctrl_ar50lt(frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_pe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_vsp_top(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_recon_dma_metadata_wr(frame_height), DMA_ALIGNMENT) * 2 +
> +		ALIGN(size_h264d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
>   {
>   	u32 size, y_width, y_width_a = 128;
> @@ -724,6 +949,22 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_bin_size(struct iris_inst *inst)
> +{
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_bin_h264d_ar50lt(width, height);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_bin_h265d_ar50lt(width, height);
> +	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_bin_vp9d_ar50lt(width, height);
> +
> +	return 0;
> +}
> +
>   static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>   {
>   	u32 num_comv = VIDEO_MAX_FRAME;
> @@ -785,6 +1026,18 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_persist_size(struct iris_inst *inst)
> +{
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_persist_h264d_ar50lt();
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_persist_h265d_ar50lt();
> +	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_persist_vp9d_ar50lt();
> +
> +	return 0;
> +}
> +
>   static u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
>   {
>   	if (iris_split_mode_enabled(inst))
> @@ -808,6 +1061,20 @@ static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_non_comv_size(struct iris_inst *inst)
> +{
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_non_comv_h264d_ar50lt(width, height);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_non_comv_h265d_ar50lt(width, height);
> +
> +	return 0;
> +}
> +
>   static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>   {
>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> @@ -833,6 +1100,23 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_line_size(struct iris_inst *inst)
> +{
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +	u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_line_h264d_ar50lt(width, height);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_line_h265d_ar50lt(width, height);
> +	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_line_vp9d_ar50lt(width, height, out_min_count);
> +
> +	return 0;
> +}
> +
>   static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
>   {
>   	return iris_vpu_dec_comv_size(inst) +
> @@ -840,6 +1124,13 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
>   		iris_vpu_dec_line_size(inst);
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_scratch1_size(struct iris_inst *inst)
> +{
> +	return iris_vpu_dec_comv_size(inst) +
> +		iris_vpu_ar50lt_dec_non_comv_size(inst) +
> +		iris_vpu_ar50lt_dec_line_size(inst);
> +}
> +
>   static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
>   {
>   	if (is_rotation_90_or_270(inst))
> @@ -1470,6 +1761,15 @@ u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
>   	return size;
>   }
>   
> +static inline
> +u32 hfi_buffer_dpb_enc_ar50lt(u32 frame_width, u32 frame_height, bool is_ten_bit)
> +{
> +	if (!is_ten_bit)
> +		return size_enc_ref_buffer(frame_width, frame_height);
> +	else
> +		return size_enc_ten_bit_ref_buffer(frame_width, frame_height);
> +}
> +
>   static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
>   {
>   	return HFI_BUFFER_ARP_ENC;
> @@ -1494,6 +1794,16 @@ u32 hfi_buffer_vpss_enc(u32 dswidth, u32 dsheight, bool ds_enable,
>   	return 0;
>   }
>   
> +static inline
> +u32 hfi_buffer_vpss_enc_ar50lt(u32 dswidth, u32 dsheight, bool ds_enable,
> +			       u32 blur, bool is_ten_bit)
> +{
> +	if (ds_enable || blur)
> +		return hfi_buffer_dpb_enc_ar50lt(dswidth, dsheight, is_ten_bit);
> +
> +	return 0;
> +}
> +
>   static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
>   					  u32 lcu_size, u32 num_ref,
>   					  bool ten_bit, u32 num_vpp_pipes,
> @@ -1752,6 +2062,16 @@ static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
>   	return hfi_buffer_vpss_enc(width, height, ds_enable, 0, 0);
>   }
>   
> +static u32 iris_vpu_ar50lt_enc_vpss_size(struct iris_inst *inst)
> +{
> +	u32 ds_enable = is_scaling_enabled(inst);
> +	struct v4l2_format *f = inst->fmt_dst;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	return hfi_buffer_vpss_enc_ar50lt(width, height, ds_enable, 0, 0);
> +}
> +
>   static inline u32 size_dpb_opb(u32 height, u32 lcu_size)
>   {
>   	u32 max_tile_height = ((height + lcu_size - 1) / lcu_size) * lcu_size + 8;
> @@ -2199,6 +2519,51 @@ u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type
>   	return inst->buffers[buffer_type].size;
>   }
>   
> +u32 iris_vpu_ar50lt_gen2_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> +{
> +	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
> +	u32 size = 0, buf_type_handle_size = 0, i;
> +
> +	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
> +		{BUF_BIN,         iris_vpu_ar50lt_dec_bin_size      },
> +		{BUF_COMV,        iris_vpu_dec_comv_size            },
> +		{BUF_NON_COMV,    iris_vpu_ar50lt_dec_non_comv_size },
> +		{BUF_LINE,        iris_vpu_ar50lt_dec_line_size     },
> +		{BUF_PERSIST,     iris_vpu_ar50lt_dec_persist_size  },
> +		{BUF_DPB,         iris_vpu_dec_dpb_size             },
> +		{BUF_SCRATCH_1,   iris_vpu_ar50lt_dec_scratch1_size },
> +		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
> +	};
> +
> +	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
> +		{BUF_BIN,         iris_vpu_enc_bin_size             },
> +		{BUF_COMV,        iris_vpu_enc_comv_size            },
> +		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size        },
> +		{BUF_LINE,        iris_vpu_enc_line_size            },
> +		{BUF_ARP,         iris_vpu_enc_arp_size             },
> +		{BUF_VPSS,        iris_vpu_ar50lt_enc_vpss_size     },
> +		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size        },
> +		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size        },
> +	};
> +
> +	if (inst->domain == DECODER) {
> +		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
> +		buf_type_handle_arr = dec_internal_buf_type_handle;
> +	} else if (inst->domain == ENCODER) {
> +		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
> +		buf_type_handle_arr = enc_internal_buf_type_handle;
> +	}
> +
> +	for (i = 0; i < buf_type_handle_size; i++) {
> +		if (buf_type_handle_arr[i].type == buffer_type) {
> +			size = buf_type_handle_arr[i].handle(inst);
> +			break;
> +		}
> +	}
> +
> +	return size;
> +}
> +
>   static u32 internal_buffer_count(struct iris_inst *inst,
>   				 enum iris_buffer_type buffer_type)
>   {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 1d07137c70cd..2085e316a6bd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -61,17 +61,26 @@ struct iris_inst;
>   #define MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE 64
>   #define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE (128 / 8)
>   #define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE (128 / 8)
> +#define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT (8 / 8)
> +#define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT (16 / 8)
> +#define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT (32 / 8)
>   #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
>   
>   #define SIZE_SEI_USERDATA			4096
>   #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>   #define H264_CABAC_HDR_RATIO_HD_TOT	1
>   #define H264_CABAC_RES_RATIO_HD_TOT	3
> +#define H264_CABAC_HDR_RATIO_SM_TOT 1
> +#define H264_CABAC_RES_RATIO_SM_TOT 2
>   #define H265D_MAX_SLICE	3600
> +#define H265D_MAX_SLICE_AR50LT	600
>   #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
>   #define H265_CABAC_HDR_RATIO_HD_TOT 2
>   #define H265_CABAC_RES_RATIO_HD_TOT 2
> +#define H265_CABAC_HDR_RATIO_SM_TOT 1
> +#define H265_CABAC_RES_RATIO_SM_TOT 6
>   #define SIZE_H265D_VPP_CMD_PER_BUF (256)
> +#define SIZE_H265D_VPP_CMD_PER_BUF_AR50LT (192)
>   #define SIZE_THREE_DIMENSION_USERDATA 768
>   #define SIZE_H265D_ARP 9728
>   
> @@ -81,6 +90,7 @@ struct iris_inst;
>   #define VPX_DECODER_FRAME_BIN_DENOMINATOR 2
>   
>   #define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO (3 / 2)
> +#define VPX_DECODER_FRAME_BIN_BUFFER_SIZE (1024 * 1024)
>   
>   #define SIZE_H264D_HW_PIC_T		(BIT(11))
>   
> @@ -99,6 +109,7 @@ struct iris_inst;
>   #define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	64
>   #define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	16
>   #define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
> +#define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE_AR50LT	176
>   #define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE	640
>   
>   #define AV1_CABAC_HDR_RATIO_HD_TOT 2
> @@ -155,11 +166,21 @@ static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
>   	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;
>   }
>   
> +static inline u32 size_h264d_lb_fe_top_data_ar50lt(u32 frame_width)
> +{
> +	return 16 * ALIGN(frame_width, 16) * 2;
> +}
> +
>   static inline u32 size_h264d_lb_fe_top_ctrl(u32 frame_width)
>   {
>   	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
>   }
>   
> +static inline u32 size_h264d_lb_fe_top_ctrl_ar50lt(u32 frame_width)
> +{
> +	return 16 * DIV_ROUND_UP(frame_width, 16);
> +}
> +
>   static inline u32 size_h264d_lb_fe_left_ctrl(u32 frame_height)
>   {
>   	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
> @@ -170,16 +191,31 @@ static inline u32 size_h264d_lb_se_top_ctrl(u32 frame_width)
>   	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
>   }
>   
> +static inline u32 size_h264d_lb_se_top_ctrl_ar50lt(u32 frame_width)
> +{
> +	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT * DIV_ROUND_UP(frame_width, 16);
> +}
> +
>   static inline u32 size_h264d_lb_se_left_ctrl(u32 frame_height)
>   {
>   	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
>   }
>   
> +static inline u32 size_h264d_lb_se_left_ctrl_ar50lt(u32 frame_height)
> +{
> +	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT * DIV_ROUND_UP(frame_height, 16);
> +}
> +
>   static inline u32 size_h264d_lb_pe_top_data(u32 frame_width)
>   {
>   	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
>   }
>   
> +static inline u32 size_h264d_lb_pe_top_data_ar50lt(u32 frame_width)
> +{
> +	return 64 * DIV_ROUND_UP(frame_width, 16);
> +}
> +
>   static inline u32 size_h264d_lb_vsp_top(u32 frame_width)
>   {
>   	return (DIV_ROUND_UP(frame_width, 16) << 7);
> @@ -289,6 +325,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>   u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>   u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>   u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> +u32 iris_vpu_ar50lt_gen2_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>   int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>   
>   #endif
> 

otherwise,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

