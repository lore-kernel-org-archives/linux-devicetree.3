Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3D33BC675
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 23:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591066; cv=none; b=hq2Pn8Xmf4GncC2r98jEczf0lWrFYUalTgE8JtPJIstN3cFS3e1SwMm1caPNlN7P6rmaQRIBCqdVkUh2pyz+CT1IHX4wdsPiOXOK5fdmKEwnSPLFMcQjas2iO5CFTpUFIKtxlV6LHn58V64VbqrS7ffuNeVJCXsWmh1jPEMszvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591066; c=relaxed/simple;
	bh=uIyWVp8D7mfhSE21zLSXRVsmni4doJzep5hg6+i9+0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIjn+CzDPWJ5YzTBCQcXeKcjxtxtfbMsho6b8biuRLaIk7VEUpAfNnXN6TlDioecxf5f/uLpOKvIiDMi/kmpl0WBWQu3PlUvpnY3a4sz33tIRf3dhBi6sCi+sVX+ESy24jtUhC6+dBW1MzL3VqLQXvlELl+c/dE8AGVBYOkLTWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtv8oWtN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtv8oWtN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b24fede2acso8933775ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777591064; x=1778195864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=dtv8oWtN33igI5jo76oZYU+erjlCq56x2vEuLEa/H2Ufddwkbygs9GyTZWIH1WyIvP
         bz4tLDyydb6gFN/6r5a5QDOgXPnXnk5sZmXk19FQtVnH1hhmS2eIU1oOrs8m8qEdNWx4
         vkrFWAvDTDiiFiec1i5ECF/Gp/Q9FrrhgsfJF9IfTXJLZIri22P7fTAZDXNSpZK/VldR
         kGFJXDoTWHki2v0e742kTPjRhtZuFZt/pVhpc0KMk42hGz3U0tOiHLpr3DF8I8Tgv9wJ
         x2ik3zIZu4obsUdlqm4qMPxiPM4NA1aRqBCHr516ZwwL5hu6y7QsLAGoIhCMl58DJwKU
         W6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777591064; x=1778195864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=E7XG3lUOEnrGRwnUb8ou/kwIePKjVo6obtko6SC3SnAeO51K+JNoCPlVHZPjpaXsDm
         rGbwqHJFvNrm2LFP/crgk7TpewqEIP/+nsSIB79I5IHPBHmOuT8m1j9URD0MSGEVJWW9
         Cc96OM/TjIuDxvRT9mXrbNKJ+mB+KE/iAoyyXIuTvNvkKB3kRjaY6+GZ/s8r9IYBvVH/
         4MEFvXOCZFWvSOGBmUu19sW36BcX1S6IBtoL7m3+Ii1ZsM7t5vehI6te5HH/kyiiJdZy
         O/QnIPfMzTOLX8WmJvpcp7g/CtByK8BMWbJg9se+pSR8d1T81TVdbNGJOQGvoab27kj7
         ELWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/u/wIFtd617Wtck2679m6uJ5pbaoMfoX4FVh5CRE84VUeoQHkp9JjRr1nK+aPW/cIeWiRbm+0DvVPP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CrwFCCIsnM6aBH/thP/AGBpQjmiFRiwoy0ADRzAAKpuRgVix
	+j6BJklacteRKEn6FYgkHswoMi9+l9xhxzFrprBL+6l6eAng6ykY7FH3
X-Gm-Gg: AeBDievywVw1TyPf9YE8oPtXIl8SsWC+7BsLW+I80tNyVckNuUWGNTEVMlh1dNi12LW
	mygsBqnxle29lqUeGWOkUvHYlzChJerSATa5HFm6JyFV7ZIdljjHs6Bja18gmyDGyX4qNwSWfxW
	dqju0/cb/k+9FWQ5NvALS+l2ENunOAOUNS5CwBdeuR84F4FfT4tSFBdXuHls1svLu6u/T3Gy2at
	QvXgEOMQ5qXxPHBvvy+nj7ebu55RqaR/NrZDErH1uURkk2H3NF2zMWqfz2tH4ronk7mKcMG6EL7
	jVJeWsEHjJMkbfSyBkAcmujaiv8I+qrxGxGVf8fhmFiYTby25t1HQ5oWpvPPIi0YbUvLVFkf5rJ
	p9SCtCBpA0qc7o1M6XNt6RmANNeDEtpaLc8e5L9egQa015hVxRV+QugmoyYXHjKIFrC3KM1UcnI
	5LVd4syzYqlv8HwtzgpdKyp486bT/g4+8mvWctInERg3ckjSE=
X-Received: by 2002:a17:903:4509:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b9a2316e61mr37002455ad.10.1777591063991;
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae58906sm6249995ad.74.2026.04.30.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:17:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 3/3] hwmon: emc2305: Support configurable fan PWM at
 shutdown
Message-ID: <931b8c3c-8555-4333-a660-e1d78fd67a00@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>

On Wed, Apr 29, 2026 at 09:59:55AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

I don't know if Sashiko's concerns are real; if sysfs accesses are still
possible during shutdown, lots of drivers have problems. With that in mind,
applied.

Thanks,
Guenter
