Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93583B6C02;
	Wed, 25 Mar 2026 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434678; cv=none; b=qtTKVRswiyA1YbYZLaTu/SJce3OPFLeNRP0mwfESx/eAm0LevR5Nk6zg4zCncOfkKGEgKJ7/aSg5YWeLYLGUUjWSfi4MSbC480F7eJQWedkMV4kvdSm7bfjDR5zKTr10cR8v4O4ssbJ586gLdGJem+FM0RziXzJYqDJUbcFkM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434678; c=relaxed/simple;
	bh=Ytgb+4Z3q1HjWEbfbi8B+K2f4PrwdXddDyYI43PpL0Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QM1RRyzNtHFvn2ZG9chIhkPecWiy6rhRyN95U7ALg/gybOUzYBmWj8p2utPZ0jsOwaoOvm6bNO9cQUAXT38zr39JGFWs6ByVUGxCoEXXbL8RkA6atBSqq6Kaaca7Mz75JijMDVEZiSXkfossn+xAawg/Ci7rRaFbC7bB58MLd80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=U55CSvfC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=McxXC8B1; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="U55CSvfC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="McxXC8B1"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8E576EC007A;
	Wed, 25 Mar 2026 06:31:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 25 Mar 2026 06:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774434675;
	 x=1774521075; bh=nOZsBL95nAhweeH92Dp+s8gwCED82gOoXWW4sho0wpc=; b=
	U55CSvfC6XY4xAzmu3d81QOxz+teYemQsdjYqgshmirhrKBPvbfJyiHI6KY/gfak
	HRdwOjYxac9Od/IQgZbvh0aaRuZzfxPAe5OxwHaINgqGug+9L+RjTvIMP9MBWn0L
	wWEvCS0oPtA5FSo++BIb3cSTCj1sFI3Kh7K71LHr7ozp/Xw6be6l5mCgVGHf68LA
	bU7bHBRuSmMeXmpkvH5Qv44aoJTZdNl5C9MHsAgtB7KzKClRr2n/15GnlTdcMA3n
	bZDoR33vkAtk65Qf0E9xq6VYkgY7DVcdR6Sfg3rfNO42RwFRgfRWEDkrM/zWP4Oz
	f9kMiuakxhbkFwkEkffIrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774434675; x=
	1774521075; bh=nOZsBL95nAhweeH92Dp+s8gwCED82gOoXWW4sho0wpc=; b=M
	cxXC8B1pZ4XhHJEJRe6XbyGjh5qfn6+y1LoL5Zmhwm2Y2jWtK8ayNKsvSFBCD2Re
	NhkOHVLHBHxrpm5WCn11HFvu99IhHgQ4uPn5hjGJSyacBJJfB1hdX0Wtnr5jdLHp
	On+wES7TE+DDq9bxMFXwVGk1ovH4zPNk+VyIuvMshKQCAadEzKka6Pwam0EmOcgW
	nTum7nJRXz/s/2LS9cy8GefACy4FNdAzxhVjf1J5RS+2Kt5Ymp8HOpWZDJeLYb+O
	lByrJ2s2FoIEkhHdUNqhaA8MNG9HHtbphZwrzO3RMafyrGItU3I4E7PjZ9oMZ/+2
	Qvxzg12o+uEqz9yQgeSgg==
X-ME-Sender: <xms:cbnDabo1UFdJwpbrxA42Igr1OKxwCPdt4VhsZBItEEyf9yxfS18raQ>
    <xme:cbnDaQfQcuzSkpGf8E-FKYeOWogdqddxOVyoXVs2eFjgWS_IVR7fE6vW3qWs5dJ8_
    rzfJCQKyY_G6pye56t7F_i82T1HZ4IScR4zEBArsqaLjhVelaidYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhihrghnpggthh
    gvnhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohephihhpggthhhunhhgsegr
    shhpvggvughtvggthhdrtghomhdprhgtphhtthhopegrnhgurhgvfiestghouggvtghonh
    hsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepmhgrtghivghjrdhlrgifnhhitgii
    rghksehinhhtvghlrdgtohhmpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupd
    hrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cbnDaX2k39X3tB1eVoZdsH3a2rR-Kfzg45viTlUTMzx7dJPQRugnYQ>
    <xmx:cbnDaSAWglBxqkW5Xfz_eloOAf5tS0s_icOs_dbVJxcvcEulqbkhaQ>
    <xmx:cbnDaeDHpQ8mB2dETY6HX5RcLgaDNdeI7a7RDo5qbXI8rWyT7TBQiQ>
    <xmx:cbnDaTMzT0ABjv5WXH6o-HY8dXRNkmkey-a9FMsPaGZJ94atmHtC6w>
    <xmx:c7nDacnB8ldaU7195uwNYbGFDkaHpRwFU3uW6h3AmpoWapnIxKblE41i>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BFFF9700065; Wed, 25 Mar 2026 06:31:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A224H4bSXjB-
