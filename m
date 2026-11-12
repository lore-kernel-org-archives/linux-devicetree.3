Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473743;
	b=Ys30LvC5lFQhtTPgGa/48H4Bj71+WozKxu27Xn/i5bb5U7quPPCgaazCXwI1Fd/ROo5N
	 nUuJpS4TrwUDY8KNInTOqcb61aEotXDYE9tTYZdSGRvF87SKYZfq6ZNi2BAe6kVHSXG16
	 blhJbG+n19kBmaxIz8NdUzX/ECCE2iwkgdxVvDExMPLOQswYLGXdpmuZqklQzDlPsKXbO
	 IkgNMGpk/cQi3ERggUR6Nra6J+wwnX6twBjbYcA5VNJMUfgpL8xhhscj6j1xcfT1ziSYm
	 MtvchfXPsZt4ONP/W2sCDvDiGFe/A3252VV3d8S5d23k0dMehmf2OTcjrFvYuMLRDjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473743;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U+2jRRE13RjDqyaDEB+JeMRF3CT3e8Jfod5/+vXOTlA=;
	b=2DxhN4znYjOGY+vhjqiWhm8a5EWpv02B33Knnjp9t7XwjBdoNqfpysYUcV+P3WI/V+yv
	 dbp+CWowMLOccLbCyGxL7ER49VBEN/H/20atoVQnIrnMee97uKCBzyqUe+Fy7IvhlaAxo
	 mcwWGpaTzC1cpj6j2v0VNiqU2CplYVaDe90fpyTF+OxUbiX5PZqrQZtnHw9yo6yndegkC
	 bx0JN84HVGsW5f1dbACGWW85llshy5piTLDS9flKCuhGkc7aWDYmpBXlHw6fnP/NS69LB
	 Rdj6RackVKIv0d1so3K11dbp/lkMBmBF9EgvKnbRYftGf/3kbWt0HhUn1BF3el9NoNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQl20erb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC99606A33C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQl20erb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5EB1F00A05;
	Thu, 12 Nov 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473743;
	bh=U+2jRRE13RjDqyaDEB+JeMRF3CT3e8Jfod5/+vXOTlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gQl20erbd3Nwn9c8rlt49N9Aworbbo0IIAZRtsF6E8jcaU8YmoLIDPPNy6Lu6PvuR
	 4DH+nwBbQcJNX/+z1n0x+aoGNWatzTxFje74of535bYy6/hRQoM8i1hZ6Av0KV/dQ2
	 humrjRG4blA2Zy+KuF0vaNkxsAtyaYVFSzmHPJ+57+pkiKt3txDK6P37x+1C83rR4y
	 3iPaanxroAtyyg/o9Q65IMeYLOPsKeS3a2afFSyfc8OWqAQZFDfCmthybqV/W5dwaf
	 /+508Q40rLUOysUriopMjRrLZt3HmejgGZOZPj/auIEqZY2cNSlLm53m+z5ieOZWf+
	 wIsbiep9bKArw==
Message-ID: <sashiko-outbox-210800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] media: verisilicon: Reinitialize the IOMMU after
 resetting an encoder core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261112-hantro-robust-v2-5-18561fd48838@gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-5-18561fd48838@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:55:42 +0000
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
- [Medium] media: verisilicon: missing v4l2_ctrl_request_complete() in
  device_run()
--

commit 9b8b7ddcd6a2f08763d5a6b0f18fb2a01381b678
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: verisilicon: Reinitialize the IOMMU after resetting an encoder core

This commit allocates an empty IOMMU paging domain at probe and attaches
and detaches it after resetting a Rockchip encoder core so the IOMMU is
reinitialized, refusing further jobs if the reattachment fails.

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 4542322dba71a..6d027c2770387 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c

[ ... ]

> @@ -174,6 +204,11 @@ static void device_run(void *priv)
>  	src =3D hantro_get_src_buf(ctx);
>  	dst =3D hantro_get_dst_buf(ctx);
> =20
> +	if (unlikely(vpu->iommu_lost)) {
> +		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

[Severity: Medium]
Does this leave the control handler's media_request_object incomplete when
src was queued with a media_request containing controls?

Normal runs complete the control request object in
hantro_end_prepare_run() via v4l2_ctrl_request_complete(
src_buf->vb2_buf.req_obj.req, &ctx->ctrl_handler).  Returning early via
hantro_job_finish_no_pm() calls v4l2_m2m_buf_done_and_job_finish() ->
vb2_buffer_done(), which removes src from the m2m queue and clears
src->vb2_buf.req_obj.req without completing the control object (as on the
adjacent pm_runtime_resume_and_get() error path).  The media_request then
stays stuck in MEDIA_REQUEST_STATE_QUEUED until the file descriptor is
closed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-hantro-rob=
ust-v2-0-18561fd48838@gmail.com?part=3D5
