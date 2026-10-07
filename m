Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DF83128A3
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 00:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334327; cv=pass; b=d8vW7WnLTywKPowFyTmzwXi6WKJky5txuBR/Cbxeg6U1mc/PdVax47DYbU80iAlHM+YzvMqMShjLw50jKgOKlmsMSfmqrNQdV0+tcMvfu4ykTb6uOKTbWH3f0aFGrkvLpet4vPMWnGK2FK4uBYyUrSfjhWH1G09VKSWcA2J28DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334327; c=relaxed/simple;
	bh=BX1JTxbJEXnqNqVkUffmNNj1V50eTcs9S7BDpSMKKPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwtRJRPTFkVTEUbC3VXvvympmIwzPfS6WdyH5KdNDrJC2wQ9WTWBH6l+DTcBwn7maMnRkhYdEq+VVZAvCAQE0ogWoNJ01YnD3MrKH4kve/742K6/Ppl31HDbdjToHlD7h7xocq/sNOmphjajAaWftC5JIMx9hbJGhPF7b2FiCuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C9rCBi2F; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C9rCBi2F"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso4237501a12.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 17:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334324; cv=none;
        d=google.com; s=arc-20260327;
        b=N2YrSfF3KNeD7H/O7SI2aRBZKJ0cQkinszSuBmTxLXVAc3nj1HhyS/bqWmxc94rOZ0
         j8YBAh+mJuMnlGK0NP/x4ijannCjqcQVFEDnp9Im1RPuccoEeva8eSmU7BffphjhHlTm
         AvJq2X6wADBI49JDIs6JU6KK2+DoPFIHZ7XnVy00Yja240IusjSe4t8AWwYKd3C+v+R8
         FJN/QW1slTxq1ulHWPN0y5l7DZSWqpRlXJLnh773UQ4mMckje3NqzvhJ3M78CPyIqbeV
         0YMMrSzzuVPeeTCrmYL9M0iXQtEOzspITbKJovmySiyeWh5qU1h1pwdoqJ9b3vu3kq0y
         F3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        fh=MrGODeMZJXidIF3xuho8SZRnRy7Q9EgP3ErqLLRHjTQ=;
        b=E3UIXMs0YkHw6e6kLcXZQQrYnAA2hs9jHlkLtFGv1IIHocIN4kvCrVgirr6XHiYDZj
         a4udX6hhA8SoW+wuxgvGVC/u8IGMHFLrn3C+83n6Ru7btfZaJGN8+o+Z64CfrhInM83X
         yDJRIUszDtbEAQQRCAXwTy5RVuOlOvFHZW9eeTG7c2BTEf5j0TSO94QaN9fqQZSZuFor
         hP2FBLl6X/dARXqSLu/33oMZ/Mfde6jVNFwJKhl7apK3QoGAZBstXeRKakcff7dZe4j3
         Tp7+cCOos50+hf8VxwzHamm5bggYCMIdw4odiDBxtjNseDyrg+AXXknnrmxVjJjUIWDY
         bsSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334324; x=1791939124; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=C9rCBi2FjKM1nrti3wmzLt8Fb6cPzqlGg6nKk/Og2aTzQk0tWLK/pCUQYdBuk0DAeP
         RoILmNW1xaVMpwOzvmHXM7oXbdcoxQSVEnJazsZMEd+kjJNHskW7bkhMtwwH4Z2Tj9bk
         BUBUBvKvhv1yo3UoUIRD39bDI1cN3zJyoJIfBjGCUIO0wRGZ81XxuEQvvsczuphHx8Zr
         eE7H12eS0gcxcNCsDBkQbfncxrmgQxKxfrhzzMCvLnp49Uy5e6XskT0G060yhEk+sgzV
         Or34qUjhr6eNdtb9HXqpe2Z+w3EfIRTBWVsjfBxdCcPtIod1x23I4BIlrrH6lZoy925F
         zCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334324; x=1791939124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=apuRPorodFVXlPi6ujQSgg4jedhKUrW9DqPeuiGIvWrVjwDlHnrZEYI3BEfLzZzyqt
         iLnIbU4g8UPViDycUexT0yvrI5gJKBuCToy45/vMhvaJ0NKjVteVUCeQuCE9Q3DzTqYz
         DM9Yd//JdKn/9RiBrkqEDIi+lOYbIGLH/D7/k0WQ0flrIh/19RZwnFQL6iCPDguXQzuy
         GQXOoSaU8iYxqpLS2xBIbF29SEp1QgEle0CNaV5u/9pk9UVoPONqUM0DQnYTJTq0TO4h
         KM7mJ3+7fN2OclQhj5MPhSeB7ErJGO0o/pFCcHQW2BF4PxhP1Ua3odT82JtrSIC0b2GQ
         WAvw==
