Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A85A53FD28
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175413; cv=pass; b=QQw9EqM1KG2Oi0U4maFG4LbdtJ6y8nykhzENROK+Par+2lbwuSF2f9AjBmP83Pbnf4xebMJ69XL1HhGVu6EO51XXKF5XCkUv70XP/mog0AS0cj9TqaPicXBhYVb7qYJ5WTUUVEnyigS1ALqn30yJ+hu1rCqmi6KYIdtG/VAf/hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175413; c=relaxed/simple;
	bh=UyMSLBvW9tmyx5OoI5WsB7xjvglDq4V9P7yAbnK27AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubq6UG07d2MrHlJbZ7I2FP2wB2krG2Y5jBCjneqHqx+zpGroFwc2/aEaYxgHwMvr9QkKOot8gLmdytHte3kC7NRtafhRk2eWC/hdxRABW6zgCSXV7zvbOqWaNuNhLjJ90AYgpnXoXkaAzq1UqCktJ72LHtcJnkVQCe4c5TpACGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2MjLjcA; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2MjLjcA"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1875535a12.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175410; cv=none;
        d=google.com; s=arc-20260327;
        b=hj6BaqukZG5UliaH5LW2r7cDz9TqdAYHiHrBQ+pbLRDLWZ6Cqq8ro9K74g8oNSPR25
         tjjzds3BztsKS02TQnsLM6oj9jcicNniW9xR9S37E3WXaDs8q9FF31ex7TaAI4aydNAN
         /l0ArJ8zqVp+wJhDJhV/Kn6+OabHpNnrMIg2bS4pMayG0uyP73WC3hKPiJb9AtpNUx8r
         /WmSl7HXOEj//Ls53Yr0pmILbmw1wZA0tcR527Bssc3SxrO3JgWiEA8Y7pYmMHDU1ZL6
         xGw6N0TpquAN+BvqHuXms9T21lCeON8gGJM+W8vU/9EU8dS8alx22CmU0SKduf04m3Mv
         HTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        fh=GqCeS8rIfakwwH2PpqgRWwoovcQI+rvXR+poSNsEQtY=;
        b=EfNJlMBoxjOXAx742DzdBZJUGiX9HoHELYsOFTeuBNK9ALtVQL/BYb7+ZR4BS96UWz
         /SfaBoO+wBG9szKnyANieSgMA+xE6+jpZSikB8U/2xpOik4i/sn1Wyiwiu6oA0M8P/7p
         MZHJXtAiSDVWNAgiG/sBXPhLv92WqKChf7bOPdvWonO3LKYMvO/esrsnKYupOh831VDP
         A+ftUYdWY5+T3g/FHgYHp7lh7Dt6+enblsK1XR+AW6rdKV+qoL8dMHitOt6p4QyijTOk
         jhUJfkMpNWZwRBxTDvuq+9pen0DjQHj5YHYOBgheUbXxatwz7ZSw+S8XMq9oKe2Nm7GS
         PXJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790175410; x=1790780210; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=s2MjLjcA0AyFc3tudZzDSVIPZNG8WBN3K04612i2meXScdWB5e1QBUPbP12oXgjFqM
         laDKeAQiAhUeTGKziVP/M5QBOaGNFWVZMZrENueMVwMu9CMuq7P2F4+VsKRadF7ih7H6
         hDIwGMWsDP2c4pbSiTHynclCQfWmlo04XWR99zgAFtUHpyAXFgorbbsa4iCr9c8JKOAB
         10X8OS4S6NDkDk2tapaIgoH9njFFq68xO9oKaubR5Cxh1IhH4YEHGYQMTZZqagVkZIgO
         xWDDvGoyeVL8E0GRvBPjrj31JmiwqZJ00PeeWZ59lLDAcaN/GFZmzOe+JcAChHGiFufs
         OYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175410; x=1790780210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=GscUKL1S7fwxZDsrtje8/eppv/W6kBVRtNi74LWzWwfratg179+C09r+m8e8yaVuUx
         EiX9iZoBXN4dUklMQKJbzbsiVEeYbybtMf8vyTaiUCImtjzAfBRMgrDrRjO6F5hevMg5
         2O363S3pr0fx1T4Pp9Lz3tKB4wHxbXeaVytYy4K+4xpwMv9oseWahSDas8bQbaml25g1
         1/UJ3UMroZlRJPqcpFN2JBwZ2TvUYX0c/ZNQETS2GbsP7bJYEH8yhUqIC4iw9rSMHTup
         dZ2dH/JBc1TvaUXhEgLZC1v8GfDRGXcT9U5sOdCZlf61j22S2fU47HfZ/U9FVgZLqocR
         S6Gw==
