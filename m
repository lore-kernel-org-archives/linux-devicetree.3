Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250EA5221CE
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070067; cv=none; b=LNhwBwzM/4dB6cv4U7ZpaOewCH88+ygq/o1C4i3i3GvGYHR8IGwplOqOcJmWLw3cd/yy3LBvw3WFXBXHC32Wqxz3Y4GvZqxBFoJ3fRoOLFLSO3BOTg3jIP919AdZ7bQbHssFSgvwUtUuSASEvaPaqA73LejzvCIwCR53pxaP6Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070067; c=relaxed/simple;
	bh=vmh2K7iDtyJxcr4e+vs2mwwAuQGJXmiU3OYpnbP5Chs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCSSFS6ufp5OHWUqRlgRTEagYS9Ragbuma8MjWb1cYpjY8jT4VCDl4g9bxPxIjQplbdz8qfQaiO5OeqT4QsyQ3KwM3uI2Bu6SJtTT2PfDZV8kTOs/J3Of5gB6y57whC7j9QdAO98Vdf2rqqsjm+idF+dM8gSyhI+cqslf8w957Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJtumqmD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJtumqmD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso34949185e9.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792070064; x=1792674864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKGlkemdch/mOvhFiOVD3G7PX9cRJidAty9RrIvsrsk=;
        b=HJtumqmD9S7QmMzDvYc/V4LbLJ5aDxgUJMykfEARGhq9PHJrlt7Z73uPiMOAWb5Ahs
         4Nzm48TtBhjRHAO9BSwtOXHW8ADrtazaeVuT7dY/MI9mZJ58SYDQJ8EN1UyVf5lMUNHY
         oh4kf/wTMBhAruSvk1GatYvZvUcRgoVoil/foT+qSs+9fs51kcahPfgCohPS91KOfFD0
         pm6fbtaUdpNQF4Zp+4DibRIAanIvgSU/RhQW+lmlbv7976R5PQMj3TBiY+dG2qbQvsEy
         k1qGHNMSVlzdyQfdsasyMs0p0s4l9ksSXPw4O2OcxQZEbjvOVePXixdjeMdBInLkca/3
         d+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070064; x=1792674864;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKGlkemdch/mOvhFiOVD3G7PX9cRJidAty9RrIvsrsk=;
        b=w7D4hPj7F7cH1ANuUSStPMwcRM1yYIJh/9p6yTQYAfqpvde9VKhXblbSiz8wz0ODsi
         1hXaYucARjkb1olwAJ994tEwz/410ukjmu8fm/70idEcO0oJb34Mh+J7HaLu/Owxv8ap
         fW7gQ6oTALNTV0f/FeRmCY4wTDI6dF/9PxrqA4cbWDSteyKm5N84pqSF0TiT3uQMDcDC
         n76/76D7UlTLxBbo5OaGDdu1rSNy+TwDuFKcyinqpdzyo+x9p4HW7BO6BugLVKN82gvV
         ldrOk79IEFRTpBBB4hgNKhhZv4CbrFwXCxrKuybEB1UijXV0la8jBTRK6RvKIJ6XWqQ9
         Kw2A==
X-Forwarded-Encrypted: i=1; AKwUvBwiBlhrn6Ne191h1GPM/wHncffTzy7IhQBt0hk4fa9aKIODL9B37VJxSb3y472pti0XmoLCJ/Z5Il8Q@vger.kernel.org
X-Gm-Message-State: AFq9FYKNil9INpnNkhdX5r9jio/yf+I/WcO+s2WqHrwBVlwXX6kygIsz
	FCze0zHgbIIPu8GliB4faAnujG1x2PcRydPX3CWUEA7l5q1qvEPYWBiyLxArLA==
X-Gm-Gg: AYBFou1CcWdpaYAhMBTRbJ+JOxKu5+MFaFiMXJ/tnTCtPG6USooTDS5BfeUb8bf0n45
	6tCImL6xhEyPzZsGZbkWIbz+RA3+bf+KzB39rnfK/R0BeSMUkmddE+KR9Z2bi6oSQK04jkgLv0C
	iZFG2cO2G0R5Fk1Cin7QYnwxi+5NukQyYdOJBlzjBHr6+YGeI+duSeKG3DIPniLJP7FIh3QFm9s
	3yL8jr8pNdq0CS8bhzqtGVV5lkvKVxgw396R36cLmygjpq3vsNDHi1DedK9zwYmISEB2l8EO4tq
	mHECeIxgqCj6joqu7PSjwKYDGgKT8TtvN2vv0SJzDqikF5SqVJ80kH8J2qKG2ne0y5sq2ylBq0M
	XV4mgWPXQJ5PlB9mQ1aLjYFtFvtBYpskDz+3mvWHpNpPspG/TbWKmAenna9w2qpXC4bzQh9dbIR
	j7AV6ZH0KNZpZujl79GTRWxk3uvMhacbktepaNgbkQu0rCTlCAaXUehfLeWmcF5AMF2eLcfW2/u
	dPrelpTjBRj2zNT5S208EDHSI4N2vy2Zys3c7ECFHtxDYZO2Y+TbdiLvJQGD9use+img1eb00ag
	CbuwJO1gdefVpyHtkCa0+vlBVppiC5iNk7ihbX4CeCcY6GIc+2wFu1SnLYpS7gUcrTw0OwYI3u+
	ktEPTA2y+dYM3L9ik1zG5JUBmS4d+ZRH3dCX/kK9qNog2TEYg9Mg5mQ7yO8kat4z973r8Jmt7q6
	RkTsuD
X-Received: by 2002:a05:600c:8b58:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18e4ca287mr353914885e9.24.1792070064296;
        Thu, 15 Oct 2026 06:14:24 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a8a15sm70210175e9.4.2026.10.15.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:14:24 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:14:17 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Eddie
 James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rupesh
 Majhi <zoone.rupert@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] iio: pressure: dps310: add an OF match table
Message-ID: <20261015151417.00001171@gmail.com>
In-Reply-To: <20261015104945.2687162-5-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
	<20261015104945.2687162-5-paulius.zaleckas@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 13:49:44 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> Devicetree nodes match the driver only through the I2C ID table fallback.
> Add an OF match table, so the chip data comes from the compatible and the
> module autoloads from the of: modalias the I2C core reports for
> devicetree devices.
> 
> Assisted-by: LLM
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
