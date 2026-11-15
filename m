Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767498;
	b=oQ9lBdaIrCIQYm9Xw+QZ1HH0IPLqeZ+UjYreVLP3PVxXyk2ooUss+mne5s5+NYQM0S/G
	 oFul9gt5y/RxC1c3aW3QmOPndVorMv0bzf6QxQ+UbBn8Y4TKoAaIbNxaDpE/G57uZqlGz
	 aDBkEcqP2y1tSc6NXL+zesFO1h3DAvmJbCDUJ5qFBmivW3t2B2dC+TMYdPQhRrXcm5RPu
	 JwzUjCmvrvIi1oSNWpn23d/9sMCVwGElG1+gDK0iORCOF66lYx+RB3hjCe/hYJyOH8yu5
	 Eun+aVcIH95a2mO35Q0zZNRp/HY2eqlE3exzgSVd2YhdnLLPZGIu1zfOFTW63QuUcrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767498;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D9K0PfhPn/Iqwpi591LuFvaueF1yQYJS7DDukdZL3SA=;
	b=nCpslj+n8uIcOasuNInnaqjhzizu5fvqgiESt3Kx1jN+r+pr9ZUwRJqtPCl1bWlVMqad
	 M/XwdmhjjIFILzNgbKPiEy7Z0hmpK4ja2YuW/gNxDols6tNb1blp2L1duF3RZMKQxzuye
	 Qg4NspH4tfiyGVguUBG04FYx/Wn4N2KCjV48vxTNfiebQnoQF3kbSyxmYGOsyaiEvkLi7
	 FYvVCbptBf6V3aM3+lOz1fvqhnvoIhmNJtqGjgp3fHAoy+eHeSy9b8ZcJkqozhtO202kM
	 vcK3cM0XLIBij/TCHryHIHY9HiAwhJDbNcqkfMtpG1oAosjRtY8LTD4XgxFqkcjUPYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4j1TXeA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2978B606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4j1TXeA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904881F000C4;
	Sun, 15 Nov 2026 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767497;
	bh=D9K0PfhPn/Iqwpi591LuFvaueF1yQYJS7DDukdZL3SA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l4j1TXeAiYX017BpBxik2GC4X9WsBU/4FP2Hmamr+qvgHyImTwFrIb12BmhnhNFwb
	 KOYECKgCoZpRCMWV1/LhLfZqOe06CYLWAAfyIlfUtW1XVFVRRNWnr651souEudpgJ7
	 4Cr0oXoWEDSfyVa159GU9S3GPUtaLe2C/W8qMThsx9PxqHkPQYZ8iqlTgrYzi8lbRB
	 dr3SQtvYWYWTKREcTkrE+vs6Why3sISiv2exIzLsTriCcxFdiQThez0Ec9yZc0x1+X
	 7YqaW8y+td/VIrFsjs9rpPMprdlXnPin32hOFS02Xu4yTjn9Fs7CBXQmS1zC+9WBef
	 Usa8zy07ZaiDg==
Message-ID: <sashiko-outbox-215723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 4/6] net: xilinx: axienet: Add 10G/25G (XXV)
 ethernet support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114182947.2908628-5-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
 <20261114182947.2908628-5-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 18:31:37 +0000
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
- [High] net: xilinx: axienet: XXV RX path reads length from unpopulated
  DMA metadata
--

commit 24a43162ada4308aadc24cc61461a6b384478cc3
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Add 10G/25G (XXV) ethernet support

This commit adds support for the Xilinx 10G/25G (XXV) Ethernet MAC and
PCS/PMA to the AXI Ethernet driver via a new axienet_10g25g_config.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/n=
et/ethernet/xilinx/xilinx_axienet_xxv.c
> new file mode 100644
> index 0000000000000..3c204dbbf6aec
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c

[ ... ]

> +const struct axienet_config axienet_10g25g_config =3D {
> +	.jumbo =3D true,
> +	.sw_padding =3D true,
> +	.internal_pcs =3D true,
> +	.regs_n =3D XXV_REGS_N,
> +	.options =3D xxvenet_options,
> +	.clk_init =3D axienet_10g25g_clk_init,
> +	.probe_init =3D axienet_xxv_probe_init,
> +	.gt_reset =3D axienet_xxv_gt_reset,
> +	.mac_init =3D axienet_xxv_mac_init,
> +	.get_regs =3D axienet_xxv_get_regs,
> +	.phylink_set_caps =3D axienet_xxv_phylink_set_capabilities,
> +	.pcs_ops =3D &axienet_xxv_pcs_ops,
> +};

[Severity: High]
How does the XXV RX path determine the received frame length on the
dmaengine path?

axienet_10g25g_config leaves .non_dmaengine false, so XXV always uses
axienet_dma_rx_cb(), which gets the frame length from DMA metadata word
LEN_APP (APP word 4):

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_rx_cb() {
	...
	app_metadata =3D dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_le=
n,
						       &meta_max_len);
	...
	if (IS_ERR(app_metadata)) {
		...
		dev_kfree_skb_any(skb);
		lp->ndev->stats.rx_dropped++;
		goto rx_submit;
	}

	/* TODO: Derive app word index programmatically */
	rx_len =3D (app_metadata[LEN_APP] & 0xFFFF);
	skb_put(skb, rx_len);
	...
}

Unlike the 1G AXI Ethernet IP, the XXV Ethernet IP has no AXI4-Stream
status/control stream to populate APP word 4.  Without
xlnx,axistream-connected on the DMA node,
dmaengine_desc_get_metadata_ptr() returns ERR_PTR(-ENOTSUPP) and every
received frame is dropped; even if that property is set, APP word 4 is
never written by the XXV MAC, so skb_put() uses 0 or stale descriptor data
instead of the actual transfer length (such as lp->max_frm_size -
result->residue from dmaengine_tx_status()).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114182947.2908=
628-1-suraj.gupta2@amd.com?part=3D4
