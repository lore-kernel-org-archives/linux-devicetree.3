Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4AD39E177
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358006; cv=pass; b=CZh5dY58TdeGvW0tGo3L6BJGI7TjTDLGnpRKbYFF9QvXiuoyrmlLOo89uv628CO1Qub2XJFY7ifSUKUyZ1OMJeV1BcN0xjZGoabqo2aVKzjojNtsdWz9kB/Bepbc/oXOeFsA5nzRddZuIkowI8iwXeNwGU8+inwNZM9mjzB/gXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358006; c=relaxed/simple;
	bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LV0JwA5TdkF2dhghbzD/t2/gojStrRnbSJ8tmF2MbGNUU/oScyCBGaIpoalVDw3RBSR2s4oORq5Ha4RbZfDZZFFV2TZXldpUi4J8DMovG4o41nR1CqGOQpIk7hhZrRRBzcOD1g3r0PGRM0p6fQB6f+KFWptzIheA2XYSjXmpb98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NHmWkar2; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NHmWkar2"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664e3ed58bcso6159609d50.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786358004; cv=none;
        d=google.com; s=arc-20260327;
        b=Eq6K3tDE9ZZjHAO/8gtQbeAp98CNaCuu+5hapG19S1ofmGXmZdtJTSnJNr263+2S9w
         IRPq4gMw0Fj7RGipKQC6/5TOAxKtQ+ERrREmGe57g2zqKKLtB9e11NubbLocA9pn0m/h
         p33GK6CANs0Jn/6UZ4gmlZMiV4H7qNlUegDnUQv+IV7g4hBhQaMQN5/8vEFnPduH4rQv
         Wt9AEYpkfdoZx6ZImVqWH8XudsuRuhG1Y4qDVwMN+kxzxTN+LakMYTaG2my/bMGPwUTA
         sRhMcuplTCAqBN9yy6aAqv2TiSsgxP3nYxnpNQsZU9TUUbcFaPKN6WAV+dlJY3/5Ybq3
         mk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        fh=ts0Ohw9RNwebz5ePYI6PWJy8nTRT66FFruwPBuxDR5M=;
        b=hQ5ZZ6oUiGpK0mw7p4yMzOA3BjOrv0JEpnYmn66aKTZpO/kh1/WIHnou2SsPeC9Snw
         HXdvGyO9azHS6QRLSw14V5jBDxi68yI/bk4D4NmbtUhwHlbOPAT4qCzIXimmHcLpYgT+
         oh/YCQaZLx0b1xu4u1UCw4aKX9C86dSL3qLjcaeYmdklACAMgeeAEdd2KUufowYUQtPl
         b5rfwdkjtVhGlU9E3GrOyuSfi/H/bH8CV+hFpw2k6f1KT+JJQhKIq455NseZX2+3ss9g
         UI7PtdZj64a10O1oBNkB0Zexl3f1pMAg3hzx5rs7kUEJh/4pkiWHRiLikyC6RXWyHx0D
         bJPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786358004; x=1786962804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        b=NHmWkar2TDJGLoP5nF7FPqt/P5hhoYuW0myeMoLI+fAw9HSTdxpvWgXHLZ3L5ysMqa
         0yQo0zrzuvHOHm+dNQ3sCXgZiE8DHSJSO+f0ZyXENdX1LINduBo11/t7Lsb2AMxIXhZe
         PiJ7Ks7hDEptIA78yZpn8nbvZZQzMxcZmlpVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358004; x=1786962804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        b=nZDA786ZwKR8AhOBa6dzbH6+lIyFEaWZbc5AZZ+L4kOM8BPAxRcb+cX3l+uwllBpFJ
         VQ2nwRO7FuFTLzela1D/YBskIHB/tFuZEOGV2nzjSDpuQiA6agoVii0ErqqbbJEf8nqB
         /kzxWQIq4PfiZ0daV2RbHfaDH8zYpn2Pn463l1Keo/JUaVhtigCX2pcbV9nRHtxhA5z8
         SN5Qkc4W1/IvMbE/Jcx364Ioyjo4PRTJ6zbCZI4p8EXbiYgjFJvQWni4qa3YauDTRPFC
         em3xMy0xyCHj1LdYRz7PbWV++DqS7IQDa56kkoErk75wWa+FT4ofgLgfIbHN/RAiZI3y
         6FsQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Naru1VVZtybk7m78369fkxMoctObrnxTBBc5ImpBlTQt+i+sykGuGcq32xFp/2RYRlO7XuYH9vrx@vger.kernel.org
