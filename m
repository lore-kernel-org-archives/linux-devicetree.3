Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019D64772BE
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485421; cv=none; b=R//J9K0mHDA/61II2lXdc2p1TKgtjLAiko9vtxlaVIi8jgNxb1G8+XLbeb66jNuxFDzGUEOxFWgY7XIlO5Z8/rmWQ72Os4xrRRUb5m/yzsrFKi3k77asS9aRdxiygCc7VMzUoMeEI1SNcfiw4hwBnIy3RzClKsHuSHl4jDoQZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485421; c=relaxed/simple;
	bh=Jp8X/GG2uAWk/ctgnxxdJFIO92gfwmUXJDyAdJehW0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OVTBdvFCfp+s8xN2Q6hj+k6uunXiUeOQG+jjxgoA3DBeGR4d7WYZRkKgJW3Qsx5E0we47Ai4srte8VYhyydP2c04us/aHoAzpDypeTWqHNFb5PHmzdEZLUCoiOqZqLSTDyqh4n78Ic6z+RlPmbSC+o9ZQ9MBtic972M+gh4ZFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YC3QXN/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YC3QXN/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676F81F000E9;
	Tue, 11 Aug 2026 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485419;
	bh=NrEvAIC6qb3AGxisAKi4e8OSrP97h/UVlWebQaRspmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YC3QXN/7BuhIB/Jy7WBiVxJCrHpetXnXcjuvc4cu5daiR38zu4OWmHQFn8F2cIPl6
	 ZE9dGNOttGVQwii4URxhLz6qxPseWyeopZ99Jz8XoiLdpnitjM1NYWfDLoyjVNWboJ
	 ksVhas8+2aMtnVLV7XirxVfCM6j3ERLB5T/zNuWZBgWkYm38uhOXrx7nvSHOXWaihQ
	 M5kONdRXenMlEtB9W7yCCaMEYS7QZeiSY7bB7lONnveE99+NAc6fpkgI91A6Kc0klN
	 WSkNuRnDIx9vrlX4TbRBl2QXM4VLOoPtWjm4dWVZLh5Z1wM3icoUlhr4U7dbjNcRR0
	 b3Fkl/nlwyuUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260811213610.2956147-4-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 21:56:58 +0000
Message-Id: <20260811215659.676F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Lack of locking in sysfs handlers allows concurrent execution and =
TOCTOU races, leading to unbalanced PHY operations and driver state corrupt=
ion.
--

--- Patch [3]: [PATCH v6 3/9] usb: misc: qcom_eud: add per-path High-Speed =
PHY control ---
commit 0126e533bbae398f1f9f6831389bcefdb1ad1252
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path High-Speed PHY control

This patch restructures the EUD driver to implement per-path PHY management,
powering the appropriate PHY based on the selected UTMI path. This ensures
the PHY is explicitly initialized and powered when EUD is enabled.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 25a6a8f110ec8..03d1c200658c8 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -130,6 +192,10 @@ static ssize_t port_store(struct device *dev, struct=
 device_attribute *attr,
>  	if (port < 0)
>  		return port;
> =20
> +	/* Check if the corresponding path is available */
> +	if (!chip->paths[port])
> +		return -EOPNOTSUPP;
> +
>  	/* Port selection must be done before enabling EUD */
>  	if (chip->enabled)
>  		return -EBUSY;

[Severity: High]
Is there a lock missing here in port_store() to synchronize with enable_sto=
re()?

Looking at enable_store(), it uses guard(mutex)(&chip->state_lock) before
checking chip->enabled, but port_store() appears to check chip->enabled and
mutate chip->port_idx without holding this lock.

Could this allow a race where port_store() changes chip->port_idx while
enable_store() is midway through enablement?

For example, if port_store() executes right after enable_eud() initializes
the PHY in enable_store() but before chip->enabled is set to true:

Thread 1 in enable_store():
    guard(mutex)(&chip->state_lock);
    enable_eud(chip);

Thread 2 in port_store():
    if (chip->enabled)
        return -EBUSY;
    chip->port_idx =3D port;

Thread 1 in enable_store():
    chip->enabled =3D true;

Would this cause subsequent disablements to read the new port_idx in
eud_phy_disable(), leaving the original PHY powered on and attempting to
power off the new PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D3
