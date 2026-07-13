Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BE3B14AF
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931458; cv=none; b=cdPPnwG2tQq8+nUX2cCtGhUe6AMQP27UcDoj+VlJSjVXFZekBUX6fTdYOnR77KXEWvjRPncVMqy9aUvWq6r3BtCeOPiDaeEAvRUy4X1Ll+zKAoBYLPH7klCOpzwSJ43gFt/g6qk5ZZ0N+gooxxpHx2G2yB0fyAmF8teZZ999vcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931458; c=relaxed/simple;
	bh=ox6Z94BZRgLqASrZyKkY5G6KpcMeLAUyU7fdgaJxuKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AffgMfRgP4WAqieDZR1YgusTeqsp2VX8Zzeb/WnweqNZFLFSbRx+XZmRxmqEA1Mnmy+x1ZDGFMOdRmLPEmhHM4M7cHuzQCU917QUSTierMX3tDVpXdmqEiJqollnE1TFqfKbafsYLLB1dt6dMazcBx9GeRQj8YbKesyJBGAPP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNzN2v5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyoOZH61; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNzN2v5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyoOZH61"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NxhY674494
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dtBJLacOGGttlAIKQe354mVWyqsRLsF0Nl3YOfEBx8=; b=WNzN2v5bhN69YL/9
	ky/gO34vBXIlAV1Evbp5dsfLonGY36gh7xKfxuh242cO7i2mnZgVUju6/7SZI5Wu
	Yk9yBX3JqntlgGXaDnL61gjL65X0z0mHQ2kGZSFWPuMdtL0b6iDDimPXA4+vQrpo
	u0WS48z2BqpeK2xlSo6uHsQlOoWiGKc5KSWxoeaD/XkBxsxSCdCnatSnXs6fxeDG
	y+kC8EdVN+BCqShzei3lSFbZdqZMOeL4+AMrXL6HCqH3D03CROPoxrlSyAk+cYnD
	Hy4vGVlIz+XafPI0tnFz+9s6DChwn6i40E4Mfs/nLJSK8W7q/poMZ5gh5bmBxglC
	gcDTZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgn7ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:30:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0ab07320so35625071cf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931454; x=1784536254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dtBJLacOGGttlAIKQe354mVWyqsRLsF0Nl3YOfEBx8=;
        b=EyoOZH61rAib0VRGf/774NWqSgLRnG9h9ybT+jB3g+65eC7kHeVO6TtKHRGB6ctxRz
         T2w8fneM7I1/plkqOAV/EhOcmQjJtZYcrZiXa85xQyrWEvXMnorAiY35RxBZzZSi7mfS
         Waq7TIRs2NiFYkv+4NF2vHelGOWx4ROLsohTWHBVOYqjo2sRfRc6uuUnrrlxAROM21GQ
         Rx6LIhaoXi9lEtButvV1Fe3e6KxNKt29LEKBLf+6Lpuv7JO2hL41brAeXFFZgNpvby/N
         g9yUFrrzxi7M4pZnpE0i1YqM5Uy/KjYl654G+/fD9S5gzmNxVq8VkGsRLuUQEtVpwUHD
         ny9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931454; x=1784536254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dtBJLacOGGttlAIKQe354mVWyqsRLsF0Nl3YOfEBx8=;
        b=jR92C+XGjCee3h80ljpygCrU6voQDNqLxzRb4540gwX1LIcbJSkrG0q8wwT3Mf+W3v
         oV34B1cvidjYsKBPmS8FeyKN8vHa/3rG5hB6rZ4121RVu2/ChQxbOjm78gWXB5LYAYi9
         pFBsytkmMrdtdn6OWOMia3wO9WdrKeZ45ndiTHE0a8QJE9Omv4w6OURDNejlsjHyrgUH
         srtFeFBP6WsMWOkw2YeiP1iHWTzkja6ITq7p9uJrme6te0VI8ru7axl6rHgD3JmDFSWI
         lC7UpEJzwIrfOAAKVxOziGi7dzXL8SiHSw3U2HDpzOiGE0wfNJW5YykmjI1enfInhmD2
         zOZA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7qarJj1YLd8GTSBkqKOWu/FmvJ236WBXGZMZJ1RU1SAOkRzA+CiaeM40kKbtPcEGn6GAwoxEvh5ZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yygg8a/3AxYAKLkYXhFk+MlwQUT8/1XrAhmGdX9xYdtJRUVRyZy
	3CR0IHzKRt/k4c6Ef/CDSpwKVJfRXk+d5EwpxcOZDoeGkiqWcqMFp7bqZxZX37AgV1GYbCSODmA
	tcOZj5ucN++O6g+5xp+zX5bkgRBCiw1Rn6biZvBxwBStKqjD0MttpJ6ReuQEK+cU0
