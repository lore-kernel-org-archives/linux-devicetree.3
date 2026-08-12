Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DA536DA15
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 22:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572907; cv=none; b=a0Rxy8bqBjprwL1gNnI+5xuMDudskkk0tp4YkxokUTL+8Q/mAugeepp4/9Il7sThULeF6uXJNs90Un69MiOGPQWRXrXehCdoO6ILYKAWPbowToj9OYlNSUph4Qko/qVbr3+k3TTy1RP5AC6ox+x4vivDI7V5sZwbrkJoH3wf3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572907; c=relaxed/simple;
	bh=YDyfijvbwkh+/pE9okvN/f11bMGGIz9SM6OfF4gFlkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bvF2RNl8QrX5f7MBc5F4/S/Dg5dWEhmBuTVuBR4qe+lkV8PYiqI2ocNUXjagPA4J49/ALDtMGd1UrNyiwGl6k0UzSIaz1h7+RvWTS+JQjPhvYGLm87a2DRp5JcxXSpeXlGcByjRFoDeYDtJjA+71osptnExmnwB+edcwf/YuIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jam9Kyy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jam9Kyy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAF61F00A3D;
	Wed, 12 Aug 2026 22:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786572903;
	bh=04P+rpdPNtSyL+x0EvQ3ObQICvkcfOUjIXmSRli588Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jam9Kyy01HWsTgWExh/o5imOVudOORO7O5foZ8K7/wy6XhppwJVjVm901AR3ENABd
	 sAN1KbfT94EXZcH/zf7slZxGn3RR6DSWv6lA2CKom9972OMZkSX2vxhn3Dkz5t6D5a
	 zgUItbFHhBb1ij2zqc5LjS2NtPWh7VeiLoDTzoT2hWSqLuGvRkUeVwBCWQ1/co/5qm
	 FZN2c4lc7+Qgzd0RfsYkIR2D1dVEnG05sa/7V3bT0IRwXpuKjx9puDZEa8NfBaLZmG
	 r8GVkmY8y0Z+wi2qEqJtQycAnc/xiYD+ePH5eRZDkCvtWMpvGaFmGqv9S01MH8p5v1
	 wwYomkid8SRRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] nfc: s3fwrn5: support the S3NRN4V variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net>
 <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 22:15:03 +0000
Message-Id: <20260812221503.9AAF61F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing error check on nci_prop_cmd() for GET_VER causes command-r=
esponse desynchronization on timeouts.
- [High] Hardware error statuses are ignored because the driver checks for =
negative return values instead of non-zero.
--

--- Patch [5]: [PATCH v5 5/6] nfc: s3fwrn5: support the S3NRN4V variant ---
commit fe1c1a464a09b355d0a14c76e391f1834e4afedf
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

nfc: s3fwrn5: support the S3NRN4V variant

Adds support for the Samsung S3NRN4V NFC controller, which requires a new
calibration data bring-up sequence and different clock speed configuration.

> diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
> --- a/drivers/nfc/s3fwrn5/nci.c
> +++ b/drivers/nfc/s3fwrn5/nci.c

[ ... ]

> +int s3fwrn5_nci_rf_configure_dual(struct s3fwrn5_info *info,
> +				  const char *hw_name, const char *sw_name)
> +{

[ ... ]

> +	/*
> +	 * Ask the chip for its current calibration versions and skip the
> +	 * upload when both already match the blobs; a mismatch or an
> +	 * unparseable answer means the upload proceeds. GET_VER answers with
> +	 * versions, not a status byte, so nci_prop_cmd()'s return carries no
> +	 * meaning here.
> +	 */
> +	sub_oid =3D NCI_PROP_DUAL_SUB_GET_VER;
> +	info->dual_rsp_len =3D 0;
> +	nci_prop_cmd(info->ndev, NCI_PROP_DUAL_OPTION, 1, &sub_oid);
> +	if (s3fwrn5_nci_dual_cal_current(info, hw_fw, sw_fw)) {

[Severity: High]
Is it safe to completely ignore the return value of nci_prop_cmd() here?

If the hardware is slow to respond to the initial GET_VER command,
nci_prop_cmd() will return -ETIMEDOUT. Continuing directly to START_UPDATE
without checking for this timeout might cause command-response
desynchronization.

A late response to the timed-out GET_VER command could arrive while waiting
for the START_UPDATE response, which might silently corrupt the sequence
since all DUAL_OPTION sub-commands share the same NCI opcode.

> +		dev_dbg(dev, "calibration data already current\n");
> +		ret =3D 0;
> +		goto out_sw;
> +	}
> +
> +	merged =3D kvmalloc(merged_size, GFP_KERNEL);
> +	if (!merged) {

[ ... ]

> +	/* SET_OPTION per section */
> +	set_option.sub_oid =3D NCI_PROP_DUAL_SUB_SET_OPTION;
> +	set_option.index =3D 0;
> +	for (i =3D 0; i < merged_size; i +=3D NCI_PROP_DUAL_SECTION_SIZE) {
> +		len =3D min_t(size_t, merged_size - i, NCI_PROP_DUAL_SECTION_SIZE);
> +		memcpy(set_option.data, merged + i, len);
> +		ret =3D nci_prop_cmd(info->ndev, NCI_PROP_DUAL_OPTION,
> +				   len + 2, (__u8 *)&set_option);
> +		if (ret < 0) {

[Severity: High]
Does this check miss positive hardware error statuses?

When the chip rejects a command, it returns a positive NCI status byte
(like NCI_STATUS_REJECTED, 0x09). The driver's RX handler passes this status
to nci_req_complete(), which sets req_result. nci_prop_cmd() then returns
this positive integer.

Checking only for ret < 0 might cause the driver to ignore hardware
rejections and erroneously consider the upload chunks successful. Should th=
is
check for ret !=3D 0 instead?

> +			dev_err(dev, "calibration data update error: %d\n",
> +				ret);
> +			/* Abort form: STOP_UPDATE with the sub-OID alone. */
> +			sub_oid =3D NCI_PROP_DUAL_SUB_STOP_UPDATE;
> +			nci_prop_cmd(info->ndev, NCI_PROP_DUAL_OPTION, 1,
> +				     &sub_oid);
> +			goto out;
> +		}
> +		set_option.index++;
> +	}
> +
> +	/* STOP_UPDATE with checksum */
> +	stop_cmd[0] =3D NCI_PROP_DUAL_SUB_STOP_UPDATE;
> +	put_unaligned_le16(checksum, &stop_cmd[1]);
> +	ret =3D nci_prop_cmd(info->ndev, NCI_PROP_DUAL_OPTION, 3, stop_cmd);
> +	if (ret < 0) {

[Severity: High]
Similarly, would a positive error status from the hardware on STOP_UPDATE be
missed here due to the ret < 0 check?

> +		dev_err(dev, "Unable to stop calibration data update\n");
> +		goto out;
> +	}
> +
> +	dev_dbg(dev, "calibration data update: success\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811220135.4723=
80-1-jorijnvdgraaf@catcrafts.net?part=3D5
