Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609327380A;
	Thu, 11 Jun 2026 06:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158529; cv=none; b=hRIX3fk41pe17asYWmzQj7IyyqpZr478XKtQmcrfgmVTYtsbygnrgHhk9Vo2Q+ljd+I2p3ahXez/ivFV0tW/mOs32wyypPyHYERao+HM7BO29CkqzATJf3u1pEs5M6ge0+sAn55CR7GhnLko9smP/In7ZJwBv4R2POIYRghgcmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158529; c=relaxed/simple;
	bh=DOWwvGVTxm3PyPrq/yASl2Nu0t60duffwsXAnhS+4NY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNl7mStNsjc/Bm7M9Ry/NHYcnGigLIrbOwWuj+6Dyw2IqkFY9WH7W2N6F0YB/LicLBg0tFz4HgjUid0M3bQ3+Mh9b72E5wsmS2xg0GXXvQbGDEu0JliAsInfJ44Um4GBO7LLwjmZlSSBHPZH+V3ILvkihqfdx4Cnqh2U25F2yyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.167])
	by APP-01 (Coremail) with SMTP id qwCowABnB9B2Uipq53FFAQ--.9476S2;
	Thu, 11 Jun 2026 14:15:19 +0800 (CST)
Message-ID: <6a756a4b1e48d036329f688f46796161fddd7a50.camel@iscas.ac.cn>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: himax,hx83121a: add
 optional bl supply
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang	
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 11 Jun 2026 14:15:18 +0800
In-Reply-To: <CAH2e8h7oDLO4isyPOY3syEQLMrcCGiGmkKsAYvtEz+qoT9-N_w@mail.gmail.com>
References: <20260608162622.403713-1-zhengxingda@iscas.ac.cn>
	 <178115560756.199930.11183711627429440356.b4-review@b4>
	 <2877375c4efee4b4e816b418c965da7bd7d60992.camel@iscas.ac.cn>
	 <CAH2e8h7oDLO4isyPOY3syEQLMrcCGiGmkKsAYvtEz+qoT9-N_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowABnB9B2Uipq53FFAQ--.9476S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr13KFWrWF43tFyxtrW5KFg_yoW5Jry5p3
	4DCasxtan5tr1xJ3y0qw1xWr4ftw4kKw47WFn8Wr1xGwsFvw18JrWSyFn5WF4DZr18JF42
	vFyqgFZ7XFn2y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8rWrJUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-11=E5=9B=9B=E7=9A=84 13:45 +0800=EF=BC=8CPengyu Luo=E5=86=
=99=E9=81=93=EF=BC=9A
> On Thu, Jun 11, 2026 at 1:36=E2=80=AFPM Icenowy Zheng
> <zhengxingda@iscas.ac.cn> wrote:
> >=20
> > =E5=9C=A8 2026-06-11=E5=9B=9B=E7=9A=84 13:26 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> > > On Tue, 09 Jun 2026 00:26:20 +0800, Icenowy Zheng
> > > <zhengxingda@iscas.ac.cn> wrote:
> > > > When the backlight is managed by the panel controller IC, an
> > > > external
> > > > power rail might be powering the backlight.
> > > >=20
> > > > Add an optional `bl-supply` property to describe such power
> > > > rail,
> > > > thus
> > > > allow disabling the backlight.
> > > >=20
> > >=20
> > > Please add it as a hwen pin, this will simplify your code later.
> >=20
> > I am not sure whether this should be a pin or a regulator -- the DT
> > binding should reflect the HW fact, and LCD panel backlights
> > usually
> > require a high voltage (or even a current source) that is driven by
> > a
> > dedicated regulator.
> >=20
>=20
> Most backlight ICs use a hwen pin to enable the supply, afaik, like
> ktz8866, ktz8868, aw99706, etc. We don't touch the VIN. (My
> disclaimer:
> I am just an amateur, know less about the circuit)

I found some specificiation of a LCD panel using DCS brightness to
control backlight at [1] (this panel is supported by panel-himax-
hx83102 driver), and it has no HWEN pins -- the pins related to
backlight seem to be LED_{C2,C1,A} and PWM, which means a backlight
regulator must be present.

Although the situation is a little odd -- the regulator isn't a fixed
one, but a adjustable one adjusted by the panel.

Thanks,
Icenowy

[1]
https://www.scribd.com/presentation/759684395/Titan20-TP-LCM-SPEC-XT2073-Mo=
torola-one-fusion

>=20
> Best wishes,
> Pengyu
>=20
> > Thanks,
> > Icenowy
> >=20
> > >=20
> > > >=20
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/panel/himax,hx83121
> > > > a.ya
> > > > ml
> > > > b/Documentation/devicetree/bindings/display/panel/himax,hx83121
> > > > a.ya
> > > > ml
> > > > index e067a2f6d0b2..aeca3c9a599c 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/display/panel/himax,hx83121
> > > > a.ya
> > > > ml
> > > > +++
> > > > b/Documentation/devicetree/bindings/display/panel/himax,hx83121
> > > > a.ya
> > > > ml
> > > > @@ -40,6 +40,9 @@ properties:
> > > > =C2=A0=C2=A0 vddi-supply:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 description: power supply for IC
> > > >=20
> > > > +=C2=A0 bl-supply:
> > > > +=C2=A0=C2=A0=C2=A0 description: power supply for backlight, in cas=
e it's
> > > > managed
> > > > via DSC
> > > > +
> > >=20
> > > s/DSC/DCS/
> > >=20
> > > Best wishes,
> > > Pengyu
> >=20

