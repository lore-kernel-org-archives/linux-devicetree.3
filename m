Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1695B21255A
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 05:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872958; cv=pass; b=Rv2m3JZTKB1zmL8u+KXU+I0sRmacjKCMM7aYbKzC+VA65j8iVJ9DHiMR3Zi987PnvW+9RZFVYlfjoPm2zl8PoLZmuk4NamH+513eaLIyb8HJVg6+FyYG4VrGEVIK6UGPh/AuambGmiRUGh1DArRzv1PU42yH31uLMyCAKLOchn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872958; c=relaxed/simple;
	bh=PpX/DfNN+JlZDcRUbM/17IG5CRLJ4dln0yK2qRlnbws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeplGZ3fnEYNbJPkhhbVmzp8hHuUg9fOClPpNTcXiGKxbdVcpZ2gLUuTZnI93MNCCGQLiOmDFvAti1NZmNJrmm9H0pyE7917gR+iOh99qs3Ro79H09QmBbu44MLZR6imOlS/CXV9FtUcXVRVYFTTkoMtFzCahVcR5/lav9OINQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnm8rR3e; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnm8rR3e"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so8428813eec.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 22:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777872956; cv=none;
        d=google.com; s=arc-20240605;
        b=fIis9mmqZFv7+beQGjk1/OZ+lSDLdzkGZ6PKSdPzo8HRWpjpxv4kZ+SnylGSffBYsg
         w8mGvLT/xgUfr6aneyEq/3Bij13ZN8rPWqcIaaIunNoKwirJJQjE2SI9m59Tnh48iLT2
         pVOuGFKDO2fce9a0IklqeZmUBIz6wA+CzFUyNr5NNXlZ0XNlhUl3XplnqtNZwp3dQrGu
         Ah5+gDjg7wzQ9JmtEiRRmMH5xhviCRYTz+OMKOfF4NiSvwZhV5U1uKcURn5PqxlOf4wA
         7a1AlJWD1/o4NAZ9eBJVGtifocyFxawpCazJp4pqBknESDJhvkm6go2dvsYlXTpanbz4
         i/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        fh=m48VpR2LsCLVed8Z+K+DWB//z2AKFH6ZKT0JUuvRyzo=;
        b=PJN4O4fTXeXGb8nPqy9VklDaxHacjaHwT1hd+hgwQyWSbtgJZO/AQyyfTUqi3RrVRC
         jWYcZ2RYQejY2DRWLgjfhTfwA27Womhu8mdNHcyE1qqGLM2F7TPflNFZydU5UcfE48m0
         CNl4xC8r6X8winzYId7DCmFnZ0HPOTyluBc2w13FpqlWk0jJ+idQ6pH7XSU8hQ5Oeh1e
         gGFHpRqOUWeDkg99qcYFpGxyvQe42vwC2OKsaa0ryHYumycU2QGZJ/ixFg/TyTv33rgA
         86oBI2VnhvJ7aB8cSrngo1648iu4MAfUdaxO47OOZWGTvmipPHsNMv20dSojTVyPGNMD
         X43g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777872956; x=1778477756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        b=jnm8rR3eGBVNrd3NIS5A3I651kNMOQ/T5/9+VqCNHcZULwlLqoZfsB6UTqjkjSEJ1m
         hRfnOlEZnyYnOWq5GqsZ+Prd1lY/T2ZrnErQkOQjh7q8O4LrytGlTT6mWhqoASRW/7K9
         vIIxMDnMT9cAgEaZpflqm/cwinoiBYnPY5zviBZDsAeSIu/yry9/RY7dUACgfNTTC45I
         neWZDzjUX9z1mrWcOcRoMqO9VKJaiC3XNi+yCxZif5vYxdUOzonXBuvuGHIZauVQnibz
         4xuIG8jXSBKWrnLAFe7tVUCfRusLzKEl5GXQxnB7H8XNKucZDVi1yzkXti1W2y81E5ob
         cIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777872956; x=1778477756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1uBbstHeNNetK026aMIZ9O9biz0TfRbnDvaNXtEoNZw=;
        b=s+OxGBrd8aF4jPZGAQCBVc/hyADzHsSsgQMPeX368c7CPqE2FBYcun4BrnbHXJDdnF
         3enkIz4O/X9kNpkQ1HJb+vzq7ldZRNLJXb6ipyGVxkvoF8mXjBrVy4UL5Pjr7UmkBO7g
         37BBeaYWhSzDSURp/kJZT5QuL2XctTaFkZ4sDzJV9lyrtO4ZHmoPBET84wuf+Vpta+Tz
         hNmlT3AkW3d3AROo90vgV9dgmnA87gWeSUQljqCXQZfT9B0zyhTxSuNmPQhl5Z2EXEK9
         6RIQwXYhORrg/dA55bZtiDWM6y3VE666WY0jpUYBg+QQkR3+eyrd/fG76DEywUfK8+We
         r9pg==
