Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40E54654
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334526; cv=none; b=cFC1h6cc+ZNCvOllyvDZgSxFZjsG3DIn6PuUoiAvABVML9CfnAKCtolhD5W6FvkiV9iy1nlNG4o4hN8lt02wh7tTgMbceVeM5ddjc9SA1ClECKYtf/lAihbNVzs+H4DyAmBvNtJoB8fBJzaHX8ZyqMWqC+KBAAM+DZ1Q5pxvf6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334526; c=relaxed/simple;
	bh=i9u2toCQeo/TGqEpiUXZdE6qSFYzkl2ibLCuEvAPjto=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTjJS4Akv9/0YiG3N+XEO+ix8/fdv0aHfoVvKLKEbii6004e90QytxPrZn/7A5VJuUOiCJ7RcQOuVHyNbhiTUzcmyDRs631QBY0mr5xufRUuIlLUqFT5JU7SucLMKK8gwKqG28g97OSWm+1wNUNU+znjMejyJ6KjA0S1vB73NzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=L0Y9URzI; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="L0Y9URzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776334522; x=1776593722;
	bh=enIl/aGtK9F5vuuVOrgpSnjtyBuWt7e4jd2kN1VmneE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=L0Y9URzI9zOZOT3alEIvYzdKVIalHdHGgiPYVGaudHtJFRHiZCr/BErQ7cQKfHJLW
	 s1HZl5Irtqadcftkofi5vp6tjYkkKY0FOizIws1JZ54Wx992V8BJWDHrLoqOH0sKk5
	 EFDa1VY64uy21u1t4yRSueLYhfWEyZu2lNwAczASjYdIsEXSOUJkvFGgDL7w1kHwGE
	 AyXYBzlyjtpHsQMP1aXrkVq2RcEkeoJpxqRRcMn7MwUt1/QAfv3DKO4lLo7r4DgyzZ
	 vPIrMnLjzQFOBoLKjeRLm0++23aY5DYMRJyPJw7qxmiAJXqF+o2ccOUWOv809M6+RH
	 k3sC57GPs4KMQ==
Date: Thu, 16 Apr 2026 10:15:20 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <jqIIiW2Ouy-8QTfn81SNoVSORMH3YOYXbtpGGc7bWZoDAXLHW55mdk8b5BRhDUYLqaHG9rA5NtA3EOCblHlbz9gQ0DuKchHSoCsNUTsq5-o=@pm.me>
In-Reply-To: <9592f205-7467-462b-874e-7fc599e5277a@kernel.org>
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me> <20260416-eliza-imem-v2-3-fb7a71123451@pm.me> <9592f205-7467-462b-874e-7fc599e5277a@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d2cf1beaefdd3d8b30981347c74ef32989d7ea14
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, April 16th, 2026 at 6:09 AM, Krzysztof Kozlowski <krzk@kernel.=
org> wrote:

> On 16/04/2026 11:40, Alexander Koskovich wrote:
> > Add a node for the IMEM found on Eliza, which contains pil-reloc-info
> > and the modem tables for IPA, among others.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/=
qcom/eliza.dtsi
> > index 6fa5679c1a62..551df07e44c6 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> > @@ -1029,6 +1029,26 @@ qup_uart14_default: qup-uart14-default-state {
> >  =09=09=09};
> >  =09=09};
> >
> > +=09=09sram@14680000 {
> > +=09=09=09compatible =3D "qcom,eliza-imem", "mmio-sram";
> > +=09=09=09reg =3D <0x0 0x14680000 0x0 0x2c000>;
> > +=09=09=09ranges =3D <0x0 0x0 0x14680000 0x2c000>;
> > +
> > +=09=09=09no-memory-wc;
> > +
> > +=09=09=09#address-cells =3D <1>;
> > +=09=09=09#size-cells =3D <1>;
> > +
> > +=09=09=09pilreloc-sram@94c {
> > +=09=09=09=09compatible =3D "qcom,pil-reloc-info";
> > +=09=09=09=09reg =3D <0x94c 0xc8>;
> > +=09=09=09};
> > +
> > +=09=09=09ipa_modem_tables: modem-tables-sram@3000 {
> > +=09=09=09=09reg =3D <0x3000 0x2000>;
>=20
> I don't think these two should be in the main SoC DTSI. The non-modem
> version obviously does not have modem-tables.
>=20
> Either this is part of board or common DTSI for SMxxxx SoC. Whatever is
> chosen here, should be consistent with other platforms.

Would you want the IPA node, MPSS remoteproc, etc to follow same pattern? C=
an
just throw them in a sm7550.dtsi.

Since sm7550.dtsi wouldn't have any consumers until I push my board dts, I =
guess should hold off on this until then?

The node sort part of this patchset can be applied separately.

>=20
> Best regards,
> Krzysztof
>=20

Thanks,
Alex
