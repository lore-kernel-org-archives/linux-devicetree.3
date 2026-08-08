Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD2E274FDF
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 02:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786155864; cv=none; b=D1JDfEnn7/HH6wOPJes4U/wmeqdo17g1ahgRq8kvcNxxFbZC8YqqRqBrLGTTF8fsTw6ghpz9qYa7bSE1y7+RPpgnB5m1A2oe5wtPOZR61iV1Ug65sGsR+FWqGUqbH2U47O7XeI8IzNMNkzlOwR6lNHiOhMx+32UKI7hE4yUM6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786155864; c=relaxed/simple;
	bh=Pbes4Jsi3s1vudrABK55amtOXu7gsmn17uYDpzJz2p8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UHzOWHOH4O+E1M5Sn3VcXcM4jjVPKyWOodUVMRI6VPvPwgdOg31Mvenhp4lJoCdRQoICXORYWdD2Mb1OYXIs20Nb6K2uQWdXdDIEeLhZ7LcaUbtsHb4NSrLL8Bsx3WFPtiZdxmYOyL1dS8dPkUSF5p2VFwUxwt8dPsB2OM/2EYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frWOhCwl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frWOhCwl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B401F00A3D;
	Sat,  8 Aug 2026 02:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786155862;
	bh=DEWvD/KJPoA5sxNRzBBBHJqdtxK5YR/KDPa0VZty7L8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frWOhCwlnCbd8Ag5SrWzhyyptgolhgAremRgviag8Ei+6BHPCaKgFjSj/OQEB5tKT
	 wzI5igi/AswteGgVrvcq4LF0HNkJEsCxXOrqjmbXVP+umxBQfuIgo73dB61h1dAq69
	 +x1eKG6J/LIo3XNZQOnFpk795MzqCLCn68QQ56NznIbmWCcURLkPqbe2xSX5fTlEMu
	 xGNxmNWBWRhML0NoC8E+2V65ujFFHZatLVj203yU8ir6YCk2rsxYP1DnwmZzyG2Uwj
	 i3vWJJ7zDePBEBbqZ4n0UwG/wLzJ0pWOP9WzIaBMEWVatZiTCPJOy9yO8IklMC+2Jx
	 LCWj51o6OTBxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] nfc: s3fwrn5: support the S3NRN4V variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807021001.239389-6-jorijnvdgraaf@catcrafts.net>
References: <20260807021001.239389-1-jorijnvdgraaf@catcrafts.net>
 <20260807021001.239389-6-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 02:24:21 +0000
Message-Id: <20260808022422.62B401F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unprotected data race and state machine desynchronization due to i=
gnored NCI command timeout.
--

--- Patch [5]: [PATCH v4 5/6] nfc: s3fwrn5: support the S3NRN4V variant ---
commit b57146ef7e5e76c557b5b6a3455b96f7592b3c94
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

nfc: s3fwrn5: support the S3NRN4V variant

This commit adds support for the S3NRN4V Samsung NFC controller variant.
It introduces a new initialization sequence and calibration data upload
path using the DUAL_OPTION proprietary command.

> diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
> index 5a9de11bbecea..f1877797d1365 100644
> --- a/drivers/nfc/s3fwrn5/nci.c
> +++ b/drivers/nfc/s3fwrn5/nci.c
[ ... ]
> @@ -117,3 +142,155 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *i=
nfo, const char *fw_name)
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
Could ignoring the return value of nci_prop_cmd() here cause a data race?

If the controller is slow or unresponsive, nci_prop_cmd() will return
-ETIMEDOUT. Because the error is ignored, the code immediately calls
s3fwrn5_nci_dual_cal_current() which reads info->dual_rsp_len and
info->dual_rsp.

Concurrently, if a late response arrives, the RX workqueue will execute
s3fwrn5_nci_dual_rsp():

s3fwrn5_nci_dual_rsp() {
	...
	info->dual_rsp_len =3D min_t(unsigned int, skb->len,
				   sizeof(info->dual_rsp));
	memcpy(info->dual_rsp, skb->data, info->dual_rsp_len);
	...
}

This locklessly overwrites the buffer while it is being read, potentially
leading to a torn read of the calibration version data.

Additionally, would a late response to this timed-out command erroneously
fulfill the subsequent START_UPDATE command, shifting the response stream by
one and breaking synchronization with the hardware?

> +		dev_dbg(dev, "calibration data already current\n");
> +		ret =3D 0;
> +		goto out;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807021001.2393=
89-1-jorijnvdgraaf@catcrafts.net?part=3D5
