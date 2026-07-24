Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB74398E8
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911956; cv=none; b=HwRx4uiHK4v17U+MMdOwBxH03UbS9JTESutWipodJoTsba7M4K2TLES7Gw+BLjqO85IGaXPvzftDVQ9iZRNvq5rzCWs1hZwMd8BGkl0cQgVFoeRGu/sBw/45d6TZQzXd9XD3B8Rx6LQyCIiLLfWHLWsCta6sx20V4n7l1i1xc3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911956; c=relaxed/simple;
	bh=35IoV7vE+4nDzg2Nx0XPGWsaiXWtKAGksvCqm71nvxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6qoG0RYBEEjRdaaFhC/ZS0l1wAPdYpJe3BUJy2QFPElhBfvqcL+9RkJ1Y2QWQrLx+zD0ke2kxrkwTGpWKKE9hx5A4kYsNVy591se9+9Pwxy9sRtsYvwOyGsqJ1Bh4RvieAoTYK3AaUsRzvQQlI+z2NDcSenrAgknyf1kvD1P38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/gdoPS3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/gdoPS3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cea3004256so8640845ad.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911954; x=1785516754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5MlGsOLs4wGnW8TY+feH+zpq8ktGG8kIj4IWl7CUYw=;
        b=U/gdoPS3uztUWKsaZx23qILBRq2O/LI+FlvRWmILTwaNDP3fQrlqYDM3MJ+I97xU/5
         ijbpyIQ6fDZjjoDbB0EdgroMLJKnFIRMIEArl7awKjxhzNwNxHB2hsOFm80JibZvnNjU
         Pg6mjuVhpD85iu8yLpV0yZjefhbujiFhtAV+R2y0QcFDh9wSK4Nc0uDJWXdTnO0tSWGN
         8aje6YJUWRErKXHMCW7UAwLct1b3o8gCpalhXjUpql8WVbm64tclROucY0iife/haRjM
         em66kTwvADPiUYATOoyw1Wg26VEgrZ7gBDxfLvsw24vH5VL8cE3Nkez+JeWVu1jmTv2u
         Ea2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911954; x=1785516754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5MlGsOLs4wGnW8TY+feH+zpq8ktGG8kIj4IWl7CUYw=;
        b=I7TMB1NWKkRpq9fxAyI6PtJYIOGO/U7cqGlv7xknwKe95yJOhqSa6IGo2JJjOG7g++
         +ibHVwmn6f1TIr3HoH9RsWV0VDqWavjCxyDWaI+o2mW7rg00Wfg2UklgP8uzFnhIFy8r
         6nAf8NnX3G3UQz+p+Asnez71WxWt59vax3NR0QgJvxvQC3IMueR0bDdsxutlNa1sz99k
         sdWnP6boOPLDdxVpoJHLZz2o6zT2ln7Z1fv5bjGOVhVX0KlB0RO4UoTTwlPNvk1rG5v7
         O2lBM2JVqgPcw9tOyvMjosDVcaulDStXZMZ5E6n9I4qMbYbHs8rIwV6EdwnAijkc586u
         yd2g==
X-Forwarded-Encrypted: i=1; AHgh+RoKSGP5p6fU3IZMzIASBzyf3Q5LAynDGzkpiZgkklJwy8b2jtgCsdTiXs3WswjdGHhy+NewSewqR7TX@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvwhYv3aSOyggOI2dUqXDldgnHAJDYsyHS2adQLXN0eI8ADc0
	dzhG53kmyjtSXUu4Bvt6YluwCts/3s4WqU5jEZUkbgpoQMnjO0aGg4Im
X-Gm-Gg: AR+sD12no+jPuF+I/OOKWMW5KdwG0A96r0+0haWsAbkv8ac0HXJq+Mxt25DJ8WuKRbW
	T9oOtktoZqwN4cHQxxcHYnevdXskze+t3UAg5LB/vfK5BWhLtbHPRfg24v1L8wZwX2GtKWjrbLr
	NmEfgwrESg1Kal+cB9+fUP0gs2ToNRHRcDJpk8cCLyrq1Y9FGW17Qpe1SBmCEmhRZGdl4W2xpah
	/YvvyzFMAnmnCubAaWQ2XIPZ8PNu9tC62cSNZQAGQlPDgeS/wsNUt+8CrPY+vs9ZdTNtee2HtYS
	3kOG0F2tO9Sxz5aD29XfMpMuIf68kSNCNEqXEkgn6CNwgBKMvx15X3yg3YranEOIOQbaAi3w9se
	2VmU7LR/uor0dFl6xRCKt06CeByCq2UcqHR0jRXRkm1XSLfmZXKgW1p5rC7ZskbTFFlINBBrNhD
	wsvMY9lAbyOtlNyTZZ8qcytzGhjQ==
X-Received: by 2002:a17:903:2385:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2cfa6b6fda8mr95199715ad.16.1784911954005;
        Fri, 24 Jul 2026 09:52:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf9c8b7a7esm44701815ad.3.2026.07.24.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:52:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 09:52:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Message-ID: <987fa310-d032-49e7-bdee-5b85b0d66dcd@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:39PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
