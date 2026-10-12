Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A226D43CE73
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788445; cv=none; b=npa3/1A9JyVVAybZ+mLqOujLTj1CljiKE5/WBJXpMvdLGhYvIqHsvQgTR0zOUqjeJt+LJfNcDXz6rmz2mPjMIiiHE2cSN9moS/WjxNcaX6QDq0F1VGUuthvrR6z40RzpeoYDExFa9RomvkWmM1njy5nhZ9X7GjfvcGN40iPMEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788445; c=relaxed/simple;
	bh=+esHrw8A827bwmP7zAwxMk0pslZ0NIIMcR6VJkJHJvU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Yol9n5FqPyEAVoIsVU1yIiis1BE+6ZWOgYOIRgaukGYW1wNeDYCpDdGZ4nBZ/d1yeBkR2bZynRB/0EIH0q55tt5uRwxMd802kOM+4JjYV56PQaTk4/Bnc1Cpn4/ZLwq/TmA8brG87ntrLm/Tg/bBzJuHKlFWoKIlc0EMQ6u3gT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lwb9+lqI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lwb9+lqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257E41F0089B;
	Mon, 12 Oct 2026 07:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788444;
	bh=r19Im8HO0VMd/LtZn9fpu+F06N9cUU5a2NFzYpKq+GA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lwb9+lqIMoBPxopNffzr76/GdktcJ6JLy55t1ss9ESuXbW4EGzexC04uYmdeaBeN/
	 nxB/bkx9TLySzo++456GGkHNi0bzv9bJsJq5OJ/oP7qWZNp/fihuMv6UWExJ4WLq6J
	 ikEBz0KqrltWJv8fLiCyKVFgn1mcMBknlotQWFsf2LZ0EygvR8o0mQIhj6cLz/TlGm
	 RDobx+UcFxwFX4kErg1H2ffoQVFvN8V4RnKBBHYx/PvypvH2Ka7x+2DYmme0t9S8bs
	 7oTKnuDJYa56eIdAiMaMbcjxzKbKpePn8UQyfvAf9/MIbyd0GxXs0VNoz8mfdcFNhZ
	 t3owfYy6Uhf6Q==
Message-ID: <sashiko-outbox-167764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 09/14] media: qcom: camss: vfe: Add support for VFE
 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261011-kaanapali-camss-v21-9-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-9-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:00:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: camss: hardcoded AUP_UPDATE count violates hardware constra=
int
- [High] media: camss: data race on csid->aup_update and rup_update
--

commit bab5581422e8c33728a37abe32648420503fc60c
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 1080

Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.

> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.

[Severity: High]
Does the current implementation actually enforce this requirement?

If userspace queues 1 buffer via V4L2 and calls STREAMON, the vb2_queue
lacks a min_queued_buffers limit in msm_video_register(). Consequently,
vfe_enable_output_v2() dynamically queues only 1 buffer to the hardware,
but csid_configure_stream() in camss-csid-1080.c unconditionally issues
CAMSS_INIT_BUF_COUNT (2) AUP_UPDATE commands.

Can this mismatch lead to write master state corruption or IOMMU faults
due to hardware desynchronization?

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
> +}

[Severity: High]
Does this introduce a data race on csid->aup_update and rup_update?

This call reaches __csid_aup_update() in process context. While local
interrupts are disabled via vfe->output_lock, there is no cross-CPU
synchronization.

Concurrently, csid_isr() fires in hardirq context (potentially on another C=
PU)
and calls __csid_aup_rup_clear(), which performs a bitwise clear on the same
state variables without holding a shared lock:

    csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
    csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);

Can these concurrent non-atomic bitwise operations cause lost updates
and corrupt the CSID_AUP_CMD and CSID_RUP_CMD register states, leading
to stream stalls or hardware misconfiguration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-kaanapali-=
camss-v21-0-04fd28d815c6@oss.qualcomm.com?part=3D9
