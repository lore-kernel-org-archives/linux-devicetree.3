Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189106;
	b=tqwsH/+EKvIAawVmnNi8koLgBGsKYpNHTfUxXOLKvoumvVFSoS+dlWkv/IHCKQmtifA5
	 5ajmu4tRrncKUS30fpfIZEAYBi6K5h7JTqolcYUK6LgA/i3UrVKsCnLe8n/47BjbrNF7d
	 cuN/v1nIVhy34Rpe+YEj7EVPmvEDYsdGK7RPAg8wlHcDyacuUo1B7Bo2AfevDZiD1NqbJ
	 leSnkqTtu5K0yirib30cm2UB1pBYr+exaLjVNQ6t01HNYf+4CBx+q/lB7tMdbNTS4+KB5
	 JuVGLHYjd84MmKg0htzA2jQRYcvac0J1Pyf69YypesuFuMrAdvMFi3Ho4rTyQlkuOEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189106;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eVRhrzpBmEJpLLRSFqkvooQy5r4v+2KqS/CoyMG19Uo=;
	b=PaLjChh02Rl5thkEgYVD9GfDSLsx5xzO71RQNHgSneU8soD3yE90Q+RewBdGVh7HfDb4
	 xDWSjY9VqoHRJImlfAPStJd+OqOM7CZWz7fdTcCV+7nyXDgy0uY3NUfYtn/uhCEJ7vx7O
	 occLxJNqTQg3DGFoRrKFpz8sJf3DDMJPWZjnTgGnrz9DJarMAhpMxFIXPJ/e9rPrYbuTJ
	 0M7ROXpPDxuywtWDcHla9V4RjxoUvOr3mOOvhS35SIeeDAJnPE2rakgtiEWC+niEzoY7o
	 voCQF8fj2OqeZ5hCHoqLa1olWdq7IRu/TookpUU22Nhkrya2oE5HDtW51/mlAYnqhOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPa1w7lv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC2606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPa1w7lv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC9D1F01828;
	Wed, 28 Oct 2026 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189105;
	bh=eVRhrzpBmEJpLLRSFqkvooQy5r4v+2KqS/CoyMG19Uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QPa1w7lvRyXRYqYKae45CHCrc/c2MO+jHb5fadm83U9BvP70oTpRe0U0qg8gW7VtX
	 uDDiZemIRZMVIwoKPezWgfyVnlYWHUhwd4lnKbn7ZrweydGxOsJAF52nHxvtVPLBDv
	 EiXDGWr1sEf3YXShdOv2Txt/ppowuzkH4oW0WtfzRxzcFCAFawdbN4OJ4u8t5le33R
	 vNeWtynQ0IexAGUfNfL6yQtFUWcrLcUGQ+tY2FJDcsXVc+cLvvOCSbPdw14w/9c0B7
	 3t7/0ipjS5OKyHBtw0pkzi/phTZXG+5SR+DKIVBBBkqfweOkmLc6LrNS2j5v4/ywAA
	 vq2EjaoZjHt/g==
Message-ID: <sashiko-outbox-187856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNM v4 6/6] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 12:05:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: kaanapali: undocumented qcom,kaanapali-l2-cach=
e compatible
- [Medium] arm64: dts: qcom: kaanapali: invalid root L2 cache MMIO nodes an=
d compatibles
--

commit b790aa2c6d3cc2130d835b988b9078c67a5328af
Author: Yin Li <yin.li@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

This commit moves the L2 cache nodes l2_0 and l2_1 from the CPU nodes to the
root node in arch/arm64/boot/dts/qcom/kaanapali.dtsi and adds disabled child
arm,mpam-msc nodes for each L2 cache.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..10aee29a1ba8a 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi

[ ... ]

