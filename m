Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E9381B14
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234765; cv=none; b=gzgs/9TSx1qTsAtYtrJ1Exxppt2CWNiRTW77DU2b2Z/3Rn84u6GuwiKzD9hBdRfOEAjXSA2BMaV+uXyTSx/OQVN/fWKxtGV+Vp8LWEudFxFe89VGDbfKzt7INMXJKCUuTOEzcymS2lVxfRFeOXOEG3q7Ti6Lm+3BBxft6yBmlXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234765; c=relaxed/simple;
	bh=7HtEkn1G6Gt+KqI9Inj3vguOrvstZekSSZzl3+vPWJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIV/YTh7f/l/N9ym1FF3bP2PgLi137f+/Xqv7F/2CBkk3xGN/s0ztekSQf1+/oTJkfKgW7FUaXNsiLBl5Diz6Ue78Bxj2Kiy9dCUdI3pDPoEEr/cmu1jB4XOSW9kED3g34WRUYGsc3IMqY16UZFyw1Qe73RqVGcDrGYOOPy25+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKX3v2cy; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKX3v2cy"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67e9b3037dcso1667007a12.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778234760; x=1778839560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hxarCXBu2q9FLo6gBfwZV7234oitg8nQDrnEw0Apq8=;
        b=mKX3v2cyUXfWRT5X5osfq2WBcZQATjRgkcPJfkaRqDd7Jxcxcvu1eCHXYuOtLrSzuP
         /uHIAOZEuZdDEsumX7xFK0exxOEh9BeBB/dz1iK3LI2xYClnX6PvHLyOsbZwX6SAgow6
         zTUdzKHj/QI0eqswypAEnd5kEc+IwWBMVxj1E93c4VxjHCD0lvYxFjlXD2KxF21azkCJ
         /+iMtseDkn5OLBKA9kgLSnv1shtQ6u2ho0P179u0jFl21E14BOk6PqgHQKISKlO4whXF
         Z5irl0CBpfpwN7HLPZwUqYSNO4a1o4m58hrOQ4QMU5oo8EagJUoYQWzbAFNmtJICFqAv
         h3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234760; x=1778839560;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hxarCXBu2q9FLo6gBfwZV7234oitg8nQDrnEw0Apq8=;
        b=qpziJ/Cx/UA/EcD1QLm1NYu5w7Tz1wnUef2uiOcmYGGU8sttOSfsthk08p7v1r0bzO
         kacmZYHJChGx4hFsJtfD715p98Etz8uJzYi67WQ955z3PDglNXX0HAWnqDl912P+VnK2
         GzzEv9EKIgMsQH/+QC3UwcQTuL+4zjzkfFAbOtEwfCXa4qefUt3I9UnliJEbU3i5uu8R
         X3nrTNP/UiOxE2WuKKYcQP99M8UIOd4pal63L4Jfc1PDgNjWOLT7mfXNyVHW8pa8CjXa
         pu+0MrZ1DRIY5yS5zc95LObuEct6r4U+UjzBFoWpbWQSO+dOkvYJu5iCU8VSPljJPj6C
         bGRA==
X-Forwarded-Encrypted: i=1; AFNElJ/CnNGL245r1Q6jCRbG3rG/9+aia6Upb7X/5CllxkP44rGHOxJvGYNuaVsdITykF3ZBzTlAQV6S+JJm@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPIYdE9/bKnRWMIGSBow5fghy4d6+ZCaPJkrMWOBF9TjxLaQJ
	bDMY0Gi5dqagrqUtX6OedZ5/4rOXRqf6uXN60racw9fmHkW2GcM7q2oYpgR737vOaH4=
X-Gm-Gg: Acq92OFOwfkJDapbKbXrYLTeaFZBdBA82pDoDYXEIWxxBdGr6yCIPxcCylLRZgaOkp1
	9Z64AiQI7d23CQGhPXvaUEs3y446yt8liggeNCZFNRcWMOLEfvtv4Dai2F3Wp/hPrc1L/M8vx+c
	oNjlpxf9aEtXZamycy86dV5C9XHtOKR20+C7SpHpNNZJs0AUCR45/1gflduAtn9DjLnXN9Bq8Rp
	zybUDTe1Bu9Y0BcgqNzm3R6b+02IFET8YKuYYrRVVfE3n/yckxGHnxpgh9tfXLr+N/Gyb7nKDwa
	LIdH+NVPhN/Yta0q4uOWeUC5Uy5pECNHgLFGcKhTxd+ZNmdx/tFn7o6HyArc4EDIvRBtUDpPWUx
	Lk7cYe3Rik817ql9F+2ow9gdS1DQkJ8zIfueQnf/DP9v7/aIYN63xr7XSZIJl76RHOCfp/wLUu/
	yc66gqCMQ23a/7DSRDbGecHYc+MlxO8QXan5I=
X-Received: by 2002:a05:6402:5287:b0:674:b1b1:d039 with SMTP id 4fb4d7f45d1cf-67ef0787b80mr978564a12.11.1778234760387;
        Fri, 08 May 2026 03:06:00 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3bb2asm477788a12.6.2026.05.08.03.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:05:59 -0700 (PDT)
Message-ID: <f6121050-3b27-4651-9fa9-9300ad299df7@linaro.org>
Date: Fri, 8 May 2026 11:05:58 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] media: qcom: camss: Add camss-isp-sched helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2026 23:49, Loic Poulain wrote:
> +/**
> + * struct camss_isp_job_ops - per-job operation callbacks
> + *
> + * @ready:  Optional; return %true if the job can be submitted to hardware.
> + *          Called outside the scheduler spinlock.  May be NULL (always ready).
> + * @run:    Start the hardware for this job.  Called from workqueue context.
> + *          @ctx_changed is %true when this job differs from the previously
> + *          run job (i.e. first run ever, or a different context took over).
> + * @abort:  Optional; abort a running job (e.g. trigger a HW reset).
> + *          Called from process context during camss_isp_sched_cancel().
> + *          May be NULL.
> + */
> +struct camss_isp_job_ops {
> +	bool	(*ready)(void *priv);
> +	void	(*run)(void *priv, bool ctx_changed);
> +	void	(*abort)(void *priv);
> +};

I'll reiterate, I don't think this is needed and is overkill.

v4l2_m2m_ops already has device_run(), job_abort() and job_ready().

:g/ISP_SCHED_PAUSED/s//v4l2_m2m->suspend()/resume()/g

This seems like codebomb of a parallel implementation, which can be 
largely covered by existing v4l2 stuff and if not then should be 
justified in v4l2 as a new design paradigm.

---
bod
