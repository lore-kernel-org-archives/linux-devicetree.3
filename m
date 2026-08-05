Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE6325726
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881732; cv=pass; b=ESbDNgcjxZX39ZUmGGMPQrr0Fg/hHQczLuyPp1SBSD2x5pJHfiinimX6RSSqu5RpG/d/ukfSbTll1Ww7nNsrfGV3bTf0BlL7ZY0VGZn2SJmudDW9EQkK+0bfu9dWB8HHbeNYIFB5LGGPBxh5LL2medhhewk886tyQ2Pda1hqZxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881732; c=relaxed/simple;
	bh=ef3eP2ZfvS4QgihgygcbC4UqPqMKPMjYnWKL4nfyJxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqdCrbjy4UiKS2bPFdwNwduEBQwHNzEEzCxYBYLA+5hIVqbUG/wqo4RF8VkaCDuU8y17ALxw3u7G16uCSQLJDfHbTtJGdNJPb7zYramc2eaTPaP0HHNAA5JHiZP30bz7ExZrf4DU2kCX6P6DX/b4rYvYUR/d8Jz3gIVkM82rT/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/PJL+1o; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/PJL+1o"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so145006a12.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 15:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785881728; cv=none;
        d=google.com; s=arc-20260327;
        b=o6s0I+Se7uLqGsMZhyNQWyp5lRDz4HrwNdztzCKArrvFOamhpyQUcOicaTFRcksEVv
         EDttBbAjlvKvGjzMH38+p2i7HPp+wUBV79PdMW5vwudHMtuPPbSOlTQmmJkJDGpYo44e
         NFpd/FdLE1xL0f6HdH2w2G3qWSFATMd7jVThiid6ocxROF7YoxWiqyYH9SIN4U5r+h6w
         MwgNF2167l/GMaX4uvwcSqpdC5ziUzPofx58HWLAgncRjf2sLXywYoZJNEEdL90BguBx
         0kDWLr/4E1fF7EbivvdQjV64VBGXfrBL093IDdzqycxS3GwVSFr3JdIZ0n2pKZWnlk8v
         JGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ef3eP2ZfvS4QgihgygcbC4UqPqMKPMjYnWKL4nfyJxQ=;
        fh=x6BkbrO4H5AQDx1Gl9cdSTYMNGp7F9hzw87a+JzAOX8=;
        b=HcC1CxwcBxzjUnpDAT8KQya87M7aEwK5TS6Sd07vk5pycmCIxlsv1vrh4P0hkaPUW5
         0MrU5bMLJXQ3jJ0kh8MPb0luxSDZBjPzaJCOXXLFt/Dx1+ihnxUEDEvKSQdjzo4/yeoj
         I0GK6mhZIC9FbrUDEFqwulbhUsz6uZ+24hhJYZzB+riQLACACefgS586oOz/gd8iXFQR
         NLVR93SkDbE8X0hsdiJ8fGgaP1/UEvhhkAnBZvWFjYPG0boG+RqXYlbUhMJXZPqxPLU/
         kgd3UZflAHIO58HBB7XKpRLRlfOrvBE9uI0i7gHcLYJb/WlVdTm4Rqo3UmBY2LgHtfO8
         oaEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785881728; x=1786486528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ef3eP2ZfvS4QgihgygcbC4UqPqMKPMjYnWKL4nfyJxQ=;
        b=U/PJL+1oE0dcUkU8sgWS74BBDvtTojCsLYFO4TYVNL+SO96zN5q2w0E07Iokg70kn0
         jo70X3nttFJudn1F8kOj/oiaAlWaf3tXtvxGeQx8KcmFr8vEu5tMwubfyEbMs8HKmXjL
         4aHdN+aAlE8eEb6BDNUIjtVbUCY/NxaK9gJJHRFLh5qOs8gnBjWThy+5yjNptkrPydwP
         1/Cfvt27gyRDIIZ1ZPbH3mL15Cg76jzb7Qd1t32nUPjS2kvtTpNAyFM2lBGK8DCZLmMI
         wQYpFP3l/0Ue1eawz/tMV0vHpt8CivT4CBD3bn281qi3mueSvrPwxTyaG4vw6Mmp7tGY
         DJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785881728; x=1786486528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ef3eP2ZfvS4QgihgygcbC4UqPqMKPMjYnWKL4nfyJxQ=;
        b=LTHhqmzxWXHGvWvQVzd9IIaHZY1UeavV03vYfsl/J/DY3WprsS0V3XzODsyhPdQFbG
         aknMOEZ5FD6C9/rgmLtgetouf3IIyBlK2iwt/0a7OdK45AIETPqOfwM6p0BAK3/rySY9
         kA7hn/zDcqP3tVNaQEW5q0PCr8SlKU9PpA9Qr88eyJFNI6YiAGJrYnfNsvrZ4j1iGhpE
         EuGRHHKbdqybDhQF3YIhOtmugf7jO5XEsc68O8f+z3sFJ8mHXB5CDj8W7559YlzcuOWI
         +notyFkpaUDSFvNhTi0yfl24JKWp5WH6kdjnhW1zvAtlyjsB4Os5aNFYdu+wWhxwdfAz
         W/Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrJ817K9rr/HCJ/fO45FW5uNKnp2u8Aa1DRbwDykNG6alIu1hbwrxQaWIAhvm2o500cB0+ZSlVHj+EU@vger.kernel.org
