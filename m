Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1FC1A2C04
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912264; cv=none; b=WEld+sJwv8OX3p10TSMxZ+tmJlchQPEsvxVfPKIy2KnWJLZWPxBPwzR/efs8gJFEuoJB8+lXQA9KbsjfrTUQT1ys9MY0bgekCDzJzIRbO9QwDQ4/6eK6CkWJvQmO/YlSugVmZBBMFpxsSocPkDm4v2mS6kdntYETVC69IevX9bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912264; c=relaxed/simple;
	bh=mDbV3v7IGBqVycD0ObKy44+eHDQ3Yt8L6D3S1h4aar8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFXB9NX3tqEPL3xbZpbJRh6zLNv+9Mr7JFEMQYyEhxWwXpvnkqvXAxJInpyN00VHNtFLcmlsC6fYuSx8Yo1lilAQQCPUSFbme+9kYMaS9jRHkTmbQZawMiN+iRv0joUCCW5QqDRp/3+5Xokqz0THoVyCQoROeHQvQOfd4euVsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxjEtdz8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkMrLg2e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxjEtdz8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkMrLg2e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8WeM680973
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67QuYRt+j36IR0FVaeM2JIjV
	JpPGRXJM35kB9AKweaA=; b=ZxjEtdz8VxCSiXbSk3fR9ONGWdDmvtwLJdOIrQEs
	Uaxdc5aP9nG1najkEwEM6f6LAtebv440GGsQFyOqDcUyOqWJbYGiDiO5GHARNi1k
	g7p/QeO5XHQEfMsQLAtKDW2hT93ZbVu8m/CqZenQf5W1bW3ZKutVP04wvw0Ql1+k
	sVlb6P4pBNpiFIdwlKc0H8p9Twt5/GQM9DMdYS6ECqPBUFykLP//TVz5WEGBbpSG
	SJHlHCTSXc4SySJW1LQ5U8sQWeEuqB/69e0nMaMlqrrqY1VsuCkPAPr47Ms61vr9
	XUb7a1OpKnsJXqoGE6YAFoErJPIToXZOAW6GEvp2YbkUnw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3smdc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:24:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so220251e0c.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912261; x=1783517061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=67QuYRt+j36IR0FVaeM2JIjVJpPGRXJM35kB9AKweaA=;
        b=EkMrLg2exEQ7r8PGbLpaQQtylmNarjkJUddDFfj6BLG2t6uce++iw0f7bxVjdOeOCl
         +arJxB5CIBkYimv1wgM0XQC78yJYTc4DtbxeZq1G0FAummNssxtaWHs5RxogQsuUVYa7
         3hMnGSRSJtii3Zce490IXDMwJtsK9zVtu5yImks6HYobIzb+GgdtZv1ETcSGgp+GFLei
         iDXY8BGKr36smkSxcTdaoI/q0X3q97ygMHFaeIJwX0g8Dvcj9QDnZVWu4mYONF/1qx4u
         N20iOKegiIYv89C/6GM5Y3XN6rG6bTdmnIEU8QJrZxqoyTUXq/zn8jMH2l0QQSaepcDx
         pSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912261; x=1783517061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67QuYRt+j36IR0FVaeM2JIjVJpPGRXJM35kB9AKweaA=;
        b=fzoMLPbYSNvUgHDvQ/AnH/UAypjBDpf+oY9i4XNOh6Ko+GP1ntk2JZTzqgel+RujbO
         JP0qyLcfBpmoVFhtn71/lnJJJ++S51GyerZs+rym3KlpsjG0uQkF+7UFa5mXYLuM5rgN
         XuEwpKYuKTGTb0MZbQ5zJY8dmAJpQvRQltGoizmUmmt+KRgske9B7P7XZWre0D0y9EKv
         9Ofp6swpHwWTyhJhBoETEBPl1wR42mqbpl0C/OAN/gBURstoIvy4krOGdH4ZUmkV1jxL
         EZlJYPHNwrx/9MrKwgKqUcdF5OU+EsUetxs6+i4TC8a+c+R+Db3WF+IhR8dsARb3VQKM
         jgPg==
