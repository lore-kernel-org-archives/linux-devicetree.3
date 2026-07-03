Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DA220F2A;
	Fri,  3 Jul 2026 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095185; cv=none; b=n53MxU1Gdt0OPwdkhml42ea96SXAZhPiPMD9CazQ2l+H0+qGkMiScjQelZF/zreOy2Tw/rfmj8OgDbWGwyrCn1uRjqeG/3V2Bt0dg3QyhKjQ5woYC/VXgfFy9RvzyfISNhcyezR4mryPXlAE+3eoSZWbyBHzpaN2DBpsX3S6fsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095185; c=relaxed/simple;
	bh=sEs4rY7eHqvNO9iNPud7g4FzDBOXrr28xDXC3lthqhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bG4ZmvyQfkc26VCUfrAA1RePmxhjA5sYxvXHVwHmQGTTIA22zRQ3KeXC7UPFJa/zMPStklHxcHAN+Cs7hLTPm4H5i9blkFh9U+9wat25V8e3aQBu2l6f4a4m6cSbLdjoppdEoIya9LNfEk5gwurJZfGVFfNxGHuVAK2ldkFAUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Nvvw3IFW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Nvvw3IFW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sEs4rY7eHqvNO9iNPud7g4FzDBOXrr28xDXC3lthqhM=; b=Nvvw3IFWR+JVGJVmxPzeEJSXsb
	5aMY2F1V9t+poqC7mKWF2rFowHP+iGLhSVv3M21edc0tutACoaqePA2o7KuyiHQXfpKkq0HTHeD3+
	y1zh48ybvfK/BXuQudhUtfPm2CXIThJlqDRxfP7rBkq627HZ2K2VDdyF2iF34xEW9MDohn7z6C8Da
	KqmyvcIpVUrMlJFk2x84W/n7fMzNd1YjqO+sd83EyJJaEXgfcsqx4u/NWhYQDWnwSS2W3Gpbkgjog
	iHRtxclyuNNsCK9iLyoTzH7qzAeD0YeFu0kESBaGSxSJEnAId7/u1uwb9SyOk4s1fcAPhDaGi2MTU
	GaqHM7fg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Brian Mayer <bleemayer@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Fri, 03 Jul 2026 18:12:47 +0200
Message-ID: <2960762.AiC22s8V5E@diego>
In-Reply-To:
 <CAB3eKoDcp=rVGDpvAHEeVLG3rHFw2E1XXxCe2QaApX0aLkyXyA@mail.gmail.com>
References:
 <CAB3eKoDcp=rVGDpvAHEeVLG3rHFw2E1XXxCe2QaApX0aLkyXyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Brian,

Am Donnerstag, 2. Juli 2026, 21:09:20 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Brian Mayer:
> Hi kernel team.
>=20
> I was testing building the kernel for my radxa cm5+io shield, and it turns
> out there is no rtc in the DTS, so I got it from the radxa files.
> This is my first email to you, please help me correct it if something is
> off the standards.
>=20
> The commit attached does the trick. I used AI to assist me in this in
> case you're
> wondering.

Generally, please don't post patches as attachments.
=46or review comments it es expected to be able to comment
inline in the patch.
Ideally use git-send-email or b4 for sending patches.

=46or AI assisted changes, there is an Assisted-by: tag [0]

Please drop the Tested-by tag ... as you're sending in the patch and
your signed-off-by is on it, it is expected that you tested that change :-)=
 .


Patch contents:
Please use names found in the schematics ... the pin is named
 rtc_int_l there ... so the pinctrl entry should be "rtc_int_l: rtc-int-l {=
 "...

This allows easier lookups when going from DT to schematics and back.


Thanks
Heiko


[0] https://docs.kernel.org/process/coding-assistants.html


