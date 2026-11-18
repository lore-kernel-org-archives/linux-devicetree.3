Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991945;
	b=IN5dSZJnqWSjou5FbYZNO+QJSwR5jwHJdtoRch9OuCjrfJy/5JMAcwqCMKDmRCf7CmGN
	 /Fv8eiD3QARVN1tVpumyZ92TdbrbnuFiwaEtBnnRYbtyuvEyLe0uCReC7g3wFfBlhfWnY
	 6rmegCWxPucNtFeJ7WhiChE8yEidQra3Ov+M7FotpdFF4BDsW9W8drUzlef9TUUzhO8eh
	 wCd5Ij3X+pV61RnK5SCTtcFJXHXWObJYhpwCGepEGZfcynJFfTQ0uu7eXp+E8d97ehgSg
	 hKp+WBQDcgGnLeUDXfD8QUv3nABbDAAnzsF9XQb05lHE5TzKd589XdZZlT3n5cO6IEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
	b=VGcgCQijd/l5jo/qEdU4SGQMXTwZStjiK3yhXIEnsnfEcy4BytVvo1YbLt6VWgI3aANC
	 QPPA/swIh4IWfWQWnGmEoF7DDmduOfKb6JiXRS6h2JvQWA8f1aoAx1VdB7lG2LxqqaYI9
	 Ssmp9hRwraS2yj4AXvsJ3qGxgSgtJdmOE/VR9r32AXVAPmBRt11kyaH8ILDyqE1t6n6lY
	 WgnKPV2J6vJ9UeWPUfbxnC3JbXqaSBhB2RcBwrMbwLTix0Ehmh8SA/IiUB9kOOyxv5n6i
	 SzXx9V3jXiceCJm6WURQBNHi028BNYzBSLeg6VmT7m0u6XA/hkZ35byN3WDkmagKNtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD24606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD24606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38190551625so1399492eec.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991944; cv=none;
        d=google.com; s=arc-20260327;
        b=PWTzT0OGgJrJrpvzCm4RAkNLUmol4sK/Cg+EoE/7vXE00H8d7uQdZKq6EOcRp7Pedr
         UhllKCXI2dffVlqiVho/HU6+hxvLgFwgpVgOY/AnZtzqTN8rHdEP8arypTfE9UEF0Pza
         H6ulfWhoOk/RKZM3LIVYERWInRZMMsL1KaT7Jss64QyF1LThuJAPDQohfP2f+QnmBqq4
         z7aSRhJ/4H++YWyF67mRO0+NPDu+vZuOHD6+05ji89ao8oA4L3ObjCsSFpmtSrDIDBkZ
         Eg6fhgrAfzdBBlIMzLRVbf4+3flcdZV07TuQWiUG59/vyiUX0tUVqlguMZ/Ke69glw17
         MyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        fh=HebZjbJ8LWooEIX2TYx29+7tYmROA6cbySxzCy8qO2A=;
        b=hDZI+3TQh02sQwAxxmNiuCexLw0iD5vfIdhVygmKfCq5tgAYjTXcM966Olh2pG2fwI
         VI58sZdT3IMGaXWsdPlYXAovxc2Y1JW3sw/E5I/FtLwVKFFJ8WOsYGF8PqBCiMiNNVtz
         MJfk53j04WBI23iPpx9k3eUB+ZekjF26RlAGL/2QGAbTN913VoC9qdXUbGCR1z8WmN39
         ESSNaPaz+2wXfZIVrNpx7UuXWv5c+7V6rphWxKSqiQlhHTbckwsbCwrq42TAo7InP8Z0
         szzH2YIgKQ/lzy+ns8EPCjP45eRRtEMD2J13TxiuJ5TSiUYZ0LYEhUpJKwjs8kWeCroq
         jjWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991944; x=1795596744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=GabG479gc7SQtMKk6DUrhHDQXHroIceWLhNoIHp0kZP11T4uJNV4ts4eVR2bGpM5WI
         8Mhz2biSzc/F7bv3izo8A5vZl7wp3vLTa2I2Lqaf+gLsKbgflvS1ReE0JkPH2eXxg/B2
         rBXOpfodZSW3bGHJ2LZPbpNK9baCxzFl9nHtbLFKA838yANCndxu3C3gYthddFNl9nht
         JzVfgWpqrzL15vRDk/jeYU5loe/y9d88sc6QFsJ76e351jUPEoBzazu5kTzlgOsaaxuj
         klgmv9RQuGyOFaPK//yZO6OuIjOMR+Ov2oYOrE8pGUKIUYb5tqnBmPWNbS1qUBzO7VyT
         NUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991944; x=1795596744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=2hZ9ortkWYEsG3fGFDT4P5J3mRD4C9Epkw6WH9+ZqLYo3fpeNf1B2I1VvCBH5n1VSm
         JLZ8PK4yVEtHMBKhlcTm1r6ySnHAa30pWVN6vjKHHcSFce6Iyyp6YyoZRm5mqmVY7ZlU
         WuAnof34w6g9qZO5dmnHNSrouC5oZmtAVYYgHqhBP6m+CMitOtNiWPrbNnhc2bxCUz52
         SzSgvhGagBs+4E4tPoyORWgu8bvxakHeqMf7rXEWZcP6eyaWZEh370yTvFO+Kdp419Wj
         E/JI33O/eQmooPM4nrk6RoKF3NwNWEAixSwxUWOxJkCTuRC0+n5R6pSxl5T/BOnX1CDR
         7nAA==
