Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F783D45DC
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604670; cv=pass; b=owgwJf+61JN141ZKIYPAOJhlUgAm12/ZCQOiAQhSvQkB7m1OBwcqJpX4JeIV08U/krdpWq4YL7oJyY9A1wcE/0CSmSVVX1MEH4g6fcs+/FsekDeb37J+TB1aZCqElkbINiAjc9zjgmxJF8pI5Z+awIK3Fx9suqH3K6KjjJwYk1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604670; c=relaxed/simple;
	bh=v6DQSkAsCB7h1O5GUUmXb7JuYhjQSr5ijQSwSn93qnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMu0CqaO3z5qPGTHVM/CgVJrHx7a7lCPrLXnPiiaDPrddeD4mTL2tdy+K3R0heSG0EU1GQxw70RHbGys2TKx4wRMceEIeLPrV0yz2R9iLnTccVKMTPOrXJ4UPj4QxC63ZYkz0w+3FMYuH8K3Ni9BRaRD+VG/0zzmq+qRFJIZvFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWb0GO9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evWbaPEV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWb0GO9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evWbaPEV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCLHZ1545944
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hh95mjXYy30eXCOUsuZ20ibf
	6b9dwOWmLBkERMnV35U=; b=kWb0GO9bJKGYNOWXsE5BHjLzMgArmstjmumyw0sB
	dWz0vVDDZGPb4o9XjKnfvhddhHrt8RhmpYDmoLw+0/EZmjDurWKE4SVA9pIfc6Gy
	M97neAIAgP1COOsPZIRyvR/TDbQZ/l0x1fD2LZXACDXI+S5Nx4GFd3md3hvZh3JO
	bBwJjILdZQlO0uIZts95xl6Ak2qUMVTeJauTPXDPrgmpi484UOd+4BoY4ZB5+ML6
	3eWE/89xcAED/TtF6feNe8/5spfsXA22kEKdOikSCsVDWtdDo+kKgv5Hcd3H0UYh
	70RHwgGY7xKezgnAjoeIqvqZjvzeLgKC4JDsxRD+g7oFIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444ss2h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:51:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba5f794825so48973155ad.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778604667; cv=none;
        d=google.com; s=arc-20240605;
        b=TeNIsET+eFJHCfOAcSqEIoTFdLifu1OBhMDl8l2JiKBX21wWM6nhPz4bO3EPR+rYmW
         7q/dDweGikgTzkQRVK5GU8eKpmJgIHjSjAdTPVX+GA+V5Wq4255LZC6AtP8D/Ckjqj95
         YcNr30ZBM6Vgj9/1FWbjqaSit5E2LP8HADKAuo74nVUAll0oRB4bl9NDVtug4tAPRTMS
         L1/xThxm9NSt3oRrbk5ZVCYZ8Kx4vQQojc8HIQf60xtX68ajx1eQs93jKdQPp+nU+bdn
         dtvf6Ul0Pvt1/Je5X7nsMIylUjALsz3FTHdAz2gfvX0lAQlhei1izlR9oNUw7A9sM1cO
         xFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hh95mjXYy30eXCOUsuZ20ibf6b9dwOWmLBkERMnV35U=;
        fh=cJmAGJ/vz52QBzB6tWSfbQE5N6avAt1f/9KxaQfCqg8=;
        b=RcI94PECblLktrVOFs3BpareNFy5JvhEZRNfCyCIGP4wmR+YMjAJqBQtz0kyOe/1vM
         ReB5tPtlez4LZD/k+uy+DIWHb7jNHkk40xs5w0hr7mNSczY8bDx1HXbvBoXhBg+rk77G
         J9LZsa9cnJ3QNutY/cK3Id6T4Zj5ZoJNa0XLJ4ew1/pCs3jAlq0suPDTqqRsdHx4c6cJ
         mKOAMROt74BFcWr7CYe93I8EBa7xNQ+XpYq91Bmb7ZczUea6MVtdC9FMpb7Qz/aLR7WU
         TBLmZEl78DXb9g0cgqlK94iGAHGvaF3wBqYEfI+aKTYUF5tMNfn8Vy6jcvJy/dV4+mRT
         yZQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778604667; x=1779209467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hh95mjXYy30eXCOUsuZ20ibf6b9dwOWmLBkERMnV35U=;
        b=evWbaPEVuOf588DAKuWru0+Xmq+fPqVTKB78Mmah4HJoNWZO3qMnL4/EJx86EITRAu
         X3rIMYg0NQ7j4cisbRSWMx927loenWdFwjwnfPA4IW4Onvdx/K1HTJhKt+q3G+8uSRN8
         u6ZvUBYsBWUyzqbmvCq2bgIhlsXPzLrr9JTh476GZxDjLnJQMYU0YX4pHkui16/TJabC
         7yoWI7uLBoJIRjTtjh7/pQNpRFDbC4lhmyvp6CMbp8yfvZH6xMuaGpG0P1yH8Td7lldv
         AYp1Q1piJQEkiNuijlaXZBgigq7Fh0RUcjA3SQniMg1JQ3lYGkSI3O/XSGAT0e4CkoqS
         gG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778604667; x=1779209467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh95mjXYy30eXCOUsuZ20ibf6b9dwOWmLBkERMnV35U=;
        b=MroeqPKgffdvipc02w3X6w0pTV4qXCXYQt5yCvItupngFFwYnSqcG5ujncZDCDjTo6
         kGIDutIx1W7rZAVLSn/3NRu79U+CPS7bveVlBnKTWuX4jGDiod10/lg3gGWRpYUV237e
         WIF17H764xokReh07xNCmb8MpiJJvoNRBExK4akyISBkK++ytp6A7iZsjOAAC5X6AK9E
         wz+DsVCRvfGn1q2HI5vhOJW5I6XZajIDMzNGIgjpd35sqwgrwqGc6SK1C6V0DQ0+t+jF
         lcrGHqefunOl9oG21BzwD1KI1OheEzvDlcURLasDK6bI3i4c1YtBVuYPoq8jACxWNnQx
         +j7A==
