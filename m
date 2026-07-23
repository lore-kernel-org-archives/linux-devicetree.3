Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12934D398
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796481; cv=none; b=nvnXr07WvOgGX16af54wQm4IWp6zP1IO3D7mTIB5YhaWXiDVVKz9s8/xwxYwmvgIx79vz7U1c/qFoBNbQrdHcc1J/TP00WD6d42Qok6UtWxHPapAEGaOpzlT9Ibblm3AkaZCazKL51OyZbBox9GJmXldOoYYVWKhZ/N5FnWHqQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796481; c=relaxed/simple;
	bh=83aZWTQoRlsvq8o2u9a7DGytUxcI5bZYZMpVqaBw3H4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QoiNWyQsZ8klipuB8D3bP0F+S3atmdYhcOJS8VcxbwIIoL13I8Ug7rP1lS2EZT0cOm7+4MxU5TNFvOND6j/J3k7+COqiy89ny7FU5ZZ/WDJZ6ufsQFy1yWUTMdQ3m6bdsgonR2i8AFKmHlotOK3L1At5TqaQF8g3j68B5RcMOwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQ/kXVi4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQ/kXVi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBF81F000E9;
	Thu, 23 Jul 2026 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796479;
	bh=lCJfs2334AP5Ui00qhLYvVq9O7LnNTY3IJ06v6XgRUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SQ/kXVi4U75YYoCT1y/3EYasCbVzDq9AAZvLTathrgRBXyjp4NsqgjnQdL5I/2tTo
	 gg+AC0xTScLMnu+MPdSJHyxDx8TP4A/F+hxa5HxYXKLxjM8Tx53zLnh+pp0XSrmPKj
	 1PebzDgc2uRn4bD9EJRTNXR9+7KdX7GsRY2T5H5KJvwtVmoa0us3C9eHlO+YSmwPwW
	 t4nX+fBgNw21H4OcW/aozMs323bWzxOxjNgEP/z2WspgbV5XkqGbOM1HyN5ll/UTJA
	 Wz+uqpiydfw0DBIIpcXs14WJSr/ANR7hCbzLW+f1V97OEF+ed3bFNjfjTSE/T4G33I
	 uK2WnUenlieUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
In-Reply-To: <20260723084316.3573714-2-zhengxingda@iscas.ac.cn>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
 <20260723084316.3573714-2-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 08:47:57 +0000
Message-Id: <20260723084759.3BBF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'reg' property is omitted from the 'required' list for a mem=
ory-mapped PHY.
- [Medium] The 'avdd33-usb3-supply' is omitted from the 'required' list bas=
ed on software limitations rather than hardware description.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: phy: add binding for T-Head TH15=
20 USB PHY ---
commit 91b4840ee15364137facb1905580d4df2ba57663
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

dt-bindings: phy: add binding for T-Head TH1520 USB PHY

This commit adds a device tree binding for the T-Head TH1520 USB PHY,
which is a Synopsys USB 3.0 FemtoPHY with custom glue logic.

> Changes in v2:
> - Lifted avdd33-usb3-supply from required properties list. Because of
>   this the R-b from Conor isn't added yet for reconfirmation. (The
>   related regulator isn't yet controllable because no driver is
>   available.)

[Severity: Medium]
Since device tree bindings must describe hardware independently of software
state, shouldn't this physical supply be required if the hardware mandates =
it?

Software limitations are typically handled in the board DTS (e.g., using a
fixed-regulator), rather than compromising the generic hardware schema.

> diff --git a/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.y=
aml b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
[ ... ]
> +required:
> +  - compatible
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names

[Severity: Medium]
Since this is a memory-mapped PHY, shouldn't the reg property be included in
the required list?

Without it, device tree nodes missing the reg property will silently pass
schema validation, leading to incomplete hardware descriptions that fail at
runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084316.3573=
714-1-zhengxingda@iscas.ac.cn?part=3D1
