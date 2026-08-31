Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3C230568F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146016; cv=none; b=kfWF3FQo7B07f3MPtJTyQFMKjUGRvs4DxZgz8dx4VnJSYXhjNcBndvhVpqflhESvaTYE3ruGxMDNwoOkiNdudpQzkvmLDjCO278+dwZQK1PcbSJ8zN7o/fn56iIYeHylrxUmmt6LfxF0lOww0xqcdUC769kwQWet9KOcH4NqfWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146016; c=relaxed/simple;
	bh=gDNWhvC1MHjeRnSoLQ1v0Xnm6YeGJLpIUi9qorQYq+8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ooAkV2GDGy3qjRF/yZotqU4gzsxlZrNYhPub/c8H3XdgKekuE7h6g3YOxvyoBy6igf1pSz5lvPBngoySjcRXZpeHVO3d8XeHcxkS97zABPIs3tE3i7G2mZJFrxf53rfHM4aqKz2GbPvqAxT4nMvj2pxlHZs43/pYbSETBqDeMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHvN/C5d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHvN/C5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA461F000E9;
	Mon, 31 Aug 2026 03:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788146015;
	bh=TF4AKk1EsVV/XKJx9nYoFtdoQvtgDf2YcDgvnzOAves=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bHvN/C5dwSYMD5izD39sFyQG38xqrar7yxadw6sFy/HfMgVIneBvl4x02L3xXIpfg
	 jXMLdiYV53IvSLvgNPJisivoCgfPwtEXrbFl5n6ev11M2l45lgkEfBqkE9RziOHlaq
	 9yfCH1sRJQdngBg00t9p9HwakVy+7535TJvdLMrd1W55NeZqauTpY5wl1u3zPKaury
	 Fusfs3t/7HsF8xvgAMKxoJDzQRm7yY8SoGyUZoP2P1pNzVkI1fQJqDFnPdZg5pa8D0
	 YjibAPn4aXu5TH9mHtrOtguQZ3rE85JhUMNryXxbk+ObLpkx0pVMOvA0sFAIO4KIwy
	 uHb5ugs/O+FaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/8] usb: misc: qcom_eud: improve enable_store API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831030147.1500616-6-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-6-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:13:34 +0000
Message-Id: <20260831031334.AAA461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The primary hardirq handler sleeps by using `readl_poll_timeout` w=
ith a non-zero delay.
--

commit b021d31a749af395e42d221e7a9f69b7a26c01ed
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: improve enable_store API

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 45c90d9f3b1f6..07522225a8f89 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but can this lead to a panic by sleeping in
a hardirq context?

When the hardware fires an EUD_INT_SAFE_MODE interrupt, the primary
top-half handler handle_eud_irq() calls pet_eud():

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
	...
	switch (reg & EUD_INT_ALL) {
	case EUD_INT_VBUS:
		usb_attach_detach(chip);
		return IRQ_WAKE_THREAD;
	case EUD_INT_SAFE_MODE:
		pet_eud(chip);
		return IRQ_HANDLED;
	...
}

The function pet_eud() then invokes readl_poll_timeout() with a 1=C2=B5s de=
lay,
which expands to might_sleep_if(1) and subsequently calls usleep_range():

drivers/usb/misc/qcom_eud.c:pet_eud() {
	...
		/* Detach & Attach pet for EUD */
		writel(0, chip->base + EUD_REG_SW_ATTACH_DET);
		/* Delay to make sure detach pet is done before attach pet */
		ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_DET,
					reg, (reg =3D=3D 0), 1, 100);
	...
}

Calling a sleeping function in a hardirq context triggers a
scheduling-while-atomic kernel BUG or panic.

Does this sequence occur when the EUD cable is disconnected in safe mode
and the respective interrupt triggers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831030147.1500=
616-1-elson.serrao@oss.qualcomm.com?part=3D5
