Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307146AA8A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649145; cv=none; b=apOVuLRgpQSd2IkyG4SWokgEeycr2/BtPwfBZSvmG3oLBL2lncIdpMYcfwbbc2cbZZ7keL61xMfKcaCpSl1taOZV2e7uMwqGR597vXPb2dlKf0QVSQxYMUUVt6IwJ+hUXKXrmywOEmCFColnfMefcnxqGR96D3KXFOaL5/hpu6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649145; c=relaxed/simple;
	bh=9FGwusiwV53XmCQO1pqB9Mf1arDSGAA3riX7DLa7I1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hV24/Mt2vaLiaBBbC8gdVzMimst5hNkr7MV4huskiH9AV2jq0t8uKytTyFqLZbTpbweQ6EmL2Oe4P371rw/1EjQOf3jpuqO9rogdCPGB0/2Nn5JFu9xWkSL3cJDz0Dyo33tSIYpCKu4/RtASXnN7Gmotq4fE+iCNX5dUebJJjzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+gjAmT+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+gjAmT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1ED1F000E9;
	Tue, 21 Jul 2026 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649143;
	bh=c3mMG2mldbFyKdBcEWLx8VKcayMsl4mwJVrMG6w6JVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N+gjAmT++x6hvsd1m8mljhXdLclxYWrvG7pzU0PczXcFNBHzUFsyEb+ND+rtvzmuQ
	 V5FA0WLy51zGqACHxYJYFh5yd2rF3fayCXtPKjuSvEzy62mJczs/QnfjrlDlyt1/CV
	 AH17c0v9Qp0FVwB51u8g8Aqnfs86ZJM7EAfT+0zXm+Mwf5LvvugXVmTcncpS2IHw6q
	 iy/3oqzzNdxpkzvAA6uiMWCmnFfjIwfwaBNJEb/vucL3K7OAS41b2g6MBhoMAUNrMc
	 YDvGTjcz20UI3N6Y0gUGSl+pb70BeJ2l6Cu5ZBedRC8TnFxPbT6dba+VUW5j6nk5m7
	 Kby/igqbmkofA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tianyuan Jiang" <code_0002@163.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721153444.423-1-code_0002@163.com>
References: <20260721142147.1618-1-code_0002@163.com>
 <20260721153444.423-1-code_0002@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:52:23 +0000
Message-Id: <20260721155223.9B1ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The device tree heavily relies on undocumented downstream compat=
ibles that lack mainline drivers or bindings.
- [Medium] Missing Developer Certificate of Origin (DCO) Sign-off promised =
in the changelog.
- [Low] Unidiomatic deletion and redefinition of a pinctrl node.
--

--- Patch [1]: [PATCH v6] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (=
sheng) ---
commit 0ac17b1bf2e0cc5382a800a4519a79a941821b31
Author: Tianyuan Jiang <hiez832670@gmail.com>

arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)

Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.

>     Signed-off-by: Tianyuan Jiang <code_0002@163.com>
>=20
> ---
> v6: address Sashiko AI review on v4
> - Fix cs35l43 reset-gpios polarity: use GPIO_ACTIVE_LOW
> - Add "kinetic,ktz8866" fallback compatible for backlight
> - Add map220v Signed-off-by (DCO chain fix)

[Severity: Medium]
The changelog mentions adding a Signed-off-by tag for map220v to address a
DCO chain issue, but it appears to be missing from the commit trailers.
Should the original author's sign-off be included in the commit message?

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts b/arch/arm6=
4/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> new file mode 100644
> index 0000000000000..fa24b1c1b4e65
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> @@ -0,0 +1,1761 @@

[ ... ]

> +/delete-node/ &hyp_ext_tags_mem;
> +/delete-node/ &hyp_ext_reserved_mem;
> +
> +/delete-node/ &qup_i2c8_data_clk;
> +
> +/delete-node/ &qup_i2c9_data_clk;

[Severity: Low]
Is there a specific reason to delete these pinctrl nodes at the root level
and manually redefine them later in the file? It is usually more idiomatic
in device trees to override the properties directly using a reference
(for example, &qup_i2c8_data_clk { ... }) instead of fully deleting and
redefining them.

[ ... ]

> +&i2c5 {
> +	clock-frequency =3D <1000000>;
> +	status =3D "okay";
> +
> +	cs35l43_trl: cs35l43@40 {
> +		compatible =3D "cirrus,cs35l43";

[Severity: Medium]
Does this compatible string have a corresponding upstream binding or driver?
Using undocumented downstream compatibles, along with several others in this
patch (such as nanosic,wn8030-sheng, novatek,nt36532e, and fpc,fpc1020),
causes validation failures with dtbs_check since their custom properties
are not defined in any schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721153444.423-=
1-code_0002@163.com?part=3D1
