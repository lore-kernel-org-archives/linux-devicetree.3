Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616998;
	b=Iha9nVb773RDn1EsGO4JqXB8WOpZMzhPep3rjO72ziPxlndN67g2tkq2IuSXH0a99+oe
	 nMi0OlP0HQzlxP2/WqG6UAeqxAPUbBH88JD/jcr3By6H4FwHaJb9QiDShKns3jikzIPm0
	 H6vLGoSnqgQk9uNbJVKluyx+R7aaz+Lt9Bk2M6+kDZj7gob2avKtQfEWBIfjGnnnDPTt/
	 UXnI4+DXUTZsDsyU/rzDMvpngmvvI5Wvn47dkMfPyyGuXHdp7LKLAYWTfXROo0KZ4Rwdi
	 PQODF0qE/o3ZuXSdrCBPX0T84+Zk00n8ROESXk1WJfJr2vnuQqNfJNF8HGgK0jW4HNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616998;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cDT1Bs08+9jkqNwANs+D7G9F4Db9tAFvcdQ40nj/kgc=;
	b=dOGrn1bqBtIszfEKIILlhW2Sb75zxi2cV2yRqb8dboQtVSV1iV8Yx2qkTUih8NpQEwUQ
	 nfA2wtyk/dnIKHIn5f15w14aae4bJmNdv0CfliOUzDfYHKehtyLTeJHEB+lCw37bmDZSI
	 TtDWCiBW2aP0KspiIguuhOMD94nbPqGnMypHKmr59JJdpYVsnS7/1oSEkZU7cybCkowwo
	 3P7VBVAMaoMs99jB9FPXVVtpv9i62BnPPClY+NgiY+NlYQehsZ5C3W/kLzRero598ij7e
	 UzSaqH88GVPjNBX7pIlbiW/TlW7dx7TcUbJ1Af/9JKJX/syB72vZ4jJh8A6j62iktcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zelz7x9n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30A3606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zelz7x9n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A77A1F00A17;
	Mon,  2 Nov 2026 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616997;
	bh=cDT1Bs08+9jkqNwANs+D7G9F4Db9tAFvcdQ40nj/kgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zelz7x9nG50un+AFoLr1zRjvPR2Y/CVhmM9MsDpexrJwgX0htRHS2utcGYRP9k73X
	 hVKD00meFI+qd4hdqc+EizmlvUeYIr/XhapFweY3p4uv9ZDdUI+ORexVI1E/aSHGyi
	 cwZpTFbPuSl8hVjHbUJyqJdMPMlZVt3eD0iPqyelDrJW174vT18ZCbPsSnOc5h+p71
	 WR387DO4U6tpjhd5PI0tyxOez21fYmyxwyX5R5XKuqFyA4pvbU8meXh+NvKGsv9Wi6
	 YGoIrIzLQwaGedCqDmM1gB4dIDn6sXSONi2vlmWA6BrEX1SOVNmqBaiNDvej/l5NsF
	 t5uZ+hoLwzLtQ==
Message-ID: <sashiko-outbox-193299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102-kaanapali-camss-v24-10-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-10-d6b8f3f6f66f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:56:36 +0000
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

commit fa6d43fd7f6f3cf7fc60f961a5b80cfe5e9e3b1c
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 1080

This commit adds support for the VFE 1080 (TFE) hardware block found on the
Qualcomm Kaanapali SoC, including register configuration and subdevice
resource definitions.

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
> +
> +static void vfe_addr_update_clear(struct vfe_device *vfe, enum vfe_line_=
id line_id)
> +{
> +	int port_id =3D line_id;
> +
> +	camss_addr_update(vfe->camss, vfe->id, port_id, true);
> +}

[Severity: High]
As reported by Sashiko on v14 [1], can vfe_reg_update() and vfe_addr_update=
()
race with csid_isr() in drivers/media/platform/qcom/camss/camss-csid-1080.c
when updating csid->reg_update and csid->addr_update?

In drivers/media/platform/qcom/camss/camss-vfe.c, vfe_enable_output_v2(),
vfe_queue_buffer_v2(), and vfe_buf_done() invoke vfe_reg_update() and
vfe_addr_update() while holding vfe->output_lock. These forward through
camss_reg_update() and camss_addr_update() to __csid_reg_update() and
__csid_addr_update() in drivers/media/platform/qcom/camss/camss-csid-1080.c:

    static void __csid_addr_update(struct csid_device *csid, int port_id)
    {
            csid->addr_update |=3D CSID_RUP_AUP_RDI(port_id);
            writel(csid->addr_update, csid->base + CSID_AUP_CMD);

            __csid_aup_rup_trigger(csid);
    }

Concurrently, when an end-of-frame interrupt fires with INFO_RUP_DONE set,
csid_isr() in drivers/media/platform/qcom/camss/camss-csid-1080.c clears
those fields without holding vfe->output_lock or any CSID lock before calli=
ng
camss_buf_done():

    if (val & INFO_RUP_DONE) {
            __csid_addr_update_clear(csid, i);
            __csid_reg_update_clear(csid, i);
    }

If userspace queues a buffer via VIDIOC_QBUF -> vfe_queue_buffer_v2() when
output->gen2.active_num =3D=3D 1 (or enables another RDI port on the same C=
SID
via VIDIOC_STREAMON -> vfe_enable_output_v2()) on one CPU while csid_isr()
processes INFO_RUP_DONE on another CPU, the unsynchronized read-modify-write
operations on csid->addr_update and csid->reg_update can clear a newly set
bit before writel() writes CSID_AUP_CMD or CSID_RUP_CMD, or clobber bits
across RDI ports. Would this cause the hardware to miss a buffer address
update while output->gen2.active_num is incremented, stalling capture?

[1] https://lore.kernel.org/r/20260601164403.8CE831F00893@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-kaanapali-=
camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=3D10
