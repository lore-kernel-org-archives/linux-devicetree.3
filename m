Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F14AA1D5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059401; cv=pass; b=mMmQq6qQ8Sjz3foLacJu0mpeFN+w1xXnhEM6ci/Z/UJ+Sl81yZFf3a5u31mPqDE7eGxiwqoQjgWRiASpQKR3HrVeYGCk/FsKWyetbQyzPhKeE4J02kv/FCDWXcsJAco1A3SHAfRto82AsKwPaAW3yOeePfP9GQtylLafdTSQQRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059401; c=relaxed/simple;
	bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5YTlcMcXlceNTfjjCLY9Bj+cNHsnjNWkfnv66UowjLg+m2UJpu6bdVjMtDvV+OMAuUo/jiQe9LWaRnkn62y4mSEPy299Nfuk6d7Ii8i9tb9bEIlW+3ySSdgRH20VtED+c50Bgk0GjIdbW2epyQKb4Uo8GSS7E6gyKw6OZ314A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxY3U167; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxY3U167"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso19248e87.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789059397; cv=none;
        d=google.com; s=arc-20260327;
        b=YGSJN1Xw2K3Tw6ZHQgqA8hF2/m1ZEMPxc9MJqQlpFIAL3fihw4uYVenjXFua0TR9Cn
         /yWYqOEy9q/kwCGfSRiKM6gUzXgtAVN80yqEbuUUMXPO5jUMNbeEkuBQsGJopjqCAA8n
         SmebGShwJE6Gzu9ILzKlb3RN3DBf3cosE8BgId11PqIFaJDUxp3O9MogXs/ukRJOJLeZ
         LUPSs9t08cnjaBeTxfLHYkwmE33/+5hFdczIjx8Bldzl9joKUB5XvoJDCKZNIhc9Pqxh
         8oZ4IkhKkImbei5r6xXYCbIHzFsDOyadVDeDg9wDw59rt0IoxSsTdxlwYpJX1IrOBdR7
         bSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        fh=TJYadxVKSaUCJC2Kuyma+o0goDfcEm/ZTs6MP6hNlsE=;
        b=SEEKGSzUEo3v7rxh5tAGYY9AvTCRIEv6u3DpZlQbbp8qXLfnbsx2Jsf9Pa/qZeAETp
         eiysn+1kYSZ2hBpKRvSKZLcX/JiyCoO20srls2O2o7uCbQ15CEz5RPLtBUTGLwzQAPN9
         vpEg69nNmNJVOpv5QGcrhvflZA0T2tePsaOSp3MAVN9p7jwZ7TZgkwVKq1kvPsbT8jh8
         Er5uoGfamIE0zQiY+rSMpFKMZY0fFwr9DCxJl/G1UaQkpkYEHT2i/qlQbGljjiOrSgen
         o/vAgwLEwQfcumPqNJzHxVvFQYUwuI+CCy7774v9ISV+UHgx9paULQSaGmMnsuF5tc0h
         Ww4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059397; x=1789664197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        b=dxY3U167tw3Blu1zgBWr4m3yTDj1d9H2F5/4ohkb8wBPvrQpgpAbv3rClChx7vM2Mc
         IdFbrf/0iEw2qgxwX8h5mRZssd3hJ/cuG20fVRJ7L1CmBjkhl4YYfIuEJo7z7eCGipHO
         iPUFTrPRtE5lskd0wg8UUSCzZinHgPl5r9eOUCNDNifPykNivRGFet4vXBOyHRuDsmYK
         +7H+Vr5UYoPD8JGFg/Kr6C2qgIpsOqXR1/1agOe12a4ELBgePEB9aT1lazw9Y+OQqO1/
         GmQHcSOaHZ5VdJ75d05TDBx3BTttil1MALWHpQdKNh6rCUxAAWB+OZ6OJOUNeFFaqqxA
         o6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059397; x=1789664197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        b=DIBNlZyJGST9TFbmmq0Ro6mPaWMZ96DNBGJoDquTy9oJbLSNgZC4LDJQKMU4FprwxM
         K04FyLeEUQMnnyaVeiqJ8KU4L388aMAH86fKsscIAkA4f2qlx8k5lL0p7q6sg57X2+Az
         jA+rX4jbLxhnZQW65d3jOFT8WF3RbV83dUQTtLsIqrFmXFvNsOsuHysk3FILdb7YYZqd
         ug6M6bJYpy/kooSGcSb0g/HJbSmoRRbH73JLLRBin6jACOUagf9qSy5Yk+n/KPCb1whH
         3SjGk0KFF9J88zuxd9N7S8YYXU9MKKIHXNQHsK4e9JXdt/2KmiuF/r+wCwQYZp7BdrVr
         JeCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpCwfjmeyi/1jdvUXDmUIUl4LzO7A++u0KJogy4Xy3+IqAyd7P2iPHH0MvqJaOp5Got+KLL9qyAYBE@vger.kernel.org
