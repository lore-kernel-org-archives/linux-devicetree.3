Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1408F372EE0
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 19:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799964; cv=pass; b=TQRXtz09D2RMjUgESahyF/mvft3q8aQdcMlQ0Xs5cMR12CFqeVTKbCQ9o33kQlCW46jv4cfRAU4eZBy0nQkxp2IWWFVgdMkn9yv6o7Nspn3CqlOn3hKc2MOYuGC47nbhAuvdGM/UCzchpos/c0zAk9BWVx9BgqkhMUJz7lfBgsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799964; c=relaxed/simple;
	bh=8rAcJsOtW4DKD45tYEB520aiSA9byMlCQPJXjvwG7nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU/F7gG+yJvZrZQJeXu2Q9wHX3fOslK80PktwJpWpxuOeqsEuzMRj+Or5Su4MCdj8uBrUGwYbkhtsg3yS81ilxZ7W1KPvPM9FUQ+rPcyPaNOs4Vcqx8msLttr+/G4dyS0PgDTnXBYZkJg46mlaN3icEV9uWkdXxGym+kEHpdZLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0KCOWfe; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0KCOWfe"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a1307438ddso4225199e87.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776799961; cv=none;
        d=google.com; s=arc-20240605;
        b=Wfia7KyV8RmvmHAPMrLekcZBMcQMqdqL4i1MWguqh5q7eTRp7BICdgIC1zmzVy/i7W
         N2waqk7vfe9iQyCak9vx/qA9qnYOODmU1GEvAgNQ26EKXjrbDmya9/1tcSRixgnsCY1r
         kPBVcahpTxbYj+C1gx1sL0b38VjK9eQjZuBd05mDdl2QW2uVdLl6ifRt+LWIJ9i0Qf25
         fCzAetSNwltsnjgUTJ16Q5hFpdbUo/IFN6s49UUb9wCsRZsXbGoHNfnJKra/zRXUSeXp
         UUW7F2HhcD5OikgBAzG1Uz3Ft9JoN6brF8HiLCLIfTdzNjRFpJpHmsDtxBCRR9TPFsXb
         Qfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lp5MwWSsbki+8BWZZD+t7QmXkch16LZxPn5fqnVKkr4=;
        fh=utKN359Nds0/d5htBsgVnZrTbQisLXNuae+07b+fA44=;
        b=IhvXatTWM5r2/XJzrVZh4ddtKsFmEI9j5NwYLOqNqO/2AeKEM8a3kNxVL0M4+zRoOR
         lCCsS9e/x+51PUPXD8vPyRCmagGGONx1rF2/1MFp2lSPqm7DJjuCSvpmWF8qQ69w1hqj
         nw/ZyW0R/wyk/cIXUcann1BC9gEuOSxBz3cgiOdFNXQH9QxcnRQ/4nr/3DhI/HuYefsy
         l874fcGpWAlhNptrWXXy+5SELAqq/JU3DWe8HHkk7xvaZx1mNlkV1weWbiAkO4jOPcQN
         r+/aSWRIYcvW0NCnRTd4KD2gl68xEsWe2viw/v/B5a403+ykDzkbw+v6FLh2TAKA9zF2
         lUUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776799961; x=1777404761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp5MwWSsbki+8BWZZD+t7QmXkch16LZxPn5fqnVKkr4=;
        b=U0KCOWfef/qBQrkyOJSDmmpcjmo7arG2hPWTEiyPs2yT//CHKCf1ZIMagH2A6u6+mb
         tgPOt/HEIfV3Eesx/70f2MDJ2fMlGbaqEHhTPdrQbrhEO/bggpGbR+exmIjmuHVCBWxC
         HiAXA4lHem2UthqT2kUUY01Mn92A50aeytCNWiX+NMWwsem8VtvyiAXGU5+QNFjnrYQB
         wQVnTkcGXS0Oe33ClkWXuqBTHWIOhACIX3izkzKzQ9/YUe1Lpodpd72FNCV8p5y5f3WS
         W+ihiyTMY6F9XUxhrw2iI7ugRUFmgDRLHv2pK70K2ay0S9DmGZyWvl+z2VjNp6yrgHYC
         ZgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776799961; x=1777404761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lp5MwWSsbki+8BWZZD+t7QmXkch16LZxPn5fqnVKkr4=;
        b=jYX7axhuMa2/Lnkm/jNriCYEDR3mOOiBdJHtXOfu6RCVtmOwFnv1DCv5eJ3GEyGXvs
         nxLDxvE4/eiyYcVtMfjalP/jQDv0idPYJKpPfOdtcT72Uua7/Lc2x2Xu/Bha+buJ0+hs
         /fGSxXC8YV8UEBSlXW3JLHp+Wl1ooLvtA5PDKONWb/gr6IQPdKX+2jb91VIkpNyQ198q
         X8uNAoBD6YCg9dyrqPSxINgRUGFqjCJYTJluC1cVHxTmUJ3SZVXtZkZIhH/XD8jpyKCx
         SO+mDZCe03dE+ZtSGNRIapBSjKe+EwqjGi0gpGfo7ho1HPup5vNJGkNn4C8iaUWNYEUe
         B3Ow==
