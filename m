Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C32B326923
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277549; cv=pass; b=hLEuC3E4Vc1XIeKyw5bZthpH5hpaeFbE6VkRwxDvvq3aDek8tex7E+DulYarvVRSYjn97dp4Rnj7fzTOBnTo0gTXCEM0scLhQujzBv/HeX5tj9+4IBjQK3lCDQZL2BH5D7O7U/k/1yocAEZqdpwJ78ZVqopcYDVN5brHn2V5EhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277549; c=relaxed/simple;
	bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4w1/SNFAiD8SXZZcDnZHXD/2X/HvqtUYOI8SujFOQohOM8e8es54qUHE1Ohqimarukf6heJtEUC4cjWS2Ad2b0qVav61TCIJcjBRLYPmQcCxbSemUtLSjvz1wq2dlWokYC11S0+hVgyUQG8ycE2mNFBUwk9Mt7+1q6dv2YXCjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr6N6SqC; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr6N6SqC"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f23e851626so5627626d6.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786277547; cv=none;
        d=google.com; s=arc-20260327;
        b=iLAY+/D7etlMu48vfFx2rQNZYY3rnZt0f/uZN179EAOXoVKVYkb3IFWzzrGYmFKVpQ
         DHkKeutXqz/IZ8cGPDMM3Ys7Jid0jKAr7HMABCj/k8q4g4J2sPvUKwqZDQBEvYebXx+R
         BOO503GpbtqT+ZxlZ2/Zu4wXeeNPi9dn3zteRXhY2kJIGFQ9vR2KXPRDuhy8xrXCJDER
         8UYBQ13PQbkrPwVRkpt7VqvkEaVsmsDrYX/NRRvO+cdw1Ol+O5W2yn5HXGcQ4gpRbYjB
         gJGZx9l0eqBkC9hMibS2L01JPhc/MvTIxZID7ZSt6RS/K0t7bN7K1qohSxKARzHJF402
         h43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        fh=mktbTZN1iXOdZWz72Snuw4dBf1fsYHegJe1Rt/QIJHk=;
        b=rtjqy7LcYHDCThK4f583/AV3ihZjW0AHTs7Ork4y84hxSyCkzPmFiPFQU8oslquqPv
         qM+wEBWqNeLE1GPAmoA9HIYu1Hu5GtYF86BPwTVH6xblS/VUJKvuU8znBR330pcZFUcL
         hKYwJcjPNmmsGYB6VSJstNZHbmuu+MxA8s+CIxuyG7Ld8md3y5WftpKQnMMCZispmYen
         QmwgLUTcWmAx9Qf70SuL/NI3SrT1MSX6upwygiQNR/+HpKXqVKjsJCz4/msZv4kRlUO5
         0KYgnj19Wd8GWnKqlfnty/fh9a6vlo0cJxf8bq7sjzItIrYBPZa8wH/yxpZBaPx3HGdI
         oHXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786277547; x=1786882347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        b=Pr6N6SqCnPt0Ukn7cEcHuU5f/Qj/whCfNbOHWK+ADF1u3tXVWY3XsBNoUwRWmUfYBS
         UBXhJ5JNfmId/5OdXsOA4Xka3Hv20dCU1EZJJAWvED37ETqSL1CdI+ktThiziUGDMqbR
         QEpK0okVy3Ho9MOhmTa59wrsvbR/IlU+YBneE+NvtNWAHpaRLe9OirRLsW36mippWe2b
         KD/omqSMWulxwVm+foKVbuy1Vw5xwS7ecblRr4sb7MlcEziS/W9VQ57lj2p6+5uMhXDm
         SaUnnpAR6jvvHu6SBHbzbo7AI+a3fBViVCn13gD14qYJX9oLnApWNSBxJ3tcqUmOzhZp
         Fyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786277547; x=1786882347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        b=nNNq7mMDSk1jqGxoZbt7ypTH7LWG92pStSgQBGAwOKR3OxbjqU3EOXB7GkjpWsKHre
         jyolMhZ3JB8UIddYUED1AyroGs27XGSD4rFTcIj7Rk3G2RtClvi7+9xwLdlQcD33uTyX
         YkAGMR4HE21xXFwKWZETBaBGmSuu+Q2GoGsbwCabFQrwdVsNzKUr1fxuGTkLHAevyO+C
         Hh0tMt3M9DEXSjACUGK7hdPEFBEjBOtoERQjLDzz9tNEzG5/1pryaxxXsAkzRyNtuUav
         pzvVTVb1Afr52hpakpNL/wtZw0YufmAVj2pfzpeVm4o5DQAM0HHaDR7pNtBAnHkwsSHR
         XcDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+YzphtHC/nyHhaE5fh5rgLiz/5zZN5+pCtqMgqx2mA4QjashN6oJC3XbUYxE0+7ckJ0BUk9hT/vQG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Ml2au+njqkaAxJXdcmgOFAovy/WPMfVF/19GFljIQtxQJ3r8
	BEJJQlMNGrIu/mFhvKyFK8XYAJmpuiKX4Ohi2cPioiMHHN/p6DLQW6jfJbRKVOUCWKLoi6YTfIT
	GaWzlaEFz2BUruLBU8g1rc+qRs08kmbw=
X-Gm-Gg: AR+sD13jYxJv9y4HOHiwFoC15TWuIoang7RTOC8/2cshh2kdoL4to71wwh/E5QeeKuo
	Jg8tbXYNyIS4gU+KTA4VzBTcRAQVfmx5bT6SPt7Dul6qmDMWfwQUgesUBLeeKIx+WgIX1Dgonz2
	ArhPbQhTOD1xBqHMkasOzytJi3E+eRCkAp5omxVy6xyVggfSWF+utxI1ni8HEIQ97dscvGzv0YR
	CEoQrZBts6sTxbEXiUEsbebayluT3dFILVx61/h6sqwNLHBxcAl0XfblYgnP4xBRxWjAiAijWmI
	M29LAJHU4xH3zZOSIruGUH8jM5nLyq92UItV2bmMNA==
X-Received: by 2002:a05:6214:5346:b0:8ed:1887:426e with SMTP id
 6a1803df08f44-9088126d7cemr445146386d6.24.1786277547104; Sun, 09 Aug 2026
 05:12:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas>
In-Reply-To: <20260807152059.GA39821@bhelgaas>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Sun, 9 Aug 2026 14:12:12 +0200
X-Gm-Features: AUfX_myzAmsvVlb0T_3tOngECWxC2UoI-Iw4nvKe7r1djj_0kecpEPp7cncj8nM
Message-ID: <CA+_ehUxQfWRRec4q2ZvC12nYAeV2VGm1xCFrTWeN6sEL+qkXBw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno ven 7 ago 2026 alle ore 17:21 Bjorn Helgaas
<helgaas@kernel.org> ha scritto:
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
>

Mhhh I don't really like the term lane stealing. Also cross-controller
lane-bonding
might be a first. Even if correct it would complicate identification
of the feature
that at the end of the day configures the HW to provide a 2 lanes PCIe.

Consider that in such mode, the other PCIe controller gets disabled (this i=
s
handled in DT) so it's effectively enabling the standard PCIe 2x lanes
and apply the HW configuration for it.

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
