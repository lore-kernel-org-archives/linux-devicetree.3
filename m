Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A44E9C1A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109549; cv=none; b=NZAqmPQyBFg/nKpHpY9IGAlRZD6W16jUumscSTqrJPvZP5QSixevRVVd08ttAEdVI09u/fGKUIKDNWsF9Q6FJRnhTklUMK1Yw0AoQdIZaJ1J1Me4NRA3Oad358zIRKNZd0m6LVhQgq8TQ3Xm/ScFuQvWBhsmCx41CNBgRzdi4Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109549; c=relaxed/simple;
	bh=SJop8lOT8x57gN1gZDxBPlmHP2S186JD7rLW73JTh60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p588LabH9aEgXWw7BZp2fL1qKK7YiYopE5eS3LyRMhoO8TEmFrntGPS6gegux3/KCCKLNJ7sQPK/bt5uQU4jTEq5QiZ/S2u+EIVukR2+A75vxEsYt3MG47+K/TWTOnuziokPcoYs5RbytPoQpmB/fWB1FkPN0S3d3t0eIKnqo4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnNpf0dU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnNpf0dU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6098B1F000FF;
	Tue, 22 Sep 2026 20:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790109545;
	bh=itYxOmrH/aJDLruUqZYmat4mgVeW4klOEFoYpDIj5TE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XnNpf0dUuQoPpH0P9ioRXZzQz7kHO6dnJcPkdhh6eBvd1IUlVziP8I6spwQWJMEDm
	 LPlP54yzSGwO/7fCcvlT6poScfzhQgiag7DgSqss4mTFBbTHNeSZQPz1KHhtmgJlRS
	 G5mzDAQhioVKhA0VKvF09q9GCCkQhiIK2RMwEEv5v5qIkvku/Xpz8HMu2guXc1xgaj
	 6ndJZ/wMUfTTDcIrKeELYojYBQIWZiQsZDEHWrSMadLmqFafj3f9Fc6X5vtxziTyaI
	 IrY7kF32aDZxoSZ78uzQ0g+QCjIUd0aD0zswogNKYlwQscLetUX5ksHLKnuShkqYym
	 Cr5pC1IzGbNsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: hawi: Add base MTP board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:39:05 +0000
Message-Id: <20260922203905.6098B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt: empty endpoint with commented-out remote-endpoint in pmic_glink=
_dp_out
- [Low] dt: use of deprecated 'gpio' property instead of 'gpios' in fixed r=
egulator
--

commit 4899e77f8239c42c43d695808f8c3db4831e0a93
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: hawi: Add base MTP board
   =20
This commit adds initial support for the Qualcomm Hawi MTP board. It enables
several base subsystems including PCIe, SD Card, UFS, USB, remoteproc, and
the UART console.

> diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/=
qcom/hawi-mtp.dts
> new file mode 100644
> index 0000000000000..7709582491f9d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
[ ... ]
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
[ ... ]
> +				port@2 {
> +					reg =3D <2>;
> +
> +					pmic_glink_dp_out: endpoint {
> +						//remote-endpoint =3D <&usb_dp_qmpphy_dp_in>;
> +					};
> +				};

[Severity: Low]
Is this empty endpoint intentional? The remote-endpoint property is comment=
ed
out here in pmic_glink_dp_out, which leaves a dangling endpoint and might
violate OF graph schema requirements.

> +			};
> +		};
> +	};
> +
> +	sdcard_vdd_3p0: sdcard-vdd-3p0 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "sdc-vdd123";
> +		regulator-min-microvolt =3D <3000000>;
> +		regulator-max-microvolt =3D <3000000>;
> +		regulator-enable-ramp-delay =3D <1500>;
> +
> +		gpio =3D <&pmh0104_c_e0_gpios 5 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Should this use the gpios property instead of gpio? The gpio property is
deprecated for fixed regulators, and using it might trigger dtbs_check
schema compliance warnings.

> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&sd_card_eldo_en>;
> +		pinctrl-names =3D "default";
> +
> +		vin-supply =3D <&vreg_bob1>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-hawi-dt-po=
st-v1-0-e41473b6298b@oss.qualcomm.com?part=3D4
