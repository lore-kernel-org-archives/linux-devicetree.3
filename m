Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983709;
	b=Mq2VcgLk5aoWN0uOf8HI+NHTJwXrgdIGG+WVdgdMYLGyiV8dRnUpVkcnouukBxEC7QEV
	 TPFgBxi1skB3tZYVm9fK1pW66zgzEX82DhABbZVH3Zt1iOF1pLA/sT6EAUlO+gKSvNwOk
	 krUFW3H2G19mcCFiGTDbwo/EXQuDz/BWSrL95rJruH6SqUyFevRSYMn+05UdAE7JE72Gt
	 5VGyOsvf0SsgypUEtQEhTfHxDLQOuf4MNJV5wf3oAcCUwxmC31QmBQqYuUV/wv8XtCUuO
	 w51S68TuNyEe7mU300iAJcRQrtDqL6wv7xuIIAuZE3PhzcOKm5T6ddM2CHEmscQQi/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983709;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aF6Wx1GZivEcu3djOpCScNrS+mzDZ+pnxvauzrlVEYw=;
	b=zV7vwbn8hlcfvBmbizRhHhvPMAC194XhDzIANCMCdI4lSAo4u8KZw/G7gDCkQinRQtlK
	 91O8n3Wj9bUGalC4U2vtInhvGY/1/PXHTNeVPSa2VIQJfeU6Fhen6dt/W7IFkqZAQEEhg
	 4LanEPmm7sY7Yusk6qEKpCyK3pg8kwjv1hgQDt0uz2YiNwhguC/25h/k0swrl1ZzAUTaQ
	 TqWGJvUvgApnZ457PxoDx5RKHfgXNL0X/KtrujO7j6SqFWe60I62IGAF03bXLVme1J+Zl
	 a45kh3cb+BdHvPYKC8SPgoQTTyv5miPeOLJa/ghqw8a3C6uO8A94PgLsLiYaEJbWD9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5cNS9a4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F02606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5cNS9a4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C261F000C4;
	Wed, 18 Nov 2026 06:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983708;
	bh=aF6Wx1GZivEcu3djOpCScNrS+mzDZ+pnxvauzrlVEYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e5cNS9a44quzQJ8xKcDGztHqXomjsrXow7vNuti89FJzWmWKqAPm7n2h5Mx1lUCqE
	 vqOv9iF6tgbg1GAlThlU3dizzhL+5HxLWAb4p3Y5OGiJ29k1RN+k3xOgdBipQlmAi8
	 oSosSD6BEFhMU/LUsKTgyYUIHwhZPt9ryrEswGKRucaCxPTYsjqbtJZHa+ZG5aYnqn
	 k4aJydgJ9lCr6tqK1RisThsrkQPSL4eVFlnGU01lOL5XOQC8YTOoEJxgXSlEBfDQ38
	 1Ml6cGDytJYq89n+2Emqe7ls3hPwdcAkSwPkQlFGgWSJYvpOgpJ08lQQaWCdRlznKe
	 Miejf4lwvGk9Q==
Message-ID: <sashiko-outbox-220259@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 04/15] wifi: ath12k: add QMI support for
 extended firmware binary download
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-4-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v2-4-d81a3046290e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:35:08 +0000
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

commit 8c2c11bbdb6334e6ed7f07c904885733355279a7
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add QMI support for extended firmware binary download

This commit adds QMI support for QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01
to download multiple firmware binaries (M3, AUX uC, and MCSS uC) in a
single combined request.

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

QMI_OPT_FLAG in qmi_decode() sets ext_fw_bin_download_support_valid to 1
whenever TLV 0x2B is present in the response, even if
resp.ext_fw_bin_download_support is 0.  If firmware sends both TLVs with
resp.ext_fw_bin_download_support =3D=3D 0, ath12k_qmi_request_target_cap()
still validates and stores ext_fw_bin_download_bitmap (failing with
-EINVAL if any unsupported bit is set in the unused bitmap) and logs that
extended download is supported before setting
ab->qmi.ext_fw_bin_download_support to 0.

Conversely, when resp.ext_fw_bin_download_support is non-zero and
resp.ext_fw_bin_download_bitmap is 0, the mask check passes here and
delays failure until ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send() after
regdb, board data, and calibration data have already been downloaded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wifi8_qcn9=
575_bringup-v2-0-d81a3046290e@oss.qualcomm.com?part=3D4
