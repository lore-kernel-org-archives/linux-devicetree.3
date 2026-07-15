Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F85333730
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094502; cv=none; b=EHK4ZhCRsxGDdxbIvK0VniIQK7eX/9RTsmyGzAxD+YfBZx/1TK1d/7cNkCcHFhdZct2fKO+i90nhRYL9HdWb/4A7p0yH+JGQY3pKn9rK+rlbuGYiJVrB8xPjusActbphkRw6Wuchxc+NkeJShJwMOp2N/V05tdH7B6dRJz05i3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094502; c=relaxed/simple;
	bh=GAZ0Y3iPrj6DDwbnrDZzz6q3wXhvdW+e21celXA08h8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sv7r2GF120SX0ysOpyXG0fz4ImN3u6GyU3flCkfazwskNPbByPnonasTRYkIN+q8wJf4WCK9ZVga8qcKzVhS5RhQ73Tu801eG7rjxm/VcXBO0VS3az0scZ8NgVv7Yr+j91vEku+CzoHffwHdZbE3B916TKSzpiQ0c1x5NMd+rDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ewx2++sJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ewx2++sJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E992E1F000E9;
	Wed, 15 Jul 2026 05:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784094501;
	bh=bSECXrZrArgCHByEHWyICfBzb4C2RFu+jOqsbo2cEnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ewx2++sJpOuCmiFxQ89akKE4hHPBfBc8ot2cvLWL42djedJUN855byYmbcq08gV3E
	 l+Vrt7Yju7jlPS19zH92MSq63hExt2N9rnGqmOxTS94yUBqht+WSdLokCRzru5f6io
	 Ev9dOz+EuaIXHCdM/9c5XZBggRBRUUVRKul3RO9hq8YxgWdr92S+MRFRrr5M10TUx+
	 4aIT3XRnxViUMJ8JKZpvL7en475v023NprrEEwH2WS6cR1JVhsdI8ax5NMDiNn8/bT
	 e2uYQAXHEqiRiTJv2d4iy4Z7y7H5IDfRmNQWec0hzu25NLNRZ0JnacnEOHShb5cW7n
	 E8ILueSN95Ghw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio capture
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715051939.64652-3-royalnet026@gmail.com>
References: <20260715051939.64652-1-royalnet026@gmail.com>
 <20260715051939.64652-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 05:48:20 +0000
Message-Id: <20260715054820.E992E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Passing an ERR_PTR to platform_device_unregister() causes a kernel=
 panic during module removal.
- [High] Flawed teardown ordering and failure to clear the audio_streaming =
flag in hdmirx_remove() allows the delayed work to re-arm, leading to a Use=
-After-Free.
- [High] Concurrent unprotected access to shared audio state variables betw=
een ALSA `hw_params` and the background worker.
- [Medium] Unconditional access to `clks[1]` causes an out-of-bounds read i=
f the Device Tree specifies only one clock.
- [Low] The audio worker item silently migrates from an unbound workqueue t=
o the default CPU-bound workqueue after its first execution.
--

--- Patch [2]: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio capt=
ure support ---
commit a0cbe815be5692f1b4e770ef5f613ff1fa0b7862
Author: Igor Paunovic <royalnet026@gmail.com>

media: synopsys: hdmirx: add HDMI audio capture support

The Synopsys DesignWare HDMI RX controller extracts the audio stream
embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
controller. Expose it as an ALSA capture device by registering the
generic hdmi-codec as a child of the controller.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

[ ... ]

> +static void hdmirx_audio_clk_ppm_inc(struct snps_hdmirx_dev *hdmirx_dev,=
 int ppm)
> +{
> +	int delta, inc;
> +	long rate =3D hdmirx_dev->audio_clkrate;
> +
> +	if (ppm < 0) {
> +		ppm =3D -ppm;
> +		inc =3D -1;
> +	} else {
> +		inc =3D 1;
> +	}
> +	delta =3D (int)div64_u64((u64)rate * ppm + 500000, 1000000);
> +	delta *=3D inc;
> +	rate =3D hdmirx_dev->audio_clkrate + delta;
> +	clk_set_rate(hdmirx_dev->clks[1].clk, rate);

[Severity: Medium]
Does this code access the clock array out of bounds if the device tree only
provides one clock?

The probe function uses devm_clk_bulk_get_all() which only guarantees
num_clks >=3D 1, but this unconditionally accesses index 1.

> +	hdmirx_dev->audio_clkrate =3D rate;
> +}

[ ... ]

