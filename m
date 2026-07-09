Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2F3F0746
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587201; cv=none; b=QmouoIYchfhN3h+Bmwjxe8EZdejwKNF8c1G3YsRCexRagbkLQuc2eoTAIguW2ykAdddo6vzbvDYq2retRvCxCgznsJKdDIvKQwMhUAA/BaoFeOyg/mieqSOSuEVi9ObKfTgmFztWvpja3GkC9NByua/VkO9rzdZqniAOg6pKqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587201; c=relaxed/simple;
	bh=gJH9guXcAfNJ6SsL+eO4i7xE/NDXFjDkDL6cAwmmE40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRcvKARXimkOrljjfwrj/r33PrtZC361it94jyknXeTJA0g1Om12bAOGTfDW2dQ1J+3lEtnW3CXLYnmKS5adQY5FIUzBZqRVFFEehu9B5iOekwaZfHmzRCPR6X54x4uPD0i7TZSBV4T4WiOR53VYyust/AekiPQT8E43d+EOJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jksxRTYV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jksxRTYV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4758bd3731bso425809f8f.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783587197; x=1784191997; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3WCN+xm9Ku357SP4qkc2nLAhmJTaNSJBwAXmI/hZS4=;
        b=jksxRTYVH0bOAxQiQT5u/DZMQ87Z5qlltniQc8dywmvycj0i62hJ82UpiEgeDT5lGF
         fjJdfEoRk6maqbwwKW+gitrKyTMdZcsMT4k1KouHq3RMglWYp7QmJti6wyqQTjboYLTN
         uz6Ol20xtiYyiA49JlWk220H5bL/spsLxhpkHG7+sSD6X0xTV+HdemhFyq3QRaKgwBWB
         Dr9b5PVzl+ZQCPzw1OR8pl1xfm25sqEUZVCzDHik84Q38dMYZe6naoR/k0v1erEHHW+z
         A6ZcQ819qVKNcva8PgADxK5dwwlwDMRXeVW3fhmZs9Nd2x/l/W7wGkTEwdBillnXvNGI
         7uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587197; x=1784191997;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W3WCN+xm9Ku357SP4qkc2nLAhmJTaNSJBwAXmI/hZS4=;
        b=ZdWuzaEkrTXQvvQNMOITkQP/752ufnNgaJRnbrpdOQiFdOgXye8cDfpYNCXdo8pRhc
         S6OFXTU1rE95PZcgxLqUF50LnS+IgRzsam+knrTc6NiYINiLZtGx5H2JORc3b6+8imPx
         dOyKzd4HJYlkZLfzyN89wXi5hRm6e707PyN9+d0Qc39Y6XZnjonRf3O4DTBwE0qMdtOx
         UAsuSsP1WxIswSFVCnG6sqwmyaMrhfQ+sjceTUthprIMlIA2fqssdriuB0wYTUtXm1B7
         vm+BOX+qg4eBpHMjr9KsNz081exdB0k8HwMqrwsBnKUFL9hfWybPUZmgIZ6+OjIdFk6m
         WWUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjbSrY302/Ga1iidhB38saGs2dWpj+X9GNPq71ttORJx1Uf93mwuTh/fz9QA0j+RqYJAmMNNbvKyS2@vger.kernel.org
X-Gm-Message-State: AOJu0YxqfBm2qXKJb7bFqgYKFGxDQS1Pt4FVi6w0lq4D8HUfZYKc0T4V
	vfu2ShFrgeqV2QRL4wkxzXzihE8HlkGENXDpbDs4WmK9MwOKVs+eRNPT
X-Gm-Gg: AfdE7cneH/wQ3Gmb6l0GypjoD/KUJUFkv8yQUgTkAVvKGkDrqzv3jS3P/1IHZqCuUKN
	RoJqbgn/4JBGAazWxTHTU5MHGB4og78K5nd/b8oU6e7kua+YQSoH0nabktJVeF7poUVCt1ZZmSw
	eP3ey5NhjHiMH6vwSWlCQHoViafhyFnvdutqRsilEqDHaQkklX2QzJ4l87uMPRqTs+CRYM63CJD
	R6AQFiroe+tBKJjpFp5a5OcUqM/w2MOBGvNbhOV1Dm5ig6PNZGr0TsRjM2qrlUvXCBPEDRZfwGW
	nwlEND54woHc/raHgCjlRdMuLf48wvHY1Zbh6t9LLE3GUGbZoWkXQuYwPw8iM6z8AIe646NXSxA
	R0kDLTtz0Gu+gJI6q4QWhGfLOsm1bA72fXZzzoOj/U40E4O//00tI9SPWmtcKaNiE8RSVPZ3P9L
	rvi11N
