Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C90937AA92
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 03:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901715; cv=pass; b=V23p4SL9ycLR9y/omcVGlOfo3yQHGPKhMymyqnukiGrBgTsYXVSz8iPh0UUhe/m6fIKjv7cRYKpkm8EoAyp5xDUxfzA93ZIwMbRjBjiivNrkzA6uP+tCFQ57wATPSKmNe9J4X26hTHFDq/RMQHzXry21Y9p7JSNQ0j4appMoA1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901715; c=relaxed/simple;
	bh=BHvihkI6kmpBzFGg7uYlJorfXecbcqoWRyAX68wF1wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xdl/IaVrj5rhKB7Y/KUQWPbRcERKJJuQsO3+vSCK007c2SeyBCTIwpv/O/41WP+pSfxrqx6cA8V1WM1eBykebdWMsdVtaHPcbf0CKpX6M3g1zkVt2sx20zJEyhDbZm7adVgieUZTqv9Brl3yTzNvKt6iwgsGpCMEvxDoF+bp99M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LZRqa/Hp; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LZRqa/Hp"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81ed000b507so5630937b3.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 20:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785901713; cv=none;
        d=google.com; s=arc-20260327;
        b=EuZyPm+r0VQ8DCiW5l45YwRALLLyiyjyyCvgsKl4Tbq6f+G56ZcnuCGSIqGCLuzIOT
         ld8k8yYaX9LafkfeoDecMhuOy8CdTttaF4np8sfxm2l9Ptng4Y4oUHH3jRemN2t+Kb3L
         Luaip+vPwQ6TJ9rorKVvvDZAVpMdgzJ879DdNlZePGBt7Ng52HeeSMM+ukQdGSrA9wtl
         GE1ymUIti7rZTN60pNOEirGxfBQHGUP7vX6HQXGw7ZIh24xMQBTffUq9VoOG89uEKTVh
         NcQF1uV5lImfqmFdWG5kI+DcOyw58q7VdgLKddFhw+9nhB3RDoNgQlViBh+29BauX5ZD
         GZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        fh=MElPAEv8BXkVBQx/DLqvP7PW48NxzGJ/QQqZintNWBE=;
        b=T25MiD8IvfuYkWphut6XZ6HW2AEa8B6xUS3bFU2cbtEDOZ/MUKFoHcDZ6Ckjzx6G4P
         m5UkbsGgGg0S0VYdHSKtcQ27kE8TC8gouRVjRINx89vEhL1t7gpjDFTtxTtGDvr1aX14
         VwL3s9fZxsi4ulgK8y7LrX5VcCMQjAotA4Kz8L+nHVD7F+8TRlL6tPz/QV7/TX1c65Me
         Nlc2MZQaIXutPl7CGgkJ53W6sxvmIW4XutTkM/0wX4JBF+H+so8LWeuxv4U9fsy2aY9J
         o+vQyrwxL8jQy/J1tZS16w8PsZQqop+6NLIzM/IK6Mg1RNcuc71205MkOd8/zRKzVFtR
         wraQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785901713; x=1786506513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        b=LZRqa/HpR+XR0TmkaZCDly4jOBAfUC9SHoNQjIPUpqcEIjw/MMC4JCanKrKLF92xN9
         KLYlQA9/VnyfwqE4V9E8vGUdScjh5LtfWPcnxBk0Pz58MXxjXGx/cplO8RG5JmXrIqJp
         qUrzsNiT4CnjCM6I8UIZrNDXyRewf9SKbsoKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901713; x=1786506513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        b=OoYyU2hTb0CyqGNty1ZasLrrA9nveGw6rTwHDeK8f4ERxJ3uxvv6j16uURw2dVuDH6
         BFR28JeuYjZp4qQfI1gsJSW8+0gD3pf0GIeRCUiYSwpa7qb9EL1lxBc5dHL+JUE28FCk
         AGw+NeZ0sE5gcJ6D13S+vN5HK9Mvmi/NnrOG1xKT+FJ2Pvd4qdRDJEUK5XM7Nz/PWrXT
         NuuC+2PK5Y7Buu6VVV+RoJDM5+S2p9AsfAf40z5SHOmWeGjMOUG51lvK64j0BgargXG7
         5pbs7V9ivjYldhu3/CFwF2DkyyBJ/Prc0OxzMF7ZZmmgGOxLm+geZWrgcN4Bt44lLUei
         yzbg==
