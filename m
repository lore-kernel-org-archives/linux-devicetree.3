Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080512;
	b=ygNEyZ+y4heJ0EnBeQaa8HxVl2fQhqGdWwo0zGNeenuFSiqgdVkf0JodflyHlobmCMJG
	 OVqArDFD95Hj5eX929DdKO5hLzbutbqbB252yL99BKwidAj63hJTd53ws4PSpO3+Ez3an
	 VnTxSI/EMCcSQpfI6wybkhfkoQGTNSRHnVXYQ3MuxXajdVMp7Aic7iXWCc30oS3RoZ/gR
	 J090xyonONc+/ZLy7fw3nztPQ1/Ml9u9BgjLwnuFIAH2F0DnHrVRAf3QgZpiI3ty+SW7u
	 y8ZHS+0++Y0a796DV1ua+dmvb5phXyf2kE8yAtct83PrmErzSbGuBNKCbdMEMN7vizQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080512;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5j2odsEOe8Kv3U2t6RUZhVnZ7rpMWQTZBTqXzWu8+kE=;
	b=hnraXXJs6Y7hcJUiLCkEMbRKxIw/o8w3qXCQU9knM0gD7hBfKNH/6OLIfw9CvoulkHP0
	 ndgIhglQJKy8Vt8jPzk8FVcFt09Pq4eJAeH5fPI+fosMl0mTwdsn91bqOr2QY715osz5B
	 xydrdMLvWZOjVqDLyDuW3WzjR4EpP9MxMxV2sd4JgumPzOKON0KZa3FWoQtr5CVJsEPLV
	 kptMzf1fFQr7GMS5rZmkxcHZ/4miCBg2SrjzVLSuRozZ8R4pjuakiflaNmIpvzRWixDDA
	 DMVA5+dB66whSh2elmBga7D3XoSYvsdTvZmiOt3mVl7XTpGTj7kDBdhZ1kQEVN+HX8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BOnw3wkA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F92C606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BOnw3wkA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14AF1F000C4;
	Thu, 19 Nov 2026 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080512;
	bh=5j2odsEOe8Kv3U2t6RUZhVnZ7rpMWQTZBTqXzWu8+kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BOnw3wkAsi8YMEau9TFmWkq2au+U1puug18pSLrTruM5Nks91i85qUgNfcFANQuIp
	 KmQHk9N+43xOK0Y25o1gs0HEIZRP2+TSbw40D+0r2UG4auKvTER4xLcatwhjl/Guka
	 JfgJfH5kYayMVyMqMNoRJcLv/VXAX8GcC4Kh55KOV2sGM/LUR6kQVAD3SAYPNYKrHe
	 +8RGtIs/sOAJy+McjwMTyjpazKxUKh076luI/cCCzaj4PJrwJ6xfP+KnOVcXUw+nfb
	 Cf8xGaixNP12L/eu9yoOFmvU34yghxQoJ26mRXXtDUeUUxsXugJGfIcrPtih+DaAFp
	 lzrMvYDcaQ5aQ==
Message-ID: <sashiko-outbox-222834@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/6] coresight: qcom: add QDCP STM source
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-4-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-4-b1a730d2c57a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:28:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] coresight: qcom: path and refcount leak in qdcp_stm_remove()
- [Medium] coresight: qcom: sysfs enable_source race in
  qdcp_stm_remove()
- [Medium] coresight: qcom: premature CS_MODE_SYSFS transition in
  qdcp_stm_enable()
- [Medium] coresight: qcom-qdcp-stm: UAF of drvdata and csdev after
  qdcp_stm_remove()
--

commit 70d23454ea311ef6b9bc809416627572cf195a8d
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: qcom: add QDCP STM source

This commit adds a Qualcomm CoreSight STM source driver that maps the
AP-visible stimulus aperture and delegates STM enable and disable
operations to QECP firmware via QDCP.

