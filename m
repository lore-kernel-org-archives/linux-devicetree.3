Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29D1F938
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 01:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572349; cv=none; b=elr5aWd+J2LvJFvbguiNO+IS+1OKmeKUNYjOrsfLhl6MtEJ2eI1oetDK6gLn8R5HMmRCR7sLvJ0Ojfo3F3A9atUzW9dGwE87fp9GtXpRq3p86Cpvht6pcc6tcyGlo9wFbzbj4jtQRut+x8nrq8fAp+1pDnHJOM9ZP8oIhYcIAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572349; c=relaxed/simple;
	bh=YeWUN0wW0LRsGItIXOuch4TCCpJvSRgK5xqiRXj+M44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bcCoGcuwQyURWkxYehzBfmucZ8HIlA8eftOMyA0w6ojFYBqK+CiUZJxQWJyRYTp2iRLs8wf+XQaTmC3BOk/I+Aj9M1LuVMAFRvCdXujiXxpl0aDeWriGnQqJXIayBHh1VlZdkg/bSh0bF702c47ZI+zupFSBQjzZ+TkYuPn6VyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duUuaM7y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duUuaM7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061881F00A3D;
	Sat,  5 Sep 2026 01:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788572348;
	bh=LS2C7J9+KDZfMHgTcA4TpBJ5dWh9SfXWLiBY834hzQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=duUuaM7ytXyHmz/1LZwuwWwUGGZXY3WxI3GA1iXLvnKZOxR1gtGivXJOpYlVWGlOd
	 h+0Zgu1bj72yV+SwXxCWFZ14V42qpjQ6j0RzPV4/vFNb/5vYawU2EuxqfkDOYY4YiO
	 jZ79/KRM5HGmsCE9lfa/LpprNXu5lN7ZridbcVpNGHZIDKvsM2QbRg6zO/2RSlgVWn
	 xP/qBy3n8oJCTlXRC0qNR2AxUeI0mcqgZS4xcw8lycHUpx9dDN8LEYZFXq1K1TbUgp
	 g2Wf74+8JbG/Bcn7QiZNLb+RXEBfrrcMx62xpjwwictCEmcNiEbvTvWcLCNGUN5TLq
	 6vx3c9KUwaeDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260905-lvds-support-v3-2-b40a1b03f63c@oss.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-2-b40a1b03f63c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 01:39:07 +0000
Message-Id: <20260905013908.061881F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing driver support and dt-binding for "boe,dv215fhm-r01" com=
patible string
- [Medium] Missing driver support and dt-binding for "lontium,lt9211c" comp=
atible string
--

commit a2fe1318b3ecc93e85b9567ef46bf0dde9702054
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add LVDS display overlay

This commit adds a device tree overlay for the Monaco-EVK mezzanine to supp=
ort
an LVDS display output. It wires up the Lontium LT9211C DSI-to-LVDS bridge
along with a BOE dual-channel 1920x1080 panel.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dt=
so b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..b796df28037bf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
[ ... ]
> +&{/} {
> +	model =3D "Qualcomm Technologies, Inc. Monaco EVK LVDS";
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01";

[Severity: Medium]
Is the driver support for this panel included in another patch series?=20

When this overlay is applied, the driver core will attempt to match this
compatible string against available panel drivers, but no driver currently
registers it and there is no generic fallback provided (such as panel-lvds).

This might cause the panel device to fail to probe, leaving the display
pipeline uninitialized.

[ ... ]
> +&i2c8 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&qup_i2c8_data_clk>;
> +
> +	status =3D "okay";
> +
> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible =3D "lontium,lt9211c";

[Severity: Medium]
Does this compatible string have a corresponding driver binding?

The existing lontium-lt9211 driver only matches lontium,lt9211. Without=20
driver support for lontium,lt9211c, the DSI-to-LVDS bridge device may fail
to match and probe, leaving the display pipeline non-functional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-lvds-suppo=
rt-v3-0-b40a1b03f63c@oss.qualcomm.com?part=3D2