X-Forwarded-Encrypted: i=1; AHgh+RpAzr+S6XE+RW5voz39AP/w/nf9/ikiOvECk8YCDy1tmUf98ZbLkkfpf98LdJ/Y9GAThfZKheaa64rD@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNvlg3/aW77B+vvsXoezUTVgq4uCYY4OADCFm1OF9hQhOtyQ9
	HoQTEDc0/TM11HbzXE3+3Oe0LElWjjWQc7Qpv1uxT4V5xi9EzpNeEy56oftzngwvEqen1It8TbB
	4owsis30dCMvP84EDuLzbGVH+aoA5E/JudhHqK5qYpZ2+qSEbTripdKIFVoc425xC
X-Gm-Gg: AfdE7ckNkVB8/tKGoyeLme/1ver0WW+WNArFlvlcnt9rs3Cw80togJvJjrk1y5t0LO7
	U3Y3fWazuh0XKQdc/6Ven0dut8FHUq/Xvd+a0FcNQVEMIc7vfQzbdGNpcm4/IpkLEa3KON4D7HM
	l5af0oXOXc3NsMQRbxHOOq93v3rppJKWb4ivv8sM5aVvTR2MGBwcv+5kK6FkikXnkds5RMtxLiK
	gkklbwDdtIbpGugVp2pX8KHvcieXYvWi73zlMVSg2VV1neO69voNxdBPB+5xtvU0bdiKf7NCTvs
	XgVtGx0poYcjooD6hXBn4oWkPL3qKStdBWQtOnqnjlCWlw/09j8Drj7slL1IpLTudp5mK1n4+WS
	3JRR7qATcHhkQL+UE+Gf8PBAiP7jBVfomWMB44nbxWP4uVrEwcdCrpO41EEm/xsfNM+doNzY/dR
	xoXw8R4V6bZya+xnmr8rumaByK
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr269703e0c.11.1782912260466;
        Wed, 01 Jul 2026 06:24:20 -0700 (PDT)
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr269692e0c.11.1782912259914;
        Wed, 01 Jul 2026 06:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec487405bsm413000e87.20.2026.07.01.06.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:24:18 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:24:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 12/16] media: iris: implement support for the Agatti
 platform
Message-ID: <gqy3msdsk3bjupkvq2mnmnksxeivp2now5a2tg4pun5h4t6hp3@yt2c443vyen5>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
 <4fb441a2-ce18-40a2-8227-5167779d1ed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fb441a2-ce18-40a2-8227-5167779d1ed4@oss.qualcomm.com>
X-Proofpoint-GUID: QpUftWpABio-9SbTHZuZ4oikjEXhCeh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfX8YKCht5+a8hY
 U3KlV5b04bG2PRw1KwnJFGp6iQ2fKxewfGLW25g0zat2TxXzA8ZVW2vovGIwQK9W939HR1+G2BX
 ud3d3sAj6C1IoUVn7YdRG78buC4VV6garwe7Z3io/2n+Zf15XVGwwsyD3XMU7zA3jI4Ye47gmp+
 2mUXF+725gsdQQ9if4qLdz6iWkX5NSpsD1XiYJpiohk3+SSZo/AHqwug4JILZK4NqxtX7ZYUfmx
 TCI3noJB0EcolWWV9wSL23GQcs6eRBNLZo679Od3mlnSLAdehrrUIDBxIeWg17gN+0k++uYVJmA
 s9dVeW7Hhio+in0b+ZcBBoa2EHvPygpICqq1fQ6hbZmrUac3IMoBFOuCZ0RVzNR0gH9Lk2pAbSn
 pQg3gU91p78xgYHZlPSyMxgg38loGU/X3EHeCkW9t8N54b/pqQ/Zuu/9NATyPPKQ9cImS630P23
 HXINAxMObm7Hi55wVcw==
