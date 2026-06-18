Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449FC3E92B5;
	Thu, 18 Jun 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778309; cv=none; b=OmD1ABsNcyk9Pyy6uQKx589eQfam8TKu29oWoS6McP3zqhZ3DacDBcSDtSIM85lnzOE9UYq+7e8hE+BWDoJrX3lH193Wr1mUUXgMdbjCeQhtijvw+Ml0woOFhP3vfN008t9OGzFojvmmudH+21NNor1rhigCWVuzJFKEDgF3OLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778309; c=relaxed/simple;
	bh=Y11imKWZ8hqCvlDLmCpFBUcA/yQFgdZ1dhp+Lfks24c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GyNhtQy0+3KJo/keZAPpv6zkmJrfMigY1WFVgZV3N1pkIdsZASR75EBkJQaw5D/IgBQ9B0SohfEsWbkjy9vkeoRTBEa6hOVt0XFvaKgkICqRvFdEgEmv8MBd64Adfje9Y6q6yM3Tt3BTuRPaB5IDHg+5lkqUGjfEnTiwZaJUJuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.206])
	by APP-01 (Coremail) with SMTP id qwCowAAHqtJxxzNqSVYyAg--.9188S2;
	Thu, 18 Jun 2026 18:24:51 +0800 (CST)
Message-ID: <b08277e8a9350f6c68c9774b1b6185b1eb71cd1e.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 1/6] dt-bindings: display: verisilicon, dc:
 generalize for single-output variants
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 18 Jun 2026 18:24:48 +0800
In-Reply-To: <6d3e3121-22f2-4c59-9678-df2f57ff4d31@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
	 <20260615065003.76661-2-a0987203069@gmail.com>
	 <3683c5c617324f5835529617325745ef48fa1943.camel@iscas.ac.cn>
	 <6d3e3121-22f2-4c59-9678-df2f57ff4d31@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowAAHqtJxxzNqSVYyAg--.9188S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr1fuF1rAr15Kw4xKrW5GFg_yoWrXryrpF
	Z7AFyUJF9Yqr1fXwn7t3W0yry5Aa1kJ3WUXr1xXF1xAFWDGF10gr4a9r90gFy3Xr4xA3W0
	qFs09343Zr12yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2wIDUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-17=E4=B8=89=E7=9A=84 18:25 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
>=20
> On 6/15/2026 4:19 PM, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-06-15=E4=B8=80=E7=9A=84 14:49 +0800=EF=BC=8CJoey Lu=E5=
=86=99=E9=81=93=EF=BC=9A
> > > The existing schema hard-codes the five-clock/three-reset/dual-
> > > port
> > > topology of the DC8200 IP block, preventing reuse for single-
> > > output
> > > variants such as the Verisilicon DCUltraLite used in the Nuvoton
> > > MA35D1
> > > SoC.
> > >=20
> > > Rework the schema so that variant-specific constraints are
> > > expressed
> > > via
> > > allOf/if blocks:
> > >=20
> > > - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.=C2=A0
> > > The
> > > =C2=A0=C2=A0 generic verisilicon,dc fallback remains the driver-bindi=
ng
> > > string.
> > > - Move clock and reset items descriptions into the per-variant
> > > allOf/if
> > > =C2=A0=C2=A0 blocks; keep only minItems/maxItems at the top level so =
the
> > > base
> > > schema
> > > =C2=A0=C2=A0 accepts all variants.
> > > - Restore full items lists for clock-names and reset-names at the
> > > top
> > > =C2=A0=C2=A0 level with minItems so the names are validated against t=
he
> > > descriptions.
> > > - Keep ports in the global required list and keep
> > > additionalProperties: false.
> > > - Add an allOf/if block for thead,th1520-dc8200: five-clock
> > > (core,
> > > axi,
> > > =C2=A0=C2=A0 ahb, pix0, pix1), three-reset (core, axi, ahb), required
> > > resets.
> > > - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core,
> > > pix0),
> > > =C2=A0=C2=A0 one-reset (core), required resets.
> > >=20
> > > Signed-off-by: Joey Lu <a0987203069@gmail.com>
> > > ---
> > > =C2=A0=C2=A0.../bindings/display/verisilicon,dc.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 80
> > > +++++++++++++++++--
> > > =C2=A0=C2=A01 file changed, 73 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > index 9dc35ab973f2..0c41286b8223 100644
> > > ---
> > > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > +++
> > > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > @@ -17,6 +17,7 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - =
thead,th1520-dc8200
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - nuvoton,ma3=
5d1-dcu
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: verisilicon,dc # =
DC IPs have discoverable
> > > ID/revision
> > > registers
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0 reg:
> > > @@ -26,14 +27,12 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0 clocks:
> > > -=C2=A0=C2=A0=C2=A0 items:
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DC Core clock
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DMA AXI bus clock
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Configuration AHB bus =
clock
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Pixel clock of output =
0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Pixel clock of output =
1
> > Clock descriptions should still be in the global part instead of
> > the
> > per-compatible part.
> >=20
> > In the per-compatible part, clock-names should be constraint for
> > SoCs.
> I will move the `items:` clock descriptions back into the global=20
> `clocks:` property, covering all five possible clocks. In the=20
> per-compatible sections I will remove the description items and only=20
> constrain `clocks: minItems/maxItems` and `clock-names:=20
> minItems/maxItems`; for nuvoton,ma35d1-dcu I will additionally
> override=20
> `clock-names: items:` to the two names actually used (core, pix0).

Yes, this should be the correct practice, although I wonder whether the
minItems and maxItems properties are needed globally (because these two
seem to have default implicit value).

BTW the MA35D1 manual in fact shows 4 clocks for "DCUltra" in the clock
tree, maybe the DT binding needs to be reconsidered?

Thanks,
Icenowy


> > > +=C2=A0=C2=A0=C2=A0 minItems: 2
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 5
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0 clock-names:
> > > +=C2=A0=C2=A0=C2=A0 minItems: 2
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 5
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: core
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: axi

