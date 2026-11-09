Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224588;
	b=XgVUa5tFSaS/sDhXxaoz+J80VZ6Y8nY5lOvwQVvhwIdSIP0/0IysM0u9qfhd9KJAAnqT
	 W6zqOhAfjqkZvzkcBxEZJe37rqVHqjC6noiSFHcXRCt6ShHqTBBkRMwF9JrENT+gGVTdE
	 3Id3KRsf1/ikdCeCNGnabVvYN+31zgWLcsUemasjT78OUl4blR/y8BVyvY7soGkSRpq4R
	 LKbpRS2Iy1hD5vDC/oR6P9pz+LRfH65m/wAaRyW9zIcFPSPbfLiSEAWRcUi1C+hjJn0W4
	 r3EzyxKbbNCE4IfccvI6vO1aDni4TGwSyXkuExGjXV87/e1ykJS2KXQW70z95FiqU/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224588;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6vU3mgSk+MCk5co8UQRJJqmRFiY0ANHPowOGul2rpMA=;
	b=Ui/vZad+ZkNdpbrOZB/4ncWiCXg//osX7JRj6lUtXgkZkmzBD+aYRUAIQsUB6oznMRv/
	 rdsRsJzkqkAV/rqNrtYnqCE52N1g3fYivjAtvJk63/fJOj8IXL/tig0v/zuvqUiAu5j1k
	 UKCviT1EUExgEbjEEDlHSWac38MAGGdNw4cmXG8/flw2p1EblhqxpatABhB+wKcafbS9k
	 2bp54P9Rn3r9ze9vrfMuId+qyAswa361qCHjNVj2XHhUbm/AZIh42b/Y8rkoWerDeNxRj
	 0459i4oDMESVQfYzbXhoOWJHtAb3YgQHcpl61f4mlavI7GQg7xQjV50wHHwgYLE74ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFTssfdD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F5B606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFTssfdD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAED1F0089F;
	Mon,  9 Nov 2026 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794224587;
	bh=6vU3mgSk+MCk5co8UQRJJqmRFiY0ANHPowOGul2rpMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFTssfdD22maOLUlY2qxXosQZcu0yhWGlZIpQBChjtCVWjeVRNa2M079XsF2iB91b
	 gQ3gDKtdynP7/tK/kvmaISA2L9pyvLXtvX+fo0d4kgcwZRgE4ABnPhZFVkbAw48UN9
	 aJXDW2Z0oGgS9u25oGpMkYzZujVQUa9zGYvrklx3jmSpaD4XGU8MzrX4AGZiorhbxA
	 GyQ9fQHuDUEaypP0TYiXhOiCvprcQZClp0FOpfmvypgVSTdNzhDDB5H1ICD8zG9cxU
	 HbBr+CM/pbrt1qNlIyqP3Jqqi5q4J/KbyNjUtzR1/qQzuZRrzPqNkWN9daMaCgPZAG
	 74iNNdNfoVLKQ==
Message-ID: <sashiko-outbox-204889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: nord: Add MPAM MSC nodes for
 the L2 caches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-7-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
 <20261109-mpam-resctrl-dt-knp-support-v5-7-150335a79381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 11:43:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: qcom: nord: undocumented qcom,nord-l2-cache
  compatible string
--

commit 945c2648afac411c203b55a624505e915359df08
Author: Yin Li <yin.li@oss.qualcomm.com>

arm64: dts: qcom: nord: Add MPAM MSC nodes for the L2 caches

This commit moves the L2 cache nodes out of the CPU nodes to the root node
and adds child MPAM MSC device nodes under each L2 cache.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index fdbe290350ddd..285c6a3e5cb7d 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> @@ -907,6 +889,60 @@ dump_mem: mem-dump-region {
>  		};
>  	};
> =20
> +	l2_0: cache@19870000 {
> +		compatible =3D "qcom,nord-l2-cache", "cache";
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
> +		};
> +	};
> +
> +	l2_10000: cache@1a870000 {
> +		compatible =3D "qcom,nord-l2-cache", "cache";
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
> +		};
> +	};
> +
> +	l2_20000: cache@1b870000 {
> +		compatible =3D "qcom,nord-l2-cache", "cache";
> +		cache-level =3D <2>;
> +		cache-unified;
> +		cache-size =3D <0xc00000>;
> +		reg =3D <0x0 0x1b870000 0x0 0x2000>;
> +		ranges =3D <0x0 0x0 0x1b870000 0x2000>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		msc@0 {
> +			compatible =3D "arm,mpam-msc";
> +			reg =3D <0x0 0x2000>;
> +			arm,not-ready-us =3D <1>;
> +		};
> +	};

[Severity: Low]
Is a Devicetree binding schema missing for "qcom,nord-l2-cache"?

"qcom,nord-l2-cache" is not documented under
Documentation/devicetree/bindings/, and the generic schemas/cache.yaml in
dtschema only matches const "cache" with additionalProperties: false, which
rejects reg, ranges, #address-cells, #size-cells, and the child msc@0 node.
As a result, both checkpatch.pl and make dtbs_check fail validation on the
l2_0, l2_10000, and l2_20000 nodes.

Also, per Documentation/devicetree/bindings/dts-coding-style.rst, reg and
ranges should be placed immediately after compatible, before cache-level,
cache-unified, and cache-size.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-mpam-resct=
rl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com?part=3D7
