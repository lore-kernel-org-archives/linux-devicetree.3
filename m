Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B2286415
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777302; cv=none; b=HKFHmqEW/wBDxkTIkudrYJynSWKTtblysdUpjJ81Xxv1Z1O6xyAksWtKRzi4JamODOXNcKRhC5+I18+vbqS3uMDYGa17Qnhw/IR3WZQxrqrWoxNZzU4Ecndm66aluaMQ70mCtcyF1Vh6BMv5H4QQsHNY4Rv+XDrHAsNqw0Pr2sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777302; c=relaxed/simple;
	bh=3nLtYLFSF0/0HBjLgTBRgRJtaTOHmMO04FN0/7VEpII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIvzeTZkyRvWIIpDFiuAO12xm79x72L7xXqmhYn2OZvvvCDuph1UdssYAi2guXs9vAmwu9fA3EzzzPZ0NxJbcph3KQ4AlC5IK+7zMljDHrG7ijXLLoRzbXk1AwOcnEa4nLb2S7mLKkMbv/Nz25qBmmohafF3/KpSHfQWgd5LbS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFZgrena; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvB2TP4/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFZgrena";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvB2TP4/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE08Mb4178862
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5/lWtloNnIfNbXA6QSNEOy67CLHeyzL4Sp3AyQejEA=; b=AFZgrenaxIKYQYHP
	eIAPyxWdOBavkYQMZ3yZJunIvi/wwGAea1kGZQOUwdyutlJ1/iLazEtabuUIv0on
	25hSZhX4tCnskI1yUv/RqFrqbYDlVfMK95BiXxjdYdkhj1oPIjBM7+AuUmZ1yRm9
	JG4+3rgzUxW8KlQGlBRdfNAkVMGoJWSwfExmX9z6a3JDnmWVg61MBVfQghnC+pma
	jvCEWIOZu1GZFiOJiIRlLJ947UrTGZ5dCwUJHPS3p76Lmua8K3QrDbPoXkaHOmZW
	doezSkwPKo/Mjk0LGzVuMMyawvTR16Y2D4/AU5vSmBUVNYqAyw26VnMCz/3srj7e
	ZMygZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3ksnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:08:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso9392277a91.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777283; x=1791382083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5/lWtloNnIfNbXA6QSNEOy67CLHeyzL4Sp3AyQejEA=;
        b=NvB2TP4/03qq1MdE4UFfTciRIdDg6n9Jcgk4i80GDHflyGFTI6HB7FTQClug2QHDDd
         F+Cu/FAOyhw8mj2hGyskfbgY4htVWe/LHti2JrvcToqrK/bdMu6El/4tU62XcHjm/WYR
         FJIFG41D3Sdtps7A4xa+QSRfT9CEac+Mh1Iu59cdHbkblSNW7PUqmrEjyArxrVtbsBHz
         0K/6InlJ2Hzhq4m5FxZzuDc26URhnmgpWP12HmVuyBECnWT44SpzFvGncPOYV4FXCCKP
         07Jk4gh6+EScYSSosIl22l8AoD4rtJQSShuNAEt67XfBld9sAO7nQZns487INCNolLYD
         tbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777283; x=1791382083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5/lWtloNnIfNbXA6QSNEOy67CLHeyzL4Sp3AyQejEA=;
        b=KJyVKX/cq17P4ixBJiJbYQsS7AMUe6wWTw97KY/fKmLBRQqd6wluyxDiv1TZP0W9Ha
         sLhaYS+uSy0m97gSg+J0rRZ1myJZLshe4BA3iHCs7J7Lo12NoAURzXGQbow+/CtGHuEp
         QOG8PIUrW7p3lWQTEs6E84p9lHKnXwnGGQFXcFdCJjH5p9isp42PLoUkwqTWhnjQnbs9
         ChATbZTr/Gl8ocNQuGuwANwXskILzyghbwoaP4OA9SYfeKoM0sqr3m4f8MJQICIFLKAg
         UxwyOXHXGJPnWoYO+s/FMe3bk4ArNVhjXTP3NafX0JMCONs7SaX4SukVJBRtaCFbmtof
         Uo2A==
