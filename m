Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160003;
	b=MZEPKbWqeFgNjAhl3Dxqp4jse01lDJHwCgGGHWpcxXHyKDxYzsNTYcRM8FQiVoioN2I7
	 AlQikNr0NSLww9q4hgxpYyPuGb89pNc8jgXi9zyjoLfH/bkA5ndIpZmjBxyeejx8PBEdf
	 nchm7epLBtzngEaDeNJWskrrUv0EQ6AHB0ScAy4+fSRKKjPk/22q/sx7cYIhhK/MeBAI7
	 6ws1zouQ3Vhu8flC1v/k7kUu3PpsW/DCDCMV7rJqoObBMWOv/cAFlO+xeeLfd2MYujQ0h
	 KJbCU3YW2yfgERbY/GOsIv9zNdjMGElwe5y8AcFmSpdHoAiECLTMlG9C2X544YPAPHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160003;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ohxrZYxVCrvMJGZ9UcOCwhERY76/6TPJb7ZmWENb3zc=;
	b=AYyQtm+/FkR5tqun/vwHV6PLUECrj9cXv2FVp3o1VzhD41Vtj+cBee1UXyLyP8WwE+0K
	 a1U8CgWvmyvjC36mKa9id04qp/CFeWrIA2Apl0y6/470YBqzc5JxJEMLDv2IE27GZFr9Y
	 IcJ5wGAoRGVOsiz946DO53i47jMbAP6TViTkPVyZZocNMjFOYWoabsTc/D+5KS0rx2vXp
	 dRMywCmU4xDT04EgZCX4Yus5USeX6HYDHJ6vWq99ISQcWH9ZCqsVUl5YWvaI5aBb5mjyt
	 R/FVrbYDzhRB7DTN2zTuQ9YIENwBa2gikbxfpNdyiNsn4tS93eF705BlZK5M6GCmyyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsMuo9xN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6F606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsMuo9xN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995621F01825;
	Wed, 28 Oct 2026 04:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793160003;
	bh=ohxrZYxVCrvMJGZ9UcOCwhERY76/6TPJb7ZmWENb3zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XsMuo9xNdqrPYcIUOpb9dal2e5LrZKnS775MecrE+Pr3OaMAUQfCqUV+EqWkFLmJT
	 i9uEOKqyw+2UQbukfRJ75tHi+EoGT3/T8pecd5NtBBMwFUInV3htkdrc5pW9TTOGo8
	 gPSUcI9NIXmnl0sR1+pi7bp8mRq16+wdBy85RBIvXYM/IhtYRwRHjDWljC/NrWHKqt
	 fpnjEay3ECqxFrtJUBlnSIOergla54OElBJm4wSdPwpk+tlURFdPS8xxAyA+8Z8Knh
	 OP761iP/BzMHJsQ0H3GPjhJrL5WN+1ROXEe2kHIL8LfYcq3uuBTEtLfaLpZxScSUvx
	 qZIpeGS1Ftu/Q==
Message-ID: <sashiko-outbox-187458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] media: camss: vfe: add the gen4 block and SM8750
 camera subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028034105.326535-9-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028034105.326535-9-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 04:00:01 +0000
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
- [Medium] media: camss: race on CSID reg_update state between vfe_reg_upda=
te() and csid_isr()
--

commit 9a87e4e329c131d366318a8a449031db90e2ea2c
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

media: camss: vfe: add the gen4 block and SM8750 camera subsystem

This commit adds support for the gen4 VFE block, where buffer done, register
update completion, and start of frame events come from the 980 CSID, and
requires 256-byte alignment for DMA addresses and frame sizes. It also
instantiates the CSIPHY, CSID, VFE, interconnect, and top-level resources f=
or
SM8750.

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
Can vfe_reg_update() race with csid_isr() on csid->aup_update,
csid->rup_update, and csid->reg_update?

When an active stream has fewer than two buffers in hardware
(output->gen2.active_num < 2) and userspace queues a buffer via VIDIOC_QBUF,
vfe_queue_buffer_v2() acquires vfe->output_lock and calls into CSID 980:

vfe_queue_buffer_v2()
  vfe_reg_update()
    camss_reg_update(..., false)
      csid_subdev_reg_update(..., false)
        __csid_aup_update()

In drivers/media/platform/qcom/camss/camss-csid-980.c, __csid_aup_update()
modifies csid->reg_update or csid->aup_update and then re-reads the field to
write the command register:

	if (csid_is_lite(csid)) {
		csid->reg_update |=3D CSID_LITE_AUP_RDI(port_id);
		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
	} else {
		csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
		writel(csid->aup_update, csid->base + CSID_AUP_CMD);
		__csid_full_aup_rup_trigger(csid);
	}

Concurrently on another CPU, csid_isr() in camss-csid-980.c handles
INFO_RUP_DONE without holding vfe->output_lock or any CSID lock:

csid_isr()
  if (val & INFO_RUP_DONE)
    csid_subdev_reg_update(csid, i, true)
      __csid_aup_rup_clear()

where __csid_aup_rup_clear() performs a non-atomic read-modify-write:

	if (csid_is_lite(csid)) {
		csid->reg_update &=3D ~CSID_LITE_RUP_RDI(port_id);
		csid->reg_update &=3D ~CSID_LITE_AUP_RDI(port_id);
	} else {
		csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
		csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
	}

If __csid_aup_rup_clear() clears the bit between the |=3D and the writel() =
in
__csid_aup_update() (or races across RDI ports on the same CSID when
vfe_enable_output_v2() or vfe_queue_buffer_v2() updates one RDI line while
csid_isr() clears another), won't the writel() drop the pending AUP command
or write a stale RDI port update bit, stalling frame capture on that stream?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028034105.3265=
35-1-xiaqinghuan@mail.ustc.edu.cn?part=3D8
