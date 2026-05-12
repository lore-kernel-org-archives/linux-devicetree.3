Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEF13A48E6
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604030; cv=none; b=kEDGOIiPysZPPcz4kDe849ZxwTu8UKW1Sqm7aRJsckZzqXc26Df4HZO2ezcwuf68mv2LdGGZzHEyJdsGA58iSCvrTkw0jAiyw29hQmKO1QgpeL06Dsoq3uazBuJRqfObtcsSkMBEUATSSJl38B08BjaWQ+lSnXUA9dqPGqDT6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604030; c=relaxed/simple;
	bh=aSq8gdS3X2y0b1QUr95iJ5Sklv0yvJTcbiEnOsTUxEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvTkN5IQ4p+uBz8Igq3cYA6wd0EVBHZRcwTmCh0Vt+LBR7D5xkd89dNKrBkUcr06ZJQCbFPUkYBDrSzFMoOmuM7mZprDVV6j/HNfQ6iRgYlYFWtXQoG5qwuY5KY3LkAG+C2lxbyte1KBbyRXsK7MjwZnMVmRZqzqiGTd0cxVLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKK9Q29A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7f0UIqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKK9Q29A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7f0UIqX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CChAk11410255
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ip3wVoZpKybJw/Ktr1VV5AiwdxAQJWl0EwDBxYBKRbI=; b=GKK9Q29A9KEGqxeQ
	PZk21uvu1xGyCXI0snUe3k6V/TX25WlLOzcUvk8zN7RVzX16uKG6ZX0WGpdVDn8O
	enS59rBik4h8pu7QfvdWy+n2OgJFPJUbF535UkQS4Br09Qs9heE6FEEdeY4EwSzv
	epNEsx1cWvXGSI+hPca/GwmkG9RAuGc/U5hPHK8lmECRmnMo/V5SCdPVsYG7ipN/
	939e9o5Ct5CpFgl84lcgDuN77lzLLx43DOpAYQVSvjT9IcMYpDs0T3Lk/uR/UjrG
	hU9RYwq5fUaLBjy/Zbv5PuU2lPCJxJDpmrh8IJzs074Qv6qsAXdskjFrDkGk67zP
	yUJz+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f30x3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:40:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso62426915ad.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778604028; x=1779208828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ip3wVoZpKybJw/Ktr1VV5AiwdxAQJWl0EwDBxYBKRbI=;
        b=N7f0UIqXJAoP19fZnRLeIO60o15YckodY9VGuH/nccT8ZYBwV8PQC1bveWLtvz7Jof
         ne1H+ZulJznq0MhQPJYa+W/mdbxZqx8MkJzAxBzXuI33/qLoJ1zoFtu4stgrW1kSjZUg
         DrRGr/YGvhE/ur+/Mgpau/BNWqqJfPJ4P5PwViawL2YOPE1V6eypaCIJqTLYrTmI9cWX
         zGk1CvxvcWQffl/ZVicWU3FtSbKChOqWKvMsPjLHLz0R/FUEIHM45nN3d3HQ8welf1Pf
         04sSuLgY0L812XbvG+E5hGrAD9JM/UMsSfUNZzApa0jnpd7PLl48nB2SK/5r0xxEhv6K
         L7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778604028; x=1779208828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ip3wVoZpKybJw/Ktr1VV5AiwdxAQJWl0EwDBxYBKRbI=;
        b=CjzYz+9T50Ct3cDTiRPuNpWk6pLIBdfANwjjXpMWefILCm13Msa8f6L313mQ37c5ZD
         5G6Z44pMnC/ll0WKYqY7VO5addShDfgwHG8W/DMquWggSbA+GCeqPmypwPtxYc5DjUG2
         cYl8Otubz/iRqLM1q23eVQdoXCqEfhG6frEl+7j1w3cf4eebKt/QEf3uak7ijBs/IHAb
         F558Z7o/5CD8uK+754PI8LCQBqOTM72gt4whuK268Slr7RM1kBTR/Hbkaxzlorwz7O/J
         aQuUZiTsmvaFuKR40wOUwc+EDXFpkbyBo0PiIVwPt6JeMIaL5Ca8ZJ0pJ9OoxTk1yyME
         iNjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MIAR28c2PMkcLoSjskuknaHrn0o3IdeSJGCUp9ZxDrV5GnyOnF44NBm5datiSlsv3AUAXyuopf9mz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiasp4Co7l9AD57D4y5SGarQHcbAmTRpXhF6FYe60aMebwy5JV
	HEYgLJs74micWm+NVlEM7EXqwLytgxxQ/AWWxFsDug1a7/iWXdblFPc2Pa55PC3MytbO+mnkXuc
	Ia6js0oWFfyRU49lwbIN0fjCjs6c4WVZeTE/3YybWpKY40WJp+TqQKGg1DWEOjejG
