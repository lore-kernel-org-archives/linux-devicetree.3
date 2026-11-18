Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991237;
	b=4vx/MA22wafJ6+UiGRhB2jWkf9JOWvbb3Ela2xXwwoo7k8G0lPR5tkWZf1wq8ioG1Ld/
	 78SVuDaq5dtPGcoFRDwUbrUeZE7FeAz591x7MNftlZXkXVRTSz7TVD88P7k2cC/pHgE01
	 e6aMhZ6/NJzOELp5iBfkzrgDEPuW9CZeLbCee5s73OJ25rrwp4Jfu8lvcZUYO7ZJh4swd
	 KmEHJ5CbOiEjdGfyYxTMFLZkWcSRaFeDttFskYPAC+gBvHjNFvKkVuqYNX3r7KUiqOis0
	 F4L27Asz/TPs5w+LKSquoEZ/AZevojy3Fl3u7wsfjG8ShfU7C/Gf7KGEMOzSC9ZFlhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
	b=w60TuPVsz5DmDh3UlKLL+zmjoBE1kF4l7+EZLqnbFlfyR+XewlXHCbI5utxMNvLkofPC
	 oElQZycRRBRWSlzprKp5UZWp7X8dNs2yhtJ66bKNbL9IuNz+Zucs1L6f5kn/aPuI42bOo
	 rTPmvPxOUaRUcvayjPvM+WR99lerivdzAhObbxRhCplX483/cfXlyHOjWBjdPxzQRXwps
	 WqBc6Pd64sx+a2a3bjCkZKPlHpZosA01VMscCAHmzvZXCeb6Uyan9njq51yBp8wn3Yrhz
	 tQHKdtJfOrK2vq5CJvZBH7/TWRh3qeDnkajUvtS2OUm5JOqGJtbgLbzQjCk0HC4wqyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6LULoa0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F83D606A888
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F83D606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6LULoa0
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so563082eec.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991236; cv=none;
        d=google.com; s=arc-20260327;
        b=AMUcnUv3gZn+qS6X4qUvx34kh6NWxAIC23a4wTmfrnj2Q2ecvjaLj20QfEjvBUqOEv
         5gH1I7rZMsN9q1yLGm2ENgo5nuz3rXHHUxxcIhDBEH6ATFsqZlLmlmnCErXI6+bel/bn
         mbrzNAipx6z4ftB8F0Vds6+nRIrIo2kshcJJPL3ciSAp12On1GLW9gCM4EOXYpkuOm2e
         KA72QCbHZb7x7rjmrhYn48qj3vjAFhRPa3t0wjLviLcAXB07s+tZkzN85fg0o23MnW4t
         YHCWlM+X1YWVw7SqiSoJI2t816KyPan9RkU959EaHKCqbvv4717LD33AsH9ucpq8oIgO
         WAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
        fh=ZEeoqEOGSj7bL29zsBDXvKYlwwHIQT5JvLaJNLLM0u8=;
        b=TiPldssbPghe6K7ZvQh2ee1YzuI32n1AOtQEbNdadIE9Cd+lA09SVIdk1x9F9huaee
         RYITVAenPZVl42aQmGtaGqJwIRfAjzfHKEbERx9yh1115epn0wwigiDcZ8qJQ27Zq3d3
         IeozTM+cmVa/D2CvuiJoj5VWCq81P0DVYoEyy4cFG7a42i9oGKXOddZXAhloEA3oJxr9
         CBCZHm5HekxpdbbOyYzBh7SgPBgHSh+0bTvs5Jjtkr7aUC2RAzWemezCYB7lWHt5Zl/6
         NBO/Zn3vSZxppZMfBDdNsl8lrgOwT1lQfgEP8/EWragwEs92Zs5kr+c1YeAq1IhtM+sT
         AbwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991236; x=1795596036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
        b=R6LULoa0nUEKQ7noASBC+IOahmdb412tvQrJrTLxZM/BlBucf7gLQwhmI9N39Tx0iK
         hP6VkKt+3wD1Bat7iBJvcIstAmngruwpy7MjvJOmOWOH9wP4TB2IGFUe1D1AxXXBuStT
         eZvxl6yH4iFUQnzT9Qcmh66wJDaXMZudBDxekJq5eh878uUySEtZBoxDFGrmceknVxoz
         CfUfvEjg3e1HELAnDnDpbdWtjFk7ofJeyXC6FaEendOgus5q7z7Qm5oDQ2u/XBQQC4qd
         xlxaErKSNW4zmLqlVTXP73+bwMw6AbUacTTbxXlmkfH0jYvyB8ZfE9j6vcLQhlR4lH1V
         EJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991236; x=1795596036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
        b=NccK7XQiyzqTcqT/1Aq53tPBujFuqpvKIwKKtPoGtBmvWgp+9XeH0rVp40A81loQfV
         n3EsdaTKSExMnW7wO2QXPR+orU7lffBVpkMB0YLvlzAS+VeqzR3BgXzmaFmG3VUAKTI3
         qVlJX36/3l93qj8pcTfDQn6w5p5FPXfIECNHRL0aw0R9K54eNnnieSZ4j0qpKiGo+9Gr
         asr3doscCa9U66e8ust9FgOB1qcwFNeeYHk+NVE0k+8KRuAd1pnbAZL89yr6i/5PDlWd
         4rtBdagnVQtA5rpvpz1OAk1Q1q+jdZkJUKJXXlA+5sKkPsPUP5ykM95XhhhUBqgztXml
         6WCg==
