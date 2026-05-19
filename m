Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CB62836F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203071; cv=none; b=oZk4CyEoAEXt/0H50FZ6cfkbrqQYYnd3jbE/2zM8Ju1deFkEMEVTpaIVeeYBQaMiwkHRA+o2CNAUGPCpgQceECfd/m8+mF4IHweOw51u8j1403lfltv74RUb4eca43iQYLRDBCjRxUi3gpoTkbZoqpnHOa1lfKRoPlTSbRBhPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203071; c=relaxed/simple;
	bh=FNkCdrFk5GxcooG4Ka1j4WhPHVTMz05H/O1GBEgxhGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O1CrYeJ1flDJ/dYx0BDRMBOkA0HUzdXSPF/ClD34lmMSgtxG8xba2SNqBZB8FPQQc3qoyeO7admgS4fjffL36f3U+tyukcyJtpVYomMY7p+W0SQ/618sMu32T4pSREbDa6/B+3Xa7bWIiAx7Yns7w7cgzG3iWtK/xvHV1pwVgeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itFgw5ee; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itFgw5ee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E642DC2BCB3;
	Tue, 19 May 2026 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779203071;
	bh=FNkCdrFk5GxcooG4Ka1j4WhPHVTMz05H/O1GBEgxhGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=itFgw5eeamGAesgBs7dlLCl6kVPqezJY+zlOquXpcxEriIERspwrFxDl1jAGe/U0O
	 pwzHkHqqWPwuO0wwQdtXMMb+4gUALgn9WGH19TsYc+izqoMwCe/2/CWPlGYXi2dxr+
	 Cw3ggJ8rcW/nyt8d4db4UvRnQp7jcFOb9tYqESw6uZY0OFbBhnIItevD0mpaKF/w2/
	 YzehspHsuvPnWReZ/U39stajl1sV9Oor+NIVL/keywy2MvZlJzZ+EVGJNLqa5b8p6a
	 NAeEgBj2PhEPr/hm9VhkrAHfQWZD5RMLPj82BAGu6yca0zyMsfslpGjaNkRIAtLDXM
	 EPLo5MctlUI7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519142341.2531948-3-m-shah@ti.com>
References: <20260519142341.2531948-3-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 15:04:30 +0000
Message-Id: <20260519150430.E642DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The audio device tree overlay fails to disable conflicting CAN n=
ode devices from the base board, causing McASP audio signal routing to be s=
ilently broken when CAN interfaces are brought up.
--

commit c1ba2c3319437f9663a75e0a335a9f4615ec2ea6
Author: Jayesh Choudhary <j-choudhary@ti.com>

arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64=
/boot/dts/ti/k3-j721s2-evm-audio.dtso
> new file mode 100644
> index 0000000000000..6ed4d6fc414d9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
[ ... ]
> +&mux0 {
> +	idle-state =3D <0>;
> +};
> +
> +&mux1 {
> +	idle-state =3D <0>;
> +};

Will this signal routing be silently broken if the CAN interfaces are broug=
ht
up?

The base board device tree (k3-j721s2-common-proc-board.dts) enables
main_mcan3 and main_mcan5, which use PHYs configured with mux-states =3D <&=
mux0 1>
and <&mux1 1>. The McASP node here does not claim the mux via the mux-contr=
ol
API, relying entirely on the idle-state fallback.

When the CAN interfaces are brought up (e.g., ifconfig can3 up), the CAN PHY
driver will call mux_state_select(), actively driving the mux controllers to
state 1. This overrides the idle-state 0 required for audio, physically bre=
aking
the McASP signal routing without the audio driver's knowledge.

Should the overlay explicitly disable main_mcan3 and main_mcan5 to prevent =
this
hardware conflict?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519142341.2531=
948-1-m-shah@ti.com?part=3D2
