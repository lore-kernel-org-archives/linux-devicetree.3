Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794667515;
	b=Y/1GjHyyuWX5DavLxHNgAo2C2jEKRJqJJ/3NUf2YpgbnXZ8TuFIHb2BS5mtRHqpvDePX
	 Bs8cZMcPGvDuZrDlCxtuKGgBidV87RtLSxoDnHX17GrMNaXUyXninc6iTuYrcSaoSldNq
	 pKdRjLcQpeBhgrr+lO0hMN33XsckfYEsjOS3fo9URhHk0urO8a3cJZF9gGrzgPllyMrCs
	 iTqZJoTdl/7XBWOAhndBNf2pbJWXwGds3FSf7sG1s7mFGs4+64YXoQ6ap6e40AR4CB/Qp
	 zHC6A2c7v+HBycgaJslJL/EWpxqX/g6R5WO4wAuFd2w1dP5TdjFxfmWAoyIhlrFk5gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
	b=Tz9Abrz08P8LLH92+jJ+GCtbquMuluYeErQOotw6b7+bUyPW/ZhmBwJ4g6qTF4fY2L38
	 9MoH+bfC2HJrWdAoPJ2Namukus4uk4ldyfhMhVgUxOR65ZnpF3+M8LPFYOxP8nlWShoQH
	 H3mbo6UTZcCSoo+dfK1mjIcPe8KYpU8afdNftDsTrb8GC2N2yuBALOxKL8sUbyzarP20D
	 EhShEVcfV3VPQjWSByNgtLliZCXpGshoTjMcDtiQ4KCOPh5EYCf+xiYQbSfRCG6WbZzFc
	 FxtWB6gd+nNvCezg1sf4G2ghPkKGSHsl/tca2bAGZzTnizPhAq1uCLmWT976FYhrm4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWnMxepI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78EF606A330
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78EF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWnMxepI
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37600b0db49so2661734eec.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:45:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794667514; cv=none;
        d=google.com; s=arc-20260327;
        b=m1C+2l4dqjDlYPXmABLE2JtpkfrFGTExOEzW6Emj993/cITOz4Uhbi91z1KD5jO2un
         v9XwHOLoPDawPLzduULiqQtBPNaEVzKLmm+EZ/gjlPzhZJHaYYaNdlPK+Vrro927Kktb
         mY0z69XzxaCi/YmMxT4GEFAg+lW2agHl2UkuHvtkkcQlKscw8TcesMbSgMRUIZYESnaL
         ClIRN2Q8tJaWDmKfqkWYz7yUws4w8ecCo+ApXlmvbTL1RHq7si7Bh9pqaLS1JMNp0WA2
         V8KHPl8jM+IN3pmDSFjD/w3FBH+vQXDU5jH8KyPvSSNhqmVTaW8Ycgc5UqMSkqLbv9v7
         IXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        fh=XQrTW9xxoJd+4kmwE+95KxNO7Nl44KHh5/9OCs+U9Lg=;
        b=RRKJj05GesWaklSpwMjuSNTgIyC5ubiaW8tW5zyIBxrYLFmKaYIdIVus+rhJOE03fw
         hekpx4ZfzRP9GLXmhoocJ6qU6p8SgmllX7SERazUyNfDZPcUQYt0YUMCxB9HtEm7CC55
         Q12K0rXvvISjU8dOxS4Q7QEm9NAAhZivPLpXVcJqTFlezHvGaiSQLB3l0/r/Hu5coDID
         ofjkMLyVxfwbfmT620rnWTuZiAPfA2L7ymWCMXSXV07hwkAJrVmoXEZrQjX5ygtvTd6J
         rYoEQk6g+tv/3yw4+3gcqiPbzq9lRgJ7ssD1bRGSFWOrZ1xJpTjBYIJPwoORNN9t4u6U
         OO0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667514; x=1795272314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        b=VWnMxepIxhJfUqyZ91Md3j8tCzMbWsFJYzY+qoeWDv874H54yJllbiHo3X4LcMf9bF
         a7sAuAM2r4ldJ//2C2kQxsmcMTluww2tYeWFj9F4B7Gm4Yw0TRIG/em9N8Hntyat5W9s
         6+7iXV+/P1khaxucf3UcN+XJRL2GcG6PHfmqDS6EfNRYbazxK7aAZVtfVdZjgZ/ZpxPn
         x4gpoVJepbRDfJrqLMO2Tr45fubzF/BkR7LMMUfaGqtQ2Wii6RIP/BMpGesAvo5qWo3q
         6h+ak/DvPX9WjypzcHk7vt1tkMQWOqi0Y1MieyPDEyC4RxpJvFwnt3PMDYinJRRust52
         NHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667514; x=1795272314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        b=mdhk5LpBmsHrE7Cgpp7Is4Y/X9T84lhkr2SO+TOPeJq+e/gOTegCrN1LGvZqjmk8kG
         CWneOVkgRGL5WxD15gm5Jhuo5vsFdIkTiG7bMDHTZuOU5zJweItAQ2wLZQWW0Qjgsxuq
         3l11NW2mEFlmeNf6JEEPGmfUf8bgZnzV2vfQp53ywT8Mq2uJciDfS2oHiym/gmPKXvcE
         0oxqZg3i+QrlPx4r0QiVNjM4JrurYo/yFk+O057eGvFj9Shfl/jophdBv27w3wB/X9p4
         nH02iX2E8sCUwG+2dXNYA1bvr4mU5z8z/H4dZNhoWh23JJdYUYCR58rQYa0iDBrJTjCn
         Epyg==
