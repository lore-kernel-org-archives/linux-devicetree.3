Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBB23E5EFE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068356; cv=none; b=t/MmdLE1Ih/a7l6syzIu6UK6TTj2NB48FoW+fWNg529eVdsK0PNQmKewI3dDNBeR6M1W7M4HazONbacxbUeZw5cC3MI8sPIyxDE0Az5/m6EvxIVIdpoNrJ9ew3KljwoSqmQl1WV7DbOQqF7UwQJ106/+/n7aw4kNo4zpfDF8AEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068356; c=relaxed/simple;
	bh=gjhVZqBJUa57p/noRyg9uSurcyra08mS6TM/qdSo42s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nQRdMRbQmMVgDxWmoxfoiO0WoLkikqMr8QshPN13TL4zFTGJ+4LlY1AxHLG4FWuaTH3VqtHZUN+vIOal+jV8+QhsVSAyG8A8IFhaWlbLHJiVECK5g5NW48X+kgL4In/bCmr61EsbDJQTwAj+krZObEAvHtUlgqNveldKNpod0Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2yar4oO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2yar4oO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C5D1F00893;
	Fri, 29 May 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780068355;
	bh=Ehwgpxhxtw4kdDhfXBszZmun0ydcRsB6sfzaaZ8ttlQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U2yar4oOHBpcpmFbVMnd+l0pssFnTSX4bS3DWScyDbTw4T1upWUQ9hhK0HtsTqrNy
	 WrBUhdXBGa9bwSrnhNU74m75d7Im3oYsq2eZPuqbw7JKiRb4Q5bvPWGVhMPVHelNme
	 1zKEE9571XlCHJVWZRpLBDFWq8qcXFc13EXLZgBpiXK6rvWzSQjrUWo1oFH+gG8X1N
	 W/LtEAhGMj3DdPv0W2AhmhJNURz/TEiRu7JdneK/OJRfvihaWzqO0kLMZQqRvGrLxY
	 YHSKSTcJgdi9JsdPGzL9c1lssQlzfa+s50OVO4mjJlnGkw7l/EWBZR2U1K09JyoJeN
	 zdz204g1RpwQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: add reboot-mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anurag Pateriya" <anurag.pateriya@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-2-1964ebf1924c@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-2-1964ebf1924c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 15:25:54 +0000
Message-Id: <20260529152555.00C5D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly added `reboot-mode` child nodes under `&psci` lack a `=
compatible` property, preventing the intended driver from probing.
- [Low] Adding a `reboot-mode` child node to the `psci` node causes a DT sc=
hema validation failure.
--

commit 079cf5018c165ba61e6369f973cc92a5ec2da280
Author: Xin Liu <xin.liu@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: add reboot-mode support

This commit adds PSCI SYSTEM_RESET2 reboot-modes for the kaanapali-mtp
and kaanapali-qrd boards. It defines the bootloader and edl modes for
use by the psci-reboot-mode driver.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot=
/dts/qcom/kaanapali-mtp.dts
[ ... ]
> @@ -1321,3 +1321,10 @@ &ufs_mem_phy {
> =20
>  	status =3D "okay";
>  };
> +
> +&psci {
> +	reboot-mode {

[Severity: Low]
Will this new child node cause a device tree schema validation failure?

The core PSCI schema (Documentation/devicetree/bindings/arm/psci.yaml)
enforces additionalProperties: false at the top level and does not currently
document or allow a reboot-mode child node.

The binding schema may need to be updated to explicitly allow the
reboot-mode node to avoid errors during dtbs_check.

[Severity: Medium]
Does this node need a compatible string to successfully probe the driver?

Standard device tree matching via of_platform_populate() requires a
compatible property to bind a device node to a platform driver.

Without a compatible property (such as compatible =3D "qcom,psci-reboot-mod=
e";),
the driver core will likely ignore these nodes, leaving the bootloader and =
edl
reboot functionality inoperative.

> +		mode-bootloader =3D <0x80010001 0x2>;
> +		mode-edl =3D <0x80000000 0x1>;
> +	};
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-psci_sys_r=
eset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com?part=3D2
