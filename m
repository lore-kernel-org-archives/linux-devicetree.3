Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568070;
	b=XtNmXV2PUdC5u0De6ZAmPc7fGyX/1sUbDj+phX8AErLkM9aVDgNFbffmiNgDrBWQzVQR
	 CHaD0jlYg9y+qrCiQNnjpwh+iTN2c88qVc/yfEKdOYz+DvFx1ft5IM2OsbrE+W1andPWK
	 l19ULN/Lfqb9MNkXkP6gikZzO2f6Bm8Yr9eVmth7wVsIu7IABELqswVEj6OMFKqeQSl5P
	 0spFOhBdZuoBR4TFOw8CcJp6EWQ3unqliuW1QVwF+D6+vNisTXgihFeoZUJ/Wmy4sjcnM
	 vSaUbVlDv/wpnpSapQXE75XJhuUo4AL/WBJ388CDa6mSPUT9y0Nzp2GamM4QnF1PqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
	b=DZpLqEdXMN4LmVSNrVcIb4Orlrb6Ban/ZBxMD602uAj9gFGboFHasXIMtUU0/rriJ9FL
	 U9ugazp55LDYQIAmDf4L4sj9j/jprdu5gHEEPtNITcVwjRG9Qx7iLxfaaRI0BI6j9TKh/
	 wSRfFcuS6WVGEn08Luvg0QtboHzfbPdaAlHsG0AsfOxDe1MTbjW1AeN+HhLBjCX75tEKj
	 zB96cGu8J7g8MfPT4UXTfcVSB15eElw1/RWXn27hJnOc7nXwokaIN5R/b2LudNERG7Bdd
	 JkASShDYIshHYFupqBhtFVU3fTbCyx6e1DGtW9CAhPlNXlLcOY7IILRIOIOcwfqZC4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JhogpMEk;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB1D606A324
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB1D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JhogpMEk
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e30c26a4so679589866b.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 13:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793568068; x=1794172868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=JhogpMEkv+FoWvK7Coc0H4rZVOFmpCkZJ6gDJNKshnvRSv1rbQtk4NClEqtecJL6w+
         J+aT7FhozqDtuaggqdpy9YIUBUpU5rrdac7tx4LAkTfdQkzrHpKG3RWv+ubW4lwMcF+f
         8/zvPsk5eesxT9Zaqn7OTli2zMCPBSjd0fy6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793568068; x=1794172868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=FS4arZy/87O9nEqiOpFM92V4P5eJRG1eR4JKaX7NzbZiSkUfSLpXbWJeMDgUxsJJal
         b0MwDUNI9kd0Cdw4GDStHFrtOiiKBhiczz8IzSWB+rElWGiJIr+6APe6yxzyN5IvjSik
         OaSh10KsGrUnjcgtH2R17/pALUXePXSvHGt6fOaCskeAM0JGahV7i57AxUfLgEIVsrHG
         6K/IQEAJo89GkzKY81TjmwZ16U8pvEYWyAO6Sx5wQzWOGyH5qrGviWbE9kXqJuInQmdk
         BDnN+CjFaP+dhCI1Cxl0CPx5pub+nrl/ZlzjQIqiszulY0Rv9bjkDczZq2n8a/TOoGyF
         20mg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2uy5Yt0sbEl92ilnYbvLCuX15EvZ19QUFGTSD0+A/uhipmlvcgj8jtNyGqWszg82xXJpH50GgX90@vger.kernel.org
X-Gm-Message-State: APuU4Z+UTXMNLhppgC/LowGk2rJ6r38LN7s/S0dRNrsRM04eztoveVvz
	kk2cf8RvUqaRFxNMkDhimqgTeCUhyI6pv1Xy5BDV6iYSu8mtcf259uNxkKRceZh+iUVhXLXHvTB
	lDhc=
