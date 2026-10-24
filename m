Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810941;
	b=fKR0S8HYzNsxQ+X20Ot3uk7sry9IpZ7y+tUvt2aog8WYq/YlAnEeto5s+FZMjlnvh8dH
	 lXmCqqLDzlG3NDQBhvBDzqYLvYuw1GX9UlPLjBixcMlX5FRs6KRAzFmWsqW/Th33577Iq
	 y2KsgSWbbsQ+yk5Hzcvn+mBruOsucfMqDHFD4XJohhOU5fO18JsRfQDVMZFbAONLX9orw
	 Tts8gFILU1wZ/RXmyzEMHo5G7EQJzJQQzw9dHrRBvb6KruKCpXH+vBUDBJc+k/6O6cJtc
	 H2PhGHLNF7EibVJrGxVgDfoE8Sc29y/JmGQwzjUi63uhjzQ50Rydich37v277Wxu63A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
	b=GnDE+7QPl7WjAYoYkJZ8Y99meeKOTgosS4eQ1gTAfMzcWOT18obeljQEJOMunXbZ0WpA
	 OyWqPAIGfXGdFCJzvveyrj8o0dQPDOSClEcgN2DYPh3FDAGOeVxUxvd+bO12Drjol3wzt
	 5oODuLKJ8GC/hhEGpXM7ArBzDxlGHNhFXN03EcT9CNTysE433rxCgDUlUVKs2JinR/L1C
	 S/U59Itp35CQ4NEXh2MIxUefL9QBMbfbA5nns1jGy89UB4MqxtOYDfR/FReDmNVzfHTtZ
	 kAojGcbf+kR2v3OwoxMabGE8I7GTTPURLV19Nk2ExCt0Elc6TXbJ+0PCSVFdDOcJrng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VsVaqSr3;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A9606A32F
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 03:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738A9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VsVaqSr3
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6d68de53053so785546eaf.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 20:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810940; x=1793415740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
        b=VsVaqSr3vGYJqCiG8HH+ooZMO7LUI7VGxBsEItKVkG05zStzwyGmdpRrdKdn0hx43j
         +uCERXXm4lFEsKIN1dNdRFxQnHfFfeXMBv2nIkzgIM5k5rToGUvQlluXHFiaCOemeDQZ
         YujB2EUS/lNt6wX5DTB4kdRhe93wr3TQxEqJWHYazFKgQIQH5XOFuYYFmfpS/NTTyu4T
         pHSLwkrUVQZMJHlJzEO39FCSbg7I8036iwOG81NLnspYQPb9pB5JKNONsaXNRkOAq1CJ
         ZzuyS0jIULVX4YQzirAQMaJ4mwepgIdYoI/02o70hoHBtaNN7TojH9QSk/HC+22z1E9n
         xn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810940; x=1793415740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
        b=0XT92G7KkI6YEz/vQpRUu8Qu7o3JLucoXfNNHWehk9CsUGh7vptdhEsH+DNiTgtlBb
         KiDoboOaOAA6TLT5Csu7zR6RvWje3ZG0ILu9WZXcqXOigNDQBclufcui8DoY+a8aV5A/
         e8cyl/xhHvWXX7eSayo3JyGilt6hHP+/QoZYwH03HjgDBNkaAxBzRQOmFwuIc7DuCCUF
         EHX2DkgFXTfu0IGMeaDvgbA0+4yLl+NNDpcup7BLWYw5FwWiz4UvJBHIMs5pcXHdUh3T
         lSVpVWxYp6kDMW1U3KeR2EQp6B1mV7ixc2nusoNTq7UHuu+81ew2bi+gUinHlc9vQWVs
         T3dA==
X-Forwarded-Encrypted: i=1; AKwUvBxsS8ppQBiY6j9cJm6omE8tSVeOJ+0RN/3qI5rN5hYnAtOOcqvY9DjQRCHzy1ojgg/MSkjW2c5uWjlu@vger.kernel.org
X-Gm-Message-State: AFq9FYL2VPhfZF+9YoPmqIIoWJRzt1Al/jJz3Wxm8KyrLf4lcXXdj2F9
	2m7pGud+tegtfDmBd1apMblTkj8ud53GUzqJuzoXel8ateX/FiUKekDN
X-Gm-Gg: AYBFou2t1rwkkH6V+maSxp1xqEwNVn2qMm3w05AmAhkLzYe47yRNkqtYwahcxuPDV70
	qGBq0imBktjENUF34KLTR7+QDrsy+VuT/96oNnKDNUu/N1iH1zKQ16TifR9qWS7IZLS3StQP0oR
	9zpEA2UZC40c9pRI4EyoXOcnZNajteo5Of98rMwwpD+BqJU2dlqg//KLGK/ideTBHKDaciuy9Pm
	x4LhYWJFeF77eJOgHOaZS/GlmO6oONXOQkdxOOicjMYloSxBiqMV9knb+k2Pm71UjYo6vpOvgvg
	UpU63oLPDN+tq5WhjQsciyIJKuWsnijQuWa0OO7osKQa6MNKgk2DpKH/KBWJn795W+HM8Ttz3t+
	0WCbStGw1u4j26Va0IMCno79tPuK0k7Sqqp4XVbrk0a/pH2Z+9P1k9P7XF4k9hr1cNR4JsJFWG9
	numrKIUJGXVb3QgAHYbFpU2+Mcu7flmjy6MEC9swmiYncTzTd32zRJHsXmcMCMsUHvMTaw7OEB7
	yyx+inHmbRoKDmx0fOr8WDtprVQ4harpXsbSnrng5B8/fTQBNZoPpPeqUuajOqEm/UUoOchYOHA
	anNs
X-Received: by 2002:a05:6820:1344:b0:6dd:1d22:8573 with SMTP id 006d021491bc7-70ba0f02572mr353232eaf.67.1792810940397;
        Fri, 23 Oct 2026 20:02:20 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:19 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
Date: Fri, 23 Oct 2026 22:01:25 -0500
Message-ID: <20261024030142.13643-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 02:44:36 +0530, Akhil P Oommen wrote:
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> [...]

With this and patch 3, the GPU and GMU probe and render correctly on the
HP OmniBook X 16 (X2 Elite, Mahua).

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
