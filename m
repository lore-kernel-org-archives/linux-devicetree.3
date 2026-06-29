Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF91938B7C3
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766531; cv=none; b=XS0QufIxRK6aB30Kh0UDZ3obUxm/2OfUz6hL2xuaKTOKKDJBnR/8dGJ1xK1exDSgmvF55AEg6I/VJ8twarRryX4oCvVf06fcWGS8W2rVy6ShgzDldROoQxsFSXX1sw1/1jBy9+wOCqckW7xw8w7ZxK0R7p3bdNIH01wsItj5LyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766531; c=relaxed/simple;
	bh=KJ5qYDAXbSZpW+fxlXr7C8SDvTtYGZaUAly4G7f3Q74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxFTz1bOGoG72S4oIM8TE3Fyot2ibiIx1OnGwvidlaURtC3vuo+pr/tXH1rrK0xQpP83SWEfxb/SKh2lQxe48VpV8KXqh2IYFGWU5GriVt04gavh0YAaElS82RT9fe+VWwpQrH2DgsXuiLm+ZbZy42lZwvrO6ENa6vAsgZwUOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIyWFdod; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIyWFdod"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so7404803eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766530; x=1783371330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6ju4JjRWVYXUbqVktnuuryEIlFiwEfbWXQylb3NQO0=;
        b=UIyWFdod2gJqPYQVneVn8EHGglC2FRTBgHOdi+vlI1aDN3M1k2lm5BNKfVNplZrq5Q
         pAwroLMnS20hackqPZWWZcSoRn1lrFbpOUAvXGy5ujThAx9M+i5QGoNfLAj8ysho9Ep6
         bIKA9GyHCrH2gjZckvwRe9MxpaxHvew9G14kiV+vaS26sPoimldqvGoCbP0hV6VOJzNV
         kmNw0vgTEn1rxEwJxxB8XQaedhvNVjQZopHGzu0ZKImlZXFzowH4aHE0Jt5MJRXf0FDj
         sAUaBw4XjV7TetXgfrMPwyZNC1kerI8UQlTFC/nQ+LlCz6v3hEwc2ncWNvRye7Ujdthn
         ciVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766530; x=1783371330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I6ju4JjRWVYXUbqVktnuuryEIlFiwEfbWXQylb3NQO0=;
        b=qu0++RQvcDqAA9bZPEw4JKgq4D5HbsI3NKMOlRT6A/26B/h11bWE02CEzu8YmGJT+l
         Tl4n4NQFaWPm24T8TbjnLwjR/dZ8JYs2P6QtSPWJCTu0D2X1tofNyTxyV1M7p3A7Pzj8
         vopcIOwqmkZVgEVrOW1jybNVujMuEiqGFnQSeVNr0ud05xAb/gHjxHLAHoQUxWDxsnmM
         sT5mgoxvcogieZyzzK09YUXWjTJf50ESyeGYn+Kxkx1v1KmhU/geROVjbRDHJ92U9piw
         f+JRbhU5YT5ff6/zJiZy+QgsLzNz3f+pm3bUt9ClLZjlRImvgJxEMGi6R/phGMRx/Wqp
         qeWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpfv2VsZP5Oi4nlia/BiW9qrqW6J6p0aciHdwkR1wz3H8pV8TuFX6GA4RoVQnnOCF459zYpIahNpo32@vger.kernel.org
X-Gm-Message-State: AOJu0YyR46RgFjgwgQwEf58x5SIRaFmOCZn4+n8ezluZ70IKVfa5s3qR
	/XtVfgUjA+HrGiyYoRPgesF0aXi5qo1R61+k1GftvVJZZqZw1wx8HgWL
X-Gm-Gg: AfdE7cl4ewvMwI6+95+1EkYm9GWhkHVF604WiM/jw79iuECXCapwafdmlvowDSL7nv/
	sFQxJR8hQbu50etbhfG64+bMq8cQOQUWvlsFeY1N+JKvaJECs0SuX/LRpAvzIH7HN17+3DZ8KgE
	eKdi0Yo7fToIhAYnTcGf0hh0GQAWprWFO/Dx4VbCu0Uyk14ul47JmHdhNzjdtHE6GotU5I3bvKw
	z5HlLanMtQCGnD0LpvVSOrX8Vtgx9+zPNS/oiRhG/spG8IOK/60A3Rpp8TGsdMIyCOmSLkzOjLd
	uUi+DnymZESlnVxB+CyFdytM2BfP46uIoSmGMtLhgUXvT8zXz286IXmO6Ppi5tVQye6NvDvca3m
	GDbAKR4hiyz5B5jqjTm4U+BKQhMApoCt7yWiZ639FP6zLIIECcmsLBZFx2Zm0E7UcV3Ma3sU/Pn
	uF7JT96JnSPfUZX4RMfeG08s/msA==
X-Received: by 2002:a05:7300:6c2b:b0:30c:ab97:d7b0 with SMTP id 5a478bee46e88-30ee140767dmr604274eec.42.1782766529668;
        Mon, 29 Jun 2026 13:55:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee31da63asm847354eec.21.2026.06.29.13.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:55:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:55:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/9] hwmon: adm1275: Support ROHM BD12780
Message-ID: <af694b9a-fa31-4665-aa47-a7822931058d@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <e1e6e6218c08b562311356ef9c57378d32c26b08.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1e6e6218c08b562311356ef9c57378d32c26b08.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:24:55AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ROHM BD12780 and BD12780A are hot-swap controllers. They are largely
> similar to Analog Devices ADM1278. Besides the ID registers and some
> added functionality, the BD12780 and BD12780A mark PMON_CONFIG bits
> [15:14] as reserved. Hence TSFILT setting must be omitted on these ICs.
> 
> The BD12780 has 3 pins usable for configuring the I2C address. The
> BD12780A lists the ADDR3-pin as "not connect".
> 
> Support ROHM BD12780 and BD12780A controllers.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter
