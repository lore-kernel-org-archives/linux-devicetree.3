Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46838F629
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928137; cv=none; b=BC5hvMy29JbIWV0acpKwn3ktbf9ve6Xq/Dxc9eTG7W/wb8OwS+POBfDL+d01UKvtEZwYNqxxPUsTRywd9xv4k1QfqJ3XUzgc8lV2TyVHTRRyOmLIJh0op7fNQ2EqesaU/Tmcf0o0n4x/T7jUteN9I/8fuqaF4z5QjccA+JXEh9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928137; c=relaxed/simple;
	bh=j3iXbUN7X38CtPh55ZrfNLaGKlxQ42GqqFzmSaMRuVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGr1JO3texeCn/cegdKnORAyWI02YjmzMCRa/6b7DJqbzx63k46XnDv+1k05eq5QgeKZpR/1jHVaiw459yk+zp8KIBIKIVPStNuA4UVo3dKpRQmsnXGxZOuB/2r/lC2tGQihOI1np07jTWFcZZuIUp27oLjSSU3E0x8MIEDyfKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6gKizxr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6gKizxr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e03c2763so561307966b.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928134; x=1784532934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDyxGNSCBkTJpX/wOqxXPgGado3YyxU+X+mfbWev/Sg=;
        b=e6gKizxrkBIVI+Y7xLrFOtC2RPNn9ij2ZzpEecskzrVcXW9qq1JRxwJDt9CHpAbGFm
         WCjj3ljTluBBxyXnPoXBsIKrRswJEAwEluJsfgrL0Kv6nBgpk5Ydnlo3u+YHFeeCrCHs
         mN496P3gjsyA1MJenKgwrE4oY5oPJ9Bzr6UVs88Jm1r9M4xpR+4ACK3kC0FzGfLAV5Cf
         /ztQsXHmNKGPaLj7gLoCFlZI2YdNrkQfn3ZrrUvfeDNqqsCQX7e6nqsCxeR3+/WR8kk3
         juEf4NsOI7PgowKKEm6j4kiR/EmoDO90E45cm57omQ/KMFzSIGH4zvqHcLWg0kvrH3UV
         cJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928134; x=1784532934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JDyxGNSCBkTJpX/wOqxXPgGado3YyxU+X+mfbWev/Sg=;
        b=Co9NC6vQCjh9zQVNKja02FX9kkbXKXH9xALjAeWDq3OuK3ZfbIOABXMonTqGoikAaJ
         x0edhiLxb7Ol0MxLCQRPyrhU+IlBet6rgjnuudgtEei9J4TArQJ+qvAeZrNaihKgW1dk
         mWr5HER3byw5rBtCNBUpkN/0u7U8csccBDtXadPTIQF9tKm+j6+Dta2UxNpta1Qjd/kl
         IgKmWYGAVqPjY68sPOJUnDv6JuWQJWTil39/uwQKe4UKQ+9hw/yT363i3LnhEUKedvMV
         xT80kthwig4iIJTONdtqJJ62DfRQKfTmABDjCJZnSIRgCrpZHY24Vp+pj/BVOD2mKpUr
         7Ygw==
X-Forwarded-Encrypted: i=1; AHgh+RqHv6uZYgscvUwvzBre3ysgK02vcGQKucY47NXoovw6gahbbMfrfEgiUM9Z3Rg4h4DuxsbrZwB+8Lcy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlu++deaTatiKA60N+4LTCXPkU3uLjFOF2L2XfhkM4BrgGEbad
	BnaNr+PFt1XW7PQOtMV97AwoG8/w4/ldjcwoV0mSJiBmiFURbdaM3UY6
X-Gm-Gg: AfdE7clSylT3nufMzf4vZL8tP9P/zVaMky679rtux9bBBWsOuqdYPJxaDK0NV/B/zcS
	VoEiyBu9RwzCJSLpmFr4o14PamtumZH9iSeRa9GPlEZLs1wcEm2syE9j5RbM/kNuLOi4+7JktJW
	8cC7V5SEgBtxdrwa0PO8Y4Hp0Oj8KnFlqZpsS0ShkKQo5hSIGM1vZt10PikAAtQdPI6IpY3/Ry4
	fkYKRQ9jjmOcEAL1/b+KDY4k1IGSUn6xilUCMNWxex94GVuRtbg3/BgfXveshlkcxQuXoQgCENJ
	BIIxtteU3+7AfZSCJvQ5pXvs+cHwXgG4IHzYsDJnlOYtFUjZs67wnvOiXfJCoQv6T/Svy7I4s+3
	5ex5MJ2FTBOuWTShfa2POM8lWGneLAu5fX6CetPksdr7hhCdp6hNnXfIisjvvkUzXGeSRn4oTyd
	WIW9rUg7MnvSzTPOMjzDtvgzD/P3E=
X-Received: by 2002:a17:907:9610:b0:c12:4133:39ba with SMTP id a640c23a62f3a-c161ea2ad17mr405476966b.26.1783928133448;
        Mon, 13 Jul 2026 00:35:33 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad844889sm973820766b.15.2026.07.13.00.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:35:33 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:35:29 +0200
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
Message-ID: <v3ixq2zcw6xpleoc67zslmhcfgj2irljzjjakzbetcn5nvpj7g@5fnwkvfdkj6i>
References: <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
 <ak9gFKkfEgkU_q1G@nsa>
 <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>
 <ak_G4_eAUYflt9M3@nsa>
 <94010bec-7921-4fac-ba48-755e51c59bcb@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94010bec-7921-4fac-ba48-755e51c59bcb@roeck-us.net>

On Thu, Jul 09, 2026 at 04:39:36PM -0700, Guenter Roeck wrote:
> On 7/9/26 09:09, Nuno Sá wrote:
> > On Thu, Jul 09, 2026 at 08:54:09AM -0700, Guenter Roeck wrote:
> > > On Thu, Jul 09, 2026 at 09:54:22AM +0100, Nuno Sá wrote:
> > > > > 
> > > > > Based on the MAX20912/16 specs on my hand, these chips do not support
> > > > > PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> > > > > and does not provide m/b/r. Therefore, some of the features you mentioned might
> > > > > be specific to the MAX20826 series.
> > > > 
> > > > I see, phases are not supported using standard PMBUS.
> > > > 
> > > 
> > > As mentioned in my other e-mail, it can still be supported by the driver.
> > > That is what the chip drivers are for, after all.
> > > 
> > > > > 
> > > > > Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> > > > > part of the hardware power sequencing. Managing this pin through the driver is
> > > > > not a requirement for our system.
> > > > 
> > > > But we cannot assume all systems will behave like the above. But now i
> > > > do wonder about controlling the GPIOs in the driver. In your system you
> > > > clearly did not need to do it. In mine (testing with a rpi) I had to
> > > > use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
> > > > you do gain the ability to turn off the regulator. If you don't it's always on
> > > > (which might be indeed the bulk of the real usecases for these systems).
> > > > 
> > > Agreed. I don't really like it, but if the chip and some specific hardware
> > > mandate it, it should be supported. However, that code also needs to be
> > > tested - an untested implementation would be worse than no implementation.
> > 
> > That's how I tested it :). So from what I understand the preferred way
> > is to support these pins as optional? If they are not there we just
> > assume the pins are always enabled by some other means? In contrast to
> > what I have today which makes these pins mandatory!
> > 
> 
> I had to go back a bit in mental history .... actually, the regulator code
> in the PMBus core doesn't touch the ON_OFF_CONFIG register. It uses the
> OPERATION command to enable/disable outputs. The reason is that the enable
> pin and ON_OFF_CONFIG typically affect the entire chip, while the OPERATION
> command only affects a single channel.
> 

Yes. The only thing I do is to read the ON_OFF_CONFIG register at probe
to check if I need to check the enable bit in OPERATION. So that
vout state becomes gpio && OPERATION. 

> So far PMBus drivers typically don't touch ON_OFF_CONFIG. The ibm-cffps
> driver supports writing it, but only through a debugfs file. The tda38640
> driver supports writing it, but only because it does not (or not correctly)
> support the OPERATION command. ON_OFF_CONFIG (if it is modified at all)
> is normally set by the firmware or even in production (if the chip supports
> non-volatile configuration). It is one of the "hairy" PMBus commands
> which should be left alone if at all possible.
> 
> You can not make the property mandatory since most systems will neither
> support nor need it since it is handled by hardware/firmware.
> In many if not almost all cases there won't even _be_ a GPIO pin that
> can be set by software.

Understood.

- Nuno Sá
> 
> Guenter
> 
