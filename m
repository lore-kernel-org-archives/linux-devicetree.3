Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C707A331200
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166517; cv=none; b=MKKsDrz0LvK1IH2z5vxbJF+1pMZV/ElLTnZeYZV4nQfxBczgdkz9XUvLwNvA1RsiV0Z4G3Mzlrn6GMyuG75p6ZNOkZpRWVCBF7kiB92TDEG0nt1adjcdGL3b+t8bChs/KS6+i+Yd+9OrBHDObzbgmdxW88V14gj1+cHYAnh8T0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166517; c=relaxed/simple;
	bh=LS24cGQ9R2yH84EBdCv3BtkUBb1kgx4nPbefijs7WE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iUXHSirk3b1CPiYXNH4/yE8UL8uZJp9DCJM9by11qpVQTRUZ/5zpkmtJeA1UljDx3G/qwxvaXIqJ8k8/JhTbE3GDFdtV3nvHvJtBYGtnlzEgiWjwBomDyIJDEMhjIz47XDGcAozlXzM1d7SiSSscXuOr7eh92KwgbnGYJkanrBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irHw/xKq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irHw/xKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C651F000FF;
	Wed, 23 Sep 2026 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166514;
	bh=NLO75+JdUj/wOvE+TF1sbsKjj4H0Y/tOjBOnlp1Uuoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=irHw/xKqW+PF2zuB5dG0h3qoOtg53V3aP+Rvta7YEa0RXLsJkOEfbnNkxzSjAlpEB
	 7qeU1GFWt4CKXtEUFHXyQO1aB10eJQDRMF3BqaQpANXSyusVqdYTLpOas5cK1hZkR+
	 qX9RvIwvg6BxA9YNLipXKSeHZv+GXcbhTRX2jDlBig6IuJVzCc0U+XdJPid1Otndp+
	 K+RMe69yx5K947c2wgX03P2KXBwrRfsVdy0J5TxchdOBrpBeaFZAOXEekGBe0BotMl
	 zCV8kbO+hAVulqM0MFSFGU+bJEqN++np/0BKxQyitRpA4VN2l4BA1RcTUq4e2ug5M6
	 3dZFhQ1o5ZaZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 15/16] wifi: ath11k: define userPDs for QCN6122
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-15-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-15-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:28:33 +0000
Message-Id: <20260923122834.32C651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ath11k: invalid QCN6122 userpd_id silent failure during probe
--

commit 4463bfc0a33ebb5b811e53822f3dfc8436afe153
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: define userPDs for QCN6122

The IPQ5018 platform can come with one or two optional QCN6122 wifi cards.
To differentiate the two, the user PD instance number is added to the QMI
service instance ID. This lets the firmware know which radio instance to
use and on what PCIe rail it is on.

> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless=
/ath/ath11k/ahb.c
> index 03936f574c8d4..26110c9275776 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -969,6 +969,14 @@ static int ath11k_ahb_init_userpd(struct ath11k_base=
 *ab, int userpd_id)
> =20
>  		ab_ahb->userpd_id =3D userpd_id;
>  		break;
> +	case ATH11K_HW_QCN6122_HW10:
> +		if (userpd_id !=3D ATH11K_AHB_USERPD_ID_2 &&
> +		    userpd_id !=3D ATH11K_AHB_USERPD_ID_3)
> +			return -EINVAL;

[Severity: Medium]
This correctly returns an error for invalid IDs, but it uses -EINVAL, which
overlaps with the error code returned for missing properties.

In ath11k_ahb_configure_rproc(), the -EINVAL returned by this function
(via ath11k_ahb_config_userpd_irq()) is explicitly masked:

ath11k_ahb_configure_rproc() {
...
	ret =3D ath11k_ahb_config_userpd_irq(ab);
	if (ret && ret !=3D -EINVAL && ret !=3D -ENXIO)
		return dev_err_probe(&ab->pdev->dev, ret,
				     "failed to configure userpd interrupts\n");

	return 0;
...
}

Does this cause a misconfigured Device Tree specifying an invalid userpd_id
for QCN6122 to silently fail and report a successful probe, while leaving t=
he
device uninitialized?

> +
> +		ab_ahb->userpd_id =3D userpd_id;
> +		ab->qmi.service_ins_id +=3D (ab_ahb->userpd_id - 1);
> +		break;
>  	default:
>  		return -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D15