X-Forwarded-Encrypted: i=1; AL+hErFSn4F5fi3KIGW3o3Y+ahqWBCOmGICAxuL3K/g6cLdEB3Ge+eyj9kb6hRSXzid1cIAFr4YuN4I6HDkO@vger.kernel.org
X-Gm-Message-State: APuU4Z8lGK1czGdRCI07d2uP6RqcgJdu0qIjQYCWIDJ+OR2X8hDJ0cKJ
	h4VMi2yrEnBB3sezp+Q89sF9h9dwQXazl0g6n/9+z2l1FDXJFITNe+sX58qNQlI/z41XATu65k4
	i+BCSo4Y4GItTQslPILpV7bo350xBn3U=
X-Gm-Gg: AYBFou1Sk4AUB+kdmQUqU28Ly+4OP0Ppe7P/0IrlIGEX/1tdRGywN8n6lYOnCKkRkev
	GaJyHnoYbdcJXcl7mTcsNvHyP4o6/yLaE4dcAJsqEqYqPMpBOmlvDdOVtvnL41n5i+ItxFeDVOQ
	ePxV0XTelRKl7A63pdlq0AmRrqT1hhknu8uFa1R8BV1tileZWgjVH3YhSYF5LfTyymcz1vtqh9T
	ln1fB1qzrzz0GI4pk7lfjD5SpVOQ1wNpZx2+GKlOEFoxQQwSWjGD2H9CoEYFsfxL32rxSCI6sRK
	2R9Jm+nQ7v4oxKtKz/Xs+Q8PGzOT+OcQGXTpn/SIc2TUQDRObwzsRkVjHL/qWdOJcbEgeoeo+J+
	R4ZSe1A2CyAFAimYd0uGtQzYOa8npdJkjiFu7CF1HC2p+1SH/66uPeVez4BWJ8Ct3DZwglv5847
	IgTKR4lJLgqp131VZhOvG6gGo2g4O5eA==
X-Received: by 2002:a05:693c:8115:b0:36d:bcd7:2347 with SMTP id
 5a478bee46e88-377e093db88mr8125743eec.4.1794667514069; Sat, 14 Nov 2026
 06:45:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108094253.83899-5-clamor95@gmail.com> <202611090518.mm6yt2nO-lkp@intel.com>
 <avInQ08dVrsc-Rbo@ashevche-desk.local> <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
In-Reply-To: <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 14 Nov 2026 16:45:02 +0200
X-Gm-Features: AclHuK9Q2MT7WzTqFgmyb8uGWfov9bVv3FDtVPr7EAhs0HUduJChL9YtHwu65_c
Message-ID: <CAPVz0n1UG6L8divtcXgg7mfS7C3bO9tKv9d-Xh6VbyayG7p8-w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>
Cc: kernel test robot <lkp@intel.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, 
	oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:07=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:=
04 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Mon, Nov 09, 2026 at 05:48:09AM +0800, kernel test robot wrote:
> > >
> > > kernel test robot noticed the following build errors:
> >
> > ...
> >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > WARNING: modpost: vmlinux: section mismatch in reference: trace_initc=
all_level+0x28 (section: .text.unlikely) -> initcall_level_names (section: =
.init.data)
> > > WARNING: modpost: vmlinux: section mismatch in reference: __arch_xpro=
d_64+0xac (section: .text.unlikely) -> initcall_level_names (section: .init=
.data)
> > > >> ERROR: modpost: drivers/iio/light/ltr501.ko: symbol 'iio_find_chan=
nel_from_si' undefined!
> >
> > Forgot to import namespace?
> >
>
> It is not exported in the core
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/iio/industrialio-core.c?h=3Dnext-20261109#n319
>

Should I export it? Do you have any suggestions?

> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
