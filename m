Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA42F9985
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176050; cv=none; b=b6v8t5SPWVW4+VAGuNBo/yMJordEMmGF5NtzqZ/Ps30lv0qVoZdhEhScDI1P6cGzrLltQ6IrqzsfsdGDQgTG7VHUOiELbkXXmi1jctYZw7P35xvHYHlKURQewm0l4qrCMTCDiWLXYFEAUVzSGaKebEs5bS/Jiskv0OvYxXAgnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176050; c=relaxed/simple;
	bh=5VNNNqw0/Q+qcL8GFWplL22mvozurBq0Pwimb4UJN10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ibBkee0TFd1gyYV+dW9SZAZnQPCB0SgNgMsT6blx/lJpNKOW5h2OfANcEczGC8UhcEQaz8vGRGxyL0lQC0Nw+eSx/zIIowxxHQQ475njxCFJXHU8QH+qDO7lDDok8pVDP1qxG+tzkC0cBr1Oe1W3n234ueJRySLUO4JLU68kgtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTGnKsUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTGnKsUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EC8C2BCB3;
	Tue, 19 May 2026 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176049;
	bh=5VNNNqw0/Q+qcL8GFWplL22mvozurBq0Pwimb4UJN10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KTGnKsUXRs5O1xFpN1sYbVWWKYqZn2jX4f6OMsp818Baq7KenJfBWPIrDXPAxk4xo
	 CgDPB4qWWshCnX0VacEBMthTGv9mZoEWP+gws9SSzpU6aiP7uWfJ/YfqAjLUjD7fcA
	 Gg2Oz/zDhmce8tag0TubbP5A4uzd6BPPPZd4qy5o8Wva39rNhgyPu3Ms6hcTQqitZC
	 dN4oh4muUohgDzkgnhZ8M1KeYKJF6OSKzbIfQU6qruipCH//vYZmNntMzwC0QoGCQX
	 d3yzYgecPy97nFNFJB1CHyYj65zce1J2Buu+OTd/P0mvzLFYX6NWzJP470uT2iELxh
	 CGY1JTjcQvwuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518072856.22790-15-sumit.garg@kernel.org>
References: <20260518072856.22790-15-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:34:08 +0000
Message-Id: <20260519073409.91EC8C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The transition from `QCOM_SCM` to the generic `QCOM_PAS` framework=
 introduces an asynchronous probing bug where `ath12k` fails to check if th=
e PAS backend is available, causing permanent probe failures.
--

commit 9d619dc2a0265a4c4b222e1e790293c324c3c591
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

wifi: ath12k: Switch to generic PAS TZ APIs

This commit switches the ath12k client driver over to the generic PAS TZ
APIs. This abstracts the TZ implementation, allowing the driver to support
multiple backends such as the QTEE based SCM PAS service or OP-TEE based
PAS service.

> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless=
/ath/ath12k/ahb.c
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c

[ ... ]

> @@ -420,7 +420,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
> =20
>  	if (ab_ahb->scm_auth_enabled) {
>  		/* Authenticate FW image using peripheral ID */
> -		ret =3D qcom_scm_pas_auth_and_reset(pasid);
> +		ret =3D qcom_pas_auth_and_reset(pasid);
>  		if (ret) {
>  			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
>  			goto err_fw2;

Does this change introduce an asynchronous probing failure?

Since the generic QCOM_PAS layer allows its backends (like QCOM_SCM or
QCOM_PAS_TEE) to be built as loadable modules, the ath12k_ahb driver might
probe before the backend has registered its operations.

If that happens, qcom_pas_auth_and_reset() returns -ENODEV:

drivers/firmware/qcom/qcom_pas.c:qcom_pas_auth_and_reset() {
	if (!ops_ptr)
		return -ENODEV;

	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
}

Because this returns -ENODEV instead of -EPROBE_DEFER, the ath12k_ahb driver
will treat this as a fatal hardware initialization error. The kernel driver
core will not retry the probe, resulting in a permanent failure.

Should the driver be updated to check if the PAS backend is available and
explicitly return -EPROBE_DEFER if it is not yet registered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D14
