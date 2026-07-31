Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669DA43CEDD
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512508; cv=none; b=HCoe8U5QlWtRTbohT/m1xMupxzcaFgBPJsoxhXDbDCjcMTgiitFyMGEbvaSoI0hQuDNqJ19pyXLIzyQj0In3snY8r4oVVyC+a6PHVnti7E4X0uuB5Y6MwNUhHQ5oj8ihQ6ARb0Kky4Fwb5syT9BmshIAY2YqoNXRbowLzudCrHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512508; c=relaxed/simple;
	bh=S4jWNwVoxryXpmJIFJfRQm2pWsgWhn1eAO+Cz/kh2xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHI+8gYwhz5Nf33UMXbgu6uEz1UCtYv+2rEUe3VQzUuzXoXjDbj375y1EWqHJ53lt3QpNdzl8IDWDsxx/WOfcoRXhHWAcCIseeNb4wx206wohJ8bEMdiKJou9oxl4LlGCWgvkoj9r1PVyzngC/ChCR5Tmz3aAZjxxe1hHBEch7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acu1wPhu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acu1wPhu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so881469f8f.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512504; x=1786117304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K9wxTq+qtlIZodCkySxOtPkp6Ej9MjKQ2UkyW9Dq8A=;
        b=acu1wPhuStqPRmTRw1Mc9EAaai9PUJNQa/yNvXrUghkmsp/32skJFF+sUOssbvNANa
         dEMuegtMjFOWEtuPB1zrGytddxXmZncAEmq502rJWAG47Kqnaf9G/lGxemXLr64GIiMj
         lwZ+cXt0obUUjSEI/QLcbonth93RZCF2FHM1wEQaaTZLVXRgez5UlQq0Fgc+rkpUgdi/
         qbYkM3BlZYK8CqpdBAEMGqmMQIiFZlFR1wqMQHbw23nzPkgXNUoUQ+lfiJDlARbN4qkH
         GH4Rkax6FXZ+N6j6PtVTdJiY+KH72qwDGb4InFqLvBIoudY7nuhiZHEKm17eu9H7vfjp
         0Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512504; x=1786117304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3K9wxTq+qtlIZodCkySxOtPkp6Ej9MjKQ2UkyW9Dq8A=;
        b=Y2Uk9BqW+QMAQy2mVu1kdpHpOQ3QUsMtl4b21pUEHkeQBpL3WuxDt3A9SHLhhTXwYY
         BT8txsJupbTzLyMDwt7MwhLEHHV+wal+j89M4XoIYdXwqB4znW9yG9Ge923J+f0PMjDW
         s6XDz7YSbYlK273y+iM0JOwEGn74eUWggCigB2SR+Zad3aJOu84HToKfdfk7RTptdwuE
         shHJf1Q3Zw9NmQEKn979OkyWvqKzMlqZbGcOJG/Kr+7oDkQBewhuqolmY5QMrnqSrVrD
         H2LrkzHl37XkwZo6g8E36ZezlilqJ2jAvxBiDaG0Dx3fSdFsGcqF/sTo0vicgDp3tpqo
         tuQw==
X-Forwarded-Encrypted: i=1; AHgh+RpNtWs3VQ5ya9yj3jRvh4i9vt1DXpfR+/JzdQtBCsYRhMLRA80JIlNUhqF2bLlHSTV2AYxXUoMuA+ck@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4W+xU6GULy/DJ1aX+8X4fdAl77de2N6DcwXeDQV078MPdktD9
	GI1WECM/Fdmwgw2sf9YIw77PZBlE2lTViV7kAFAhPlNeZhweW73cYkC0
X-Gm-Gg: AR+sD11kXah6g5nBanKLuIIZ757pzm7mJ+Lx0SjEEj9bgU+RtDVDO/gH6Wi8BfdmwkX
	hlrMiENXYBgcIj2ZfHg6A3f6bS5K5aY2GhRtueEj0/UCk2AtuSnyboJBSvFjUb84IDWf2kLH9uy
	zrULguS0W41184MKpLr1gDjWBpRgiDb6zGTaiZkB+A6U/gtNKGyVPj0/N60xcDD0kNEMGB/xzel
	KG48N13zAX2B1LxwH7k5ti+x5uC1D4T1kiPlYUNeEDbY+qx61M8+MqT80FQ+h0pg2bOYQN4kAr8
	7Wsf+zz4f4oHt8e6KrV4RB9Xwu5FV2GJrxGKMEu8DiNi65H1oBF0EomTdCJvGhrE3/rhHeeEKe3
	p9HX4wJ35WgY0sandx7VS2UufdeoO6ly22pDde/BZ1QBb8x27iRD1wcs5Z+JckNO9sQFKcssKrc
	tq/jPhjzqlVTntTcD4n26WzdIHdkgBGEAd5iVdVkDM40xntVsiiYNR
X-Received: by 2002:a05:6000:38c:b0:47f:4fbf:7b21 with SMTP id ffacd0b85a97d-47fd729e5d4mr328900f8f.12.1785512504593;
        Fri, 31 Jul 2026 08:41:44 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm6066261f8f.8.2026.07.31.08.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:41:44 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:42:53 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <amzB2aw_4y6ji9zs@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net>
 <amtewh9lOgWz0-Nh@nsa>
 <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net>
 <amtqPQSM6zsiCh4B@nsa>
 <6287e749-04f5-4a03-a91c-fcc705df269c@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6287e749-04f5-4a03-a91c-fcc705df269c@roeck-us.net>

On Thu, Jul 30, 2026 at 08:54:25AM -0700, Guenter Roeck wrote:
> On 7/30/26 08:19, Nuno Sá wrote:
> > On Thu, Jul 30, 2026 at 07:47:37AM -0700, Guenter Roeck wrote:
> > > On 7/30/26 07:27, Nuno Sá wrote:
> > > > On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
> > > > > On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> > > > > > From: Nuno Sá <nuno.sa@analog.com>
> > > > > > 
> > > > > > This is in preparation for adding support to a device which needs to
> > > > > > use it's own read_block implementation.
> > > > > > 
> > > > > 
> > > > > The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
> > > > > I'll need to know if this is a chip limit or a controller limit.
> > > > > If it is a controller limit, a chip specific override would be
> > > > > inappropriate.
> > > > 
> > > > I'll reply from top of my head (did not looked at the driver again).
> > > > IIRC, the biggest reason we need the chip-specific implementation is because of
> > > > the RAIL selection logic (mainly when not in page mode).
> > > > 
> > > 
> > > Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
> > > instead of i2c_smbus_read_block_data(). The rail selection logic would not
> > > require that.
> > 
> > IIRC the reason was because the i2c controller on the raspberry pie does not
> > support i2c_smbus_read_block_data(). So I guess this:
> > 
> > https://elixir.bootlin.com/linux/v7.1.4/source/drivers/i2c/i2c-core-smbus.c#L220
> > 
> 
> Hmm, I think we really need a common solution for that problem. Not all
> controllers support i2c_smbus_read_i2c_block_data(), so you are just moving
> the problem from one controller to another.

Yikes. I actually though i2c_smbus_read_i2c_block_data(9 was more widely
supported (if not always). Not sure if you have something in mind but
one straight way would be to choose different implementations (for
read_block) depending on i2c_check_functionality()

> 
> One key example is the PIIX4 driver. Your new driver does not support the
> majority of PC style systems with AMD CPUs.
> 

I see!

- Nuno Sá