Date: Wed, 25 Mar 2026 11:30:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: aspeedyh <yh_chung@aspeedtech.com>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Conor Dooley" <conor@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "maciej.lawniczak@intel.com" <maciej.lawniczak@intel.com>,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
In-Reply-To: 
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026, at 09:41, YH Chung wrote:
>> On Tue, Mar 17, 2026, at 09:14, YH Chung wrote:
>> From reading the old comments that Andrew linked to at
>>=20
>> https://lore.kernel.org/linux-aspeed/HK0PR06MB377924CFCBFE9BD40E1C4A5=
D91
>> D49@HK0PR06MB3779.apcprd06.prod.outlook.com/
>>=20
>> I understand that the SoC has a "hardware mode" in which eSPI is
>> directly implemented by redirecting upper-level eSPI transactions into
>> functional blocks of the chip, while the software mode behaves like
>> a regular SPI endpoint controller and your driver implements the
>> same interfaces in a mix of kernel and userspace components. Can you
>> confirm that this is a correct understanding of what the hardware
>> does, or where I misunderstand parts?
>
> Broadly yes, except that the AST2600 does not operate in a single glob=
al
> "hardware mode" or "software mode". Instead, some backends in the eSPI=
 target
> controller support per-function HW/SW mode selection.
>
> Depending on that function-specific setting, the controller either for=
wards a
> received transaction directly to the corresponding hardware block or t=
raps it
> for software handling instead.
>
> This mechanism exists because some backend blocks include their own ha=
rdware
> filtering, but not all request types could be validated generically in
> hardware. For example, the LPC bridge can reject illegal requests. In =
some
> cases, blindly forwarding host requests to the target block would also=
 have
> security implications.
>
> The channel/backend mapping on AST2600 can be summarized as:
>
> eSPI
> =E2=94=9C=E2=94=80=E2=94=80 Peripheral
> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 Memory (HW mode only)
> =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 LPC bridge (HW mode only)
> =E2=94=9C=E2=94=80=E2=94=80 Virtual Wire
> =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 GPIO (HW/SW mode selection)
> =E2=94=9C=E2=94=80=E2=94=80 Out-of-Band (SW mode only)
> =E2=94=94=E2=94=80=E2=94=80 Flash
>    =E2=94=94=E2=94=80=E2=94=80 Storage controller (HW/SW mode selectio=
n)
>
> From the link thread, what Jeremy mentioned is the GPIO HW/SW mode for=
 CH1,
> which determines whether the host can directly control the correspondi=
ng BMC
> GPIO output, or whether BMC software can inspect and decide whether to=
 act on
> that request.
>
> Another example is the Target Attached Flash Sharing (TAFS) defined by=
 the
> eSPI specification that allows BMC to share its storage with the host.
>
> In hardware mode, the eSPI Target Device controller routes the request
> directly to a predefined storage controller on AST2600.
> In software mode, it raises an interrupt and lets software handle the
> transaction instead.
>
> So I would not describe the AST2600 eSPI block as being globally in ei=
ther
> "hardware mode" or "software mode".
> That choice is made per backend function, and some backend functions d=
o not
> implement such a switch at all.

I see, thanks for the detailed explanation! Two follow-up questions:

- For the HW-mode-only peripherals (memory, LPC), is there any
  driver interaction at all for setting it up, or is this completely
  transparent to Linux running on the BMC?

- For the other devices running in SW mode, is the interface that the
  driver sees abstract in the sense that the same low-level code
  is shared for all of them, or are these still separate functional
  blocks that each need their own register-level interface?

>> For the higher-level interfaces (flash, gpio, ...), I don't think
>> there is any consensus yet about how this should be done, but again
>> I think this won't be drivers/soc but instead something more
>> generic.
>
> For the flash-related interface, would it make sense to follow the
> configuration model used by the USB gadget mass-storage function, and =
expose
> the backing storage selection through configfs?=20
>
> For the attributes, perhaps the only backing storage object and read-o=
nly
> flag would be required in our case.
>
> For the Virtual Wire GPIO, we think GPIO subsystem may be leveraged he=
re,
> though some corner cases may not map cleanly to a typical GPIO control=
ler
> model.
>
> For the Out-of-band channel, since the eSPI spec models it for tunnele=
d SMBus
> packets, we may want to integrate it with the kernel's MCTP stack if t=
hat is
> a suitable fit.

These all seem to be viable options, but I still think we should
focus on agreeing on a design for the low-level hardware interface
and whether this can or should be abstracted between SoC vendor
specific drivers before trying to solve the user interface side.

      Arnd
