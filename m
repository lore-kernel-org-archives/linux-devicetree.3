Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474457;
	b=f+rKmghIbvsqZIXl5gQ2KG1c2+rRxrtKTed75C6X2o8jT/P0U9pUAap705Rust5ugFF6
	 2fTTHuu684chrDJsb1uzas1M0J9MUDYImtjxYNmC3wcO0A1cgZj8aOhrmJdirz+stehzW
	 Hk0g53/5NjJVknwpSTYjtA25+1Hg+Td7JnLrih67GjIWnHETwTd9Cxjhx0J2Yvihafju3
	 rzQhgHTHTOv2C2ae4YgGwI1r7s0T8rWNSASCAR8UjXmkNW4l34++4UylVCAj07RQLvjAv
	 xpGLPJ6bfTPbaZ+V6P30PvXlnBExxa0wgAc3lLiqOSsQ6ewUeT3dA2Trmi5KcDsjiDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474457;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7oMEbKgyXoeSCmiLuCygcoBNqJed+97Zm0Ftsw9to3A=;
	b=mpN/r+e2IR81332tjS29OlUQ6TXiuIgfgPYpa/DlnAG70+5jU7osLhqrbL2dNtsNuq8C
	 ApeTfCbjqiRViAgdGAtufylB9XGxy63Gn34X7Mk707P3KpTZIAVic+Mf4P134qkKDvWlD
	 aEWmAaqXBY9mdAdZANT3DgclbWQnVlzwRh2L/luHyZrnzoFVMGv8hsN2NPkEaA6gBF+u2
	 1BZ2ROTvwi7XUOH0Hwi0piaUevnH7ps7yqO6cwJ+YifjQZG1+8UKssRuCO4xyexLM+Fiq
	 DPsWZyJS+7I3OcNHMD+PP+MRuk8Soay55YyzqrPUfBs59Z0XwaOkgQDan4u6zPiaseg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4K2XwJd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F033C606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4K2XwJd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8F41F00A05;
	Thu, 12 Nov 2026 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474456;
	bh=7oMEbKgyXoeSCmiLuCygcoBNqJed+97Zm0Ftsw9to3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4K2XwJdgyYqUPsIoSfiyzWYOk6OmNhdBn0ut4U/Nnu6d69e3HgCMzev41D384QoR
	 OHXCFwl0MyPHiI6tIwCN1aufNVRXgTfkHLO8FA2kGYagLdAXDnyU9a8FqzhG6/K9JJ
	 7AlpD9iY/xBQqOxUmpl6BrtUn9yxi30K78Eig6/uzWL3hTcvAoBnA23fWXwoxnsBXD
	 hVQZFeVE6/V8cK9P5zM0oEJH/bYSNF5vnqyZ/To7bcMC/ZAK7TuXQ+SZ+Hv/1OvNtd
	 t5Rn9xti7cUYHcfiQuiCmqYJ3QIqn7euvxo45rTwX+bvvJUlbuhz5XaQfIQ53M1lRC
	 gXCJOlK7e0O8g==
Message-ID: <sashiko-outbox-210823@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 04/15] wifi: ath12k: add QMI support for
 extended firmware binary download
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-4-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-4-3f30fbc2bb69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:07:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] wifi: ath12k: missing support check in
  ath12k_qmi_request_target_cap()
--

commit d06cd02bf95410a2331b0d3861ca5bf0baa15ac2
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add QMI support for extended firmware binary download

This commit adds QMI support for the combined extended firmware binary
download request (QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01) and the
mcss_ucode.bin image required by QCN9575.

> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless=
/ath/ath12k/qmi.c
> index 69512b82aa3b3..3b60d624b0aa5 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c

[ ... ]

> @@ -3115,6 +3289,27 @@ int ath12k_qmi_request_target_cap(struct ath12k_ba=
se *ab)
>  		}
>  	}
> =20
> +	if (resp.ext_fw_bin_download_support_valid &&
> +	    resp.ext_fw_bin_download_bitmap_valid) {
> +		ab->qmi.ext_fw_bin_download_bitmap =3D
> +			resp.ext_fw_bin_download_bitmap;
> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download bit=
map 0x%x\n",
> +			   resp.ext_fw_bin_download_bitmap);
> +
> +		if (ab->qmi.ext_fw_bin_download_bitmap &
> +		    ~QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK) {
> +			ath12k_warn(ab, "Invalid ext_fw_bin_download_bitmap 0x%x, host-unsupp=
orted bits set\n",
> +				    ab->qmi.ext_fw_bin_download_bitmap);
> +			ret =3D -EINVAL;
> +			goto out;
> +		}
> +		ab->qmi.ext_fw_bin_download_support =3D !!resp.ext_fw_bin_download_sup=
port;
> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download sup=
ported\n");
> +	} else {
> +		ab->qmi.ext_fw_bin_download_support =3D false;
> +		ab->qmi.ext_fw_bin_download_bitmap =3D 0;
> +	}

[Severity: Medium]
Should this condition also check resp.ext_fw_bin_download_support?

QMI_OPT_FLAG sets ext_fw_bin_download_support_valid whenever TLV 0x2B is
present, even when ext_fw_bin_download_support is 0.  If firmware sends
both TLVs with ext_fw_bin_download_support set to 0, this block still
stores and validates ext_fw_bin_download_bitmap (failing target capability
negotiation with -EINVAL if any unused bit is set) and logs that extended
firmware binary download is supported.

Also, if ext_fw_bin_download_support is non-zero and
ext_fw_bin_download_bitmap is 0, the mask check passes here and defers the
failure until ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send(), after regdb,
board data, and calibration data have already been downloaded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-wifi8_qcn9=
575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com?part=3D4
