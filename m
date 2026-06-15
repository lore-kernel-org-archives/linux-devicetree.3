Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5802E6116
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546160; cv=none; b=OgSY/1omYX1bLYmlIW9jFUL6CcEFuH509V3fNcticc5zX6b2//25AsZYGpq+CiCXnHOhpark4TNFzbyF25DhWUmpKFL6z1a+F9Q+KF/bc/Y+aKFfeQIVhkfeAZ5hZacrD4qQNhoRcoTIT0Ho5Ho8F+3DPLfbFrc+6QRmGS1pXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546160; c=relaxed/simple;
	bh=Bfg65l9oLYMQye/1jT8eUxdRbUv5Ys7i9CriojpoHSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyxzgRh3vtVDxycBFptdtL99vKgSA+LFbHPHgVkF82RGiuH0jAySD82wOLIv1OblhC10U/+U09VNoaoMG12De4cLOa/xdHfAaGkiz676fEW/l7bAkpY+OkzUenGQScSVMWQNEkhn8BPrWQ5CZSIUSgjEp5HROXEmdIj5V4BAVsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZVfAd9f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNIQRKIV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZVfAd9f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNIQRKIV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhLoU414024
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ST1w0wZqczPPxszNphmXYIsO4uUm6fjnUhko0y+jWxc=; b=jZVfAd9ftVJpSaDc
	cQAH45/ksdOKCjoguK8Ldq7QZLJnM9tER1ZXMjOGNP6f7Y0M014+nEwfH/E415/j
	+bVna5vBmmASqrU2irhHSb/3e1iV1rD/0eYrFyaxDHDekOyjazGnpD4HEXMe7bXp
	GduEnXwbpTTlEgZ7jTg4MYLih19jRVtg0SmhRpyu5naq5JIlZiznYM7J0QhlqRrL
	72EFDICEGetj/nfThpyApgEMvy1ZeAo25ZkdojvLVU3ITewXS6IorhCk+FtcRGLF
	Ly72h1Oj331Rgy8i9TJO7qfRnWzFg7kdYD4NQPRaTkbAKt9s9mbFMlzF9bOjzSDz
	CIf+FA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter0258a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:55:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8628dc1802so3904613a12.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781546158; x=1782150958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ST1w0wZqczPPxszNphmXYIsO4uUm6fjnUhko0y+jWxc=;
        b=LNIQRKIVvrs58hVQNKiqJXnn4Y93w8G8A82esmfJNxs43Q0QWaouSHeUSzzq4pGFzr
         nm5NU23lHpCXObN6uPApT14Ha2AJnOcWMT2IHtKmvM1gys7oQfzxOyG/t+0tSggwenDg
         AII/go09JQHEMxLNae/iHwy4COsIWHDWE7lgtHIPBWcjj88GOgwHbNSavH3Lp7GDPRTh
         orOvfa02Lh0h+l1qm9qrG15Lqi2wD8zHFmyG8Cr92pSIKdFd6babHxRYhG3ARd7yAbKk
         SQgdX3uFiWw7gv6+nSdw3aRvongmktaCwuZxpqXyMBbqxKCspicgW0VrhLPDgZkgkh2A
         8Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546158; x=1782150958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ST1w0wZqczPPxszNphmXYIsO4uUm6fjnUhko0y+jWxc=;
        b=si1RWPlPOxt7142m7/Qt4iVI3QMECZ6jSS+eEPaRy4mn9SSJ6+0oKjoNJW6crX8vDO
         n1FORNxdb4buak63Lfr/Ox/pZXhE/G1EFXpe6yMDhXwQt2gMAJBIkkkotqU3d9WlY5lV
         tlXCE+KsWkpGm+1krOwVYE6l1fseY4I3jBlwJRfEbk7k5iprvGoUhmjdPsesWRb/jDYK
         6klnXUt9mrcXlLUPoUGmqUWwnvpa3VXQ9tximJHhxlgQNwxUzUscsyPgyfUmYEJKGhK4
         y8ZvUMfDPbZjnacEYk0kVDUsalDwTAVHZlHZqAV2+RG22rvdAulMyBh+wpC02MX6tCHs
         Bv4w==
X-Forwarded-Encrypted: i=1; AFNElJ8jp03McjylL27M64ycdc55V7YukDKKVqaLGhR+IzRA4XaZmYcVf3GjGn5g1zjl57sD93xDblP6ze+D@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmzRGsPRv+l76/4nTSCCLonvwrlAMqUBqQ/RyH8Nn6WilmjKJ
	mHj4WsdOSavKpa0Smo13OWOYa8ZqF2zTl7g9x4Z2mPBDBw4GD8Y55ZSaB5qdStG87WlkQgYQgl7
	i9bQY1qw+tnJmcDfVWh9wPfQDsJRTdaASufqFOmfrI4IrFx1LxszyRkTNck+gyxjI
