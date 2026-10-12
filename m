Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0243CE73
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788480; cv=none; b=AG+d8AVOsio20YVS5P28bFlcXeFRi9GFhnbiavGFAu6AI2Uy923ihELetDQS56cGN6u47VCeuvE9nKFvoEOtp9FzZRr4lY+e9tkfsrm6kzhpaHrldByv5czuET48a1wvQ4TfaBwf3LvzgWUUJV3kkRNodIhxDcf3pPhA8U1K71o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788480; c=relaxed/simple;
	bh=6xgXocSTJDb4kP1yCLAh9CFHjA2T3GV2zffVBEjHgIs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=p5U4PXIdP73Asq56c8mtZjd+c0fymduCTnlMg6VCuwayGfdJ+s6GbDMW6UvtCsP1e7OUCw7FenPrClU2tReAjm9Cuny8R0DBwRnpQ1uEMCzwtug4PReUlx9A1fQ3Bs7t4ac/AA4niPczNHoX+GHDZYUiTXkN++L55Rd4GGnvs58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ki+/6Jhq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ki+/6Jhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5606E1F0089B;
	Mon, 12 Oct 2026 07:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788478;
	bh=JmlTjHa3NFGbxzvxsAjtJR37Ab92OQSWJ3FjBGdMndM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ki+/6Jhq8u7dfOQvYlOMPg1de3fomujPy5nWvoIvsn1/RR7rT096nIF02lzXQbUyg
	 yFKDIQ1CxaKt0WjnbmFvBGRDebMQiwjP5LTVI9jFPII9q/G1b3Xk+AnmOEOZXIGTU6
	 D7Iq7DG3e0yaeODDsMjpIjGeAl0mR9EJ5Q9b96TrnQtTxdQTK0/yR4067PzadBnRmQ
	 oK5rhQihdZD9Nlimw/lWvjnnwv0BTbE0tKXiK/f0foLLqW9nvtsvwK3mrOJ3cvBHlu
	 nZ2MnUV/iSaOnjVekRPeIOwAlQZ31s0EVym58nsYfM3eWS1v0AZo6JUN3oO8QNQr9/
	 PgfMRXaYujCng==
Message-ID: <sashiko-outbox-167768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on
 REG_UPDATE from CSID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:01:17 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: qcom: camss: lost initial buffer due to skipped REG_UPDATE
- [High] media: data race on csid->reg_update in stream-on
- [High] media: camss: cross-routing breaks due to hardcoded VFE ID in reg_=
update
--

commit cb036f0b44cb6248a2bce2553092074a74c00d9a
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: media: qcom: camss: Issue stream-on REG_UPDATE from CSID

This patch moves the stream-on REG_UPDATE from the VFE to the CSID for
CSID 680 and CSID Gen3 platforms. It skips the VFE-side REG_UPDATE when
the upstream CSID implements the reg_update callback.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27db..830c9c818d3d2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c

[ ... ]

> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>  		if (csid->phy.en_vc & BIT(i)) {
>  			__csid_configure_rdi_stream(csid, enable, i, 0);
>  			__csid_configure_rx(csid, &csid->phy, 0);
> +			csid_subdev_reg_update(csid, i, false);
>  			__csid_ctrl_rdi(csid, enable, i);
>  		}
>  }

[Severity: High]
Does this new process-context call expose csid->reg_update to a data race?

Looking at csid_subdev_reg_update(), it performs non-atomic
read-modify-write operations on the shared csid->reg_update mask:

    if (clear) {
        csid->reg_update &=3D ~CSID_RUP_AUP_RDI(port_id);
    } else {
        csid->reg_update |=3D CSID_RUP_AUP_RDI(port_id);
        writel(csid->reg_update, csid->base + CSID_RUP_AUP_CMD);
    }

Concurrently, when the hardware generates a RUP_DONE interrupt, the
hardirq handler csid_isr() calls this same function:

    if (val & RUP_DONE_IRQ_STATUS)
        csid_subdev_reg_update(csid, i, true);

Since csid_configure_stream() is called in process context without holding
a spinlock or disabling local interrupts, couldn't csid_isr() preempt it
midway through its read-modify-write? This could cause corruptions to the
mask, leading to lost or unintended hardware register updates, which might
cause streams to fail to start or stop.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..16a0b5663fe2b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c

[ ... ]

> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>  		output->gen2.active_num++;
>  		ops->vfe_wm_update(vfe, output->wm_idx[0],
>  				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +		if (!rup_in_csid)
> +			ops->reg_update(vfe, line->id);
>  	}

[Severity: High]
Will skipping the reg_update here cause the first queued buffer address to
be permanently lost?

During stream initialization, this loop runs CAMSS_INIT_BUF_COUNT (2) times.
The vfe_wm_update() callback writes the buffer's address to a single hardwa=
re
shadow register (for example, VFE_BUS_IMAGE_ADDR). Previously, reg_update()
was called after each write to latch the shadow register into the active
hardware queue.

With this patch, if rup_in_csid is true, reg_update() is skipped inside the
loop. This means the second iteration will overwrite the first buffer's
address in the shadow register before it is ever latched.=20

When the CSID eventually issues the single REG_UPDATE at stream-on, only
the address of buf[1] will be latched. The hardware will then write the
first captured frame to buf[1], but the driver's completion handler
vfe_buf_done() expects buf[0] and will return that uninitialized buffer
to userspace, resulting in silent data corruption and shifted frames.

[Severity: High]
Does this logic also need to be applied to the runtime buffer completion
path to prevent cross-routing failures?

While this patch correctly identifies the active upstream CSID for the
stream-on phase by traversing the media graph, it appears the runtime
path still uses the hardcoded ID.

In vfe_buf_done(), when buffers complete, the driver unconditionally invoke=
s:

    ops->vfe_wm_update(vfe, output->wm_idx[0],
                       output->buf[index]->addr[0], line);
    ops->reg_update(vfe, line->id);

On Gen3 and 680 platforms, this routes through vfe_reg_update() to
camss_reg_update() using the hardcoded vfe->id:

    camss_reg_update(vfe->camss, vfe->id, port_id, false);

If a user configures a cross-routed media graph linking CSID N to VFE M
(where N is not equal to M), this hardcoded routing means the register
updates for new buffers are sent to the wrong CSID. This leaves the active
CSID's shadow registers unlatched and potentially corrupts the unrelated
CSID's state, causing streams to freeze.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-kaanapali-=
camss-v21-0-04fd28d815c6@oss.qualcomm.com?part=3D4
