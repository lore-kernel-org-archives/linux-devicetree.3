Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549144;
	b=1L++BGIuAm+ewYibAptfpbXq5Pd0rPcJ42knSrW2GzCiWokHn+rdIlNu0JtVVMM7bfwr
	 Ooxzifjo1jCqjdVp4FjXZyPTftXg5+hazGH2Oxblr3cGK+BgT8NCpd9mFn289yKV9BqsZ
	 fNqXru0XXjuM3Y5rlJueqRoVJX7y1vdmNWulmGrB1p6mHTIMqv96XqsUMqwmOPL38EIVQ
	 COEL/EWfWUryQ8ANi7kcVkI7fJ5BNlHD61TRULjd88A6tFIdxe1x+jCJR6MksjLShwSA1
	 WqVYsj1ylbWmE2igfdfZ+rm6QJ5F9wdqQoEk1u8oOMRucC2KqNVWkNtvHtAntGHYHYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549144;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kT/nLejiu9Xixr+tSvXnotmS7RR128r8JdPr3tiLUaE=;
	b=diEfxVZT18qlfeSZe4iSXNy3Vc8Enw2ZRDIN9pPorusDQ5+fpA2GpIDhG6WvCrklMIv5
	 wjiZRNZ3mMhQt22NxwRrA0uQAdoGGqvsjdOY137V3Bk2xCVAYFNSsLV+i6RL7UKYbSabl
	 OXt/VeTyFDV7euIxepz9id4VfbDYxQZlZqgyxVr/37aMm0C4UrofTOeyuGGQz48xqALhO
	 LNzOaHLjGA6zLIVR3gFxhIQfHPqlnMmYWqHCixIlXJqwAhRiZerkbxqpD5+l7R5AnnuaB
	 V2Jg/77qKT7LgWLBwqIZV/xGKieajLwFS2yFZfXpZWQeJ7m6JM7EORIMiEvMdWLJb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jx6P+5XH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC3D606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jx6P+5XH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D1D1F000C4;
	Fri, 13 Nov 2026 05:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549143;
	bh=kT/nLejiu9Xixr+tSvXnotmS7RR128r8JdPr3tiLUaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jx6P+5XH+TTNVtQQKUSPe75ZpWpn9MfQNkYA4F6xYQQcH8UrmXHixcUdfVvYSFpIS
	 RrET3NWXG9IZ8ClBdzSH5wqVufCU1u7qdtiWwzMCbNbhhjPWiGzUZoQQjgVvZcc9Jr
	 L5EiZcUkIIVjzQPc37j+R9PGqTATLQxgXlAgATYnhj3zVoP7g2xrDME3ZlbVytaEl3
	 l8wYcvrY3hdRbJZBLWz2cmFB50yWuKrYWwMQsbRWP8ByqHIUVyvULq8DiwlGGbeP3A
	 euqhrQ0ypfi2iudwC8obB1B9F8s+W/UkBDZJnnewML49eb3wTlUe+zPJYAGj2dfIUt
	 oWOOKMircFSsg==
Message-ID: <sashiko-outbox-212259@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261112-kaanapali-camss-v25-10-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
 <20261112-kaanapali-camss-v25-10-1d709f57f370@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 05:52:23 +0000
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
- [High] media: qcom: camss: unsynchronized CSID RUP/AUP updates in
  vfe_ops_1080
- [Medium] media: qcom: camss: AUP_UPDATE count mismatch in
  vfe_enable_output_v2()
--

commit c95e0ff891b19f6115d3c4df041126b33e4f1889
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 1080

This commit adds hardware ops and resource definitions to support VFE
(TFE) 1080 on the Qualcomm Kaanapali SoC.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers=
/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 0000000000000..68798f13fbea8
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c

[ ... ]

> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line=
_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_reg_update_clear(struct vfe_device *vfe,
> +				 enum vfe_line_id line_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id lin=
e_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_addr_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_addr_update_clear(struct vfe_device *vfe, enum vfe_line_=
id line_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_addr_update(vfe->camss, vfe->id, port_id, true);
> +}

[Severity: High]
Can vfe_addr_update() and vfe_reg_update() race with csid_isr() on
csid->addr_update and csid->reg_update?

vfe_queue_buffer_v2() calls ops->addr_update() and ops->reg_update() under
vfe->output_lock, which forward to __csid_addr_update() and
__csid_reg_update().  Meanwhile, in camss-csid-1080.c, csid_isr() clears
bits in csid->addr_update and csid->reg_update before calling
camss_buf_done() (where vfe->output_lock is acquired):

CPU0                                  CPU1 (<hardirq>)
vfe_queue_buffer_v2()                 csid_isr()
  spin_lock_irqsave(&vfe->output_lock)
  vfe_addr_update()
    ...
      csid->addr_update |=3D BIT(...)
                                        if (val & INFO_RUP_DONE)
                                          __csid_addr_update_clear()
                                            csid->addr_update &=3D ~BIT(...)
      writel(csid->addr_update,
             csid->base + CSID_AUP_CMD)  <-- writes 0, losing update
      __csid_aup_rup_trigger(csid)

Because csid_reset() only unmasks INFO_RST_DONE | BUF_DONE_IRQ_STATUS in
CSID_TOP_IRQ_MASK, INFO_RUP_DONE stays latched until csid_isr() runs on
BUF_DONE_IRQ_STATUS at the end of the frame.  If userspace queues a buffer
when output->gen2.active_num =3D=3D 1, the lost CSID_AUP_CMD or CSID_RUP_CMD
write leaves the hardware without the queued buffer address and stalls
capture.  Multiple active RDI lines on the same CSID can also clobber each
other's csid->addr_update and csid->reg_update bits.

[ ... ]

> +const struct vfe_hw_ops vfe_ops_1080 =3D {
> +	.addr_update =3D vfe_addr_update,
> +	.addr_update_clear =3D vfe_addr_update_clear,

[Severity: Medium]
Can starting a stream with fewer than two queued buffers mismatch the
number of AUP_UPDATE requests against the buffers written to the write
master?

In camss-video.c, msm_video_register() leaves q->min_queued_buffers at 0,
so VIDIOC_STREAMON can run vfe_enable_output_v2() with 0 or 1 buffer
pending:

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_enable_output_v2() {
    ...
	for (i =3D 0; i < CAMSS_INIT_BUF_COUNT; i++) {
		output->buf[i] =3D vfe_buf_get_pending(output);
		if (!output->buf[i])
			break;
		output->gen2.active_num++;
		ops->vfe_wm_update(vfe, output->wm_idx[0],
				   output->buf[i]->addr[0], line);
		if (!ops->addr_update)
			ops->reg_update(vfe, line->id);
	}
    ...
}

csid_configure_stream() in camss-csid-1080.c then unconditionally issues
CAMSS_INIT_BUF_COUNT (2) __csid_addr_update() calls even if 0 or 1 buffer
address was programmed into VFE_BUS_WM_IMAGE_ADDR.  When userspace later
queues buffers while output->gen2.active_num < 2, vfe_queue_buffer_v2()
calls ops->addr_update() again for each buffer, issuing 3 or 4 AUP_UPDATE
requests for the first two buffers and violating the requirement that
AUP_UPDATE requests match the number of buffers queued to the write
master.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-kaanapali-=
camss-v25-0-1d709f57f370@oss.qualcomm.com?part=3D10
