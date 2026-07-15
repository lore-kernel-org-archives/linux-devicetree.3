Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458ED1C5F27
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099052; cv=pass; b=B/pOQN8LFsgtUgu5WapVcF4VuCuS83anj0lftB6f2MBc3x8Gr1uywUOv1GCbB3jbecQC8UmH9HMYIpk/6cBtVE9fzYpIJIIf95W0BqKBoNbjWF5Tb1S/d7RZkmKwqOrBPie0yLjrg8rYfUWvt4TxSUR/8+L/E/cxQCvYuOF50zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099052; c=relaxed/simple;
	bh=ifJqXZ4ZAmIfzckP1/3gX562cvXWbJvgz42X1CY3OO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owT3L3akjkC4N0kaMa4fpQFtHln0Bd5zlzTNZ6NrlYG93FI8CuQLSn3Grx5tzxUFo54bOcVgDUldTD5hLhGSQyZV1q/W5NAvCMh9NNba6KHSJ+xKEA45pmTQPhgoQw6zeQLF94ezBcMcSf0ISPo6Knw2LgPqpJu42PncYBOlsdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyOpdmw7; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyOpdmw7"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9fc323873so767189a34.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784099050; cv=none;
        d=google.com; s=arc-20260327;
        b=LvvNvKIilkiiYsZTT4C4u6SKvG1w5h/Z8AADxS/zImlIV80Iq0ZvsyFgO5iicqyLy3
         zU5zP0KT+7D192vGPn85i2qxSxVVf16J/g+fyrwqIxEncE+i5U2wsRQPhX7zP/tdXWta
         xMjOK3UXw6t6exkqVA9NzBx63euR39lLaUe57njtrY4rRMixWhKPLpbaitQe/g+dx/Ms
         2UydCK3B1FHSLcD6qZrSpamvbwwyuOrbC+DX82AIfqefPujthlfZBzR1bCTjA3RTua3K
         Cxa6cJ5iSFoEm/ozgxTumSNMlWFy871544H0tPzMSoBhKV+S9nYmD8WJYBMJkf2g8VGl
         Dr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        fh=bYm7Xo2OxCqS8Wf7ayxQcfvvq3Ngm/c+s+iIu+Rm7qA=;
        b=appevhe3DWGbcGnZf1l/Wl0/Tc7hGTXe/cGkVDHpeJxoItNc3Eds9fkpN3rOe9wC6R
         FDm+e+syA+hJAqDbCMXgixY+NvcdBVIbmvii9FBxJvZbn8/krwT7+OxgPgtbcE0G+SW3
         2/Yz9XQZ1X4gxphZ3574kMz1NZ/1og7iTqdlmfo4nJOL1304fDnfY1y4O6tEp30CVpok
         Pi9nBTeKouYYLikakhpz7PQRnm3i7gl/wMfFB5sN7/56aJ66GyUfZZiKwp+2KD1csPFJ
         hpAbRDfac90ET3Emp5zGWb7wBhC1sLpTD3NsbkzWQpH+CG0ZE3eq0QB5QqCja726AHo2
         7GJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784099050; x=1784703850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        b=VyOpdmw7wb7mM0tYcXSpzSp0fxwQuV0ze58pUxtK1JNS1JZzeFSyHSrNZcap6TKmn7
         zvi6o7FvkZ65KHHs7Zoh6xENQ/Wm0SHgRfs21W5G38GamS+WEOGkZ5sEkWhhnlEnxHfT
         Jxa6tX3546S+S5k9pYkuy7N/Tt7SfdqvZxylPDXXJgARD4yw9l8kKHIUM5athhy8B1cJ
         3S6Kw/m4rRQ/cLeyuKZUjKj30iETDAFs1KGD7QkYap45RDv51k7/2Fpp+g9ApYXVWAVY
         mXnTbYUi6qVPc6OWmQ83WA83t/v9dQx+fRzOxvclRxEAHR+919aiqJRVhnqBmELM+mpF
         BfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099050; x=1784703850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        b=km+N5oNtR8HciB+XlAUh+71/LhK/p+eCYh1ld87slR8hlGAdopLnmX9nVKNVnoa9tU
         //iZCNU9h+Gtmi5sDSdqyXrdsiOK1bblRqOIF6J5BEnnee3t9wWLk14fZ2h2eH6e4sv4
         coqkmVv13dgbnfdMJjHxftw1fI+Xr0Sl/FoxGNvd0n5aWLcXid6k9engMsLb+iGsNbwe
         LpqT9kDmDduYId/II6b+EwqEk7yM3AzExKfg3fEpvAaGg/9bfVkRRALWW3ouR/OL9kl2
         ROpSK0MiF2uYlqupOwHRkQ44HzSdC3YR1PeCeAqoAeUaOMbfpmrALjlwRBPWOmjQAH19
         Aw8w==
