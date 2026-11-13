Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559009;
	b=kMUmbXG6inhejY9+LFkHiyBpMSzk397m9T4hwdiphmFuD388WpHlfAwbsLRfsdCi2Cqt
	 H37ZBcK+praSC+32OZRsXjBNgad/efcc3jqU2NPsqXhjGIjEX9MWl77OIR+XWEbK262Us
	 OYIAV/6kVxXlESWBv5104h1VaMx8Fv1FiwrRavusUDNkdiuyipdMGCSCeWa3yfc+a+nuI
	 x2Hry1VfwwoawqSVAp8rJrO6IDwHdZ9bmW3fg0p0qGIfor25UHIfn/IfdMOboE+0/BNXf
	 8TDhkYYn0K6EMiqo+1BvDlbjDDCcDiY2a9T6uY9aaAliEP89lIF/eQVoFvp2VR5Ygig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559009;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KWgxyxXEvtqtjO6skRFEPsrCm3T7hnZDrU9HDFggS7E=;
	b=mz9Q8uxnZ2RfbMBM8ACeIqSFedKFCS3CTB/qouaBNuuaAA4ukmkCzJw4iEbB8CFTkIVH
	 zQ1nQaWrpSKsbLkBR/XqJASrJcQ1cNcgd9j5I61K6AMSMihIhM2bTfXuVBhrLrrQ+rGnm
	 YNWp2EHWlT+N0rwWBjXUSsvFuBXYaDAAkOqYHFJTfTlRw4pp5mvmWjJCAOx1EZge65YX7
	 myOHJfmVM1DRPS9Lr5vov61bgdeD2MHk/vu9d7lVqxlPp/jp+ihy6VJPjUhwBO3TqN1x6
	 +vW/adRF4gY5L//Fr7wqFebIpGR3uxIK6NE5I8DwvhK0v8QG9Cjk0FP9n5nYobvmAEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltM38Frp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1652606A89F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltM38Frp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE421F000C4;
	Fri, 13 Nov 2026 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559008;
	bh=KWgxyxXEvtqtjO6skRFEPsrCm3T7hnZDrU9HDFggS7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ltM38FrpiLV6q1cwHcz8tEIGkTb6z4wqIYyZRcwhEUhskAHwK5HFZqPj/fbthAtXt
	 zgZw4MwFau0LIgVp7+6VVXAJGX689bdfqq7/W49tpd7NwYcr3cgHPcUkAFB/2uL9bP
	 2vNBDD1dS+HYs+8QL66D2+DC2wG+gwnpFjtUHORaqO5W/tOmIeoWmrZ7z2tW+A+ktE
	 hJY7YRsuBrUwgBE0vcPDdDLML91XfdyXAEUiQ67S4nPUpQpE3/PWT54qAkM857/hw3
	 G8+X4T/bPOpC0H3KSeb1jtgAEM8NDwAsrFARkV2yLr5W4wG62BiEcnI+Baglc1D7L6
	 gL3tEPvTWZ0fw==
Message-ID: <sashiko-outbox-212422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: camss: Add Glymur-specific
 resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261113-glymur_camss-v2-2-b1b76509c744@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-2-b1b76509c744@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:36:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] media: qcom: camss: NULL deref in
  msm_csiphy_subdev_init_legacy() on Glymur
- [Low] media: qcom: camss: missing Fixes trailer for commit
  09d6c30d3fae
--

commit 0569a71f44b398cac082b08f3b002bec082fcc8b
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

> media: qcom: camss: Add Glymur-specific resources
>
> Glymur has three CSI2 PHYs, while X1E80100 has four. Reusing the X1E80100
> CSIPHY resources also exposes CSIPHY2, which is not present on Glymur.
>
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

[Severity: Low]
This fixes the mapping of qcom,glymur-camss to x1e80100_resources.  Should
this include:

  Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09..f3cab9ecef042 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>  	},
>  };
> =20
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 0,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 1,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 4,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +};

[Severity: High]
Can leaving .csiphy.hw_ops unset in csiphy_res_glymur cause a NULL pointer
dereference during probe?

camss_detect_legacy_phy() defaults camss->legacy_phy to true and only clears
it when it finds an endpoint whose remote port parent node is named "phy":

drivers/media/platform/qcom/camss/camss.c:camss_detect_legacy_phy() {
	camss->legacy_phy =3D true;

	/* Find first remote-endpoint and determine if its a PHY */
	for_each_endpoint_of_node(camss->dev->of_node, ep) {
		remote =3D of_graph_get_remote_port_parent(ep);
		if (!remote)
			continue;

		camss->legacy_phy =3D !of_node_name_eq(remote, "phy");
		of_node_put(remote);
		of_node_put(ep);
		break;
	}
}

Because endpoint and remote-endpoint are optional in the binding (for
example, when no camera is connected or only the internal test pattern
generators are used), camss->legacy_phy stays true when no remote endpoint
is present.  camss_init_subdevices() then calls
msm_csiphy_subdev_init_legacy(), which unconditionally calls
csiphy->res->hw_ops->init(csiphy).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-glymur_cam=
ss-v2-0-b1b76509c744@oss.qualcomm.com?part=3D2
