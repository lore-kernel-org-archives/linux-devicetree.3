Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18C18DB2A
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527379; cv=pass; b=WoM9tQ3v3ZvH/TBIwwZuGgKcDJwjOoHx+aSXTlAGc+KSIBq5HwE5yfpFXHpQK+Iacu2oaYz036OI9TbQSku/N37LUwTs5czCaFFoNHpCLEWJafK2V5NZ/sd89YkYjmybufq4z6iPjYVpz/8tAWgp1wWvd/RKUvunwJk7mqTvbko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527379; c=relaxed/simple;
	bh=1dxnGYQ/a05dBHJxbBi7J8RWtve9OyuUFwPBBfCIC8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbJYwtuEoAjA5cHHtfwcs2hgBHE29oeGrKDZMOE3JTa8WuH048RwC7ICqEYR9gR7qntUEWfJFs0TBj1PKbDgRcZLovYAaJdzFNwhNroFTP8+GUdjrj79p4WkJxG76/4TNE0cRy49WR5osSOtoUdZdp1PXXoHki85fxmMBSnP+kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGFlggw1; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGFlggw1"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4855562f32eso532353b6e.2
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 02:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779527377; cv=none;
        d=google.com; s=arc-20240605;
        b=grO39MI74xW0uoE5NrwwKhKNbzqRj9jFWjj5XnPPpYh3ELasjmJNxgTKFKmZBM+h0V
         kV25NGT2rpInpSdZFKIXLEdtEc9uIGQ4Nlv6/6qMjieF4Hk9rP3ziG4hAH/p8f023/Uj
         dPYSgkL9foVwcx/PTyNiTew5AWgBb1VoDpO344eEp+Kn1QnjANoAEHAav9nB8qZrOM2I
         4FMvoxd7ri40F0nIPgCeJAUob0vUlT75MXBQOwQYpYxekABCtZZr+IANMqeRFjWQoAVW
         27cx7ZX4PyMOczUYyYNqyJ2t0fszmm6G0ksTjhTNPYLjxlEBQpNnSwBqI1e9pu++iFS9
         H4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        fh=bT7udw5mVZH5cJeEzHAOB3bE2/9s/LNNG76eIFJnwz0=;
        b=i1rNbHaXxjZ1T44ygurvmm8SsusFJwXMV8tO+f9TnEQZDRcBsA7n61j/IIkHO4Wwck
         wQvmxFnOVzV3DJrAxyKrrGWzcs7uV7mFWM2LSz/JS5ERwYV8SnC4t0oHqhp+ZJ73A54n
         6alqf1dZt6e6l63/eYpvo/vm0aEueadv8yqfW5LBCnolsE3z4iggXKgAeM5I8vJNbMPl
         MJqNkwSYlAK1oIiD7sEMSShxnBSa82Ikv6K8cZq3T5GUISd5BbcJGWO/zwx1fS9CcYcy
         F/YOdsvkgfKcKDETHFmhr7eXfiU6fR/CPQbLTLKf0BQgHhiwC6UUgO4803oNtMqxRdmM
         C1GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779527377; x=1780132177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        b=sGFlggw1Ec3APX/tb5+lz5O98ejYQPedntg6+T7ny9+YfZtWnkqE563NtlbWNju8bd
         b3LKlfQAtORU1rYKkY5drwY1cV9HVwBhFe22/8SWeR+W++W3IuA8ZHsuj8lmD2ajY13b
         sZl0YRpEXaSYb4hFJZWKITOpLXRaCKHmxt8VI7ZoRqF6X9qA2YGvQbvt1goKNT6IlXIh
         UFN8S3iE50OU41FmgwxhAL/l/7gykClAgZVZAW4kS23rfx0/isAMOTovW+i5lBM4egMT
         E85CaGfcXokdXZo+aBsTVBHHeBIOD6tpBKdU5BycxUh9+9ABqNtP77xQe1SbM1sVmCWc
         SywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779527377; x=1780132177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        b=JWLx7cb75r3mYi+Xmw2/Bc1IW12RIplU2f7f1Qz3hn0+ZJ6ZZNjEgGymSLFS5ZFE1c
         //a0UZ9u8/PsfZyP9jHKCgdDE0b0fb3xf0WLgEAznyYLGGZErMXY2MpHmLsA5xwHMVCM
         YxdO52Do7nFQ7OpA/FazH8nmsxnUHncmczP9wDMZqPTHF0j8VpwoyhRGrlU+4QuEY1tJ
         zzxz3/MymX5Il0lch3wtxKTNqFMt3KV6mSubCCSWGyOUCUBpkCL10D9Pa6yTEiMXmgyw
         73+x+aCdaJ4acuBf2g8Lp/VQxoHu/74qx6kgPlcn6wH7tFaKbwH/AaOthjPxh5N55rqr
         kptQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TlhzvA/buxXaSktTgiC66wf3137B6SZV0m8MXbheXugjLXBB71YJgJd3G7yL5OgAnW5ld5Fl64v5P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ecA81bksqqHy+1bJnjxDnrhkl+7Z95Mw+qcgLIu5ODLicz01
	0zeX0Yy3LGKsucLj3NZj+7if5VqiFqP1ovmBXaLpz9akU9xVGTBUUJww7JLOPR/VZcwIzOjZdCK
	ruCjhQQpZbM6U1imqU4YRVbCfav0Xxbs=
