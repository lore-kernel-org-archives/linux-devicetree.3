Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CDB431A57
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875853; cv=pass; b=qUQ+eVMrt/KedJGkfOH8WlC58P1j716BvZpCYFcMACcOlB6JBs42D3i2Aa98eDrQ5RElqw6JnaBJpGXtY6YbP0EL1HgmfkR9ofDDI3J1foo+lHjtOjAJs4deRAg7TUIkpxbsgLld+4Izqzxg+OAuIp2tNX1p4dKVPYw3v7REM5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875853; c=relaxed/simple;
	bh=K8Nry9JZX0+jkudHxKcPqQRdC9OkvdOyv4wLmj940zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRVS53CgZvzF24gQdp6Ft1NepQ/CUQEX86D5tWzU/NXFmteOAGJ0uAkYFWq/XkZwKpmWrX9mRikaQgjr6BxvBhf9yYMkJguk/vZpRmTfXs4kQqf3SLcxyjO6vZVX5MHge0heUNCZlPdKTBLNUeozRNR6v0dXSMxPU/QBdkEZz5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbzSQZBx; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbzSQZBx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fc2261f2bso359686a12.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785875850; cv=none;
        d=google.com; s=arc-20260327;
        b=YFaL9WSJr2oxhGP0HuyDpOb3fCuNgbnOv76lanBFk4XjwtrAlUegsWNcj5d+7EuFM7
         Kk74ZoJqCmGrDzpaoS/6cNUfP9UTp4dBZ6RvhwQgjFlf/FgpP30VXWjTXdoMXOp1IVgM
         a6fLosPqXNBe6hMQHhb5ksJz9TF0fZV2Wumb1qf6fKF/wwvjVQcAqbYEdLU0nH3a15bD
         hUEGtxpH9kxQRuXodqceQlqtTxDmPDh1sU0891wM5fV8AlquC3ZCn9sVoGsB/diW0vg8
         Dyo2AbSMOyKho+bQHmbTZhjQEPnGmsZyb4ruCUhKlrVcUFUqWlaGm9EzWrp59cBxBmJE
         Lzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K8Nry9JZX0+jkudHxKcPqQRdC9OkvdOyv4wLmj940zo=;
        fh=zep5sB78nnDIKhgJQmlqJK1jcc9jmYrvYsqncVeZDSc=;
        b=YZONPsmkb/eNXngDu3hwQZD6XlJcAR4TrNi39ZugZH9Bt3xiiRrwuNibdSd6++ZPp7
         QDgMDghWNZqTpOZPgz6/07M1tjJTQebDvc9cNpAEAd1vUk2i/kr5/LdDvJzKHS9u/6Lj
         WTPegySQ4budFHOMf2a4v3qlzAMaoFaO5NEMNYDnO1nTB8jWiRMoxitAUTCKF+VMaKxm
         kIQxreZzkcy0HYerKFMCpEpSSC2NLeuoLVatXWM3r1djtjgseXN3bf2XJb3abyq7K5kD
         c0sf8FcnNsXXfMAkSnHi79eecXBNx2+7FESvRbmyIZR5YKWBFo+B6QqeIqcjYZNDMgVa
         DLhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785875850; x=1786480650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8Nry9JZX0+jkudHxKcPqQRdC9OkvdOyv4wLmj940zo=;
        b=dbzSQZBxCX09yD+cRzsL+ZoPNCtflLUuIWGVSlqxeKFgDYNvtTvMwtSEr6zdjFYTIS
         CUO9zc+I8jX2pC1gD14PBknwj/G65rKxYHMPZMSrj/VMvt/yz9M5zmPAHDiigy9ZggOO
         Rbh8l55ThFO4qr4s/3AsBnvSnkD6H5cCiMhMVsVECeokkVdtSX+obTqlLHn9m1F8EJBE
         MeBuVahvAKaBjieyhiOh468WtKd38nA/w6nxUzrUGX3pHBMEqp+AT8Qd9EFkcty6jDwq
         2RHodwUAkhGuzgoU3EzyST2gfdul/y9GJ0Fofa7vfkXO+VwIuhGQcCuMex16citeuNR0
         UL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785875850; x=1786480650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8Nry9JZX0+jkudHxKcPqQRdC9OkvdOyv4wLmj940zo=;
        b=Y+rstKBjsjwE4R+RAioAxikLC/GaS2e6vj3alUIgDDaINW6kRsqk9f6vDx9c1Qu/f9
         0mEsf+tQTU56ftLl6dhqplgRhmcFHT3lZIsk0P7WfcaD0l/fjjIR+HjVatc2eAIh4/F2
         c2jZ8A44egI4+ARHFs0FoU9U2rlR6JTvKoyTqiQ1uwjtsQXlisqyuCfc/H7HR25YtQfZ
         6CB1jt0s3k18fuBbPPwolmRJD/ZNiXMcU70q+MmWrPgaS54yjAUkRji22J8p0q1z47W/
         MNTkIAkb8EjZi/TVRp8OipmhSsUVY2OhvzRG47bzFcsCrdYoqwasZ/RsM4KUw4dYxI0t
         h+Fw==