X-Gm-Gg: Acq92OFyKV5c/M7UGmMVroQmj+F8FeN/klzFVVUf2LhBDvSUGjZ9W+JFIKXHKQi9F3k
	30LiQ0bDZXTa9XIPHUm8dQ+C2JJRLfOqe8NY2HydERgJEbE0kHJV+AkLJqISfMZcdH4KhpqnpU9
	vniQLXjad2ffP6Xzt+/l4jGFfBxK+i93LbGtHebA8VbKF5B6VfX60on1gg/P160pD2t6LLLWteR
	IrGR/kdWidNE6iHRqx1J2s127zu5Mg8Cnu1YKPYJeYNpKkj+OkkAdGHarHW89qYwCAAIN/Aixbr
	xOBw69sUFV9tWLx6CcS8A/3uhjF+or6Yqg8JmMhli9jzT368K+YuJVFSnlsjdvIRCvROvgY+gQr
	Np/BbI8OpyayJbU2Pu0dHGC9s142FvzPR6eYj3caqI9yBVjhWksYR+mfd
X-Received: by 2002:a05:6a20:3942:b0:3b4:8fb2:a34b with SMTP id adf61e73a8af0-3b783dbd6d3mr17269429637.11.1781546158134;
        Mon, 15 Jun 2026 10:55:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:3942:b0:3b4:8fb2:a34b with SMTP id adf61e73a8af0-3b783dbd6d3mr17269388637.11.1781546157694;
        Mon, 15 Jun 2026 10:55:57 -0700 (PDT)
Received: from [10.187.126.18] ([106.221.183.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651af0edsm9099233a12.32.2026.06.15.10.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 10:55:57 -0700 (PDT)
Message-ID: <72318d39-3b71-50f4-a928-4600405e3c2c@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:25:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 04/16] media: iris: Introduce interrupt_init as a
 vpu_op
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
 <20260612-iris-ar50lt-v4-4-0abfb74d5b3c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-4-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JveNzvmoloMnyj3SiawftzYpU0OZClHG
X-Proofpoint-GUID: JveNzvmoloMnyj3SiawftzYpU0OZClHG
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a303cae cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ym48ABLkKUHSTpi9L/JoRg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=G49y4s14Wf6zNiCwfuMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE5MCBTYWx0ZWRfX0noYhFbgnQWL
 2d5umfQR6bbajvO9LCoA/xFmbId7BZyQO7+q3Dl0ENRipxR3UGVbCpfgS2TRCMkA1/5msHM2otD
 loE0r15Hq+hwqNQxav2ljQEJ0aSeFNwUbWy5u7tk6DJGE8Q1lLMGsjg0rC2p5tPiT16ltL0v3ql
 gh8EmTY+aCGiHXb/aY2+9O+XzU2Ls/l8MXZ/q1fESFxlBoAi6MTeSXktVcCuLqvIZbEDAR0l0Z+
 IhWcBzsuJjFzhWBMaqK0MB9GKRHjdi2eHmSWMwrP0vUcPayz4OhweKGp48wu21IETiEe+/Z24eR
 8Hp6XdWUs1J5cXy3auP/BmBJhbVsQu2Qgv084IsqLOjWk3DGUEs68MdsZDxKmFmIOTIYROVGL+a
 +r3mfsc4S7bgZDmpZ3TQORCUf/FT3PQUGUxeSQw93HaF/yOwB6/+aQRVv47VYyiqg9ADJ7j/GUS
 YKRllD3w660JJzIooYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE5MCBTYWx0ZWRfXzg3UHbxvtzEI
 mElp3DxmqwiEfMuBbxMfxqrFj7Gu44xr5CTP4oZKt8Kp0iPnQs6up5JywdpdEERB2uW59t1S2mk
 rxSRvplyhaCNu6Vv9MoRyjT/UECoEsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150190


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> The interrupt_init sequence is currently shared across all supported
> devices. Starting with Qualcomm QCM2290 (AR50LT), the register
> programming would differ.
>
> Move interrupt_init into a vpu_op to allow per-device customization.
>
> This change prepares the driver for upcoming hardware variants.
> No functional change so far for existing devices.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>  drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
>  5 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 2dc121a3f5e8..dd2eeae0d9eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
>  	.calc_freq = iris_vpu2_calc_freq,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index dc02ced1b931..c3b760730c98 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
>  
>  const struct vpu_ops iris_vpu33_ops = {
> @@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
>  
>  const struct vpu_ops iris_vpu35_ops = {
> @@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index f608a297d4a3..90ccdc0d2a07 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu4x_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index a49113b0da23..375bcd923476 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -31,7 +31,7 @@
>  #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
>  #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
>  
> -static void iris_vpu_interrupt_init(struct iris_core *core)
> +void iris_vpu_interrupt_init(struct iris_core *core)
>  {
>  	u32 mask_val;
>  
> @@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
>  
>  	core->iris_platform_data->vpu_ops->set_preset_registers(core);
>  
> -	iris_vpu_interrupt_init(core);
> +	core->iris_platform_data->vpu_ops->interrupt_init(core);
>  	core->intr_status = 0;
>  	enable_irq(core->irq);
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 21ed4c9bd5e3..9151545065cd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -23,6 +23,7 @@ struct vpu_ops {
>  	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>  	int (*set_hwmode)(struct iris_core *core);
>  	void (*set_preset_registers)(struct iris_core *core);
> +	void (*interrupt_init)(struct iris_core *core);
>  };
>  
>  int iris_vpu_boot_firmware(struct iris_core *core);
> @@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
>  u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
>  
>  void iris_vpu_set_preset_registers(struct iris_core *core);
> +void iris_vpu_interrupt_init(struct iris_core *core);
>  
>  #endif

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

