Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033942CB1F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213027; cv=none; b=Zdepl/Jgd9SO6BiUrGGO0r0ll90qvWAdG3aIsR4V7EuWH1aCGRgRybAv6wGj/8EVoY3xGRRK9aZ4cYgUJGBMagn/EzYmhycMFJNc4Uc/sDqwcV5XUgPEBTI8yYz55FPLkow4lZ6Z0b/Uj5cGw1urGHiVx5XB6ahprGgYu7z9/yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213027; c=relaxed/simple;
	bh=FUaU6Ghb1fZ7DoWwzNVmxysNr0y2TQXnjFM3aHPRs/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e5N9tkttscQ1JE+F7oEpOR8iMcRDy5Yq9PIlQ2Bu3iuenI4DCrPRNiFIpiOuNJHxSzK+42zBk4BAd28/TwyTp0tw7Hzg3UmRszdaJO8loGg4mMvhc0+H6ZkjQRic1uJrsnMureaddq8tLa3Iajzv12rTuGXyHeBUT4+63iFmu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCMBWEuH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCMBWEuH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C11B1F00A3A;
	Thu, 16 Jul 2026 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213022;
	bh=nVWSdO73QVL3YXvgl9GxqTiqawFsKXYVtXMIDOm0tlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCMBWEuHUuGbwSjURv8lSnaA1D9hDVL5fVojdNYbMsHfA5ZEYX8votOOWY8F/E79E
	 N758ccJoXutOSfDYhUQ2a4SzXvc8PXpjXd6Cpok4XP4EqFQINMBFVIXHdGBVDxtS6S
	 nqlyKC0L+/JKyS924H3xYjaA0UIbz9LfcKlxqzP7fBuTl9qT0rIyvExV1fRclCkb25
	 xRFhUVXIBaGk6KwQRwUsO9z+FmnoV41zseZrXzJeeEsAZHl6b9WHB8Bw4g1VZQlGl3
	 D2J1x38s0CIyP2LaiVkFuVbjZmozVSlWk82qWIfknAxLfxQBqzBqKCqQmJEoT8apuV
	 4C7vmrTCUsTHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:43:41 +0000
Message-Id: <20260716144342.3C11B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Invalid device tree `status` property value "enabled" prevents t=
he `&crypto` node from probing.
--

--- Patch [3]: [PATCH v6 3/6] arm64: dts: qcom: Add device tree for Nord Em=
bedded variant ---
commit bb92e843e0b413bc8193740b6bfb7dcde39b45b0
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord Embedded variant

This commit adds a new device tree file nord-embedded.dtsi for the Nord
Embedded variant. It extends the base nord.dtsi with specific platform
resources and peripheral wiring directly controlled by the OS.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 0000000000000..1ec32c2f2308a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi

[ ... ]

> +&crypto {
> +	interconnects =3D <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_AL=
WAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names =3D "memory";
> +
> +	status =3D "enabled";

[Severity: Medium]
Is this status value correct? The Linux OF core (__of_device_is_available)
strictly expects "okay" or "ok" for the status property to consider a device
available.

Using "enabled" here will cause the node to be treated as disabled, and the
crypto device will be ignored by the kernel. Should this be changed to
"okay"?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142605.2398=
433-1-shengchao.guo@oss.qualcomm.com?part=3D3
