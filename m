Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570708;
	b=c9rPs2EJ+DB1AIA/obeJeQcpxL0+TGZSsUi4gWny2PUbD+edHpcdeIBqkh2+T9ELTqwW
	 XrOOGKK4WUrvXf9D8nYiaaRDx9RAaDlG+rhp0Tu+5Z/kPJ9BDaPTc8K4FtrJPMZ7lKZ7r
	 YH4Kjbd2Z4M4l+u2T0YHglUGk5qYfgbUxHDl/IDVrYVDb4+2f65mSkW6GyoLU1joQSsU3
	 u0laCMwqGeGF+CQtYxS/XcVMl53Yqy7bsWW7QRlGPSmMRHsxTrWQGOX9B84+u+6Gl5j/d
	 qMonehleM97sN1vlGsvOmeOfZU2YLM8608wPyBxWd7tlVdMxTsSb8l34hhme84CkoyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
	b=ANdiezaJW3c2yLxneviXai4O2nmZRupgJNQwjYpBCVToa/A/DDP/NGMu23ad+6kWwXAL
	 B9X7TD1K+Dyhxs6nJJz6jn/kF9HldVk7mEPcOTzT3+uB0FlVPv6BS4pKIATzcZvb+o410
	 sa2IIaZuzvYk1dJBwPebvP1EwWQ6LGzoG25qP2FbhDOxVAsmzKNkJQ3SsHtyrCqVRa6MK
	 Dc6rBWwkRnTDdDwS1B1pS1clK5n5qTrTq6vzM8VcbpbSbLXv3zFG3Rg3KUFx2NN867EHR
	 SzqOjBIVw7sW9+F/BqBdWXh8SRMUTjlWIrL2QUH+JxGKR3IfJKi0haB0goATrAs2tMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fh0hALpz;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473DD606A326
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fh0hALpz
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so380279766b.3
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570707; x=1794175507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
        b=fh0hALpzqhcKmOVP04mtx5INd3tp4ecNWRnHNAzz2NvIIN+k9l0GswmLMN/Vuff+eB
         Sb26FnQ3/Ku+0TWdMGsgb933uQqPET/XEEfV1BfwMldHObXENUr/3y/VgpRQtrxqj3yH
         3sQtL938w14BudgKLhDSYPZWYlC354gbDG24I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570707; x=1794175507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFyk01eVFOp6/1QOM1CgFjRZU1l8aTMWLgQJiWpehTo=;
        b=zPcol3ozB8iUHn2vLANyqVKLSQEjealuWwDN4fU0BA+xQb+mJCdkP+8CeeJHMKuCJh
         ABDZpooMq2JtA7mQsxH2mC7g5xrM2UXzOCA4EDj6GML1NLRWRzFcIZhsDpK9Rjd4T4+P
         hDsoztuVtlkXQ06SUHHzMHEaEAUDmijdn3CeDEixmwBfSIKltAue2Hfvx60zG9+UawXU
         dHQjUetTCktDsj3YRB71Vb9CJMxwnnftFiogk5KYRKAhCew5IYtNaiSKRABlmgEuAe04
         jWt6Sl+dUIY8rgM0j5f03McVqgooI3ID1q9upMwrKrTunsF/dPkjnYGsylIrilBcPH9Z
         F8Fg==
X-Forwarded-Encrypted: i=1; AKwUvBw+l2g8fobwajV8QB9kFlvdfP4XQ10/FKcpYg3HYp5bR+FgkIfqpVc+cPpRI/lO22pGbnouhGGO8BEb@vger.kernel.org
X-Gm-Message-State: APuU4Z8cZIBTBUjwRMV9rGHRfXGlq6qXp158JTS/khXH3/HZO06sIkf7
	dCHljLGflh3um828988yVLKQ3lsgNT72yASWGCHzy1L6IqoIh0ukvvTBSBJAKpf3W5B1rHsn5e1
	plapuDdm3
