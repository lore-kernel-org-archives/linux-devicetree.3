Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D0F3CB2DF
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861061; cv=none; b=kuAtDhE2AUAWp1ltklRnxrS7HgCRS7kW6VBNGTsnmZQ3Eer4I/gPRGnEgknR7blq/2jxE+4NPNx//n/S6k92WHkTzjsIjrvYLzBY37o1MX7eLjHkzeYKDH5xBRmtnqao7/6jzBe0BUkQ1ZZ8IVdoLYfJR1az31Iqt1D5Z1rZNvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861061; c=relaxed/simple;
	bh=K4nhYXPbFkHp9MO4KnkC9MB6fYQxHw/aX81zWGtkHms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LIk1zPz1QN0DUWP3aO+tGho7D28RJynhs7LMrk85qvJ4SfmQqr1dZQ+r05uPysuh+ET0xfNNRfysBGXlJejA9gEFdIt+JKgrumngblfh0QevqoyfT/GICEijIlpbEw/XpytSY7C+60Qrw/r/QsdRgorlcrQNhHjg/cv00J/B5ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvLvUP/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvLvUP/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE3F1F000E9;
	Tue,  4 Aug 2026 16:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861057;
	bh=zPaqURpXIekMQyN4XcS2Jad7gauWCn86oIG+LAy+maQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hvLvUP/FD4T+UP5590D42KOoe/oLyVcp+as9zSrExPOX5HZh1PXRnuF5Icg1243UB
	 wunsDyPMomzn/12Ot6hZnbBFwBgEy0jwzhTUTZiZHa+IyQncaKtxyljDeUj4jeiz0x
	 nDhm6Ash+EBzMySTpGM9KE87YWaPgzJFkfDpIJsj133RjD7CppZukagFOQk4Wp+iVa
	 gSn/OYtbMH1kR3ZAOWO3grYBeySH/8myRGLy4I2Yu0RNlA2S+3082cBvOxV48bDctF
	 mRchmwdSBCaerW/3WyGb8wdrxJHZTAa4MyzilICrCQbfO/grusZB3LwCeJq1Oi31y1
	 9f1yn3/LSW+Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 28/36] pinctrl: airoha: an7583: add support for
 npu_uart pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-29-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-29-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:30:56 +0000
Message-Id: <20260804163057.ACE3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'npu_uart' pin group was not added to the devicetree bindings s=
chema for airoha,an7583-pinctrl.
--

--- Patch [28]: [PATCH v9 28/36] pinctrl: airoha: an7583: add support for n=
pu_uart pinmux ---
commit 4aada6051d08f6809c3042f7ef7adb433db84857
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for npu_uart pinmux

This commit adds support for the npu_uart pin function group to the=20
airoha an7583 pinctrl driver.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 44efccce78c55..dc88cbd8746bb 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c

[ ... ]

> @@ -571,7 +572,7 @@ static const char *const sipo_groups[] =3D { "sipo", =
"sipo_rclk" };
>  static const char *const mdio_groups[] =3D { "mdio" };
>  static const char *const uart_groups[] =3D {
>  	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
> -	"uart4", "uart5"
> +	"uart4", "uart5", "npu_uart"

[Severity: Low]
Does this code need a corresponding update to the device tree bindings?

Looking at Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml,
it restricts the allowed 'uart' groups and lacks the newly added 'npu_uart'.
Will this cause dtbs_check validation to fail for any device tree using the
newly added 'npu_uart' group?

>  };
>  static const char *const i2c_groups[] =3D { "i2c0", "i2c1" };
>  static const char *const jtag_groups[] =3D { "jtag_udi", "jtag_dfd" };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D28
