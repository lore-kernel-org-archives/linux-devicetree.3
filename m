Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3BB39FCDC
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866105; cv=none; b=UcXTX4jZEza4yJbBCsFi1wdoH3vqO/bHI9YgjnIJ0hxgk3wZDfETroti6Eu8ltqag424SBtOEK567Hal3bE1RH/nb7O96oLCwUmjA/S1fHWFOmAuQ6k84AIVsJEWPcWmrYZPMLp6t59FpEvw4HgGdXEANqOXTEf1brvEY0pbDKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866105; c=relaxed/simple;
	bh=FyHV6m1/EZNSXKgsHhXYskeROCY3tmOhN2JCOk0WzjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uv11lgbIAU5QDYV3uVALxQRfKWixpMBK69IKAUrVfx0PNkx1VxZBMSr0nwGAqCga+Vwf7X4W5G0gHra++TOEr1M1wi6uM9kZVPC9DZIC8vknf3tD+2LtbOLL1PIwczACVe5QSB74yAKt9j6tatp/fHCKP9LiFpj9Smd/AjBOG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqTIDY0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnUI0/ip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqTIDY0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnUI0/ip"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DidvY3776294
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 14:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KF52VAg0Bn4Q1lcMkRsMEw9QoplDZ6ZD0QBTPKprAo=; b=OqTIDY0sRff/ncXM
	5X8EZDnDIYUFw+gzjsjmnihbGkv1Sy74CpbvZS6450AyFymvtYAnEAsT4fyoQZgy
	WUL/dXW5qpIbAvXYxvMegI4mtbVCHBc00qfa3uQQ7hIVeI0U5cVwy46D0312fPif
	OAW1eaTYNW4JuWC2y0L1rlBilLgbph/a/9HxIGNHnuuRkW9aSP2gkD3Vh9ZobRXF
	oTjFO7kJhBT/h/XCkaBCbC8ThuZR1aKlIlbP1cHs0SIx+TfCYUNGQZO32i+fpnVG
	z3kyzViNsJNLpVc9b3EDOKRYvvwDAmVVADLzaUo7/NMeFSIwd1AtQkevXZgjBl9d
	PDfgFg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b8ybk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 14:48:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso4104785a12.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790866102; x=1791470902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KF52VAg0Bn4Q1lcMkRsMEw9QoplDZ6ZD0QBTPKprAo=;
        b=VnUI0/ipKgZqq612H2hmmoaQ1NuGZMT5PuKK9C/W2XXLcl5RGxeb1aA8U9kTikKYIZ
         NDR9i0/JdH/bM054LIn87QJJwvgbIbTb2Ikb2xFN3JyfSPtv9jTaUCv4/T7UcEaODPL6
         KxBY34XNqXTiD80f24nmTh2qNnpxZLZ9hawpJOk1DNUZyQpyVfHLX/MXGZglBxgmhAiO
         gIh6vzD8B2DcMdcDvPL3cKDyXmtDp/GZAHb3sNmvd/HseNe711sHxs8tXQN0ncj45oST
         vpun6uku95QSj+aYkOnLrUJ6YL9Gw7N5t4p/OqDDTwheEBU+pi/SFaSF6yZV1tAFoAHR
         YyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866102; x=1791470902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KF52VAg0Bn4Q1lcMkRsMEw9QoplDZ6ZD0QBTPKprAo=;
        b=Sy/50vam+sV9u4ousK3XqO3BoTmYFy+jeAisR3cUtNT3Vf49Rqsx3YUuXwtErDgO3x
         dC/IY+XsZdrUiW+UsYhzRkT5uX9JxqeUtBYbk+X7inZfu+rB1BHVF8vQ1lU12VSZykof
         YIFnTf/A988MOOtYUmTPlq0cY9ga4L2i66w7GrAIm/r1cUvDb5QBafU4VrmxLNwvtE29
         +iiz4/YxrU3TI48lzITj+2YrcNnYpr6dICsEGOqVM/KZ4bi1bIoklOwD/M8Xzfs8U5Hf
         jBPfWvts8Tq1gP+Lph65+gHcR1Z+sZhOmkxzA7uMYGIzkcq4vd5huTeSc2JcdaajJqBk
         yTFg==
X-Gm-Message-State: AFuF++kA48DEyqQz5UO2WIKUnIDg0/mGAYCCTY7J4PN2tCh9gsBG0KK4
	7VA3+N6doEwAlFJ2Ui/15wBhfeynjTinzEaH2i50debuFO21W6y0owc+IMB2sYV1fknB9fx2U0Z
	R8YGtT+WqTvELBjjDIzc/lrCHAil7PCuhX6XiRzQJs3PMPCIYEVhpxwLC6/yAIu3+
