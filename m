Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927273542F8
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014695; cv=pass; b=a9JBp+1TfApF+ouCftiDCNFiDV/pCtucY6x0nbjppqkaErOEiuUH9E3l28S6fRdt18nBma1az/kmgNQkymYrnzkTZh9qBRV1iejzISMazMb/2AxO4Sz1XyTcGa4YRR5NyDrZRWt2r/Mv+FH0YqAzofZlKOjac9hZl4u3+oqa81s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014695; c=relaxed/simple;
	bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfAr+JuRrqDNHfX9n8h4WC5lq/Fzf0aJRVuNijKBoeqZzEvwbsRUCw7VXFkB8Rv4kKNccKmVciRzcSCxeYpQHO6c+ANe2jN0BDyykPdigpDgTLBiOBTvqmjUGlkynuvSwWAG7t1s9NyCFmYBtbw/sSr2KXnT6aI1vVUlA8Ay0uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDWJ91Bb; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDWJ91Bb"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-303dbfbec77so21231eec.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779014694; cv=none;
        d=google.com; s=arc-20240605;
        b=KZaXwpWgTfdIfGxDWEvMXGMZFjjMLIr3kpXwst+Vm1LTo7MmW06w/w12cR1sV6kIQz
         GOMP3KKFIZwgwULF8O2wp7qzcDa8J8VneIEqPCkFovLF6xbGFMPUDwcikAtVLQ61ht6G
         I+9liUs85hckX3xe/aofauclnPOFaxiYIuXumZmzSUgKezQde9axdKbWEl9flhq/jcAR
         cAbm0n2hzA4IrmeC8sd1urraeBj/HIDdgmQLOZ6Yv9htLWI/5YS2G9xtHKVhvrXPe565
         c3GolJUyuRPUFbtQo5ULQqAk8uwycTDZw81wIsYN08mZWu8ForbFUxGmGjtbHfEWkbrW
         hYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
        fh=XbyYQ/7k1KoctBjVlslCtf2tnmFcsNnPEystbvZQymc=;
        b=W4ApWs+vpqLnPSVd0Sn5tB8xsligzxoAQe0f/z51VM2QaheIRUG0PTyag8FVj7cMbg
         dzoYNHkhRtDwhId5aiQMI95r9GRyDmA40aitYvMF2CFwHD3SbwKRrRDOYY/JJXrHMB+X
         bJtZ2vv8/xgk6WGTUY0+ESOBsyaGFIQ+s/clILwN86PR/Mr6RUSy3MItR+vhCCJQTGl+
         UJXYU7EmHlOxw1P+CGGBey968ENoNUxpwaLuXITpi3/FI9TKgBiQk1fMkDrEiW5H/ZsQ
         IqQdxUpTKgl8FY5s1PdLbpNOZVvo2OfwDvj59yywX9+6Gpi1RmAgKCXlYJfZzVmSa5Re
         YFoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779014694; x=1779619494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
        b=oDWJ91BbKlEmtbnEIPmaQuFMaf28jEa+z48mE6988VcnS+WHxZRsv35sS5Vb2HwRGX
         oP1mRwHV0q+aR8MRE83r111QZ5rsPh9b8RBpjZ6/hpq3mm8299Zym7OU0DuNsxOTuGvY
         gQWywgDBj0pCyv7ahPlQlQXMPMFnZP8MrngRDyw2jeg53erPwhSXBZF5RzMgg3SGtTCR
         hwRgEFuyZ8CcZ03Ycq1W6KSUhb78InX8gZSXIPl1JUNCQL5J64RR7gbTqpFrCXM3H2eC
         63LRFEj0uiTbpnipujDJBo250uVVpKXg3+vbFoSvroO48s/kak1BtTKrL2hiXLc4ZFeB
         DDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779014694; x=1779619494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
        b=lM298YGvN8Vv3vuKN+c8G0hRNYPQ+c1apQys191/JDJhORVXQ3PVuhR3PQz6T+pIo6
         o2GyRz5ioM9V615uMrW2rptvsH/nvBlDIkYZZyQFiPdKAhI10fxTXglEgZDTbGrpSGyg
         Qm98pbxG3zJSRxI6dY62jZl2vu9v6RBZ/3Dvsqg7UgQxSXjaqbgv3NsMuUYXGG+GLtwb
         29aCZJfYtenFg28kS/gSx+y5RCBvCnesRmKt9URICpR/26b462vQlqfANhswWd+/qTyO
         s2CdreJA8CP79X33Rsm+fxK+USRTvEb2Dd89DrJoL4CH4hcKrM/EENBEqfYBjwkBgw6B
         GUwA==
