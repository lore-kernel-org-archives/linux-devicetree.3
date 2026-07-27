Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B25B3D76
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175629; cv=none; b=mFXp2pKf0Xm0HuNT8oDzUL6PLREwzo/Vu8OYBw33p5u5FmKeFi/gehJW5j/3Tpt1rb9zqOw74fhwpvEwI/hvfx2ushEenZeVreykmbLEHvgZFyJydxD1n+s2NCpA2i/PpiUaKwvOlAja+7xqAL8L22Xh4YOxphMP3l30MILLOZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175629; c=relaxed/simple;
	bh=e2R+w8zxCUaKZi8oPs9jB3AIJDQHPiXKJ6feCvSVPEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NegsPZ5DGZbkkcazYxRlv1A93Q1NYORX0MRUmuIjRvzmAfL+Paw6D7uceNVn3xSQUgJthKOfUZRs77Zf1t4ar6KjhAZfl65+Ql/vEfhBJMv5mcQejSz2MTeGgot47uoRfLvQx5C2QCOde97uX9a1xL3kjrfncq0xy9PECIQh5vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UumqTUzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UumqTUzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD0F1F000E9;
	Mon, 27 Jul 2026 18:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175627;
	bh=9xdP9/Y+ZlJ4Q+r1Wj+ZunpyGlTcYBzA98HQ6rK9yU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UumqTUzd/xi0r/kgABPCu78azBB4HRBRNBkvlXCT4KhLjJEYiyRifini2uiE2MBeN
	 EkFdb2bL59bC4pDCHCSv4OATB5G8EVkdLiTEqXpfB++tIEPBt/hQ/sASOofhDce7Xe
	 5DXQyixXOBDpouZjm2Wnyo16hTORd//emDi0NBPK+V1zUDQI9DQqAgcGyJx5OL4cLc
	 lvwYUZchveStKTeKIQxna2NtZtdOnwlxMkSD/tOWtgMsvzuvMFqK44UMTLmWZiJ0rp
	 FnEUYdM8lRVuE/eTYECyedVxQxtaK5lNJzAO0QQ/E06gAHmyt0iZ5NxFYPdhWSsXxX
	 dMeReua3Pejmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 25/35] pinctrl: airoha: an7583: add support for
 npu_uart pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-26-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-26-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:07:07 +0000
Message-Id: <20260727180707.9DD0F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing device tree binding update for the newly added `npu_uart` p=
inmux group under the `uart` function.
--

--- Patch [25]: [PATCH v8 25/35] pinctrl: airoha: an7583: add support for n=
pu_uart pinmux ---
commit 0d6a4a3b82c4e97ebd1fd4146c8849e0242028d0
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for npu_uart pinmux
   =20
Add support for uart pin function for npu_uart pin group.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index b0b1dbbb4d768..9b5c7ea5e5472 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
[ ... ]
> @@ -569,7 +570,7 @@ static const char *const sipo_groups[] =3D { "sipo", =
"sipo_rclk" };
>  static const char *const mdio_groups[] =3D { "mdio" };
>  static const char *const uart_groups[] =3D {
>  	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
> -	"uart4", "uart5"
> +	"uart4", "uart5", "npu_uart"

[Severity: Low]
Does this code also require an update to the device tree bindings?

Looking at Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml,
it strictly enumerates the allowed groups for the uart function, but it doe=
sn't
seem to include npu_uart:

          - if:
              properties:
                function:
                  const: uart
            then:
              properties:
                groups:
                  items:
                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
                           uart4, uart5]

Using this newly added pin group in a device tree will result in a dtbs_che=
ck
validation error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D25
