Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE75C3DE45C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139292; cv=none; b=OgJBtpkZbt5UIadnnDpeekZQ60aHtyB+aKUcdZ0ehE9YI3ErKuGqHHI2bq/a4nt0QB6+Ip6PYzqFVcuD7AU+83UXxCmkiEpMPPYcTNFy6UV9OuI9wZ6TC8PQs9aH2mZuSwg3+qhIQyy/96HQW6aZNOUAGg4CZoxX+JSgtAOVOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139292; c=relaxed/simple;
	bh=3dvI6MnzcQhq6aJhxy7EGaX6B2Uxw9p1ppSMgvJY/lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ecAFJKao8zR/qyp/NNjMGigo+0M4E3e1/1CApYERd7C1C8iYGhQYu24BAyrrcW8Gl0r1zvwWKqHttMggpxqegLHYQFcLnW6uX6M09Z0c5Xfddn1wpb4FcqAm8OUf9u4tDWZBj6DOQMBLqKxC9dEq/yZMBQiOG3LaIy0FRN75ZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1PI6AUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1PI6AUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC391F000E9;
	Mon, 27 Jul 2026 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139290;
	bh=Jl92wtT7o/wocod/RLXbUIbe48nPdiNkp1BLqUpXwi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T1PI6AUwdhW6KL747CuJBcPHd8r+yw1qaGyk1LQdk0WKtNpvVJpoF5A7Ti0wnnVm0
	 DLIS8LM1mbVjVPS9pI039P8MqFU1Dhz//uvidgP0PWJC46AIk5di7Ez0qy0m051gxL
	 LHTrOkT9TCVlGlOuQlXfTkGAVHTBYDdt9MfD6dapgzZo9vxVpQiMik+/APwWJj0/Rm
	 /Kz1qj0UyOW4SK+US1F0ZiNCBtfARL9ygKnifuQv45Le7jrWxCp1dqIKPlqQhtgxXo
	 xZ423ng51wuL+b0jN+zHb6D1DIIY5GC9eUCCThMKsCer7JvKpT0AsA7Zh76pVZeH5U
	 qAU4E35Y0nHIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 24/34] pinctrl: airoha: an7583: add support for
 npu_uart pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727074234.3761170-25-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-25-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:01:29 +0000
Message-Id: <20260727080130.3DC391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit adds support for the 'npu_uart' pin group in the pinctrl=
 driver for the 'uart' function but fails to update the corresponding devic=
e tree bindings.
--

--- Patch [24]: [PATCH v7 24/34] pinctrl: airoha: an7583: add support for n=
pu_uart pinmux ---
commit e389a2bc465838a0c68580627d10aa31667842fb
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for npu_uart pinmux

This commit adds support for the npu_uart pin function and group to the=20
AN7583 pinctrl driver.

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
Should npu_uart also be added to the device tree bindings in
Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml?

If a device tree uses this new group, it appears it will fail make dtbs_che=
ck
validation because npu_uart is not listed in the allowed groups for the uart
function:

Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml:
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

>  };
>  static const char *const jtag_groups[] =3D { "jtag_udi", "jtag_dfd" };
>  static const char *const pcm_groups[] =3D { "pcm1", "pcm2" };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D24
