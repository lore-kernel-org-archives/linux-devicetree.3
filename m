Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570724;
	b=CHaP+EKj/FvHVIoE7MQKX8gpByfEXQnfjr9AUa21a/2CWPDc04goilXR3oIe1QRxXQlw
	 TXRK4r0RJNi85cN1q0gTJnf17dCzvY7G2JCzv4C8SkRoa8wrX+PTdBNQRDB+W+bHuciXq
	 UmdEhZ1XzSWoabfA3gsQGmmwectR2VUrP+53KonWGexXjtpiyUroqHE5WzonFfRLvYPqd
	 spKvD6uSsviYsV/1GJgLPOjhVE6MRbTEzKHRxAtXRd0wmpriHObIpYq+4vSrxTr7TT2bS
	 onvUGNSmQgPjL0IKBqczc4n5G8ODlTT9eFthyWhD3S2ygjjOiFTaZHglHFKxQSsI0cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
	b=SmpQs6fAwgz1Z+k/+XwVKgaZ2+rpqz9xqs+I60REPYLkLB9bpzFjDE3JycQu1vmeXwAV
	 uIVzJ2ts9K4VY3l2nuKW+RapKKiWNBac+TPFRSu9HcHzbhLYrkbI8uYrLWeiHZHWY2Xyk
	 JBDQQCoYjU+XD4T8HwIyX5+ymx5mDaj5J2A51ZW5xZv6iIWq9VegllqszGmDH/mRdVpsH
	 Q75fV26yPEyivJn8eAwo0rW1Mocwm+t3EVe+JM2GyFloLhJL14MstptgFI03FEgr7BD8m
	 BElG46iPWoiC5VALxrAQMHVmpYpUTw2OTPtTQEzj25MzC3tAPcwtOa/F/vECjQSKoXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gWdW14sR;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67851606A32D
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67851606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gWdW14sR
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso414447066b.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570723; x=1794175523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
        b=gWdW14sRRjPEIBTdCNyZ7vZzQalQ+F83acQd2MJ15bh6ab5fu5ikYRHCHEOWwcZSOe
         QP3hdqO+tE5YcZ8AU/994D1G1AMqFOcDuZ589uchCWpBccKbg0HoRLP2WYFahGYUKXXw
         wMr+yxLuQ7cY9evakQqdqN95UHcYncq0K0A8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570723; x=1794175523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
        b=abSBW8jOAVKBIg5kea9cpd3NVBqAPAS4xEi2fQHN3RUwluI1WsjW+06CLeTANqZgdK
         9H2GzWj21cH+flkCTJtTPoRzn8xrPJR5CmTLtFWLmBdfEkodY+/Rg+pP58jtp00JPEfk
         5feiQjt2EiupDlbM2ICmfYfr+kXx8/4JqqIUZAp/MzmAySqa4IWm0TxXYbPZpyxCd2Tl
         qWyjB54J2SFIbJf47NJFtCXxPCJk2k7Qe92r9vXTTXVcXu4SqscB/P4fa6rpwXXKqkx1
         Hl1XI94T3rv6PFNa1rz+R8yY2nA1gY6f13Y3aGtDzmucz30LnsnhBIgEscdxyVigXu/3
         P93w==
X-Forwarded-Encrypted: i=1; AKwUvByPOueRfnkaIex2tm7H5uBtiT8f2pCTYEUv+TzyxsHdnorc/Cfj4XqD5AMzt6vkUz0R5+OJVWB79qY7@vger.kernel.org
X-Gm-Message-State: AFq9FYIWQevlpbnSM4kMNzzqpUpj5mLSHzU7qzTL57sHmbOKdT5zcCvl
	QbeZ+WmkCx5ed33hmE7mX4A/XlWaORsI2cixeS2OgrK5SNPLKTfvin8FFZTlFeBrb+aJ93d6go4
	fUn/Yh/Uf
X-Gm-Gg: AYBFou3HFQrhYa9cYQlo8U2GgZqsWO6JCeXsX+Jr5hVs67HTdU0+qGdkXgoA6JbxfSz
	jWJ6SEfEuANsJmv3wh05G3syWsnc48+thQMlqEXKJGcJHUAgyeKIa8HFd48EPt9xr+7pi4+9Pqe
	VWzZUAmLG5MJGj9qDFrEbvWAo+E2Bi6g9APsTYdSSLAa3HUa+obPixCZOxBAMkDqR5kPLIJ+pB0
	EwkZC58eNyU1lNXUoCoebHmngS6uiGX91ygBEk43wRZKHk8Yi9NYmErahQAHYB2WndEAzZ+9vuQ
	8pgYmx3z9/O9l2lOD2zlFzEwpgc8HifWgd7I3MZCj40FRzGpPbuvtVDCI0qwZwyT9Q/Z8IzTc/k
	JMN1OqZ7qLc2B0+0K7+JrytAay4pBYHLHFYElA2BTCPPrudflKKO/KALTSq/J7q2vQGptoJ4YP/
	FW36AGsASMgrZNkBLQW4Jp54Of7hKztKrDH8XhSR6R3dcQ+n+PDxb7gK3Aj/jR7w/Bm0tuO8nv+
	hF+2ZRTLwuCskmRtuSPyO5rXKJ3d9WhW/BwPX1JXqSm5RDbbvYpyazKLh5MEioKuxjuaT7/C5eb
	ZxuLaTYMYgd4CsNrIpjdcMavLVKjU7JPgM853hD/5EkTwvMPcRtmweaJ0hlmAVgVGLY=
