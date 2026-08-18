Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890D34D3BE
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063567; cv=pass; b=jFVOKjs6EmAAYKJTYvzRa80cVGWuve3OzGN1OA8NeOmazYignW2hVKVTRXnP0WqqyUtw1XJeTW7to1F+U59HiN436Dg6ufCtIDir/PO+L/SF6M9Sk7S3ohsxfOfYPmVeffn6XQXObJeRi1tmBqzRcrANn6YjSTohcafA0m24K6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063567; c=relaxed/simple;
	bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFljKx7RfUgjGN3hOaq/1eOwl71jj+dGDP4nCc/8i/RFmddWZ9SAhJ058e4qZsC7kT1erfUDalGZrw2S5xaKla2tD5bdkQUUj7WJTeol7wEinS+AafPy9BUcKtiaqd/MgJYVyE/4RyFiuFv/nzDM+ggL6Dbu+vpwrcw89MmhKdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g689A6Pd; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g689A6Pd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso46783265e9.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787063564; cv=none;
        d=google.com; s=arc-20260327;
        b=i6LDhAVrjNqwOiANd8xmTn3hkkVfCXy/IIpn27gbCpjWUDkg9fp+MRmOrn3KhM3fzB
         h16SJJGZwDv39dZaFL9XscF/j1pnOpwZwN2mqfB0flBmeju5ogPzfe28Xjo+D0k4Qfc+
         3L2tQ6WRTIwgETuYlz/GrEmokamlro/DQ8lHmUco0nafkI4Phqvsb6zmiYhlZQrG0q9T
         U5yvMZX2SjoLiydtup/xX9Um2sgmrgh0LU8WC36AWXj/EckmgmZ20hbLho09qCS4NWMY
         6Fy+uNsekovjKLXHGw0+Qes4ubDZHBH5R182IfWU+3ERjT1JoUIavom4k8xUK+hHccKq
         BpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
        fh=ZIGLRNgDNUHQb7IPUTZXPxjMqBjql2e2Jd4L//D3RIk=;
        b=nOwCUC4i7gP8Ex1s4K4dI9tP2BezESKZRmZpMfXGt2JEbeEgH8DIzNDEi+PMpakic9
         DWmOQcNBMNMNX7rPp7bCMofBQZEds4wwEODr7qnuFwp9LyToQfENz72r0iIZbmItFptu
         KAyKktluVtisNBa6rc32/SRy9g5jiWE+8WcT1Dekg6+em+sk+d5QKMJ2Zw2fE4r359+X
         Ha0c35aCwODmKtt/MxPKQSmOwYHKplMZFMgUPv8NwSJpOAHMHfDB3ZzMH8qmRgXPz1kD
         fs4DgervnpZR8g8u/Io0sQlzkgU5T/SJD7R8mH+RY3q1cOioO3LA/K9PQ00fkBJwq6DH
         kzTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063564; x=1787668364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
        b=g689A6PdMapd7GVxh/aPAh2PbNs1ore1C3tSh5hajxXUMZK/ps0gDL7WqOobU1RRo0
         4gvZG0oF4tWxyIlfdlvmKCuPKQlqQDH5IvlRvMNZmJ7YQzzo7bX2WsZmFoZqccjBjlqw
         3RyE5sIXZeQDM4qZdQPfNwQZvYIqqIOpPWe1TEjne6BWfD63y+SpVjUjIJF3TKet/m0D
         Wq29VAnvPp94Y6XxE3M6sPZjhxdlGlXYTXUaNIfDkajbnmVRf2G4dJrWvjUsFrMG3HeQ
         4zKFyKyiDMzDaSPVjXjXaMk2irx55X/sKZcWbMvx9Iz8/Q/yY2NyaHhupjfLD89vAr9u
         zt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063564; x=1787668364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
        b=oCdzMeaLBQ86m9aWoZz7NU23Rk0ayq1BftbOVikLtM3QOtR2iNI4/cnBsDgymcvdy/
         7Sl88/rGPKUYZm+F8ncQrCVgSwxyHAuClcGPteiEJdMUfoqMua2SVNS5RgpBa7SM4roV
         yuvUBQLvgxlvST4Jdp0Td35QYv6BCoFpNZA9q1fOYzxbGbGAXxZ5zF1sH6kOPKUBAx/H
         +8O51rk+wl1B1yZFro2qIiD3W15Nwshp6fHHdMGvhO1bAUvhZYMhPLgeJ0Zpal+R4gfT
         BcOxMT0xAt+1d3dZaKPwiEQyZeHYkeZHuuCTBgpAQGA0Lv6OZXGHbiXgeRTfy+ryCWCR
         0dBg==
X-Forwarded-Encrypted: i=1; AHgh+RoQW240UR2HPemrwGmPhM4NbUKWR+TKRXgXQdp1yooHlk4RGEU8RO0WenTXkvyUjLj/3h6/1LinA8uG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2I8vqjb9fdZasJloDXGFH8dh4/AJ6aDeYHaDayADdlrhbJnt6
	Wz7ubp8TDOYsBEhj6fRx1AtI7tOBnvdqffMI8LTi9zRrCrp/XkZh0GnuRWixJLwGTeLQSzb6KWF
	Jeovk5cAWlOprZjmk1yGZ1b8FTFvWQB0=
X-Gm-Gg: AR+sD12SljI2kSH6Pz1D14Eu4jv6buYxGfKnn4IB9YZMJubwCwgC8EuexRZiIYwdIQq
	Oy7mU15eDKNzc9+SD325ZxdOv/nbhOrTmc0Oh947UNnNX+gmIl07V6MiOzvFDgBFz5mc5M2wh4b
	C3cZys0gqghWBcZGCA6Kwud/IprIXdsByNHxUWGsDW0Jd+0SgZiCqzDn5xErpm3UFPnqhyR2dFi
	8T248Aaqc+OZcyUCn/QQw1YYsURxQPjtI9jMIJp5k9F9HELIS2mpQM5zPNH1W56KkgAJvjH1fyA
	cxpBsHTzmxGhffnF1AVzewaqPbJCS7LqfA1IK/haC+pE0h6ReGLo7csTFCIh6X2QOrpk5l9PHEb
	SEa0yAVsopgAEfBLtN0u5Ech9HWIhtNAgpxcfwvX9Wwl6U/zlY8+yuudbRfloHhc=
X-Received: by 2002:a05:600c:3495:b0:499:873b:471c with SMTP id
 5b1f17b1804b1-4998794fafdmr589623875e9.6.1787063564017; Tue, 18 Aug 2026
 07:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175846.7964C1F000E9@smtp.kernel.org> <aoQMyllxMOpY5sHx@ninjato>
In-Reply-To: <aoQMyllxMOpY5sHx@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 15:32:17 +0100
X-Gm-Features: AcwNN1VJxq7eVCEWfdNgZl_iK0BuChP1h-uLWAWz1h0QEtggQlEtSfG5vXSv_tI
Message-ID: <CA+V-a8vu6d2mo_zSDLi12gpQa12ag7kUnUWx6E6B1843wOy+Tg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H
 and RZ/N2H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Aug 18, 2026 at 8:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: Medium]
> > The commit message mentions that the RZ/T2H RTC variant supports a 1Hz =
clock
> > output signal on the RTCAT1HZ pin. Since this introduces a clock provid=
er
> > capability, shouldn't the #clock-cells property be documented and requi=
red
> > here with an appropriate const constraint?
>
> X5H has this as well but the feature has neither been implemented nor
> tested yet. So, I suggest to add related properties incrementally.
>
Agreed these properties can be added when support for this is being added.

Cheers,
Prabhakar