X-Forwarded-Encrypted: i=1; AKwUvBw131SNkhIc3+aQLixNXPLJYSpDOspBHC5dm0Y7qAIwJwg6BN1PPXIWrfKlq142kpdjWII0C8EPpF+6@vger.kernel.org
X-Gm-Message-State: AFq9FYId2kbpL/xKIaPlEgLNGtToWVckq8Uwsc0e6NOGHfYlP5Bfq00Y
	PmUihm3hWROkrgNzJPcIiV0WU89BlKeEWOaAm9CYsgAHp2WrtvWCNMWl1+NOrhBzltxQvTkCXay
	RvR47SGdfEbkCaq4qqkl2xxI/OpPW/jBz0Bwxv1w93F0xCDl4p1NwVgtRCBNshzCF
X-Gm-Gg: AYBFou01KIT/pmjOIt6EfPXqu6PSTUCqL0Eb3qSPO+bDFLsYPC9lC2RojS4QQV2Ot9Y
	9JDMZocmS71PILa+Zramdu0N5kabbPoBSb/H0z1FK0867rghaRL7xjbWri8EE3OBxo1yn4Msx1a
	2V+4fEzTBOAXBX+eNS8ZbM+O5SWJueVeqR1AnNg/YtKLW7KjHKx0xkodDi3gJnr9aMHLZnSX2r+
	cjTCll5YOVHjx8b2idCAVv20ESoG9bepUHLwPrsVKhoTASpXEpCto4jillzd7SEoFZZ5Bs6Kt+F
	RLAyVqIiGKyTPZk8GKxYNQDHRPIIyyrsiL/hzD0L+E58oLCqFm06xNANDnAoatlLNP6VpABksBh
	3lgMfNich2RRjkE4Kd43hr88qiE30kNUIMmcznOewAbrKO1L4OU//mN0x+E9nWM0=
X-Received: by 2002:a17:90a:2cc5:b0:3a4:e635:a8b9 with SMTP id 98e67ed59e1d1-3a4e636a641mr365461a91.32.1790777282572;
        Wed, 30 Sep 2026 07:08:02 -0700 (PDT)
X-Received: by 2002:a17:90a:2cc5:b0:3a4:e635:a8b9 with SMTP id 98e67ed59e1d1-3a4e636a641mr365426a91.32.1790777281916;
        Wed, 30 Sep 2026 07:08:01 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e5d9adeasm628557a91.0.2026.09.30.07.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:08:01 -0700 (PDT)
Message-ID: <a77004e6-c375-46fb-ba32-bc6f34bba2ab@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:07:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 07/11] media: qcom: camss: vfe: Add support for VFE
 Gen4
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org,
        olteanv@gmail.com, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org, robh@kernel.org, media-ci@linuxtv.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-7-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061755.8BA321F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061755.8BA321F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TZg-ov1Xc4DcVppvvvd-WIompvzf-grl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX5dFtTiv4Zhe2
 W7dPfxUJnY3Kuv8ne4gDJlN/XX9CsmK0mYwpE0eRqS8JxeHLeaB5r5/sYWLmHWNFDnhaJqEoTo5
 7HFdMn1Wj/qOtTW6KGL9YYtQGpgSx26aJFy242ffjmJW7o9hDDM3JhIGgscEN7NoDXaiN293jao
 EpeIE5ra33DV9g6cKwK3ARkNzx9sjV+I4xV4KONHVvNEf0I6SO9MylERS6eCMwFDtc4eomS2FwP
 bOjHPDiBlvLg5ZHvnVZTR6ytpQgCQv1KK4Pb85Tz/40FTEc9mqq4q1cp6ypKgjMHDLJCqTfokL2
 ObgKFba0yL7m6JAuKjfxmuOOvIhr77/qpVF9juDckIQNGtNyF/x79KduR3m7Goi00qG+Xot8tMq
 t36riW/EyqubNadEg8W2txtHXolMv9gj2ZPFvrdRf7l8BHrrQJteL+hGlEBARAACCD3jbG+d1Ls
 hGXz4EIgxKKWdZ5Y3GQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX6FB6M3gqUTSN
 tlw7fRiTUDjijSYyYI9jXRigL7xCa/meo5L2IHOlxdy0G7slQwhfCamrVCYzDkpI/0Q9GpoUXf6
 +fCV8fnUFHiVerDXc939tjithObJsro=
