Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF445560D
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766630; cv=pass; b=tORFoBaDiGdxEFXTKD2eAlWfEKVvUdlhjq8FTeWzosNFSxKuzxDW/sHtLbMm9DZFx4ss/9lVqA+aNmaSKd/+Fr0EOX8FgWy36iyLPuNEMZvNnct+J2hUdxYKoH19dKZ0jjzycB9/2gCSC0vJHrZ1A7VdQ4Z1+1nddJ0f9l/rCN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766630; c=relaxed/simple;
	bh=HnH8VJnjaBSq8pHNX8m+PS+xqjnyRiEUaGmbI29CpZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ae9sukjjxFCsynpFOErnoVPXgOL9SFhzDuoc8YuIyLb2zx+tvyOSBImKIQuVEoZf6BqZTD9jaXiDREcg+xmTAkaYUWevr5mhmNxNFvRENF7LuQNcJiMpMkS+9gKJ/uugfpGCKKYVffO+edGAkcBDwyrwcMHpcEXAeP88h9RS5kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgQTQyg1; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgQTQyg1"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so4570343c88.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790766627; cv=none;
        d=google.com; s=arc-20260327;
        b=aZUwG8NbRxDno7+ooCoILxpNsTM20C8P3FJcOCHmGaoSNfC0oqp0U/VjEmakyx8icT
         aaFHTK97EWHmhUrMyzcNshLty5lts2knJJihWlir+ENdjeKJI7kqWzUVNBNTGNJwvShG
         a23mP9BxlLE6DVM1fLQH46fztFt1/TtXt/prk1TtNvdWwYNoHrWTPo0NqferU+FUt9A9
         D5fAt8ZYze+00MaHDYDvUNH05ArQGDJfYlfh03nDEB320TaDRXp2s/qaNXvFAIonVt3a
         VRq6aNinxnNY9BLMHRXhs/4MG5B9WYnOVoDjUOF+0mjFalj1XmRVMDSv928avq55qJI2
         gMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OEhQm76+qWHV8H86aGRhLc+e8lMqxBXJwP8RftuJrxE=;
        fh=WFE6v2+1wbdmSvXiw8JtAK487qMN/Vz92x+NDN7W8qk=;
        b=Dr0nBHd6hP/NttuCvGP7WdtyDxkcOEoOZyO9EtjzjvaS5SWa/G1IulgPrgGfF8/qOG
         lZ14eyOonaJuFl4+C2BFrtq7K5IPN0t6+4iKkznvC4XgAX2IWVNqnhRw0CZybt1oOdJd
         zBiWApk6MlbEPR+qLeLuA/aB7/2bMkOnJdls91Qm8/x2XD/ni4tkKM8ukjWS6bIxIH9r
         H7B+AtQBDMfD23NGbQ5WAr2tWQzRhdFAb48EJaAfgYi+2fTXCtA9N+2G6vpCi0oQFh7r
         L5VszgoACoulNFI3LYt3PZ/GgJNIGrt/V6hiT5apy/Qi4+wxXYkU3DDTaP9zdTShfaxh
         1RSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766627; x=1791371427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OEhQm76+qWHV8H86aGRhLc+e8lMqxBXJwP8RftuJrxE=;
        b=MgQTQyg1ZXvluhLl4HNq2TnzEpia4IA7QL7q+ykyFhy6WehRWXU1peJZw+Bqehtp4u
         44maUhW+cOdfNWt4z9Xa6pnYkTBgTDW30HLqqiHO/ySxlRktd29uVoqe3AlIhfzqFzGC
         gZJPzscmILJ7ey4QWY9MwnSoOoNbSMrV0WZdpPZpZ43QGN+pR4OkAGdpUMVgCiLskFhT
         h/wkhrgfNV3rVERn6niPabRYQnsv80I2oUmHW2cyJKfD4chcxTbhKO8c5RTvdl5kKDyk
         EFBdPdbKTwypNe4rDT0r22o2hOWlEVD2ac+c863T37sKAhTflN4DC/fA6NiZVSdCejR3
         VrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766627; x=1791371427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEhQm76+qWHV8H86aGRhLc+e8lMqxBXJwP8RftuJrxE=;
        b=103PfRa7suwQtKhw+rLEL2Op030SuS3+MIXpMZY7DUQy1hljMZNBLpATuYxW8nnp0t
         XXAWysGLtcEWjyOcib/QJaQwMINm8jBGvg44OCf+xf5/uRgqGBBGYNeHXHc2SoNOFJPg
         1XyFL7+Cu2WS0nANFUFK1lOTfdJ7EaheiTCDsGUefKL5MMcD9m+XpP+HiQL/6BgAweod
         3xcBIWXZsJbpVkPCsUCUS0SKtMZF4W//zj8GCusWGhqs/Vz1t4mq/yfxLRH1XtmR5o6+
         9UCrDT14db4RU8laDjj1GzDiW/tg3lje8ha3GFirxEjeFgQ0xUCcZVw6XdzD1JCsCzzM
         5hjA==
