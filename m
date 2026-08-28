Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4122F7F19
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923102; cv=pass; b=mbsKZOUmNu9vev6eIRZnOrGcVecF2sljvHqPjeoOXsAAKTsd9seTHvRBbISQkKN3nBa8yKET/a4BxwXwX7IHq7TxeHFT2cLG3Ix5Y2F3QuYK919KMPtzmWBO7/1mjpJQSf7cCSVYZOgtBG5/p3jPUscKUGVS0z+nFKm0X2u2lFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923102; c=relaxed/simple;
	bh=yV3JE0Cnos9PoA68Fc4Q90Ws8HM+nw25XLSK+zxbXSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpLhaRz+w7tF/Ohl9bjkTlIkt/i9l+z5jwFaz6u/mO+7gDPYFQoRUNtY6My+u1snhe11WKCfNzEZrqQywGAKDKuVC5Zv95GXE/hhId9a46z4czPRDcFo3xXbcbJQBx3vV3Na922HW5kV3Viuo6gw14ZLU17c0qHGaAlYZzYquP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2529b3139fso127381866b.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923099; cv=none;
        d=google.com; s=arc-20260327;
        b=e1Uf234IL+5nw8EoNyj5Wej625pdMWqE57P2eg/7KjKuSbLzP4VkOVOEoVwyHf4wgg
         Pn0v5KokO/anfIa/5RzV+jan5+nLdShmAE6LaoV5xEBjpXWp/Lgn8gbwpjzDJm5inS//
         ot0hTBc9fVn52zcRJITqvBraARALdDIGvbq6hP9VmCHrrIhkWG+89VYe/lSPfCY72QYw
         edGhoDVnC1kkZEASLqe5BadE+LHg9oirWTIQIWt89/ZvDfJT0ywRGSnkk7EnCFkWEKI5
         Llp6iC/YVh58wAr1mqOcvQMKn20p53OllskFCs8GN5qDtbRaKUt6gQFrFxzgV1rmREdl
         Qong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=PFz56wB0GV+0hhESIdSd+taIVyxjjVHt3mnYzY55vbE=;
        fh=H9un39f2p5oNy/vdDYKO/e9afme/c0u77XhEdc0uHpc=;
        b=kQLHNzhq0m5jakFCDFGNd+uL7+4ALftnwZW9v+nSvpdGhKMBtR30N0vWcVu723SX4J
         g33/gQ1V8ePXYIc0JtbnVMqXEK1bwIgmDk8GsOq+bxMIP7+s7s1/ZB2moZIJzzG60s39
         1juVwSbVCgE5X1Jog+K8XVJDCuiZFJCCbXkYS7IyOX7gqfn5mOqYD1h+Tu+o2Vmf4Wed
         8+h5cpAAzIFyqzCxnG4V6p6L5fWXQabCBLGx73idH2RWqRIeI7L3R1bUPhLrhqRRObHV
         GBs8sgqEVYcoGDPlfLOHldG5ZD9s1Ft3EU2PJVvN4RLo0CSR71ukN0XcOLM5KBtTeB/W
         GBQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923099; x=1788527899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFz56wB0GV+0hhESIdSd+taIVyxjjVHt3mnYzY55vbE=;
        b=bz9eORTL2+yDbU/IkSvGpGdNJuLXjwSP2kKLjJ/78CqHQyvIDRLyRj2Rgy8JjXNIyv
         kKIH3Xtnj4aF2I+94DqfCTH7itWn5dHpvKvaD0BH5bZFvjO6KmgtNeetw/VlvxfzZgmR
         wD1KiZ8NRir0C3z1vmKTIRyDV6VbrxIDJ+RLcr7qaa60xYEhwfo6hg2z8BmhGn2aJ6my
         H9o2e2rCnPRwh0sOCudHlYylTSON5Hewp9KlLJnSREy99+dVUVhGzgivtwPSXlMzs1p5
         xe18n02HVs4zvivxf7NqRV2VYZZiipE8KFXV+UKxXsZs0Xi45GqLec8slRiDDWeqPolU
         0rOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqrzy090bgkpPxe1NJXbIrfwE+brOTi+rvhyOxvHGeMC9AHtkJMomSkIar+tViEZ8O+NR/iFFwQzN5E@vger.kernel.org
X-Gm-Message-State: AFuF++nvpY9HECrYC06TFLvEAmIqbAHnaG0DOMjxt8ZPfZDizFgLACTI
	Jl4pDw19ZghRdE1nlr1W9PX/U6I7g1dlm2i3hnzQqwqjT9K19kqUpsFXFyxuo2iSkMwHy6Lju+8
	NO/haHjHdsdxgTWxihlk79E9Xq+9fsm4YyCoX5ENF
X-Gm-Gg: AR+sD12fzGTrGzVRJ76vnihJve9h9SUf0d47/Xxif8CeD718LwPCh+DW/6rUtIkvkwc
	7g2NpXKKWc/nZnSCQ1UcP3mjqdtxuYK27/1JTQ67/ZhF0kAkuSIsiaSfL3tmZh5Lf36pUUgSxPz
	N+1zopR/eLyvQdAdjhFLxgY36OlJDBCaGlyqik1DfBTZsivi2b8EiRukPE0Vtmg81u6XyoF6q1U
	zjUhM9RFp36CEwoHqoZfeaJL0gxaZDVBEwwha64O3bM3w/VAaPlRvSafQ/iRHsWzRbLPJX92iqE
	3POYMWkHQxRHikbYdsdRHtxrUjdL3lxZqq7xhoKiNxqsXTB6fSaha1aI8ECKVuylYm7PJ7VdT+/
	C4+w=
X-Received: by 2002:a17:907:1b07:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2556fe4518mr453938866b.8.1787923098863; Fri, 28 Aug 2026
 06:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com> <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
In-Reply-To: <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Fri, 28 Aug 2026 15:18:07 +0200
X-Gm-Features: AcwNN1UdhBXMcVV342l5oAIhvqQEvxYxIlYwCOo4jCJdj3zhDYTey4YdaXTvReg
Message-ID: <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
> > From: Matt Eaton <linux@divinehawk.com>
> >
> > Document the xhci-no-soft-retry-quirk property, added in the
> > following patch.
> >
> > snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
> > peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
> > accepts it there.
>
> I do not understand how this sentence is relevant. Please describe the
> hardware needing this.

I came across this while porting the UniFi Travel Router (IPQ4018),
the stock Qualcomm kernel is 4.4.60 which predates the soft retry
code. The command ring hangs if you disconnect the device while it's
transmitting. Reproducible consistently when using USB to tether to a
phone.

> >
> > Signed-off-by: Matt Eaton <linux@divinehawk.com>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Docu=
mentation/devicetree/bindings/usb/usb-xhci.yaml
> > index 4238ae896ef6..5d67a41658f7 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > @@ -25,6 +25,10 @@ properties:
> >      description: Set if the controller has broken port disable mechani=
sm
> >      type: boolean
> >
> > +  xhci-no-soft-retry-quirk:
> > +    description: Set if the controller cannot perform xHCI Soft Retry =
correctly
>
> Why isn't this implied by compatible? Looks like controller's property.

The xhci device is created by dwc3 core as a child device, and so
xhci_plat_probe() is used. I think a DT property is the right
approach, similar to quirk-broken-port-ped, but to set
XHCI_NO_SOFT_RETRY.

>
> Best regards,
> Krzysztof

Cheers,
Matt Eaton
