Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37F3B9DBB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471680; cv=none; b=d1mHIQHud0WM1KJbyH9lH0LXU8hQSo89ju7oBKcsMirKSuRwl4g/rlkd8ksI++9qWpc/gjJC8iVI6ooZ7K31R9fIJZGWiIWYYs/qhrp0CGlf5918tAbIphLMXK216NSxbglVfUr1C6n3M9NCoQrXQvcAN6gHjMiOwSvYI3dYvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471680; c=relaxed/simple;
	bh=eBCNVRBlh/eJS/2vHC3TFbSdchgs4abcQBB1yCnagUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jNzjNeoeeTwxiOEfAGtR9buUuMh0mmkVa1lhqc5kVIsTRON1GUV1miSlfol9hXpLsfb4HwMdIeFio39UpfwWQsSWksNtXsC3NGESkM7LSMp5RKji1QadAneh6N94P64XC3vvd3w+nCqhsYJpOO4bHZETpIkBSINDlL6YHuDtqyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e27QyBex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e27QyBex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283391F00A3D;
	Thu,  3 Sep 2026 21:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471679;
	bh=y0chi/4d04VRFb+NbYZmUacDpjHM9myjRt58vGxwhw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e27QyBexGYFjM1/+QZGF2FnYfdw02fqMUOF9UfwLunZiok9YP1PqQ+OoXQtkkGaEz
	 rDWf/AzsoiSf7YGdh8Ngw6gwSszfJU0bIXNJUDBROR9iZPI4/EcLgONs1wMFVG26cy
	 BUo1cy0RYmiTSue8ZDOM47uXMhG760fakjcz1R8gojqB+2wbTHCq8Xo88q2+DpChRu
	 9xAzm/gX8LFlJb0PKxr4juqilpa3IBmZ35x2ZAca9Bw/I4zG3XMs/yq+2IFkBkWApB
	 5B6ExjElg2uPx1QBWFDmUNEEabLt9KR1IFySWCQjafNujAQ0dS9RzJxg7IQjd+LguH
	 Z4mlPCLDzA0Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 05/15] dpll: sit9531x: register DPLL devices
 and pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902214030.20955-6-arouhi@sitime.com>
References: <20260902214030.20955-1-arouhi@sitime.com>
 <20260902214030.20955-6-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:41:18 +0000
Message-Id: <20260903214119.283391F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Blind overwrite in priority table causes tracking mismatch and inp=
ut receiver power leak.
--

commit 53ae19cd79c8e3fbf98f8abaf885dd0d25a0d89d
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: register DPLL devices and pins

This commit registers the four on-chip PLLs as DPLL devices, mapping their=
=20
inputs, crystal, and outputs as pins based on the loaded configuration. It=
=20
introduces a kthread worker to poll hardware registers twice a second to=20
report lock status, mode, and pin directions to the subsystem.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +int sit9531x_input_prio_add(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			    u8 input_idx)
> +{
> +	u8 srcs[SIT9531X_PRIO_MAX_SLOTS];
> +	u8 slot;
> +	int rc;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	if (pll_idx >=3D SIT9531X_NUM_PLLS)
> +		return -EINVAL;
> +
> +	rc =3D sit9531x_prio_table_read(sitdev, pll_idx, srcs);
> +	if (rc)
> +		return rc;
> +
> +	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++)
> +		if (srcs[slot] =3D=3D input_idx)
> +			return 0;
> +
> +	srcs[SIT9531X_PRIO_MAX_SLOTS - 1] =3D input_idx;
> +
> +	return sit9531x_prio_table_commit(sitdev, pll_idx, srcs);
> +}

[Severity: High]
Does this unconditionally overwrite the last priority slot without clearing
the tracking state for the displaced source?

In sit9531x_input_prio_add(), if the priority table already contains unique
sources in every slot, assigning the new input_idx to the final slot
(srcs[SIT9531X_PRIO_MAX_SLOTS - 1]) silently ejects the previous source from
the hardware priority table.

Because the displaced source's corresponding ref->pll_mask is not updated in
software when this happens, can this cause the old source's input receiver
to remain powered on indefinitely? If its pll_mask bit remains artificially
set, it appears the DPLL core state will diverge from the hardware reality,
leading to a resource leak.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214030.2095=
5-1-arouhi@sitime.com?part=3D5
