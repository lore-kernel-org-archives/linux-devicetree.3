Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D21395273
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613506; cv=none; b=dDEvx72dEFgjqnqsPitCVVXW08ZlQw0olw0jeRCWfdaChNf8+csUQQ4ooxLA5wk6jhBfcEsnrzdVAlfegYFLvInaG5VlZQv9aXvmtQdCqB7+79YJFH2gynxn1Mi/KaAu+asDIwSwSZ6LdHn0WyoVgjDN+7xL+oweo9RY7hqDmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613506; c=relaxed/simple;
	bh=yDLs2jV76L2eqJnYhRYER0JSZHFGBrzJGq5THI0r5hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cc95nwmYuaEE/f/IYmJexTCW3U5u93Ab5W1CdK8jiUXAOV7QQ0Nwu/tfQSSJQr5kTNq2dqMLXP7/dzT9gB+QwbxMUXlh3CeUvkKHPjfJE0PYEA4dsbHDNPXEWIhBx4ALBOypmxB2LM/dD1OIhUUTaH5UyWiRY2uwHaFz+c+fv3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6rKV/IO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6rKV/IO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c7902f47so16706235e9.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783613503; x=1784218303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=imNUUfLX6MYDa9RIX1yPiyl4F2oBksK4tqShI5uU2BA=;
        b=C6rKV/IOJyMuvCuC9BOcPB5iSSq/UDe8XDUd/h3tUA79wtwdGKUdXylUg+ysmhbvtI
         F/orUWy3ZQYbMTXQGsnpM1qPGk/f0Cppatkn6ciwQvMTs19GLUOZc6Y3t4WWRxxcxadB
         ECLcmcAuF3aCdUW/iftJqtBP64aSM1gZ1mzAd9Df2LpQhDN0lOttlO3oRuUxYC8z1evD
         T7aO6YjycyEstxuxg+POuiVW/HKEV2LnYoRaA28nVAIGPrqX/EFoVOiCPN9epDKyLrU2
         ozKiauHfdjZnpHhWW41oMg8yJSFypeSUAo1weQjQSw4cOM5/RjZsCVrRWdEJTWmFSe32
         HI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613503; x=1784218303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=imNUUfLX6MYDa9RIX1yPiyl4F2oBksK4tqShI5uU2BA=;
        b=VVA24SQMUwxPqolUmyNeE9VYaAkEfcrYiZLAa85W4+73bWRlItDivl6S5VsBdBRSCr
         H5YflsmsriotsSGkHX4VaKcK0jcJ1zvrB8J6FTrwZmGKS0kbeBWypiXlqkxZPyy8R1Z1
         t2xF5c9Uqa9kX2zB8akc8o8jnnlSpb85ijBUj4SYw5HNUQlmk3MGrC5JnSqwesM4Vyw0
         9gKm8Rd7k8//JosvPGbH+xlf9DLTo+/yJXFRJQOjZYkSDzFKiasbvB4HB4VDxWpGmJhA
         AyKkkQ/PBa0hyVLKp/Nnbe2yIW2fBeUT+XUUxsz+2g0Mnnv9Oqly3Q/IWaCKd6TLT0IT
         x1+A==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Nwz6+GxM5juDU5mZ+pqTUlybyK63lJK18ccoeGZxWmaH3oQKohQhr0IYv58J5zvRvwagfPAFd9Bs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90qrXH2QAABtu8A6/aT+++fT5vfkhMblA9+QHxtXf67UmVahz
	6EF8lTgnxapQtp0tVS9GUGNXC6SJL/H0NiJ7Peigt0et46j/BNz/OsNX
X-Gm-Gg: AfdE7cm5tg/3HQp988lOlvE3g7fy1MFWrPJYKY6Z1ecemi1U9HDaAomj5GOcugcep8D
	dfmluYAUmWCksjayqH3K9RZpBIODm3TT1hBNhCKBJLRC9xTtXwM8+FQe8yeNylGySTI8RcuMlJ1
	jPi4fbZdnHJkSPMoiTN/uYnVdpLMlQzbQk1dSqt0g9dbJZjo6EXjcR/xltEkbjTh47XlVpPvTQJ
	LRJzRnItSRwUTIt70HdBEdKFaQ5rF73wa6x3cGpnPKV6p6CTVaRjyQgoNwscHbEgROs8jiaDbJm
	6bd51lVbkjA6B/mrRpzBdRoJoELRlnM9Ml5GRqvlaLAfWTKkgniY7PyECAOiK8gfflyhUgnS1eJ
	rIPI5KRA2vRM0H2u11Sv4yZ2DelJDBdlakPvx+7IuizlHKJb9H3sfLhFo8fCCtE/z/RBNnXWZYt
	gdSF9haElpUT1WYYk=
X-Received: by 2002:a05:600d:8496:20b0:493:f251:3e84 with SMTP id 5b1f17b1804b1-493f2513eccmr3414535e9.15.1783613502546;
        Thu, 09 Jul 2026 09:11:42 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm69398775e9.4.2026.07.09.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:11:42 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:12:47 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, 
	"Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Syed Arif <arif.syed@hpe.com>, 
	ChiShih Tsai <tomtsai764@gmail.com>, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>, Colin Huang <u8813345@gmail.com>, 
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak_HvKbH1QKrweqF@nsa>
References: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
 <ak9gFKkfEgkU_q1G@nsa>
 <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>

On Thu, Jul 09, 2026 at 08:54:09AM -0700, Guenter Roeck wrote:
> On Thu, Jul 09, 2026 at 09:54:22AM +0100, Nuno Sá wrote:
> > > 
> > > Based on the MAX20912/16 specs on my hand, these chips do not support
> > > PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> > > and does not provide m/b/r. Therefore, some of the features you mentioned might
> > > be specific to the MAX20826 series.
> > 
> > I see, phases are not supported using standard PMBUS.
> > 
> 
> As mentioned in my other e-mail, it can still be supported by the driver.
> That is what the chip drivers are for, after all.

Ah and if it was not clear... The driver I have in hands do support
reading phases. In fact we need a patch in the pmbus header to increase
the max number of phases as, at least, max20826 supports up to 16 phases just in
one rail (or 8 + 8)

- Nuno Sá
> 
> > > 
> > > Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> > > part of the hardware power sequencing. Managing this pin through the driver is
> > > not a requirement for our system.
> > 
> > But we cannot assume all systems will behave like the above. But now i
> > do wonder about controlling the GPIOs in the driver. In your system you
> > clearly did not need to do it. In mine (testing with a rpi) I had to
> > use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
> > you do gain the ability to turn off the regulator. If you don't it's always on
> > (which might be indeed the bulk of the real usecases for these systems).
> > 
> Agreed. I don't really like it, but if the chip and some specific hardware
> mandate it, it should be supported. However, that code also needs to be
> tested - an untested implementation would be worse than no implementation.
> 
> Note to anyone from Analog listening: It is really unfortunate that I,
> as subsystem maintainer, do not have access to datasheets. That means I have
> to rely on assumptions and can not really provide actionable feedback other
> than guesswork based on the PMBus standard. That feedback may and likely
> will miss essential details.
> 
> Thanks,
> Guenter
