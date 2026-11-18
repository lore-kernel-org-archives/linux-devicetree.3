Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019052;
	b=IiM+shgapAWrAaNsXq6rXs6TZvlMvwWpUuVnFiDUYg1C9O2Q2xvjelTPS+cdhw35xbIP
	 naShJd1nIiLeX1NRepzJrZrMetKHv0Bx26R9qzNvV/mY3v7lD0omH8eRNVekxLwXRTndi
	 K5/3bx903DkWzD/59MSl9FqUAK+p7fm6xRB32Joabqa402dOQYlx7oxR8HKd7V5Nl6bXp
	 NzDdUxfbL+U57vpxGa7NFwScJiN7S+6/dPifJLxim34nWCfwvbnUPEAbtv1/04yoPgGZV
	 fvM18nIi62/hLh2ZxtREqC8V08tNCrtkjyzE9KCz99lt0QNY3ZnbKFpHGYN+ieRg4FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019052;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=npeRd4S+AaqveR0TuES6W42ctUHVu7TQCZmQCCxFsek=;
	b=0gPBTG+REpo3g8H8E44PmXIaSqOfLw6Bs+AVVUkhbiX12ptgTdRe3afTAdwct6dt6g7X
	 ucR7qOODKCyHx9yTlIqbDjn69CKWnpJPF+/nvpjKxIh6yYbhvsY47Z0W+kjC6WanSUChj
	 97Aqsm5fI8v1I0dVVsQwVqbCcWGCNg2viYuClCsYjYTQ6PUI8nmPtczgOrs/+t9RctXwE
	 R3u+eeoLe629R5bTBw2FHkq1SK4kNE3kogmk7+6HPeKJPeBQc415XVkAUHQfKnnA++zED
	 09luMwKx/rU5KP89J2HPfh6NhXbiiUKgaU0GsashxFoXvTgAkPv1E75niAn7PXYfCqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TswCdPpu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866CF606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TswCdPpu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B324B1F000C5;
	Wed, 18 Nov 2026 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019052;
	bh=npeRd4S+AaqveR0TuES6W42ctUHVu7TQCZmQCCxFsek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TswCdPpuHkdyN10HBExpOFI7oeH5OmTSc+sYoi65Jg/pS6CbZqjZqKqWVeMgVYrlh
	 VvIeonjbsWTqLwRcC2lVM5xIiyFLFJrWesOezStmIM9XW3O/wl/c4Vlk1OkIaWfOht
	 QDSyFSl646XmKdTuTNlhNhW7RTByipfAxXbTo2rISWYz9T1FgFJ2s6T1enCJzvC4pF
	 nikLo4Ns9EhFVlJ+V+ZDci6b0VAMKaPOMlFB4hr/yTleuYNGqjSy6bePxm6J3olIDI
	 3ezOmkr3WeX4YQdsLDYukDcaS0zS6mRk77JMXJAbsXCNs8l12FyGjCFny2nNDBSchg
	 ZuiGYr4A1AskA==
Message-ID: <sashiko-outbox-221469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-oob-support-glymur-v3-4-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
 <20261118-oob-support-glymur-v3-4-2cbdfe208d56@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 16:24:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] remoteproc: qcom: pas: broken secondary dump segments in
  qcom_pas_load()
- [Medium] remoteproc: qcom: pas: secondary shutdown errors lost in
  qcom_pas_stop()
- [Medium] remoteproc: qcom: pas: firmware leak after qcom_pas_load() on
  start error
--

commit 3641ec429dbae3576cd54c539314ea4edd45ce32
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

