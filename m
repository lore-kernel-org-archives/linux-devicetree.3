Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18F4C9DE4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768856; cv=pass; b=SJQbRb/V2Cz5gM8cQDMBJjR1yJQ74KzxVDfY697BBGFIMZp4faNCqgBe8WtTnlLYqOL7peRr/b3ODVzlyGcEb2P7o/C2QoSz+i+MV3BRvjbySh3tXUY2rNBGFUKjPFH4mKF8GHyLZnuT40vRtdHAmlgyFDeV2l6rRpeCdMsIP5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768856; c=relaxed/simple;
	bh=tCnxQKaF5n24ux0FqNmPiHkkdScPtGclpUr1AEGXTyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUxLG4DW+1u7kyxMxxbveTTHXtKzkxTTgtxB9i5jZteYFEaKWMrTgoXpb04CLvPvhbKOfSNk6mvFoZpAuRfp/DA90gd7siiURsRMN8QKX4pzmjE+crueysOZALTC9hfljqG00kG6NpaipH617JgAGOtrrgMIswWJCsSYR9iOqKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdQ8H+ml; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdQ8H+ml"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c2a97ec17so755818eec.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768854; cv=none;
        d=google.com; s=arc-20260327;
        b=j4WXFkk5dXysa6YCdipa/Rx5p2MfFZwu+fHvjVV0+2aGNjZuU1ULSZB27fJdGnGkyz
         5i3RWzo9RhObi6FYvPdxFuwsS7IUGOM3V7MNRSfr+1x1usFsgKLWUUHRUXA8lcKLqkW4
         OEt+cUVEfECt65iuGdwWRs20G6X9YOobhogdAxdIM4aP6sY3oLI215ZE5Tm3DrVdrhZ8
         VC6oTX+VBV5PEIIDJSt80ua6uapv6RVNSRle4xl4mfhP2K0vF9HtDfFRN8uOjfqhfjug
         w6zO62eeu4Zopd+UY/znktjwXrTkma9mxS/r+ucw3YwcP5ED3DtBpvIAT9AJkc32+ZGh
         xGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        fh=RjPcqAwk4zzChDSdA8io599vcpO8yPCS6/OUfh9zX48=;
        b=dE1owON55ArUrUGxymdbXTgFYMvnBk779Xqx1ZEgSq65B1+mhJo0jkATPhAbPSTQyE
         vWHJ9ooi3nyly8CxeznxHwo0D80g1L5S9x+X+4os/8P/RqhXnUGq9scgIQCWJCezJ7r9
         7GrH4mXOk7tdPVxIAFhioMZcEEZkoPD4ah/zkz8rFNnmZbPGJ+z9HSdkaz+ypgrFQT3j
         CmSQlqDbyaGTiDglbg1Ut3BIvKDU5mOoLkscbSHhb0lIyxaTXTiFNRZVukospBg2y7Yd
         38k9JWDyIFiVcmtcmVvIcEmRMPbyCYCIbJipUQnykV+srd/3mwvsxZ62nkuww90LK3Nn
         2ipA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768854; x=1791373654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        b=bdQ8H+mli6OECyMRBFOBx36NS7W/muNtXD+vOdjl/9B65WwU6Ogf2fWmYKFIn7d3Ww
         oDrpOCjhb0SrETHWTdOoNMcuHsM1LBq8bHw705YZ2YBdumiuO4UtM31adsiDOaeqtUpY
         X0RH2QRGyzpwKdP8u+5BLXSvmy2bHLS/KAReeR5zdzIve/gEP81zpjNXgXpe76WA4U6B
         MViCKdDsF9Z/mjyYWa77vspcPYAii5KJ85jwvUwZWzAINFHbYUU2SgLtp8iIIj5Kkfja
         HzCM/g/xKcP2u4/TTPO2vXllMC042CKqaZmUOICfBa3ZinfPKk6ResP7Tevue3J7jAf0
         wQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768854; x=1791373654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        b=mV+2YOFMrJqfaBfjfO/fiUPZMTPqAFaRn0RazQ5fsoy4Jjt91M1FA2je+E0RSgfOkj
         S90eHj/IwWhpjXG/kE51wBwgbORWeiv9FlUm21HWfsHy1t5BKaPY9HkbXaA7OS6FuNkr
         /QKUMjysN7lYwa3K1D27eF+YDuqOjdRcLikUIl85ge9xMx0tX9bQKIuwl33dbw0qYsQv
         ElrWUtGagc6q3prp+utoQNqTQ4ZMDAHyrlZn6cnoLmfzvSQyU2dYnb4hLGlfvPYiq0tu
         5TGW3h4ixtqd63xB4tETksttvvaWIzv7BpZqsDCPvMvHDeoWHzTyPC46dS2qUW7mFYZR
         bJYA==
X-Forwarded-Encrypted: i=1; AKwUvBwLNoJfzqm/IVD33b7I7oOhzdqhcTDTSNDGdiYRteN29hOewvsB43JDZHUGIuAyWnylGx/5XkdeH2a7@vger.kernel.org
X-Gm-Message-State: AFuF++nFC7/Ry9WVXzB8HfoJ4mrG9MESgypytwn0RK3mMSabIpKnSvSC
	vVKa+TH/ZIJdiPagjPKHwdmhimadmQsu7waifRKVANGbIgYzW9x71qhPP2IXkMNY155afkIqeNE
	HyKU6ZkFah+b05cjFeFnFSF5cHnkxMMw=
