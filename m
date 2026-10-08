Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC464078FE
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444819; cv=none; b=oleweT9t1trS0rKrX6mDmqeeYI95GnjXAKvFMpL+PusRmHFwqRz5Rri1GqMZvkrmA1jRqfpOaCDADLv/Bk0kiwBWNPYKE6zuy9ddEDg8J0H/9rUx64++DS/rHO1AguhpgOP35l/4za1cZuXgbsR4KKU6vR8tS1l0JldSCqyOZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444819; c=relaxed/simple;
	bh=bCkyTGtJ1hp8XUK71gjJhj/ufM8CmOOC0+2iscxo9xQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kfO2AOl5FJEi96kmZf33kPFiBhKwivIypm0IrxvVOl2NAG1tjEGuKTtqQNT6ApcZ57+ajE7OXxMG5bSD65bdX3OZ7NjdGk7bfcohdmnjYVtUvrvatIh8cdmErSxQXlx59DVoTRwGHqT+PC0AaxBAb8QQs0C/Zj+X4tmmjn5TlMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVq2V9og; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVq2V9og"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFDD1F000FF;
	Thu,  8 Oct 2026 07:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444811;
	bh=bIZpEPrVNVRZ2SEnNX0VrSAozYSX8iDwLnGd/jcY4KQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hVq2V9ogiQW87RBfgwkaBeAVawu7YcF7aNIRPOze6oVTXVoN11GUOZPk8SfwK2NCz
	 jHas9pk9tSTidxsL2zTK50ts0oIADZ4dQMsAe75y/20mVhxuDtoAq5IL8TIujAu4rC
	 +kiFl5Aq0yBdqvfc9ZykHHtHRoxcMJy/m2zex5kQo14kE345CCXQre5Y/TageEt30l
	 JCW3dEkccXFM1OEqdX8OI/qJ17xQo8DT1ZxHHW13NybPV8H8pIE8OOk734Z28QIHH9
	 Ra8dmoLqhE6GpgZrXxbyCD02bh2+AyQT9wxKFaY1r7qe0VlMmL48RnraRsbajXj1MJ
	 lr+5B5Y1xxdRQ==
Message-ID: <sashiko-outbox-163769@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 08/12] media: qcom: camss: vfe: Add support for VFE
 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org
In-Reply-To: <20261008-kaanapali-camss-v19-8-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-8-b2c583ef50e0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:33:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: camss: Hardware constraint violation on AUP_UPDATE count
- [High] media: camss: Hardcoded VFE-to-CSID mapping breaks dynamic media r=
outing
- [High] media: camss: Data race on csid->aup_update and csid->rup_update
--

commit f4a9516b2392f133fd18f4aed515b9cb62df16ca
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
   =20
    media: qcom: camss: vfe: Add support for VFE 1080
   =20
    Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
    In the Kaanapali camera subsystem, the front-end blocks are referred to
    as TFEs.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers=
/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 0000000000000..016857cd10251
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c

[ ... ]

> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line=
_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);

[Severity: High]
Does hardcoding vfe->id introduce a regression for dynamic media routing?

The Media Controller framework allows dynamic routing, where any CSID source
could be linked to any VFE sink (e.g., CSID[0] to VFE[2]).

Here, camss_reg_update() is called with vfe->id, which indexes the CSID arr=
ay
directly:

camss.c:camss_reg_update() {
	csid =3D &camss->csid[hw_id];
	csid->res->hw_ops->reg_update(csid, port_id, is_clear);
}

If CSID[0] is routed to VFE[2], the VFE buffer queue will update the
registers of CSID[2] instead of the active CSID[0], leaving the active
CSID without its AUP_UPDATE and stalling the stream.

[Severity: High]
Can this introduce a data race regression on the CSID shadow states?

When userspace queues new buffers via vfe_queue_buffer_v2(), it executes fr=
om
process context and eventually calls this vfe_reg_update(). This ends up in
__csid_aup_update() which performs an unprotected read-modify-write:

camss-csid-1080.c:__csid_aup_update() {
	csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
}

At the same time, the CSID hardware interrupt handler csid_isr() processes
completions and performs a similar unprotected read-modify-write:

camss-csid-1080.c:__csid_aup_rup_clear() {
	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
}

Since these modifications can interleave without locks, one CPU's state
update could be lost, potentially corrupting the CSID_AUP_CMD register stat=
e.

> +}

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..3acef6ba97dc9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c

[ ... ]

> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>  		output->gen2.active_num++;
>  		ops->vfe_wm_update(vfe, output->wm_idx[0],
>  				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);
>  	}

[Severity: High]
Does this introduce a regression by violating the AUP_UPDATE hardware
constraint?

The commit message states that "the number of AUP_UPDATE requests must match
the number of buffers queued to the write master while it is being enabled."

However, if userspace only queued 1 buffer, the loop in vfe_enable_output_v=
2()
will break early (as it loops up to CAMSS_INIT_BUF_COUNT):

	for (i =3D 0; i < CAMSS_INIT_BUF_COUNT; i++) {
		output->buf[i] =3D vfe_buf_get_pending(output);
		if (!output->buf[i])
			break;

This means the VFE write master gets configured with only 1 buffer.

Meanwhile, csid_configure_stream() in camss-csid-1080.c unconditionally iss=
ues
CAMSS_INIT_BUF_COUNT updates:

	for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
		__csid_aup_update(csid, i);

If the CSID sends 2 AUP_UPDATE commands but the VFE is only configured with
1 buffer, can this cause the hardware to perform out-of-bounds DMA or
trigger an IOMMU fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-kaanapali-=
camss-v19-0-b2c583ef50e0@oss.qualcomm.com?part=3D8