X-Gm-Gg: Acq92OHMk7E6/MCwTbMYjDr5PfjV7Yt8ToFuqkb0ak2OS+fDiB9wOFoqbuROl3bLZrx
	5wH0hBUGcssck7m/+A+y8REJ2owx+tctQes2Pkq2oR+HRWgXokYGY6HL4IMdRX6doEdzihASGs/
	Sot4/ubY0xugP5/xYiAGeLjx+N96r7FzEhcsQDDd1+33r/9DR7VrwiWdhNkNcsfifvRLT5BBHds
	+qy3NAM/sP0OcHfiC/+Nkx7JQcbM9Z/JiWpxOybEEo0IZaN8n9ADlxgozAvilaPUK91+p4yTolr
	g04KNjpCYylMowXK+JHeAfoQdq4Gj3f8Mw42drGMRE4mxWiF5v1epS4mUegOtlqLFNBIap6YY+p
	5k/YsBlPxk6LQIBKJ6rajtmDWUQIO+QNiRu2Mk0GPHsmvoFqZLvH66a+9
X-Received: by 2002:a17:903:32d1:b0:2bc:7d09:dcef with SMTP id d9443c01a7336-2bc7d09ecc3mr166949795ad.29.1778604027915;
        Tue, 12 May 2026 09:40:27 -0700 (PDT)
X-Received: by 2002:a17:903:32d1:b0:2bc:7d09:dcef with SMTP id d9443c01a7336-2bc7d09ecc3mr166949375ad.29.1778604027346;
        Tue, 12 May 2026 09:40:27 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35ba2sm148579145ad.50.2026.05.12.09.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:40:26 -0700 (PDT)
Message-ID: <e55b33c1-7a74-4190-a7c1-5116f8d5915b@oss.qualcomm.com>
Date: Tue, 12 May 2026 22:10:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] media: iris: enable SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dv2F7EYq82oAfW4ojfFYGgX7F1gc7r_-
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a0357fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=o+V+sR5qrBln4ZYy4JV1aQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=IWq-EDL8qUF5mmfBNZEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3MyBTYWx0ZWRfX3Tzr5IHdKElW
 YMXckXMVD18C6K40VLIMc0HKY2m+c6TBF+nLObWxBqbPVtsLRoiFnlnfYpZ/1Ryv3bNuad4axfq
 5I68GcUq968JXGfYTJSXWwZSqrzXJbx9dm/7SJfxWUIaMl75iJPAHEusQSUpJECnvfVHrdNBnlq
 GzhmhkWN6xekT8UIZt6RZfhpUnmrABRTNt/eaQTkfSdDvpgkAGY0CWsSTC8tqCEfM+6k8Vr5AcD
 5wHSc8ErUseL9QwNkmOMOOGAl0IpXqiW9aaVqnHRNeqypYYnTqwWdpl2tYlgjmne+ow9EQiLlPa
 5c+a94TSdUp9likmqain5761xUwsRHxKgkDTq0nfJP35E8NBTiCNfnNIubpzWT6UU5lRNUJn8PK
 xTa+FwMnVpS1nloxVyS1VS5hlW1es87JYPbBs6Ve31rteEN9iWYzpStqjbINaEvJDVG1vTqgWqk
 vZMZwKYBvAmilvLiH1g==
X-Proofpoint-GUID: Dv2F7EYq82oAfW4ojfFYGgX7F1gc7r_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120173


On 5/12/2026 6:39 PM, Dmitry Baryshkov wrote:
> In order to enable wider testing of the Iris driver on the HFI Gen1
> platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> 
> Note, this has been tested only with the Iris driver. Venus driver fails
> to boot the Iris core on SM8350 pointing out the UC_REGION error.
> 
> Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> SC8280XP). Please use corresponding firmware, extracted from the Windows
> / Android data.

You can push the tested firmware to linux-firmware

> 
> On SM8350 with the Iris driver:
> 
> $ v4l2-compliance
> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Decoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 7.0.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Decoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 2 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 
> |TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
> |-|-|-|-|-|-|-|
> |TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
> |TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
> |-|-|-|-|-|-|-|
> |Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
> |BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
> |CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
> |CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
> |CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
> |EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
> |HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
> |HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
> |HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> |HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
> |HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> |HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
> |HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
> |MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
> |MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
> |MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
> |-|-|-|-|-|-|-|

Can we do this in the format which we have been following for other SOC 
? How to make out which is failing and passing test here ?

Regards,
Vikash
