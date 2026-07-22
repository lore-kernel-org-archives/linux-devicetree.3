Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF1D395ACD
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733882; cv=none; b=KX/TACfY2f+mBAhnvlKvxh5KZlfCiQTV/tDt+WBMnqg4Gq2kadvSoWfzj+2leZafBlrLAjIeqALP2e1vMxb1YhF5x1PSutnvG1p6fzLNRUqJIgdd6ft4ZSetMd/DLF0awYvA7sY9l02fmDt8LZJ27ngK7QrDvMA1vLkF80nsmBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733882; c=relaxed/simple;
	bh=lqiL36C01/QYgT3gCwon9tYjTfcrYpXJvRamj9Tf0NQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sKl05U/mKqADOYFAphOHG6zafVrGAu7ZOjs7prve3V+OgBKQ4yYDLl3tJTN8qFmCxQVX9A4w0h+qZ1QntIIUpRrf3lOpHhLj/OPS+fVWriqrgIddMczO5MjTtbSfUYMqORJJW030kBeEQmKg+UrHlvSAN6OqtqJnJevIICWb7w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmUwc+wc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmUwc+wc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DBE1F000E9;
	Wed, 22 Jul 2026 15:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784733875;
	bh=Pc/X00kQSQNMQLZoJEyEus+KiFnn4vcrihZN7AOeyuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lmUwc+wcfuD+kfMPFNJwLxI5VWLF2TKjISBUTydwKTSJfFRNVTUE48A7xvtoIopoj
	 uNR3/L+OW8qN7zOYlGn9vmEIw3FIzDf4NSlOovBauIg7ln7GNVPFBfMzIDumqkWHj5
	 7w1/F95BYhSPgbk2tXyMEfjfk9yk23lDVv0QFT8erOnR7BlqyiDTHpnZpzGIba5KNj
	 SyhHPmM9NScCw251YcFp2Oc25iDBl5TwVt9fd8Jd9c5CSZr62qQu1+tu8iRjpY0iKu
	 qWTEhm/rcdvY1ziS+gFMBNYCsPKZRqksV9wp4HuH+QOI/mj7sg2icLEaX0f4GrvCE3
	 AvqW6QnB+XSvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
 <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 15:24:34 +0000
Message-Id: <20260722152434.C7DBE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Upstream IRQs will not be triggered for the new pcie_kcs4 channel =
because PCIE_LPC_ODR4 is omitted from the ODR check in aspeed_kcs_outb().
--

--- Patch [2]: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4 ---
commit ad67c996a0b89123187ac23dc1115c5dc8b37472
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed-g6: add pcie-kcs4

This commit adds the pcie_kcs4 node to the LPC bus in the AST2600 G6 common
device tree. It enables a KCS-compatible interface exposed over PCIe for
host IPMI communication.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7e..a93fa4cf5d8ff 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -617,6 +617,13 @@ kcs4: kcs@114 {
>  					status =3D "disabled";
>  				};
> =20
> +				pcie_kcs4: kcs@914 {
> +					compatible =3D "aspeed,ast2600-kcs-bmc";
> +					reg =3D <0x914 0x1>, <0x918 0x1>, <0x91c 0x1>;
> +					interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> +					status =3D "disabled";
> +				};

[Severity: High]
Will the upstream IRQs be triggered for this new pcie_kcs4 channel?

Looking at aspeed_kcs_outb() in drivers/char/ipmi/kcs_bmc_aspeed.c, it
verifies the write targets an ODR register using a switch statement, but
PCIE_LPC_ODR4 is omitted:

drivers/char/ipmi/kcs_bmc_aspeed.c:aspeed_kcs_outb() {
        ...
        switch (reg) {
        case LPC_ODR1:
        case LPC_ODR2:
        case LPC_ODR3:
        case LPC_ODR4:
                break;
        default:
                return;
        }
        ...
}

Since PCIE_LPC_ODR4 falls into the default case, it returns early and skips
the subsequent IRQ generation logic entirely when the BMC responds to an
IPMI request over this new channel.=20

Does the driver need to be updated to handle PCIE_LPC_ODR4 before this
channel can function correctly?

> +
>  				lpc_ctrl: lpc-ctrl@80 {
>  					compatible =3D "aspeed,ast2600-lpc-ctrl";
>  					reg =3D <0x80 0x80>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784732161.gi=
t.gregoire.layet@9elements.com?part=3D2