X-Forwarded-Encrypted: i=1; AKwUvBzD4ZoCdKxyMCnYjWR88a68lnE+1u1hRp4hFtfV7CzuR6fCQxuho/XNhz/q4e+rlKnGVgH55IWrP4ZQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJh84naDTH5L3spOwuvmCFGg42iD8Gir6IfAVOyEIGEtrlonjHZ
	ilwDohe2mAmClebLZk9p5zXZREjdg58f8GCZuoxJiPisYlJXFWqzVo1e+GftWwP7VhAmFnpMUGf
	+By8VQI6QgxdeJMDSHzuVPnoex3GfE/U=
X-Gm-Gg: AYBFou18ZxCmXEa35KT4/y4fYQK3YPLDIXatWR1sTOUmAZurzskmj7S0ztxSgtDlwPD
	BWHoLcKVqCP1eCHNhqntZDjUDzc5LtERABL4o7kKXiBtyhR/4WONDd2nBwnpHCktDv2WI5NWyqR
	fH8xUri3wMYHSB6fPe9SUQTIBhSHy+rF8KCi8WswPietdDNOHcFyzavj78H5KCbu5nenkGsC8pp
	tqsXiBFqtzPNP5fRsEbvUhfglRHhcxF3pIpfORp4bz/+xZPElKHx+szpK4pTibNxlasgdAdNlPQ
	0W+M7hmwYBu8wTXb8CWxO/ktAlGRK8MVnnQvzo36uXTdrU31wyRkUAaVFrHXn38kQK0CWKdWam0
	viHvqBfwQXjmJ
X-Received: by 2002:a05:693c:66ce:10b0:34b:731a:7325 with SMTP id
 5a478bee46e88-34cdcbb4344mr1377981eec.29.1790766627375; Wed, 30 Sep 2026
 04:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome> <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
 <arzpluDc-Ib7q-K7@orome>
In-Reply-To: <arzpluDc-Ib7q-K7@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 14:10:15 +0300
X-Gm-Features: AclHuK-5MVKqwWOaWtZXWbiTTg2vtWkQnodr3EENyxfP5JkvZ2csH4Wtodn2Zmg
Message-ID: <CAPVz0n0sQo-6xKOGzd3LsJzzAr7_TficW4KeU320Z-tcRUne9w@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:54 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 01:42:17PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:34 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11=
:47 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
> > > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided =
by
> > > > > > Tegra20/30 SoCs display controller.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++=
++++++++
> > > > > >  1 file changed, 138 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/t=
egra/nvidia,tegra-8bit-cpu.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nv=
idia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/=
nvidia,tegra-8bit-cpu.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000000000..f0dab608b2936
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra-8bit-cpu.yaml
> > > > > > @@ -0,0 +1,138 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-=
8bit-cpu.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > +
> > > > > > +description: The display controller in Tegra20/30 SoCs feature=
s an
> > > > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type=
 B
> > > > > > +  protocol and is referred to as '8-bit CPU'. Each display con=
troller
> > > > > > +  provides two such interfaces, which can be used to send MIPI=
 DCS
> > > > > > +  commands to initialize and control the panel while image dat=
a is
> > > > > > +  transmitted via 16/18/24-line RGB.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: nvidia,tegra-8bit-cpu
> > > > >
> > > > > The description says that this is a feature of the display contro=
ller,
> > > > > so adding a new binding and compatible string for this is not the=
 right
> > > > > move. This is all covered by the "nvidia,tegra{20,30}-dc" already=
, just
> > > > > need to extend that with whatever is new.
> > > > >
> > > >
> > > > How would you model it? I have tried to model 8bit-cpu as a bridge,=
 similar
> > > > to how DSI bridges are modeled. This reflects interface used to lin=
k RGB and
> > > > panel, without inflating existing DC binding. If you have any ideas=
 in modelling
> > > > this, I am open to any suggestions.
> > >
> > > My suggestion is to integrate this into the existing "rgb" node, or, =
if
> >
> > Not an option since it is not clean RGB and there will be no way to
> > distinguish RGB from 8bit-CPU.
> >
> > > that becomes too convoluted, a separate "lcd" node (or "dbi", whateve=
r).
> >
> > This is fine by me but nesting nodes without compatible feels weird. Oh=
 well.
> >
> > dc {
> >   compatible =3D "...";
> >   rgb {
> >     dbi {
> >       ...
> >     };
> >   };
> > };
>
> That's one option, but there's also many other ways you could
> differentiate between RGB and DBI. Could be a simple "nvidia,interface"
> property in the "rgb" node (that defaults to RGB if absent). It could
> also be a node that is a sibling to "rgb" (rather than a child). Or the
> child could work, too.
>
> Ultimately we're still describing aspects of the display controller here
> since this is all registers within the display controller's MMIO region.
> Nested nodes are purely for adding some logical structure for the
> description that makes sense.
>

From my understanding data is sent basically as RGB, at least RGB
configuration is still used in downstream. Panel commands are sent via
DBI

dc {
   compatible =3D "...";

   rgb {
    port...
   };

   dbi {
      ...
   };
};

This would work nicely if DBI is modeled using bridge framework. I
would strongly insist on keeping it as a stand-alone configuration
separated from RGB and DC.

> Thierry
