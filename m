Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53063A641F
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 23:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590865; cv=none; b=jrCuSVvBzfW6/grOIvYnYevWJBfpGDTNLwoJnkh0rDFf+4I4y+WmAUJaTaYSIVOsmO9qtpwBkKPKXsCmWYHHstvTsEdNqOif5kD+BSiZE9GvZm0OkYJT31F+ZAPMgu3de54qyOeI/bd3uRG66C0q051Ms3xeMD4WPU6Sy7W08Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590865; c=relaxed/simple;
	bh=PoLlpdsHqpFtL1QScbKQ55IvWNzxPigkSoWvBLAMYow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT1Hk2dZjx+/sFEXnuCizr9jXDUsGJIAOymclHoOSeiiyaHgGmS2L9tAC2LgRo4NI27IV+cBLcUxZb4Z75kp0LXgC1YWmt5MjHuhkEVuwliAFfKLNF35aDqy/rOvvJgHHG3Waal6JwF0ect2/86rsZ4H0QgJUnDlaNG7xjPeWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foZQznDY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foZQznDY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c795a47186bso600328a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590863; x=1778195663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=foZQznDYPFJ5OUzJ0UUUfztFfsrkGNBZfth9GXy1NLWP51/wF4Njn/AoErSg5pUX2t
         JGziMZatqfFnsC6x5RGzz4hWH4muzE+MRowH04IcPu35ZoGHREm/y2ONxmK5upM+oA4K
         gIF8xCXEDXbx3F+BjnV00y9HF4HWz1rCiB5Vht9DyE59cYKM7+77b7Azqrc5Du1ZI3IQ
         lCsDefRAxSsDEF3NqVfZV/Dl5ZV2aBrF1AvxBkC+7l4CdbttXDVGUjcwio/086mZCUK0
         p/nOCQT2yxPl7GauXVZR2To3njdV4Yq2ALTgy1x5/6WrCtoQ7LO1dHzf3G5UJbooTuWQ
         CmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590863; x=1778195663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=k76AwHL3O+HqppdMZMGtCsPe69V24L9VqGSbHBweI2r8HwGkUrVocrgEnOjPSnmklL
         3GHQIJ9lcF3Dyq5ZYeBXIlh1V4lShtdjOfGGFUkJ4M2e6cDkWON3mr5viHSY0xqBmhM6
         Levk5P8I/qCCsVJrbazpJTRrhqPChlLY2C6ceHD18pWLXCVDKAbuPN39pjZR82vNaaru
         iq3W/XLaPgMeaC8TSxsAJTHkGoqApnv4+8eL2VaEOeePNNjU7aum7undQrT+RFSIUa54
         zdWcTgmiKpH2k3qCjkHh+08L6tWWvikBwQj0XZJvmWLx4+LB54UNzwfiDVW16EdmW55w
         IO3A==
X-Forwarded-Encrypted: i=1; AFNElJ+ovGz5y4gbF2WOf5udIg/KV+hKl5E5SkXia7cl4z0NWDIjwb2xsvg5oBMLwOBCtHWNWRGUzLcJ6NbT@vger.kernel.org
X-Gm-Message-State: AOJu0YycGxuXe68qB7SoS9U1ZISJUrmpfuV0OEZ+goO7tEQ+dMNOq7s9
	qwUNN2W62lsHl1kXN771yWSqqj164nBYd4zP8UCQXb+lj2qgcJfDdgyK
X-Gm-Gg: AeBDiesYpKwWnxSaPCpEvbtAwtYc8vFcWAGayFBPtQm+eaXXJXmuihN78MUW4lcv+mb
	h81Jg0TR+Kl7J63ItPSsbRQWqosnUuc8sWFE42leDu3o4/aNEYZAmx+9cNaLkE05rcxQJGU//7e
	H2MdZ+S+h4m0vELUk5F6FJOUXvUrZHfm3YVsxTX6iMaKmf8rcJS2J3J3FUxf2I43lrSgL+voAw4
	fmoR+vUWY4m8+IFFc1iX/PxbWiRQxLSKFnaGc9L8ifbLO0V+QG2/XruM25RXlTd88SaI2gTemkC
	NBbBbZAeQxXxkeaQlZs5XWgDKnoTNsxFTNycKaaffrQ+QGDdUSN2E3e5gpXzrni9tPe7dcAoYuf
	owuYIS472vR5e1b5Uc077WcW0vtH2Lx0m1xLCXnZVzR3cb/1O9e7zkp4+UJBe/nIZndJmopvMhw
	KrZDe1Y25o/aCIZ1khQ5YggX3cCNbT4qMdYG2F9Dld2O33AzRuermBLbrQqQ==
X-Received: by 2002:a05:6a21:3298:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3a3d1cf2f62mr4499046637.15.1777590863268;
        Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm603009a12.32.2026.04.30.16.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:14:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:14:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <4981e0ac-ee89-4c6b-8fc4-d6899f1cf353@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>

On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
> 
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