X-Forwarded-Encrypted: i=1; AFNElJ9tUDjOjlzXIQ4Mse52Q/11d8CXPh2h1eDvJqvUPm6vsJORj6LpqwPdYiMRkByTi2YV15ira4Ep81w4@vger.kernel.org
X-Gm-Message-State: AOJu0YyJULE1HQlLmgNLKuY7cvdF0zoXmOM/e308wUeowQbMs2aCJo5x
	v3FMdzkCWQWDK/3Vz4GHTtiRXFZvGTRlq7sbCFxzYL2hDiXvqsuDkMCVMaz4vEoEtRsLo84QthV
	Tsp33CNVpFrIiXdrmNlL7l+TuigU6bFGQNPOiwYyO+CuAXJKzk53aDh3GirJjY9B4hmqmwzK9Ot
	3zW2T+v2swXDQxLkn8irnlm3W1lIddijFZ7I0TtNs=
X-Gm-Gg: Acq92OGxiLnbT/mFK/lxPse0WHPpYSzTS5Op0cR8JlgdyMLTMC3HESWcKs+ZrhaPMYh
	QWe3I1G7GnlD4kTx93nkCGfNLnW2ojx6wm2oG3N1D4P187cM/RoFueoW7C7TA7xj/vJIZZ0yujZ
	EQODh2ItOs0i7qP620Eg6DLwrq32baKu8pBFT1x0jOF8l621FnJdniWdyXvISAlVo+Vr4+wp7Tc
	q4=
X-Received: by 2002:a17:903:287:b0:2b4:5cb8:99eb with SMTP id d9443c01a7336-2bc7aa36833mr161237145ad.27.1778604667327;
        Tue, 12 May 2026 09:51:07 -0700 (PDT)
X-Received: by 2002:a17:903:287:b0:2b4:5cb8:99eb with SMTP id
 d9443c01a7336-2bc7aa36833mr161236815ad.27.1778604666774; Tue, 12 May 2026
 09:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com> <e55b33c1-7a74-4190-a7c1-5116f8d5915b@oss.qualcomm.com>
