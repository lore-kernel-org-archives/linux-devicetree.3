Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC11D63E4
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786712150; cv=none; b=GBtqJZbZc3vMC7kivtHbpU2+MhIQtqY23PT0patVwdWRzsp83PA5j0mtwi92esviuNiTEVVZttVtpaYIaTbcO/U570sbY9rRPX/5zybrK41lm0o8DG4+7GpWMLf4weLZm/+ng7uLJpOWSpghCRIsAWL7mVzpJ3ctE5agC9mX9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786712150; c=relaxed/simple;
	bh=5CyJvTE+C18+28hqN3SKsvblt/DEqcy8hmgnnZ6dd/s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JnSkytRK/B69wpUoaW/vDGYRSDWU3YUFD81fjU4ba28etczJBCneJruN3OmLOXdhhPNgVmjmcjaQxUYre+t2jhQAJdoTcvilFyeelomIFoPg+YYLaJBUSmXyoSRvwO/AYalhQqm6Hq1yfu1HV9j0urdmyuzagtKJP7lEssOYaCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=IOAFiCvO; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IOAFiCvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786712140; x=1786971340;
	bh=5CyJvTE+C18+28hqN3SKsvblt/DEqcy8hmgnnZ6dd/s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IOAFiCvOuY0ejXPK4bAzT4AU+PGHAGgoIV9Sy2zFNgzy7K6uJeFB5UB4+RQuc1Twf
	 Vt8I3eeTRc+ipNv+bnvM5WA2kNNO9KddSadf/WgvudTQ2p/5/SzOx0GFVRR2R/je0V
	 WWTQcC4Siv1BrugLahM6nNnBadVZmQA/AjJS22l0vnxTfOLDUDMhthoG4cOG4vOgBc
	 dLCxzG+1xc3FWQA32AI0d0aFHEPzta5PTU4X6F1I9MX36CzBGgyKtzmg5RExonfOR8
	 G0Pg8vlhKzTa59a8a7Szzq2a//c4ToKUp8A/e3rrq8tchkJCwPI3r42kLoNpJxQW4u
	 qKyfG6bFhMghg==
Date: Fri, 14 Aug 2026 12:55:32 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpu: arm,mali-utgard: add mt6572
Message-ID: <47r1iD-p_AVnHH7YeiXxNHnX9o8zmOaWUvLivra1vGyPngBdfaTKUtwGb_OAAwnW0-mu41sICz2PoKyCw99AACkhjt7XtyQp3_40jLMAUKU=@protonmail.com>
In-Reply-To: <20260814-portable-premium-avocet-eafbe2@quoll>
References: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com> <20260814-portable-premium-avocet-eafbe2@quoll>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 2dc330e17f8b88bcaf3ae0dbfe5c2b4bce6048c8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Friday, August 14th, 2026 at 1:36 PM, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:

> On Mon, Aug 10, 2026 at 11:16:19PM +0300, Roman Vivchar wrote:
> > Add a compatible string for the mt6572 Mali-400 MP1 GPU.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>=20
> Does not come with resets?

As far as I understand, no. Vendor kernel says there's a reset, but
toggling bit in the reset controller doesn't crash the GPU. I assume
android kernel has copypaste leftover and the bit is reserved/unused.

>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> Best regards,
> Krzysztof
>=20
>=20

Best regards,
Roman
