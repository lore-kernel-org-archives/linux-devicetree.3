Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00591303A32;
	Mon, 18 May 2026 06:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086135; cv=none; b=RiCzBo68SMdQeB6M95qyUKyAy8GuzRcfVVcAiAebIKy1oikPHBuBLTO8mABuTYvyLKDxJ4B4VXEFJP8Az2j0U6PwXEekuCvJj/r96ZXBjso5dxxK1xeX4IUlUWoKsXTCN9ziHeaRqTgu8o5wFfLpaSgtLCX5pC12CppxRg0YgNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086135; c=relaxed/simple;
	bh=OPLzR8oDPNN23goctM1doHC/4cQsRID+tuEaNIAs+wg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PSOXHJRKOr3cMIbSC6oMt0cwRznfQX98EEOQoYKtrNzFviUXPH8cbtZCSAEKrGPSnz2Q3qTsd2JKxZOwNltuRDxbRUJxH6b4AVN6q+CyaQMkTfblbQ9xl7sSOqatdJp3AKO9T6McVWDf/4kfc2JxDo2/SORm5CDJfgeuS6KsiFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RImyBGvE; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RImyBGvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779086127;
	bh=OPLzR8oDPNN23goctM1doHC/4cQsRID+tuEaNIAs+wg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RImyBGvE1qS7EIaiJ1BCR11W4L35QOSClxXJhV1IEvQbN1ApnxZo+nZitPkxA1/YL
	 XEp9iSRzH18Z00Aw4jK8FjsBf9AVnV/Y5mLoxdzWq/nfooixxNmmQoCy3IwcX9D+Wx
	 Dy5xBMrGFPBFlYImFB5wbNNCpqvBHA4oqUoVQ1QxGulrNGm2vxEIoTHNFTcHnurFg5
	 pX4lg+nZvR9GuWdcLrrvAGRMA1pIel2mpfyQhMfUxmpo551ZBWjsYpkEgEGqfUpcVj
	 4YKGDhwy4GPzuUy0lALTSdqsv8VLPvACasEZVATVX4ySRPj37K7LtOZJXaYZ+FJjxZ
	 r7Dvh98rkbHhw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DC8786025D;
	Mon, 18 May 2026 14:35:24 +0800 (AWST)
Message-ID: <5947248c99e14e59f10b707e7ba523985c7d875f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: msx4: enable BMC networking via
 MAC0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ender Hsieh <andhsieh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Lunn
	 <andrew@lunn.ch>, Marc Olberding <molberding@nvidia.com>, Jacky Chou
	 <jacky_chou@aspeedtech.com>
Date: Mon, 18 May 2026 16:05:23 +0930
In-Reply-To: <20260505050541.3031447-2-andhsieh@nvidia.com>
References: <20260505050541.3031447-1-andhsieh@nvidia.com>
	 <20260505050541.3031447-2-andhsieh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-05-05 at 14:05 +0900, Ender Hsieh wrote:
> Add &mac0, &mdio3, and the ethphy3 PHY node to enable BMC networking
> on the AST2600-based NVIDIA MSX4 board. The PHY is attached to MDIO3
> at address 2 and uses RGMII with PHY-internal delays.
>=20
> These nodes were intentionally omitted in commit f28674fab34f ("ARM:
> dts: aspeed: Add NVIDIA MSX4 HPM") at Andrew Lunn's request, pending
> clarification of the RGMII delay handling. Following his guidance on
> linux-aspeed, the bootloader has been modified to stop enabling MAC
> clock delays on the SoC side, so phy-mode =3D "rgmii-id" correctly
> results in the PHY adding the required ~2ns delay without any
> double-delay from the MAC controller.
>=20
> The corresponding U-Boot change has been submitted to openbmc/u-boot.
>=20
> Link: https://patch.msgid.link/eac09481-0ba1-4ac2-ad8c-d859822ff0d5@lunn.=
ch
> Link: https://patch.msgid.link/20260504044702.2613879-1-andhsieh@nvidia.c=
om
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Marc Olberding <molberding@nvidia.com>
> Signed-off-by: Ender Hsieh <andhsieh@nvidia.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15 +++++++++++++++
> =C2=A01 file changed, 15 insertions(+)
>=20

I've applied this to the BMC tree. I've also applied the linked u-boot
patch to openbmc/u-boot, and backported this change to openbmc/linux.

Cheers,

Andrew