X-Forwarded-Encrypted: i=1; AFNElJ8EpCBvRzNpgWF74p29ErS/XFkNTmRFAxUxJq9AyugM3VlKXIQrHKvpzP6Lz9dHwN8WMiNIRoJ/0p9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4NbCtSmPytcX8lWAclL4pwY+i9s2DMAgxINCq0T+PCAw+MByW
	Itadpk5k1WtZcVnly4+2yYxEytoWPxc2/4pPXFF4XSAf8ofna8JOulxAsofxDgn1Tkmp9MEy20N
	CFL3cPMhoIWSoUelcF1dCskP8qeVww/HZ4vcK
X-Gm-Gg: AeBDietHDdmCTjWInsrWiPrLHV9z/ixXsL1xAmCKclX32DTD01MFc74Ma9FA3/sbCrM
	CGWUPfbW0DoLAm3ZB5wujBFBG0961K0tvIXRmZ/0Ooqgqc6f2kAL+XRQngB7Ktm+fxFJpL9yieN
	haFjqjjjV3n+9PAJtDg2fDzUDlLKigy/qf3tP3ALQ3ZvCRMqEygjAniwbWz0qFyjM2VcqrLSGbQ
	Pl6sJO5khV+3peNybcSKxad5ucEqx8bRYpsG7jfc3c/7L7S8dNi82T8OvyCnra37SgrfjkG0TSx
	xAYamyaEJknFufVOKCdTY2lgUqYuf0TblqiDWJlUQijzfq7hXehs
X-Received: by 2002:a05:6512:39d3:b0:5a3:6734:48ae with SMTP id
 2adb3069b0e04-5a4172ebef7mr6518200e87.40.1776799960988; Tue, 21 Apr 2026
 12:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
 <20260414034854.461661-1-padmashreess2006@gmail.com> <20260414-tentacled-mantis-of-control-cb08f3@quoll>
 <CAEjBr-bdNvgBWjHei4K8LLH6QjkgHXCwtmW5qGoeh_36Vy8kWA@mail.gmail.com> <5cd2b36b-de7d-c51d-f495-6ce78fe5a8d4@gmail.com>
In-Reply-To: <5cd2b36b-de7d-c51d-f495-6ce78fe5a8d4@gmail.com>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Wed, 22 Apr 2026 01:02:27 +0530
X-Gm-Features: AQROBzAkL16A_ScsBRTcdIvJEzKEVKZiM7-iIGei2JZekFMz9TeDEu_VrJvpYJ4
Message-ID: <CAEjBr-YQte6QpjX+AR9woJ-tf2n7s+8hVuTMJP7Ne6tFLMEMBg@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: ti,pcm3060: add descriptions and
 rename binding
To: Kirill Marinushkin <k.marinushkin@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review. I will add the reg description and squash the pat=
ch!

On Wed, Apr 15, 2026 at 12:46=E2=80=AFAM Kirill Marinushkin
<k.marinushkin@gmail.com> wrote:
>
> Hello Padmashree,
>
>
> Allow me to once more propose this description, which
>
> was in the original .txt, and you included into the patch v1, but
> removed for v3:
>
>
>  > + reg:
>
>  > + maxItems: 1
>
>  > + description: The I2C address of the device or SPI chip select number=
.
>
>
> You also probably would like to squash patch v4 with the previous patch v=
3
>
>
> Best regards,
>
> Kirill
>
>
> On 4/14/26 3:22 PM, Padmashree S S wrote:
> > On Tue, Apr 14, 2026 at 12:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >> On Tue, Apr 14, 2026 at 09:18:54AM +0530, Padmashree S S wrote:
> >>> Add description to reg property and overall binding mentioning that t=
his
> >>> driver supports both I2C and SPI. Rename binding to match compatible
> >>> naming convention.
> >>>
> >>> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> >>> ---
> >>> Changes in v4:
> >>>    - Rename binding from pcm3060 to ti,pcm3060
> >>>    - Add binding description
> >>>    - Add description to 'reg' property
> >>>    - Remove unused label in example
> >>>
> >>> Changes in v3:
> >>>    - Remove description from 'reg' property
> >>> ---
> >>>   .../bindings/sound/{pcm3060.yaml =3D> ti,pcm3060.yaml}   | 10 +++++=
-----
> >> What v4 is that of? There is no such file.
> >>
> >> Do not attach (thread) your patchsets to some other threads (unrelated
> >> or older versions). This buries them deep in the mailbox and might
> >> interfere with applying entire sets. See also:
> >> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/proces=
s/submitting-patches.rst#L830
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > Thanks for pointing this out.
> >
> > Since this is a DT binding patch for the same pcm3060 device, I linked
> > it to the previous version. However, I realize the subject changed
> > significantly, which made the threading confusing.
> >
> > I=E2=80=99m planning to resend it as a new patch in a separate thread. =
Please
> > let me know if that works.
