Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA363B389A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692143; cv=none; b=GdPKpw0ffFo/8Q8loOQSI5/ujUcOO7HMXU6G99VWEIrynFgRtX/snxpvP0gxEraqkWVbspLcIFqM/e5VenzLhFUE7mXebejNxQvbR+WFM0Yb0/nLZs4mru0VXN0Z25sQQ7bDrLAjrAzIzVu3iAmQZK13rJblWQJLQ1Ux5CVKcKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692143; c=relaxed/simple;
	bh=SIm0Pnca4zSPVcvYMoYLUgJZbkH9YU7oAXXPBE6cycc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dpAPV3gJHuUOXwLC1msMSR9+LX1Z38N/FPkHRKrtidqvk4ycSIQlM78zifSg2GMu1DcFcQtUBmwvG7B/j0jUbX+vZT1klW7XDyZIzEqNXoxd9TxRIUzF8aAdd3s+XAzM5Bbsx2ta3Lj1NDMnaa775avAf6PPHieAsdD6lTTpE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=LwzP8kbE; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="LwzP8kbE"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1776692128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYIu6EXTIRt0VXvV/t9DOgjJC3KN2/vmzS5XsjRCo3Q=;
	b=LwzP8kbEE4fmR4T7wCLz0+Gdxcxg08Y8PIo/FbaSXDw6u2rMZQOMGArRZ0P4aAN7mDYhYh
	3/A4rYVlQWIThcb+tTW9pBS0H7CTSl4mWa38gL/Kp4TxKxFnsBe0ChkfjymjDoJ3JjGWcF
	ccq44mC3ivSV71gGZ1BgrBAaITQHnEVat7/6jLB3lCzJTewwye3wPZjBxgqi3m+RtLw3oE
	V1WJWxWCpVrohQorzzESc34eNoDb/viIbRNBdFqSwUsiqCNJxmMmYOYUVB3xrCHkaqZ6lT
	QMugMChL8oa1JOXjMqjG8gvcdbkvNrpvpjE/+G6ru03LYRfygJV0QwzXsRvhZg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 15:35:15 +0200
Message-Id: <DHY0SHYOZHAP.3276L2M1SNC7L@cknow-tech.com>
Cc: "Arnd Bergmann" <arnd@arndb.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Quentin Schulz" <quentin.schulz@cherry.de>, "Jonas Karlman"
 <jonas@kwiboo.se>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Replace deprecated snps,*
 props for NanoPi R5S
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Tianling Shen" <cnsztl@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260401131551.734456-1-diederik@cknow-tech.com>
 <20260401131551.734456-3-diederik@cknow-tech.com>
 <DHTSOV43O2EX.38TGASN7SQEZL@cknow-tech.com>
 <2d2b1e17-388f-431a-be86-a0f26b5be6cf@gmail.com>
In-Reply-To: <2d2b1e17-388f-431a-be86-a0f26b5be6cf@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 20, 2026 at 8:58 AM CEST, Tianling Shen wrote:
> On 2026/4/15 22:23, Diederik de Haas wrote:
>> On Wed Apr 1, 2026 at 3:11 PM CEST, Diederik de Haas wrote:
>>> The various snps,reset-* properties are deprecated, so convert them int=
o
>>> their replacements.
>>>
>>> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/=
arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>>> index 90ce6f0e1dcf..92d044ec696b 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>>> @@ -85,10 +85,6 @@ &gmac0_tx_bus2
>>>   		     &gmac0_rx_bus2
>>>   		     &gmac0_rgmii_clk
>>>   		     &gmac0_rgmii_bus>;
>>> -	snps,reset-gpio =3D <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
>>> -	snps,reset-active-low;
>>> -	/* Reset time is 15ms, 50ms for rtl8211f */
>>> -	snps,reset-delays-us =3D <0 15000 50000>;
>>>   	tx_delay =3D <0x3c>;
>>>   	rx_delay =3D <0x2f>;
>>>   	status =3D "okay";
>>> @@ -100,6 +96,9 @@ rgmii_phy0: ethernet-phy@1 {
>>>   		reg =3D <1>;
>>>   		pinctrl-0 =3D <&gmac0_rstn_gpio0_c5_pin>;
>>>   		pinctrl-names =3D "default";
>>> +		reset-assert-us =3D <15000>;
>>> +		reset-deassert-us =3D <50000>;
>>> +		reset-gpios =3D <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
>>>   	};
>>>   };
>>>  =20
>>=20
>> Please disregard/drop this patch.
>>=20
>> I was recently made aware of 'sashiko.dev' and checked whether it had
>> also checked my patch, which it did:
>> https://sashiko.dev/#/patchset/20260401131551.734456-1-diederik%40cknow-=
tech.com
>>=20
>> And it turns out that the concern raised is valid (thanks Quentin!), so
>> this patch could introduce a regression.
>> So it looks like staying with the deprecated properties is actually
>> better (in this case?).
>
> Well actually we more or less rely on U-Boot to reset the PHY first now.=
=20

This change would introduce such a dependency where it was not there
before, so this could introduce a regression.

> Many rockchip boards in tree require a reset before the PHY can be=20
> recognized, but we just use the generic "ethernet-phy-ieee802.3-c22"=20
> compatible.

I've identified ~40 Rockchip based boards where there is a dependency on
the bootloader due to using that generic compatible. Some from the start
and some got it added with a similar conversion as I proposed above.
I haven't seen massive bug reports, so it looks like it's currently ok.
I don't like having such a dependency and certainly not adding one where
it previously was not the case.

In other cases, the generic compatible was replaced with a specific one
for the PHY being used, which 'circumvents' the raised concern:
https://lore.kernel.org/linux-rockchip/20260202-px30-eth-phy-v1-0-ef365be64=
922@cherry.de/

According to the FriendlyELEC schematics I checked, they seem to use the
RTL8211F a LOT. On the NanoPi R6* they use a/the specific compatible:
https://elixir.bootlin.com/linux/v7.0/source/arch/arm64/boot/dts/rockchip/r=
k3588s-nanopi-r6.dtsi#L348

I've sent FriendlyELEC an email to ask whether they ONLY used that PHY
in the R5S (LTS) in which case it is safe to replace the generic
compatible with the specific one. I haven't received a response yet.

> Another option is to move the reset props to mdio node instead of PHY=20
> node, though.

I prefer that there's first an agreed upon 'strategy' on how to deal=20
with the above mentioned raised concern so that it can be implemented
consistently.

Cheers,
  Diederik