X-Forwarded-Encrypted: i=1; AL+hErFpF4W7IZ19qKLBu+hlQa1387sh4fcE1tlQByKIwRPb84knc0YBBy+UdmX/IITFxZXpyoC6h7RDh903@vger.kernel.org
X-Gm-Message-State: APuU4Z+SvfN7CQZJuBtV3h0kQf3JM3fMGJAmidVDukJ4u8Q5zfh4gfAE
	ZoO+Z3RuutzeNgrzl4w4wV4DSSrs+tEqQ3J/RE4hm3iJtInyl/2MVoLuY9HUzUOkyl35x3RRhWX
	S0IPCGvgWXpnsCxjFxq+Z/9osdIgz3m0=
X-Gm-Gg: AZFdTZd9UuNm4mPm5ClK1iqPy6+gv/qbHDdhvv4OjoRMb2TKCSwB1Fn0s4XHz76bG96
	niKwdyS0yYlyy6B52jh3tsHpjtGVZmrwI/xK2iTt3LYb+ALvfU54ujnBR6jLBqsIsrrK/ZvR+wN
	jAH69RHTxXeA+nNK8mShJGKYTHWwpoeH5uZLjEoxnD3D+KdI4Jl6sYW2N5iHJWc8AdMfyl6jPsU
	dGNyWhGiLiJ5Q8zByGN19GRZjD0VvpVpnokzVPCFxfQDUgFVu4eb6637oBocjaSUnbwjW4j+qMN
	gg03nFkMZDXuyVEWswsguysuJ0KMtDtBWhvxhY8IzjYdOPAecC4a2CFUg9uO7zd970FrDCDS6Z2
	D/Ol9UXUUbX3tUhzobwj+yyY3xsKAg0Y1cYBIp7+EESD4IlgnuLaPCYTbfItWj8mB4JKLuIQ//N
	4Z35FjdvgqYfgF8zhZF6q5Tzz3JzMVMw==
X-Received: by 2002:a05:7300:3395:b0:377:3984:5cb with SMTP id
 5a478bee46e88-3810f02aadbmr5027302eec.17.1794991236131; Wed, 18 Nov 2026
 00:40:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251013060018.43851-1-clamor95@gmail.com> <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
 <aPCfiJxyKOXsgNJe@shikoro> <20251021132529.GA4133357-robh@kernel.org>
 <CAPVz0n3jt04xEwGr1aiDTJ7OonYYgOy3QneteLXgdGruXGMP_A@mail.gmail.com> <20261118091334.3d51a5f0@bootlin.com>