X-Gm-Gg: AYBFou2ETLyAEpcehH7HnqyLGCNKrExkt6fyvc0o53Lb5OiO2FfFJinkyuIVDRSnO42
	S0mubQYa61xmRVxojIUUrIZzQumTpFTC7FEVkJ5BYTmWguAXp7pdr0pXqQYCHfMPCWnXX4KpOjF
	MB1fDZB9OE1mkvwG0fNn9becCTy4iFMJ/CSw3fMzx26ta5R4gbFKXbOK9u36u2F7dwGxGI0+4F5
	5H9zjAUJfYb4hvjPsA5GJfLUlzO8bK4EC2peUqYpdK/DUY39OwsB2UtVOcqMjXGC8rdxrsjaX+8
	3lT3zQv+H6FCbmtitT0SUpcV0ajYMYmKRyl0/1KaVt5ER5gO8J6eE1XStRUaKrig95pBIKP8h/g
	PS/Z5H9IFDgR+FjEzAHzZBcjgMXSCRP9TJdLW
X-Received: by 2002:a05:6a20:d791:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3de9e6e8391mr4704649637.16.1790866102476;
        Thu, 01 Oct 2026 07:48:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:d791:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3de9e6e8391mr4704629637.16.1790866101886;
        Thu, 01 Oct 2026 07:48:21 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e539b9d2sm1653364a12.4.2026.10.01.07.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 07:48:21 -0700 (PDT)
Message-ID: <b5b4dc98-7c46-4482-ac6a-dc3f042d3947@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 20:18:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com>
 <20260921030315.BDF9B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260921030315.BDF9B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Y8OSFi1tW4xZMpUNdTVl2acSBwICIBS
X-Proofpoint-ORIG-GUID: 3Y8OSFi1tW4xZMpUNdTVl2acSBwICIBS
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe72b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yF5iw_r-_bYeXxWltswA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1OCBTYWx0ZWRfX1e984vBqagAE
 y9y0zWmkjQk7HSgyDXZNVpZrE0a/vGp7DpsYGizJDMGH498MJagOMh6bDdfTRHITh24lfR1jy+n
 jDwmOxdXvjyMoGBn39B8vscANUGnqx0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1OCBTYWx0ZWRfXxBbuNjq1Ryk3
 VDfij+VCCYKmdv8pnoVqF2asMp1t/BBRMMkgt8PRSwisaSuz+Ojv88EWOrh+X2P+LfsRcspbpoj
 uvQV9NEWbrzfARTJfFZs6zZqsKu0CdOnxDZn4cn3YhAqqwZvK82D0pMwuUGByrfvoUQiKqArdTr
 dT6QR6sZ96RnioQx0IzUwBVWdEfBc4kN4UmoHrcuLJHBHlhRDhvDdlXVf7uJbm8wd2lpghCckQT
 8+F0IsT5jQZOQbw9deAbYp6vEZ1WUoN3fJEyjgr7OosUY+XXl3Ozf0y58v+k5wZVo8WvyuN1Bwx
 5zH2Yzf8lAE2+14itKS2GNXWena3m0RrVHInX7RFX+Qy1VP5/DnrHJzs1ddZYgr0iUptKOARwR/
 0vrkbVaG+WIpJOSqcyTb6dMJE8Zyt+0NahPn7WgJKltCMK2hbLNrQq8h8ZpNi+6xk+rcG+4pIZt
 CttwCk3S17UJlcOeucg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010058


On 21-09-2026 08:33 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wwan: qcom_bam_dmux: probe error path reclaims DMA pool before disabling IRQ
> --
>
> commit 4ad4e0793e663284df130f5d11d5a4f0bb1754cc
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> This commit introduces restricted DMA pool support to the BAM-DMUX WWAN
> network driver for Qualcomm SoCs. It assigns the pool to local and remote
> execution environments during probe and reclaims it on driver removal
> or probe failure.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d64371..c81e668d4e961 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>
>> @@ -845,6 +938,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   err_disable_pm:
>>   	pm_runtime_disable(dev);
>>   	pm_runtime_dont_use_autosuspend(dev);
>> +	bam_dmux_reclaim_dma_pool(dmux);
>>   	return ret;
>>   }
> [Severity: High]
> Could reclaiming the DMA pool here lead to an XPU violation and resource
> leak if an interrupt fires concurrently?
>
> If probe fails late (for example, if irq_get_irqchip_state() returns an
> error), the code jumps to the err_disable_pm label. At this point, the
> pc_irq has already been requested via devm_request_threaded_irq() and
> is active.
>
> If the remote processor triggers this interrupt, the threaded handler
> (bam_dmux_pc_irq) could be executing bam_dmux_power_on() while we are
> calling bam_dmux_reclaim_dma_pool().
>
> This concurrent execution would cause the DMA pool to be reclaimed
> while the BAM DMA controller is actively using it, resulting in a system
> crash. Furthermore, when devres eventually frees the IRQ, any DMA
> channels or mappings allocated by the racing handler would leak because
> bam_dmux_power_off() is not called in this error path.

Makes sense. I plan to reuse bam_dmux_remove() for this, which disables the IRQ
and releases the DMA channels, mappings and any registered netdevs before
reclaiming the pool, in the same order as a regular remove. I will test
this and include it in the next revision.

Thanks,
Vishnu