> +static void hdmirx_audio_work(struct work_struct *work)
> +{

[ ... ]

> +	/* Only re-arm while streaming; avoids a self-reschedule race with
> +	 * cancel_delayed_work_sync() in audio_shutdown().
> +	 */
> +	if (READ_ONCE(hdmirx_dev->audio_streaming))
> +		schedule_delayed_work(&hdmirx_dev->audio_work,
> +				      msecs_to_jiffies(delay));

[Severity: Low]
Does this cause the worker to silently migrate to the default system_wq?

The worker is initially queued on system_unbound_wq using mod_delayed_work(=
),
but schedule_delayed_work() implicitly targets the default CPU-bound
workqueue.

> +}
> +
> +static int hdmirx_audio_hw_params(struct device *dev, void *data,
> +				  struct hdmi_codec_daifmt *fmt,
> +				  struct hdmi_codec_params *hparms)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> +	u32 fs;
> +
> +	fs =3D hdmirx_audio_fs(hdmirx_dev);
> +	if (!fs)
> +		fs =3D hparms ? hparms->sample_rate : 48000;
> +	if (!fs)
> +		fs =3D 48000;
> +
> +	hdmirx_dev->audio_fs =3D fs;
> +	hdmirx_dev->audio_clkrate =3D fs * 128;

[Severity: High]
Can concurrent ALSA hw_params ioctl calls race with the background worker h=
ere?

ALSA allows consecutive hw_params calls, which could modify audio_fs,
audio_clkrate, and audio_pre_state locklessly while the worker is already
executing on another CPU.=20

Could this concurrent access result in an invalid clock frequency calculati=
on?

> +	clk_set_rate(hdmirx_dev->clks[1].clk, fs * 128);
> +
> +	hdmirx_audio_fifo_reinit(hdmirx_dev);
> +	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR_PASS, HDMIRX_AUDIO_INIT_FIFO_S=
TATE);
> +	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR,
> +		      AFIFO_THR_LOW_QST(0x20) | AFIFO_THR_HIGH_QST(0x160));
> +	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_MUTE_THR,
> +		      AFIFO_THR_MUTE_LOW_QST(0x8) | AFIFO_THR_MUTE_HIGH_QST(0x178));
> +
> +	hdmirx_update_bits(hdmirx_dev, AUDIO_PROC_CONFIG0, I2S_EN, I2S_EN);
> +	hdmirx_update_bits(hdmirx_dev, GLOBAL_SWENABLE, AUDIO_ENABLE, AUDIO_ENA=
BLE);
> +
> +	hdmirx_dev->audio_pre_state =3D 0;
> +	WRITE_ONCE(hdmirx_dev->audio_streaming, true);
> +	mod_delayed_work(system_unbound_wq, &hdmirx_dev->audio_work,
> +			 msecs_to_jiffies(200));
> +
> +	dev_dbg(dev, "audio hw_params: fs=3D%u\n", fs);
> +	return 0;
> +}

[ ... ]

> @@ -2765,6 +3001,10 @@ static int hdmirx_probe(struct platform_device *pd=
ev)
>  						       V4L2_DEBUGFS_IF_AVI, hdmirx_dev,
>  						       hdmirx_debugfs_if_read);
> =20
> +	ret =3D hdmirx_register_audio_device(hdmirx_dev);
> +	if (ret)
> +		dev_warn(dev, "failed to register HDMI audio codec: %d\n", ret);
> +

[Severity: High]
If platform_device_register_full() fails in hdmirx_register_audio_device(),=
=20
it returns an ERR_PTR which is stored in hdmirx_dev->audio_pdev.=20

Since this failure only logs a warning and allows the probe to succeed, won=
't=20
the check in hdmirx_remove() evaluate to true?

if (hdmirx_dev->audio_pdev)
    platform_device_unregister(hdmirx_dev->audio_pdev);
           =20
Will this cause a kernel panic when platform_device_unregister() attempts t=
o=20
dereference the ERR_PTR?

>  	return 0;
> =20
>  err_unreg_video_dev:
> @@ -2784,6 +3024,10 @@ static void hdmirx_remove(struct platform_device *=
pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> =20
> +	cancel_delayed_work_sync(&hdmirx_dev->audio_work);
> +	if (hdmirx_dev->audio_pdev)
> +		platform_device_unregister(hdmirx_dev->audio_pdev);
> +

[Severity: High]
Could the worker re-arm itself after this cancelation?

If the worker is running during removal, cancel_delayed_work_sync() waits f=
or
it to finish. However, because audio_streaming is not set to false prior to
this call, the worker will see audio_streaming =3D=3D true and re-arm itsel=
f.

Additionally, since platform_device_unregister() is called after the timer
cancelation, could userspace trigger a concurrent hw_params ioctl and re-arm
the timer through that path?

Will the re-armed timer execute on freed memory after the device is removed?

>  	v4l2_debugfs_if_free(hdmirx_dev->infoframes);
>  	debugfs_remove_recursive(hdmirx_dev->debugfs_dir);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.6465=
2-1-royalnet026@gmail.com?part=3D2