In-Reply-To: <20261118091334.3d51a5f0@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 10:40:24 +0200
X-Gm-Features: Aa3M54rharDKJbRF2DF-qewrb726K8b5XrfXN5sVsjDYYHGVF7G-51OovVUxmLI
Message-ID: <CAPVz0n3=rL9jVc7DtG9FmcH0zs11+LXg1+HRRf9aagUqZf=+_g@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
To: Herve Codina <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:1=
3 Herve Codina <herve.codina@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sat, 17 Oct 2026 20:17:39 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=B2=D1=82, 21 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE =
16:25 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Oct 16, 2025 at 09:32:24AM +0200, Wolfram Sang wrote:
> > > > Hi Svyatoslav,
> > > >
> > > > > Herve and Luca did not come up with anything meaningful, they pro=
vided
> > > > > just a few rough ideas. It will take an inconsiderate amount of t=
ime
> > > >
> > > > Well, IIRC they said that your use case can be mapped onto their
> > > > approach. Which is meaningful in my book.
> > > >
> > > > > before there will be any consensus between them and schema
> > > > > maintainers, and even more time would be requited to settle this =
into
> > > > > schemas and implement into drivers. Why should I suffer from this=
? Why
> > > > > should changes I need be halted due to some incomplete 'ideas'? T=
his
> > > > > driver uses existing i2c mux framework and fits into it just fine=
.
> > > >
> > > > I am sorry to bring you bad news, but you need to suffer because th=
is is
> > > > how development goes. If I get presented a generic solution (see He=
rve's
> > > > mail) and a specific solution (your driver), for this case I as a
> > > > maintainer will prefer the generic solution. Generic solutions need=
 more
> > > > time because there are more things to handle, of course. This is ty=
pical
> > > > for development, I would say, it is not Linux or Free Software spec=
ific.
> > > >
> > > > I appreciate that you tackled your issue and were open to share it =
with
> > > > the community. I see the work being done there. However, there are =
so
> > > > many things going on independently that I can't really prevent doub=
le
> > > > development from happening despite it having a high priority for me=
. As
> > > > soon as I get aware of people working on similar issues, I connect =
them.
> > > > That's what I did here as well.
> > > >
> > > > So, if you want upstream supported I2C hot-plugging, you need to wa=
it
> > > > for Luca's and Herve's work being accepted. Or provide a superior
> > > > solution. Or, if you want, join the ride. You already have experien=
ce in
> > > > this field (and hardware plus use case), you would be a very welcom=
e
> > > > contributor, I would say.
> > >
> > > Agreed.
> > >
> > > What really slows things down is when there is only 1 user of a new
> > > binding. Too many times have I accepted one only for the 2nd user to
> > > show up right after accepting it and wanting something different. So
> > > now I just require more than 1 user and it is on the submitter(s) to =
do
> > > that. After all, it is their itch, not mine.
> > >
> > > Rob
> >
> > Hello there!
> >
> > Were there any advancements with i2c-bus-extension so that I could
> > finally configure and make my tablet work? Could anyone point me in
> > the right direction? Thanks.
>
> No new advancements. I moved on a prerequisite: Having support for addon
> format in dtb in order to have support for a list of exported symbols
> resolution when an dtb is applied on a live devicetree.
>
> Anyway, the v3 series [1] need to be updated and a new iteration need to =
be
> sent. Also, same operations need to be done on the SPI version [2].
>
> [1] https://lore.kernel.org/all/20250618082313.549140-1-herve.codina@boot=
lin.com/
> [2] https://lore.kernel.org/all/20250729-spi-bus-extension-v1-0-b20c73f21=
61a@beagleboard.org/
>
> Best regards,
> Herv=C3=A9

Thank you, Herv=C3=A9!

Rob, Wolfram, since the DT Addon framework is not mature yet, may
i2c-hotplug-gpio be accepted in some form? Maybe a staging driver or
with notes that ABI may be changed and are unstable or maybe as a
device specific driver only for transformers like
"asus-transformer-dock" etc?

Best regards,
Svyatoslav R.