> diff --git a/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c b/driv=
ers/hwtracing/coresight/coresight-qcom-qdcp-stm.c
> new file mode 100644
> index 0000000000000..39c6a2798a0f9
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c
> @@ -0,0 +1,550 @@

[ ... ]

> +static int qdcp_stm_enable(struct coresight_device *csdev,
> +			   struct perf_event *event, enum cs_mode mode,
> +			   struct coresight_path *path)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +	int ret;
> +
> +	if (mode !=3D CS_MODE_SYSFS)
> +		return -EINVAL;
> +
> +	if (!coresight_take_mode(csdev, mode))
> +		return -EBUSY;
> +
> +	drvdata =3D dev_get_drvdata(csdev->dev.parent);
> +
> +	mutex_lock(&drvdata->qdcp.lock);
> +	ret =3D qdcp_stm_source_enable(drvdata->qdcp.provider, drvdata->qdcp.id,
> +				     drvdata->traceid, drvdata->port_mask,
> +				     false);
> +	if (!ret)
> +		drvdata->fw_stop_failed =3D false;
> +	mutex_unlock(&drvdata->qdcp.lock);
> +	if (ret) {
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
> +		return ret;
> +	}
> +
> +	dev_dbg(&csdev->dev, "QDCP STM tracing enabled\n");
> +	return 0;
> +}
> +
> +/*
> + * The CoreSight source disable op returns void and the user has already=
 torn
> + * the path down, so the source always ends up disabled from Linux's poi=
nt of
> + * view. Return the firmware result so the caller can at least report it.
> + */
> +static int qdcp_stm_disable_source(struct coresight_device *csdev)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata;
> +	struct qdcp_data *qdcp;
> +	u64 source_id;
> +	u8 traceid;
> +	int ret;
> +
> +	if (coresight_get_mode(csdev) !=3D CS_MODE_SYSFS)
> +		return 0;
> +
> +	drvdata =3D dev_get_drvdata(csdev->dev.parent);
> +	qdcp =3D drvdata->qdcp.provider;
> +	source_id =3D drvdata->qdcp.id;
> +	traceid =3D drvdata->traceid;
> +
> +	mutex_lock(&drvdata->qdcp.lock);
> +	ret =3D qdcp_stm_source_disable(qdcp, source_id, traceid, false);
> +	drvdata->fw_stop_failed =3D !!ret;
> +	mutex_unlock(&drvdata->qdcp.lock);
> +
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
> +	dev_dbg(&csdev->dev, "QDCP STM tracing disabled\n");
> +	return ret;
> +}

[Severity: Medium]
Can qdcp_stm_packet() write to drvdata->stimulus_base while the STM block
is still unclocked or disabled by firmware?

qdcp_stm_packet() is lockless and checks only coresight_get_mode(csdev)
before performing MMIO writes to drvdata->stimulus_base.  Unlike
coresight-stm, QECP firmware controls the block's clocks and power over
sleeping QMI calls:

CPU0                              CPU1
qdcp_stm_enable()
  coresight_take_mode(...,
    CS_MODE_SYSFS)
  qdcp_stm_source_enable()
    /* sleeping QMI RPC */
                                  qdcp_stm_packet()
                                    coresight_get_mode() =3D=3D CS_MODE_SYS=
FS
                                    qdcp_stm_send(channel_addr, ...)
                                      <-- MMIO write before firmware
                                          enables STM clocks/power

The same window exists in qdcp_stm_disable_source(), where csdev->mode
remains CS_MODE_SYSFS until after qdcp_stm_source_disable() completes.
On Qualcomm SoCs, MMIO accesses to an unclocked CoreSight aperture can
cause a synchronous external abort or bus hang.

[ ... ]