X-Forwarded-Encrypted: i=1; AFNElJ9jUHJEHJIIrw339+Z5/vCD4KrqEAscX2Ho2bBUWQu2YJaBhW1Lj9m8YyCslwrXGd8NPWGRBRGk8RDQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYpfmouoomYc7pgSQDV+r7j8o3r8u50N6n4Qj1sfZFP0yzdk68
	lVWj6iRUoL6EKT6kpJTHo026QuUwYvp3dMUtUSmLisIOUvCjc6sRSXRmHv4Ms/KBSVl8oYmbyRM
	iXAL5Yz/8uzrTdlT9ewC2oEdh0XBeLHI=
X-Gm-Gg: AeBDiet3OPejP/360fXGaWO+AXDhadjdKQToo2i0WIh6JtGCy3Jh4rVGBinTG7nA4v2
	+GnOaF8qp7hg4aBtIqG5mSJz10NreRPLTQSHakFJ1lUWiZW1QNQhEsWG8R47oNUrmaxM549xUiP
	TEJMf3xkStTexCX8nfswpbsPw9WV8wLaulaBYIGBnh7xDUxkTmgmPrq7jdhBq2wAE1og7w36n44
	djj+hKu9OikGYiWxiVRDuVeoSiYwTtYuKScbFLZE2ugccrciXvW+dGeRMjYyEu+9y0TlGJyRgBC
	mEvwseh6CSFVWTTcbKc=
X-Received: by 2002:a05:7301:9f06:b0:2be:142f:d499 with SMTP id
 5a478bee46e88-2efb99a10e1mr3875589eec.16.1777872956015; Sun, 03 May 2026
 22:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com>
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 08:35:44 +0300
X-Gm-Features: AVHnY4IMnap_ID5NH1mOwy7Jn90ifX2mwZC9TXCzuL0FMjV669mX99tEoP4MgoQ
Message-ID: <CAPVz0n1n1qrA=VdCGCwYcGFBfN6aaTULq9OKVa5=mmHMFNkDvQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] media: lm3560: convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 3 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 19:44=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
> Remove platform data and switch to OF device tree bindings.
>
> ---
> Changes in v5:
> - schema adjusted to take into account lm3559
> - device_for_each_child_node > for_each_available_child_of_node
> - lm3559 and lm3560 configuration was diverged with data match
> - removed redundant header
>
> Changes in v4:
> - fixed current being off by 10 in schema
> - label property from schema replaced with modern equivalents
> - lm3560_init_device moved before subdev registration
> - v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
> - added subdevice cleanup if second led registration fails
> - added check if "reg" property exists for LED nodes
> - added missing fwnode_handle_put if device loop fails
> - added bitmap to monitor configured LED id
> - added pm_ptr() macro for PM operations pointer
>
> Changes in v3:
> - added note regarding lm3559 in the schema commit
> - lm3560 power on/off functions converted to be part of PM,
>   dropped redundant wrappers
>
> Changes in v2:
> - vendor properties swapped with generic LED properties
> - added mutex lock usage optimization
> - power supply and enable gpio commits squashed into PM
>   configuration since they are both required in making
>   proper on/off sequence.
> ---
>
> Svyatoslav Ryhel (6):
>   dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
>   media: i2c: lm3560: Fix v4l2 subdev registration
>   media: i2c: lm3560: Optimize mutex lock usage
>   media: i2c: lm3560: Convert to use OF bindings
>   media: i2c: lm3560: Add support for PM features
>   media: i2c: lm3560: Add proper support for LM3559
>
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
>  drivers/media/i2c/lm3560.c                    | 385 +++++++++++++++---
>  include/media/i2c/lm3560.h                    |  84 ----
>  3 files changed, 481 insertions(+), 151 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
>  delete mode 100644 include/media/i2c/lm3560.h
>
> --
> 2.51.0
>

Hello Sakari!

During preparation of this patchset 2 important issues were not
tracked and discovered only after sending.

1. In "dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver=
"

flash-max-microamp and led-max-microamp ranges of lm3559 and lm3560
pattern properties were swapped.

2. In "media: i2c: lm3560: Convert to use OF bindings"

In the lm3560_probe struct device_node *node should be removed and
for_each_available_child_of_node should be replaced with
for_each_available_child_of_node_scoped

I am sorry for this inconvenience. If you find it suitable to adjust
these commits on apply feel free to do so, alternatively I can fix
them in the next iteration.

With best regards,
Svyatoslav R.