This commit adds PAS resource parameters and the qcom,glymur-oobmss-pas
compatible entry for the OOBMSS subsystem on Glymur platforms.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index a167bd6072c94..5cc529e2923ca 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -2182,6 +2182,30 @@ static const struct qcom_pas_data kaanapali_soccp_=
resource =3D {
>  	.early_boot =3D true,
>  };
> =20
> +static const struct qcom_pas_data glymur_oobmss_resource =3D {
> +	.crash_reason_smem =3D 669,
> +	.firmware_name =3D "oobmss_tee.mbn",
> +	.dtb_firmware_name =3D "oobmss_qc_dtb.mbn",
> +	.secondary_firmware_name =3D "oobmss_ns.mbn",
> +	.secondary_dtb_firmware_name =3D "oobmss_oem_dtb.mbn",
> +	.pas_id =3D 0x42,
> +	.dtb_pas_id =3D 0x43,
> +	.secondary_pas_id =3D 0x44,
> +	.secondary_dtb_pas_id =3D 0x45,

[Severity: Medium]
Can this leak pas->secondary_dtb_firmware, pas->secondary_firmware and
pas->dtb_firmware if starting the remoteproc fails after qcom_pas_load()
succeeds?

qcom_pas_load() requests all three firmware blobs, while
qcom_pas_release_firmware() is only called from qcom_pas_start() on
success or under its disable_irqs error label.  If
rproc_prepare_subdevices() fails in rproc_start() before calling
qcom_pas_start(), rproc_fw_boot() unwinds through qcom_pas_unprepare(),
which releases metadata contexts without calling
qcom_pas_release_firmware().  In addition, if qcom_q6v5_prepare() fails at
the start of qcom_pas_start(), it returns early before disable_irqs,
leaking the three struct firmware allocations and leaving pas->firmware
dangling:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_start() {
	...
	ret =3D qcom_q6v5_prepare(&pas->q6v5);
	if (ret)
		return ret;
	...
disable_irqs:
	qcom_q6v5_unprepare(&pas->q6v5);
	qcom_pas_release_firmware(pas);
	...
}

> +	.proxy_pd_names =3D (char *[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name =3D "oobmss",
> +	.sysmon_name =3D "oobmss",
> +	.ssctl_id =3D 0x21,
> +	.auto_boot =3D true,
> +	.early_boot =3D true,

[Severity: Medium]
How are coredump segments handled across attach and crash recovery when
both secondary_pas_id and early_boot are enabled?

Primary dump segments are registered in qcom_pas_parse_firmware()
(rproc->ops->parse_fw), whereas secondary dump segments are registered in
qcom_pas_load() (rproc->ops->load):

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_load() {
	...
	if (pas->secondary_pas_id) {
		ret =3D qcom_register_dump_segments(rproc, pas->secondary_firmware);
	...
}

With early_boot set, qcom_pas_probe() starts in RPROC_DETACHED and
rproc_boot() attaches via rproc_attach() -> qcom_pas_attach() without
calling parse_fw or load, leaving rproc->dump_segments empty so
qcom_pas_coredump() skips dumping on the first crash.  During recovery,
rproc_boot_recovery() runs rproc_start() -> rproc_load_segments() ->
qcom_pas_load() without calling rproc_resource_cleanup() or
rproc_parse_fw().  As a result, primary dump segments are still missing
after recovery from early_boot attach, and each subsequent crash recovery
appends another duplicate set of secondary dump segments to
rproc->dump_segments.

> +	.needs_tzmem =3D true,
> +	.decrypt_shutdown =3D true,
> +};

[Severity: Medium]
Does qcom_pas_stop() discard shutdown errors from pas->secondary_pas_id
and pas->secondary_dtb_pas_id?

Unlike the pas->dtb_pas_id block, which saves its status in dtb_ret and
preserves an earlier error, qcom_pas_stop() reuses ret and unconditionally
overwrites it when shutting down pas->secondary_dtb_pas_id and
pas->pas_id:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
	...
	if (pas->secondary_pas_id) {
		ret =3D qcom_pas_shutdown(pas->secondary_pas_id);
		if (ret && pas->decrypt_shutdown)
			ret =3D qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
		...
	}

	if (pas->secondary_dtb_pas_id) {
		ret =3D qcom_pas_shutdown(pas->secondary_dtb_pas_id);
		...
	}

	ret =3D qcom_pas_shutdown(pas->pas_id);
	...
}

If shutting down secondary_pas_id or secondary_dtb_pas_id fails while
pas_id and dtb_pas_id succeed, qcom_pas_stop() returns 0.  During
rproc_boot_recovery(), a masked stop failure lets execution continue into
qcom_pas_coredump(), which maps pas->secondary_pas_ctx and reads
pas->secondary_mem_region even though the secondary PAS shutdown failed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-oob-suppor=
t-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com?part=3D4