X-Gm-Gg: Acq92OG2Bt8JLFxA4tBGgtsf/2Wco0yh8f1b3DmGhX5FCh2W3HBSXp/QuF0Zz7TH5jP
	7UwkHKNs9ve1sLTY2GwdFjj2Oz7uMqsSs7CXFswKZMuF1mzWUQtiqzhkwWOK1/1c6lMfHewGnKd
	QPFvl0/CSJpdpwxbLQ8vOLwbakd8voVtoVGzKFuQzEMMGBH2/+YHWXvIO3Yls/7loDVI8UA8nUD
	imN0+QFr5hBMb6pjCdDziueW7MDPmd4aPy32itW0o7o9YBRSKo4yOT1kTchnrsAfUmMW15bMf+D
	vjFFQmA=
X-Received: by 2002:a05:6808:80a6:b0:46e:df55:23fa with SMTP id
 5614622812f47-4854a0e00d5mr4060915b6e.17.1779527377468; Sat, 23 May 2026
 02:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com> <agsEWo_mo5rzUAAH@pie>
 <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com> <ahB46uuoFQxKgr7r@pie>
In-Reply-To: <ahB46uuoFQxKgr7r@pie>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 23 May 2026 17:09:26 +0800
X-Gm-Features: AVHnY4Lk36CbWgZqCYBOQQ0bLGYLlT53IZSzrrfoEn7qhEuTPaAPNqycRD4gpcY
Message-ID: <CAJsYDV+cSbUu6EtgMjWT=3vjFX9w7DMNPhhBPRN2pzF0wJGwsA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
To: Yao Zi <me@ziyao.cc>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 11:45=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> On Mon, May 18, 2026 at 09:34:17PM +0800, Chuanhong Guo wrote:
> > Hi!
> >
> > On Mon, May 18, 2026 at 8:22=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
> > >
> > > On Sun, May 17, 2026 at 10:12:58PM +0800, Chuanhong Guo wrote:
>
> ...
>
> > >
> > > [...]
> > >
> > > Besides field/register offsets, the only difference I could tell betw=
een
> > > cmnpll_postdiv and pciepll_fout is that pciepll_fout clocks could be
> > > gated.
> > >
> > > Would it be a good idea to describe the gating function separately as=
 a
> > > clock, and merge the common part of pciepll_fout and cmnpll_postdiv? =
In
> > > which way you could save a lot of mostly duplicated code.
> >
> > I don't think so. Since the majority of the existing code are register
> > operations, and the register bit layout are completely different,
> > there isn't much to share between these two PLLs.
> > Writing a struct to describe both register layouts together seems
> > unnecessarily complicated and harder to read.
>
> I'm not suggesting merging the implementation of the two PLLs
> themselves, but only the two types of clocks derived from them,
> i.e. cmnpll_postdiv and pciepll_fout.

I don't feel like arbitrarily splitting a single clock into two and exposin=
g
an internal clock unused by anything outside the PLL block is a good idea.
I'll try reusing the ops and omit the enable/disable call for cmnpll_postdi=
v.

>
> > BTW the CMNPLL and PCIEPLL are actually different hardware.
> > The former is an integer PLL while the latter actually supports
> > fractional operations. I didn't add support for the fractional part
> > due to the lack of use cases and documentation. PCIE and GMAC
> > clocks are fed by this PLL and require exact clock frequencies
> > which can be achieved using only the integer mode.
> >
> > >
> > > > +     .recalc_rate =3D sf21_pciepll_fout_recalc_rate,
> > > > +     .determine_rate =3D sf21_pciepll_fout_determine_rate,
> > > > +     .set_rate =3D sf21_pciepll_fout_set_rate,
> > > > +};
> > > [...]
> > > > +
> > > > +     spin_lock_irqsave(cmn_priv->lock, flags);
> > > > +     if (index)
> > > > +             sf_rmw(cmn_priv, mux_reg, 0, BIT(mux_offs));
> > > > +     else
> > > > +             sf_rmw(cmn_priv, mux_reg, BIT(mux_offs), 0);
> > > > +
> > > > +     spin_unlock_irqrestore(cmn_priv->lock, flags);
> > > > +     return 0;
> > > > +}
> > >
> > > I believe besides the divider reloading part, clk_mux_ops,
> > > clk_divider_ops, and clk_gate_ops have already provided the logic
> > > you implemented here. So it might be a better option to composite the=
m
> > > together to implement your clocks instead of building from scratch.
> >
> > The divider reloading is the exact reason I chose to not compose them
> > with the function you mentioned. The reloading bit need to be set on
> > both clock divider change and clock enabling, because the clock divider
> > loading only happens when the clock is running. Since I already have
> > to write two of the three parts you mentioned, trying to reuse
> > clk_mux_ops doesn't seem to reduce the code complexity here.
>
> You don't have to write divider/gate operations from scratch, but only
> wrappers that first call clk_{divider,gate}_ops.* then trigger frequency
> reloading.

The wrapper needs to be spinlock + frequency reloading trigger,
because the built-in spinlock routine only covers the divider/gate.
writing. I see no point wrapping all the callbacks and writing a way
more complicated probe routine just to reuse a few lines of
calculations + register ops.

>
> > It's just trading get_parent and set_parent call with one more level
> > in the clock tree for every clock and more code to wire them together
> > in the probe function.

I just learned that clk_hw_register_composite won't result in
one more level of clock. but the second part still is true.
In order to reuse the mentioned kernel function I have to give
up on my current single for-loop probe function, add a separated
array of clocks with mux/div/gate, mux-only, div-only, gate-only
clocks, and write separated probe routines for them because
the clock composition is different. The current static pointers
in struct sf21_hw_clks will also need to be replaced because
clk_hw_register_composite allocates its own clk_hw instead.

I'd argue that the point of reusing code is to reduce code
duplication and simplify the driver.
In this case I could only see the driver getting way more
complex in order to reuse the routine you mentioned.

--=20
Regards,
Chuanhong Guo
