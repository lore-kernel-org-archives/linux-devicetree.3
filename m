Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795852541;
	b=J3Qg6J18Z3AxFJ5JJo5H63uveeEbcDIYyMrqFKhJMXte/OG5kLnglrAP32Nl8igDpYIJ
	 WGOT5MhfJPCIlNQA/y405mudVAFq0xqjdzx/xBKdYrWQohNJAqzdJfe9uzPt/DSssGBN0
	 e/0iDqXb4O0R5UcSiAfvd2q/Zxy5TaOFEWIWKi50u08LYlQF2N+Zh6xATw++BDApo4/Lb
	 7AKio3VpU+rrt24l0zGIUiBCHE0F5nrHrH4zB+Cb/8yLcII1ANgy2m0QvHhFp22+oRUsd
	 Aaj+tlCU9UlF/Ghs2/eBS4dYqhuurPTSzSX7pyxkfd8JN5snnrr7DTM9iCuI+iLh5Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
	b=EbQI9kFhI46IuihIlhV0oVZ5F/KfSzYIYBZwx3XlxPfzOYUn0ywlTpIAA3QUwih8Xcvp
	 23wYyT2SMFSphEnwLLW9kFIwgn4IXsuNRTqekJRthBcKk/Sb4QFOgGyKFmtyQGkMt+D5d
	 DGm1dsXK2gvKg4YQ+hjVgmvZlqTS6NtQlyonp97UQQofAY3HDMNNJIj+NsJJmp1lGyUyT
	 V4roqRMLX/xXU1tFu8ceO6o/rDS92YiIyGt6HdBI2bikBu7dlL+qrw7npExfLIz2kFBo1
	 eWtXYX0/HQR4oD3wngai3pZFH/GxlbVJdmA7ShHHHvP6NfGm2MkyJQyHVwF1WrKoAlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6yIzSZs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180F606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4180F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6yIzSZs
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386bd881d39so10719297eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795852540; cv=none;
        d=google.com; s=arc-20260327;
        b=Vnqaim36M4OrpvwzggZTfrZm0Fu8GMyIMq1gKUygCwbzf45K+J4p8VEab1o0d5phbH
         0d7UMA5jpO/gximRRyUd/n87h0nNIIX9M5OdusoxIORTKr7nH+asPGFlD/7xV3ANHvev
         M231tdhSFEWyk2WgPwKXmEfgEw6XPwZYNMnxxv97wr9igZ9lQNTSUDH1Puky2RdWCtsp
         iEV+OhWLTf0FFoYa4/VEFa1NajZnL++SFyDadS+7JNokzC2oKM1vhKjqH80ErBJjKlvG
         UQgzwNBT/cAI1rWzp1oPitWibxl7PVQDRZxj4CmP+ow22AupxwPz2YEIZySLDXmak6+Q
         tdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        fh=hYrUnh3yyo+PLPuNfeqp0mYvRTvtLT3kf8U/0+9jooc=;
        b=arK0PaQFZpkW2XU1LEAN3TJ+O0y3UjqByk6lBPkLby6DqYVJwqxzQ3fEmg5IrvexZp
         yooJQjeHQkLHr4zI1DoFKaUMEHDI4ybZnCqnpXFeje2XIWCJ4NQfAD0BtEPjOmO+jwiN
         dUZVHneI3+paQBXXcMOsuTPh/7cAt8JW4TuE8pnia0kROmp0eLWQChtBMkcXa3wawjGJ
         m7CnjojEna/nU+3EFqUhPA4eWW/zfoqXYNJknNbQ1BUkx+8GLdof5+KAYqGXIf1ubB7K
         WTECHLnlOCwg4nPN7CkvNkc4P6wQM56OTWkfm382mOSdxLLiQcGYhb10y4Hk/RBliub0
         Df0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852540; x=1796457340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        b=k6yIzSZs5j871Tsu5ramhiBI44Cs9MQpJNNP/7T39kC7FHeV4ALzXTvmxPLe2094IS
         gSqrGZ0StYjayUUhLEIdrbivQXsIXuZwwDpBpvAAZbyeCrhoy31Krv9sCFHQU1XFvrNP
         YllgAeW9zRDGHhDUw8ZzH7690ziZrOT6m6z9lP7NlaNkqZJEZw8au3ItXPqF04A5TL93
         TjZ2t9qA8+d++ma1/RMqzi1CZvqeHIKvMqmbmsKE9Gxu5oXan58VoDrgjZs8aznrjrMD
         iT1m+65866llFivUiI7RuN+RVp/gaHIxt5ydA0QOmIQXPF0HJhmVpy9m13GYKUAGJEwl
         x2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852540; x=1796457340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        b=hAeAsHJw80Omcz4/78HaevPsCKyM6oOipoQqfV21ITV/TEJrkPMyfbRcn84xxWRVZj
         H3RwGz6pLI9bxsJsbj2HIX3dGOrB5iQovP1imGuWFO6oj/22XCvN0vE9qxPx6Fv0mn5z
         k2z6iJHdRIepyj5J8Y5OsE+EB93QFk7qZxFvgtZVU1IILcEEuyQn1jz8j4ZtFqO9XiOD
         R2+qOQ67b2Eb5KwlVJo3FLN5VYzl7SbJKHvZXTTv7B+nC3MxeFBa5gaL3fFvOUzp/Mpv
         5V1Le8V0pDkUrNmJllj1rnvuanwWoeSGObgfmE/oMQ4AROqx+W+fOwG4lOn1ofUARCa1
         7GgQ==
