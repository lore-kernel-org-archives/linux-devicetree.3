Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37EF34C981
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066491; cv=none; b=K9EDkw0o/0aW5cXaggLVfDd3aKk60Stoi12x4YEZKxfWZqARUtAsKHnPD7NMETkDB5nJNjlZD8PbNOdh1HMVjvvf3VX9QOGzbkzfWuP2t4/DR3pKUK1zbyJ8GWDfEPgg9V+YjORvgumafMzA/aze8IJNNvkt4Sp/RAYsNtsx7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066491; c=relaxed/simple;
	bh=VihoYmau5FOm4Xcn+aQdOhoZ+4NKFDnOWEC1F5dUqc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jMyUDrXfn/mf29Xs5ClH93NNWPG8/Yo1LNToFnd2DSRi7FLl0MrAClGwl9ZR2gVzA2L4y3mUx9XZMeqHUXqSkko6DntHC81ZRpLXDTgF2byaojHY1L4pdMIgI5BbH+2fcXtlD9KtFnfGh8lM9pTtjPJGud5NefjWUJW7h4Wi0Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmO3ghy1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmO3ghy1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A34C1F00893;
	Fri, 29 May 2026 14:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066490;
	bh=m2vuIeZmb8QyJU2yWsoDSHwEa3CSsieEQzs21mEScEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmO3ghy1sVu14LkxC0Xcm3OvPbkmGJ3A0+cR6F38pbPVfTl0MK+6bHgl7s8HT7aqr
	 zHG81zfzMTdxi03wy+vjEDIYSnFtC8h5Tnj2OXiqRChfZcCG1kWURn9qZGH6QRjlXg
	 hXdDESMgTPRvBZ6AjGq69Rs5GajwnlzJTTHdCGdwAxEb+FhCvuAe5Qd1ijKAsI8mDv
	 +bkrwjT5sbj30v/iM1twgt+taC/v3Vd5GlUdPXw1h6H8nWFxzL4witnMXoidKxVZth
	 bYYNiB7mVgNFrb07g+8sC+8p9Xpy3+nK+J5HOJATMzD/B4dp37RNe7OX/+JoBifmsm
	 8lIvrv3UMRfHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8750: add reboot-mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anurag Pateriya" <anurag.pateriya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-1-1964ebf1924c@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-1-1964ebf1924c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:54:49 +0000
Message-Id: <20260529145450.5A34C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The reboot mode properties define multiple 32-bit values which w=
ill be truncated if using the generic reboot-mode framework.
- [Low] Adding a `reboot-mode` child node to the `psci` node violates the P=
SCI device tree binding schema.
- [Low] The newly added `reboot-mode` node lacks a `compatible` property, p=
reventing platform drivers from probing it.
- [Low] The commit adds device tree nodes for a `psci-reboot-mode` driver t=
hat does not exist in the kernel tree.
--

commit 29b2e890de1b3d908134e3a9d75f1f250b9a8f44
Author: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

arm64: dts: qcom: sm8750: add reboot-mode support

This commit adds PSCI SYSTEM_RESET2 reboot-modes for sm8750-mtp and
sm8750-qrd. It defines bootloader and edl modes for use by the
psci-reboot-mode driver.

> Add PSCI SYSTEM_RESET2 reboot-modes for sm8750-mtp and sm8750-qrd for
> use by the psci-reboot-mode driver.

[Severity: Low]
Is the psci-reboot-mode driver available in the kernel tree? It does not
appear to exist in the current tree or in this patch series, which leaves
these device tree nodes as unused code.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sm8750-mtp.dts
> index 3837f6785320d..af4b548d39e91 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
[ ... ]
> @@ -1426,3 +1426,10 @@ &usb_hsphy {
> =20
>  	status =3D "okay";
>  };
> +
> +&psci {
> +	reboot-mode {

[Severity: Low]
Does this new child node violate the PSCI device tree binding schema? The
Documentation/devicetree/bindings/arm/psci.yaml schema specifies
additionalProperties: false at the top level and does not define a
reboot-mode child node, which might cause schema validation to fail with an
additional properties error.

[Severity: Low]
How will the system bind a driver to this node without a compatible
property? Without it, the platform bus will not instantiate a device for
the child node, preventing drivers from probing it natively.

> +		mode-bootloader =3D <0x80010001 0x2>;
> +		mode-edl =3D <0x80000000 0x1>;

[Severity: Medium]
Are the second 32-bit cells in these properties going to be ignored? If the
driver hooks into the generic reboot-mode framework in
drivers/power/reset/reboot-mode.c, the framework reads properties prefixed
with mode- using of_property_read_u32().

This function reads strictly the first 32-bit value into the magic field,
so the second parameter might be silently truncated and lost.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-psci_sys_r=
eset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com?part=3D1
