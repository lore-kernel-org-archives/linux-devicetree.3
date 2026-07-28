Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE893D2FFC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228991; cv=none; b=YHSgqdq5mMCx1MY4wA2PyFG33HMhNRhERw8X0y3FU2K9xMz4mhlmR8KgRY3UKa78CKaCFajggl0RkTg/5b6ZvLCgLdi3y6czELnq3eTUo8oW031ivIfVVmJER0V5oohK2bdTRIOc3XngaCtzaX+mUCnPCxk8TnYWD4oB370+UN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228991; c=relaxed/simple;
	bh=GVPPMWKqvCtTORY2GxqbG8SyxRQuCUsinfCsLXmc8jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnkqOh8b3gem0SsH1j+bEKNl7X3yqeUJfClhpb5yYhrQmAGAs3tfiPrLaBZI3qObdlIfC1XgTy0O3Lm8gfYxX/un6qgYtdFyxTI0kdkkZr3m/2pNbzGTbuPGww28O7zpHt3MpSg/pdXp7WAFaxy1jJzRmwIiGtgwcj2iLXtOuvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=nB9G4iJG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="nB9G4iJG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so34530215e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1785228987; x=1785833787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rBvE3LzOP8daTBFqDLHOEMH8n84ED7uaYCEq1Wbhks=;
        b=nB9G4iJGxqO4Q60PZrLEqke5/O2Rwu8unKuuvNzZdOYrYX1j3iSr0Ss263z5uiaoOM
         6U2e7XtR9s9wJ+WDV8qPOC2UkIQDK93fxThLdUdJCpekuju4Hd6NdDGkVxC0aV/g5tGU
         NpxazhospiDdISD7qI2Ix2t+fYvPQYebIFBeADS1OUklIq2igC4/cYgqxctH8FmrFG5t
         JUhU4j4DzHpAXVMpQwpVGdSA8kC4/du46Bl8cgTwnYle4ZOsj7fviRXSOr078t+OWkgN
         pml4i2iJdQhbIdXe87i/rb+Y9txPw72cGYFYNMWFxcL6CbsC8vU1KU+TUhS8qBrmhOXP
         zZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228987; x=1785833787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rBvE3LzOP8daTBFqDLHOEMH8n84ED7uaYCEq1Wbhks=;
        b=XAEXRQKiNd6IKWY3XXr5L/qAf97Y7cE7fudAhIG59NFDIXFHJP0LTYLytrmR8MzpWc
         5277K3zuCCvI1ZcCH6PYzmuEnQBhfxkSifCaVDGXUSk8i+BWHyhgwmbHh1OQ5Bqj3T64
         CQeOxNXY1vj4FzhgDs2zEXJZbwD9+HQhvN717IgHv64ieQZjbSNlRRk1PveGPWvUK3KL
         Qv6BszSrJxPz3umGg0tkK+HJsAEYBAZ6Jsh/8DlbXjj8ClPaWHOLdoyRaJmz9yEwHOWf
         UzJnSiIJPBmx/yUrv27dptOGoivRsxLA2iaW6pWkwO5ROBWrpqeChIFEgD3uK5G9Lj4U
         aLAg==
X-Forwarded-Encrypted: i=1; AHgh+RqwYikUtwhN0Cig9sGffiybNe6SGYNd1HEvgjo/N/I3r650A4YDv5lBTPgCaNEUxR3ygbP4eHtZutr7@vger.kernel.org
X-Gm-Message-State: AOJu0YyLSI0sNNhoGZX3tw+SyksI5V9PRo+mCtniuQzuwMpSEUIi+aT0
	ifO7IJQ0qDDL/zi8AKs1W/oZsVjOGo+rienRS0CobsxvPGo6lsXw0dErMc8UKYkBS4U=
