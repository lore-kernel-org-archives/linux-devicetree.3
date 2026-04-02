Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04DF33B95A
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 19:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157702; cv=none; b=apFPoJOSELeCOcX3rB5lqmjBx386sY1P0FE/CGIJ3ERlAY/TFn7Wkb4yVHE489U6jxc5Kz+JnXveIFk+hIs7h+ghcc4rgzidd+kcWS3iCXTgE2PIIP13dWEwF0oZkoQVGFg0yRtYuLzxycxGioqMs89DzLe7SFuDRl3WXgskXsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157702; c=relaxed/simple;
	bh=Myaxr/8YNjhTt26sYxxtoHnV7ksJt8aKetDfXl53frE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXJJy1xcTtS/C0hmabV1FsWl3SkygFxPup7yhcYqZNQq+xlHmpqPW7uNiRZT8dyMRq2IRONxekmLijGEQx29q160h0TWXty2q0WinY+Ri6tVyG3XI43V1TqHKsKNXgsW+4PjtwUNinWaVXCjFFFYWtA6mDke2TPW9yYFXJb9g1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR1f5AZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7GJHAt8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR1f5AZ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7GJHAt8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4XbC3804977
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 19:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4uv9+aAl7unVJkJ1C/xnc0r7hVWypSnjbM22WxXyIU=; b=gR1f5AZ5mD+m5hsK
	Z9tBtlAYYY0bGmA1QcAMKLudO9ZRI2ENL6QIHuoH3QEfKVKtJ05AAXVSwp7lYZvt
	N2gGI+NH+bS88F20nfp3EhdJf4BeF7XcO8MtDURRsJvvZx1sNjbfm/ZnXCiLP9yq
	NQMAy+N81EUB1Hb/Xmmk8zz3CMpbWAGbe8qp+yydC9YebQ14g0cEEUtOOWvevoaJ
	JcMW+GBulkfPjHp40s+ngbun8BnTzGK0PbzlEW2zWzQ8jhvvM6iJhQnizhUTToSM
	6LEkI34IHTMK1mmpyEpDXhHLVYFw6arHhU0SIsBmZ5+HD2Z9ydAqIUIt97MlPUZK
	DAD9Cw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u1rc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 19:21:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0b339b8dbso11952325ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775157698; x=1775762498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4uv9+aAl7unVJkJ1C/xnc0r7hVWypSnjbM22WxXyIU=;
        b=N7GJHAt8xdh6Jxxc1AsTjGXupb9q5px3s4C+KKUgrhphokNg4sVljgQFHB2m4MbxWj
         WKVOVvV7L0tTaJHKhDSIEKdw7UfHcp31tCHQPzfReXi/ZU0GEMNQEbV0RoAJEARTjHMM
         MeQt63K5jK26EYS8ZL0UrPjUETT7nkkYotT27SfHPdMJBUnGCLE84taQ28QxErCLBSkX
         UakVtnHrO1a+Zv233YjRhfwDeX4PSGo/3LGEp4byxoQhMOVKYCGVNBWv2k+PpXK0AzUa
         M6iHbyKVB+vL5KQzgixt54UfOPhpPtA3j3ZiZR+KOMqmW73Vn8zlcU4poJlY9qhjOfR2
         eowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775157698; x=1775762498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4uv9+aAl7unVJkJ1C/xnc0r7hVWypSnjbM22WxXyIU=;
        b=sqwODz6NaDMGa8FP0tvUJHKfX+Hbsxg0V6nw+O4MdL6I3BSr5K1O54Wpo31tXhM0lb
         CIWo6yNUTBRjLVgALxJMjLMunu2JPlZPMKFKQkRNTRMhKZ30gIRWTckghCDJlqqSHKZ8
         l8h+7yFBWVf8Ne0o1qoEjhgRM0Lyzs9wp65CEKFdI63Dk5iiuawEcFNijEc0CO7f9PtR
         apAwWJVqoy3hz8GB0+zznG+ig3jxyzSiboXwiNK+SIMMHyL6Z3ydZ7SY0rl2bmKKlCws
         GBnB6tMN8gKpsr9fxVy4Lds7zC6KiT19abya/5T0B8cU9kTgplRqxYJs8Ydknuul494A
         VC2w==
X-Forwarded-Encrypted: i=1; AJvYcCWKqrFM1av2taC9JY+DNEQ3uPSx+z1y0cNTYbgWLbsZX6LbPUu/kOvVDqFJjMKBvLc3h6G0kOUzeZdX@vger.kernel.org
X-Gm-Message-State: AOJu0YxLB5Zx+C851yUBKjhCORF0JEFljbpyCw+TuwVBoDmUKrX1qE9s
	pWxvZQYfAOdIQTJYmx9qfjpVTL2kkikQ+tWmGNtjHUPrFA4Dy7KpOYUJTB6/sU+5iaTnxiiaeGW
	tv5cRvAt3leKl94B+aFbLDTo0vFax0+M37R9/EQfEXQAyElejm/Tw0Ij39CaFfXus
