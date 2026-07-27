Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE2441DDF3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163440; cv=none; b=oRNXG/JbA2V1oa+WO83BAKpZbDqfDf9ZXN/WRTKmo+GUKdCKdep30c4UhJCd8BGfBaIQEOCaMK20ELbVFfhJ802d2dh1UbbP5k4PeuPijBnnA4ex4ZwCiDiPCDtyoLAz/7ZaKhVYY4G4d1cFY2KPJaWF6rhRKsPSOvmI9mAr8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163440; c=relaxed/simple;
	bh=FV+/YCwfRcSeJLpQbyCqO2LsqLecdOQ2BHs0QhtxJL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UshF6a2L4agZsaKnE4qGn7T8QdAUHVtDuFoqL6rjfmsUdE24hDoBfjEbxUhiJBzgeIw0+G02tb1ahlmC4MFng4jsZM75SM0lmDbX8PShSl2Hs83d4f/tDFYO/5sHxOQTajpSwqBGKpz/MMLMb54mHLjhsUgN4mPpeSvryDbeTiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDdJf4Wk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDdJf4Wk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2539511a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163432; x=1785768232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r/gU8ov/fQyOvJUuHODvlkU8XPQBpDuOkD6xU2q1pEg=;
        b=DDdJf4Wk1YcEtz20RXvXgPQhxaXWLz5dVCSgiaj0k0w+lJgYLn0HVLDawX3OsOaxeb
         z5earDSw/QsIFGNl20UBtopa/8NGJXU30bxTCHxfR8+FxB0FMrao7pZ3T/VRM9VDU1b8
         UowadDkKwI5B4On7XjKMHuseGsZXJ2jcuIZ2d6nolJsFmjAIhhEEghNkjzQhPxmux+a+
         S+gHMMl4ZWhFZ2CYX6ASgOhy6tEgfwhAsT2ixcMuiPrfWRODFzwl6hrUytPCXluTaWdg
         /19+N/eOEKqNIRi6GWCGvqZSjBgkBh0As9OMnwveOgKN9JAW/+Dd6XIvW50TdTFY4UZW
         mYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163432; x=1785768232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/gU8ov/fQyOvJUuHODvlkU8XPQBpDuOkD6xU2q1pEg=;
        b=bf+g9sbyAWmLaK7nz/PELriPzaeSGEwHlkXPP6xnQCfuummkFDiCVJFX2kA/lVzEVr
         HAtLr1sYr8Kt7fEkO1wAN2WEEkQNdbFols1Zwh5UG2N2pXhvRj0hKOvexrITOVEMHnjE
         pEoD0th7gVr9RCCeP9W7GIMoV0GUTSNLI874M784VM5rhESnVfLF0PBtNoD8JJV5jW+L
         TRz11uD0ZynFMG8UFBjQuutnjkA18naCb+eTfIEcXJBtlAzx1xnNg4L/ChkC3Vvz/LUS
         kwQm5ygXmPG+0JdKUsMLmc4h+7X78h4XlW8Q3vshJyV+fmUZ7Rv/8kUAxtuuZfiAypDh
         4pIw==
X-Forwarded-Encrypted: i=1; AHgh+RqP+Jhoy+jW6f5N2gG5VibM8QCTWf/R9PsFQ9ktciJQ2rvfhLT497bSV/3gPxo/2B0KN4KuxOYT0fDs@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfrsS990O/UBHvjM467uBFcPw2Wlb2gr9QQf0i9CGWKXsbiyt
	/5L4yiUBgU1yw+pQMSQpJGLsdhqgLJbEqTQ1EhiVn/WlNTlVHhytujSJ
X-Gm-Gg: AR+sD10LLIGUkkkofYdIMeWlKCThLmAkqpH1FLPUtjMdUhuDw9j8y+vVzKQ8+BBCe7Q
	cB3+iNA6cXnbDCSKd00imI8xU0WVrDLFvRjYdQVx/mA36rkWdjPS7lK/sTfp4qMiwhVZWkFrxdP
	4YlMBWN/dYFoadSPh5Fd1SwkFcnLrSkC/wibyPcYpwt3OPCoibisTGSSzbG34F923ZEy4T/O3oU
	8+KMljNvicRH5tKftUzLyTXAPV1wLkJQxkOg5Ff5lC7laBaVIg+Pn2aKnqPVPvtui2Tp0MvJAx1
	be9+W8akPLAUGM3+dlRyxDXzCvnOpvXnErboQxCCs0K/kvej6Du4pyYvzqdjckgnMWnCt2YuOyJ
	A2afWPQ0l3oyQQMJ+gnlhCrZYsTtizuvSl48UnVPNbGPLLljclfVUEfYM67IYdm6w7Zyroekzuw
	PsWgHG7JJUTuNe16U=
X-Received: by 2002:a17:90b:3904:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38f293cf251mr8242794a91.5.1785163431273;
        Mon, 27 Jul 2026 07:43:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm54034061eec.2.2026.07.27.07.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:43:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:43:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Debjit Ghosh <dghosh@juniper.net>,
	Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
	Santhanakrishnan Balraj <sbalraj@juniper.net>,
	Brian Mak <makb@juniper.net>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Message-ID: <e11f1d3a-c283-424d-a40c-2284caf904fa@roeck-us.net>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
 <20260725211945.288415-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725211945.288415-2-sanman.pradhan@hpe.com>

On Sat, Jul 25, 2026 at 09:20:06PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Add device tree binding documentation for the Analog Devices MAX16545 and
> MAX16550, and the Volterra VT7505 PMBus controllers.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