X-Gm-Message-State: APuU4Z8xZ+bnRXDfIUFclLIqNCH/eiJbSCwLTRUKGHSSc/ecTSUVzTix
	4QFSynjVyGtxUrOnHNptSOtvEu34U0bjU6QvBbkYcnKKwtfikFZsMI7/YGoDEO7RlyEGH14Yd0Q
	ynNCEXymY51+ZwErX48RjwpC5oUP9NVk=
X-Gm-Gg: AZFdTZfJ97qgENpmmrdDETd7wA5gIiMZ2iUlY65bB2d4rUOgrDQRwU67et389hNJmlv
	5XEvg8h5+PY7LRqbZNWWumLZ70sypCrUT88eNzjo2Y2hKS+0UVKrSOV6qZK0BAQ/OY1j7vodMn4
	L+la1EgnEQt4rxbkb9JgaWUCK8DUstLLJu5CH1UyLMCw8M5inRmdYWO4m6laukKQYD4efVemJqQ
	V3J5Dv/AaqwkugL1HuwnBA+dG7tjKrqNeUmxSh6r6MRMwv2BDOHmu1Ph4arXBsBsYxLszrtyySN
	KV2xKLHcTN2q0XmERUPfMHtb0Hyqs+pRMQ2S/DSipoYP+MPcZk9YSB6mZXYelyx4lB/D85kvK8A
	k6MmN+idxGApuzNa1vzt+T+1Ukh/6lACiAYkmKPYuXguewulY19D3apThfbcLCo4tDh4gXpEdqe
	bCPsjLi7yEh/SpJapFhAbR36AapT+uGk1BWn2a1Vja+rf/v2v3naun
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id
 5a478bee46e88-386a0c0757fmr23973057eec.20.1795852540349; Fri, 27 Nov 2026
 23:55:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
 <CAPVz0n1xeNP=rv3qDMG06aSWRLTVvCfuo5tFyt9fz7KDTySV0A@mail.gmail.com> <kaWzD58LSXePk8E_XcD28g@nvidia.com>
In-Reply-To: <kaWzD58LSXePk8E_XcD28g@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 28 Nov 2026 09:55:28 +0200
X-Gm-Features: Aa3M54oteGux7ycBFDqaQLj_8yYFVhcMiRkeiuuEM4I0oXp7dJIyrqrkoXPQNzA
Message-ID: <CAPVz0n2S=LVqgXdQsFX-A3q92YNpEu-S_NWm5Sf1uYJexEEkhQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:2=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:41=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:21 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote=
:
> > > > > Parameterize configuration based on bus flags passed from the bri=
dge or
> > > > > panel. The list of supported flags includes now pixel clock polar=
ity,
> > > > > display enable (DE) polarity, and data alignment.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > ...
> > > > > +     /* configure DATA order and alignment */
> > > > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > > > +
> > > > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > > > +     else
> > > > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> > > >
> > > > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to che=
ck
> > > > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB=
/MSB
> > > > bit ordering in a classical way, instead:
> > > >
> > > >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> > > >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> > > >               R[7:2], G[7:2], B[7:2]};
> > > >
> > > >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> > > >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> > > >
> > > > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > > > panels depending on the layout. So the correct value depends on how=
 the
> > > > panel is wired to the SoC on the board. Hence, I think we should
> > > > describe this with a new property in device tree under rgb/dbi or
> > > > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > > > document that this means the above kind of wiring - not all RGB888
> > > > panels use it.
> > > >
> > >
> > > Ugh, why is this so confusing...
> > >
> >
> > Using 'nvidia,rgb888-wiring' may be confusing since as you mentioned
> > not all RGB888 panels use it. I can add 'nvidia,data-alignment' to rgb
> > properties and set 0 to msb (default) and 1 to lsb, or directly set
> > boolean `nvidia,data-alignment-lsb`. Let me know which is preferred.
>
> data-alignment is a very ambiguous name if one isn't deeply familiar
> with the hardware, hence I was thinking something a bit clearer would be
> better.
>
> I agree nvidia,rgb888-wiring isn't the best either, but I'm not sure
> what would be the best choice here, off-hand.
>

'nvidia,disp-data-alignment' to match exact field name it refers to?
'nvidia,rgb888-wiring' is too ambiguous as well.

> >
> > > > > +
> > > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONT=
ROL);
> > > > >
> > > > >       tegra_dc_commit(rgb->dc);
> > > > > --
> > > > > 2.53.0
> > > > >
>
>
>
>