X-Gm-Gg: AfdE7cn4g+ciWf7apjRDy77m+d2VXaIT0FXBNtXxOW63FdvMRLWUcCoBw5hxei+PBAy
	Y5wegaWzp5kLski5JtyscrhsO/+h5wcwaEXZxSi4j8O+has/wPEORtWSvv2qaYZ69hP649IAmpO
	uEUeAhbUPNiXPB1faEUwu8m/hHhAlsiyopJHAjPso/IZw3sLjIG+4EYwK+6uu9So3/tJ0zhXb1E
	X55iZzuJI0et2U8kjrkjkH5tN6eWf8/iOpMOQITltIlELPIPXS+IilJIDoPp/80olbOfdxOz/bs
	vgX0OLGJG5sItZtJMQaUtQgE/AIejNsMRIfPBzqzE78iEWp34kV6B5QVNow9tq3n7zS4CO1HU4m
	hCtY3zFYByjSVmPg8EUYU/gQvZQkKjMbllyIwPAWVNaw=
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr81763781cf.39.1783931453364;
        Mon, 13 Jul 2026 01:30:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr81763651cf.39.1783931452962;
        Mon, 13 Jul 2026 01:30:52 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15eb1dbdc9sm569475766b.10.2026.07.13.01.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:30:52 -0700 (PDT)
Message-ID: <e97424f4-d9aa-4f6a-84d0-2ba849bd7536@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:30:50 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <06834dd6-1221-463f-9543-600814c8fc83@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <06834dd6-1221-463f-9543-600814c8fc83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX24pTX/1AkS+l
 PqpuGualkZgqcS2RiL65GVNYBDnKpgdCZsTsdhn4Pbl16JoRWqAL/hdFmFqduOy+bgbqsA26Uyx
 Vi6dboX6XOmiwfhI9LBGb9WoEXqT2h8=
X-Proofpoint-ORIG-GUID: 5yrm_gpYyAh5yZZ_vOfAnU8xqhnSib5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX7x/RsqcCXhnD
 lN3O/nOzlCGOrQBuClTldnu6BIk88TDKqp16Cpe4PPXW5ZCqB9UsxjVIIvR/bNQnAlzDDdwTin0
 B8ffuVChZDCMj2I17+4cE+Jmvh/163CRlwBuW04CTHzuQDhVdnFt73G+tF9Ye1lWzYUayY7ujzy
 boLSf9CAYX5K/V3YEONW2JqOOAgB/lNNb0/YCqfuKODYvck6U/OyxeVU3RogiTufitL2IOgfvZO
 Au5VRdbhjtpl6H8SaCz/PlHfZu0abYCz9FEH06uip2mJe7+d3+sxwTYMJr+wLTJpCR0mH2qtjAl
 eR2a9s/FP1T/Ng3CoQVZLIElZFCwnSEELuy8gph8oKwR9nJ196Z2a25yNLGCMnetZ5P2pEuGmeK
 d6JoTZItFHT+CNRdqo4XUhf9Szjqs8iAeScu3DNU+qBe3zX4VmguJrxxP+IJurdZFoLWexEaS+R
 yz1HM3fPbnot070IDSw==
X-Proofpoint-GUID: 5yrm_gpYyAh5yZZ_vOfAnU8xqhnSib5y
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a54a23f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TB4z-ivqILPobOqkYRMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087

