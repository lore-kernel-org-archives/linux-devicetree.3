Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6550E343894;
	Wed, 20 May 2026 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261824; cv=none; b=W+kVRpbTOSvdS84FKsMTo/WqW66KHVIqQLJyqktu06DAchtzxG4xp2630pHoGfLSP/g9qFfAaArXc0/j4XGHvuKt5k52SkUY1jnKuTSOxU+2X7hgkMNCybsy7voJPlm5CEVDovOG7F6HFGKb1uchiR9EsU12obZM2AMJ7/ooN9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261824; c=relaxed/simple;
	bh=xmiRPxCBH7GPfG08J2ZzLKv5GxDZuxfckaIKbi652Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4g5LKG04Ouz15QqtYavjd0jLlYx8x6B3d13ybIlnEMeb1cICiuoR8YQlSns5zk1HM8phqa9LxYEe7b2+X9hyZ8cd3yQoWzjtfNCHWqqbd8pg/7BN6peuq+ZaYBTQC7/iJHyJYlQBgav89M6fdoc3vJU6A79sc5PlVNrEWt/RAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFrdZHtZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFrdZHtZ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7433F1F000E9;
	Wed, 20 May 2026 07:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261823;
	bh=8xQgA71V4vIl0iOx8Oyd4aAiIzP0/Qoc2K+94QVYh2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TFrdZHtZIn7ax0x8jQ0//YASeNbeZk5duDR/kzVYhOLH0aloFP8Sa+0yaaMyZA9tP
	 MeFMsfaJXicg9SGFQ8vKJAlXj/4ZKnApNPEpK+1ze70h17gt0dfQZFpQAc84pb3W8p
	 ela3f1kiOdsR+EYYvOzHszBHbG/N7rOv0dTiQugjwa5uLUgjpS2kc/EIo7rD8qo6tO
	 Bj7IHykluCj53io/zckbaw6iUYN84T3rS0Qmc0alNAyrLKotE2nfoukWObj4AZZEp7
	 8a0EkL3nJ+yj68Xf2brav15NR6T3HtTHu4SuFSBJjkV1jJTFdXrpwzvFZH1nYgD97c
	 08fhk6An/dJlQ==
Date: Wed, 20 May 2026 09:23:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Message-ID: <20260520-exotic-marvellous-doberman-eebc0b@quoll>
References: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
 <20260519-sc2730-regulators-v3-1-5bf0e02507e3@abscue.de>
 <20260519-grazing-although-18c95489592f@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260519-grazing-although-18c95489592f@spud>

On Tue, May 19, 2026 at 06:28:24PM +0100, Conor Dooley wrote:
> On Tue, May 19, 2026 at 02:06:11PM +0200, Otto Pfl=C3=BCger wrote:
> > Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
> > PMIC, used e.g. with the UMS512 and UMS9230 SoCs.
> >=20
> > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > ---
> >  .../bindings/regulator/sprd,sc2730-regulator.yaml  | 47 ++++++++++++++=
++++++++
> >  1 file changed, 47 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2730-re=
gulator.yaml b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regu=
lator.yaml
> > new file mode 100644
> > index 000000000000..5b91c7b7f3ee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator=
=2Eyaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/sprd,sc2730-regulator.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc SC2730 Power Management IC regulators
> > +
> > +maintainers:
> > +  - Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
>=20
> How is this binding meant to apply without a compatible?
> pw-bot: changes-requested

Through $ref on parent device binding. This as well could have been
folded into the parent, but we do have cases like here.

Best regards,
Krzysztof