X-Gm-Gg: AR+sD10hhw13cuNKcHYhZ9P9vD/8wHrjH0e4tYCKu00aVzBxI+KYvbbA4YFdrS5DIFt
	we/eBw78J8gzGQV9JQk9zRiiEhaYJWmssNZDrAkfnWuWac6LlgN1epqoLQoRBge+gPwm6mp3Vt2
	AwafGzzJMFJut4AvVFfO2TqbxsPFmdrCuzqWvYRbzUu4ND6ZkMlebi6IOSDrHkl57hKyC7aw+9I
	h+kGbikrlEclD0rGbvm3fc/273zWMsJPe4CsvX8cJ3cyrie/u8IPOAxN88Un60bFa3StfhfRaqr
	MAhyfSvrbTKAyA+6buxriBI4oavDq2UyNUJOX+ffTJXDsWROZq7vN5YesE7AX/qoFH0WH/1sBWq
	9Xuk60yrEW4rNDRmPF/3INf0K0RfKGYp6ZJvc94lobo4qQccxOB/RnEDVSVfoeFRxVZPp3mzqcX
	lmnzFe9O7yRFPP99357Ju5vlQilwx4c/K/EoFnfM3dqzab47lsLq22SEKtITrrl+7KtYHWjHGZ
X-Received: by 2002:a05:600c:4fd2:b0:493:f262:b8 with SMTP id 5b1f17b1804b1-496c641e88bmr16041785e9.1.1785228987018;
        Tue, 28 Jul 2026 01:56:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:854c:e000:eb0a:5200:ec78:8b51? ([2a01:cb15:854c:e000:eb0a:5200:ec78:8b51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44b6b93sm62672845e9.4.2026.07.28.01.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:56:26 -0700 (PDT)
Message-ID: <463f14e0-ed5c-4662-8bab-d1f393b456a4@arturia.com>
Date: Tue, 28 Jul 2026 10:56:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] regulator: dt-bindings: Add fan53555 allowed modes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
 <20260723094001.120264-2-victor.krawiec@arturia.com>
 <20260728-portable-tactful-newt-eafcc3@quoll>
Content-Language: en-US
From: Victor Krawiec <victor.krawiec@arturia.com>
In-Reply-To: <20260728-portable-tactful-newt-eafcc3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/26 09:28, Krzysztof Kozlowski wrote:
> 
> Feedback of Sashiko looks unanswered, so dropping this from Patchwork.
> 
> Best regards,
> Krzysztof
> 

Sorry I didn't know I had to answer to the AI bot. Should I send again the
patch series since it is dropped from Patchwork ?

Anyway here are the answers to the Sashiko review

On 7/23/26 11:53, sashiko-bot@kernel.org wrote:
> New issues:
> - [Medium] The device tree binding introduces the `regulator-initial-mode` property, but the corresponding driver lacks the `.of_map_mode` callback required to use it.

This patch serie includes a commit that adds the `.of_map_mode` callback to
the driver. The callback is added at runtime dynamically depending on the
vendor. Maybe that's why the bot did not notice it. Indeed the driver is
used by several devices clone from different vendors. The `.of_map_mode`
was restricted to Silergy vendor as it is the only vendor I am able to
test.

> - [Low] The patch defines constraints for `regulator-initial-mode` but fails to define constraints for `regulator-allowed-modes`.

According to documentation `regulator-allowed-modes` is the list of
operating modes that software is allowed to configure for the regulator at
run-time. No one has expressed the need to be able to change mode by
software on this regulator for now. The need covered here is to change the
initial mode during regulator init.

> Pre-existing issues:
> - [High] A preexisting bug in `fan53555_set_mode()` corrupts the voltage register when setting `REGULATOR_MODE_NORMAL` on certain vendor variants like RK8602.

For Silergy vendor the `fan53555_set_mode()` writes to the correct register
since `di->mode_reg` is the same as `di->vol_reg`.

> For variants like the RK8602 where mode_reg and vol_reg are distinct
> hardware registers, clearing di->mode_mask (e.g. BIT(6)) in di->vol_reg
> could silently drop the output voltage by 64 steps (400mV). Could this lead
> to severe undervolting and system crashes if a consumer attempts to change
> the mode?

It is true that using `di->vol_reg` in this function seems wrong for
vendors that have distinct registers. However I don't have access to those
devices to test such a change. The submitted patch is perfectly safe as it
ignores the mode change for these untested vendors.
