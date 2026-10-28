Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181213;
	b=MUhpGc4rYZwBlncqAhWRVG49ClK/K8A544UFSKddYV0P+/JZGy8GpHkz1a6CY5wIJS0I
	 S2SmxY3NdtUgf4Rsy9+VcgsDmY+MvsoNeJppLO/tfjm9DpQllse9kJlw7o5JU5IZHY0br
	 PWWBrSdgsrDrQUbzcwN+VdGqeOK6FEOD6fV/tladuLOKT276l0OJbm84BzS1NO2Jd7tTk
	 bdaR7eMeYHd6auxuaa5gbiQ7uoUZYqKssxEopa2Ja0H9r05VmQbu5tg+cMkjgbWhrQfyB
	 Vo4eZQBY4dic8ZNajYaZMn/Wxc+f2EeuEkFM40Hux0ZYNVK3u/j4/rfznwJPuWZ414A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=71ZzNd6L2OyS750Y45+VjDXjdyfaQiMPpJCLxBCejqo=;
	b=bz3qeCDEIxhcRTXIvWjW1Ciq3e60pEcB0lFAHK1ok967ba/j2iEMMNaI3HkEQe5cXNp8
	 AWATObT68SSCgVfmODwiZLRSMlvJTuvTeeWVN2PtsWAfX9whVgADtUevSp8AQYN2o0TfF
	 rz5NZrFqF44LPltk66bNZFHxK4RX5xkqXy5eF48AnwP0ZK2Hg7wX6gPgMtw0csIa1N86v
	 z/YKb6M8Yj+IIHV1SEvISrz0xBlyJD11bXZNbzpQ1DSi+Y1yTCb0EtNFLdvtYBa63T4qa
	 DFrZAxTiAb/6RYjkTZosSO1IS/0IroFGpyAhfZc4I/2Oh58wjOOMAdfTmylh8TtcbXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmPB8VhT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E157C606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmPB8VhT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377B41F01828;
	Wed, 28 Oct 2026 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181212;
	bh=71ZzNd6L2OyS750Y45+VjDXjdyfaQiMPpJCLxBCejqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DmPB8VhTcZDtxQe103fsYCUAenCyaxURfS9e4gaqr9MBJUS5edahdajAntLcEEyGc
	 sOEcTrQlBa/xA8ExhPgnQaa8U7ZJ+fBmHEGH0A7uCUlRkwh5z5jGlLvbEKQDI1O0AX
	 vDPZ+B2gmjQtyEznN7mzYHgcZ9agUMrq5xIjZjCQFKbp6Twr8VYC8o5AuX2XdMeW+S
	 A+lytx8RbChOS+SepbfWLZpCNg5N16MUIgT3qfzpBhX1Unz73tb7VScpiVrCREmjRK
	 kGwC/2wqQftxiD/FDZI5QvH4C02lw1euurpl5sbpWnb6E7aTQqMHllTYb3VGnKeSf5
	 FhyD15vaVEZbQ==
Message-ID: <sashiko-outbox-187701@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] media: camss: vfe: add the gen4 block and SM8750
 camera subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028093003.722745-9-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028093003.722745-9-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 09:53:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: camss: race on csid reg_update state between vfe_reg_upda=
te() and csid_isr()
--

commit 5ba0f2cd4903e9301f9d8d170289c6e55be33cde
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

media: camss: vfe: add the gen4 block and SM8750 camera subsystem

This commit adds VFE gen4 hardware support where buffer done, register upda=
te
completion, and frame start interrupts are handled by the CSID, and requires
256-byte alignment for DMA addresses and frame sizes. It also adds the
SM8750 camera subsystem resource definitions and compatible string.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers=
/media/platform/qcom/camss/camss-vfe-gen4.c
> new file mode 100644
> index 0000000000000..2ee82898f37dc
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> @@ -0,0 +1,212 @@

[ ... ]

> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line=
_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}

[Severity: Medium]
Can vfe_reg_update() and vfe_reg_update_clear() in
drivers/media/platform/qcom/camss/camss-vfe-gen4.c race with csid_isr() in
drivers/media/platform/qcom/camss/camss-csid-980.c when updating the CSID
register update state?

On SM8750, vfe_res_8750 (using vfe_ops_gen4) is paired with csid_res_8750
(using csid_ops_980). When userspace queues a buffer via VIDIOC_QBUF while
output->gen2.active_num is below 2, vfe_queue_buffer_v2() acquires
vfe->output_lock and calls:

  vfe_reg_update()
    -> camss_reg_update(vfe->camss, vfe->id, port_id, false)
      -> csid_subdev_reg_update(csid, port_id, false)
        -> __csid_aup_update(csid, port_id)

In drivers/media/platform/qcom/camss/camss-csid-980.c, __csid_aup_update()
performs a non-atomic read-modify-write on csid->reg_update or
csid->aup_update and writes it to hardware:

	if (csid_is_lite(csid)) {
		csid->reg_update |=3D CSID_LITE_AUP_RDI(port_id);
		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
	} else {
		csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
		writel(csid->aup_update, csid->base + CSID_AUP_CMD);

		__csid_full_aup_rup_trigger(csid);
	}

Concurrently on another CPU, the CSID interrupt handler csid_isr() in
drivers/media/platform/qcom/camss/camss-csid-980.c handles INFO_RUP_DONE
without holding vfe->output_lock or any CSID lock:

			if (val & INFO_RUP_DONE)
				csid_subdev_reg_update(csid, i, true);

which calls __csid_aup_rup_clear():

	if (csid_is_lite(csid)) {
		csid->reg_update &=3D ~CSID_LITE_RUP_RDI(port_id);
		csid->reg_update &=3D ~CSID_LITE_AUP_RDI(port_id);
	} else {
		csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
		csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
	}

A similar race can also happen when multiple RDI ports stream on the same
CSID and vfe_enable_output_v2(), csid_configure_stream(), or
vfe_queue_buffer_v2() run concurrently with csid_isr().

Could this unsynchronized read-modify-write lose a pending address update
(AUP) bit or re-write a stale RUP/AUP bit to CSID_AUP_CMD or
CSID_LITE_RUP_AUP_CMD, causing dropped buffer updates or stalled frame
capture?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028093003.7227=
45-1-xiaqinghuan@mail.ustc.edu.cn?part=3D8