X-Forwarded-Encrypted: i=1; AKwUvByIcz8WnVA538WjwPd9zAtOooFD7MZvsZnDFLUjOX4t3z8gyq0ZENxcVuGO+FzWNlNizStefxT8Oejs@vger.kernel.org
X-Gm-Message-State: AFuF++nIlUWbQjrvdDCKZdc+ju2GBu0mhEkz78RB07vwSS4crR2u+T0Y
	FgvcZy+GiofW91B2nbdQT9L49C2EezvhMlCTMJJYtcd+Egg488NzBc+brXqpI4tPL+mkrBWyoe8
	M15DhcngiUhBpBb7A4vXr4pgk8AFcrSwYqlz119Jdxg==
X-Gm-Gg: AYBFou2VPr39TjZHultOjm52QrdQlH4W5j2UosfO0Q+1/q6nrPIR4a5Lk4c9p7V1Kck
	EZAQV7lr5uMvIBAu6Sh7jv4LtBTshggzvXWstX0Cp+UzQOEbg+Ozs+2+mYDc6y2AIJx2YlOy+IH
	EJ207r3CdrbGUZMCBmLGSyx0llLhJyVt5u07F3kN3FXn6vgmo35c6PMGDngBDhS710PsizOb55U
	8jX+mn8CdR+pGgpknq26ay0xavg+VNWP4ZxxDc6ALnp2LZLiT7gg2DGT6KJBCRgqn8kTwxUQZ09
	i03p8qJlVtwo3IIkNjNVJIihFTTmtfAyIVVMawyFSaXOGVrzCTfyHJblsg0G1jPSHh3xHhWwkN1
	DgJbQDigRllM=
X-Received: by 2002:a05:6402:5514:b0:6aa:129a:1f70 with SMTP id
 4fb4d7f45d1cf-6aab3b647e8mr2420276a12.43.1790175409790; Wed, 23 Sep 2026
 07:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater>
In-Reply-To: <arLZj2DxBazf3wMd@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Sep 2026 08:56:38 -0600
X-Gm-Features: AclHuK883D6T5DYJIUEwz22c4TjWkQLK7CcGTqdjz7jqNMirfKCdfrjOT14z4v4
Message-ID: <CANLsYkzC5DU8j_QJLkuUcV2tYb=G86L_G4yiBZTePKSqiRdd6w@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 13:44, Francesco Valla <francesco@valla.it> wrote:
>
> On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > these are discovered through a resource table parsed by the remoteproc
> > > infrastructure at runtime, their description can be needed to probe
> > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > >
> > > Each vdev is described by a dedicated "group" node, which then includes
> > > a virtio-device node, which binding is already existent and used by
> > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > using its index inside the resource table as the reg property of the
> > > node; this permits to have multiple instances of the same type of
> > > device.
> > >
> > > The binding is intended to be generic and adopted by any remoteproc
> > > provider.
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > new file mode 100644
> > > index 000000000000..c4a0d84b1460
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Virtio devices over remoteproc
> > > +
> > > +description: |
> > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > +  and its resource table. For some of them, a device tree node might be needed
> > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > +  providers.
> > > +
> > > +maintainers:
> > > +  - Francesco Valla <francesco@valla.it>
> > > +
> > > +properties:
> > > +  virtio:
> > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      "^vdev@[0-9a-f]+$":
> > > +        type: object
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description: Virtio device index inside the resource table.
> > > +            maxItems: 1
> > > +
> > > +        additionalProperties:
> > > +          type: object
> > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > +          maxItems: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    additionalProperties: false
> > > +
> > > +    required:
> > > +      - '#address-cells'
> > > +      - '#size-cells'
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    remoteproc-cm33 {
> > > +      virtio {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          vdev@0 {
> > > +              reg = <0>;
> > > +
> >
> > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > provide their input on this.
> >
>
> AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> child nodes using the 'reg' property, not the node name. This I believe
> is the preferred way of doing things.
>
> > > +              gpio {
> > > +                  compatible = "virtio,device29";
> > > +
> > > +                  gpio-controller;
> > > +                  #gpio-cells = <2>;
> > > +              };
> > > +          };
> > > +
> > > +          vdev@1 {
> > > +              reg = <1>;
> > > +
> > > +              i2c {
> > > +                  compatible = "virtio,device22";
> > > +
> > > +                  #address-cells = <1>;
> > > +                  #size-cells = <0>;
> > > +
> > > +                  eeprom@50 {
> > > +                      compatible = "atmel,24c1025";
> > > +                      reg = <0x50>;
> > > +                  };
> >
> > The previous patch introduced bindings for virtio SPI while the above two are
> > for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
> > everywhere.
> >
>
> This is because both GPIO and I2C bindings are already defined - even if
> not used in the devicetree files part of the kernel tree.
>
> Moving forward, I plan to submit at least the spi-virtio bindings as a
> separate patch set, as they can be used independently of this one.

I suggest you leave spi-virtio out of this patchset.  That way we can
concentrate on doing only one thing.

>
> > > +              };
> > > +          };
> > > +      };
> > > +    };
> > > +...
> > >
> > > --
> > > 2.55.0
> > >
>
> Regards,
> Francesco
>