X-Gm-Message-State: AOJu0YzBeV1Gg16YqiUCE79a95GwbQtwNTpsWNGqYnb+AC7qKFwc2CkO
	DihqqRY++m91B/LFhOsReczhEEtT2ltdcE2tTeiX7BlxQ/2Rcei6rb6SrLEOYfH38WzR6gXo8DW
	oxl5GZCG6gZ/cN76tPPUNo1czRV9fHBeNd8rW5qY=
X-Gm-Gg: AR+sD12GupJ50kYIo8CwKerHsaJqqDEMfOIdbjDzB/NEduTgRg2sE6Oop2zbUrU6QZE
	kWWvi/Q+7lMVHWsVzVDO5rlh8wCfqweoAESQeJbeUR+eOkj9duY91HqpYdIzg0eEyz3CqOhN3e+
	6SzFKvQhVlj9RcGx/Pbn1htojlrny3yboobjTvMS42o+IhxO0CWdMRh3sXF9amWpMGClstVgpvz
	1ZuKacDu6/hmpSFA+zCP3P54UWt6O8hPD58xaNolT38TU4UZ1X0AKU8JRb/0Cs7vDnulpUXrS7x
	ANompCM3i3VdpsMPC6sKNdq2dgthmiPNz8+t9rTiSkRN
X-Received: by 2002:a05:6402:448a:b0:69f:b52e:7484 with SMTP id
 4fb4d7f45d1cf-6a14f254d4bmr1202877a12.19.1785881728391; Tue, 04 Aug 2026
 15:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804225617.264861-1-maximpedraza@gmail.com>
 <20260804225617.264861-2-maximpedraza@gmail.com> <204c2805-346d-4935-8e2e-1538b79ea995@gmx.de>
In-Reply-To: <204c2805-346d-4935-8e2e-1538b79ea995@gmx.de>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Wed, 5 Aug 2026 02:15:15 +0200
X-Gm-Features: AUfX_mxQbUNLor7Pu65Fya-T6kupsatV09gVQoaRffyeGIYc9D-fDFpjiNF7eXo
Message-ID: <CAEUXW=E+fcewEHoOan49f9TS4EHq8u3j1+ac0rSYXv+7TiP8ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: add a device tree supplied
 boot logo
To: Helge Deller <deller@gmx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 4 ago 2026 a las 23:18, Helge Deller (<deller@gmx.de>) escribi=C3=
=B3:
> Instead of adding logo-centered, couldn't use a value of -1 into
> logo-position.x to mark the logo centered in X-Axis (and .y=3D-1 for
> y-axis)?
>
> I don't know if this is better or not though....

It is better, and for one more reason than you give.

The binding as posted says logo-centered centres the logo "overriding
logo-position". That is two properties where one silently wins over the
other, which the schema cannot express and which leaves a device tree
setting both with no defined meaning. Folding it into logo-position
removes the contradiction rather than documenting it.

The per-axis part is not just a tidier spelling either. A boolean can
only centre both axes or neither, so "centred horizontally, at the top"
currently has to be written as logo-centered plus a logo-offset computed
from the logo height. That is impossible for the reserved memory form,
where the height lives in the blob and the device tree does not know it.
With -1 per axis it is just <(-1) 0>.

So v3 drops logo-centered and logo-position becomes an int32-array with
a minimum of -1, where -1 on an axis means centre on that axis and any
other negative value is rejected by the schema.

logo-offset stays, for the same reason the per-axis case needs it: our
own panel is 800x480 with only the bottom 320 rows visible, so the logo
is centred and then displaced, and that displacement cannot be folded
into an absolute position when the logo size comes from the blob.

Thanks, this is a clear simplification.

Max
