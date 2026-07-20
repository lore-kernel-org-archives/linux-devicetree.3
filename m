Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334C39A05E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543546; cv=none; b=QhStCnGd0DgSMhQU/MUOyeBPpzdNNuEsWbIBn09JFBqDmcx9UktTPharZRuVbT56yswDfFLqyk+zNwkV7QoqdX1TJBNVrfba5QndTHuatfRRdDTK8SSIicEE63iSIyJsGLKhossnFtp+NhZxu5Qggmi9U02hjW+VPL8vDVv4JU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543546; c=relaxed/simple;
	bh=4UVlqGkw1S1+oTRFOkBCr9MCEyTu/Ys3IOW1KIAVgVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBGo07gjlhPgJMg5+H7kwjT9j51rPNgfFSh91v2HqHYecPGYwLLI1OFd32NhEfcxkmPA5mcUNeDoh6Ze+oEeAc8XouGvotdWRn0H+HAUwU5tXIpHBd7vAN3YIPrsiXQP5Gn3ghg/Af1Qg88ASVaavb97Ll0zHfds4tcL1WxB+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nk70z+hK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nk70z+hK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C971F000E9;
	Mon, 20 Jul 2026 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543544;
	bh=cZ4KvFsj7lin1MOwAQcffs7M9qMgzSuLVTIResijBP8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nk70z+hKnXiY1Z98GcEBTeIbJFgUrROF7nsCkoze+Sj6PwjFIdZPSUGPHm1MOYgfz
	 wtdUYYaJe4z0BSbZvuD2CQ2u6/+z36IPB637igk9czvARPRg9x8jufz+hGU+U+Bh9i
	 U+EfNY38EFBFkHBQ0TDhISyf+5yl65eeHjLHls8CTmGLvo3l417sRCXfw6AN0x7s0Z
	 SU7jWuJncEo188QKWBP5/0mLQWlIgC7gfP1yww1cVf4j3YQsIuzQ2vXkyCYnnAy4Aa
	 yA4O7yrnXxYU268ywoK5r+TWjZSsyvbWpIrtF0FFESd0YBD1WPioYzTSZCj4d0N/17
	 DSQbEr77kxshQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260720102222.251179-3-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
 <20260720102222.251179-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:32:23 +0000
Message-Id: <20260720103223.E5C971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `usb_phy` node is placed inside a `simple-bus` without a `reg` =
property, triggering a `simple_bus_reg` dtc warning.
--

--- Patch [2]: [PATCH v4 2/3] arm64: dts: nuvoton: ma35d1: add USB controll=
ers and dual-port PHY node ---
commit cf3aea78de55506203f48556a640406a6dccb9bc
Author: Joey Lu <a0987203069@gmail.com>

arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node

This commit adds the USB subsystem nodes for the MA35D1 SoC, including the
DWC2 gadget, EHCI/OHCI hosts, and a dual-port PHY node. It also updates
the board files to configure pinctrl and enable the nodes.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dt=
s/nuvoton/ma35d1.dtsi
> index 7228ad4735b5c..5a7a39b1b5143 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -88,6 +88,14 @@ sys: system-management@40460000 {
>  			#reset-cells =3D <1>;
>  		};
> =20
> +		usb_phy: usb-phy {

[Severity: Low]
Does placing this node inside the soc simple-bus without a reg property
trigger a simple_bus_reg dtc compiler warning?

The Device Tree specification states that children of a simple-bus must
represent memory-mapped devices, so nodes without a reg or ranges property
usually trigger a warning when placed directly under a simple-bus.

> +			compatible =3D "nuvoton,ma35d1-usb2-phy";
> +			clocks =3D <&clk HUSBH0_GATE>;
> +			nuvoton,sys =3D <&sys>;
> +			#phy-cells =3D <1>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720102222.2511=
79-1-a0987203069@gmail.com?part=3D2
