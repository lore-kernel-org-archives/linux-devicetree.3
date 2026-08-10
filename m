Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573053C4B6F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362944; cv=none; b=oS8/bW1mQG5TK3hAP+LCDAPJNwNmGZQe8otnxnI20/35WvS7lxsdcpOlFAuduJhcQpJPwMD/AKylrnoM+ZvIhLiC9n4tHFd5EB6vb/5gkiynp8gT5FAR9de3m8s2eHBRx/ogB58s+zI9y9q3NizMrtYYukaA1RI8O1PHCniQV+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362944; c=relaxed/simple;
	bh=ntMlaomOJIStMWIqtSinqtNYWfmg2/h5aK3qEQCNoRg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BSvex3MUdmCYlrK9mQaqXdM/MAC5IGyz+AHAYSQWvE1t2tnQg2UO40CGd7Of1UeM6eSj/8HQoZ7hraywpySMgoLhJKJwWDKudrvBstrRAr8ZYx5+9ftQIr72r72BHwsC8YGcriHUi1HZPuhi5K7kwal4ShqAfOcj5hGiO/rKjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSv9aYcS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSv9aYcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F901F00A3A;
	Mon, 10 Aug 2026 11:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362943;
	bh=cKrABHrG1URoVHmNUXzbctcoKvWMWWizUuygAXE5HBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lSv9aYcS+2DXlgbPH+1fCLfwZIJ/CGi7KubH1joviSZfNpaYRbDgjLjBXdNvfs+kt
	 +AmhHCteAXY3xyacWehWdaf334ERnwl3CIWwWxlOod04VSaSksl0hsgZNC34P1ugsi
	 8JfxxyRjD7Fkv248zTZ8lZCIlNVQjoUlQcPZxlq1dcweOxRzd7k6hXYsLPnFlz0Lsm
	 bp6zWzP0LXe0HNE8mhIe9XhrZHvVUn/a4tae1uPuIXqdumMYxrYVdZkK+ZK4MNcYuW
	 IT19bnMx61D34qjWLiq1N4yoYMsQwOQafIm9ShR061tiqTJW8JWwLK1Za61QyQXUTc
	 KZeFMWNEqjMsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 RESEND 3/6] arm64: dts: qcom: Add device tree for
 Nord Embedded variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810114313.776563-4-shengchao.guo@oss.qualcomm.com>
References: <20260810114313.776563-1-shengchao.guo@oss.qualcomm.com>
 <20260810114313.776563-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:55:42 +0000
Message-Id: <20260810115543.02F901F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Copy-paste errors in multiple QUP0 pin configurations (SE1 and S=
E5) result in duplicate or incorrect pin assignments, causing mapping confl=
icts.
- [Low] Inconsistent node names for `opp2` and `opp3` in the `rpmhpd_opp_ta=
ble`.
--

--- Patch [3]: [PATCH v10 RESEND 3/6] arm64: dts: qcom: Add device tree for=
 Nord Embedded variant ---
commit 643aac7df3bbbfb1eafbf771684900c0a9c93646
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord Embedded variant

Unlike the GearVM variant, Nord Embedded variant has platform resources
directly controlled by the operating system. Add a separate dtsi file
extending the existing top-level nord.dtsi with nodes representing these
peripherals as well as describing how they are wired up.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 0000000000000..f27ccc6f56dbf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi

[ ... ]

> +				rpmhpd_opp_min_svs: opp-1 {
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +
> +				rpmhpd_opp_low_svs: opp2 {

[Severity: Low]
This isn't a bug, but should this node be named opp-2 instead of opp2 to
match the opp-<number> naming convention used by the other nodes in this
table?

> +					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +				};
> +
> +				rpmhpd_opp_svs: opp3 {

[Severity: Low]
Similarly, should this be named opp-3?

> +					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS>;
> +				};
> +
> +				rpmhpd_opp_svs_l1: opp-4 {

[ ... ]

> +	qup_i2c1_default: qup-i2c1-default-state {
> +		pins =3D "gpio111", "gpio112";
> +		function =3D "qup0_se1";

[Severity: Medium]
Should these pins be swapped for SE1? This reuses the exact layout of SE0
(gpio111, gpio112) without swapping the data/CS or TX/RX pins, which might
cause routing conflicts on the shared 4-pin block.

> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};

[ ... ]

> +	qup_spi1_default: qup-spi1-default-state {
> +		data-pins {
> +			pins =3D "gpio109", "gpio111", "gpio112";
> +			function =3D "qup0_se1";

[Severity: Medium]
Do these data-pins conflict with SE0? It looks like this configuration uses
the exact same pins (gpio109, gpio111, gpio112) as qup_spi0_default without
swapping assignments for the shared 4-pin block.

> +			drive-strength =3D <6>;
> +			bias-disable;
> +		};

[ ... ]

> +	qup_spi5_default: qup-spi5-default-state {
> +		data-pins {
> +			pins =3D "gpio109", "gpio121", "gpio122";
> +			function =3D "qup0_se5";

[Severity: Medium]
Is it intentional to include gpio109 here? It appears to incorrectly mix
the SE0 pin (gpio109) with the dedicated SE5 pins (gpio121, gpio122).

> +			drive-strength =3D <6>;
> +			bias-disable;
> +		};

[ ... ]

> +	qup_uart1_default: qup-uart1-default-state {
> +		pins =3D "gpio109", "gpio110";
> +		function =3D "qup0_se1";

[Severity: Medium]
Should these pins be swapped for SE1? This reuses the exact layout of SE0
(gpio109, gpio110) without swapping the TX/RX assignments.

> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

[ ... ]

> +	qup_uart5_default: qup-uart5-default-state {
> +		pins =3D "gpio109", "gpio110";
> +		function =3D "qup0_se5";

[Severity: Medium]
Does this configuration incorrectly claim the SE0 pins? It seems to use
gpio109 and gpio110 instead of SE5's own dedicated pins.

> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810114313.7765=
63-1-shengchao.guo@oss.qualcomm.com?part=3D3