X-Gm-Gg: AYBFou22gycpT587Vp7upGaeUC6vWOKixoXST4cdiKAjUQSayEvR0M661H56uFQSpe9
	bb4g3x6ot5cKfuEMnGmQvpHwSUIejIhaBXGldTGBTeiNXmk2SFirkBlDt5BQE/6QXGU8NcSpiXH
	QqJEhM16Adb29JnBPupmsXZ8bUIpLdKlfcswTt43XssT75qO7nbumjPnJpJSey42nFHwcqPHPqa
	bBAsINsLfwBlXoh5O7Orlu2xXwHEciJjd4dB1VjI+pvm09qGUDPIIYlNxRI85ph+Cgd28LLlIrk
	X1Ar6W1j7y76pi+VkcKK47PZhVTUIHgFX0Yi4pKyl4i5YoR4RSQbftJO8bAUzuR45f1fD3F2Xx6
	iT9hfnGeg4CUHPpqFA/TZkme/TYRFHwpqebVrfEHbQtHWwS8byYO5Cn0ccDZLiV0hg2ZcxoONCg
	r1IiImW88QlPzGma4zpylEoSkiOMj3bHvAnXe2C93K3JYUxvG2LKJkag0GIBtfp3spFJXlX0z10
	OT6eRIfvgNc+wPyFjBgeFP42HUxvXE0yRNQkcTdrMWc1BCkw+VTD/rmksZUf9D9ul044YdpRrrQ
	ZnzN295MOhZPz6pQbZFo5zzRD7qTWdjkhkMEF69TdL9OQP7pA8tQBXaTpySsyje7ags=
X-Received: by 2002:a17:907:9410:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c4ca7a6aa13mr676400066b.11.1793568068586;
        Sun, 01 Nov 2026 13:21:08 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm314473166b.20.2026.11.01.13.21.05
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:21:07 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1254778f8f.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 13:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxr0XfAFPCh7QM/B8dwCahFSe7lI0FCzOOoXFy9QnaGmfR+mt6Iyn8eZ1tKyq+sch7GrJgxgaQc6baV@vger.kernel.org
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id
 ffacd0b85a97d-48e6e2db4a1mr23331343f8f.18.1793568064814; Sun, 01 Nov 2026
 13:21:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com> <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
In-Reply-To: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:20:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
X-Gm-Features: AclHuK8iDQf3Hi4FgB3rVtlO2TSTt5l2todvm4T0h7_4dZ5xTXqg7HY4PS9Cbco
Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
> > I think that was in the the "after the cut" part, where I said:
> >
> > You can see the fdtfactor post at:
> >  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.or=
g
>
> OK, that covers where the tool comes from, and the question goes away
> once fdtfactor is imported. Text below the cut doesn't reach the git
> log, though, so a sentence or two in the commit message on why this is
> wanted would still help.

Sounds good. I'll plan this for v2.



> > The goal was to make sure that we could fully reconstruct
> > __local_fixups__ after applying the overlay to the base. v2 of the
> > fdtfactor series handled this more properly, and I'm planning to see
> > this through and land it unless there are major objections.
> >
> > By default here, I'm running fdtfactor with "-S" to strip the
> > __local_fixups__ out with the assumption that today people don't
> > really need them. However, someone could easily override that locally.
> >
> > I'm a little unclear how things would silently produce a bad overlay, t=
hough.
>
> Sorry, I should have been clearer. This is about overlays which kbuild
> applies at build time, not runtime ones like Beaglebone capes. An
> entry such as:
>
>     lemans-evk-camera-dtbs :=3D lemans-evk.dtb lemans-evk-camera.dtbo
>
> is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
> make_fit.py path then puts in the FIT like any other DTB. There are
> several hundred of these on arm64.
>
> My concern is the input to fdtfactor, not its output. In the in-tree
> libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
> __fixups__ to resolve its phandles, then overlay_merge() copies only
> the __overlay__ contents into the base. Only __symbols__ is merged, so
> the __local_fixups__ in lemans-evk-camera.dtb cover just the
> lemans-evk.dtb part. Cells from the .dtso such as:
>
>     avdd-supply =3D <&vreg_cam1_1p8>;
>     remote-endpoint =3D <&imx577_ep1>;
>
> end up as plain numbers, with nothing marking them as phandles. If
> fdtfactor needs to renumber them, or puts those nodes in a per-board
> overlay, it cannot tell they are phandles, so the overlay applies
> cleanly but the links are wrong. Stripping the fixups from the output
> with -S doesn't change that, since the information is already gone
> from the input.
>
> Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
> If so, composite DTBs would be fine once that is synced into
> scripts/dtc, and my concern goes away. If not, one option is for
> FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
> the original .dtb and .dtbo files in the FIT separately and the .dtbo
> keeps its own fixups. Leaving composite DTBs out would be a simpler
> fallback. What do you think?

I think your concern just goes away. ;-) The fdtfactor v2 series (and
soon to be sent v3 series) includes a bunch of patches to the overlay
code, and this code produces a fully valid __local_fixups__ in the
final dtb after an overlay is merged in (assuming the original dtb
already had a valid __local_fixups__).

The idea is that fdtfactor and the overlay fixes will all land in the
upstream dtc project. Then as part of this series we will bring both
in, so we should be all good.

-Doug
