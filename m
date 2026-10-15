Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348A92F84F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032511; cv=none; b=EifMFSpwYvI/IcqvY9lEMoHWE5eQ0PFCwvTUGWtPYMPlf2rKAlSbBpdKHd3rc/m2XnJNmhsQv0MUHfS9IPTi8nPD2YO3GBAijb2Uv7QBolP2IxvRXSp8BXsP18FJMjrTf1ebHkQaDR9S5nmmvlKZW2HQVNBhZxvGlNltBSuWpk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032511; c=relaxed/simple;
	bh=Oqmwbv3lEwLxiT/lsPDyCEnpAxvvN9ZyCrGbc0wFAg8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=emAmcM4k3E0spb/Dqb3dqRZ0V4tT3jR7BMNFMmtvySI1/bEl8zgOaF6hJzyMnDeBrH1RryN8A8O2XJ58hoYjPpM3LC/MovLoqk0ZNwFWELP4D13QcP7KwFpYZe76gxOWofOHfP7O9JzVV5SIWWc3eLcRb3LNceb0LapwCO/OxGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Py2UyM3O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Py2UyM3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7115F1F000C4;
	Thu, 15 Oct 2026 02:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792032509;
	bh=l8PY5/E+nRUoDzElbwahQu2/PSoD4PHfpe/hOVLk0Ts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Py2UyM3OLp4RLtcqjFFhRUCjR2KqfBtZRnYa7X5S/jKpo0lxXtnbFbQvAy8iPcv65
	 9NUaE36rMl+/w9lHGb5mz3q7tL7NZYkjUPMQ+QpyaaNpdIPpExT84X23wlPUqeDlbM
	 DIlwZCZeYBhuf/rgVvd3yTEoXIP3maEoHRuo8m5sO9m1rwjbp091HKFeeptRHNfjO6
	 4VDlgc54hp4jWuLqPTs5PSy9puB/HlPz1yJi9BuYemiEmvDW5nWYrM/GYr1gTsfJWQ
	 Mbq+gM8rgi7wIDMZ5a9ebXViCdfikQNIrc6pljwZoZcvTiWUI65U8XVmFa6y0nHKse
	 wLnMN+1aYdJRg==
Message-ID: <sashiko-outbox-172176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 02:48:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: qcom: missing status =3D "okay" for pcie0_ep and pcie1_ep
- [Medium] dts: qcom: incorrect polarity for PCIe EP wake-gpios
--

commit 3fa46fe28ef2e9d52dd0b40b57be7d7192538595
Author: Nikunj Kela <quic_nkela@quicinc.com>

arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

Add initial device tree support for the Lemans SA8255P Ride board. Enable
UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
zones for PMM8654AU sensors, and SCMI protocol nodes.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm6=
4/boot/dts/qcom/lemans-sa8255p-ride.dts
> new file mode 100644
> index 0000000000000..4273f47c3dffc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

[ ... ]

> +&pcie0_ep {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> +		    &pcie0_ep_wake_default>;
> +	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Since the commit message states this patch enables the PCIe EP interfaces,
should pcie0_ep include a status =3D "okay"; property?

Without explicitly overriding the status, the node will likely remain
disabled as typically defined in the base device tree, preventing the kernel
from probing the controller.

> +	wake-gpios =3D <&tlmm 0 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Is the polarity for the wake-gpios correct here?

The PCIe WAKE# signal is architecturally active-low and open-drain. By
configuring it as GPIO_ACTIVE_HIGH, the physical pad will be driven low
when the driver intends to initialize or deassert it, and high when
asserting it.

Could this invert the wake signal and break PCIe endpoint power management
wakeups?

> +};
> +
> +&pcie1_ep {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
> +		    &pcie1_ep_wake_default>;
> +	reset-gpios =3D <&tlmm 4 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Similarly, should pcie1_ep also include a status =3D "okay"; property to
ensure it is enabled?

> +	wake-gpios =3D <&tlmm 5 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does this wake-gpios configuration also suffer from the same active-low
signal inversion issue as pcie0_ep?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015023711.7218=
37-1-shengchao.guo@oss.qualcomm.com?part=3D7