> +static void qdcp_stm_remove(struct platform_device *pdev)
> +{
> +	struct qcom_qdcp_stm_drvdata *drvdata =3D platform_get_drvdata(pdev);
> +
> +	/*
> +	 * Unregister the STM first: its unlink callback disables the source
> +	 * through drvdata->csdev, which must still be live.
> +	 */
> +	stm_unregister_device(&drvdata->stm);

[Severity: Medium]
Can closing an open /dev/qdcp_stmN file descriptor after qdcp_stm_remove()
cause a use-after-free on drvdata and drvdata->csdev?

Unbinding the qcom-qdcp supplier triggers qdcp_stm_remove() via the
DL_FLAG_AUTOREMOVE_CONSUMER device link created by devm_qdcp_get().
stm_unregister_device() only unlinks in-kernel stm_source devices on
stm->link_list; any open userspace struct stm_file still holds stmf->stm
with stm->data pointing to &drvdata->stm:

drivers/hwtracing/stm/core.c:stm_char_release() {
	struct stm_file *stmf =3D file->private_data;
	struct stm_device *stm =3D stmf->stm;

	if (stm->data->unlink)
		stm->data->unlink(stm->data, stmf->output.master,
				  stmf->output.channel);
    ...
}

After qdcp_stm_remove() unregisters drvdata->csdev and devres frees
drvdata, closing the open file descriptor calls qdcp_stm_unlink() ->
coresight_disable_sysfs(drvdata->csdev) on freed memory.

> +
> +	/*
> +	 * No-op unless the source is still in CS_MODE_SYSFS. Without it,
> +	 * removing an enabled source would leave firmware STM enabled.
> +	 */
> +	qdcp_stm_disable_source(drvdata->csdev);

[Severity: Medium]
Does calling qdcp_stm_disable_source() here instead of
coresight_disable_sysfs() leak csdev->path and leave downstream CoreSight
components enabled?

When the source is enabled in CS_MODE_SYSFS (for example via the sysfs
enable_source attribute), coresight_enable_sysfs() builds csdev->path,
enables the sink and links, and takes device, module, and runtime PM
references on every component in the path via coresight_grab_device().
Calling qdcp_stm_disable_source() directly only disables the source in
firmware and sets csdev->mode to CS_MODE_DISABLED without calling
coresight_disable_path() or coresight_release_path_locked(), leaking the
path and the get_device(&csdev->dev) reference on drvdata->csdev itself.

> +
> +	/*
> +	 * A stop that failed here or earlier (fw_stop_failed) means firmware
> +	 * may still be tagging trace with this ID. Keep it allocated rather
> +	 * than let another source reuse it.
> +	 */
> +	if (drvdata->fw_stop_failed)
> +		dev_warn(&pdev->dev,
> +			 "QDCP STM not confirmed stopped, leaking trace ID %u\n",
> +			 drvdata->traceid);
> +	else
> +		coresight_trace_id_put_system_id(drvdata->traceid);
> +
> +	coresight_unregister(drvdata->csdev);
> +}

[Severity: Medium]
What prevents sysfs enable_source_store() from racing with
qdcp_stm_remove() before coresight_unregister() removes the sysfs
attribute?

Because coresight_unregister() runs last and qdcp_stm_remove() does not
hold coresight_mutex, enable_source Remains accessible while
qdcp_stm_remove() disables the source and releases drvdata->traceid:

CPU0                              CPU1
qdcp_stm_remove()
  qdcp_stm_disable_source()
                                  enable_source_store()
                                    coresight_enable_sysfs()
                                      qdcp_stm_enable()
                                        qdcp_stm_source_enable(...,
                                          drvdata->traceid, ...)
                                        drvdata->fw_stop_failed =3D false
  if (drvdata->fw_stop_failed)
  else
    coresight_trace_id_put_system_id(
      drvdata->traceid)
      <-- trace ID freed while
          firmware is enabled
  coresight_unregister(csdev)

Unregistering drvdata->csdev before releasing drvdata->traceid (or
tearing down the sysfs session under coresight_mutex during
unregister) would close this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-introduce-=
qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com?part=3D4
