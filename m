Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845206;
	b=vpOjUkEcEUs6svaBTrsOZtCkSM+UHWfQl9CFz7BtGCBow9D2aVtUjTL9nT9JBsdkOCZP
	 oX2J1rELUdfnk9wQXHucYJCBuhZulLfSLo8oQi+19cvcFnRkTiyuRSshp1P4mUIaLoLhb
	 q9a7JH86AqI4fHFQ6PROcTQRXoDY5Rozj2s/874+hczQwblIqwE5lJNm3X5oHPMS3GcYU
	 goEdrvbF1QFG4wDGzAQSHCw0P46kSWFFeEINrMouDsF4u16sECYaGIZ7c0lvUFkuUgJRR
	 vospvIiuWaniisUwr0I8zZP4hJDuRAKH0batTf8bG48faSadk5OUSnyg1wK3GWNZ2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845206;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hb1bTNHLdhj1/DC9MBQeme22v2W+eWYJPzYyEpAFjGQ=;
	b=mS3SjeFMSkxXusuWN9N4w7zKVIELafK56seOLo6KJO0p14j4AHp5KPW99+Cq29/fafpx
	 XxGFIGxU6dGfa67ggMQyMCidUya3sSE9Hla312Yhghzrn4hdQvUx33ROBZAEBwwUcrhkz
	 3a+tKW33JS+waBB4TegrvzKSmwS0eZexPM30kMsaOBlUga0INoTVHhaIpKj9zaIP5YzrH
	 nQPyQ0EwlJDdIYWQhSIIHUvflkKePMcYEs+w4rMMkQFLru89SbxmdVZsoxbpGQYmw7p82
	 LM4fwHcGRl5TR91m36aDaEtYTIH4Vs8+JwG9zoreiJi/fAPMjojLtblybzNEp0lCibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ANKIZ/op";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA64606A322
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANKIZ/op
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EB21F000C4;
	Mon, 16 Nov 2026 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794845205;
	bh=Hb1bTNHLdhj1/DC9MBQeme22v2W+eWYJPzYyEpAFjGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ANKIZ/opjkw9tVdKvMM9b3LWphguxhLocd/ra39orvCbceNKEr64rVet/83j605nv
	 WNQmlE6rN63VyUnTup/Y1l4Er8oDw2o6oyjP7szkMWK2D5UXE4J2ljULOl5W9qJPsp
	 Mspjh/T+0Fc3pxVgA/2J46J65qxw1dJqRA0OGQ8HaZGjiQzs/TAmViHACqNUX9UOGD
	 Nm3dvteADv5WxvZdicpUFNHy2lzDoUzZNGGqQmpV9uy3IcmhlyD5DiEgsi1jU+CnFV
	 u78ydHmFHeOFaCwMzWJIS6xJE2LRb+BJFEWT9r8HRYFKKAnSbk6qIwAQFkH8OJQskJ
	 Ecusgm9Z/L4aQ==
Message-ID: <sashiko-outbox-217338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] remoteproc: qcom_q6v5_mss: Publish socinfo for
 Pixel modems
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-modemsmem-v3-2-24ebc7ed6eb9@ixit.cz>
References: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
 <20261116-modemsmem-v3-2-24ebc7ed6eb9@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 16:06:43 +0000
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
- [Medium] remoteproc: qcom_q6v5_mss: dev_err_probe() used in runtime
  q6v5_start()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] remoteproc: qcom_q6v5_mss: missing need_pas_mem_setup
  assignment in q6v5_probe() [1]
--

commit b9f47173917266b645cba443348a310e5cf36ef0
Author: David Heidelberg <david@ixit.cz>

remoteproc: qcom_q6v5_mss: Publish socinfo for Pixel modems

This commit publishes SoC platform type, subtype, and revision fields from
SMEM socinfo into vendor SMEM item 134 before starting the modem when the
"google,require-socinfo" property is present.

> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index dd052a62b8583..53deabea62259 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
[ ... ]
> @@ -1673,12 +1682,76 @@ static void qcom_q6v5_dump_segment(struct rproc *=
rproc,
>  	}
>  }
> =20
> +/* Layout of the vendor-defined SMEM item read by the Pixel modem firmwa=
re */
> +struct modem_smem_info {
> +	__le32 version;
> +	__le32 modem_flag;
> +	__le32 major_id;
> +	__le32 minor_id;
> +	__le32 subtype;
> +	__le32 platform;
> +	__le32 efs_magic;
> +	__le32 ftm_magic;
> +};
> +
> +#define MODEM_SMEM_VERSION	0
> +#define PLAT_VER_TO_MAJOR_ID(v)	(((v) >> 16) & 0xff)
> +#define PLAT_VER_TO_MINOR_ID(v)	((v) & 0xff)
> +
> +static int q6v5_socinfo_publish(struct q6v5 *qproc)
> +{
> +	struct modem_smem_info *info;
> +	struct socinfo *socinfo;
> +	u32 plat_ver;
> +	int ret;
> +
> +	socinfo =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL=
);
> +	if (IS_ERR(socinfo))
> +		return dev_err_probe(qproc->dev, PTR_ERR(socinfo),
> +				     "could not get socinfo\n");
> +
> +	/* hw_plat_subtype was added in socinfo format 0.6 */
> +	if (le32_to_cpu(socinfo->fmt) < SOCINFO_VERSION(0, 6))
> +		return dev_err_probe(qproc->dev, -EOPNOTSUPP,
> +				     "socinfo format too old\n");
> +
> +	/* -EEXIST: the item survived an earlier boot */
> +	ret =3D qcom_smem_alloc(QCOM_SMEM_HOST_ANY, SMEM_ID_VENDOR0, sizeof(*in=
fo));
> +	if (ret && ret !=3D -EEXIST)
> +		return dev_err_probe(qproc->dev, ret,
> +				     "could not allocate modem smem\n");
> +
> +	info =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_ID_VENDOR0, NULL);
> +	if (IS_ERR(info))
> +		return dev_err_probe(qproc->dev, PTR_ERR(info),
> +				     "could not get modem smem\n");
> +
> +	plat_ver =3D le32_to_cpu(socinfo->plat_ver);
> +
> +	/* modem_flag, efs_magic and ftm_magic are left zero */
> +	*info =3D (struct modem_smem_info) {
> +		.version   =3D cpu_to_le32(MODEM_SMEM_VERSION),
> +		.major_id  =3D cpu_to_le32(PLAT_VER_TO_MAJOR_ID(plat_ver)),
> +		.minor_id  =3D cpu_to_le32(PLAT_VER_TO_MINOR_ID(plat_ver)),
> +		.subtype   =3D socinfo->hw_plat_subtype,
> +		.platform  =3D socinfo->hw_plat,
> +	};
> +
> +	return 0;
> +}
> +
>  static int q6v5_start(struct rproc *rproc)
>  {
>  	struct q6v5 *qproc =3D rproc->priv;
>  	int xfermemop_ret;
>  	int ret;
> =20
> +	if (qproc->need_socinfo) {
> +		ret =3D q6v5_socinfo_publish(qproc);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
Should q6v5_socinfo_publish() use dev_err() instead of dev_err_probe(), or =
be
called from q6v5_probe()?

Because q6v5_probe() sets rproc->auto_boot =3D false, q6v5_start() ->
q6v5_socinfo_publish() only runs at runtime when the remoteproc is booted or
recovered.  If qcom_smem_get() or qcom_smem_alloc() returns -EPROBE_DEFER at
that point (q6v5_probe() does not check qcom_smem_is_available()),
dev_err_probe() demotes the log to debug level, returns -EPROBE_DEFER to
rproc_boot(), and allocates qproc->dev->p->deferred_probe_reason, which is
leaked because the already-bound device is never placed on
deferred_probe_pending_list.  If qcom_smem_alloc() returns -ENOMEM when the
SMEM heap is full, dev_err_probe() also suppresses the error message.

> @@ -2132,6 +2205,8 @@ static int q6v5_probe(struct platform_device *pdev)
>  	qproc->has_ext_cntl_regs =3D desc->has_ext_cntl_regs;
>  	qproc->has_vq6 =3D desc->has_vq6;
>  	qproc->has_spare_reg =3D desc->has_spare_reg;
> +	qproc->need_socinfo =3D
> +		of_property_read_bool(pdev->dev.of_node, "google,require-socinfo");
>  	ret =3D q6v5_init_mem(qproc, pdev);
>  	if (ret)
>  		return ret;

[Severity: High]
This problem wasn't introduced by this patch, but does q6v5_probe() forget =
to
copy desc->need_pas_mem_setup into qproc->need_pas_mem_setup [1]?

q6v5_probe() checks desc->need_pas_mem_setup for early probe deferral, but
never assigns it to qproc:

drivers/remoteproc/qcom_q6v5_mss.c:q6v5_probe() {
	...
	if (desc->need_pas_mem_setup && !qcom_pas_is_available())
		return -EPROBE_DEFER;
	...
	qproc->version =3D desc->version;
	qproc->need_mem_protection =3D desc->need_mem_protection;
	qproc->has_mba_logs =3D desc->has_mba_logs;
	...
}

As a result, qproc->need_pas_mem_setup stays false in q6v5_mpss_init_image()
and qcom_scm_pas_mem_setup() is skipped on platforms that set
need_pas_mem_setup (such as SDM632), preventing the modem from authenticati=
ng
and booting.

[1] https://sashiko.dev/#/bug/linux-83fcbc28-236c-48e4-a6bd-731f4361f9ae

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-modemsmem-=
v3-0-24ebc7ed6eb9@ixit.cz?part=3D2