X-Gm-Message-State: AOJu0YzIG2qSjLfm61PpPERCghX4KK8tXo6K0/uHycbYIsC7CbWfY01i
	xOx45L2rKCe4ocpjy6LHGydbl+hD2eZdi/+VW27QD59prlXtwAGwfvNxH4weQP4GYSim3iBbJPW
	BMBpMLVe22kwU2tBS/g9dmhR6tm6gvEsVJ9vv6NJW
X-Gm-Gg: AR+sD12bSKO6Q+FTDciD5zUjZiC+UeraChBKYyJnDj/LWsGt8+SPLQvUhdLd2Py1eom
	7+JowfB4NNt78vIB0WHtmzWHurOE1KIknU3NB1tdNj86dpxcF1cHzM3GdaKGK+oNbPq/BmkAR1q
	n84wglgi1EX+U8EqKzcncK2WAHOSyatLqwPWScGOCXqM0TcS+DZbkS3ThYYFH2k9WfazGdp+jAP
	G7gySpzJhLFl0hwOXu+s5dF8Oc0MbHjn9kA23Psgur3chut9pjg4OC3WpRsyMEKToG3ZJxUW6mN
	PL2oedU7RQPyigamrZOjl0CFgFgT+0+XNWBDlnyh24kZOWPfmSXAt0051mr4xn/nAS/vfzwsvrk
	=
X-Received: by 2002:a05:690e:244b:b0:667:ef7f:c37e with SMTP id
 956f58d0204a3-66ada8434d8mr7210260d50.8.1786358003849; Mon, 10 Aug 2026
 03:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas>
In-Reply-To: <20260807152059.GA39821@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 10 Aug 2026 18:33:12 +0800
X-Gm-Features: AUfX_mxe5L1RZVyMRQ0Vt-LD7TRaHThgwqJqmmrQKlLCig1wrp3paWSMXqZXYyM
Message-ID: <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 11:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@g=
mail.com> wrote:
> > > This small series introduce support for 2-lanes mode for Airoha AN758=
1
> >
> > Just a nitpick, but I would probably name this something else, like
> > "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> > has 2x lanes as a standard feature, so this naming is a bit confusing.
> > It's not like dual-LVDS display in which LVDS is only a single lane.
>
> I suggested the "2-lane" and "x2" terminology because I assumed the
> result is what the PCIe spec would describe as a "x2 Link" consisting
> of two Lanes.
>
> If that's not the case, maybe "cross-controller lane-bonding mode" or
> "lane stealing" would be more accurate, but I don't know what those
> mean, so if we use them I would also like to know what the result
> looks like in standard PCIe terms.

Benjamin pointed out later in the thread that it is just bifurcation.

I would assume "PCIe bifurcation" is a standard term, so maybe we could
call this "Support un-bifurcated 2-lane operation"?

On the implementation side, having to reach into the second PCIe controller
is a bit messy :(


ChenYu

> > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > normally attached to this SoC that require a 2-line PCIe card to
> > > correctly work (and give the proper performance)
> > >
> > > The first 2 patch address a limitation of the PCIe implementation
> > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > all at the same time (for all the 3 PCIe card) with PCIe
> > > enable and disable.
> > > The 2 patch address this and introduce correct reset to control
> > > reset line for the relevant PCIe line.
> > >
> > > The last 2 patch add additional logic and support to assert
> > > and deassert the PERSTOUT and also apply the required configuration
> > > for 2-lanes mode.
> > >
> > > 2-lanes mode is implemented in DT by adding the required property
> > > and by defining the "num-lanes" to 2.