X-Gm-Gg: AeBDieuCQbhfedIkBCdEWFvGij9xUrSbM4smp8VmdUc/YrXnyNHhweNkz/Hu9mKSlEP
	bhIVuGElBNB0VY/UGMkapuaoPZVbLjQxVP1qV23ZiwTsBGLSOgkFJD8DQvbVrnlB9SlHbTOmufc
	ZtVNjcX8Z8aroXTb94Nw40ljUBJPMXJYvZb2W2cBB5y98YyRiRzjZE2HM7sCNELA2l58HKeRr3/
	7EWLwTMOJlWTj+wSSJcVFHgBiQPlwXrWlXGwGRr2/n+32q+Y1wgkhDnsu/F99NFgzNI0gEmGpL4
	nJv5bnW3JGBtaLVvudHMu0322EBOR9zj81m0+9MOoPsMFtO33VvLnrMHDRPRSAzcPBXNN+f37eL
	N39Cdc6lHuiRHKLdfVDstVg45oscaUJV+0n6OVttQiqdZsGIA/wpovkc=
X-Received: by 2002:a17:903:90b:b0:2b2:4dd2:dcf5 with SMTP id d9443c01a7336-2b2816d2309mr5212545ad.20.1775157698314;
        Thu, 02 Apr 2026 12:21:38 -0700 (PDT)
X-Received: by 2002:a17:903:90b:b0:2b2:4dd2:dcf5 with SMTP id d9443c01a7336-2b2816d2309mr5212235ad.20.1775157697837;
        Thu, 02 Apr 2026 12:21:37 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.251.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749b66aasm37588155ad.68.2026.04.02.12.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 12:21:37 -0700 (PDT)
Message-ID: <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 00:51:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
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
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE3MyBTYWx0ZWRfXwiAZpeYK3GoP
 8bHWYDeNqBlYaFVjQUXzXohdN/p3Cd+9o9KiiCDyYrKV64Xt1hrCxhkUr2U2EnmVOeTNx0PytQj
 R2zB7/wib41bPedXSXju5st32ixWl3P6wMF5lsRQtbUGmA84VP2veW9CUZPoSeYoS8iUgQOtlRH
 YbVvrZ95dAKncvOHwsVSUcjhOMJYw08fWIHkkJ6OYWZzTkpNKu1Wf1f6Z8H2fCNv36Fj4hUUi4B
 r6Ofe8B+k09GlCdeDUQ2g65hgsrSd+kSIbtW95byA0c10ggOs7Sp2gaH96EMaBMutrHGp1uGCUA
 ZaYnq3LWJP3agi46CRys1yG7nXg92jt+YEkGOrrLzoPCynG6PbE8no/Lc6mo7ALWxyWOHmV7qog
 Fc5lcftNII2DI/yVGPNh1HdUwzAqFbdOKPumn1Dud5PalkTMiCmfHG2tS4qRNgcjbcC/xUgI2wI
 vNcoIIHO8zFA0C1whVg==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69cec1c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=HjhN+elnpTkf3xRQdsZrsA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZB1EYcSSG1ZMcJLfxLIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-GUID: cqSUCtjb2ZgaMJjFOeZ6EO1bJp139_iY
X-Proofpoint-ORIG-GUID: cqSUCtjb2ZgaMJjFOeZ6EO1bJp139_iY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020173


On 3/12/2026 8:44 PM, Dmitry Baryshkov wrote:
> In order to enable wider testing of the Iris driver on the HFI Gen1
> platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> 
> Note, this has been tested only with the Iris driver. Venus driver fails
> to boot the Iris core on SM8350 pointing out the UC_REGION error.
> 
> Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> SC8280XP). Please use corresponding firmware, extracted from the Windows
> / Android data.
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

could you list the failing cases and compare the result with sm8250 ?

Regards,
Vikash

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
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v4:
> - Changed compat strings to use -iris instead of -venus (Konrad,
>    Dikshita)
> - Dropped separate schema file, switched to SM8250 schema
> - Dropped driver bits, it's covered by compatible string now
> - Link to v3: https://lore.kernel.org/r/20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com
> 
> Changes in v3:
> - Add missing header, sorry.
> - Link to v2: https://lore.kernel.org/r/20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com
> 
> Changes in v2:
> - Added missing chunk, including sm8350-videocc.h, lost in rebases.
> - Link to v1: https://lore.kernel.org/r/20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (4):
>        media: dt-bindings: Document SC8280XP/SM8350 Iris
>        arm64: dts: qcom: sc8280xp: sort reserved memory regions
>        arm64: dts: qcom: sm8350: add Iris device
>        arm64: dts: qcom: sm8350-hdk: enable Iris core
> 
> Konrad Dybcio (2):
>        arm64: dts: qcom: sc8280xp: Add Iris core
>        arm64: dts: qcom: sc8280xp-x13s: Enable Iris
> 
>   .../bindings/media/qcom,sm8250-venus.yaml          |  10 +-
>   .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 ++
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 103 ++++++++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   6 ++
>   arch/arm64/boot/dts/qcom/sm8350.dtsi               |  81 ++++++++++++++++
>   5 files changed, 202 insertions(+), 4 deletions(-)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260120-iris-sc8280xp-85d13bc60536
> prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
> prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
> prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
> prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
> prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
> prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
> prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
> prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
> prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
> prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
> prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
> prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
> prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
> prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
> 
> Best regards,

