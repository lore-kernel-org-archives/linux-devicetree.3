Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD31D5CFB
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225197; cv=none; b=WRW0UWz+LjCDdKmlvKrpdCTouKYWPdWjoNQHr+uBE3rCSL3YfVYbGaRe+rfE9j8Ac76R59XcKbxDPrxsP2J1RgJgrlNYs7vJupobKfB6BFxWicP8w+oq0szSwx529YO9yLqsSHOZxYHBz/L8384oIn2Qn5Nnht0BLfuhNI+YDco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225197; c=relaxed/simple;
	bh=0Yfq0GsOFOlSkhyDjRGEQmoYvvyc14ezy1z5qxE2TwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayyFuOzFw6VdbVw9u5LHA8XNNTU3fwc1xQ3gZFrzwOQuPszx3iAzKP4jhK+rqp0u+4QUuzHv1c5W6SJFCYWxPBurMSmRRbXn+te1pDssMSl5Rbwty0KhBzQaCvTZQ3glKpbmnWDJRGtLHm86G9SftaiDrm9sbPrvFzem6mFtuBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUR8gSke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0JWOscI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUR8gSke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0JWOscI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64863JUf4069612
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 07:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kucgxvy0Ysf+ScM6nZT7iDp08PcOKDOTx7uRp9Y7g0=; b=BUR8gSke5/hg2+gS
	1RygxAWuCIg4rbizxDXqUacy8kGX6TDg6fdzjNx2rbytbYsOYEDtrJx8TOMzxrmv
	VMgbMxwBrvQhqGoYWFPvfKg2Qr/KXlF1R788w9OclEKdS9xQlfWCijHZxHfIsjfa
	4Fu1O1O16cgqI1FU6LtQlfYg9z2n+fGISH73pUSKG9SLk5KYo7xo+XLkcuewkZmD
	0kWIiyFMpdfJFn+nAMOvbg+s7wKdzgl75t0MwGsuKCDNlW0z12R/NzA2N6AmDV5q
	Vtlf7UFGVnxVtQkKRewYG4+wqTk85pipykpUDs5RO/VaydOT2D8wl1X+14iVytXP
	kqLt0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp1ssw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:26:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso5512155ad.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778225190; x=1778829990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kucgxvy0Ysf+ScM6nZT7iDp08PcOKDOTx7uRp9Y7g0=;
        b=J0JWOscI8mkTyeXE+9XxcPugCZZoDusRsGunZ8VUoUHX9fHjo3jBo0zrBuDfUFpXdV
         kPVzPMP/KoZKo3+ljzl3llYaBEw8zqKFi0uZzrdl16iAMr2YGmQNfx2cQvra1EdtQBjc
         BlBRbHXhn/5xk78k1aS8OxQH0xWGqI7ql8DiK2dXgukIObGF0EXpwXFHGcak1CavEo05
         moEyAbFifqQ4BV9mv7lMipYK+6RGHNzLn0PGq7Wqh+ImlBZDYzbjSALphCxCxc4e+9RL
         v5IAlveWeVSgBiabApJwsDueES2wF0m9Hqzjwh6HIr5XqFgW4df6h5k1VKTLsriFJ5Pq
         Q3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225190; x=1778829990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kucgxvy0Ysf+ScM6nZT7iDp08PcOKDOTx7uRp9Y7g0=;
        b=oGGOsH5TGnE+ViQCHr4JUy8cczhOl6wFljrRjbfGM8N3ttj2QF0lHJSxV8e3OA+/I9
         vJu1qjy9lZFvLAsI+tznwk6RR70vmmr+0q2JE4r0WLWcoGD7YjlDEjYq9TsYCfrNJLcg
         mn7cfsMJynZlsGWJSkCOyySs3Jm3jPp8lNXuOVaMQUhBrHaGeVCzXDEJJipLAc9pJkOi
         ZpKgB1BbmCRzy83fC4C0T9O+sZ6e7Ga4i28p1Utzsmt8cKItqofnpI0U1A+atiNSPAPX
         XjvDESX3j1VJyA/jrIODwxGs8q7sJc0oIHOh1z1Ncv3CDwbASfhd1SCBlHfoeCTR35Dn
         /3Gw==