X-Gm-Gg: AYBFou09xCYWsvLJLvF8RvT6eBgknN8awSgcP04LxN0XCHfS4ILT/urfBZEmzfcuv+U
	9xfNrK5uogsEIvXLON+pGP4kfwDS183Ppnh3hrv23Yxwd7uL4biodMkLKrE0bgrzFKz58T3kcmg
	pk1wuJwTMiF0SjPsfzp9vjxMQ7tGlTfeqyMrqGhElXKfuteefmrmZpIlSC2NiL2n2Bzhr5ku3zh
	5CSBOtwdTh47vK9V6ZnB7diLIAdAbY+I2nGPYXEdD5mSU3l2zo+HDhhRFMc/rpa/qVoO83X2azu
	Vw6Dh4TuwD/LF9/TUSckcv84/UnfLBFsSkcnoWc0Re1husPNq2qEfS2TU1vPxAmZWPX6QAbR2bx
	Ovxf2voQQhbpkY/IrpyD1Nn4=
X-Received: by 2002:a05:7301:9e08:b0:34b:6d45:de57 with SMTP id
 5a478bee46e88-34cdb5f5697mr1375712eec.9.1790768853829; Wed, 30 Sep 2026
 04:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome> <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
 <arzpluDc-Ib7q-K7@orome> <CAPVz0n0sQo-6xKOGzd3LsJzzAr7_TficW4KeU320Z-tcRUne9w@mail.gmail.com>
 <arz1BYJT30VTosYj@orome>
In-Reply-To: <arz1BYJT30VTosYj@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 14:47:21 +0300
X-Gm-Features: AclHuK9Y2nKRAcoyGWBo0XedUHUJ0UGBHVCSLavApiAyymEH-DqiDv0t1HCafQI
Message-ID: <CAPVz0n18Y0oAREzJvm3utM3XohQXyoRWGBm=7uRvzVRTSK9CDw@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:41 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:10:15PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:54 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 01:42:17PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13=
:34 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > > > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=
=BE 11:47 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > > >
> > > > > > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wr=
ote:
> > > > > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provi=
ded by
> > > > > > > > Tegra20/30 SoCs display controller.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++=
++++++++++++
> > > > > > > >  1 file changed, 138 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/displ=
ay/tegra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/display/tegr=
a/nvidia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/te=
gra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..f0dab608b2936
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra-8bit-cpu.yaml
> > > > > > > > @@ -0,0 +1,138 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,te=
gra-8bit-cpu.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > +
> > > > > > > > +description: The display controller in Tegra20/30 SoCs fea=
tures an
> > > > > > > > +  8-bit SPI interface that closely resembles the MIPI DBI =
Type B
> > > > > > > > +  protocol and is referred to as '8-bit CPU'. Each display=
 controller
> > > > > > > > +  provides two such interfaces, which can be used to send =
MIPI DCS
> > > > > > > > +  commands to initialize and control the panel while image=
 data is
> > > > > > > > +  transmitted via 16/18/24-line RGB.
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: nvidia,tegra-8bit-cpu
> > > > > > >
> > > > > > > The description says that this is a feature of the display co=
ntroller,
> > > > > > > so adding a new binding and compatible string for this is not=
 the right
> > > > > > > move. This is all covered by the "nvidia,tegra{20,30}-dc" alr=
eady, just
> > > > > > > need to extend that with whatever is new.
> > > > > > >
> > > > > >
> > > > > > How would you model it? I have tried to model 8bit-cpu as a bri=
dge, similar
> > > > > > to how DSI bridges are modeled. This reflects interface used to=
 link RGB and
> > > > > > panel, without inflating existing DC binding. If you have any i=
deas in modelling
> > > > > > this, I am open to any suggestions.
> > > > >
> > > > > My suggestion is to integrate this into the existing "rgb" node, =
or, if
> > > >
> > > > Not an option since it is not clean RGB and there will be no way to
> > > > distinguish RGB from 8bit-CPU.
> > > >
> > > > > that becomes too convoluted, a separate "lcd" node (or "dbi", wha=
tever).
> > > >
> > > > This is fine by me but nesting nodes without compatible feels weird=
. Oh well.
> > > >
> > > > dc {
> > > >   compatible =3D "...";
> > > >   rgb {
> > > >     dbi {
> > > >       ...
> > > >     };
> > > >   };
> > > > };
> > >
> > > That's one option, but there's also many other ways you could
> > > differentiate between RGB and DBI. Could be a simple "nvidia,interfac=
e"
> > > property in the "rgb" node (that defaults to RGB if absent). It could
> > > also be a node that is a sibling to "rgb" (rather than a child). Or t=
he
> > > child could work, too.
> > >
> > > Ultimately we're still describing aspects of the display controller h=
ere
> > > since this is all registers within the display controller's MMIO regi=
on.
> > > Nested nodes are purely for adding some logical structure for the
> > > description that makes sense.
> > >
> >
> > From my understanding data is sent basically as RGB, at least RGB
> > configuration is still used in downstream. Panel commands are sent via
> > DBI
> >
> > dc {
> >    compatible =3D "...";
> >
> >    rgb {
> >     port...
> >    };
> >
> >    dbi {
> >       ...
> >    };
> > };
> >
> > This would work nicely if DBI is modeled using bridge framework. I
> > would strongly insist on keeping it as a stand-alone configuration
> > separated from RGB and DC.
>
> Okay, maybe give that a try then. But to clarify: this should all be
> part of the Tegra DC driver and not need an extra compatible string or
> separate driver. The DC itself should be able to function as a bridge.

Noted, I will not add compatible string to the dbi node.

>
> Thierry
