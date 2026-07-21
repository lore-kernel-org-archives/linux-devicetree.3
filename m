Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFEB2FD1DA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784603600; cv=none; b=UBMfsbMcmHdfMSs2n4xzHZ0qEZC/PE/4pDEj+bLg5VdmMR+QJS+D73CkwdYF1xbpXTkPOHeOtSdb//nwBbj+HNZXYrxFfrmzKjubvd1T4gttHAfbO7TI0/9/AmWlFsROuLJIqtAkvDeKKR+YmUQ4ryjbW2DVL91UEsWPyTxh0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784603600; c=relaxed/simple;
	bh=TVUBbMoMWmUZ5kd1c9JUL3JCEXjCY6FL/IX1SuPE4Dw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BZrLZWdExkub6aqgPSS2A2SYaebXkj6QcVLL7+QK+NSe3veNBykbnMcfzQwRFDVXqSlLBtrCQu9YKh1Fc+QjOUNpacgcNUd/GyDnd1cFxvqokAUI+KO1hP01fdu/IwCrSG7ImJna1SkaPweYiUf6yGfHhPF+abNLt72esrVpKS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeP+bLMw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeP+bLMw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5041F000E9;
	Tue, 21 Jul 2026 03:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784603598;
	bh=GMoYRRCwSjsCncskaLds2ol5UMPgQGOYEFydjv+FJvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KeP+bLMw+Nu23NhoEpJr7yPD0seMm73WUOUwXuEaPICjrRWw5BZiej8bLcKOYGzJF
	 VcVz9+hCkMEY1NNoz87GYemhJDtbECmnOQHS6IGyNMfWB8u2NpaLKN38MFXtsjVcEy
	 9LRcieHnZo/Mfa706R6EjAIlbJiONqaAF7UAjEtFos4vv1VErDfVQ52XxAdpgCDNAl
	 Sy0ePoNeZ8M9jedRusuZB+Un/qc4Fr913e/wGv52vFeDnOvFp8MddUX9GzvuvsardR
	 kc8p3xgYOwGWWv4Ven0WFT7yCR/BSh7r1uBWrGwZ9E1sl7ga9NHOc5qKD3JCId2uRl
	 0C4rM29/ACZVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable USB device mode on
 rk3399-roc-pc-plus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260721030043.84691-1-festevam@gmail.com>
References: <20260721030043.84691-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 03:13:17 +0000
Message-Id: <20260721031318.7D5041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding `usb-role-switch` breaks existing host mode and automatic O=
TG role switching for the DWC3 controller due to a missing OF graph connect=
ion.
--

--- Patch [1]: [PATCH] arm64: dts: rockchip: Enable USB device mode on rk33=
99-roc-pc-plus ---
commit 083559b8c4d210ad85e3dc07a4f89e6cd4079c56
Author: Fabio Estevam <festevam@nabladev.com>

arm64: dts: rockchip: Enable USB device mode on rk3399-roc-pc-plus

This commit describes the DWC3 controller as a USB role switch and selects
peripheral as the default role. This allows DWC3 to register a UDC while
retaining OTG operation.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/a=
rm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts

[ ... ]

> @@ -203,7 +203,9 @@ &uart0 {
>  };
> =20
>  &usbdrd_dwc3_0 {
> -	dr_mode =3D "host";
> +	dr_mode =3D "otg";
> +	role-switch-default-mode =3D "peripheral";
> +	usb-role-switch;

[Severity: High]
Does adding the usb-role-switch property here break existing host mode
functionality on the Type-C port?

When usb-role-switch is present, dwc3_drd_init() bypasses its internal
hardware OTG initialization and waits indefinitely for a software role swit=
ch
event.

Without an OF graph connection (a port/endpoint mapping) from the fusb0
Type-C controller to this dwc3 node, the tcpm framework won't be able to
locate the USB role switch via fwnode_usb_role_switch_get() when a user
plugs in a host adapter.

As a result, the role switch lookup fails and the controller might get
permanently stuck in the default peripheral mode.

Should an OF graph connection be added between the Type-C controller and
this dwc3 node so the role switch events can be delivered correctly?

>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721030043.8469=
1-1-festevam@gmail.com?part=3D1
