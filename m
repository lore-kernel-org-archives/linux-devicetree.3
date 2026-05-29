Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C651A682A
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067359; cv=none; b=UON76EUL1amP+UYH9UEgpMzFz2r3LkPSuBJX0fIh9c0zp2I6D75TB25MpenlUTCrk+b+alGWVAaDqRHCZ7klAP/cxqqa8ntvc91qa6IdY3fYiudaLahSfxMsmfFJ6TwU26iv/Vb+MCXd1r9ANntPHhvW1tFb67epjSwxR5qUOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067359; c=relaxed/simple;
	bh=KEip4200pI/KZ3d0c3V5w9ifvnJz391zqZmTiWpePjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O7uxnScN7Vuhcok/OnevG4Li3+BwH/GiGHP7Xxg7kH/bx6GNB/BYgM3LurS6LhNuSp9MoAFfb3osiU6q3kn8Y3cBjJZFX/zYac7ygTFpNyjFbQipOpeb27cGtognsyO1I5cR/xeBNaaNrouqgKMBgC8vlIiqwM/4YUHP35b4tlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmZKIzYB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmZKIzYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F7E1F00893;
	Fri, 29 May 2026 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780067357;
	bh=x8VIY48I+PRhg+p1iSTHdcEozcq3yCiYTC7JfyF3Du4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UmZKIzYBdUtbsJP1oNCNf02fmAchzBX8+6v2Uq1d3/rsFll4fIxyFVYkxRi3bBN8+
	 LANpDzhOF22TJJljfIkCAgbUYKUY270TJmxc2VZkXbBfrNvxVZ0DD9V7Lkm1b9wzcp
	 Hwff7yqmiKU7YwIpty/X+Rt8jljYPeOy4mbmtZx0EMjo0HtFKmnnZ3CZJZW+iunXZQ
	 3DZ4vClO6AGTeZDyWsFVIy+7vFF/psS7PfOcf9Yw5J74yCN3BWehlWp4AwMY7D7YaT
	 NbMOJ5LxCv5vUJTwNifYhJaurFUDjED/X0j6qfK/nekH7r+aixWkvm3gT9elyNg7BQ
	 ItmX9GJnPVBOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] PENDING: arm64: dts: qcom: kaanapali: add
 reboot-mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anurag Pateriya" <anurag.pateriya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-2-7c32161cf50b@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-2-7c32161cf50b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 15:09:17 +0000
Message-Id: <20260529150917.82F7E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `reboot-mode` child nodes added under `&psci` lack a `compatib=
le` property, preventing driver probing, and they violate the existing PSCI=
 devicetree schema.
- [High] The two-cell reboot mode values provided in the device tree will b=
e silently truncated to a single 32-bit integer by the reboot-mode core fra=
mework.
--

commit e9bed285e77f6bca37ffc7e1d8b65ad73aaf1000
Author: Xin Liu <xin.liu@oss.qualcomm.com>

PENDING: arm64: dts: qcom: kaanapali: add reboot-mode support

This commit adds PSCI SYSTEM_RESET2 reboot-modes for kaanapali-mtp and
kaanapali-qrd for use by the psci-reboot-mode driver. It defines bootloader
and edl modes.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot=
/dts/qcom/kaanapali-mtp.dts
> index 07247dc98b701..0fac663f8773f 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts

[ ... ]

> @@ -1321,3 +1321,10 @@ &ufs_mem_phy {
> =20
>  	status =3D "okay";
>  };
> +
> +&psci {
> +	reboot-mode {

[Severity: High]
Does the lack of a compatible property prevent the reboot-mode driver from
probing? Because the parent PSCI core driver does not instantiate child
platform devices via of_platform_populate(), it appears the core framework
will not instantiate a platform device here.

Additionally, will this cause a dtbs_check validation failure since the
official PSCI bindings in Documentation/devicetree/bindings/arm/psci.yaml
define additionalProperties: false and do not allow a reboot-mode child
node?

> +		mode-bootloader =3D <0x80010001 0x2>;
> +		mode-edl =3D <0x80000000 0x1>;

[Severity: High]
Will these two-cell values be silently truncated by the reboot-mode core
framework?

The standard reboot-mode subsystem in drivers/power/reset/reboot-mode.c
reads magic values using of_property_read_u32(), which extracts only the
first 32-bit cell.

Furthermore, include/linux/reboot-mode.h defines the API callback as:
int (*write)(struct reboot_mode_driver *, unsigned int magic);

This strictly enforces a single 32-bit integer argument, meaning the
secondary cell will be dropped.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-psci_sys_r=
eset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com?part=3D2
