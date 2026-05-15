Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345C3CF680
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843130; cv=none; b=U4qZe3ZyCDGkELZNqZIM1w0+VZmmFzrf0uhy04ZptkUh/jb0UrBbz+u6RzcM8Iw1lpM0p9DKI4PasIlE0bcZSWwn02qXVo6s8b3DjaTAwM+TsC84VJrOtL4rl5E2Y8fz/iT0WWnar2xa7tQEVwHWcrX9p+loojPHrlEy2DMEuLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843130; c=relaxed/simple;
	bh=0Z2S9Yh255mGoI9YQ0/9zeg6La56MQDU9nNU2Nyd/jA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mANetcm+EBuaXlLWBPuKLbh20TNfTXsbEX/za2bPvwhD2hIocP+R9U0UWCArGI9P8MpPli6ugonYzkkYtdDBKF5FU1VmMVAOCzR5dnexbDZdw+SOCNVUJMI9sJA0Hv90NnXUQ7Ixy0voYa1kb9T433YC9wkFUM8iDVpgxsBrUyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzJv5HPJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzJv5HPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81C3C2BCB0;
	Fri, 15 May 2026 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843129;
	bh=0Z2S9Yh255mGoI9YQ0/9zeg6La56MQDU9nNU2Nyd/jA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TzJv5HPJQQ4AcayIHFdHm2r9Sd4eVVYuhdng/7d1kfYOkUqDYRopMWIAZb/vRiWl3
	 ZxPXwiMf9wbR7Sil9tXLituKgZ/1BSHsTbKzFYUuz6j9Xl6PU/gyJK8NMkWIIwE1fM
	 ahU4LZbaXDrCfId8XkGugm+IUCS1hTrypnJixIQFfp46jT6XXPmecfIzVfLE8GNcwJ
	 6/dfP3ZBjMvk0ZL37UcqHqQahRfnkcfHZ9UYcLDkpdvpOKaLsE46MqOY0wMHVeWh7d
	 eHpx1spb8/0NhHt0Bt0bF7kayx896Kc0XWHMzTmb6Pfa2wLoKtKffZZguTP2Ys4tew
	 EX3KKTgFRk4fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/11] dt-bindings: extcon: document Samsung S2M
 series PMIC extcon device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-2-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-2-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:05:29 +0000
Message-Id: <20260515110529.A81C3C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding schema is missing the mandatory `examples` =
block.
--

commit aa3352c5e99da615ea9bbf089b70984f0d7cf61f
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

dt-bindings: extcon: document Samsung S2M series PMIC extcon device

This commit documents the devicetree schema for the MUIC device found in
Samsung S2M series PMICs. It acts as a USB port accessory detector that
reports cable states by measuring ID-GND resistance.

> diff --git a/Documentation/devicetree/bindings/extcon/samsung,s2mu005-mui=
c.yaml b/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml
> new file mode 100644
> index 0000000000000..0a320d5e2a352
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml
[ ... ]
> +required:
> +  - compatible
> +  - connector
> +  - port
> +
> +additionalProperties: false

Is this schema missing the examples block?

Although an example demonstrating this node is provided in the parent PMIC
schema later in the patch series, standard dt-schema requires all schema fi=
les
defining a compatible string to include their own example.

This ensures dt_binding_check can independently validate the constraints.

Could an examples section be added here so the node can be properly validat=
ed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D2