X-Forwarded-Encrypted: i=1; AHgh+RrSwS1fnLgjSY16+l6e9gyweaSDGMp+7Hr4gNqAcD9LfYjIrgHMdlZJYrSzli008luoSNKjGBItRgUb@vger.kernel.org
X-Gm-Message-State: AOJu0YzgiQuC3PqixujgqTmeuSZJydo86npWrR+xgubGR81FptKCr9yc
	hM67dt8N4EzVjvyBabiJg5YwtPH6mm1qtx8yj4FMQUb5pnbG+0ZGanzCLcpM4Ot/xz4rCSXhNP9
	iDFxddLcravEFfPHrGw0n3ApdDRwpi7E=
X-Gm-Gg: AR+sD10soBvHfSINucO2kgAv3NSwCeCvU1UYqYTXe2Oxk+4pCo3m9R2ANaCLdJ3b8hg
	fPNqspq1+w7iY75P8YwIiIWXIVmu46XpR1KOiA3ESPENSJyX/vApTBEgzX1HzFaSWaNy6344FIF
	+41kKL4LuqgCiy/N/LSjNrJOlw9Cpkar3YneUfD8HFhzzUdW19ymqcUiU3+G93I4OviVEBAciWZ
	ypwaM1Pvd6TLn0bpCrMQ/V8KcHyQEj1MGVRYD8wE8W/VR0L4+hHz2F0BgzFwtBaCz1RZ0AaR5Zg
	EiPL7pakwk9qBo//pWRhcQ6i7uzLwx02lg5fuMAX2Hm7
X-Received: by 2002:a05:6402:3506:b0:6a1:44c8:edc4 with SMTP id
 4fb4d7f45d1cf-6a14f15d5f7mr779529a12.12.1785875850152; Tue, 04 Aug 2026
 13:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com> <CAMuHMdVrmpZibxnP5k8wCr_Jpx2WzAe1bcUt9k_hWrreDs_-Eg@mail.gmail.com>
In-Reply-To: <CAMuHMdVrmpZibxnP5k8wCr_Jpx2WzAe1bcUt9k_hWrreDs_-Eg@mail.gmail.com>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Wed, 5 Aug 2026 00:37:15 +0200
X-Gm-Features: AUfX_mxvS-q6d9SV5M7tSXzAAroVFKsSN0D5MKV2-5EaFu7n2XqTheS2vhlCf9g
Message-ID: <CAEUXW=EAYTxdwyvpVFDLqof+wNGD-N3hRDRYve2Ou40ZA5R3fQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 4 ago 2026 a las 15:59, Geert Uytterhoeven
(<geert@linux-m68k.org>) escribi=C3=B3:
> The standard location for configuration that is not hardware
> description is under /chosen...
>
> IIRC, real Open Firmware used to have some logo configuration, too...
> Yep, /options/oem-logo on CHRP LongTrail[1].
> And it's even documented[2], but fixed to 64x64 monochrome.

Thank you, that is the answer I was missing. I had written the "a bitmap
is not hardware" objection into the cover letter as something to defend
against, and /chosen turns it into a matter of putting the node in the
right place instead.

v2 moves it there, and I will post it shortly: the node is a child of
/chosen and the kernel looks it up with of_get_compatible_child(of_chosen,
...). The binding now says why, and points at the oem-logo precedent. It
also puts the node in the same company as simple-framebuffer, which lives
under /chosen for the same reason.

Thanks as well for the references, the CHRP one was new to me.

Max