X-Forwarded-Encrypted: i=1; AHgh+RqO9+IATsGuVhgoyEDLA1iVqgAs53f8semFNwaOLoh052bwquCm+Ciwd80PXNY9PTz6bL7O36DgBaKO@vger.kernel.org
X-Gm-Message-State: AOJu0YyWDvvWdn5uJ+obufk+CZJWC6hw8P3A5+WUfsvHg4P7xqqOoZC+
	hPOOvrz6v4diR/xuTZTKtY2LW4BUJKIp7vcVlsov+RCJ1uMY87F6GyBu62EZc6NyMR1LIh2nmcx
	2JzRSdqtWvNtyrjr/N6+mAW9A3nKtOQBAG5O07TAD
X-Gm-Gg: AR+sD10NjtYBbIaLEnFE1R4WCmju0cysNPT2ejrWEBAq3ZTMlo7ShZPAQ7J2eonkBN7
	i2F0PoaVyyWRi8yy5yCDnvrTNPjeUg8EViXzzCY1eovhq9FpZIMeB0A9UwR0Hfgb8gahKhHWiBx
	b/vmYfGkR6zGdX+zwyGcCG23xKWcBGp609njegmc8pKqw0evZiauihsFBgHeHnUn6GL4bHyWAYr
	x+mZQaBFVxaoceHXZ5QC5w0KIs1LTOsfRe2JaNyNNsE6C2ZyihBp5/e+WYH1GZhCjIexI1Jf9px
	pjrw1OORJnHXBsaQ+iRibg5EFhdJLgZTiPEVLDlwQU2cAyZScB8C67+WGgJTbrWezuZkVglOFbM
	=
X-Received: by 2002:a05:690c:9a88:b0:81e:4e5d:484a with SMTP id
 00721157ae682-82022294eb4mr22113487b3.2.1785901713089; Tue, 04 Aug 2026
 20:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
 <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
 <f3837531-2949-4741-a23e-387317485c02@collabora.com> <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
In-Reply-To: <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Aug 2026 11:48:22 +0800
X-Gm-Features: AUfX_mymFrVaiYOLaCO3AlvD0Um00IkfLaFRQ7IWTs7XOa8ZsYdcyTa8_6zr7HM
Message-ID: <CAGXv+5GeYZ_et3bH9Udf=C3f30-zuM1=Z1meU47RnofG0NL+dQ@mail.gmail.com>
Subject: Re: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 28, 2026 at 8:49=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > On 7/28/26 15:40, Rob Herring wrote:
> > > On Tue, Jul 14, 2026 at 6:45=E2=80=AFAM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> Add documentation for the Two-Dimension Sharpness Processor, or
> > >> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> > >> variants.
> > >>
> > >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno=
@collabora.com>
> > >> ---
> > >>   .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++=
++++
> > >>   1 file changed, 98 insertions(+)
> > >>   create mode 100644 Documentation/devicetree/bindings/display/media=
tek/mediatek,mt8196-tdshp.yaml
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek=
/mediatek,mt8196-tdshp.yaml
> > >> new file mode 100644
> > >> index 000000000000..ccd6a8443443
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt=
8196-tdshp.yaml
> > >> @@ -0,0 +1,98 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196=
-tdshp.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
> > >> +
> > >> +maintainers:
> > >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> > >> +
> > >> +description:
> > >> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for pe=
rforming
> > >> +  image sharpness adjustments/enhancements in a display pipeline.
> > >> +  This hardware block supports adjusting the luma and contour 2d hi=
stograms,
> > >> +  frequency weighting, luma-chroma gain and others, with adaptive w=
eights.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: mediatek,mt8196-disp-tdshp
> > >> +
> > >> +  reg:
> > >> +    maxItems: 1
> > >> +
> > >> +  clocks:
> > >> +    maxItems: 1
> > >> +
> > >> +  power-domains:
> > >> +    maxItems: 1
> > >> +
> > >> +  ports:
> > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > >> +
> > >> +    properties:
> > >> +      port@0:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +
> > >> +      port@1:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +
> > >> +    required:
> > >> +      - port@0
> > >> +      - port@1
> > >> +
> > >> +  trigger-sources:
> > >> +    maxItems: 1
> > >> +
> > >> +required:
> > >> +  - compatible
> > >> +  - reg
> > >> +  - clocks
> > >> +  - clock-names
> > >
> > > This causes a warning.
> > >
> > > Seems this is in linux-next already, but no reviews?
> > >
> > > Rob
> >
> > Wow. No idea how clock-names got into the list of required properties: =
there is
> > only one possible clock, and this doesn't need any clock-names at all.
> >
> > Same for the resizer binding.
> > Sorry for the mistake.
>
> Why is this still in linux-next?

This is in your dt/next branch, applied 13 days ago. Maybe you applied it
by mistake?


ChenYu