On 7/6/2026 3:19 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>
>> This series targets SM8250 (Kona) platforms.
>>
>> The jpeg-encoder node is described as a child node of the CAMSS block
>> and is probed automatically via of_platform_populate() in camss_probe().
>>
>> Usage examples:
>>
>> - Check of related video node: v4l2-ctl --list-devices
>>    The expected result:
>>     qcom-jpeg-enc (platform:qcom-jpeg-enc):
>>          /dev/videoX
>>
>> V4L2 Examples:
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap
>>
>> v4l2-ctl -d /dev/video14 \
>> -c compression_quality=100 \
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap \
>> --stream-count=100
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap \
>> --set-ctrl=perf_level_auto=1 \
>> --set-ctrl=fps_target=30 \
>> --stream-count=100
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=8192,height=8192,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap \
>> --stream-count=1 \
>> --stream-to=8192x8192_NM12.jpg
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=8192,height=8192,pixelformat=GREY \
>> --stream-mmap --stream-out-mmap \
>> --stream-count=1 \
>> --stream-to=OUT_8192x8192.jpg
>>
>> v4l2-ctl -d /dev/video14 \
>> -c compression_quality=100 \
>> --set-fmt-video-out=width=1920,height=1088,pixelformat=NM12 \
>> --stream-mmap=4 --stream-out-mmap=4 \
>> --stream-count=100 \
>> --stream-out-pattern=21 \
>> --stream-to=OUT_1920x1088_100F.mjpg
>>
>> GStreamer examples:
>>
>> gst-launch-1.0 videotestsrc \
>> is-live=false pattern=ball num-buffers=50 ! \
>> video/x-raw,format=NV12,width=1920,height=1080 ! \
>> videoscale ! videoconvert ! \
>> video/x-raw,format=NV12,width=1920,height=1088 ! \
>> v4l2jpegenc ! \
>> fakesink sync=false
>>
>> gst-launch-1.0 videotestsrc is-live=true pattern=smpte ! \
>> video/x-raw,format=NV12,width=1920,height=1088 ! \
>> v4l2jpegenc extra-controls="controls,compression_quality=85" ! \
>> fpsdisplaysink -v sync=false
>>
>> Performance measurements on SM8250
>> (NV12, quality=100, GStreamer v4l2jpegenc vs jpegenc):
>>
>> +------------+-----------------------------+-------------------+
>> | Resolution |    HW v4l2jpegenc (q100)    | SW jpegenc (q100) |
>> |            | Execution | avrFPS | maxFPS | Execution |  FPS  |
>> +------------+-----------+--------+--------+-----------+-------+
>> |   512x512  | 2.2332    | 1139.1 | 1195.4 | 7.1055    | 358.0 |
>> |  1280x720  | 1.7300    |  418.5 |  457.2 | 5.0585    | 143.1 |
>> | 1024x1024  | 1.6991    |  374.3 |  397.4 | 4.7304    | 134.4 |
>> | 1920x1088  | 1.6596    |  192.8 |  193.8 | 3.7913    |  84.4 |
>> | 2048x2048  | 1.7277    |   92.0 |   91.6 | 3.6343    |  43.7 |
>> | 4096x4096  | 1.5887    |   25.2 |   25.3 | 4.2163    |   9.5 |
>> | 8192x8192  | 1.3104    |    7.6 |    8.0 | 2.9987    |   3.3 |
>> +------------+-----------+--------+--------+-----------+-------+
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     |  143 +-
> 
> 
> NAK
> 
> 
> ...
> 
> 
>> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
>> index 4f4d3a68e6e5..f33d53a754a0 100644
>> --- a/drivers/media/platform/qcom/Kconfig
>> +++ b/drivers/media/platform/qcom/Kconfig
>> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>>   source "drivers/media/platform/qcom/camss/Kconfig"
>>   source "drivers/media/platform/qcom/iris/Kconfig"
>>   source "drivers/media/platform/qcom/venus/Kconfig"
>> +source "drivers/media/platform/qcom/jpeg/Kconfig"
> 
> Just like for other patch, you ignored reviewers' feedback.
> 
> I already asked you to go through previous comments around v3. I do not
> see improvements, so I assume you do it deliberately.
> 
> NAK
> 
> Best regards,
> Krzysztof

Acknowledged. Inline replies to all previous comments have been sent.
v5 will address all outstanding items.

Best regards,
Atanas

