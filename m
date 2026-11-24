Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539499;
	b=eN5lKzUXTk6nugtRRhAg+WBpdNnyU9DAXZWPeDzcyiXFNtU96wut7o6RHCYDsPdjSHNI
	 /JqwXeOjAd0GkjyDVyMF7VdvNz35fP8dOEdjLrAiiVFBfhy7qG3CxvGJsj3hydqeFRERO
	 aP0m7kmF7CaDGdL97jVAV8MJXDmE9jGLF1H3mbDIWJQMitZQbEs8+jeDXj4wRvmA2tU2W
	 t2QbBFCaSD6kfitxmgSm92awZKSiyMVqgQKFGnFQmqZcxd04JiZO3tttzhEEeeGizAl/a
	 PrqynzPDLdRPQ1Dr9MmNu52P4WmtgGhRcH7JL8XyIo48N1HMcEBDKwbXAr41PECwhNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539499;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ktXj+aYA/TAokC7WlgI3krWtJGW/B+c32od/3xFygc0=;
	b=nch+RzIOOKrfN6ul+N33AeS4inSpSY8mWKP3S4FWHzEfx9APHmzB3MPwRjISRocLDGyB
	 HsXuVzdzzAnx0DgsPD9NrnH4LyUZuYwC6xp5fSTI/xXU4zzE10szjfIuqJ53tCcUX+1uR
	 YtYejFsGx0MaALteVj6Jt6uhGwhANYBUplr96aRER/IrDc2I3kGqZfEyYycb2+QzMWGPW
	 w3uPPXDFq91dC6A5K9ReCYZH+RjCWrIQalKnHJ/E0epCQAKubSaTDQi3Ui9MJGDBTqaJL
	 GIS+12l2oz3bMu3bnPmnM1+Ab7hR+FnN6vyLFWVCtKKAYFNzPSDtmRmd9hP6hzXt4Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4h8IHEO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A472606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4h8IHEO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19431F000C0;
	Tue, 24 Nov 2026 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539498;
	bh=ktXj+aYA/TAokC7WlgI3krWtJGW/B+c32od/3xFygc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4h8IHEO52pRs87xi3wHCQFBQwWQXyi9H2F2NaRPKK6Mj+jzLnoUFqJuzJaqq/caB
	 1ckt7i/5BYpriWsSO+myzn7WBe+fVj2rs6EcrFfSt5loMpzxjUJCyJSf8ygST6pHTN
	 AX3+Ho6xMc+tialmFOgnLHtb7l2pQ9itQmCscA2HBzjlwFS+u/pJiWJuYxG/ZLNR/M
	 gWy0v7CSwOs5Ex3QkC420YD8JS9JHVrvMle5plmiEk12Ex78yRdcrm3Hr3bEAE5+jD
	 j2R5Ufo2XIRMpUle4aZP9aWE9RF/J4/VsFyiaPUugoMxhUwFkniDp1sHUcFokmvpfR
	 g8dRtCgFpIIeg==
Message-ID: <sashiko-outbox-231632@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v4 03/14] wifi: ath12k: add QMI support for
 extended firmware binary download
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-3-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
 <20261124-wifi8_qcn9575_bringup-v4-3-1f5b87ece6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:58:16 +0000
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

commit 0ad2dc5f1d6c66c21dfaf536a6cc18a2499967aa
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add QMI support for extended firmware binary download

This commit adds QMI support for downloading multiple firmware binaries
(M3, AUX uC, and MCSS uC) in a single combined request via
QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01 when advertised by the target.

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
> +

[Severity: Medium]
Should this condition also check resp.ext_fw_bin_download_support before
validating and storing the bitmap?

QMI_OPT_FLAG sets ext_fw_bin_download_support_valid to 1 whenever TLV 0x2B
is present on the wire, even if resp.ext_fw_bin_download_support is 0.
When firmware sends both TLVs with ext_fw_bin_download_support =3D=3D 0,
ath12k_qmi_request_target_cap() still enters this branch, stores and
validates the unused bitmap (failing with -EINVAL if any unsupported bits
are set), and logs that extended download is supported.

Conversely, if ext_fw_bin_download_support is non-zero and
ext_fw_bin_download_bitmap is 0, the mask check passes here and defers
failure until ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send() after regdb,
board data, and calibration data have already been downloaded.

In addition, because m3_mem and aux_uc_mem share a union with
ext_fw_bin_mem[], if ext_fw_bin_mem[4..6] are allocated on initial boot
and a subsequent ath12k_qmi_request_target_cap() call during reset or
recovery clears ab->qmi.ext_fw_bin_download_support to false,
ath12k_qmi_free_fw_bin_mem() will take the legacy path and free only union
slots 0 and 1, leaking the coherent DMA allocations in
ext_fw_bin_mem[4..6].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-wifi8_qcn9=
575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com?part=3D3
