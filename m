Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B92472F68
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814683; cv=none; b=Fymk5UhMYvCrP2fNvpZgHC2jCSflW4Cs49sttQHINICkdg1bG/AyA5TJqOkd6Ggh+agszzeqsqu41yKHcWXCVIXRTGOVfZcYQfzGtR7os7ULDVmQnllSehwhUBEdrG1HVv087Ysw9GdNSiBNIVc8LNsEYGpLnyFvegJBvotNAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814683; c=relaxed/simple;
	bh=OAIhkl7GA3kUt0k6jxECSE2oTylYgopE4+XpkWnaIow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URQyzfeGloGOA0cK/JgEO65fomMZd8AbcNdcvLrGvNkbofdaBaabdQ0grp9eqk6zadjs7teRnFisOzBT41qU75P2nVfDR8Lx0XWF7/dY+zEWZlXPCwF5prbWbfsn46gmidNaHg4YfAbyMtIX3U2pNHyFZ+H7vlzUd6XifoII9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rTrnmoWV; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rTrnmoWV"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c93a972b9so1405271fa.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784814678; x=1785419478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MMOkhSRFKiJt1MWjJO2tOcDa5RY5viiuHU6OsxyqvtA=;
        b=rTrnmoWV8QMa/w8IN15kdGUYsgvOAPvBbmMR48LiEuwxbU9nJDUBnuABnR0xWQ3xS9
         ovflQjm1WrY9AjBiLiE+cpFhzZUNhQaX7a7ViaGiim/aqL8JyceBwsNf/Ttk+PdQOihI
         V09hkmcubpiTjNkmzYttCfU55V8DWPMZr0f6zW6rJLAG6Ykhj4UUXJtV1hQIsb/5m9gq
         TbaLmM64ozt80SRhZCVESIpFb9sxuVluhEFh4DkyuWUZ2uoSD9fYJeaFejc/FIWsxkv5
         I66DmwYf2dkOl9I11AQg7gmo3wlzuf4FfG4FCT9J9m4RdJMWj5SdXDHKS4dgX3i3E7CD
         0ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814678; x=1785419478;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMOkhSRFKiJt1MWjJO2tOcDa5RY5viiuHU6OsxyqvtA=;
        b=JUAPgYlri5IkopvuCwQWovq69ob/NpkCHw0cG2m4cPVsALuOf3o1K27bkatopRggex
         ui/07GPAq2SKl6IPFZxpMRvfTlXzcU8sdpBI07X4f0wS1kopk4XhLHJLAVfAqmgdiLDF
         mF1m+VFVnd7g53/mj2InOZ+RbAKgeCODsDXKuoQn8onOPD30lroRiA34JcYXe5gcV2rR
         TufULz1xwNZxusLAQhemhhYzahbTNTVPw8jdo8WTo/iiDklE6vU+yv6Gs5+7fbJ/Eg6t
         7aQB/y3dtKGJFv2Ijfa5VD/XvhQPi6MUTpC8+VPd2bdBkGitH9CwH1BfNkTtbqQ9/vG2
         h+Bw==
X-Forwarded-Encrypted: i=1; AHgh+RoWd9ue9/FraRsXiBoi0FYcoROIjXvUuW4VZNwtwKh5z5wF0ypdXWwGZ9P/eq3cbqQ8+3CCOHK8fC6m@vger.kernel.org
X-Gm-Message-State: AOJu0YzZfhghq4O/kEHvMKauE2GMCiMKKvmk3MXeD0e9PxOs/tXWdHxi
	Pdly8iU4aHeIUy1agu/izWpTw4h9EuybZ0Kojnjk6R6GYfGJ40Ygp/5cFvwpK5nVSJU=
X-Gm-Gg: AR+sD118UswvZ2oT/necCYbu6+iCWJriVB+yq/8aLdGR3z8xsSem5o1iV3kRKX46QwO
	cmQDfpuMiiXAKSdHb9jhqtDW/VXkTS8Rvolzh03MhGdqFKkd6AlyiBrFNAVrcc9TO/BgQ1rfdDU
	itxR7MzWOzSL3CA0eTaB/yTl2yiCMui7qXilM1Nn0Cbr8lkQcK4X2UXS0aQRJLm1+ZNcERiGd+G
	vmbDZKgKN6SgQt/FZBw84DO8D/2O7zoSwSVGsMRqiMH7xHAKdkKplqkwUlciyXUbEBOvm9Ccvz6
	35pb+e6yfc7wPtlwYX6P1KOS0EHl1yMqauhdm3WlB1jNhLSx8QV5ZHTx8IM7dRnOc+Fc4WgkCfI
	Mb+pOGAdf6ncBP0r5lylrYScBy8NA2wcI8t2mJYAmNowdlQv7pMUndek55mnlHSdJjUTAOB9wvW
	3yBgJZTqXiWGCpM6hsaioRn9gK25hUBsF/PgWGvDrQZrPb8OblCQJxzoai
X-Received: by 2002:ac2:4f0d:0:b0:5ae:c063:638c with SMTP id 2adb3069b0e04-5b2b718d67fmr72261e87.7.1784814677891;
        Thu, 23 Jul 2026 06:51:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c40fsm9269361fa.41.2026.07.23.06.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:51:17 -0700 (PDT)
Message-ID: <e59d9658-0705-4c1f-9888-1d10e7e153a2@linaro.org>
Date: Thu, 23 Jul 2026 16:51:16 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
 <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 17:33, Wenmeng Liu wrote:
> The OmniVision OG0VA1B is a monochrome image sensor closely related to
> the OG0VE1B. It shares the SCCB control interface, power supplies and
> the single-lane MIPI D-PHY description, and differs in its chip id, the
> test pattern register, the register programming and the output format
> (10-bit RAW instead of 8-bit).
> 
> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
> its 640x480 60fps register sequence.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Thank you for the change, no more review comments and no regressions
to report from my side:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> # og0ve1b

-- 
Best wishes,
Vladimir