In-Reply-To: <e55b33c1-7a74-4190-a7c1-5116f8d5915b@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 19:50:55 +0300
X-Gm-Features: AVHnY4LEpLZ356PeoGutpKTnSDHrsLyZKemG03mKAjFCYSYmX5fM5Kn8y1O_gRM
Message-ID: <CAO9ioeUrCJQKV9M0UY1V3TBEn2jd45kVkguBaEe7sswKjHHWdw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] media: iris: enable SM8350 and SC8280XP support
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Ywmzq2nIwtHQArInCAaievhgON-Hjk1K
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a035a7c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=lWqA9hb7cpjHTsjoHSMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-ORIG-GUID: Ywmzq2nIwtHQArInCAaievhgON-Hjk1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3NSBTYWx0ZWRfX8G/YmsOz1iL7
 6X+OYasOl4Xjk4Tb98NKjyB+RwWnxznq3sVuHyFHYCVmmJLtDQsFsh9k0SFQTlYvCVspZI7Ckx7
 Q0iroAud9pwzpXYOnqL2TpZQbOlvxbTg38ETdiR83ZCdG/YuSDYnqaqOui/MKKqnmuYuch3EE1n
 VnHSJkzpVv1MfawN3jvB6/OvahvokYU7FMIRULOlgklP80LLbhh0RYfoblY8knieUP+PhiE1Hx5
 NboDGQRRuUqb0ZbNRPQJWDSWK2WIgGDE9Hh5dwaZ8EkQ3D9qWjqeSo7SrVQk2ft2qO0hKzQsMW/
 /ySQp6Jr/pKLfDn5bevqixcrxKjm2YCPmm5vIhfW8i2stuu/0VgC5aSktxZcNlDghGyLsLy+XvH
 EYXRlO00hWv0dBN4Eor8NGwsMCl52IMaHPB+wCG8O5Wbkn5igAJUE426fXCXmf4gvXCwvTLayDY
 3G6ehmz3JNKgjrNA6xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120175

On Tue, 12 May 2026 at 19:40, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 5/12/2026 6:39 PM, Dmitry Baryshkov wrote:
> > In order to enable wider testing of the Iris driver on the HFI Gen1
> > platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> >
> > Note, this has been tested only with the Iris driver. Venus driver fails
> > to boot the Iris core on SM8350 pointing out the UC_REGION error.
> >
> > Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> > SC8280XP). Please use corresponding firmware, extracted from the Windows
> > / Android data.
>
> You can push the tested firmware to linux-firmware

I'd prefer if firmware for devices came from your team.
Firmware for SM8350 which I have here identifies itself as
video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6

Firmware for SC8280XP (Lenovo X13s):
video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565

>
> >
> > On SM8350 with the Iris driver:
> >
> > $ v4l2-compliance
> > v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> >
> > Compliance test for iris_driver device /dev/video0:
> >
> > Driver Info:
> >          Driver name      : iris_driver
> >          Card type        : Iris Decoder
> >          Bus info         : platform:aa00000.video-codec
> >          Driver version   : 7.0.0
> >          Capabilities     : 0x84204000
> >                  Video Memory-to-Memory Multiplanar
> >                  Streaming
> >                  Extended Pix Format
> >                  Device Capabilities
> >          Device Caps      : 0x04204000
> >                  Video Memory-to-Memory Multiplanar
> >                  Streaming
> >                  Extended Pix Format
> >          Detected Stateful Decoder
> >
> > Required ioctls:
> >          test VIDIOC_QUERYCAP: OK
> >          test invalid ioctls: OK
> >
> > Allow for multiple opens:
> >          test second /dev/video0 open: OK
> >          test VIDIOC_QUERYCAP: OK
> >          test VIDIOC_G/S_PRIORITY: OK
> >          test for unlimited opens: OK
> >
> > Debug ioctls:
> >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> >
> > Input ioctls:
> >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >          test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >          test VIDIOC_QUERYCTRL: OK
> >          test VIDIOC_G/S_CTRL: OK
> >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >          Standard Controls: 2 Private Controls: 0
> >
> > Format ioctls:
> >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >          test VIDIOC_G/S_PARM: OK (Not Supported)
> >          test VIDIOC_G_FBUF: OK (Not Supported)
> >          test VIDIOC_G_FMT: OK
> >          test VIDIOC_TRY_FMT: OK
> >          test VIDIOC_S_FMT: OK
> >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >          test Cropping: OK
> >          test Composing: OK
> >          test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >          test VIDIOC_(TRY_)DECODER_CMD: OK
> >
> > Buffer ioctls:
> >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >          test CREATE_BUFS maximum buffers: OK
> >          test VIDIOC_REMOVE_BUFS: OK
> >          test VIDIOC_EXPBUF: OK
> >          test Requests: OK (Not Supported)
> >          test blocking wait: OK
> >
> > Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> >
> > |TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
> > |-|-|-|-|-|-|-|
> > |TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
> > |TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
> > |-|-|-|-|-|-|-|
> > |Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
> > |BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
> > |CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
> > |CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
> > |CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
> > |EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
> > |HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
> > |HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
> > |HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> > |HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
> > |HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> > |HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
> > |HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
> > |MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
> > |MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
> > |MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
> > |-|-|-|-|-|-|-|
>
> Can we do this in the format which we have been following for other SOC
> ? How to make out which is failing and passing test here ?

Sure. I will fix this for the next iteration (tomorrow).

>
> Regards,
> Vikash



-- 
With best wishes
Dmitry