X-Received: by 2002:a17:907:3f8e:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c4ca7935e6emr609468566b.2.1793570722943;
        Sun, 01 Nov 2026 14:05:22 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf32384sm324042166b.84.2026.11.01.14.05.16
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:21 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so17514115e9.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBywe/qxv8TnFpBKpjK/7bslCENEhtbt5yhawJoiGvbMIOwT/NkRrruKHcza1QncQTnu+OnSxgIN30rK@vger.kernel.org
X-Received: by 2002:a05:600c:8b0a:b0:4a2:191f:7cbd with SMTP id
 5b1f17b1804b1-4ac17191009mr194305115e9.11.1793570715202; Sun, 01 Nov 2026
 14:05:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-6-dianders@chromium.org> <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
In-Reply-To: <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WRaq1P5E0Ahpxnm-4RBt1Jm-WdmsArATGnDSx-ZY=gtQ@mail.gmail.com>
X-Gm-Features: AclHuK8vPO0SVdKrca88D1rHTJSemg0l_zF5g5bNVXQTK_MW_PMrAwjFBN9toEk
Message-ID: <CAD=FV=WRaq1P5E0Ahpxnm-4RBt1Jm-WdmsArATGnDSx-ZY=gtQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> On Wed, 28 Oct 2026 at 15:56, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Tighten `overlay_parse_fixup_entry()` and `overlay_split_fragment_path(=
)`
> > before reusing them to update the base tree's `/__local_fixups__`:
> >
> > - In `overlay_parse_fixup_entry()`, store the `strtoul()` result in an
> >   `unsigned long` before range-checking against `INT32_MAX -
> >   sizeof(uint32_t)`, and require the offset field to begin with an ASCI=
I
> >   digit (`'0'`..`'9'`) since `strtoul()` accepts leading whitespace and
> >   `+`/`-` signs (wrapping negative values to `unsigned long`).
> > - In `overlay_split_fragment_path()`, reject paths with a trailing slas=
h
> >   after `/__overlay__/` (`rel_path_len =3D=3D 0`) with `-FDT_ERR_BADVAL=
UE`.
> >
> > Assisted-by: Gemini:gemini-3-pro [edid_decode] [gerrit_and_build_artifa=
cts] [gsheets_gdocs_cli]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  libfdt/fdt_overlay.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index b7dd8fd922eb..a19eb1bc4bd8 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -376,7 +376,8 @@ static int overlay_parse_fixup_entry(const char **v=
aluep, int *lenp,
> >         uint32_t fixup_len;
> >         const char *sep;
> >         char *endptr;
> > -       uint32_t poffset;
> > +       unsigned long poffset;
> >
> >         fixup_end =3D memchr(*valuep, '\0', *lenp);
> >         if (!fixup_end)
> > @@ -404,9 +405,10 @@ static int overlay_parse_fixup_entry(const char **=
valuep, int *lenp,
> >         if (!name_len)
> >                 return -FDT_ERR_BADOVERLAY;
> >
> > +       if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> > +               return -FDT_ERR_BADOVERLAY;
> >         poffset =3D strtoul(sep + 1, &endptr, 10);
> > -       if ((*endptr !=3D '\0') || (poffset < 0))
> > +       if ((*endptr !=3D '\0') || (poffset > (INT32_MAX - sizeof(uint3=
2_t))))
> >                 return -FDT_ERR_BADOVERLAY;
>
> This is more than a clean-up: it fixes an existing out-of-bounds write
> in fdt_overlay_apply(). With a /__fixups__ entry like
> '/fragment@0/__overlay__/node:prop:-4', strtoul() gives -4 as an int,
> which reaches fdt_setprop_inplace_namelen_partial() as idx =3D
> 0xfffffffc. Then 'len + idx' wraps to 0, the 'proplen < len + idx'
> check passes and memcpy() writes 4 bytes before the property value. On
> 64-bit, '4294967292' does the same. Overlays may well be untrusted, so
> please can you split this into its own patch at the start of the
> series, with a commit message that starts with the problem so it
> doesn't get lost under 'Prepare ... for reuse'?
>
> The real cause is the wrapping check in
> fdt_setprop_inplace_namelen_partial(). That function is public, so any
> caller passing a large idx hits the same overflow. I suggest fixing it
> there with something like:
>
>     if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - id=
x)
>         return -FDT_ERR_NOSPACE;
>
> and keeping the digit check here so that '+4' and ' 4' are still
> rejected. The INT32_MAX bound then becomes an early rejection rather
> than what keeps memory safe. What do you think? A test in tests/
> checking that fdt_overlay_apply() returns -FDT_ERR_BADOVERLAY for an
> overlay with a negative or oversized fixup offset would also be good.

Great catch on `fdt_setprop_inplace_namelen_partial()`! In v3 I've:
1. Split this into its own patch at the very start of the series ("libfdt:
   overlay: Fix out-of-bounds write on bad fixup offset").
2. Fixed the overflow check in `fdt_setprop_inplace_namelen_partial()` in
   `libfdt/fdt_wip.c` as you suggested.
3. Kept the digit check and a `poffset > UINT32_MAX` bound in
   `libfdt/fdt_overlay.c` (mapping `-FDT_ERR_NOSPACE` from
   `fdt_setprop_inplace_namelen_partial()` to `-FDT_ERR_BADOVERLAY` in
   `overlay_fixup_one_phandle()`).
4. Added tests in `tests/setprop_inplace.c` and `tests/run_tests.sh`
   (`overlay_bad_fixup_negative_index.dts` and
   `overlay_bad_fixup_overflow_index.dts`).


-Doug