> @@ -532,6 +520,46 @@ soccp_smp2p_in: slave-kernel {
>  		};
>  	};
> =20
> +	l2_0: cache@19870000 {
> +		compatible =3D "qcom,kaanapali-l2-cache", "cache";
> +		cache-level =3D <2>;
> +		cache-unified;
> +		cache-size =3D <0xc00000>;
> +		reg =3D <0x0 0x19870000 0x0 0x2000>;
> +		ranges =3D <0x0 0x0 0x19870000 0x2000>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		msc@0 {
> +			compatible =3D "arm,mpam-msc";
> +			reg =3D <0x0 0x2000>;
> +			arm,not-ready-us =3D <1>;
> +			status =3D "disabled";
> +		};
> +
> +	};

[Severity: Medium]
Does adding compatible =3D "qcom,kaanapali-l2-cache", "cache" to l2_0 and l=
2_1
in arch/arm64/boot/dts/qcom/kaanapali.dtsi cause dtbs_check and checkpatch.=
pl
regressions for kaanapali-mtp.dtb and kaanapali-qrd.dtb?

The compatible string "qcom,kaanapali-l2-cache" does not appear to be
documented in Documentation/devicetree/bindings/.

Without a binding schema for "qcom,kaanapali-l2-cache" (and using the node
name cache@... rather than cache-controller@... as shown in
Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml), dtbs_check flags
"qcom,kaanapali-l2-cache" as undocumented and validates l2_0 and l2_1 only
against the generic "cache" schema, which rejects the unit-address on
cache@19870000 and cache@1a870000 as well as the reg, ranges, #address-cell=
s,
#size-cells, and msc@0 properties.

Should a DT binding schema be added for "qcom,kaanapali-l2-cache" (or an
existing documented cache-controller binding be used) before using it in
arch/arm64/boot/dts/qcom/kaanapali.dtsi?

> +
> +	l2_1: cache@1a870000 {
> +		compatible =3D "qcom,kaanapali-l2-cache", "cache";
> +		cache-level =3D <2>;
> +		cache-unified;
> +		cache-size =3D <0xc00000>;
> +		reg =3D <0x0 0x1a870000 0x0 0x2000>;
> +		ranges =3D <0x0 0x0 0x1a870000 0x2000>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		msc@0 {
> +			compatible =3D "arm,mpam-msc";
> +			reg =3D <0x0 0x2000>;
> +			arm,not-ready-us =3D <1>;
> +			status =3D "disabled";
> +		};
> +
> +	};
> +
>  	soc: soc@0 {
>  		compatible =3D "simple-bus";

[Severity: Medium]
Is it intentional to place the MMIO-mapped l2_0 (cache@19870000) and l2_1
(cache@1a870000) nodes directly under the root node rather than under soc@0,
and to assign the firmware-restricted 0x2000-byte MSC MMIO regions directly=
 to
the enabled parent cache nodes via reg?

On Kaanapali, other MMIO devices in the 0x0..0x10_00000000 address range li=
ve
under soc@0:

arch/arm64/boot/dts/qcom/kaanapali.dtsi:
	soc: soc@0 {
		compatible =3D "simple-bus";

		#address-cells =3D <2>;
		#size-cells =3D <2>;
		dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
		ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;

Because l2_0 and l2_1 are placed directly under the root node and remain
enabled while only their child msc@0 nodes are disabled,
of_platform_default_populate() -> of_platform_device_create_pdata() will
unconditionally instantiate platform devices (19870000.cache and
1a870000.cache) claiming the restricted MSC MMIO resources on every boot.

In addition, the commit message states:

"Each MSC is nested directly under its L2 cache node so that the cache node
is the MSC's parent device and its CPU affinity is derived from that cache."

and:

"This DTS is therefore only an example for other platform DT authors and is
not intended to be merged."

However, in drivers/resctrl/mpam_devices.c:mpam_dt_create_foundling_msc():

			if (!of_platform_device_create(child, NULL, NULL))
				pr_err("Failed to create MSC device for %pOF\n", child);

NULL is passed as the parent struct device, so the L2 cache node is only the
parent OF device_node rather than the MSC platform device's parent device.

Should the cache nodes omit duplicating the child MSC reg window on the
parent node (or remain under /cpus or /soc@0 as appropriate), and should th=
is
patch be marked with an RFC prefix if it is not intended to be merged?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-mpam-resct=
rl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com?part=3D6
