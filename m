Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD053DC4C2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448990; cv=none; b=KWhnJ4aw9VG023GAS64o1+iXZOTw5XXW6GowV/yk0GXjRNFYNACTHdzUZqD7Ikl2KAx3CM730F+4WhD8sChhF6K4oPc7etpoczcFnB/KKegOmak+puU5L3iXk3ZMUa1Rbk1PZRhuqk024YysL4tzwuZMb+uYLB5WGJbq7utUX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448990; c=relaxed/simple;
	bh=JlhtxXdZoy2r/L4fNtxv/bkFa1wgdq1RvlOF0ZgINMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hRNQd14i9tXmBPlcUppRsdZ4JIteqrT53A8kLxSccvmM0wBLLoxdpgl1qHUIaSPdgos8OBbiv3BVMKCAmAV6NGoMjjUKEj110lGboGs5XDsOjmy39HpPNUQkK6Bb7Arr32JwEJrJ8mhLoN4rxGCTb8ETrbmCKD+GW3ITkAAqYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgLN2qWh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgLN2qWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C961F000E9;
	Thu, 30 Jul 2026 22:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785448987;
	bh=V9xy9+yWjCnqodVuv477m+hNUfablM7pFd8TcrD78v0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NgLN2qWh8C5O7o8bhBTPQG7txGN3paC14aPTT8pRDg7+5YFqCazupxFa2x2sIbt2P
	 1So816mkQ+AbOiSB9n33ZYhuf9WdSDkFoVFMqneXFvdrfcph7E32DXTIX5sJSd00uM
	 33BgRBHYQxZDqnuq933F1ZLLBYfpWlmCKRaHVOOC+iYX37b59TXWqie7GDmayYh9Hw
	 BcHD+Rj0ozJZdyFIG8kMGOhJdSu8kY2RE6HQWi4HcjbYE2JmW9nIoLIlKtdm+h+VcD
	 k8akRds2nDMwW99osGBiZVLFAPfLCPm+So7VlVRvq8K0hsvXjk+d9jXAfJgmODsHxX
	 YpU9xM3sav1Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8250: add device tree for the
 Xiaomi Mi Pad 5 Pro 5G
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF3aWQgV3LDs2JlbA==?= <me@dawidwrobel.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260730-sm8250-xiaomi-enuma-v1-4-ed6d8fb99668@dawidwrobel.com>
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
 <20260730-sm8250-xiaomi-enuma-v1-4-ed6d8fb99668@dawidwrobel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 22:03:06 +0000
Message-Id: <20260730220307.61C961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The newly added device tree source `sm8250-xiaomi-enuma.dts` fails =
to compile because it references an undefined label `&wifi_0`.
- [Low] The root `compatible` string violates the `qcom.yaml` schema expect=
ations and will fail `make dtbs_check`.
- [Low] The display panel `compatible` string violates the `novatek,nt36523=
.yaml` schema expectations and will fail `make dtbs_check`.
--

--- Patch [4]: [PATCH 4/4] arm64: dts: qcom: sm8250: add device tree for th=
e Xiaomi Mi Pad 5 Pro 5G ---
commit 3ad8e67e479446954f8eea3da616a9b04bf046b8
Author: Dawid Wr=C3=B3bel <me@dawidwrobel.com>

arm64: dts: qcom: sm8250: add device tree for the Xiaomi Mi Pad 5 Pro 5G

This patch adds a new device tree for the Xiaomi Mi Pad 5 Pro 5G (enuma),
which is the modem-equipped variant of the Mi Pad 5 Pro. It describes the
board using the common device tree along with its own board ID, panel
compatible, and WiFi board data variant.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts b/arch/arm6=
4/boot/dts/qcom/sm8250-xiaomi-enuma.dts
> new file mode 100644
> index 0000000000000..7cc9ed7d12b28
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts
> @@ -0,0 +1,26 @@
[ ... ]
> +/ {
> +	model =3D "Xiaomi Mi Pad 5 Pro 5G";
> +	compatible =3D "xiaomi,enuma", "xiaomi,elish", "qcom,sm8250";

[Severity: Low]
Does this root compatible string violate the qcom.yaml schema expectations?
It looks like it contains 3 items instead of the strictly expected 2, and
"xiaomi,enuma" is not documented in the schema, which could cause
make dtbs_check to fail.

> +
> +	/* Platform type differs from elish; msm-id is inherited unchanged. */
> +	qcom,board-id =3D <0x2e 0>;
> +};
> +
> +&display_panel {
> +	compatible =3D "xiaomi,enuma-csot-nt36523", "xiaomi,elish-csot-nt36523",
> +		     "novatek,nt36523";

[Severity: Low]
Does this display panel compatible string violate the novatek,nt36523.yaml
schema expectations? It appears to contain 3 items instead of 2, and
"xiaomi,enuma-csot-nt36523" is not listed in the schema, which could cause
a make dtbs_check failure.

> +	status =3D "okay";
> +};
> +
> +&wifi_0 {

[Severity: Low]
Is wifi_0 defined in any of the included files? It looks like this block
references an undefined label &wifi_0, which triggers a fatal dtc compile
error during make dtbs.

> +	qcom,calibration-variant =3D "Xiaomi_Pad_5Pro_5G";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-sm8250-xia=
omi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com?part=3D4
