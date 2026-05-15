Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C3D3E9F9A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843429; cv=none; b=JpowYjIPO8JIt734BBcvVUF1darIQ0rJBo4akjLAhHKpSbvAMaXJgU6lhoZwZRpzp3Fx79dk0JCdlYUTGhXBVkVqOeqokM2+VWUBehdnHXrt7SjtKhUR7Un/fu8lTSWhOe3FvbXquhL0EysacNK9xapl7cTWj23OYVacIxFe3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843429; c=relaxed/simple;
	bh=zwHpyNDMiFOuESlq3uqkBf5TSTnpH9nSMJ3NSXdXmJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aZhZC4A86RTV3MXGowQciMwV1bMn1uatrwnbEzNWnewn4z+fE201d/8hdTghNWJkKsPz+Ojf5MRRiyXfaferTUwvyeelWUMlDCrT+onqEllzyf3GlVpSehfbLp+qTj4UaB0YbYcB3lNSbc8/SjS+V9lOOXq1sCT1Do4RehzuPxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwfLVo84; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwfLVo84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD4FC2BCB0;
	Fri, 15 May 2026 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843428;
	bh=zwHpyNDMiFOuESlq3uqkBf5TSTnpH9nSMJ3NSXdXmJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jwfLVo84nPQXH3dZgQf5iPYNk4VBMqwBFuEZGom9q+yJ8xUeoZHBl2TSSKR6uvzR3
	 25hiK7/TGLYYdEEvV3Ui+Ruo6Wy39yvdhtmpBq0xHn0jjijayTa+s31pI+KYTrn5BS
	 q5VCqOZgIzKw5pGdUu+n0hboT3XtpusgyZVb3cW1YumdMJsmE8zUv3Vyc027q6Dlcw
	 7VCgrOKt4qQxMi9YqqGNW+xZ+wvfNElaukK4hbQF4ZmyYprnYhhmC3Cq43cc/pYA52
	 uW97VMl0AzGC1qE+9BXYjRo4Va4Zd+eF8j7wtcAlvfEKh0huCN9UYSS0btCo9QgYXN
	 YezUrIFqFNXKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/11] mfd: sec: set DMA coherent mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-5-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-5-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:10:27 +0000
Message-Id: <20260515111028.5FD4FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Setting the parent device's `dma_mask` pointer to its own `coher=
ent_dma_mask` introduces a shared-state data race across MFD sub-devices an=
d circumvents DMA API validation.
--

commit ed135db5f1241e8cf0252f12ff10c2221996d7ef
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

mfd: sec: set DMA coherent mask

This commit manually sets the coherent_dma_mask to 0 and assigns the
dma_mask pointer to it for the SEC PMIC device. This is done to silence
warnings about missing DMA masks on sub-devices since the device does not
use DMA.

> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index ad1c7de83a620..afc9e691bb67c 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -215,6 +215,9 @@ int sec_pmic_probe(struct device *dev, int device_typ=
e, unsigned int irq,
>  	if (IS_ERR(irq_data))
>  		return PTR_ERR(irq_data);
> =20
> +	dev->coherent_dma_mask =3D 0;
> +	dev->dma_mask =3D &dev->coherent_dma_mask;

Does setting the dma_mask pointer to the parent's coherent_dma_mask introdu=
ce
a data race?

The MFD core in mfd_add_device() copies the parent's dma_mask pointer to all
child platform devices. Because the parent's dma_mask now points to its own
dev->coherent_dma_mask field, all child devices will share the exact same
memory pointer.

During child probe, the platform bus calls of_dma_configure_id(), which
executes an unsynchronized read-modify-write on that shared pointer:

    *dev->dma_mask &=3D mask;

Because sec_pmic_probe() supports devices like the S2MPS11, whose regulator
driver uses PROBE_PREFER_ASYNCHRONOUS, child devices can probe concurrently.
Will these simultaneous read-modify-writes to the parent's coherent_dma_mask
cause KCSAN warnings about data races?

Additionally, does manually mutating bus-managed device properties to simul=
ate
a 0-bit DMA capability circumvent standard DMA API validation?

> +
>  	pm_runtime_set_active(sec_pmic->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D5