X-Gm-Message-State: AFuF++lYKm4PvbKgXu/teFOYqNJwVY/6aXlpqV0aRw+tX7AR3skBEDdf
	RCRBk09tMZRbfcoWMFunumbzbieqw1bgMj+Ux7Q/YXXdwtNtk62Zsc4q4nSURghaT2FKrYQWNZ3
	x5fYKAPwQ/irGizvWpdfn6QvmHGeR6sA=
X-Gm-Gg: AYBFou2iByS/e0sQRVQWqM/AY92zPIdYiqux+xtZkx2HPAeby0HlvLafl9q0NCRw5DN
	v2J9IgqhdhIIRyG6whaZd0c62aiRuNQ6+6dMnmJWukOFn6e2gZAog8XAdZLXH7l9VDjJxRRh/LR
	MNuZHaCuwJvc178F1JskqluOAvaRidbHr+Eyew/rxkn0B26oQFZy2/yXF1odegarTuyfdViSIKP
	mvbafOoI+jSFZ0S8SEgM0LA/WzECCjGrmGJjbgqeW3mR3Zzh5gpsySisr8mZkwjCTNA1yJ8JhyD
	W6vvsoiqR1sKzCq8aXJMNopBpDrgDa88lPC5c2xafQ7By8M139vp+YYzsRlPSf7Yjztm2t2SWi5
	WKvwIIy1kD92j+84/U6nqTdyY0e/gqYex5Un0yNV6Qx2am82/
X-Received: by 2002:a05:6512:a92:b0:5b6:1aee:95f7 with SMTP id
 2adb3069b0e04-5b89a37bf4cmr1102365e87.43.1789059396760; Thu, 10 Sep 2026
 09:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787502624.git.ahmadexp@gmail.com> <f04b85bbf71a09f372b1f248dbd2b1286a0ba903.1787502624.git.ahmadexp@gmail.com>
 <20260910123528.GA1051768@google.com>
In-Reply-To: <20260910123528.GA1051768@google.com>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Thu, 10 Sep 2026 09:56:25 -0700
X-Gm-Features: AcwNN1WQJyaMmPXUVD3vdCAdJhASvoUrxNU6PY-XwXiL3uKfg05bB7LcJcmHdc4
Message-ID: <CAOQiBWM_506kwk5Pg5HwBhHObtpWN2C0e+OducwfF6ER7ouh0g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] leds: is32fl3207: Add controller driver
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nam Tran <trannamatk@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Lee,

Thanks for the detailed review. I will address the cleanup points in v8:
remove the redundant led_cdev pointer, populate brightness directly in
the class device, use chip consistently, use loop-local indices, and
fix the wrapping, alignment, braces, and spacing. I will also name the
current-scaling factors and the two PWM bytes per channel, and explain
the output-disable fallback when the initial PWM latch fails.

I will drop the unsupported-property list for multicolor components.
The binding already disallows those properties on component nodes; I
will clarify that brightness, default state, and shutdown retention
belong to the group.

> Is it even architecturally possible to set brightness on a shutdown or
> disabled LED? That sounds like a bigger problem.

The guard is intended for system shutdown, rather than normal LED
unregistration. In the current LED tree, led_classdev_unregister() stops
software blinking and flushes set_brightness_work. The system shutdown
path does not call that function, and i2c_device_shutdown() calls the
driver's shutdown callback without draining LED brightness work.

A previously queued brightness callback can therefore run after our
shutdown callback. Both paths take the same controller mutex; setting
shutting_down under that lock prevents a later callback from writing
registers or changing the final retained state. This also matters when
some LEDs retain their state and the controller must remain enabled.

I will retain the guard and add a comment explaining that distinction.
This is based on inspection of the shutdown and LED-core paths, not a
hardware reproduction of the race.

Regards,
Ahmad
