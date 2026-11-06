Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989660;
	b=vhoOweXDCN0ouxkn+l20GKkE+POIsZ46hYWKB8+qbddxLFx0nRzSbP6EE/VylLCgCQql
	 Xa3EZKuoELgNHUDBUtgC69dpzYSpHraHrNtEd20INq9MTy7tbMHffY9F5bbpNfW+gt2AJ
	 edVqL2W3tY4ouerV+e6R6s+zL4/GOnNUgqsCm7GqQvpbzVUDoSuqrjQDE4WSXBKpSVTrh
	 Ix5h+fYRs3d6dC+URytshJjV0xRdMtZvjhTbdlT1EcIgOxB5vj0IhmLj3lH8xCcx9NXFm
	 afvbaqx6KlfYFA/C3Pi9voFugDOoBeosH6RZHYMwQ5WKXqA9haQXsPd+3mr1OjeZKHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989660;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WlCEZESfOmb1UfVHdqxtpBorzwyZKIs/pd0KVUd31AM=;
	b=4ppbzjMydeNrlq4KANIW6p2JCIyIUT7/kj/748ZLPvMe2XJLwpNwMVtqCLx/2wXjy4pW
	 weJ975kh2ilk9n9Kud0xXxJC3k9o5cStw1WRbtQOhSXhHyX3u7L4gWzoACVi8uPsNLlq2
	 dI/lyvFI4vPs0tSB7sN1uF43YnAzbSqL3QOnqfVP4X0t3BJAfeJZFT//HRi2Ub4P9juX6
	 vJRwfMhs/tD7/qpvtH8/XYd261XKk/BcHHXFARfn/aNFAfaWQZr6CbXsQkqMxlL+XDpt3
	 ffcKwbSWHq73HqcZIMCIKtr8jA2nyU9QR1Oqfe30/83VU2XiZeOeV0nMWvqYza8nhXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=E9qNzqww;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6787606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6787606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=E9qNzqww
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793989657; x=1794248857;
	bh=WlCEZESfOmb1UfVHdqxtpBorzwyZKIs/pd0KVUd31AM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E9qNzqwwcOgulpKnm8UeZTapr25+17D4M0OrhVFDD9j3tHAReSmVCqXse2fl+FYRZ
	 J/cFTZ5BYxkZ5bFAWhlLzWzoM3QDuIG6ChC45tsSbYgngi0EzV46icCs1zCzLOnsOX
	 sfnBhu4xEROtX7Kd4SMG/LuHhsi4TFZ7hchLQTdWK7LJ3c7tjoeWBadGVvyfglSvUA
	 AexL7vsYkFkAQHFHNS4hnwqXm2pylPMdhbAxA3tp6CHRKLDMWi4fCjuaRDwVrV4WEA
	 HO4xk2I6aU4Y0UacfLTrlm122o87rAmLlViiiAv/SEdKSquC0QVMlQsnP/3DPifauq
	 LzHaaP9kBEnYg==
Date: Fri, 06 Nov 2026 18:27:32 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,tlmm-common: Add wakeup-enable
Message-ID: <0orir54c0rbF6-ZvpZq9hVVwLOMN02Et6AtRxRh3DU_DbJ_dwkDo3PFVFftKlaDI2IGdFsZdH-olYFZHn_5AA4U03M0-uV_e5UUtnXQIHg4=@pm.me>
In-Reply-To: <20261020-delicate-serval-of-fruition-fe0cb8@quoll>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com> <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com> <20261020-delicate-serval-of-fruition-fe0cb8@quoll>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a845e39c3a4ac81e44bf1ebf3626e10ae16b1ca9
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 20th, 2026 at 2:19 AM, Krzysztof Kozlowski <krzk@kernel=
.org> wrote:

> On Thu, Oct 15, 2026 at 07:52:59PM +0530, Mohammad Rafi Shaik wrote:
> > The TLMM can gate whether a toggle of a pad is transferred to the wake =
up
> > controller (PDC/MPM) while the system is in a low power mode. The pinct=
rl
> > driver arms this for pins it requests as GPIO interrupts, but that path
> > takes over the pin mux, so it cannot be used for a pin that has to stay
> > muxed to a peripheral function.
> >
> > Such a pin exists on boards with a SoundWire codec: while the bus is cl=
ock
> > stopped the codec requests a wake up by toggling the SoundWire data lin=
e,
> > which is muxed to the SoundWire function and not to GPIO. Unless the pa=
d is
> > armed, the toggle never reaches the wake up controller, the controller =
is
> > never resumed and the event - a headset insertion, for instance - is lo=
st
> > until something else happens to wake the bus.
> >
> > Add a pin configuration property so such a pin can be armed from its ow=
n
> > pin configuration, without being turned into a GPIO.
> >
> > Assisted-by: Claude Opus 5
> > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.co=
m>
> > ---
> >  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml        | 12 ++++=
++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common=
.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> > index aec72e8c0..95f539611 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> > @@ -87,6 +87,18 @@ $defs:
> >        output-high: true
> >        output-low: true
> >
> > +      wakeup-enable:
>=20
> As Sashiko points, there is no such generic property.
>=20
> Anyway, the wekeup is per device rather. Arming a pin would be different
> sleep function, no?

Heads up this also appears to be needed outside of sleep, was looking at NF=
C
enablement on the Nothing Phone (3a) and left out clock from DT since MGPI
is meant to handle CLK_REQ and enable relevant clock, but MGPI does not
work unless the wakeup_enable bit is set on the pin.

>=20
> Best regards,
> Krzysztof
>=20
>=20
> 
