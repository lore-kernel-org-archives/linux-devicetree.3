Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A103D7D8B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746363; cv=pass; b=Plq0cBt6kAL/RuUFgKXfDoU3RY/vLx2twHTAM5bv/0CRXoHz8Wf37kctl7nEYrTt7+FBeA8rnSxiQYYuYIZJXPwtaXXl8XGaapi/sq6lqvkY1bdcmpQSXFB95zaiu3u6V3iILfXxVPZNKPfdE2TgVH1KPkXy/t+32RBoPKPIDyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746363; c=relaxed/simple;
	bh=oHbtBEkbphFQUW5rUMf/hP/W7ZvDzmG6TKzaeOsCIxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5BaqqhrFjll4sVg+04Epe0yIXQ7XNd67/qP1yMwXb57SK2vw4WigfNkQ7JRRaE6q/iXnFTlgMxmanHKak+H/+M6oDyPwiFlApc5sPXI/gZPo+vPTrDrwaVvDeOTtRP2RyZXYnUEPfSqktZuT3MQMeusydYW9Dm+UsdblwoOWcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mPoipTW2; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mPoipTW2"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so6742908e87.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 01:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778746360; cv=none;
        d=google.com; s=arc-20240605;
        b=d2p4RhxXN/fGIB/eqojTyE35QCF2bPgw6NMhvtzqHMe0Q9n4EgwUzgy08F/v2hc+Sb
         rIfW0tt15HwhspY5n27ZMSPRjoVEvi0SDgouKfbUNV3x6albsc/Jmrw0Cww316LYewIb
         d4zmUjHUrtcB7GV3XgxL9kjGDWJ86yz6eR3KEKeMF5fO2IP1iwZsgNLKrd2QOAl8wvB5
         uGrnEsK40o7jOGcPECHIMQJMpemE2QXa1FT5brvOF0vq+FgE2Y041z4gLxCD+Nutfi3G
         anAluG+cnfTNv8srHLMriEUdOPdoVldDIKuU42trKsdfebUTBQGtVpfAQpWuDEr3SuA8
         1QYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mfi3vmziZCkgZK4Pj66Mr9HPjc3VrKkwC6hLHO+X+Ns=;
        fh=y8A5FA96Kku4r+kKcuo9GBuShtbuio3lMdI5G0WC+kk=;
        b=kN+LbAW67ROWvoGTcx95yLZJOp/0Ninx0jm685q3WzAaszQbW+hAWfKBRNbpNmzlRi
         CHv40Jo49Sp2bBlU/CsSHKstF2bLuK8ALO6+5h3Ho11q73bStAxhWRVPfimSjkkJ1EdO
         IUbEl86BOSs8bONuStR0KEHK4pIUjBS/BT0AcH9cmFY3Vl7sG+7KAWsNSJmIHsv1DW4R
         GLjFGHhwDZ5S7IyHJXFE/AlfO1ZrDISbgukcg6xa+JkOt9B7dkunPB+GUeE/4Qt1OZ0c
         nbwY0MMMoE3mKukuIwhayau5vMn+gFF8z3J9RMIIDC/Lfh6Wf28o104Y3s0zIrkv+n20
         wNpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778746360; x=1779351160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfi3vmziZCkgZK4Pj66Mr9HPjc3VrKkwC6hLHO+X+Ns=;
        b=mPoipTW2Vfl3UjoZ+E+GFWAwG0OvRL0NPi+dibxCCfHyhpfU62UhPsDSD1w/a8ZvHl
         wz50LII6c+JvEpiP1yTq2JwqilciYMCX7RI1p1Oq3h5AmYoGe3BKtFoPR5vsT4d22/bm
         VuGQFFzPVqZWkg7i5aPTZQLO91Vd6D13jvOsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746360; x=1779351160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mfi3vmziZCkgZK4Pj66Mr9HPjc3VrKkwC6hLHO+X+Ns=;
        b=rDhd02r1fedKU3dGwzewxwW4Xsc5xkqwaF5YftpmXGX30B5k5sKMuhLyE/O46NYvRt
         UJqHnGH40oAVlWbh9NUKO8IFpsYkd+QrgiVm8DJTxpffgK65Z1Dbl0tEowUfd/Vn61r5
         t21g+JQetSfMmDky0y/WYipvudJ80iz7r52kWPUu7bGtlR0RHGEAot967ZQ2ZHoI+u14
         Y11kfa/QYAvFglhL9hGJhUTVNU77kXG7qoQ9XH4neI9JHr6MlLloGz1xg4fzwZi0uIdb
         vBpnO63OiOgXwAD/eUP7cBwsTqVKq5oYhC+3T6QLC8+7FQeHSnbziTReNSazEYNgAU34
         2xbw==
