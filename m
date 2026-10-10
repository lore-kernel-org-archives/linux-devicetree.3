Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B75382F07
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649553; cv=none; b=O48kebNACBPnHC8TZq7UuqmsydgcGMVqteZlDXAyr9ym28fbwREXL7nr9q/eUJ5AfN1NJsO14n3cA3YrhsBXoeQVPO41Ccv1r83S70MEofPS93kzkRri5CjFZ5ZFLCwNQCbCVYHiwDWJBxRBELsj6mqTEmmw5Ahl4VMrh1GQ5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649553; c=relaxed/simple;
	bh=80EPWBsZX25JmeAOEW1OTO9vbAOytTWmIw+jnGuzRXo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZloQxZPuskXA1CMsGvGtEME2CKuxtgHGLflBzyUOnxvETlOJC8PUp4Umo46YW3LjL4O3+Vol9yaBvMOol+t0/yh5fCMStvoc62k5Dj2fGMwci/foWiVzLkbAdMrMmOl2F3umvFf98tkkSq7ma5zCuQATt9qdphENq+dVOqK0AFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtAKnH5t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtAKnH5t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C011F000FF;
	Sat, 10 Oct 2026 16:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649552;
	bh=9BQoPNpg/BuzHBZB4mO3d/+THaNd9C2XTiHsMc60QaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CtAKnH5tK5prTd7sikrq+hsrzJFXD4KQPW8uWMIXGIAR+0YktZqvH+qX6hknBIWL3
	 XwdAvvi4Yz9C8YvxWFM2Wnce1RDYVXUEMboz9zLe2WIV5pl2loQJhAK0KJRukLL6Y/
	 FnUox1zaibUQQ8RCZ3hWjqqP3Im8FR8g3efqF6xWqmnfF9M2VeqXLDGLtgkUh1W2BO
	 jf6qph7SQAeyA9KqDuWkgMAqQv8YRDdHb4Z3yeflBJHE6W0NJyHVnwiSEj9/WoSXl5
	 dY/Ud52M7Rg/9xx3qF6N1Kl+SsIzvrEJo+Z5SrEK1PGEnEVMqli87CaX7+h8kHFgWa
	 S5bdLBUCx3gDw==
Message-ID: <sashiko-outbox-166736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:25:51 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: vfe: AUP_UPDATE mismatch during stream enable violates hard=
ware constraint
- [High] media: csid: lockless read-modify-write race on csid->aup_update f=
rom process and hardirq
- [Medium] media: vfe: hardcoded vfe->id mapping breaks Media Controller cr=
oss-routing
--

commit d6f09b2d35220bf1f91873f665e2de70196c2e83
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 1080

Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
The driver continues to use VFE naming, and Kaanapali requires REG_UPDATE
and AUP_UPDATE to be issued only after CSID configuration.

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

[Severity: Medium]
The CAMSS driver framework allows flexible stream routing, meaning userspace
can link any CSID pad to any VFE pad via the Media Controller graph (e.g.,
routing csid0 to vfe1).

By hardcoding the hardware ID to the local VFE's ID (vfe->id), if csid0 is
routed to vfe1, vfe_reg_update() will look up csid1 and incorrectly issue t=
he
buffer AUP_UPDATE commands to the csid1 hardware instead of the active csid=
0.

Could this drop queued buffers on the active stream and corrupt the register
state of the inactive CSID?

[Severity: High]
This wires up vfe_reg_update() to camss_reg_update(), bridging VFE's buffer
queue path into the CSID register update path.

vfe_queue_buffer_v2() executes in process context and acquires
vfe->output_lock (which disables local interrupts but does not prevent
execution on other CPUs), and it triggers vfe_reg_update() ->
__csid_aup_update(). This performs a non-atomic read-modify-write on shared
state:

    csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);

Concurrently, csid_isr() can execute in hardirq context on another CPU. It
calls __csid_aup_rup_clear(), which modifies the exact same variable
locklessly:

    csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);

Since __csid_aup_update() and __csid_aup_rup_clear() use non-atomic standard
bitwise operators (|=3D and &=3D) from competing contexts without a shared
spinlock, does this form a TOCTOU data race that will corrupt
csid->aup_update? Could this result in lost register updates, dropped buffe=
rs,
and pipeline stalls?

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..5710fdbe41b3e 100644
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
>  	}

[Severity: High]
The commit message states that "the number of AUP_UPDATE requests must match
the number of buffers queued to the write master while it is being enabled."
Here in vfe_enable_output_v2(), the loop fetching queued buffers breaks ear=
ly
if fewer than CAMSS_INIT_BUF_COUNT (2) buffers are available, meaning it is
valid for userspace to queue only 0 or 1 buffers.

However, csid_configure_stream() in camss-csid-1080.c indiscriminately loops
and issues exactly 2 AUP_UPDATE requests unconditionally, ignoring the VFE's
actual active_num.

Does this mismatch violate the hardware constraint and cause the VFE Write
Master to fetch uninitialized buffer addresses (0x0) for the missing update=
s,
potentially leading to DMA faults or physical memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-kaanapali-=
camss-v20-0-63e98ce9ac0c@oss.qualcomm.com?part=3D8