X-Proofpoint-GUID: TZg-ov1Xc4DcVppvvvd-WIompvzf-grl
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd17c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aJ_sJalLn2DonVaVJ1AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] camss: hardware constraint violation due to unconditional AUP_UPDATE loop in CSID
> - [High] camss: subsystem API violation where IFE Lite's 4th RDI line is incorrectly configured as PIX
> --
> 
> commit def99c6cf972d2305c4c27701233f42e411f7857
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: vfe: Add support for VFE Gen4
> 
> This commit adds support for the VFE Gen4 (TFE) found on the Kaanapali SoC.
> It configures the hardware blocks and clock requirements, while deferring
> REG_UPDATE and AUP_UPDATE until after CSID configuration completes.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> 
> [ ... ]
> 
>> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   		output->gen2.active_num++;
>>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>   				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>> +
>> +		if (!vfe->res->reg_update_after_csid_config)
>> +			ops->reg_update(vfe, line->id);
>>   	}
>>   
>>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 
> [Severity: High]
> The commit message states: "the number of AUP_UPDATE requests must match the
> number of buffers queued to the write master while it is being enabled."
> 
> In vfe_enable_output_v2(), the VFE loop shown above queues pending buffers
> dynamically up to CAMSS_INIT_BUF_COUNT, but breaks early if userspace queued
> fewer buffers. By setting reg_update_after_csid_config to true for Kaanapali,
> this defers the update to CSID.
> 
> However, the corresponding CSID code at csid_configure_stream() in
> camss-csid-gen4.c blindly issues AUP_UPDATEs matching the maximum buffer
> count:
> 
> for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
>      __csid_aup_update(csid, i);
> 
> If userspace queues fewer buffers before starting the stream, does this cause
> a mismatch between the generated AUP_UPDATEs and the actually queued buffers,
> violating the hardware constraint?
> 
No. The hardware accept this operation and no issue is found in tests.

>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
> 
> [ ... ]
> 
>> @@ -158,6 +158,157 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
> 
> [ ... ]
> 
>> +	/* VFE3 - IFE Lite */
>> +	{
>> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +			   "vfe_lite_ahb", "vfe_lite",
>> +			   "cpas_vfe_lite", "camnoc_rt_axi",
>> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
>> +		.clock_rate = { { 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 266666667, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 200000000, 300000000, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 0 } },
>> +		.reg = { "vfe_lite0" },
>> +		.interrupt = { "vfe_lite0" },
>> +		.vfe = {
>> +			.line_num = 4,
>> +			.is_lite = true,
> 
> [Severity: High]
> The commit message explicitly states: "Support is currently limited to three
> output lines, matching the constraints of the CAMSS framework."
> 
> But line_num is initialized to 4 for the IFE Lite blocks.
> 
> Since the CAMSS framework hardcodes VFE_LINE_PIX to index 3, does configuring
> 4 lines cause the 4th line (RDI3 with id 3) to be incorrectly subjected to
> PIX-specific logic? For example, in vfe_try_format(), this would force a raw
> RDI dump stream to use PIX format tables and validation:
> 
> if (line->id == VFE_LINE_PIX) {
>      struct v4l2_rect *rect;
>      rect = __vfe_get_crop(line, sd_state, which);
>      fmt->width = rect->width;
>      fmt->height = rect->height;
> }
> 
> Is this initialization to 4 lines unintentional given the 3-line limit
> mentioned in the commit?
> 

It's acceptable to align with the commits. Actually this is a CAMSS 
framework restriction which needs additional efforts. Will keep it the 
same for TFE Full and TFE Lite in next revision.

Best Regards,
Hangxiang

