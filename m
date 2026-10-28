Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201697;
	b=tj61OPXw5iBFwjbD76+arQtOAXnQjl9bYqrHPXCZerzBQBX7Rq5ZDWtdbyOvygkL045w
	 kQ68pRB1qyXWvXw3vpndfViovwDsjt0urKawBwGKKrw9znPRRCOu1ymU9rU/Y+/n/qeHv
	 vEXDrNuReoY23s+zoO4NKw5oZY3iVU2QD+LG6GcuNZhLcDIXlehOE13flkrFagcBumIB/
	 8v1M7tYDS+ccGkOQWmqFngwfYMZiBbeD4T4ErbbtJMrjv01SY+4/ZaerKkEx5C4pBaIcd
	 f8QJ4aFZ6tM5HinYF3Tw6W/PxwUnDUFfunVcGYGBUp2mpkc+mbsyEaWZp1Kpo6dMNzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201697;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sLumN3EmXqMht3zLNv6AhnKJMrZtggWYBOtzHUH0fcY=;
	b=QAY//CSFcAvFxnR40LCIILsRH9C6Q4hx0gmXgg2i6oo6uIJ6z2JrluTLvN+9uYlFo4I/
	 oXDe2F82opX1C64KQEAggvebCynz7g0Mis3hP/p6Jd1ZEfAW64V3Wbk0foMTZz3MnWxoJ
	 4amPWvdiF3KZ85NUpOS3F/gZW2kX55/LF2QFY8IrAa+GLD5uWSDhuOEsmg+GveBkzBiBV
	 45PA/0fdFq+JuSNOgSLUoCpyPE/oXdMiZpK22C/hjjU4EwsJpqD8Zj4Ob3lhlwdt8aHe3
	 m0ZBgp1bbJ5MRE/Ra9obZH7UYQRNUv7UArh8h8khkKHY7CnCRa/5tSd+P+/RRrm5/Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DcyFxVsg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4910606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DcyFxVsg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108961F01825;
	Wed, 28 Oct 2026 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201696;
	bh=sLumN3EmXqMht3zLNv6AhnKJMrZtggWYBOtzHUH0fcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DcyFxVsgKHKvFA2zFYd0eiWhh5XuqgFFDY09OXeFEphHexHZCMfw3v45uHGahvzpY
	 tJJcClsVCvDzDnop/wzFQTnlyQaVYOAsgxomiftrCe7Sbn3cP5Nud0utX3EiSeee+P
	 82N5xpn7f5ta83lkUlVZ+6Jj4aTGgBBQNaCGEvpkHQQKrEraEYzREie6uTFWqLtXWk
	 enhdsr5o/uI1hRBfVsVPp20BQ6zDpI5uyVzR+YIQcwdf4o7s9RZYDEaD/aDImCvYHs
	 lfKmdALAWGbl6S+mK2R3mLmUeeBsFh/MPGfIaHC13sSL1vQURNxI77RshpE3IjEuds
	 PKYvFOmRld6Aw==
Message-ID: <sashiko-outbox-188058@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:34:55 +0000
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
- [High] media: qcom: camss: unsynchronized CSID RUP/AUP updates in vfe_ops=
_1080
--

commit 59a42f5889e4e9fb6937e5811830bc3f796b016a
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 1080

This commit adds support for the VFE 1080 hardware block found on the
Kaanapali SoC, including write master configuration, CSID register and
address update forwarding, and Kaanapali VFE resource definitions.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers=
/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 0000000000000..68798f13fbea8
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> @@ -0,0 +1,213 @@

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

[Severity: High]
Can vfe_reg_update() and vfe_addr_update() race with csid_isr() when
updating csid->reg_update and csid->addr_update?

When userspace queues a buffer via vfe_queue_buffer_v2() or enables an
output line via vfe_enable_output_v2(), the VFE driver holds
vfe->output_lock and calls vfe_addr_update() or vfe_reg_update(), which
forwards through camss_addr_update() and camss_reg_update() to
drivers/media/platform/qcom/camss/camss-csid-1080.c:

static void __csid_addr_update(struct csid_device *csid, int port_id)
{
	csid->addr_update |=3D CSID_RUP_AUP_RDI(port_id);
	writel(csid->addr_update, csid->base + CSID_AUP_CMD);

	__csid_aup_rup_trigger(csid);
}

static void __csid_reg_update(struct csid_device *csid, int port_id)
{
	csid->reg_update |=3D CSID_RUP_AUP_RDI(port_id);
	writel(csid->reg_update, csid->base + CSID_RUP_CMD);

	__csid_aup_rup_trigger(csid);
}

Concurrently on another CPU, csid_isr() in camss-csid-1080.c clears those
same bitmasks upon INFO_RUP_DONE without holding vfe->output_lock or any
CSID lock before calling camss_buf_done():

			if (val & INFO_RUP_DONE) {
				__csid_addr_update_clear(csid, i);
				__csid_reg_update_clear(csid, i);
			}

			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
				camss_buf_done(csid->camss, csid->id, i);

If csid_isr() runs between the bitwise OR on csid->addr_update or
csid->reg_update and the writel() to CSID_AUP_CMD or CSID_RUP_CMD (or
races with updates on another RDI port of the same CSID), could the newly
set bit be cleared or clobbered before __csid_aup_rup_trigger() is called,
causing the hardware to miss a buffer address update while
output->gen2.active_num is incremented?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-kaanapali-=
camss-v23-0-95f250b18612@oss.qualcomm.com?part=3D10
