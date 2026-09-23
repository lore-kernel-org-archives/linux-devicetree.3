Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66E6517BA1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166330; cv=none; b=IKZjqpLw6HTiO9t6/y/v8ZAPX/T6WfmXHnBh/qU/JMfpUSOQYoqRmxr/QaygKfFr0dY9YnmZ3dzeHCZCxu3AmCWQyZ/ECqPkdSyl/rGe+vojJufByFhqE3ExIiuCHQvUSma8jvZR1Hc3wHTWF317Sz3wl6kF6x8HKEWOp2Iruh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166330; c=relaxed/simple;
	bh=Wg3k+mTG/WEBX6+940udFIwkGO4cM3lAiyr9Wfd5O0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R5uVkLz5K0td5L58Ul1Fp01EtdzSCTQS2RhP4ZdCTbbRxep0By6GCkxzcBBf2BeZTki17mflaL4o/3o/tukhtoCQ4Vm547rVkLU7axP9faGaC8bx2cEAboeXQttu2hRv6Sho4LYg8DX3f4IQ78BKu39TGv7FPFf9QYrxtZ9tpbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOJbLC8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOJbLC8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E199E1F000FF;
	Wed, 23 Sep 2026 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166327;
	bh=WJ0I6zVIX4A7I2KuZGZAFJkBhU4yHVLH0HTKOMyiYWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOJbLC8IfE7ZVmM1omSuD2qnCH1TP8V2L7tUQzcWtmSidJAoMHVTlIYxBhFNhlwYR
	 jUHBCqi8I0hbjDpT66MfxxmHZKih/lVqkrf4zAZjGHWde+PrlkFoMbqS/cOjey7+Bh
	 zT6zD8gKnae+ceeT/WKAEhiNIbOt5kWcyE0YZBuRzbMukEfBoSDl7OJBB9K43L1Nr1
	 FFR2PA1rP4zMtXLPl2szfQLIAjiWOFT6+Q7Z5kcGhF5FJd7mUTelMBN5zQvb6HDn0y
	 D3Ss1fxDSb/b3Fi96ndhoB0oNPiwUSWhjaKVFotSqqDIQAJEHIP9tsUlcwAWY/x/nO
	 5PRJ9amjHE/5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 16/16] wifi: ath11k: add QCN6122 device support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-16-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-16-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:25:26 +0000
Message-Id: <20260923122526.E199E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: hardcoded index used to parse interrupts-extended property
--

commit a671c63204dc1d7f92a92604acce5ee3fdc7bce5
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: add QCN6122 device support

This commit adds support for the QCN6122 2x2 11AX PCIe chipset which is
enumerated by the WPSS Q6 processor. It introduces Q6 firmware segments
and device information configuration, including fetching details over QMI.

> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless=
/ath/ath11k/ahb.c
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
[ ... ]
> @@ -1395,6 +1398,10 @@ static int ath11k_ahb_setup_msi_resources(struct a=
th11k_base *ab)
>  	ab->pci.msi.addr_hi =3D upper_32_bits(msi_addr_iova);
> =20
>  	ret =3D of_property_read_u32_index(ab->dev->of_node, "interrupts", 1, &=
int_prop);
> +	if (ret =3D=3D -EINVAL)
> +		ret =3D of_property_read_u32_index(ab->dev->of_node,
> +						 "interrupts-extended", 2,
> +						 &int_prop);

[Severity: Low]
Does this logic safely handle device trees where the interrupt controller
does not use exactly 3 interrupt cells?

Looking at ath11k_ahb_setup_msi_resources(), this bypasses standard Open
Firmware interrupt parsing by hardcoding index 2 for the interrupts-extended
property.

If the device tree uses an interrupt controller with #interrupt-cells
other than 3 (for instance, 2 or 4 cells), won't reading index 2 fetch eith=
er
the interrupt flags or part of the next specifier instead of the correct
hardware interrupt number used for MSI configuration?

Could the driver extract the hardware irq more robustly here, perhaps by us=
ing
irq_get_irq_data(platform_get_irq(pdev, 0))->hwirq instead of raw property
parsing?

>  	if (ret)
>  		return ret;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D16