X-Proofpoint-ORIG-GUID: QpUftWpABio-9SbTHZuZ4oikjEXhCeh6
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a451505 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GaV7wLYTZcZhLFzwE0gA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfXx+KdGN9Li4Qx
 +IMKJIGofwy+rw9QkkzffFiEW5GHNo2+dLgAVajUG48ZSPn7pAVK85xgqyUvnv2+SusmLKfXmvL
 NJIRcyd+WOxosgrkEJm3bGXEgI2xR+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010140

On Wed, Jun 24, 2026 at 07:47:43PM +0530, Vikash Garodia wrote:
> 
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > Port support for the AR50Lt video codec core (present for example on the
> > Agatti platform) to the Iris driver. Unlike more recent cores this
> > generation doesn't have the PIPE property (as it always has only one
> > pipe). Also, unlike newer platforms, buffer sizes are requested from the
> > firmware instead of being calculated by the driver.
> > 
> > Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/Makefile          |   1 +
> >   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
> >   .../platform/qcom/iris/iris_platform_common.h      |   6 +
> >   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
> >   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
> >   7 files changed, 362 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> > index f1b204b95694..bbd1f724963e 100644
> > --- a/drivers/media/platform/qcom/iris/Makefile
> > +++ b/drivers/media/platform/qcom/iris/Makefile
> > @@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
> >                iris_hfi_queue.o \
> >                iris_platform_vpu2.o \
> >                iris_platform_vpu3x.o \
> > +             iris_platform_vpu_ar50lt.o \
> >                iris_power.o \
> >                iris_probe.o \
> >                iris_resources.o \
> > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> > index ca1545d28b53..f57af31dbd9f 100644
> > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> > @@ -443,3 +443,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
> >   	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> >   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> >   };
> > +
> > +static const struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {
> > +	{
> > +		.cap_id = STAGE,
> > +		.min = STAGE_1,
> > +		.max = STAGE_2,
> > +		.step_or_mask = 1,
> > +		.value = STAGE_2,
> > +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> > +		.set = iris_set_stage,
> > +	},
> > +};
> > +
> > +static const struct platform_inst_fw_cap inst_fw_cap_gen1_ar50lt_enc[] = {
> > +	{
> > +		.cap_id = STAGE,
> > +		.min = STAGE_1,
> > +		.max = STAGE_2,
> > +		.step_or_mask = 1,
> > +		.value = STAGE_2,
> > +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> > +		.set = iris_set_stage,
> > +	},
> > +	{
> > +		.cap_id = PROFILE_H264,
> > +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> > +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
> > +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = PROFILE_HEVC,
> > +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = LEVEL_H264,
> > +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
> > +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = LEVEL_HEVC,
> > +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> > +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
> > +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_profile_level_gen1,
> > +	},
> > +	{
> > +		.cap_id = HEADER_MODE,
> > +		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> > +		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> > +				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> > +		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> > +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_header_mode_gen1,
> > +	},
> > +	{
> > +		.cap_id = BITRATE,
> > +		.min = BITRATE_MIN,
> > +		.max = BITRATE_MAX_AR50LT,
> > +		.step_or_mask = BITRATE_STEP,
> > +		.value = BITRATE_DEFAULT_AR50LT,
> > +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> > +			CAP_FLAG_DYNAMIC_ALLOWED,
> > +		.set = iris_set_bitrate_gen1,
> > +	},
> > +	{
> > +		.cap_id = BITRATE_MODE,
> > +		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> > +		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> > +				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> > +		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_bitrate_mode_gen1,
> > +	},
> > +	{
> > +		.cap_id = FRAME_SKIP_MODE,
> > +		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> > +		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> > +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> > +		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +	},
> > +	{
> > +		.cap_id = FRAME_RC_ENABLE,
> > +		.min = 0,
> > +		.max = 1,
> > +		.step_or_mask = 1,
> > +		.value = 1,
> > +	},
> > +	{
> > +		.cap_id = GOP_SIZE,
> > +		.min = 0,
> > +		.max = (1 << 16) - 1,
> > +		.step_or_mask = 1,
> > +		.value = 30,
> > +		.set = iris_set_u32
> > +	},
> > +	{
> > +		.cap_id = ENTROPY_MODE,
> > +		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> > +		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> > +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> > +				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> > +		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
> > +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> > +		.set = iris_set_entropy_mode_gen1,
> > +	},
> > +	{
> > +		.cap_id = MIN_FRAME_QP_H264,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP,
> > +		.step_or_mask = 1,
> > +		.value = MIN_QP_8BIT_AR50LT,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +	{
> > +		.cap_id = MIN_FRAME_QP_HEVC,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP_HEVC,
> > +		.step_or_mask = 1,
> > +		.value = MIN_QP_8BIT_AR50LT,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +	{
> > +		.cap_id = MAX_FRAME_QP_H264,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP,
> > +		.step_or_mask = 1,
> > +		.value = MAX_QP,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +	{
> > +		.cap_id = MAX_FRAME_QP_HEVC,
> > +		.min = MIN_QP_8BIT_AR50LT,
> > +		.max = MAX_QP_HEVC,
> > +		.step_or_mask = 1,
> > +		.value = MAX_QP_HEVC,
> > +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> > +		.flags = CAP_FLAG_OUTPUT_PORT,
> > +		.set = iris_set_qp_range,
> > +	},
> > +};
> > +
> > +static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
> > +	BUF_BIN,
> > +	BUF_SCRATCH_1,
> > +};
> > +
> > +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
> > +	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
> > +
> > +	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
> > +	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
> > +	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
> > +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
> > +
> > +	.dec_input_config_params_default =
> > +		sm8250_vdec_input_config_param_default,
> > +	.dec_input_config_params_default_size =
> > +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> > +	.enc_input_config_params = sm8250_venc_input_config_param,
> > +	.enc_input_config_params_size =
> > +		ARRAY_SIZE(sm8250_venc_input_config_param),
> > +
> > +	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
> > +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
> > +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> > +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> > +
> > +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> > +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> > +};
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index 6a189489369f..bc04831ae7fc 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -39,6 +39,10 @@ struct iris_inst;
> >   #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
> >   #define MAX_HIER_CODING_LAYER_GEN1		6
> > +#define BITRATE_MAX_AR50LT		100000000
> > +#define BITRATE_DEFAULT_AR50LT		20000000
> > +#define MIN_QP_8BIT_AR50LT		0
> > +
> >   enum stage_type {
> >   	STAGE_1 = 1,
> >   	STAGE_2 = 2,
> > @@ -51,8 +55,10 @@ enum pipe_type {
> >   };
> >   extern const struct iris_firmware_data iris_hfi_gen1_data;
> > +extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
> >   extern const struct iris_firmware_data iris_hfi_gen2_data;
> > +extern const struct iris_platform_data qcm2290_data;
> >   extern const struct iris_platform_data qcs8300_data;
> >   extern const struct iris_platform_data sc7280_data;
> >   extern const struct iris_platform_data sm8250_data;
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > new file mode 100644
> > index 000000000000..393256f39112
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > @@ -0,0 +1,110 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#include "iris_core.h"
> > +#include "iris_ctrls.h"
> > +#include "iris_hfi_gen2.h"
> > +#include "iris_hfi_gen2_defines.h"
> > +#include "iris_platform_common.h"
> > +#include "iris_vpu_buffer.h"
> > +#include "iris_vpu_common.h"
> > +
> > +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x10
> > +
> > +const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
> > +	.firmware_data = &iris_hfi_gen1_ar50lt_data,
> > +	.get_vpu_buffer_size = iris_vpu_ar50lt_gen1_buf_size,
> 
> unlike gen2, gen1 is calling buffer_requirement from firmware for every
> buffer types. And given that call is a synchronous call to firmware i.e it
> calls and wait for a response, i see it can cause delay (and infact not
> needed) if called for multiple internal buffer types. Can we see if we can
> call that call once ? That call to firmware (get prop for
> HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS) fetches requirement for all buffer
> types.

This matches the Venus driver, it was querying buffer properties for
each packet. If we query buffer sizes only once, what would be the
condition to re-query them? One of the property updates? Which ones?

-- 
With best wishes
Dmitry
