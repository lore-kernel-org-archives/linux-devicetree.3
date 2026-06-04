Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6872617
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780612671; cv=none; b=UNMvbT8fUCl2ds4vU9zLccNp+8PbXnMBqLcn5q/rdeM1m07v9aa07WZXg868133q30IGfy0jzjRonTwXFKcJP2hdZZOm8LtZM05DbyJzkOTyorh7/oD7cpnppsIJ8oPVlPwlTjGX/J5MqHX6SgADT679gM1AEyK3YcSBzitSoTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780612671; c=relaxed/simple;
	bh=wJxkHSt4+uNnpf6l5+6ajY9tYSWVGS4iEgWKAK5VKP4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QdfeOrTvQAn1FaYXtfAB4McikxdQg7ER4l5gdrt0tMRU4ijGJaT5r1kWWPmiqOYaCx09gmnkj5IA54/SjeNoGEwwgeb7iCRD7t1yn912miO/L83Muj8VRMRKNy7M3XSAUHpC9VwvKRhAgT1eNuukBbLiZyIZrcxg2uBbsqtC/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvpxPuvd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvpxPuvd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso4912055e9.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780612669; x=1781217469; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGK6nyQiO5fRhl198UMuPRvqMBmif9tHjKq3IyAKSuc=;
        b=FvpxPuvdEcZNkPZGOmsxbmyUQj8+OX0umvR7izy5MTyhiV7s7P6x7YtjdVC8MkCAjN
         aLrb9hWhdgJZ0z33Fi4jb0dKmey3ZAA+tliAlHBnMWCSaVIjIgsPqJHq+yZ+hv/zrp/G
         eUAgQBdaqgMWR0nEweE8hn1M8UdT6ps6pneHxCvsg0IkxEbndSzo2FveL8EASl7a0Kju
         CuZLlMly2fFk0VmDb+bgZxAfXQGpVpGm8Bv0r9iZJ1fhGg61yQdXPPAhYqDvuqoW96Ep
         HaphEUlP2ld0dUBB/09IExXt3si2ODKZisuI6+kV2OJ+aHaYzrln+GKz7JavOrx6HhPm
         w3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780612669; x=1781217469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGK6nyQiO5fRhl198UMuPRvqMBmif9tHjKq3IyAKSuc=;
        b=M9C01Fq8xLMu4ZID7b7N8uxnF7IR0O3zXZ4cSaQ99YrUnEcSDe0v+k7NcocjMnlEiW
         HoCyfCXzH2vjC/fCG1ySE4TnDaDTDNrbEOQ4PsjssANKDanH2b1+4GJHCiR6MBxbWY+9
         8yZYlVVw6/JfrAv0gstuiHi8g9Y3bmNsbAdHPo6+DOl82Dyuc5tdrBVQFY39PT3WYRho
         zqBuQ+3G4/3DZcCQRknYMEfq8DKy9zOkvCk9j0lk3uOcEV0qY4z/YfAdZsa1NJPkt/Nr
         lLiTZTePeOJYJQu28TUje4o4RvPnESgOX7Q6XA8aGNEpRvFsJ/YWsSEZCYg/BTpINuC3
         NQ3g==
X-Forwarded-Encrypted: i=1; AFNElJ+/10gwFi5T+o5NpmbJQAMCnlEbNeDMAMEnrXjT8sMM/2WkwcEKsPm2zAw9546RaRk0YwDaH1v+/Wcr@vger.kernel.org
X-Gm-Message-State: AOJu0YzFiFA2zVh44aElHk3I1C5yX+fYMGDBtySR1ZMb7KCmqg6IPPul
	vzDNeVq8Y2YDxQSgpnrCTuHZfVq1Q7pRbQxAS13V7H+jTqeYw2yUwbLyNyibVjAq
X-Gm-Gg: Acq92OHBsf568tWevjRbI2u3bGQfLC+vTMYdcYbIOW7xwqR6TL0oO/DI/BrJggL9khT
	kZg3ZMKSC7cTEF0ETQXolGknxxHqESXpR2pY3714voaWv3+sPLaJXsZIaRxAQs3p5XrzOQTBwMs
	E+Oq/fyh9WBblzOLdxgvoTHJkRgp+Z547xtJAu78DyDop+o1LP2HJZ2eVEPgeQd+9sPClBtC5rv
	jBMLi2WpuGiVgp0NYK+Pa+MxnouqTaxhTO2aFZL6m9sbG8LbpjzPtxL9SfATg7GGyIxhhvwNDmh
	71c2rbnE5TogOmIqc0pJnaSdFM39n/qOeN/2B0rII3fNzi33IR/wCzqMEZup359WRXMEnt73uI6
	d7TicxRXbj6yiK1rYZQbdod34aLey3GtBJ2jUv/RBB0IG1PDu+LsOlku1BuCKRYAfcGwBsqGH3S
	jvTiF7HJiGqoLEUXBxamVDcthrreuEwoIgGdGQGOUwklgRKl0g0DPyMqbm6JeHm5CrNTQL4ESGR
	A13PazAR8BNPg==
X-Received: by 2002:a05:600c:6994:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490c25de6f1mr7829425e9.16.1780612668566;
        Thu, 04 Jun 2026 15:37:48 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c1e20b0asm13827345e9.1.2026.06.04.15.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 15:37:47 -0700 (PDT)
Message-ID: <36c392676bc5cd69de5e8ca2cabe5ccbbced7517.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 05 Jun 2026 00:37:40 +0200
In-Reply-To: <20260518235432.07537260@ryzen.lan>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
		<20260510201644.4143710-4-alexander.sverdlin@gmail.com>
		<agr9m_tidBr6Cu2h@collins>
		<04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
	 <20260518235432.07537260@ryzen.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andre,

On Mon, 2026-05-18 at 23:54 +0200, Andre Przywara wrote:
> > > > +&reg_dcdc2 {
> > > > +	regulator-always-on;
> > > > +	regulator-min-microvolt =3D <500000>;
> > > > +	regulator-max-microvolt =3D <1300000>;=C2=A0=20
> > >=20
> > > Should be:
> > > =C2=A0	regulator-min-microvolt =3D <900000>;
> > > =C2=A0	regulator-max-microvolt =3D <1300000>;=C2=A0=20
> >=20
> > 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?
>=20
> Do you have the CPU OPPs for this board? Do they slightly
> overclock/over-volt the core? We have seen this for some other boards.
> But you could go with the safer 810mV...1200mV range, and we adjust
> this when needed.

I'm not sure how to interpret this, if it helps, vendor BSP has:

root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/
clock-latency-ns  name              opp-hz            opp-microvolt-b0  opp=
-microvolt-b1  opp-microvolt-b2  opp-microvolt-b3 =20
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b0
00000000  00 12 01 60                                       |...`|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b1
00000000  00 11 3e 10 00 11 3e 10  00 11 65 20              |..>...>...e |
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b2
00000000  00 10 c8 e0                                       |....|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b3
00000000  00 10 7a c0                                       |..z.|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/compatible=20
00000000  61 6c 6c 77 69 6e 6e 65  72 2c 73 75 6e 35 30 69  |allwinner,sun5=
0i|
00000010  2d 6f 70 65 72 61 74 69  6e 67 2d 70 6f 69 6e 74  |-operating-poi=
nt|
00000020  73 00                                             |s.|

At least 1512MHz is possible (but datasheet says 1.6GHz, so probably no ove=
rclocking yet).

--=20
Alexander Sverdlin.