X-Forwarded-Encrypted: i=1; AFNElJ83meLT/w/OLK2wgsP/W3Swj1VqNgMeQbblsmUtIBqfHbLPGWTDO399GOAQSyrbST4gXbrxyZYM+d8o@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqK+5VRvg4SzF4KtAB2PoOT6Kxjf7gIMS32Ru8D/S2OoraX3i
	+K0j6Pt+BbPjX8ja2+9pzU49AU5VUUxS8egqs3MygxDx5dmoTIT0Sc8aOfSWUJVbbJxdmYu2eWL
	C2unBzU4kbgTBpg6I3iYZJhYd2eqg9Wrftweeu+E/
X-Gm-Gg: Acq92OEjr2QDNKdMU688rIKeC+an4MjikoQqldNCrT1UuPagJotkqmvjBf9nx5ov3J2
	HgtET/9mIMaXdL9zkF9b7ZNwhNSScecVBW7oksk1TJ42HXGIoOnBwqb8FfOv33jOIJuW6sn11Q+
	1W6UpGZR9iVgQtNYyfKN+fleT/dggA+8QZX+03vG7/kLRT6qCB6e9s1yL0/Scs3e2BKYLyh0/IE
	8Vo/+zYTQgGpWSTLp2zLRk52+XXpgIwqotvVLHtpIU/wzUjmGGAlO56J2r8ys3d7GDykDVm48+h
	hG7To0L+XpooILdeEbC2xXCs0QMNY4JtkDvQ1cv8ZOvrs8ms
X-Received: by 2002:a05:6512:2309:b0:5a7:42e2:db4 with SMTP id
 2adb3069b0e04-5a8f37c58abmr1953278e87.15.1778746359826; Thu, 14 May 2026
 01:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <20260513231550.GA2280946-robh@kernel.org>
In-Reply-To: <20260513231550.GA2280946-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 May 2026 16:12:28 +0800
X-Gm-Features: AVHnY4KRPKUvW-Q_3NPzMqxJlma4P7nPyfNutA30R4nWp-TJgNSuE21IDg-csC8
Message-ID: <CAGXv+5EXw4rXD7URhXvotxsPG81EGhhk6wqnFuVWig=dTdNCXA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 7:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > controller memory access could be limited to a small region by the
> > firmware configuring a memory protection unit. This memory region
> > must be assigned to the PCIe controller so that the OS knows to
> > use that region. Otherwise PCIe devices would not work properly.
> >
>
> What you are describing is dma-ranges. Why not use that?

Answer from yesterday:

I didn't know about it. I was just moving the property from the WiFi
controller node down to the PCIe controller in the other DT patch [1].

Answer from today:

Also, it doesn't work. See my reply to Mani.


ChenYu

> > Allow the memory-region property with one item pointing to a
> > restricted DMA buffer.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > This patch compliments another patch that moved the memory-region from
> > the PCIe device to the PCIe controller [1].
> >
> > [1] https://lore.kernel.org/all/20260430120725.241779-1-wenst@chromium.=
org/
> >
> >  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.y=
aml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 4db700fc36ba..4a9e41d01628 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -115,6 +115,10 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description: phandle to restricted DMA buffer
> > +
> >    mediatek,pbus-csr:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      items:
> > --
> > 2.54.0.563.g4f69b47b94-goog
> >
