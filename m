Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EE3955EA
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466010; cv=none; b=t2bIXcnsrnbm8CRyqNdsGxV+hZJXDGo1zXrLnsVF13FFzVTZRnfwLlhXo3b7ZGfxPg6i47tZbFWc7XHQBZyGLLWUhSjcNwsBLrcV85ELyjGy1y7MFT457rKGPHvLCQ2wYnnVP1NyYeslwZPIrT0qGdVVtQpwc+Wy0mt++9ao9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466010; c=relaxed/simple;
	bh=GJziUHriQoZmRfsJYTiYBhi9Dci3//49BLaMhyzm//Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ewEo4n66rWQtagesTMtqkrOv/Peoi+hgwbevDU6faYrDga4Y2VnvFlo1FbnKdk09lD3zR0YjC4Tgi27NqligY3jjP2hGLVHCCADxyCz3TXgwgpElCJ7tc0i1/QTNdppP+hmzUa1GxQCokJRECE7BRJi6c1ReN/iRzr2h3U0Ixyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG3rjIS0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG3rjIS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418B91F000FF;
	Tue, 15 Sep 2026 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789466007;
	bh=WZyhSuPYugiigFplYkgiKt8g9d0J8pEardhwBxkO90c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jG3rjIS0UOc+qBBQ9P4ndrJ/ro32j5f9kvlMdtJL16UcE7hEmoCpuBEs/HpZg/MsX
	 KQuNFzBrXDrD6TEEuC4NXIdA3JpPz9IM1JAoVXg0VnXcTIjKLcszyT+pw0C4rIPja9
	 fbTr0euk+IPlBkK7FzN6dCMsOjNv1QaCQ/7dmGS7oBUx4fPmYrpdYuVyJqU3/NZSv3
	 kJhNwfk5wRctkZH608Dqkd0VnjUXs1hfSeIJcWxxHJ5Zc9OVgbV6AeUNljWhlgu7RI
	 7HiKtwK/edh4kssrmpc1cshf9lpZB9R2gWqOm60JNYmhkUbopOf6TDRS/yYx1YZotT
	 oiqQrtWcsYIww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] media: qcom: camss: vfe: Add support for VFE gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915-nord-v1-3-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-3-20db41a7f1ff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:53:26 +0000
Message-Id: <20260915095327.418B91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: camss: vfe: AUP_UPDATE hardware desync when queued buffers =
< 2
--

commit 6e9773967fcca20f990885a6e668a47fa226cbc5
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE gen4

This commit adds support for the VFE Gen4 module on the Kaanapali SoC. It=20
limits early register updates for Kaanapali, as it requires updates to be=20
issued only after all CSID configuration completes.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c

[ ... ]

> @@ -552,7 +553,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>  		output->gen2.active_num++;
>  		ops->vfe_wm_update(vfe, output->wm_idx[0],
>  				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);

[Severity: High]
Does this cause a hardware desynchronization if fewer than two buffers are
queued before stream-on?

Since min_queued_buffers is 0, V4L2 userspace can queue 0 or 1 buffers
before starting the stream. When vfe_enable_output_v2() skips the
reg_update() here, CSID blindly issues CAMSS_INIT_BUF_COUNT (2) AUP_UPDATEs
during csid_configure_stream().

If the remaining buffers are queued later, vfe_queue_buffer_v2() will issue
an additional reg_update():

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_queue_buffer_v2() {
...
	ops->vfe_wm_update(vfe, output->wm_idx[0], output->buf[1]->addr[0], line);
	ops->reg_update(vfe, line->id);
...
}

This pushes the AUP_UPDATE count to 3 for 2 buffers, which corrupts the
hardware state.

Additionally, if 0 buffers were queued initially, vfe_queue_buffer_v2()
places the newly queued buffer unconditionally in output->buf[1] instead of
buf[0]. When the hardware completes the frame, vfe_buf_done() expects buf[0]
to be valid, leading to a missing ready buf error and leaking the buffer.

>  	}
> =20
>  	spin_unlock_irqrestore(&vfe->output_lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-nord-v1-0-=
20db41a7f1ff@oss.qualcomm.com?part=3D3
