Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E701C3F0C
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787015204; cv=none; b=UY6WH/h/LCynPOhXaXdJpKyBzGk3Vr6XAzj91YWDS/uVwxJjHcuL5XUa0qn90uzfAczuCVxRwF7EaZbClFtM6poB0P0t14RJCRaZd5kayYxOOT3ecdIkUQop98hkIFDsMlF6b2tVceUOcqAGKHkWvMZqioiwClZu3VC6wq8bzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787015204; c=relaxed/simple;
	bh=eSPFm40DT82J9f9OZEaNKoqzMUgt02iaejJx5gfUYWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hceS5GN2uy3e1PGiOdTojP9RIAZU5lDn8JzRrdqznqcpHQoOIXQZKnKhZiEDSpWAxbT7gwwC1f131YDdjNBKweOfIql3d0E+TlLod4OTUz9OFiuvclkviBsr751NKfueeTGaRynNkutSd9EonviTs1+DrQoLnP0PT8gUD2yVNl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArWaCT2g; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArWaCT2g"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1485716e0c.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 18:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787015202; x=1787620002; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S0NWw8TWJUBoUoRaTT3xU902CIURU9VCpckKgBzcPno=;
        b=ArWaCT2gCpZ1uOzJNI9yxUy2XsfLMBF1WQYCRT25DnT4Kdv+1PF3+pi8oB4v+cqNW0
         9M1s6boW/XotDHrS/cdjACswsZRr3/JMp8nHgeeZT6rZPdsxo+qmUHfX7l13OFaOlZxY
         MYBzxawj/nP07BI8uw6+J8H708ODe89/WGII9TuIq8O0dOzbqVvPuZi74wZGn2kZw0Dv
         NTKRKy6ebcGZ24jfmtXqWKkyOflnLyjbFCB/IKGQ5wZIOdNRfNnQRPMvtn92NUrLO9NX
         uTyMsT7fyadpVl7QVE5PO+Ha8wfcznEekC/KBtHRKe1EF3qjvGIr8qITqSVc5fee4LaS
         MA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787015202; x=1787620002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S0NWw8TWJUBoUoRaTT3xU902CIURU9VCpckKgBzcPno=;
        b=rA4fFEp52o2wZlOXSDvz6K9KqYYzq1yIzmEAqXQMZj0kAoCzTMAdwPJdLjEkzbbVyc
         GFGlhIuu33yvn4iebkBNAeg7Ad56QV3te1h/K+g7NjD8xY4Blx02If72FWaRboT5Jhpo
         n20Dy5BNJVpIkk7ofdjmqwE/UtJj81eWi+gLT9edhb4xiHRcX69hJryizyrN03SXqgqh
         Y1WjC+EHs/WBYvshq0yW4B7SQ2+kfwPRnK+TYzU3QqWdnWmm1FnBLuB7BpLJPUx5Belh
         8fai7PXPtPRRQsyOYzrZDml45Uz3Plpe42h8PCJh/mGiNwiVbmnkK+6IDcMoemvAIb9T
         YchA==
X-Forwarded-Encrypted: i=1; AHgh+RoxcubxqX/soqBtlBT9ND7lLg1tfsAv7567JNc2Odq8kp0YIWgfiabKDG+f9PJK9xeXOErrdrnMAb2A@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgHI3e7DLVqcPGv3MSYBzEur4dyoXlX6WjdcNjhZwF9PKfWDQ
	K8dVgcwnNuhil1o0wMmOQLEh+NunBLblRMEEGiVKRUnaAy4DyUUPAhUC
X-Gm-Gg: AR+sD13i9mYYicg/YBvzp1bJqmsLuq+UIOvKqI8ygjVmt3UJ+MJVADoWAV6TrXH9Alv
	IrPxZFWMvoo0wpiEWVGaJpmIvx9v8a3QnfYHqnXANZXZw2kWZn3HhhuaT7nSV/vVBqy4wIO3DUn
	iOdb+vv+D+Dljn/ltmzulrX1d7RJNAK7+9hYDh9DDwiwPvIpO9+StzFKAik437u1VpfjcgFqnb8
	ljX8w4vmwTRXBRY9hOt+uEolY3I+WE3X2xQhWV5hcQbxpYd6d99WdDxfcolQk074pRG+Gny9V/3
	aliHUfliA3Athi1nXdyIPFW0cfbE09caJrZGRsERlGKMZL6waLwSmU9KAEXEVJ8wD1k44hFZaGJ
	mqEDTMtrPKGaX+cYZ3n0BT5wH7urHNC4McWcBfYUd7lXJg/0TFg5lIRWsn/l2KxeFMdkLZTc96e
	81OT6Juejjdt2EwQ9eUECW/OIZcON05ymvNP3E0AzQJ68OCu1pqgDflngGO/UfqaJC9KNG
X-Received: by 2002:a05:6122:50d:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c5ce7ed595mr1017290e0c.7.1787015201662;
        Mon, 17 Aug 2026 18:06:41 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c7684cb7sm2331580e0c.8.2026.08.17.18.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:06:40 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:07:19 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: =?iso-8859-1?Q?Nicol=E1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 2/2] iio: humidity: am2315: add support for am2320
Message-ID: <aoOwR6JMOYPCn4PW@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1786725567.git.nico.antinori.7@gmail.com>
 <83c8a41607ed07285a84dba8ed10a954226076b4.1786725567.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83c8a41607ed07285a84dba8ed10a954226076b4.1786725567.git.nico.antinori.7@gmail.com>

On 08/14, Nicolás Antinori wrote:
> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
> communication protocol and measurement conversions.
> 
> Add the "am2320" entry to the i2c_device_id table and create
> of_device_id table.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---
Some optional suggestions for the commit message:

The AM2320 design is fully compatible with AM2315 in terms of I2C
communication protocol and measurement conversions.

Add the "am2320" entry to the i2c_device_id table and register a
of_device_id table to match against devices declared in device tree.


I see nothing else to improve besides what Andy already mentioned.
With those sorted out,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