X-Received: by 2002:a05:6000:2509:b0:475:da0e:744d with SMTP id ffacd0b85a97d-47df754dbc2mr2043290f8f.8.1783587197256;
        Thu, 09 Jul 2026 01:53:17 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm47621073f8f.23.2026.07.09.01.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:53:16 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:54:22 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
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
Message-ID: <ak9gFKkfEgkU_q1G@nsa>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>

On Thu, Jul 09, 2026 at 03:23:55PM +0800, Fred Chen wrote:
> Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com> 於 2026年7月9日週四 上午8:59寫道：
> >
> > > On 7/8/26 04:32, Nuno Sá wrote:
> > > > On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
> > > >> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno Sá wrote:
> > > >>> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > > >>>> On 7/7/26 05:26, Fred Chen wrote:
> > > >>>>> Add support for the Analog Devices MAX20912 and MAX20916
> > > >>>>> dual-output multiphase voltage regulators with PMBus interfaces.
> > > >>>>>
> > > >>>>> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> > > >>>>
> > > >>>> Please provide evidence that those chips actually exist.
> > > >>>> Internet search comes up blank. I'll need confirmation from someone
> > > >>>> at Analog.
> > > >>>
> > > >>> Hi Guenter,
> > > >>>
> > > >>> Well, in fact I'm in the middle of preparing a series that adds
> > > >>> support
> > > >>> for:
> > > >>>
> > > >>> "max20826"
> > > >>> "max20855b"
> > > >>> "max20908"
> > > >>> "max20912"
> > > >>> "max20916"
> > > >>>
> > > >>> All the above parts have the datasheet under NDA. But before we had
> > > >>> a one page "datasheet" in analog.com but I guess that is gone! For
> > > >>> context I mainly did the base (core) driver for max20826 and then
> > > >>> Alexis added the other ones.
> > > >>>
> > > >>> Not sure how to proceed... I can wait and then work on top of what
> > > >>> Fred has but this patch is very minimal when compared with what we have.
> > > >>> Like:
> > > >>>
> > > >>> * No regulator support;
> > > >>> * No direct mode. The chip has two ways to access registers (paging
> > > >>> and
> > > >>> * direct mode).
> > > >>> * No way to count how many phases we have or if RAIL_B (func[1]) is
> > > >>> being used at all.
> > > >>>
> > > >>>
> > > >>> Some other things more intriguing is that these chips, as far as I'm
> > > >>> aware (at least for max20826), always have bit 2 set in
> > > >>> ON_OFF_CONFIG so a gpio vout. Also we needed some special handling
> > > >>> to read phase current which I'm not seeing in the driver. So I would
> > > >>> like to understand how the chip was tested?
> > > >>>
> > > >>> Anyways, if Fred is ok with it I can just finish what I'm doing and
> > > >>> send the patches. It would make sense to have something more
> > > >>> complete on submission but I don't want to just "steal" the work already
> > > done.
> > > >>
> > > >> Binding should be in such case posted complete, so probably not a
> > > >> trivial device.
> > > >
> > > > Yes, in my series bindings are not in trivial as we support the enable
> > > > gpios.
> > > >
> > >
> > > Same question I asked before: What is your use case ?
> > >
> >
> > Hi Guenter,
> >
> > Unlike my MAX20830 patches, for some reason these chips (not only Nuno's max20826)
> > hardwired the bit 2 in ON_OFF_CONFIG to '1'. This makes the use of gpio to enable the
> > device a requirement.  (as of the latest info given to us)
> >
> > Regards,
> > Alexis
> 
> Hi Nuno,
> 
> Based on the MAX20912/16 specs on my hand, these chips do not support
> PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> and does not provide m/b/r. Therefore, some of the features you mentioned might
> be specific to the MAX20826 series.

I see, phases are not supported using standard PMBUS.

> 
> Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> part of the hardware power sequencing. Managing this pin through the driver is
> not a requirement for our system.

But we cannot assume all systems will behave like the above. But now i
do wonder about controlling the GPIOs in the driver. In your system you
clearly did not need to do it. In mine (testing with a rpi) I had to
use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
you do gain the ability to turn off the regulator. If you don't it's always on
(which might be indeed the bulk of the real usecases for these systems).

> 
> As for the testing, I have verified that the telemetry readings for both Rail A
> and Rail B behave as expected. The driver reports valid data after system
> power-on, and the readings drop to 0 properly after power-off.
> 
> It's possible my specs are outdated or that I'm missing some use cases. If
> you plan to submit your more complete driver covering the MAX20912/16
> soon, I'm more than willing to hold off on sending v2 patch.
>

Sure, soon enough :)

- Nuno Sá