X-Gm-Gg: AYBFou26XEYkcQmdvECzYqBIgkPelsmPYx4PEh2Brf+/1tB7T4MZNWIY7he9w47H/2G
	y7iHBNvIW0vCmsERbi7WbbaF5rZzk1NpWI7b3rf2T73OXZyNMVNhYE//7dDDdn3BySP3pnfUsq+
	8iMdSv0cLfEEay94EvnH4QpufzEz37sM6VoYaMbuzDlhqVoq59ID3jD/VktKJeW+ILI/+LRUENA
	aVZmbmLNcQPWX/wvjnKhobEZVJo/ij78gQmggN1R1vC5ZpkJLTWbPws7DXQrh2MPz5apqTYtP0U
	+mpIws/t2iK8vwdXwJOLMoRunGOZ04v4rMzr7zOhxLwAbtL0cLxh3Lfuxdm+H2D4M4P6uEeaGno
	0USz1MSipkN6VW6SiToIkIgTsbgs32qB1FGDVUu2pfg8CnKBD8taT3g9ItsnL2/28AYGAohoZzg
	vq3a+D4xS6/X7LJ95huLgQMIGU+vH0O9rySathkgqT9DVdZirCThPSmNM3twkqTHEG04VeHgaPT
	CZv3bFysoyA3Fm8C22yl1OPwrAzkzbkcTVcQxyEuAWsNxp5KiTLhl9jOKMVMjHIZnt76uPbttHi
	D2wFWQtOgh3nqrfx675fD3TwExxWhDgbyJDO205ix+Wrwt3x2e4vWQZ3bv1+nCUl6FHUkDPywu9
	DxazlSUoO9NWX
X-Received: by 2002:a17:907:2d25:b0:c41:1e13:8896 with SMTP id a640c23a62f3a-c4ca7a7586fmr671450266b.28.1793570706761;
        Sun, 01 Nov 2026 14:05:06 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa07sm321778666b.63.2026.11.01.14.05.02
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:02 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14363245e9.2
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwf5UdHVZ3rMEiEzu02kJ6TrywHs/CkX6te4sMiIRKlQunRtYYsK6Qz4Vf63ceQCkEi4xmJC5EdAzFT@vger.kernel.org
X-Received: by 2002:a05:600c:1987:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4ac16fa2edbmr193511235e9.9.1793570701196; Sun, 01 Nov 2026
 14:05:01 -0800 (PST)
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
 <20261028215600.1713475-5-dianders@chromium.org> <auQXQU974oMkWe01@gractus.seuss>
In-Reply-To: <auQXQU974oMkWe01@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UmpZPc=CzrQdE0FNxNcqK2VyRbyWy81_0E6HWfZ=es9w@mail.gmail.com>
X-Gm-Features: AclHuK80IahgGAWhxdJr2Lp66ILPi_cbUp_334UE_M06wTdmny6SXo3fYvtRZmw
Message-ID: <CAD=FV=UmpZPc=CzrQdE0FNxNcqK2VyRbyWy81_0E6HWfZ=es9w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:54PM -0700, Douglas Anderson wrote:
> > Extract `overlay_parse_fixup_entry()` from `overlay_fixup_phandle()` an=
d
> > `overlay_split_fragment_path()` from `overlay_symbol_update()`.
> >
> > A subsequent patch updating the base tree's `/__local_fixups__` node
> > during `fdt_overlay_apply()` needs to parse the same `"path:name:offset=
"`
> > entries in `/__fixups__` and split `/<fragment>/__overlay__/<subpath>`
> > paths in the same way.
> >
> > No functional change intended.
>
> Conceptually good, but has a couple of warts.
>
> > +/**
> > + * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from=
 /__fixups__
> > + * @valuep: In/out pointer to the current NUL-terminated fixup string
> > + * @lenp: In/out remaining length of the /__fixups__ property value
>
> It would be good to describe how the in/out values are updated.

Done. Updated the doc comment to specify that `@valuep` is advanced past
the terminating NUL byte to the next entry and `@lenp` is decremented by
the consumed entry length (including its NUL terminator).


> > +static int overlay_split_fragment_path(const char *path, int path_len,
> > +                                    const char **frag_namep,
> > +                                    int *frag_name_lenp,
> > +                                    const char **rel_pathp,
> > +                                    int *rel_path_lenp,
> > +                                    bool *is_overlayp)
>
> Returning the bool this way is clunky.  Better to use the return value.

Done. Dropped `bool *is_overlayp` and updated `overlay_split_fragment_path(=
)`
to return `1` if `@path` is under an `__overlay__` subnode, `0` if it is a
valid path not under `__overlay__`, or `-FDT_ERR_BADVALUE` on error.


-Doug
