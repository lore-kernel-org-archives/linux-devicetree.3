Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990905;
	b=m2BNMpJSsdl9mcXX/DDDwHQoqp+DiFNBMSe9+GM5/q4YhNvtZ43+sDtTR9xhrvfm7o5J
	 HOFXWEu66eK2dN3otVo6o5mZoC6Abvuw1dY3TOUYRvLNls+hRY+68bD7Y2tl4Fy5MxUc7
	 l4Gymh/DR8vBslaaOvnoQ0ZDQXWA3csVKta9Jwn5Q8XyF3ZrJGAxtDLdQ3SijuSKYaZwL
	 JV6kiNBMj5g+X2hBBjqZlSQHDi04gDD85l1XAUwyrqdKAdKAfCMu/t3y7aZaTyISPdYnQ
	 /9DPTFSu8Mtx+DOVh41kBryGswGVGNCLknqbCmt/ousW+DZqrxBkehkQr0VWwbyNq4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990905;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J/7Ztq8ptzKROL564TQK2vn6tFaCXVyFpLM/otgumYU=;
	b=fnthS7G1Yt3y7i0nUibopz6KEpyfZ9hjp07Ua2gEeaJR1RAZbPhQoEkkHLkEy/Mz9tym
	 3d2GSHVTg7ftJIXsaPWYwKpGShuNYtARMEsmmyetSNI1850hhEMZLhjMIMr7+dW5jsnHS
	 NeaOrbK5KUPOIjA5ASqUvPGcRpFxPjQLeXxbQ6uMFTFqYIGfz4Zi/nW5eG3vmzRuXS+pa
	 ucErsZ5v0rGcpCXpCXovvwg0MibYE6db+IhWoBcvqoP2nXELZy3UqGbY2hLuRYPfyor0W
	 apH8hlmNzpbr/MUkT2WPzOWS4t4gHxYIR0lUYI1JxCl0K2iAcB/huD7npoyQ6n9C7Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pyd95Sim;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F92606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pyd95Sim
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9A51F000C4;
	Wed, 18 Nov 2026 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990904;
	bh=J/7Ztq8ptzKROL564TQK2vn6tFaCXVyFpLM/otgumYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pyd95Sim4Y12XTDPl2/v2GeG79qeQ+QoGCFKmWSzuymLrRYrFGbKwHGTZcNENDP7T
	 hX0Rum4ZStTLRT5gz2KeQWQxAR5jKh1s4doCmuEQgqyc8SWhwUjzKRh7gfQ6rhQK5y
	 JLNSrsuvRUKEIHT+HrPpC1gVjaeVhyU4TknhQy1U1Acvodejw4xzIlEQYNfPagkSKs
	 d6/uAaaPYR3FQoSknc516fVc/kPvistL+TEpFNh+PEvzMuGWf+p3B4iXLio6vMPtls
	 DXTXRzP7mDG8iefhdMfmlCJMQmm3UQJjfT1jB7cMSyZSZ/IJJwtaXvQykH/TrR/JRe
	 sFkVaETKH1C4g==
Message-ID: <sashiko-outbox-220459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v3 04/15] wifi: ath12k: add QMI support for
 extended firmware binary download
Reply-To: sashiko-reviews@lists.linux.dev
To: "Madhavan Ganesan" <madhavan.ganesan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-4-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-4-9875d2a3953f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:35:04 +0000
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

commit b62a5385a0a47e4923666ed9960fe59adf7da8de
Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>

wifi: ath12k: add QMI support for extended firmware binary download

This commit adds QMI support for downloading multiple firmware binaries
(M3, AUX uC, and MCSS uC) in a single combined request on devices such
as QCN9575.

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
Should the condition here also check resp.ext_fw_bin_download_support and
that resp.ext_fw_bin_download_bitmap is non-zero?

qmi_decode() sets ext_fw_bin_download_support_valid whenever TLV 0x2B is
present in QMI_WLANFW_CAP_RESP_V01, even if ext_fw_bin_download_support is
0.  When both TLVs are present with ext_fw_bin_download_support =3D=3D 0, t=
his
branch populates ab->qmi.ext_fw_bin_download_bitmap instead of clearing it,
fails capability negotiation with -EINVAL if the unused bitmap has any bits
outside QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK, and logs that
extended download is supported while setting ext_fw_bin_download_support to
false.  Conversely, if ext_fw_bin_download_support is non-zero with a zero
bitmap, validation passes here and only fails later in
ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send() after BDF files are already
loaded.

Also, if a subsequent ath12k_qmi_request_target_cap() call during reset
clears ab->qmi.ext_fw_bin_download_support after ext_fw_bin_mem[4..6] have
been allocated, ath12k_qmi_free_fw_bin_mem() will take the legacy branch and
free only m3_mem and aux_uc_mem (union slots 0 and 1), leaking the coherent
DMA buffers in ext_fw_bin_mem[4..6].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wifi8_qcn9=
575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com?part=3D4
