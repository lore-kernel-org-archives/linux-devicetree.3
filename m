Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2552F298
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718200; cv=none; b=gDsZOiPwrZ/O02Vm1MqzIKSjKGpF//fnKcLCSszV/kg99r6UUqvy6AZge+5fycMF29C0p0TmoCSVpDi6d9e7tCAfDvqCcixhvIe96VizJfcGqrmrqlfDqEmOnNbS7XEDBN3qB1wkp2ozxoQknw0CNUeMmplFEnF8/+sWdZ3WnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718200; c=relaxed/simple;
	bh=tvxwBeB5bbOtVI9aJuLoQNFk0raMy8XVadp/DeCNAVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oK/Gq/64beVA5RFnkc4136DH6tqmbTTCYveZdywCPjEFR4bNIdgpibX5dnOw1crQV/rjaNOm4fknhAKdtsDC4KNVcOL7rhyo+F5HMkuPjyAuyai2Sk/1jppuscLwSA8f+uKIhkCwnePt+Q1uV8+ggkgeg88OXaeAstLXdFx7s7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiRtKR6J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiRtKR6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BDF1F000FF;
	Tue, 29 Sep 2026 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718185;
	bh=g/bwjr9t/0ehiqjo8B9Kvo8qVaaRbIXLKGt8Lu6g3DA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LiRtKR6JCGVhCCcx07Vm4z2kKCZq0aytY+W9nLDptfuMWaCFMjY1VCgRaQKmUotGx
	 ge6T6BsYCUTE4mRYI5YQ/D9Y25oXdi1LoIW5oeHK/9vxm96E1CUTgPDx14mGT8b8k/
	 UZiZL2LnvbI7bNx7r7J15czxpfSaPWnnI+BMb0AFzF9n3fWUR9WfqXCDucPPCU57wa
	 hCanv9QNmBW/wGUK3sQt8ecdS3BtD+CnsLhxuxoUL0+s9jdqr4msbnQ895ni8KZrkr
	 APnEHWafEIPYixc3GFJHu9e8iYR3IHVeQkqXO5j4Yff5bIzcf5uBC5TC/cM7h/tTs3
	 +yn45qzj9R30Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 21:43:04 +0000
Message-Id: <20260929214304.E1BDF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: qcom_eud: uninitialized software state blocks disabling EUD=
 on boot
--

commit 16556b4a5664eacf6eb75fc1fe5031d31c087dc0
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: improve enable_store API

This commit adds a state check in enable_store() to skip redundant hardware
operations when the EUD is already in the desired state. It also improves
error handling and logging when enabling or disabling the EUD.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 48e474bdf818c..e227d05cfecd4 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
> =20
> +	/* Skip operation if already in desired state */
> +	if (chip->enabled =3D=3D enable)
> +		return count;

[Severity: Medium]
Will this early exit prevent users from disabling the hardware if the
bootloader left the EUD enabled?

Since eud_probe() initializes chip->enabled to false (typically via
devm_kzalloc), it does not verify or synchronize the software state with
the actual hardware state by reading the hardware control registers (e.g.,
EUD_REG_CSR_EUD_EN).

If the bootloader leaves the EUD enabled, the hardware is active but
chip->enabled is false.

If a user then writes 0 to the sysfs attribute to explicitly disable the
EUD, this check evaluates to true (false =3D=3D false) and returns early.

This bypasses the disable_eud() hardware routine, preventing the hardware
from being disabled and potentially impacting power consumption or role
switching.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929213513.2401=
005-1-elson.serrao@oss.qualcomm.com?part=3D5
