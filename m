Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426074;
	b=lioYZ8dY3/eVSKZ9CMuCASRRqzfBwoCe6M/wFLULDAMoFAhhrlsLBKLodlNkyyZ6Qz2W
	 R6+HTQjWnl2eZkS/mH6gs5uVAl61xnqPX8GY42IiaTUMnmnUaRvVzxifoHYmoeqVTQztd
	 6pa1O0RyXbW9oEp+AClru5jB65dtNfSfOinhPxB2wuFU1JZlSNn19BlWwPFiS3c8FZOte
	 aKLiVQF/Ed86c5GNlvyDRZ3agmtpFiDO4t4wJpTh2aY4LRC0la5tU/4oFmGHq580kdJrc
	 3wAyBDWhPb+CDDxIUY5qpp/EIWGEVS5fSvDumt3NWfHBa3Y5Im/LIXxOvEpRZsTpHbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426074;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GtWfukhIEwc+l8xmfj2TM4OukF0kwJZosAynt1fBpQw=;
	b=Z0pcq3MW/x9J7vaSzo/XZMu4d9HwFiy7bEvBabxJ1ZpJySVWnUsBgLuJx6utSrCesRE7
	 T6ZvTrzCF0LRPy+LY0kfQvuT9sTd4/PPvUfLzqSclCCMJOlzOxvsXnUv3IvPs7gaUGSoQ
	 yELftfNW8zwNwIhxbPo3Y1ZoKrBQyqZMXsPVvIxtP/lOSPpbSwzCKsuSeVfw9K2Xms5VP
	 Wp4K57Fj9GYbntp8XqrtrPLNp7x5ripgBtFro10aTSS6Ws/yv2ogqEYjvlM7UPSrtcePM
	 oaMc67mBQjVt5LartxFkyWk/QnLyfqloIXDM4wt+BPkAFFZ1CQBjz8x86J11j96e0Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTKpXMCD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E56606AAD0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTKpXMCD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCF91F000C4;
	Mon, 19 Oct 2026 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426074;
	bh=GtWfukhIEwc+l8xmfj2TM4OukF0kwJZosAynt1fBpQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTKpXMCDdHBExk0exXa2KbQG20SX+S+e1F6nT8cmluwptJ5B88yInIEc5vgK/kElR
	 9nmVIJPkEB/gmGvwjFh7zy7sDR4OssDNSfpSxfTU9/+mfmovtf36gJmi3pECSo8f6h
	 tFDA7lw7jiUlJRePZ//H/WmfkXvZwO5ejudDOXQFaTb//k7GIfbPGOSsgIkF7XYL8/
	 0lPXsC+vGZY97Ho7YXR7YdX2owOjEKhPkDnDOlKUdNU/gMwGbpKsW8kO6BvZB/Dt7k
	 k/wmfCREyWPuXAv/FghuIq7/09UA2ZKMxZ1pCzKa9zZJBUlYuYhmX3bOOWq9K+wwum
	 gO+vguBibc7XA==
Message-ID: <sashiko-outbox-177806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/16] media: sony-starvis2: Use
 pm_runtime_autosuspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261019-media-starvis2-v5-9-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
 <20261019-media-starvis2-v5-9-eef935347ce9@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:07:53 +0000
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
- [Medium] media: sony-starvis2: double starvis2_power_off() on probe error
--

commit 7f5363175aa2ea147ca66ea63a6e15a5e06c0920
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: sony-starvis2: Use pm_runtime_autosuspend

This commit switches the sony-starvis2 driver to use runtime PM autosuspend
with a 1000ms delay so the sensor is not immediately powered down when
stopping and restarting streaming.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index 2388105b6a304..bf14768dbf981 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c

[ ... ]

> @@ -1448,6 +1448,8 @@ static int starvis2_probe(struct i2c_client *client)
> =20
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> =20
>  	ret =3D starvis2_init_controls(starvis2);
>  	if (ret)
> @@ -1495,6 +1497,7 @@ static int starvis2_probe(struct i2c_client *client)
>  error_pm_runtime:
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
> +	pm_runtime_dont_use_autosuspend(&client->dev);
> =20
>  error_power_off:
>  	starvis2_power_off(&client->dev);

[Severity: Medium]
Can this cause a double call to starvis2_power_off() if a probe error occurs
after enabling runtime PM?

In starvis2_probe(), pm_runtime_enable(dev) is called while dev->power.usag=
e_count
is 0 (since pm_runtime_get_noresume() was not called). Calling
pm_runtime_set_autosuspend_delay(dev, 1000) and pm_runtime_use_autosuspend(=
dev)
after pm_runtime_enable(dev) invokes update_autosuspend() in
drivers/base/power/runtime.c:

    pm_runtime_set_autosuspend_delay()
      -> update_autosuspend()
        -> rpm_idle(dev, RPM_AUTO)
          -> rpm_suspend(dev, RPM_AUTO)
            -> starvis2_power_off(dev)

Because usage_count is 0, runtime_status is RPM_ACTIVE, and the autosuspend
expiration is 0, rpm_suspend() synchronously runs starvis2_power_off(dev) a=
nd
sets the status to RPM_SUSPENDED right here during probe.

If a subsequent step in starvis2_probe() fails (such as
starvis2_init_controls(), media_entity_pads_init(),
v4l2_subdev_init_finalize(), or v4l2_async_register_subdev_sensor()), the
error path jumps to error_pm_runtime and falls through to error_power_off:

    error_pm_runtime:
        pm_runtime_disable(&client->dev);
        pm_runtime_set_suspended(&client->dev);
        pm_runtime_dont_use_autosuspend(&client->dev);

    error_power_off:
        starvis2_power_off(&client->dev);

This calls starvis2_power_off() a second time on the already-suspended devi=
ce,
resulting in unbalanced clk_disable_unprepare(starvis2->xclk) and
regulator_bulk_disable(ARRAY_SIZE(starvis2_supply_name), starvis2->supplies)
calls.

Additionally, on the normal probe path, the device is already suspended bef=
ore
v4l2_async_register_subdev_sensor(), rather than staying active until the e=
nd
of probe and entering autosuspend. Should starvis2_probe() take a usage
reference with pm_runtime_get_noresume(dev) before pm_runtime_enable(dev),
replace pm_runtime_idle(dev) at the end of probe with
pm_runtime_put_autosuspend(dev), and call pm_runtime_put_noidle(&client->de=
v)
in error_pm_runtime?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-media-star=
vis2-v5-0-eef935347ce9@raspberrypi.com?part=3D9
