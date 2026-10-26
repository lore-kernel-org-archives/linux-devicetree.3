Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976508;
	b=Ca7fZ5qSFp8cEftrlhaM0XcvhhgYulEMeWSCatvzz8Wr83bIp3p2/i2gmu+il/yHs3vK
	 w1ceQhzpfPivubLjS6JcSxxCfs8BMBGErSEJEjpZgJ0yPagpjWcBopIiai+AfvW6TcwzK
	 lk7OmIVpGBBKjewZ2H963Iy+yDEGW+t3QD6+1taVvJvDyG4JVEfFICnBbGkHxT+piGzZz
	 YVx+CzEwihFM1TjZaA5LRPhtuIpotK5HRHT8k72jJeSTr9HkRg8aW1M8B+HmQqJYbThk+
	 kMsDT8ZTyGUKJ+8eJY7vVNqrjEddbIbtTs9GB8CUMXo/erixTi1L4NwjXEfFhN87TEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
	b=xTuBvdZ0CHh+70+1QNjqo2Xi5NOWZ2DX0IIgrbxHTs055nWhlQAETZL3P9LBDAtZZq7I
	 m2BAiW9orkV+TYuxYFLbGbooh1qVlo94au9ghbLjFpiiRibDvvTEoey4aJSgPCPlAT9H/
	 GcQopq21DX/x+hF6ReZwfNvaXSSkLAkY+Q4bUYAEEtgZuYUVX4ExBhDYd0qw3BBG7tq59
	 v1tHAIshcaMBI4GWpy+BTRymDyBplisIkLAax4GFak9vILdvJ5bM+IIkeS/YI9ztmZ54z
	 hPLp7ST4PU7Uiac+9zczdBc7ey5hcaebyLmZ86AdXXe7ah/mMAjx43bPLE/JhXeY/dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kesbnkBJ;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039B606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B039B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kesbnkBJ
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so526696b3a.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976507; x=1793581307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
        b=kesbnkBJUvYzphCkzZljvgMUBw1E06XWOAD40PUeR5WSEw8f5QOb5oeqUFKJDCRJG9
         yhVF178AgwImYtHmpAEKXvHVphu1ZGmSWSRrsYI2ORSd0HLi1vPcAMQwnSGS16lHAlSf
         MYY2DGatfnLI75aO0EyiUmHgyzBzkJIg4iVMaTGSJ+bXC/6dCt8oBdnUkVPQSPjiTM8p
         X0viSroGrckqS+rov3CRMIaaZ0HIdYA3aQunn68nZT2xkedbzpO8zq/aLIhN5KirLjT5
         9rTyCnqnrA47T9HlUgzymCDyhYr3Xz6Nbn4AiwYE8KRLk6olcMMrC0W4/71LGf3zwL55
         jvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976507; x=1793581307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
        b=aqNmSuZ85BiNFzgQGQDua4YH2oIM8g6FrUmAMgjX81qZxXW1DHOtw+KtB53nHwfbgx
         iF80h/BKYfqN4mxk8hYX0zhdZMSo7uRNleqB37PJPk4QFNlhv+7+pgcV0gjbRoJRSRDc
         VY5PpYJNV6ER5DActznNBoLaaPGcpd4mR2e7y+N6Xmvqqf2vEqTMP2kIDYbZagOBbXhq
         4XzIGDZBvRXRWAnmRbpN2aeBaW4KIUOlprzmAPt7SlofXqDCWOTcPreggJUhGgsJFdlZ
         P+kxTgDfvvRRFyzzX2OH1cT1oINVFXSeuwWSnps59T8ALudy46PJ3TdWRjIiAZ+j615M
         OCiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaO7LPOtX9uV3hrJujjvfx+nTUeWiiRAf/ZDYfqSfL5Owqy0i+B3oolsn1vRsNbl+CLRhvXi5Oczhb@vger.kernel.org
X-Gm-Message-State: AFq9FYK/fz4L0tB3hHxEyAfEZaH1c3Yk0expe2wZ+mQnkyPt12ZJjf7v
	cK/o5S31wu4J6B631w7zjOV/Ty10PgWx4jpr6KBV3OFzhtsWgOCpvQWl
X-Gm-Gg: AYBFou0d4oa9ixbA7yvj29b2+wbr4eAMpsa+rWxLwRFvbSSWuqyQr6fI0CKI/EUPn6v
	1DgZWC7WUSeIPYY0sinoqA8rAoVu2ex7KaFcrEWMKbkcDScVX4p9fwHEwV42fFuPoknFXrYSIzH
	mknQqB8rBTsgYBl3dfin/EQOI5sOJt5xzqETMnwFveXKJVs4yhAi/XIudcQDRqahzbJ2FHQV579
	eSPkGSqUM0Hn6Giti4wi+VQqIooEtKchCBsTYUSGhMBgNBQCKoFPMWy82HhKnkHIXUgv71HQS9D
	dax0YL7mGqkfF2hqg319Yt/7TIpDzuR+84pKy5YEJ2Q6A5gy+TweO9N7rq91mJ3Q+zE6kHZpqKU
	lxTZ2WtZnlg/hEL1JfJitYR1vF+z/jT013ucYyPOtbyRsYAatTCs5pm/bg+keZ++NOte1ncEahz
	fenLscFQVlimfcFqgxkjGxiTR50xc+3BOUAJ/m0dFyjrWZ2FBcOeGhXgBDjrCxjRyb7EIa+8/jc
	3SwwuHrjocY6SxhnJ2DTw1OEt+C0Qnehj6kUPyYIeYSy2NrTlTavMncuUeJjxJBrOEp4uq77nHE
	CoE8PnFT24EXIGM=
X-Received: by 2002:a05:6a00:2e9b:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a3686bf26cmr4112884b3a.27.1792976507110;
        Sun, 25 Oct 2026 18:01:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c4e8616sm830722b3a.56.2026.10.25.18.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:01:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 18:01:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <cee14239-74f2-4fc7-8122-cd1df1dfbf84@roeck-us.net>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>
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
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>

On Thu, Oct 01, 2026 at 11:47:40PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Each device of this binding has a single temperature sensor: the
> internal sensor of its die, which the device also uses for its
> over-temperature protection. It is read over PMBus with
> READ_TEMPERATURE_1 (8Dh). The sensor is internal, not an input:
> none of these devices has a pin for an external temperature sensor.
> 
> Allow a thermal zone to use the device as its sensor, to monitor the
> regulator's temperature. With a single sensor per device, no cell is
> needed.
> 
> The MPM82504 has four channels, each with its own PMBus address set by
> its own ADDR pin, so each channel is described by its own node.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
