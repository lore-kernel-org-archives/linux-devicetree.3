Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8535D498908
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764960; cv=pass; b=QHgKhbkp7UuQrc5cSCfBj+0CdkPCkDayCwqSanJ+6KlQJ1ipuzuOkDfe/g/t/CqhuBYUzUBrxUfjX5AM1BtpfFpHD6DMT3LnVCG/EMq3VsSj6MXMUlRiTSDNQA2uA4KmEhUMZc6TTCOg41YPRVGpeHpaiKJ6Ky0LFWxeL9h9diA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764960; c=relaxed/simple;
	bh=bsFH+GvDY/LoJjlhGOF78xHnoRniyt3cIA6gB0xNWXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTXjr4pPn2Qi6yyv7ZEJEGACsmO7acdN5gnVW4Epw8Kxtx34ZHAgjC9KCWtTTbgLlKiKgnumode6glOXrA0lMsa3oPHJ95NxVpoE0+D7hBqx4Si2SGWpkRr0oo3kVJ7+B9Q4I+KqdpR7PZf1923RawcjX+6jGB9GveEAy91hZTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qn2LkyI0; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn2LkyI0"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso1225754eec.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790764950; cv=none;
        d=google.com; s=arc-20260327;
        b=Q6/2AULLL5Cb5+zxbFf6wDc+zKSTP5SHWU9E8sejhkbZhVhU5kljAxkyWQ26UHh/g3
         5hUuvhayf8czOAAiupUjkDiBJWxXaYmzaHMPHtZ2aiA3ZnTLTYB7aroyUmXA1x0iuqgu
         1rsIzuNNx7qqYgPn3X0O5+c03MFkXDrAPMUmoQJS5JD/wB2TCwqidpvgQ8/kCg4wvtVB
         ZjB/LAE4ph/t1pHTHZ4tnncQQelSlzNdFlfVd1FUbKeQY9WRPHiaCkuLrhlcslv3ftm0
         fZzLJDkI03U9NKd64MuxXG6nGsWvxVI+dDEM5qPQGfVrepzBfkBuz0jLtht8FKKT1wcD
         Ll+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        fh=JOzN3l69uv+jL0mRJNQgyrEddsvcSBhrokYeay1b3sU=;
        b=FfzMgUVmq5CR0i4J5UyhXvt7BgaRGIVXVNrfhxti3lR5MgoNYtBNSCuTjmsmGKDdZw
         +GhGQw4u9BgUGylNmK0oE6DPYCMVTdAA+mQBVA551pKiht+2CjsMvxMfPj7c2xeV6kTi
         qYBjgJUdXs8J+QDtQ4yCoZHY0MOgw/hmGrN0lA1UL8zcE7d9q8jzgPnEe2NgyGSOkj8J
         0R2dM0/KInAmweTE8d80MwJDixLCmhvXEdiyCl0piUf1pD3KoSInCqLClaXRjZcHbXr8
         sgb7zy2UrMkv/I+DqsayVYAVpMRc7ZtvDoQ3h/CpIFxtWMKBuIYf8OjxzWvpL3JDWnKR
         p75g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790764950; x=1791369750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        b=qn2LkyI0JY8rRfHLjXyRjc1mCxzEradOcD0RDojES9QhgN1U3RUQq2WwIr3kTCHB9+
         8/nPeVyl9My9cGxe4faycArWlAqLyhm6ZW2heGhMQ8I7zudVf0KL8p+nrnwgHdCHTleB
         4987k9riDbjdp+p6ig1xZ3WBgqW3/0+2iM0NU3QdEoQmZlYboPLJX2uJt/R0bP24gdt4
         YBrGpyED3wzUQr8eqljxMDM7Loc6lxGLssA1APigUNZxrRF6RyrOMmfINrnViCOVA+IJ
         RDWjaqw0HWzF9OFUzHV/luT1HNRYseSm0yvmKK47B1QIseR0TqvEv1CxXIEtL9juciBP
         3Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764950; x=1791369750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        b=fnHyf0ZfRRu4eKvpx573bqZ7siPtRUtOVmjvU7TyTmsQjEF9uY4GURJIbcZ6v2djVJ
         F6m+j1UHHNShbI+xcnHzR2bPSw/OXOUTlG02753TbaziIezNYCm8t8CUfkUf9g+mH/aS
         6J3xZQBh5MhEN5Q8e9Q8TOXkHbkiYT+/Vh63ix2dgZJyo1kr8LgIennkPS+XD710O/rI
         u8DmmmGpkWZaq/4Rlsqsd5hmroKLtQXoqsFDvD4iqzc4GU5vuowC88lsshgUMzN0z0Y/
         jOqjcTUQgu1OPY/z/u8eTRUrXBdGBehVz5f+e4TABhxPeI7zojvSRDENyR4tpoyAzo2Z
         m1fQ==