X-Forwarded-Encrypted: i=1; AFNElJ8nfwmlfmWc8usJTs0omH/rB/ZSZscb3rQKA1Ytb/DAeppB9hDW+oer6E1xzSqXY2mK9ZCYEtsi61ll@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFXDDSquDZSUjGqXfgSXQfnt5PiewhnVVFTo4erGZ89kyPinK
	QXYwQGQYWS7cuzdbGiACmYCv/h3OM15R22anqK/8JKK0DKQI5IJkT2Sl5jCYBR3AC/GqTNBWp9y
	agiclQcnH3RDbevDAF1uLq9HVJXlnlZ8=
X-Gm-Gg: Acq92OHNxsy5t3DzSmjvxlR+zWhozF7pO76h0CInujYWMkxeqHS3v+NDTqFDfdSmucA
	p2zC5sFTPk5Eau5upB8aAky0hn05eNFbUNw3UEJw4ySKVJWiQPyAuzn6ekVm2PKAt7eoD+l0gwE
	iyqE6I/dcD2Xq0NIMD7CTtB58jM1lzdFfmcxgvYmCKmaZfEgPnjnj9ZwwRN1H5TpzjvUgKnNegg
	G2av/OLZZi/LHID7bGH22RRpltgKrAL/vk27s42+kO9CXxeHBjsEZ74hkkoRh/YOYfdTf1nt8d9
	Zf1OFfH2w1LjjiTdxCs=
X-Received: by 2002:a05:7300:641b:b0:2ef:83d4:647f with SMTP id
 5a478bee46e88-3039865213amr4762888eec.25.1779014693685; Sun, 17 May 2026
 03:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <agl1T8O6kwP7SFZ1@ashevche-desk.local>
 <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com>
 <agmWVdi3TkBb2cxV@ashevche-desk.local> <CAPVz0n3Kn5VVxWxCgq2EcRiOaLWnB85hD+-S2Eou=H1PyycJCQ@mail.gmail.com>
 <agmbFQHezUl5Nydn@ashevche-desk.local>
In-Reply-To: <agmbFQHezUl5Nydn@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:44:42 +0300
X-Gm-Features: AVHnY4JnKOSw1H09HcRgWGFJYaj6RZPBdJ63zUWme_H-q0TpGJTcjfCXnVmnBUA
Message-ID: <CAPVz0n2VAUBNJOLXiGEaRn-x1esd6qeheXa=Br69cZnqmZ1QGg@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, johan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
0 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 01:34:32PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
13:20 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > On Sun, May 17, 2026 at 01:13:22PM +0300, Svyatoslav Ryhel wrote:
> > > > =D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 10:59 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > > On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > > > > > Convert LM3533 to OF bindings, add missing VIN supply, add supp=
ort for
> > > > > > setting mapping mode and LED sources based on device tree.
> > > > >
> > > > > How is this being different to
> > > > > https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gma=
il.com/
> > > > > ?
> > > >
> > > > I have decided to have a fresh look, this is continuation.
> > >
> > > Then it should be something like v4?
> >
> > That was more than a year ago, lets start fresh. Those patches are
> > gone, though I did add many of suggestions from there.
> >
> > > > > What about this comment
> > > > > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.co=
m/
> > > > > ? Have you talked to Bjorn A and Johan?
> > > >
> > > > No, but since grep -r "lm3533_platform_data" * gives 0 results ther=
e
> > > > are no platform_data users of lm3533.
> > >
> > > Johan was against driver removal (while it sounds logical due to abov=
e) and
> > > referred to some other patches from somebody else. I think you need t=
o
> > > synchronise with the people to have a clear roadmap that all stakehol=
ders
> > > are agree with. With that, the split and other technical issues can b=
e solved
> > > during the normal process.
> >
> > And this discussion was 2 years ago, and
> >
> > "This device is used in a bunch of Sony phones and Bjorn A posted a
> > series adding devicetree bindings a few years ago"
> >
> > They have had more than enough time, don't you think? You would
> > definitely know if there were any activity since you are IIO reviewer
> > and would be included, were there any activity?
>
> At least it's polite to Cc them your version.
>

I assume yes, I have added Johan but there is no email for Bjorn A.

> --
> With Best Regards,
> Andy Shevchenko
>
>