X-Forwarded-Encrypted: i=1; AFNElJ89Ik9YQDo3Nm4R1+dtowNv5VCpsN7cQcJdvxGf12jE4VDXPUCEGbds7A6Hkbt9+pTX4dWpdmfzl0Ht@vger.kernel.org
X-Gm-Message-State: AOJu0YzP84kCzKurGThQy2SKmdAzxbVv6NHi7KqAUV40FJf8B20sBm31
	dOFqXpmXQf55ZVDdQXSYVMR8jvQtl8fu7ujqOnpePfoZ8HEiQDQywp0MztCtc4u7SZpaNoRmibj
	dyzk5NQoe5pi/3dOYZ/GtoyPpvYy7hu5BI4R95Q6Phwe+lGL3ToKO6fnnlxnLsFSq
X-Gm-Gg: Acq92OHDUEuPJHVdcncF2fgCkSo/bS/6jqXqmHd9swy3/MH8AflSrRMcTMKmPQ7HbuM
	MC/uOftaEKFEe5VQVyiS0ed4EHVNAHEQWKCSVoF9U8ieNiepYkV7wN85VyekdXqvRKm+jSR2FMC
	cRYOiMIwF7H60X0Ni40NPO0qE9y6CFnxQVnqL8eBplARl2ybk2C4w4Q4U4KqlQ6qWtsnpRkjAV1
	niVoVD9aPGVYx91YQ7zT/LR3JNvyngHQkSxVAa2qE8hVx98eubPepez2xIIBRZFrgPe3HwpqnRU
	lzdpsA3W7MP+0mrTuG5EI7ZbGQ0WZbyjaC68CmevK1Q/PqKqHhJwktQbvi8Y5M8+8HZU/2ksf4r
	wi3eD70f1wFgWarI/JKUX6ijcy7Zuw0JQE/Fd/0VJXzjn1nc/Jn2/gw==
X-Received: by 2002:a17:90b:3803:b0:364:c0ba:c09e with SMTP id 98e67ed59e1d1-365ac48239cmr10946145a91.23.1778225189527;
        Fri, 08 May 2026 00:26:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3803:b0:364:c0ba:c09e with SMTP id 98e67ed59e1d1-365ac48239cmr10946116a91.23.1778225188818;
        Fri, 08 May 2026 00:26:28 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664db38d3fsm1107525a91.15.2026.05.08.00.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:26:28 -0700 (PDT)
Message-ID: <dc58c164-0348-317c-712e-a5baf009b591@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:56:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/16] media: iris: Introduce buffer size calculations for
 AR50LT
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
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-13-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-13-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MyBTYWx0ZWRfX5BW0zc21ZFCT
 ox+IXwTBIpf3vo86PYUMPVk7vmIz1brEdv27KyedFKlBA3JU42J+F3Hn6Es2p7AOe04CAqqKT+y
 Wq2ukfxnkc8uD1QeFpeeK+VcB5QI54GXkNF2PcKEdlWj3XoYGvjEdzvoStDkgo2sGc1jDDWXoEz
 h72ii5M4DMS5b1QKtbtbLWcDzlr+DkvfSaS/u3bxgF+25of3p96kFLi6CYGd8NzlzOnEdj+HW3S
 Xx8SEHdw1NkiphgCP5FOB63WiZIxvG081JJ6DjPCprLtVj9hTCBJzd+E3j6Nw3JFkMpvq6tABCz
 FNr2q6/lRg+z2YdqwNA3WBReid4TGW5wS5IaNQkmgRX0VGNLfJxiuT6LV5zUjMmivSHpQyAjIAM
 f9yJ0W8BVmGwS1DcoyJn3GkXGabGqR9IfT7UEEOTaGdhaov9iurW676SxFPfqErnTZyxRnHJxE4
 DCu6GSnHHOAyErlF8RA==
