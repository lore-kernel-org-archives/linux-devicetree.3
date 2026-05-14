Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DEA3C1960
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758354; cv=none; b=JAGzlP6GfOVWC9FulovFu8/EVoDYMlPIZCIsJkHe51zX1YlTs1gwxGCVSeZRK05x+y0fxGU79gbVT/JTE6n8jGZjFHN6WaJq0o5VC/7YWYmKnDLx9gQbVqE7e2QpqdxFWGLBjndZPykYckpy3MeXz4Hh0cBW2baXwruQFgeXi7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758354; c=relaxed/simple;
	bh=zwI2MAkYiUXS43/4OjesrGHh6dPjZiPPNnaDxZvKHTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kM1cgYQuxbrl6iQ6gAmPQsDCYncOG46CIzunspL+MSFhoaJgQ812RGMm6HZcVnqziME24BgbGmLMvXYhgZ5qNQv4LlvpKkbGQWrVjTqhe/3u3zjXiVZai9oiNjDZday+CbHVKJxzFGluvH0GQx5NWbRaiuzol41JvsfDYGvCnAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmcfU2DG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmcfU2DG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF50CC2BCB3;
	Thu, 14 May 2026 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778758354;
	bh=zwI2MAkYiUXS43/4OjesrGHh6dPjZiPPNnaDxZvKHTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cmcfU2DG+Ne+LgGzuYV841ZQq4F2WLMiB6gzMtTU3ose74zPI9ONUk9LzPbPPPQ0g
	 qdAkCExL6ad6Pn0DKGCGzQPZkYbc5yQa3yXZO7EGm03dQaF0NeMo643zT9iHef8NZy
	 cV7FqZiGFqojMzOmcUiyDqqpRiCl9VQDkWFhlDQJUU6RVo5/Pv+rue0vj/w2qO0wN8
	 iZwBEIv1QVP6xfi+FgYGHIPgxjZOeeq53aP9/yIyPd7r14tRiViUw0DDZSQDDygqNw
	 8N03NDsVrFgeoJCt/IpgZ32AaLSJ6Z6k23In5RpUnXhbBFnR9V4CZnJSWSoQhEc2zf
	 p7uHu4UkMzDeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/16] arm64: dts: ti: k3-am62p-j722s-common-main:
 Add support for DSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-beagley-ai-display-v2-15-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-15-9e9bcefde6bc@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:32:33 +0000
Message-Id: <20260514113233.CF50CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `dss0_oldi1` device tree node is missing the mandatory `clocks`=
, `clock-names`, and `ti,oldi-io-ctrl` properties, leading to device tree s=
chema validation failures.
--

commit 15bd859b1e4ef9aa0d15277777045451416f00b7
Author: Jayesh Choudhary <j-choudhary@ti.com>

arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS

This commit adds device tree nodes for the Display Subsystem (DSS) and
associated hardware like OLDI, DPHY, and DSI for TI's AM62P and J722S SoCs.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arc=
h/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 5e8eb9f2fe243..576fa2f883648 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
[ ... ]
> @@ -1111,6 +1116,110 @@ dphy0: phy@30110000 {
[ ... ]
> +		oldi-transmitters {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			dss0_oldi0: oldi@0 {
> +				reg =3D <0>;
> +				clocks =3D <&k3_clks 186 0>;
> +				clock-names =3D "serial";
> +				ti,oldi-io-ctrl =3D <&dss_oldi_io_ctrl>;
> +				status =3D "disabled";
> +				power-domains =3D <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>; /* OLDI0_VD */
> +			};
> +
> +			dss0_oldi1: oldi@1 {
> +				reg =3D <1>;
> +				status =3D "disabled";
> +				power-domains =3D <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>; /* OLDI1_VD */
> +			};

Should dss0_oldi1 include the clocks, clock-names, and ti,oldi-io-ctrl
properties?

The ti,am625-oldi.yaml schema requires these properties for all oldi nodes.
While dss0_oldi0 and dss1_oldi1 specify them, they are missing here.

Would omitting these properties cause dtbs_check validation errors when a
board enables the node? Since this represents the same physical OLDI1 block
as dss1_oldi1, does it need the same physical clock and syscon connections
specified to pass validation and accurately describe the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-beagley-ai=
-display-v2-0-9e9bcefde6bc@ideasonboard.com?part=3D15
