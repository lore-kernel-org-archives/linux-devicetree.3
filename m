Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976476;
	b=wUEXPUB3jIObK3HQWiYazaz0CurPcBFYfKARCL0W9aGBZOIdRxbghilgUqY9feBLnrtI
	 8PXY6tEeOgwfLgBzehbWRKyflI4hVadKxCmjYxdl1hpv5vFZbraZfeYYhgW2hNl8XeSTE
	 NIPUumnR7FTGPWhCOGTnmrwaexVvytRWVF/VGM0X5wxSSGdQKogFMOI22JvYOQ+zrno78
	 0GzmOu6UuD3kbKdDXUmmUW1KOeAOP0q3RXBKMh70du55QNPinG4ndEaTVH14y/xLQR9xT
	 Xr0NrLS4dRt3/ZkDoWMf7e0iwF6+wNUkbzT3D+L2oxcMrH9+PliTCnoko+lTWpj4NFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
	b=ceOFj0SkIUiWTKISb7Wy9R8mJuVsNYoIPmcGJwyAwvfxs0dWmXZZChIfoYGbs8ZDjsKt
	 ZNuDFzHL/dLptX71JbH6TSOXjqm6VPwx8bzvsYl1K0pqvBjDO3hn19lEQ7FjNHAF1BMjI
	 tqkJLYRG2rTNg//FG7YpdjIXuuY9+qSfNCoNoU9XAyA/H8EuwDSR223+DH5I+x6fa+pYJ
	 RqX1kaBS0yKMeO0Sw9uFEPqVlOXNQYV79Tr/+4BSlu6FF3rDbj9FeTblS4Ew7tjmuKGKE
	 Xa0KsqMraw0EgB93RbUuKC7sealp/lZ0x1IlglXKIFjKmbW7BXo18M8UrQRmgrSOFlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYGUz59G;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71068606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71068606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYGUz59G
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a05b210703so926473b3a.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 18:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976476; x=1793581276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
        b=JYGUz59GR2IAGXxoiB3QNf8GkVf2fBELbswt2zzkZVtrkjTvYiwIr7neW8rK0w64G1
         8hozvQJCQ5Db+2Xqp/s5exrlojlPWTyKhBZAUnbPObs/GnRAVj+Xc3FvY8WPLXC7oD+q
         Rr2tGDWh/Pg2JjMVkUoj1cO5UxM8/RyJDOQZTr/BzBphFyM0hrXwkhGDudYHB3b2Ztgy
         vlWbUCpgDH3E2r4uLPIKK5rX+yF0PSS1hlGRIy/LMfGsFn9dL5gLVhAXGPuH2+vrZcin
         D3a9jItxfGcZElYsTBjaDBnr8U/qLYkKsdQchoqyDV8ULFwC3gfPNVll6kwcRZ59syb6
         2Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976476; x=1793581276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
        b=z93fuP8nTXN1/+kttmx4Ko23Z4L5FgIKG2aYaAbblTEV0KsATueTWORO69aCLrxp9R
         tz8C6Zo0cnO47wRLnhD3+8u+TcoKcjBL/P4CLaJctMptXcO4cnQWzimlfQvpHoZGdGvs
         Ehg3I2U26/3QUwHgKuH6s+XvaO5Nw2TNcnhxx9VJ1etCtyUfU5e/ms/aGZ5hoscE/YiZ
         nkE3uiKCxXzl+PcbzZXMarvnF6/YuZdbGfd9hGdTxK3aPz+sjrGecFRS/q2LuKWidPPU
         AztswlPH/1SFxOvNJV7fUwGadWyB1s71F4CDzJmgbWC45k3SmKWPGWKlZCP5Vz0xg0if
         DXIg==
X-Forwarded-Encrypted: i=1; AKwUvBxW0yPuCxi+LCrzxztzW4fm7V5sQFOre+liDoBYiK18FxlM1wPuM1IkotLboyBqgKkwZR/dLqXBLkAv@vger.kernel.org
X-Gm-Message-State: AFq9FYJ35KkkZaJpMceAuwKZUzX9bVabtRpwnNSqxj+cpzCQtqjsg/7/
	RSITC7psDLxwbpeunhjHGXT9wzxHu7TAehDZcRcZMiqpLpn1Z55cd0mX
X-Gm-Gg: AYBFou2+EBS5Yze/0LrXVu9Xm6JwZz5DNelZQI5z7ae1/MA98QAXt+hL28vs2a5esIK
	+VnhYSNvFHWifUrKs2V6R/ZuyV+4bJkEpdZ8sKuOm29m8lQJ+E6bYFj3xW/vIaF0U1uj9n2wKxV
	060/M0bPDLnOicmftwkSiV8Boqa0OgIQWTUDNHu+YIFBEI895AwF6OmMLSNQj7aub0aTeeObKS2
	8uOlh8UmZspVKGL9KrVy80aCWlIVbH2IPEEgAmNtb6dge+T/FHeSG7OJ7IMiV8A67p9GdpyDe5E
	xw6mIbndGHg+R16N1C2uEZEpR0GrwgK+uNo/IECBJGchbSlxKvEnfkk2dLnE68HFIzwmGWu9GOe
	oZro7tmuloxcf3HPN8rg1J46bqddud4Lmk/+NS7lT5k1ANMikCf/F3fFHhkB2OsRPJSTr8V3QFT
	aI/HOt2kOOmXdJ/ze8wfr/bd9Nv6dHqMahK9idEGbptZZ8plG5+egDQxrlZD5GLVnfdgrY9EyN+
	eLtDb9HZBiOqCB2hjMvIVWGAbsVdZJqDgwYWNsUm03IrbFED43zSngQsXDeK7ujHCVdMA==
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr4370525a91.44.1792976475605;
        Sun, 25 Oct 2026 18:01:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32f70sm5974385a91.1.2026.10.25.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:01:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 18:01:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/core) Register the thermal sensors
 with a 0-based index
Message-ID: <f29d1bb0-27c1-4218-a022-9905f1af62bf@roeck-us.net>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>

On Thu, Oct 01, 2026 at 11:47:39PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Since commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> pmbus_core registers each temperature input with the thermal core using
> its hwmon index as the sensor id. That index starts at 1, so temp1 is
> registered as sensor 1.
> 
> The thermal core expects a 0-based id, which is what the hwmon core
> passes for the drivers that set HWMON_C_REGISTER_TZ:
> thermal_of matches a thermal-sensors phandle without cells as id 0, so a
> PMBus device with a single temperature input cannot
> use #thermal-sensor-cells = <0>.
> 
> Cc: stable+noautosel@kernel.org # changes the DT-visible sensor id, no in-tree user
> Fixes: 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
