Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6644843A7F5
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247940; cv=none; b=PE/2RuzNm71dGQ5wQ9iJ0sKdoihxyQ4KLPihLuHEo3ZZbq/D6W/qxjU7eiE+1bjdwGzuGFBE9YE6dpwT8oBZCKo8BaRJhXyJsYtmCFMEDD0jXwsLgufK8sehnDpn0RatC8DtHhZxHcg2J64W/AZDHeGw+6bkPAYGe9aHbhLWDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247940; c=relaxed/simple;
	bh=FoDmOrhVSR1+wzzfAJ5CunyXJJnU2GxL3LppH4WtsNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DaMzMdCQxbEP6DRcdViPlUmumt5L9GZ/a7iQSI+BUchwAKR4WAydUGh5PaeOLRhRLrUJOW3XBVlDKOThhbk0RmLpfvSrFDzP/Y8E+bAL+pQcOqvZYqeyJx9I6+hA+n5owQEtnL8UcdWVuncwRwfKtsk4Ibhft3OoASF/gQmZBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mK3eVkvR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mK3eVkvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFB21F00A3D;
	Tue, 28 Jul 2026 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785247939;
	bh=K3O7jSu8ktWEvfBFOVNkyedw/12Xu+FNFhkwiQh2oNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mK3eVkvRpcQDTcU3ZAqj92mG0RjQKF5JV+M1KtR36mAGlJSn6pAhAU3M/e4kltS9O
	 jrQ/OkVABSVABN2qoyJPkf7QmYf4XMpct3SmPhdO0gqXiEECPoQnfVzwpKFfaU4y3K
	 IBERfsktcZIb3PcKdpaRt9aQzYKsmqa1lFi08tONYWX38wluv79jo7cpy0c7Q686SP
	 Er2uUOatPshUOitv9Jk5eb+/kcE3YeeF5QCP5icBP2wwUISu3NakeYbGkslOZq4Ogz
	 wBcuNPGEqUofc8ozUdfp1vYvL0ctNiPjl2/HJam6RFeYcgz5IgY20B0SHLU66zli9H
	 pNFPotAZ8xWiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:12:18 +0000
Message-Id: <20260728141218.BCFB21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Devicetree compatible string for the TSCSS node uses the intern=
al SoC codename 'lemans' rather than the official part number 'sa8775p'.
--

--- Patch [5]: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS =
node ---
commit 534c460b6703617b947d74b06656ce6dd2f6d6c4
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add support for TSCSS node

This commit adds Timestamp Counter Subsystem (TSCSS) node support on
Qualcomm Lemans SoCs.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
[ ... ]
> @@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
>  			status =3D "disabled";
>  		};
> =20
> +		tscss@1c80000 {
> +			compatible =3D "qcom,lemans-tscss";

[Severity: Low]
This isn't a bug, but would it be better to use the official commercial part
number "qcom,sa8775p-tscss" for this compatible string rather than the inte=
rnal
SoC codename "lemans"?

Other IP blocks in this file appear to use the "qcom,sa8775p-*" pattern.
For example, the UFS host controller just below this node uses
"qcom,sa8775p-ufshc". Staying consistent with the part number helps maintain
the Devicetree ABI standards.

> +			reg =3D <0x0 0x01c80000 0x0 0x2000>;
> +			reg-names =3D "tsc";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-tscss-v1-0=
-beed14e72510@oss.qualcomm.com?part=3D5