X-Forwarded-Encrypted: i=1; AKwUvBwMXhVQmeQNtsVAI6KQlVfBATUHVwVvohB+VC97hUHLZG3omHsnQJCUmRgkDKWPYLOezXjZ9tjuiga1@vger.kernel.org
X-Gm-Message-State: AFq9FYJN/kRQ47bNEtFITib9FMJFkwLs1H+4h8hxxsegaQbw0r9X2/9s
	rTEVAyG7gJMF+WLsA8E7TMC2aZwLCcgRfhkYroEqdaXvChK03d+QqQIjDTZwU5rTyZkCVE2QpbJ
	iVUkWMb50RM/wbpA3bQb1Ef3qC0+QMAW+11okz+HPvA==
X-Gm-Gg: AYBFou3I4yoVo0m8cwG9V3ImxpouyAuRn3zQvaR7QYrAwRMUk+qoq9SPDOnwWaA/VFE
	3sc3sKiyA8klefVmizu9sO1MT3Pvtn3FfDCVcVcnr7bvmwt6jI0cWBMT/UuriMB0ODZfEvMrgyS
	/TxHJVkEYDwIjaixtqVmWL8aZg9XyzXXuMa5AL9xZH+GqbRQOq2iOtjGexvlfgtvuORHyVHj3wF
	2ApcLwZgiUycytqLI/wjbYho6rSj9Od1SL35WZZ0HAyjL+aBP+7K9zPpuTDh/6UFBIiYtk7IOE1
	ie3K1lkG8trpFvH0kNasC7BW/AIE+CegggkG9gDR/dKZuxqbBbT/vg==
X-Received: by 2002:a05:6402:455a:b0:6ac:73f8:2e50 with SMTP id
 4fb4d7f45d1cf-6aff29b8a9dmr558035a12.43.1791334323774; Tue, 06 Oct 2026
 17:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater> <20261006183910.GA2890477-robh@kernel.org>
In-Reply-To: <20261006183910.GA2890477-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 18:51:52 -0600
X-Gm-Features: AclHuK8OpBmmKBzqQvP8CWwB7vUNA7khdkA2Xv5tnX4fcSWpzyBVTx2EHup08IU
Message-ID: <CANLsYkwhrqk0nQNFuP_5aMYQCLGsLrzm-z9YP+Fvv-C1Ug8trg@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Rob Herring <robh@kernel.org>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 12:39, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 22, 2026 at 09:44:20PM +0200, Francesco Valla wrote:
> > On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > > these are discovered through a resource table parsed by the remoteproc
> > > > infrastructure at runtime, their description can be needed to probe
> > > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > > >
> > > > Each vdev is described by a dedicated "group" node, which then includes
> > > > a virtio-device node, which binding is already existent and used by
> > > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > > using its index inside the resource table as the reg property of the
> > > > node; this permits to have multiple instances of the same type of
> > > > device.
> > > >
> > > > The binding is intended to be generic and adopted by any remoteproc
> > > > provider.
> > > >
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > new file mode 100644
> > > > index 000000000000..c4a0d84b1460
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Virtio devices over remoteproc
> > > > +
> > > > +description: |
> > > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > > +  and its resource table. For some of them, a device tree node might be needed
> > > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > > +  providers.
> > > > +
> > > > +maintainers:
> > > > +  - Francesco Valla <francesco@valla.it>
> > > > +
> > > > +properties:
> > > > +  virtio:
> > > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +    patternProperties:
> > > > +      "^vdev@[0-9a-f]+$":
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            description: Virtio device index inside the resource table.
>

There are 2 configurations we need to account for: (1) each device
located behind the remote processor gets its own set of virtqueues and
adheres to the virtio specifications.  This is the configuration
targeted by this thread.  The other configuration (2), discussed in
the other thread, involves virtio piggy-backed over RPMSG.  The hope
is to represent both configurations using the same bindings.  For (1),
virtio devices will be advertised in the resource table and for (2),
virtio devices will be announced via the existing remoteproc namespace
service.

> Who/what defines the resource table?

The resource table is part of the firmware image and is parsed by the
remoteproc core.  For (1), as presented in this set, "reg" links the
entry in the resource table with the device definition in the DT.  For
(2), the definition is also a device index, but said index is
communicated to the remoteproc core using a namespace announcement
rather than the resource table.

I hope to establish bindings for configuration (1) and merge that work
first.  Once that is done we can extend it to cover (2).

>
> > > > +            maxItems: 1
> > > > +
> > > > +        additionalProperties:
> > > > +          type: object
> > > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > > +          maxItems: 1
> > > > +
> > > > +        required:
> > > > +          - reg
> > > > +
> > > > +    additionalProperties: false
>
> Preferred to put this before 'properties' in the indented cases. Easier
> to see what level it belongs to.
>
> > > > +
> > > > +    required:
> > > > +      - '#address-cells'
> > > > +      - '#size-cells'
> > > > +
> > > > +additionalProperties: true
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    remoteproc-cm33 {
> > > > +      virtio {
> > > > +          #address-cells = <1>;
> > > > +          #size-cells = <0>;
> > > > +
> > > > +          vdev@0 {
> > > > +              reg = <0>;
> > > > +
> > >
> > > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > > provide their input on this.
> > >
> >
> > AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> > child nodes using the 'reg' property, not the node name. This I believe
> > is the preferred way of doing things.
>
> It is either both unit-address and reg or neither. It's preferred to
> have them unless you are just making up numbers.
>
> Rob
