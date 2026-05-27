Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C128640B;
	Wed, 27 May 2026 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852109; cv=none; b=JI2edCfAiCAKj3oq6Ae1ytTW/wzg+72YJZx6oer7pY89n6zZ+q88jcCYbWrEc4Njgo0bWqF48dAmbLBaxlviH/WlWK0Izyh98uths8iEt0QiWrnBFQDN4yIdTzT6BaD1AOyo5s+IUbxhZTnrkE4WoSjDswELfhrg8GOZ2dakYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852109; c=relaxed/simple;
	bh=HfKaIVx+SJ3ya7hGqlOYadnXidhdIYNpRb6IwVfHins=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IzlO4WXEuu78jurGKF81RvwrGwx06WupuQo+2X/uiTH02s2VWXHeWy53wHv5nHF+IRC6REgs/o+v+Ywif5fiaDP/beSbP1L+kkxUquTrcJerDDspAZawx+M7o89eP/IfSXIv1MfeyVKCOqLBAKGx+7g99oTEuiKRM0011CSHXRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Pz8x7EVm; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Pz8x7EVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779852105;
	bh=Xzua1hygqM8RuAqAAV48+yyYvIAPfnUqYZRu2TfQ+q8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Pz8x7EVmIcrBA2iTj1Djxy+Fbwc0BvS+azjCJJSL0HLnUGZMgut3ibADjcHzAPjMP
	 WTdYKnCv3Bp1sMmMl9mUZ5yoYR9JuvNETEyzGfRE578L1VhH2O2Zuq53V+eZ5npK7K
	 8oMoNDRqp9BmRhvZQtvVzIGRri9cWOa9YBiaKzgme/4wQVw86KsvSoVOx/i8qSs6ja
	 7LrQkvjn1sob4m0XV8aSkE3Qw8BbExXl5U9rscxvM22uE4RbcBVOpBgBMmcDCje8E/
	 NWmXoFHfA1OE/aHYJHVqgL9j4T6j8N3+tUaXCNjhk3UPTYmQl/5ic4KVFY2GcoLyjr
	 vx34ADFD5+E3g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 140216001B;
	Wed, 27 May 2026 11:21:45 +0800 (AWST)
Message-ID: <a25ff66bee5a2047296eb239c10a7ccafc6d0b30.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT
 linename
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>
Date: Wed, 27 May 2026 12:51:44 +0930
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
References: 
	<20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
	 <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Potin,

On Sat, 2026-05-23 at 10:28 +0800, Potin Lai wrote:
> Fix the GPIO linenames for CPU_CHIPTHROT signals.
>=20
> The signals were incorrectly marked as output ("-O") while they are
> actually input signals ("-I").
>=20
> - B0_M0_CPU_CHIPTHROT_L-O -> B0_M0_CPU_CHIPTHROT_L-I
> - B1_M0_CPU_CHIPTHROT_L-O -> B1_M0_CPU_CHIPTHROT_L-I

I dropped this list when applying the patch because it's evident from
the diff.

Andrew

>=20
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> index 61dbef45f8b0..d7ed497d7227 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> @@ -224,7 +224,7 @@ hpm0_ioexp_20: gpio@20 {
> =C2=A0			"B0_M0_LEAK_DETECT_ALERT_L-I",
> =C2=A0			"B0_M0_RUN_POWER_EN-O",
> =C2=A0			"B0_M0_RUN_POWER_PG-I",
> -			"B0_M0_CPU_CHIPTHROT_L-O",
> +			"B0_M0_CPU_CHIPTHROT_L-I",
> =C2=A0			"B0_M0_SHDN_REQ_L-O",
> =C2=A0			"B0_M0_CPU_SHDN_OK_L-I",
> =C2=A0			"B0_M0_CPLD_READY-I",
> @@ -398,7 +398,7 @@ hpm1_ioexp_20: gpio@20 {
> =C2=A0			"B1_M0_LEAK_DETECT_ALERT_L-I",
> =C2=A0			"B1_M0_RUN_POWER_EN-O",
> =C2=A0			"B1_M0_RUN_POWER_PG-I",
> -			"B1_M0_CPU_CHIPTHROT_L-O",
> +			"B1_M0_CPU_CHIPTHROT_L-I",
> =C2=A0			"B1_M0_SHDN_REQ_L-O",
> =C2=A0			"B1_M0_CPU_SHDN_OK_L-I",
> =C2=A0			"B1_M0_CPLD_READY-I",
