Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E97D4B8DF2
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003817; cv=none; b=eGh6X8tFYY0D4meJCpZgq09qJ/xGuQh+ynDzRs9Mi27ulfJFfkA4LYiK49f8SfWcSFJE/rD3pCFjlZMp4XiIa9lRK6CfhmPDc2bnU8ucYXoEWKmICzP/+VPrSPve+sU17ecAmqmqUMTYdANx4Y4hYctM6FTcWWWjx9pQKpG/D+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003817; c=relaxed/simple;
	bh=btmsrMp6ZT1BNi7RwicFG5ia2RT35kS11G26E2R65RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQKslj4/hmriUhSMQGF/x9mLyE0/L/E3xvIh6MsClhP5ZzV2eUmDNX7YENbZS9K4u+0NOYJDdpPYy7l75nSBwCJZJjQY6ijw30Tz5ViEDzPwTlxW7VwMNF3gvczlkyGc4LfhizE2kMWuBmC9M+lzDKbtFCiO6B4RBaoMNE3WAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsv5SvNc; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsv5SvNc"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a3so2734801b3a.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003815; x=1790608615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=Gsv5SvNc3udEak8jwB8FeYVWdWaqy/aay5ShKJkiMtg7dgfnXhWKyS/x9mmisNKdNJ
         zC62/crv6yTsmQQR6AxoUxJ8Oi0pg2GXPur83bfU4kUZtXwqwTIQkNm1ph1W3SbHIodE
         p574YS5oyMiWYGYYjx3I4PM95ly8nfYqyQt5FilDDyGZR/t/OQB0KfFfV+bedIm0juxk
         kkUTofiJ6n1EKP9D8mufAjKZl+0X98BhZ4vg+ebTFvBO+vlEyodH8C2gDlirrt0AueJP
         nmofaNVDrotJ2D73E9JkCMMpO1CeC28c8k/YhI/LG/sWUA+cX0WXXrAox34iH5AS/3PL
         PsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003815; x=1790608615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=hdsLHK8h+odwBUri4Q0iZf9qmG3R5yoPwFVf0aPD4np2QM3Ko9h2Dcc/yXr0E6dru0
         LeNqirZBP0J2pZQzYnh7n6Re79Mx5PjqAeNYS10ka4MMM8onuaHoi0eN3m6oZQ+95aL4
         9MmRIxFNizfgBIpoQZBpeecdV02etygRWgigo6vu+Bfbo7F/y8uvKKaPKpJuc9ztZ1My
         6tc1q6hE5CWP4RLyfh5rXZDh626Qv9KK3Auq4qkkjZVRr94lidbz9HvSKZov44++kb6k
         9e9dP+A8MQueiZIzz5/q7PN5I8an1kqbVufK6cW3ODfa2qGaYm5F8m8qnocTkaWOKTYE
         7M2g==
X-Forwarded-Encrypted: i=1; AKwUvBx2/6ymQwN+KJrSo3H/ixRSKRHq2lp/bhpq4QVrJ1TfOaBNwiAHjm5Gy/yzrm7H6WXQ8Vz8/5h8wqUg@vger.kernel.org
X-Gm-Message-State: AFuF++kbmrPlDAnxZrvREbaIQvA+ZTf7Z3psHtgCg7oqqzQlRAJg2rVV
	L1vdX1Iq217avPqIBy6SS3fc+5mcrdZ5X3VkcLF6ETfoUHsh7HBfG0z1kj4h/163
X-Gm-Gg: AYBFou3bcEHOGIx6k1rksvnQiq4ETT+OoE2m9RYKrklvI1MLdtKg0LIxGpyMKzCdiMK
	7vrZ08L2hl0boDAi+91z/brJCQSum4Wzmbn66YwN+kdR8xrrToaO9VXR8bQVONrdmEXq41gaCxQ
	ocrJrJfxnqT00QZLDM0iEo54v3t1jW22sXynOMO5S+DE6uinhHz63IwdziluQ9j8ojXt27qTcgM
	Ox2dwQhHUkEXjGZ+ieN5ZoKGSGMCysLvAARhTCgE6FEGu/aYygH0xnkik/AfZDxvOP/y7v1CSj6
	gj1MlT0lB2v9zKFM+NF6OQclw4JGbTtH0A0iG/A9DMvYudH+Y8CxztK9WnCoXxTF1UPcNXif66F
	zm+tm1Ob0NwDX0OdXwuVLVFHwthHqlL+b46uDGuN21k7WQBoCTkII5d0Qii4RJWlMB1egjjqozr
	CROadmuZBZkZ8sdsWDCJtQx6LX1yFJDzGX5s+NLkz+lgyb5ihsBPo/1FEZgnvHcBTrwjHdJoDtd
	GT2KDt3WUlA
X-Received: by 2002:a05:6a00:ad08:b0:874:706d:857b with SMTP id d2e1a72fcca58-874de9fd734mr15109225b3a.35.1790003815225;
        Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3431796b3a.24.2026.09.21.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:16:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 08:16:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Message-ID: <d9dfa12a-0999-4425-ba83-aacd48eea1ea@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>

On Mon, Sep 21, 2026 at 12:23:56AM -0700, Petar Stepanovic wrote:
> Add support for the PWM fan controller found on the Axiado AX3000 and
> AX3005 SoCs.
> 
> The controller uses a hardware tachometer block and interrupt to measure
> fan speed. Fan speed is controlled through a PWM signal supplied by an
> external PWM controller.
> 
> Register the controller with the hwmon subsystem and expose the standard
> fan1_input and pwm1 attributes. The physical fan is represented by a fan
> child node containing the PWM specifier and the optional
> pulses-per-revolution property. If pulses-per-revolution is not specified,
> the driver uses two pulses per revolution.
> 
> The driver was tested on AX3000 and AX3005 boards.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
