Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71332B139
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607442; cv=none; b=CBjChh0WsqZUdfREUlmSLaSjwtLaWoe5mBkHwPDh2Q7bbwQw/44gBcO53oPrhR2mzcmM5HoxoF5Pm3P9ya/yW66uDy+ZwHMsVJROsO+iHm9nNnCy+3lDIuD0unqP+VjPiv0msryYfIqrt92PgKyvucLyeBcv67roNDKnpCwMVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607442; c=relaxed/simple;
	bh=ep0GaNAiNGU4LV4YJX68e8TFdJ99tPDSIW+0gqMGrik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hnKPDI5SL9+QkwQPvnZdBcXd6b740CypJDVgeQcl5B44wPcx9J4NUbqIEZQzy5kIdu8E3dq7+zAgJo4sjr9b5p65xt5aCBqwH7XirtWmvniW2wAdRULtE3BOLkljhVvOfkqokUwFjB3/XVHLDVP3BqaA9J6lzfXIFXv01VaexnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXtKxn16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXtKxn16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8441D1F000E9;
	Thu,  9 Jul 2026 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607440;
	bh=D9cDm8dAUdTuld5DkoieMTF0gChW73UQxAgSuGpI0gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LXtKxn16prtHVkYZW/scBBNHFL1F/ozEujnO+ha2rWq0K01HJsafphldVG8f9QyoO
	 jVNM9DuAQ5UIveWdc9hB3ELhN7biOydieHQmjcLTZ7XbZ2TyZjI1WhHYi50UwOqYvz
	 66zHzOx3b0TfZs+ST0L/2mCsFrFZohn2GUgAtUv+3VH6x8d3YdneNcRn0bO+w2fwW+
	 md5EbOUB+1xKQqI3HWFjKy4tzILUFWkWeaztk6QmUZalgLgu+7wki/6rAv5bTwVs+M
	 J+vH3pmg40A8VinM3s9iFrdf/0eFGGMI8lKw9cxZdiXAuiZcvpIubSnZToujz0Mvj8
	 r9nq5xvQc8vzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: Add device tree for IQ10 RRD
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709132013.4096850-8-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-8-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:30:39 +0000
Message-Id: <20260709143040.8441D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] UFS reset GPIO pin index out of bounds for `gpio-ranges` in base de=
vicetree.
--

--- Patch [7]: [PATCH v5 7/7] arm64: dts: qcom: Add device tree for IQ10 RR=
D board ---
commit ba7031927b18197ba50b6046132b0fba1999d651
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for IQ10 RRD board

This patch adds the initial device tree for the Qualcomm IQ10 RRD board, bu=
ilt
on the Nord Embedded variant. It enables the debug UART, UFS storage, PMICs,
I2C, and SPI.

> diff --git a/arch/arm64/boot/dts/qcom/iq10-rrd.dts b/arch/arm64/boot/dts/=
qcom/iq10-rrd.dts
> new file mode 100644
> index 0000000000000..39d254b49c147
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
[ ... ]
> +&ufs_mem_hc {
> +	reset-gpios =3D <&tlmm 181 GPIO_ACTIVE_LOW>;

[Severity: Low]
Does this requested GPIO exceed the mapped gpio-ranges?

Looking at nord.dtsi, the gpio-ranges count is 181, which only covers
indices 0 through 180:

arch/arm64/boot/dts/qcom/nord.dtsi:tlmm {
        ...
        gpio-ranges =3D <&tlmm 0 0 181>;
        ...
}

Since the UFS reset pin is at index 181, requesting it falls outside the
pinctrl mapping. While this avoids a probe failure because the global GPIO
range overlaps and bypasses pinmux allocation, any attempt to apply pin
configuration (such as gpiod_set_config()) to the UFS reset pin will fail
because the pinctrl core will not be able to resolve the pin.

Should the gpio-ranges count in the base devicetree be updated to 182 to
accurately describe the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709132013.4096=
850-1-shengchao.guo@oss.qualcomm.com?part=3D7
