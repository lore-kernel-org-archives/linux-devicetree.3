Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA22E9ED6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155356; cv=none; b=HpMdb56NLNzgGV/kshiv8BXNAYCwEtqjQ02ivUgjKpny/98Q/59U/p5NxZLfhEpxJUpzer9XtkBBxLup4bTK/yZ68mdwtLeUUd1LWYixoiRyGvn+dWFXIhAbOGP/Be+ltCuZ4O44dm22pUasxjRshE5PoLP21NSv5mVgSaZDtxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155356; c=relaxed/simple;
	bh=gdfk1k71Tvny+Ux85VmIuUNOCUB5XrsDwF0dhKKaqnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CQKT+bxk9hMopZ9Cz23ar4s9VHPfRwRfRuoU7eU+tXIcCpAVxkSgDgxTiiSf+mZ5HmyyoB2FK13otPraNWtzGPdBtod9KWIZFjfG0x8Vr74KMz9YDSxinQxFRAJnIydH0R9onQRA8tdZATGcWl8yJdSYFMcifKdkpOMYAgTo5PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boeRrAlh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boeRrAlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E495B1F00893;
	Thu, 11 Jun 2026 05:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155352;
	bh=8VCUPPcSvhc3G/Kwt1PKZdUGLff5ah2+iW1xvzEYtTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=boeRrAlhy1IzyFyEPaaeB3/TqxBK3diCJ7mAszodRWCUnamPf8wioPRzVDpAvegSL
	 uvHXV+XhQhCjEG+ZH4IkRDWIqAIq8FbKRFHjln6I39AEfRerIAml8rdHNBvGEjVkrv
	 dO6xJkVmRRyriDOoy8i99mS+6bRQFekBvdI4BRgDjr7ICV/BHyROvYNIhN9iu4V6A7
	 OZ4wTKW+y2wODW5ykK0qMJzgYhk92WGi9VCGWGm/bea/DI/l6QIQgVQWt/n9REg5kl
	 8t6Z9tTsL9Fff2fMv0h1eaF0eBGP3+BxQtJswFVsb+8qTPxVthMJtKVATSZToqeX/2
	 lVp+XlecDU7wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 34/37] arm64: dts: qcom: talos: Move PCIe phy and
 GPIOs to root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-wake-v2-34-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-34-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:22:31 +0000
Message-Id: <20260611052231.E495B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A preexisting error-handling flaw in `qcom_pcie_parse_port()` caus=
es a resource leak of the initialized PHY. This leak will now be frequently=
 triggered due to this commit moving `reset-gpios` to the port node.
--

commit 689313d243e7ec1e4f35d3db8dcb7b5d6e32d186
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node

Moves the PCIe phy reference and the perst/wake GPIO properties from the
RC controller node to the root port node. Also renames perst-gpios to
reset-gpios to match the root port binding context.

> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/d=
ts/qcom/qcs615-ride.dts
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts

[ ... ]

> @@ -444,15 +444,17 @@ &mdss_dsi0_phy {
>  };
> =20
>  &pcie {
> -	perst-gpios =3D <&tlmm 101 GPIO_ACTIVE_LOW>;
> -	wake-gpios =3D <&tlmm 100 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 =3D <&pcie_default_state>;
>  	pinctrl-names =3D "default";
> =20
>  	status =3D "okay";
>  };
> =20
> +&pcie_port0 {
> +	reset-gpios =3D <&tlmm 101 GPIO_ACTIVE_LOW>;

[Severity: High]
This is a pre-existing issue, but will moving these GPIOs here make it
highly likely to trigger a PHY resource leak during probe deferral?

In drivers/pci/controller/dwc/pcie-qcom.c, qcom_pcie_parse_port()
initializes the PHY before parsing the perst GPIOs:

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_port() {
	...
	ret =3D phy_init(phy);
	if (ret)
		return ret;

	INIT_LIST_HEAD(&port->perst);

	ret =3D qcom_pcie_parse_perst(pcie, port, node);
	if (ret)
		return ret;

	port->phy =3D phy;
	INIT_LIST_HEAD(&port->list);
	list_add_tail(&port->list, &pcie->ports);
}

If the newly moved reset-gpios cause qcom_pcie_parse_perst() to return
-EPROBE_DEFER, the function exits before adding the newly allocated port
to the pcie->ports list.

Since the cleanup routine qcom_pcie_parse_ports() iterates over the
pcie->ports list to call phy_exit(), does this mean the initialized PHY
reference (and its underlying clocks/regulators) will be permanently
leaked on every probe deferral?

> +	wake-gpios =3D <&tlmm 100 GPIO_ACTIVE_LOW>;
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D34
