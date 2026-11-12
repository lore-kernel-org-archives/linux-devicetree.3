Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476661;
	b=jU/E7QJw7nDX1wv90b+lDwbsZQquzOucO/1ORSuBcHp3lK/HPz7+hBDBj6kWINQVSv4b
	 +eQTjqVZ6SkSO06rGMAKk/pNOiZGpmOaX1OkiCmeapYSXS+rLfph0PgOhiaNpMx/LJycI
	 FvG0QHVfau/TjICU9L3rEkjBT9FwapMCjdcY87pnid+AptFSIrvTtVQi13XMf+700ESl1
	 A1WKc4h61dpcTGJQgZ+HIWfL8l3Ee6YB+roJ77w4ytzQUH8w/Y0mSWoT09ivjOc29julp
	 mpWtWa9ry+wgJ/iWK+nwdx/t1Dpf+SE9aftle+5aMtOcKAqVAcsQ900eJplQNB5fCtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476661;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2qgQq0l+DplLQz8mTKMin6G29nKyT8xNiHuzPVUp5x0=;
	b=tCkjKvO+dDHb17wbd03hHIfccfGml8J6EMX2wKE2wZK+U7dBGi3gj+MEjF5rHC0lC8KL
	 6kaT5Rnvn0J9jlWlBq4BR8lfWjzF66Vf673crH11E6L/9CKkEEe6zXk8igLAzlYan7GM4
	 inVO1pOPzmTUl/Yl30SZSNGd8DMvltpf0S/weriNGs90cbUFx5ggJbcSk6SFb5YT/wpnr
	 g/Z4K7y83zPys7fhT65zkODajoG7WM3nNBT3qvzm/xa9FSyEPCka3vmJB/iN9oSvj7H59
	 xWXICt0kDlxMSrH1idaPBAtSDGyd5rTltu5kAdJ/rIdpV3RofsQR8pTnDRvFwbd1yNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+M+4SW5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013D4606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+M+4SW5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463731F00A05;
	Thu, 12 Nov 2026 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794476660;
	bh=2qgQq0l+DplLQz8mTKMin6G29nKyT8xNiHuzPVUp5x0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+M+4SW5/PLz6CLPp2a0UjPvJgGCtzbt62LBBdstq1W+VXCy3PaljnAXsWC272K/x
	 uaXwdT7lvn2w9H2lO2tRMCW6HGoo2EXxIEFpDDYCbi7HQ01qVUDOePD4u6cdoUldaX
	 9cPwIDcpqWQdD7POpakSm+duhYSPQ8Ngh0W9NmjjYMSPvYR6ZkrUaq4EGT1m012qv1
	 UC3nPKEL3wSefs04W9FZ8gLQetqnNkM0cDyXXfHQGOohA8SvEd7nOtae95/Ye+EJdn
	 yW9U+eGnTijVmH47xsu/Z++6SXnzrMcz+07mzUoP6HUxc655NA7f5CLa4arui3ri2/
	 Sw+xoAnIBKBcw==
Message-ID: <sashiko-outbox-210895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 09/15] wifi: ath12k: add unified firmware image
 support for QCN9575
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-9-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-9-3f30fbc2bb69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:44:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] wifi: ath12k: memory leak of mhi_ctrl->irq in
  ath12k_mhi_register() [1]
--

commit 7e637beba6af9aa8998e9035d9033a359dbfb287
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add unified firmware image support for QCN9575

This commit adds unified firmware image support for QCN9575 by caching the
OTP board ID in ath12k_mhi_register() and writing it to a PCIe scratch
register with readback verification in ath12k_pci_power_up().

> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless=
/ath/ath12k/mhi.c
> index 56e697fbdad52..90b7774ae6e8c 100644
> --- a/drivers/net/wireless/ath/ath12k/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
> @@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>  		if (!board_id || (board_id =3D=3D OTP_INVALID_BOARD_ID)) {
>  			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>  				   "failed to read board id\n");
> +		} else if (ab->hw_params->fw.unified_fw_image) {
> +			ab_pci->unified_fw_board_id =3D board_id;
>  		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
>  			dualmac =3D true;
>  			ath12k_dbg(ab, ATH12K_DBG_BOOT,
> @@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>  		}
>  	}
> =20
> -	if (dualmac) {
> +	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
>  		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
>  			/* use MHI firmware file from firmware-N.bin */
>  			mhi_ctrl->fw_data =3D ab->fw.amss_dualmac_data;

[Severity: Medium]
This problem wasn't introduced by this patch, but does ath12k_mhi_register()
leak mhi_ctrl->irq [1] if mhi_register_controller() fails?

ath12k_mhi_get_msi() allocates the irq array with kcalloc() and assigns it
to mhi_ctrl->irq.  If mhi_register_controller() fails later in
ath12k_mhi_register(), the free_controller error path only calls
mhi_free_controller(), which does not free the driver-allocated irq array:

drivers/net/wireless/ath/ath12k/mhi.c:ath12k_mhi_register() {
	...
	ret =3D ath12k_mhi_get_msi(ab_pci);
	if (ret) {
		ath12k_err(ab, "failed to get msi for mhi\n");
		goto free_controller;
	}
	...
	ret =3D mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
	if (ret) {
		ath12k_err(ab, "failed to register to mhi bus, err =3D %d\n", ret);
		goto free_controller;
	}

	return 0;

free_controller:
	mhi_free_controller(mhi_ctrl);
	ab_pci->mhi_ctrl =3D NULL;
	return ret;
}

Calling kfree(mhi_ctrl->irq) on the error path before mhi_free_controller(),
matching ath12k_mhi_unregister(), would avoid the leak.

[1] https://sashiko.dev/#/bug/linux-7faf2081-d31b-4759-a736-dcc2f8a00de5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-wifi8_qcn9=
575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com?part=3D9
