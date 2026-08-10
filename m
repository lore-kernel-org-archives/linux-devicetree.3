Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6980391517
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362826; cv=none; b=Zc0U5ubmfEcSqS04gIXwlShQ+zeqWzg0edOVK6IOR8xS8ZBcHBpungfWKvQdsF+21nbfNEsLFIfK889Bzl6Lzqepa0Q7FDdwcADnznKOWz4v3ZZggb06DyoT29vV2DMkQLrxDeIt5yiOmjygMRirZ4XnMv3Lcr9lbJl6HDqlduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362826; c=relaxed/simple;
	bh=Z7mObmEWDDAglXfNiNN2FflYTUBiJQ5Ee5nu1dATpIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qOhVk9RZ6eB9CM0MT1G0lNr5L1bk4C6l7vNaE34NZHjwX81iUPYvZ4NzrxFpnnu1mpoKY4pARn7YG3/QPqFUUFHvN5I3wfnaSvk6kqxJ4eQJ/EmKifNt8KydjxhAki40FubaMXp1rmAXKFafJysaXifU+/pnw6r2Yht00pa4Biw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyPWJ8L1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyPWJ8L1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BD31F000E9;
	Mon, 10 Aug 2026 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362824;
	bh=0wc4khY/2njp+rr4lVN7Zqn/TJE3TuCIVXW17jszwtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KyPWJ8L1nB/YVgVQvViM/8iENnlzwON+T3CfOG5QGRmAGQfws2yOezeCOFht+kNxH
	 C0dd3kqxUeZJXf5SCv1Zs0ULch2enFIrn+XE22MaUdSt/9WZ+onW2Xc4eht1r0JvlI
	 XnRP8l/smDXib3ZoTTyd/vcdXpb/xQKyw66bgRFEht68rGW1qO3d2zJI6It1Xi89d9
	 OIeuGdo+cC4vZ8/y0jhOrQ54QsdqRLdNihmowSrOdYWJBAal2HAjUogpc0A2NuZpsD
	 n3NGx43oWdbDxblBST4uESSQIpyzsfzXls5gRbhMEDfYoB1Ie04jlwAPquHCzNBNXk
	 JGxImeyraK0bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY
 TEST_POWERDOWN bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:53:43 +0000
Message-Id: <20260810115343.D2BD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch correc=
ts the bit offset for `SSUSB_CTRL_TEST_POWERDOWN` while failing to actually=
 fix the PHY powerdown issue due to a pre-existing copy-paste error that cl=
ears the bit instead of setting it. Furthermore, a naive correction of this=
 error will expose a missing cleanup in the init sequence.
--

--- Patch [5]: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY TEST_POW=
ERDOWN bit ---
commit c8781c769e4ee40df09815570d904fe2655dc82f
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

phy: qcom-ipq806x-usb: fix the SS PHY TEST_POWERDOWN bit
   =20
The SS PHY exit sequence tries to put the PHY into retention via the
TEST_POWERDOWN bit of SS_PHY_CTRL, but defines that bit as BIT(27). In
the DWC3 QSCRATCH SS_PHY_CTRL register TEST_POWERDOWN is bit 26 (see
the downstream phy-msm-ssusb driver for the same IP generation), so the
sequence pokes an unrelated bit and the PHY is never powered down.

> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qu=
alcomm/phy-qcom-ipq806x-usb.c
> index 21b59d4ca8d2a..cf77e0a66e20d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -51,7 +51,7 @@
> =20
>  /* PHY_CTRL_REG */
>  #define SSUSB_CTRL_REF_USE_PAD		BIT(28)
> -#define SSUSB_CTRL_TEST_POWERDOWN	BIT(27)
> +#define SSUSB_CTRL_TEST_POWERDOWN	BIT(26)

[Severity: High]
This isn't a bug introduced by this patch, but while correcting the bit
offset for SSUSB_CTRL_TEST_POWERDOWN, the PHY powerdown issue remains
because the exit sequence clears the bit instead of setting it.

Looking at qcom_ipq806x_usb_ss_phy_exit() in=20
drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c, it calls:

	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_CTRL_REG,
			       SSUSB_CTRL_TEST_POWERDOWN, 0x0);

The usb_phy_write_readback() function clears the masked bits when passed 0x=
0:

	tmp &=3D ~mask;		/* retain other bits */
	write_val =3D tmp | val;

Should the third call in qcom_ipq806x_usb_ss_phy_exit() pass
SSUSB_CTRL_TEST_POWERDOWN as the value to actually set the bit?

Furthermore, if the exit sequence is fixed to set the bit, will the PHY
fail to exit retention on resume? In qcom_ipq806x_usb_ss_phy_init(), the
register is read, modified, and written back without clearing the
TEST_POWERDOWN bit:

	data =3D readl(phy_dwc3->base + SSUSB_PHY_CTRL_REG);
	writel(data | SSUSB_CTRL_SS_PHY_RESET,
	       phy_dwc3->base + SSUSB_PHY_CTRL_REG);

Since data is never updated to clear SSUSB_CTRL_TEST_POWERDOWN, would it
stay set and prevent the PHY from exiting retention mode?

>  #define SSUSB_CTRL_LANE0_PWR_PRESENT	BIT(24)
>  #define SSUSB_CTRL_SS_PHY_EN		BIT(8)
>  #define SSUSB_CTRL_SS_PHY_RESET		BIT(7)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D5
