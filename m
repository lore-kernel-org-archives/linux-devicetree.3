Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35C41C30F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902078; cv=none; b=k76aTCbF4lZZjt6Vrv0y1ochNjcuxp0XKg//PWYlwBoEBcshACYmA+5ebClvYny9HqgxQOoU+17Q8VYzrZpXUnBX0HGNDtt2wPF21vPN3mv+yjNWe3yS4Csqkb2g6v0ZzAucVpk6f2tiPCMoFpVoL35AS+d7KDKqRsr47qgNdd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902078; c=relaxed/simple;
	bh=E/Lw3/RGFRUowWGKn7vX9gCqeA/OVlV1rfopMtT2b5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gmb/cBQFfM+N2qrJmonAC8uUbI2pbb1gqaK1cxF8rNKUG7o6J1uJuYTKzo9HYt/B5krtuHcb5YmV1IW8M18vKIpe8DBiN+fZx682OJaK5jrBJa80AKBG83ri6CQZN4BekhJjhqfsSSMkAdXxRNsGZ0doi90PWLQ4FywR/rdO3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TityVFcL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TityVFcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DEA1F000E9;
	Wed,  1 Jul 2026 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782902076;
	bh=G1HElyZMlRrXu4lillDwYs4lxto9EUTOx3NP/Jc1GjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TityVFcLdC7E/YRGHJbzTzjDMRf5FWVV5q1iDJ461yk+KjCpFwrAG0YTxcW9A10HT
	 xKffyH9gdWgU+r4VdLC6C/IqOYPCk1hHJ8UCrp3Ke/qUmSr0MOYJM95+qIIMRq0Qo9
	 lepXA/iQU/PclZAicu/LGq5GdgiVRavVN9Ge4ZCT899eiAomNw4YCD5Ml9pohv+crn
	 mLVWYtCoY3rUoaywPlbudD/qjXs3JFyifv6ll7F3tjQKqkVjxyOEoCtN1HEOq7+Mt8
	 lKzsbqoLb+901EjUYGgjl5rb4VYrhOA9ByuDHYpK2jnG4WIaj+vOakm7tMbCGFk0iP
	 KwPfL7I1TYFEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rakesh Kota" <rakesh.kota@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 10:34:35 +0000
Message-Id: <20260701103435.D6DEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The macro `PM4125_VBOOST_CFG` is defined twice with conflicting va=
lues (`0x52` and `0x56`), causing the voltage selector to write to the wron=
g register and corrupt the OTG configuration.
--

commit 3778477cc88a05791ed34dc272e50cbdb4893643
Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg

The PM4125 PMIC uses a different register layout for USB VBUS control
compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
a current-limit selector. Introduce per-compatible regulator descriptor
data to accommodate these differences.

> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regula=
tor/qcom_usb_vbus-regulator.c
> index cd94ed67621fe..40e7e5589d5b4 100644
> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> @@ -20,10 +20,35 @@
>  #define OTG_CFG				0x53
>  #define OTG_EN_SRC_CFG			BIT(1)
> =20
> +#define PM4125_VBOOST_EN		0x50
> +#define PM4125_VBOOST_CFG		0x52
> +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> +#define PM4125_VBOOST_CFG		0x56

[Severity: High]
Will this redefine PM4125_VBOOST_CFG to 0x56 and silently override the
intended 0x52 offset?

When pm4125_data.vsel_reg is assigned PM4125_VBOOST_CFG, it appears the
regulator core will write to 0x56 instead of the 0x52 VBOOST selector
register.

Should the 0x56 definition be named PM4125_OTG_CFG instead?

> +#define PM4125_OTG_EN_SRC_CFG		BIT(0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-add_pm4125=
-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com?part=3D2
