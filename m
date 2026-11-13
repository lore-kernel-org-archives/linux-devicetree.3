Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560372;
	b=XXO/Si+TMJ98aK9iqkdPjFZDPwt+Wl10YrA6IWGT09QpfiWSet6/6TSzDUdX6qhcbHqK
	 MxhjjVSrPBiF3S/1fzkgdrWqP0vwCi2d4N0jPLUumpHvTfstmCeO3ErMDJa6r7ndvjsuX
	 sMd7P9HWnuMmGSnShkzfehVL6Hq91VOhpSAhX63PySEvGVeaLnBLDy+hpZqtK9m8nPjfI
	 HAo2hmOE3tnMXCUHF38VXeU1rYW6Z76xUJMx1TDWR4Y1xsTyuiwRfZ/kLhNF3XkFiKL7a
	 boeaHoTLXCC0qpIMtD4fFoQyLSC87OSigp/eleldxUSSxPiPSb3xjyQFYTyyVctQWYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560372;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A61vduvWIQsj4XKv5qm94j2x44r6wTG7iYaP3N9ljNQ=;
	b=NCRwPZWKi4dJU8VGwD7UtGaWzt0Wb6kq9EaOnaDx5UW48h0iPtqb2Ykk/jS61ZOQeY+G
	 BbZO1LJu7ZJ/7vLq1kOqYiBedSzVFbtybrVPvI45IS65KdMAJMDww4+Rg2veEDe07eLWx
	 fGE7W8TOZnzh9dgS9acxL7+def1rcDJNBqkc6JAkdLSz+1vjPAjPAywJLY+ZRdppR2D9P
	 opjquHho5bJJUeK54J85M/u9tvG43/WLUOWtuohE5O3Z85CPio8NgeJedgUc5y6K2iY1/
	 9uc7x5z+pzo+jE5vpfmqnWMCY8UAFk5EvAGWEDrVzth079DsKav443SP5nAhnalPqXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhYscJib;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B23606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhYscJib
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE1E1F000C4;
	Fri, 13 Nov 2026 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560371;
	bh=A61vduvWIQsj4XKv5qm94j2x44r6wTG7iYaP3N9ljNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bhYscJibe+FwPz1m4xOQ20AzGbzcEjdIdKQDoUY0LwqgT4jOV7ibBof2RINP9NXg9
	 K+vEjYl8Q/w+Ix2k8jxe10EINGPuo0Y+ulVLOf8K2yERzUM7fAUjR7xUy9Ni9kpBMP
	 XPJ4r3I9kMeI9CdIvhDWST3E3OseEGE54Wo0xk2734WNFuzUyPXR54oB7yDlPlvMrL
	 bA04gJjVoDKvNkG7W0ErwhH1MF3QdbGlDapgAJW/DNdy0vyjxHHRhB7vpn0stTmtoP
	 LHlq2oHbSj9R4VgAg9onezNAkyQ2YjBI1AK1u2fXsO7doYgI1MPrFUREbeYfOHTP1g
	 02fB4wwOPjGOw==
Message-ID: <sashiko-outbox-212488@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin
 trips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-thermal_bin-v3-5-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-5-878df6eef8bc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:59:31 +0000
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
- [Low] arm64: dts: qcom: kodiak: duplicate @180 unit-address in qfprom
--

commit e6d4eae865bd91c0bd0f76066337d957b0861f51
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

arm64: dts: qcom: kodiak: use thermal hw-bin trips

This commit adds jtag-id and feat-id nvmem cells to the tsens nodes in
kodiak.dtsi and converts passive mitigation trip points to per-bin
temperature values.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 10e9a5279ed60..79553bf43a7a2 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1028,6 +1028,18 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>  				reg =3D <0x1e9 0x2>;
>  				bits =3D <5 8>;
>  			};
> +
> +			jtag_id: jtag-id@180 {
> +				reg =3D <0x180 0x4>;
> +				/* bits =3D <offset width>: 20 bits at offset 0 */
> +				bits =3D <0 20>;
> +			};
> +
> +			feat_id: feat-id@180 {
> +				reg =3D <0x180 0x4>;
> +				/* bits =3D <offset width>: 8 bits at offset 20 */
> +				bits =3D <20 8>;
> +			};
>  		};

[Severity: Low]
Does giving both jtag-id@180 and feat-id@180 the same @180 unit-address
trigger a dtc unique_unit_address warning when building DTBs with W=3D1?

qfprom_fixup_dt_cell_info() aligns byte-addressed QFPROM cells to 4-byte
words at runtime, so feat-id can be described at its starting byte offset
(feat-id@182 with reg =3D <0x182 0x2> and bits =3D <4 8>, and jtag-id@180 w=
ith
reg =3D <0x180 0x3>), placed before gpu-speed-bin@1e9 in ascending
unit-address order.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-thermal_bi=
n-v3-0-878df6eef8bc@oss.qualcomm.com?part=3D5