X-Forwarded-Encrypted: i=1; AHgh+RpO4+nSL0jbo+cOZKPunY47iXvS/rltJtncl+Ep0H87l2BwFcFOJvpFwQaX1lCck/AyJzY3a3aoTrEU@vger.kernel.org
X-Gm-Message-State: AOJu0YwD03SrGZi0oJZWANTvMujIb+0w1hDjrlA0ynkRxCrqabjk9e/N
	PikSt9zIhJXTJdkOMKvzPLDtWss1W0bYxcPtinbaY15740jWAZfmC0+OZNhCAbRrdawlBACmO2d
	ZWf+B1Yq0Ltx1h1pV/taubsFTfFyVFrTmA7MsclU=
X-Gm-Gg: AfdE7clZsTpwGZJVZAvCt6c0QdWvw65xAV8Ns1G8MFCxZ18pOvHoX+ITaxsoGw1KUu8
	cRpS2rdO/mxnirPXaRXPXUgTSmZuXr6PJWA8UnYNQw4tLFNxO+Rxrzc9RE90z0VAHeiQEdeIONu
	YTC80+k7EWCuh86vSd+Iemf3WBSTnf+3sILHDEPnEgvdxvXtUkNegApTqnD9HK/Jw8WWKvNYf0p
	12vpUxpQQX4IcrY8Z40+HpJR1S53aGWGFOEubc6AcwSaluDsGQmxGDfZGDpr29So9e6A3cOSke7
	Rlw+42mp+LV3B0Ws+vzyA9oO/1foRF8=
X-Received: by 2002:a05:690e:408a:b0:668:f57:890d with SMTP id
 956f58d0204a3-6680f579a70mr2127791d50.6.1784098550460; Tue, 14 Jul 2026
 23:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org>
In-Reply-To: <20260715055448.AEA021F000E9@smtp.kernel.org>
From: Royal Net <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 08:55:37 +0200
X-Gm-Features: AUfX_myzakcKGN9vlq_qc4LRJvv-oSEDxuwqFd24WcJAwYA-kTmTVF-i9eX42Ks
Message-ID: <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Should the constraint be set to 0 to follow standard device tree
> norms?

Fair point. The current RFC wires up a single I2S DAI, and for a
single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
exactly that for its one DAI on the TX side.

The reason I picked 1 is that the controller also has an S/PDIF
audio output path (the vendor driver exposes both I2S and S/PDIF
DAIs through hdmi-codec), so a DAI index becomes meaningful if that
second path is wired up later.

Unless the DT maintainers prefer keeping 1 from the start to avoid
changing the cell count if/when the S/PDIF DAI is added, I'll switch
to const: 0 in the next revision -- please let me know which you'd
prefer.

Igor

On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Incorrect cell count constraint for single-DAI provider.
> --
>
> --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #=
sound-dai-cells ---
> commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> Author: Igor Paunovic <royalnet026@gmail.com>
> dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
>
> This commit adds the #sound-dai-cells property to the HDMI RX controller
> bindings, enabling a generic audio codec to capture incoming embedded aud=
io.
>
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > index b7f6c87d0e06a..83c10d9997c8e 100644
> > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -78,6 +78,13 @@ properties:
> >        The phandle of the syscon node for the Video Output GRF register
> >        to enable EDID transfer through SDAIN and SCLIN.
> >
> > +  "#sound-dai-cells":
> > +    const: 1
> > +    description:
> > +      The HDMI RX controller registers a generic HDMI audio codec so t=
he
> > +      audio embedded in the incoming stream can be captured. A value o=
f 1
> > +      lets a sound card reference the audio DAI as <&hdmirx 0>.
>
> [Severity: Medium]
> Is this cell count constraint correct for a single-DAI provider?
>
> Looking at properties:#sound-dai-cells, the hardware exposes only a singl=
e
> generic audio DAI. Requiring a cell count of 1 forces device tree nodes t=
o
> use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> for =
a
> single resource.
>
> Should the constraint be set to 0 to follow standard device tree norms?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.64=
652-1-royalnet026@gmail.com?part=3D1