X-Proofpoint-ORIG-GUID: qVdmhCB39O1NQTsJk8VHseYEAsgg6lLL
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fd9026 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XK4vwoOo7fcNK7NqyicA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qVdmhCB39O1NQTsJk8VHseYEAsgg6lLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080073


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> Introduces AR50LT  buffer size calculation for both encoder and
> decoder. Reuse the buffer size calculation which are common, while
> adding the AR50LT specific ones separately.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
>  2 files changed, 438 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 125fb2d6960d..a1af3bca5dc9 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -50,6 +50,32 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>  	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>  }
>  
> +static u32 size_h264d_hw_bin_buffer_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = ((frame_width * frame_height * 3) >> 1);
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
> +static u32 hfi_buffer_bin_h264d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 n_aligned_h = ALIGN(frame_height, 16);
> +	u32 n_aligned_w = ALIGN(frame_width, 16);
> +
> +	return size_h264d_hw_bin_buffer_ar50lt(n_aligned_w, n_aligned_h, num_vpp_pipes);
> +}
> +
>  static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>  {
>  	u32 size_yuv, size_bin_hdr, size_bin_res;
> @@ -103,6 +129,21 @@ static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32 num_vpp_pi
>  	return _size * num_vpp_pipes;
>  }
>  
> +static u32 hfi_buffer_bin_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size;
> +
> +	size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3 / 2;
> +	size_yuv = ALIGN(size_yuv, DMA_ALIGNMENT);
> +
> +	size = ALIGN(((((MAX(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 6) / 5) /
> +		      num_vpp_pipes), DMA_ALIGNMENT) +
> +		ALIGN((((MAX(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 4) / num_vpp_pipes),
> +		      DMA_ALIGNMENT);
> +
> +	return size * num_vpp_pipes;
> +}
> +
>  static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>  {
>  	u32 n_aligned_w = ALIGN(frame_width, 16);
> @@ -111,6 +152,32 @@ static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>  	return size_h265d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>  }
>  
> +static u32 size_h265d_hw_bin_buffer_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = ((frame_width * frame_height * 3) >> 1);
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
> +static u32 hfi_buffer_bin_h265d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 n_aligned_w = ALIGN(frame_width, 16);
> +	u32 n_aligned_h = ALIGN(frame_height, 16);
> +
> +	return size_h265d_hw_bin_buffer_ar50lt(n_aligned_w, n_aligned_h, num_vpp_pipes);
> +}
> +
>  static u32 hfi_buffer_comv_h264d(u32 frame_width, u32 frame_height, u32 _comv_bufcount)
>  {
>  	u32 frame_height_in_mbs = DIV_ROUND_UP(frame_height, 16);
> @@ -174,6 +241,14 @@ static u32 size_h264d_bse_cmd_buf(u32 frame_height)
>  		SIZE_H264D_BSE_CMD_PER_BUF;
>  }
>  
> +static u32 size_h264d_bse_cmd_buf_ar50lt(u32 frame_height)
> +{
> +	u32 height = ALIGN(frame_height, 32);
> +
> +	return min_t(u32, (DIV_ROUND_UP(height, 16) * 12), H264D_MAX_SLICE) *
> +		SIZE_H264D_BSE_CMD_PER_BUF;
> +}
> +
>  static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
>  {
>  	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> @@ -185,6 +260,18 @@ static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
>  	return _size;
>  }
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
>  static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
>  {
>  	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
> @@ -195,6 +282,13 @@ static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
>  		     DMA_ALIGNMENT);
>  }
>  
> +static u32 hfi_buffer_persist_h265d_ar50lt(void)
> +{
> +	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
> +		      H265_NUM_TILE * sizeof(u32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA),
> +		     DMA_ALIGNMENT);
> +}
> +
>  static inline
>  u32 hfi_iris3_vp9d_comv_size(void)
>  {
> @@ -212,6 +306,13 @@ static u32 hfi_buffer_persist_vp9d(void)
>  		HDR10_HIST_EXTRADATA_SIZE;
>  }
>  
> +static u32 hfi_buffer_persist_vp9d_ar50lt(void)
> +{
> +	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
> +		ALIGN(hfi_iris3_vp9d_comv_size(), DMA_ALIGNMENT) +
> +		ALIGN(MAX_SUPERFRAME_HEADER_LEN, DMA_ALIGNMENT);
> +}
> +
>  static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
>  {
>  	u32 size, height = ALIGN(frame_height, 32);
> @@ -222,6 +323,16 @@ static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
>  	return size > VPP_CMD_MAX_SIZE ? VPP_CMD_MAX_SIZE : size;
>  }
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
>  static u32 hfi_buffer_persist_h264d(void)
>  {
>  	return ALIGN(SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264 +
> @@ -230,6 +341,11 @@ static u32 hfi_buffer_persist_h264d(void)
>  		    DMA_ALIGNMENT);
>  }
>  
> +static u32 hfi_buffer_persist_h264d_ar50lt(void)
> +{
> +	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264), DMA_ALIGNMENT);
> +}
> +
>  static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
>  {
>  	u32 comv_size, size;
> @@ -255,6 +371,17 @@ static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_
>  	return ALIGN(size, DMA_ALIGNMENT);
>  }
>  
> +static u32 hfi_buffer_non_comv_h264d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
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
>  static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
>  {
>  	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> @@ -269,6 +396,20 @@ static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
>  	return _size;
>  }
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
>  static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>  {
>  	u32 _size_bse = size_h265d_bse_cmd_buf(frame_width, frame_height);
> @@ -285,6 +426,20 @@ static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_
>  	return ALIGN(_size, DMA_ALIGNMENT);
>  }
>  
> +static u32 hfi_buffer_non_comv_h265d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
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
>  static u32 size_vpss_lb(u32 frame_width, u32 frame_height)
>  {
>  	u32 opb_lb_wr_llb_y_buffer_size, opb_lb_wr_llb_uv_buffer_size;
> @@ -317,6 +472,13 @@ u32 size_h265d_lb_fe_top_data(u32 frame_width, u32 frame_height)
>  		(ALIGN(frame_width, 64) + 8) * 2;
>  }
>  
> +static inline
> +u32 size_h265d_lb_fe_top_data_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return ALIGN(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE *
> +		(ALIGN(frame_width, 64) + 8), DMA_ALIGNMENT) * 2;
> +}
> +
>  static inline
>  u32 size_h265d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
>  {
> @@ -348,6 +510,17 @@ u32 size_h265d_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
>  		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
>  }
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
>  static inline
>  u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
>  {
> @@ -355,6 +528,13 @@ u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
>  		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
>  }
>  
> +static inline
> +u32 size_h265d_lb_pe_top_data_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE_AR50LT *
> +		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
> +}
> +
>  static inline
>  u32 size_h265d_lb_vsp_top(u32 frame_width, u32 frame_height)
>  {
> @@ -404,6 +584,29 @@ u32 hfi_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb, u32 nu
>  	return ALIGN((_size + vpss_lb_size), DMA_ALIGNMENT);
>  }
>  
> +static inline
> +u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height, bool is_opb, u32 num_vpp_pipes)
> +{
> +	u32 size;
> +
> +	size = ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * 4 +
> +		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>  static inline
>  u32 size_vpxd_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
>  {
> @@ -438,6 +641,17 @@ u32 size_vpxd_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
>  			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
>  }
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
>  static inline
>  u32 size_vpxd_lb_recon_dma_metadata_wr(u32 frame_width, u32 frame_height)
>  {
> @@ -492,6 +706,19 @@ u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>  		ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
>  }
>  
> +static inline
> +u32 hfi_ar50lt_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_vpxd_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT);
> +}
> +
>  static inline
>  u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min, bool is_opb,
>  			 u32 num_vpp_pipes)
> @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
>  	return _lb_size + vpss_lb_size + 4096;
>  }
>  
> +static inline
> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
> +				bool is_opb, u32 num_vpp_pipes)
> +{
> +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
> +}
> +
>  static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>  				 bool is_opb, u32 num_vpp_pipes)
>  {
> @@ -529,6 +763,25 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>  	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
>  }
>  
> +static u32 hfi_buffer_line_h264d_ar50lt(u32 frame_width, u32 frame_height,
> +					bool is_opb, u32 num_vpp_pipes)
> +{
> +	u32 size;
> +
> +	size = ALIGN(size_h264d_lb_fe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_fe_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_fe_left_ctrl(frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h264d_lb_se_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_se_left_ctrl_ar50lt(frame_height), DMA_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_h264d_lb_pe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_vsp_top(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_recon_dma_metadata_wr(frame_height), DMA_ALIGNMENT) * 2 +
> +		ALIGN(size_h264d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>  static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
>  {
>  	u32 size, y_width, y_width_a = 128;
> @@ -724,6 +977,23 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>  	return 0;
>  }
>  
> +static u32 iris_vpu_ar50lt_dec_bin_size(struct iris_inst *inst)
> +{
> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_bin_h264d_ar50lt(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_bin_h265d_ar50lt(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_bin_vp9d_ar50lt(width, height, num_vpp_pipes);
> +
> +	return 0;
> +}
> +
>  static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>  {
>  	u32 num_comv = VIDEO_MAX_FRAME;
> @@ -767,6 +1037,18 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
>  	return 0;
>  }
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
>  static u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
>  {
>  	if (iris_split_mode_enabled(inst))
> @@ -790,6 +1072,21 @@ static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
>  	return 0;
>  }
>  
> +static u32 iris_vpu_ar50lt_dec_non_comv_size(struct iris_inst *inst)
> +{
> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_non_comv_h264d_ar50lt(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_non_comv_h265d_ar50lt(width, height, num_vpp_pipes);
> +
> +	return 0;
> +}
> +
>  static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> @@ -815,6 +1112,29 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>  	return 0;
>  }
>  
> +static u32 iris_vpu_ar50lt_dec_line_size(struct iris_inst *inst)
> +{
> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +	bool is_opb = false;
> +	u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
> +
> +	if (iris_split_mode_enabled(inst))
> +		is_opb = true;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_line_h264d_ar50lt(width, height, is_opb, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_line_h265d_ar50lt(width, height, is_opb, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_line_vp9d_ar50lt(width, height, out_min_count, is_opb,
> +			num_vpp_pipes);
> +
> +	return 0;
> +}
> +
>  static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
>  {
>  	return iris_vpu_dec_comv_size(inst) +
> @@ -822,6 +1142,13 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
>  		iris_vpu_dec_line_size(inst);
>  }
>  
> +static u32 iris_vpu_ar50lt_dec_scratch1_size(struct iris_inst *inst)
> +{
> +	return iris_vpu_dec_comv_size(inst) +
> +		iris_vpu_ar50lt_dec_non_comv_size(inst) +
> +		iris_vpu_ar50lt_dec_line_size(inst);
> +}
> +
>  static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
>  {
>  	if (is_rotation_90_or_270(inst))
> @@ -1410,6 +1737,15 @@ u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
>  	return size;
>  }
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
>  static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
>  {
>  	return HFI_BUFFER_ARP_ENC;
> @@ -1434,6 +1770,16 @@ u32 hfi_buffer_vpss_enc(u32 dswidth, u32 dsheight, bool ds_enable,
>  	return 0;
>  }
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
>  static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
>  					  u32 lcu_size, u32 num_ref,
>  					  bool ten_bit, u32 num_vpp_pipes,
> @@ -1693,6 +2039,16 @@ static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
>  	return hfi_buffer_vpss_enc(width, height, ds_enable, 0, 0);
>  }
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
>  static inline u32 size_dpb_opb(u32 height, u32 lcu_size)
>  {
>  	u32 max_tile_height = ((height + lcu_size - 1) / lcu_size) * lcu_size + 8;
> @@ -2148,6 +2504,51 @@ u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type
>  	return inst->buffers[buffer_type].size;
>  }
>  
> +u32 iris_vpu_ar50lt_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
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
>  static u32 internal_buffer_count(struct iris_inst *inst,
>  				 enum iris_buffer_type buffer_type)
>  {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 1d07137c70cd..2085e316a6bd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -61,17 +61,26 @@ struct iris_inst;
>  #define MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE 64
>  #define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE (128 / 8)
>  #define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE (128 / 8)
> +#define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT (8 / 8)
> +#define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT (16 / 8)
> +#define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT (32 / 8)
>  #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
>  
>  #define SIZE_SEI_USERDATA			4096
>  #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>  #define H264_CABAC_HDR_RATIO_HD_TOT	1
>  #define H264_CABAC_RES_RATIO_HD_TOT	3
> +#define H264_CABAC_HDR_RATIO_SM_TOT 1
> +#define H264_CABAC_RES_RATIO_SM_TOT 2
>  #define H265D_MAX_SLICE	3600
> +#define H265D_MAX_SLICE_AR50LT	600
>  #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
>  #define H265_CABAC_HDR_RATIO_HD_TOT 2
>  #define H265_CABAC_RES_RATIO_HD_TOT 2
> +#define H265_CABAC_HDR_RATIO_SM_TOT 1
> +#define H265_CABAC_RES_RATIO_SM_TOT 6
>  #define SIZE_H265D_VPP_CMD_PER_BUF (256)
> +#define SIZE_H265D_VPP_CMD_PER_BUF_AR50LT (192)
>  #define SIZE_THREE_DIMENSION_USERDATA 768
>  #define SIZE_H265D_ARP 9728
>  
> @@ -81,6 +90,7 @@ struct iris_inst;
>  #define VPX_DECODER_FRAME_BIN_DENOMINATOR 2
>  
>  #define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO (3 / 2)
> +#define VPX_DECODER_FRAME_BIN_BUFFER_SIZE (1024 * 1024)
>  
>  #define SIZE_H264D_HW_PIC_T		(BIT(11))
>  
> @@ -99,6 +109,7 @@ struct iris_inst;
>  #define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	64
>  #define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	16
>  #define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
> +#define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE_AR50LT	176
>  #define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE	640
>  
>  #define AV1_CABAC_HDR_RATIO_HD_TOT 2
> @@ -155,11 +166,21 @@ static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
>  	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;
>  }
>  
> +static inline u32 size_h264d_lb_fe_top_data_ar50lt(u32 frame_width)
> +{
> +	return 16 * ALIGN(frame_width, 16) * 2;
> +}
> +
>  static inline u32 size_h264d_lb_fe_top_ctrl(u32 frame_width)
>  {
>  	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
>  }
>  
> +static inline u32 size_h264d_lb_fe_top_ctrl_ar50lt(u32 frame_width)
> +{
> +	return 16 * DIV_ROUND_UP(frame_width, 16);
> +}
> +
>  static inline u32 size_h264d_lb_fe_left_ctrl(u32 frame_height)
>  {
>  	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
> @@ -170,16 +191,31 @@ static inline u32 size_h264d_lb_se_top_ctrl(u32 frame_width)
>  	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
>  }
>  
> +static inline u32 size_h264d_lb_se_top_ctrl_ar50lt(u32 frame_width)
> +{
> +	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT * DIV_ROUND_UP(frame_width, 16);
> +}
> +
>  static inline u32 size_h264d_lb_se_left_ctrl(u32 frame_height)
>  {
>  	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
>  }
>  
> +static inline u32 size_h264d_lb_se_left_ctrl_ar50lt(u32 frame_height)
> +{
> +	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT * DIV_ROUND_UP(frame_height, 16);
> +}
> +
>  static inline u32 size_h264d_lb_pe_top_data(u32 frame_width)
>  {
>  	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
>  }
>  
> +static inline u32 size_h264d_lb_pe_top_data_ar50lt(u32 frame_width)
> +{
> +	return 64 * DIV_ROUND_UP(frame_width, 16);
> +}
> +
>  static inline u32 size_h264d_lb_vsp_top(u32 frame_width)
>  {
>  	return (DIV_ROUND_UP(frame_width, 16) << 7);
> @@ -289,6 +325,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>  u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> +u32 iris_vpu_ar50lt_gen2_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);

The function is defined as iris_vpu_ar50lt_buf_size in this patch, but
declared as iris_vpu_ar50lt_gen2_buf_size, these names don't match. The
rename happens in the next patch.

Rename the function definition to iris_vpu_ar50lt_gen2_buf_size here itself,
so both the definition and declaration are aligned in this patch.
Or, keep the declaration as iris_vpu_ar50lt_buf_size here, and rename both
the definition and declaration together in the next patch.

>  int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  
>  #endif
>