X-Forwarded-Encrypted: i=1; AKwUvByCJIhe8aqFpYWJQCZYHmsRMS0YFht0LgZeKoqYrUAAxXVvppjVgRYOPRM5aPUw9O/glOwnI5KVOI6I@vger.kernel.org
X-Gm-Message-State: AFq9FYKE0i/m437O5qI07+P8ieim0vGqZm0p78Lop6pi48hXasUQyGcF
	byLmUioijYAF04JU5eK8WJohtqWUjczvffTeYBE442JSwFz7csf/YsxLCd7FE6UXrpOBJp5e4j9
	ICiXZUYplZjTqvHbC1jy4Ru1ROJoTur0=
X-Gm-Gg: AYBFou2YAmR1r7rO4kpbiwi4YS0vAFlYCD2SgnctyRTLdJQM6ZD+8cOZkdnzDawZuow
	1//SMJ5VMOqpQn17cE8TaHlFAXAWqTdsKkERXQX4Yb7tIhzaUuBrpLypuqeo58n7uGL7A++Bc1P
	Fyha9X0yBXdJmRb+S0uOpO24PGjmzcvF4iW58UNmikhmy7xEdL3d6+Qpt+2bVyAk9IgKIXuE+Kq
	q9IWsgrTjX/3nPzNRsjsGe4myLaaCiBOuFeJCXxW1rjtIlo00T+Yo0AUu10BJDOjsrc/S0vq44J
	jvy89ji/pt9/7Qq7UfENlXTHpdE9D6gjuQVet75YpdVBtL+TP/0xMWBVaa8nZJPFevhxgv8Q9B+
	M6oHRkwPv3b1nYQ==
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id
 5a478bee46e88-34cdd0a96f7mr1217151eec.2.1790764949439; Wed, 30 Sep 2026
 03:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome>
In-Reply-To: <arzlR8mCg9d_z62L@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:42:17 +0300
X-Gm-Features: AclHuK-DuyyAs9z6BpVs9PR86an08DuP-rLMFIX2UP_bIS5QjiwEsXp1jDjGZck
Message-ID: <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:34 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:47 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++=
++++
> > > >  1 file changed, 138 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra-8bit-cpu.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra-8bit-cpu.yaml
> > > > new file mode 100644
> > > > index 0000000000000..f0dab608b2936
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-=
8bit-cpu.yaml
> > > > @@ -0,0 +1,138 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit=
-cpu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description: The display controller in Tegra20/30 SoCs features an
> > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > > > +  protocol and is referred to as '8-bit CPU'. Each display control=
ler
> > > > +  provides two such interfaces, which can be used to send MIPI DCS
> > > > +  commands to initialize and control the panel while image data is
> > > > +  transmitted via 16/18/24-line RGB.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nvidia,tegra-8bit-cpu
> > >
> > > The description says that this is a feature of the display controller=
,
> > > so adding a new binding and compatible string for this is not the rig=
ht
> > > move. This is all covered by the "nvidia,tegra{20,30}-dc" already, ju=
st
> > > need to extend that with whatever is new.
> > >
> >
> > How would you model it? I have tried to model 8bit-cpu as a bridge, sim=
ilar
> > to how DSI bridges are modeled. This reflects interface used to link RG=
B and
> > panel, without inflating existing DC binding. If you have any ideas in =
modelling
> > this, I am open to any suggestions.
>
> My suggestion is to integrate this into the existing "rgb" node, or, if

Not an option since it is not clean RGB and there will be no way to
distinguish RGB from 8bit-CPU.

> that becomes too convoluted, a separate "lcd" node (or "dbi", whatever).

This is fine by me but nesting nodes without compatible feels weird. Oh wel=
l.

dc {
  compatible =3D "...";
  rgb {
    dbi {
      ...
    };
  };
};

>
> Thierry