X-Forwarded-Encrypted: i=1; AL+hErFY9roNERv/KWz+E1HYaXA2lYY/OuwycuO1O6wBbOz1UQMzi9WgEC5QjTqea4RFXpa5K5iiZhXbMNpl@vger.kernel.org
X-Gm-Message-State: APuU4Z+ex44twdpWPVw49an8o2i9+vIGgoAAnrlkOo7hqo5WIkIKvfUR
	ThAU5dV/o3qO4XYdMaov5Vnf58kddd/4nJduy9edLgeMETAaFfqsETWGSW7/6MkMdiGWXEm+F71
	NmZBlZt1Xqzv400hFTN1cf5p1ITZFVz4=
X-Gm-Gg: AZFdTZd8NU3+F+Y11eUT6lhWb8GDOdMvhBX6JFdoH+MHjW1S5iPJKQ5b4aqBrD/f1gM
	RjJru4DaLaOAN2EUlDibnp4y0iJ5pcciZFrtFkrdqULXaXsl25yjnBRtZtqpWqaGsxq6I7Rgcb1
	UTNWwt9Kw/O/gFQjVdr2ciU08WuTc4LljcQSdNRYJQoxES2kDh6o80TpJAJ4LXs2np5AhQMEgfo
	qdApnfRDdVj24l5aFX+G4zmn/RdGEDloGQzTGMA1qMugtXUDVQhCMn8eBGAOAzxSeISsVHVTo7z
	bDHqe2uMhIBYMAf8loVnFWkDrwje3AHDKFJzmP1njgaiG+ycWQb/nqqjm+00Pn+VPyJKvlM9/7K
	PxYIzX+/jhyFmZIri9PGYXgUQqG3zJfwNtuZnPTki1aBJ7uESLDBWfGkb+usxsh0E8yPVijolRw
	CtaanDnOXN0hcd5aGSqMZ+YMn3FqRteA==
X-Received: by 2002:a05:7300:d210:b0:374:c5cd:42cf with SMTP id
 5a478bee46e88-3828180f712mr2187391eec.35.1794991944368; Wed, 18 Nov 2026
 00:52:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004165204.205660-1-clamor95@gmail.com> <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org> <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
 <avxHzF-uiOAhwXIW@orome>
In-Reply-To: <avxHzF-uiOAhwXIW@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 10:52:13 +0200
X-Gm-Features: AclHuK93RBJ02mfDmLX1EGnWRCzqbB375hZf8dudgwlzH98v_5reAPWSy751p0s
Message-ID: <CAPVz0n2h_uzr1MRZWSxUiPwu0=mXjhOwaP6HTFHDRV9DmF4z3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 17 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
0 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 27, 2026 at 10:51:52AM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:29 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > > > Move all Tegra-specific Chipidea devices and their properties into =
a
> > > > dedicated schema file, by analogy with i.MX.
> > >
> > > I don't really see the point given it is only 2 deprecated properties=
.
> > > Maybe those can be removed? Depends if they are deprecated and still
> > > used or deprecated and removed from .dts files years ago.
> > >
> >
> > The ci-hdrc-usb2.yaml schema contains properties that are not
> > applicable to Tegra, and conversely, Tegra-specific properties are not
> > applicable to qcom, nxp, nuvoton, etc.
> >
> > The 'nvidia,needs-double-reset' property is required for Tegra20 and
> > Tegra30, and it is still actively in use, as you can see here [1]. Its
> > marked deprecated state appears to be incorrect, as it should simply
> > be restricted to Tegra20 and Tegra30.
>
> For what it's worth, I looked into this a little bit to find out why
> this is only needed on USB1, whereas USB2 and USB3 don't seem to be
> affected. Turns out that USB1 is a different controller than USB2 and
> USB3 and it has this errata. In retrospect it would've been more correct
> to assign a different compatible string for it and derive the quirks
> from that, but given the ABI stability it's probably not worth
> correcting it at this point.
>
> Thierry

Thank you for the explanation. Having a common schema for many cases
is great, but IMHO mixing different SoCs in a basically SoC specific
schema is not the right approach. Having a dedicated Tegra version
like i.MX has seems beneficial.
