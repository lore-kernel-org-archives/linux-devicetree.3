Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D546D0A0
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337534; cv=none; b=W9nHuoUH11mf9v1H3bdwZIwvqthDlIxLiv1B3V1/wRfmRJpN3DHM5bX4ADRWmxYKHkW2YY3ueCMHxhyKdKCpw3AaxyPqZXsPumIjuA0ll/Rv/uKcw+DKEjAKw4/fwIxgxIJb1AXDoIsE96zOATizSyxPqdgpCEq8DRoZLO8prhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337534; c=relaxed/simple;
	bh=9AXMHaA/8Iit4wH1p8TNS5iupR0ARwYBpcC1YhjPvGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AYcXinwCccYIOwx9vm+O4bBtRDV2WftwsvuQhkVhn1aXvlk2fb8b2Hi8652zV13wio1GqVvmGyzhUFMX8e9C4SCm0K+bK37E9SozW45b9FW2r9iGa3NAHr7vlTMYSHr3LUFgdIxbfdCLdeTkRzEHqDTz3NfVpI3A4ne+RRoSplY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciWM+eBI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciWM+eBI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B052C1F000FF;
	Fri, 25 Sep 2026 11:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337531;
	bh=0n1wUaX5A1Hktd4pbAt0nqcjU0Ttso+VUby0ub/wZb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ciWM+eBI60nrC+NBI0fujOwbajfbtBB+pmv738msXJGf0p/HcVrKQAvljyeEBq2gu
	 nMJGTSOlDv7CZH8G9YcWsLF1BKpX17f9b/PE7eEzgDS/ctrTC8gggKCVQDuvyJ8VgX
	 F7S7WMrKRjzxfq0J13+gQRpcAoeBqi/gy6IFD77mUUF/ePlTMA5RUlVjbBjmR074fe
	 h00iwmtCb0+jkaMH2K8finVWqAEHXU90JL4XglOPKegBtKEozwLT255oVnPpIx+PJV
	 f83qDTKUswBnzdjIFpf+Gj0vTdAoqYbcnHYw8isf/vZFtID3+YhzOUUBHW11vqXNzV
	 73d4eqEP5abdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
 <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 11:58:50 +0000
Message-Id: <20260925115850.B052C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] pm: missing synchronous suspend in rkjpegd_remove leaks clocks
- [High] media: rkjpegd: resetting hardware before disabling IRQ causes ker=
nel panic
- [Medium] media: rkjpegd: valid JPEGs with >=3D 127 bytes of trailing garb=
age are incorrectly rejected
- [Medium] pm: missing pm_runtime_mark_last_busy() causes autosuspend thras=
hing
--

commit d2574a6f04bf2bf05abc30d32244135c74b9546e
Author: Sascha Hauer <s.hauer@pengutronix.de>
Subject: media: rockchip: Add JPEG decoder driver

This commit adds a driver for the Rockchip VDPU720 JPEG hardware decoder.
It exposes a V4L2 M2M device to decode JPEG bitstreams into NV12 format.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..e3a6c820ad1ed
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c

[ ... ]

> +static void rkjpegd_job_finish(struct rkjpegd_ctx *ctx,
> +			       enum vb2_buffer_state state)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +
> +	pm_runtime_put_autosuspend(jpegd->dev);

[Severity: Medium]
Will this suspend the device immediately instead of using the configured
100ms autosuspend delay?

The device's last busy timestamp is not updated with
pm_runtime_mark_last_busy() before queuing the autosuspend here. Without
it, the PM core calculates the expiration time based on an uninitialized
or stale timestamp, which can cause the device to suspend immediately and
thrash between back-to-back frames.

> +
> +	rkjpegd_job_finish_no_pm(ctx, state);
> +}

[ ... ]

> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{

[ ... ]

> +	rkjpegd_irq_done(jpegd, state);
> +	ret =3D IRQ_HANDLED;
> +
> +out_put:
> +	pm_runtime_put_autosuspend(jpegd->dev);

[Severity: Medium]
Similar to the issue in rkjpegd_job_finish() above, is it intentional to om=
it
pm_runtime_mark_last_busy() here?

This also queues an autosuspend without updating the last busy timestamp,
which can defeat the autosuspend delay and cause unnecessary power cycling.

> +
> +	return ret;
> +}

[ ... ]

> +static bool rkjpegd_has_eoi(const void *data, u32 start, u32 len)
> +{
> +	u8 tail[128];
> +	u32 n, i;
> +
> +	while (len > start) {
> +		n =3D min_t(u32, len - start, sizeof(tail));
> +		memcpy(tail, data + len - n, n);
> +
> +		for (i =3D n; i && (tail[i - 1] =3D=3D 0x00 || tail[i - 1] =3D=3D 0xff=
); i--)
> +			;
> +
> +		len -=3D n - i;
> +		if (i)
> +			break;
> +	}
> +
> +	n =3D min_t(u32, len - start, sizeof(tail));
> +	memcpy(tail, data + len - n, n);
> +
> +	for (i =3D 0; i + 1 < n; i++)
> +		if (tail[i] =3D=3D 0xff && tail[i + 1] =3D=3D 0xd9)
> +			return true;

[Severity: Medium]
Can this inadvertently reject valid JPEG frames?

The search for the 0xff 0xd9 EOI marker only inspects the final 128 bytes
after stripping the 0x00 and 0xff padding. If a valid JPEG has 127 or more
bytes of trailing garbage (such as EXIF metadata or digital signatures),
the EOI marker will fall completely outside this search window and the
function will return false.

> +
> +	return false;
> +}

[ ... ]

> +static void rkjpegd_remove(struct platform_device *pdev)
> +{
> +	struct rkjpegd_dev *jpegd =3D platform_get_drvdata(pdev);
> +
> +	rkjpegd_v4l2_cleanup(jpegd);
> +
> +	reset_control_assert(jpegd->resets);

[Severity: High]
Does asserting the hardware reset before disabling the IRQ and PM runtime
introduce a race condition?

If a spurious interrupt fires while the IP block is held in reset, the
rkjpegd_vdpu720_irq() handler will run. Because PM runtime is still active,
pm_runtime_get_if_active() will succeed, and the handler will try to read
from the hardware (VDPU720_REG_INT), which can cause a bus stall or kernel
panic.

> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);

[Severity: High]
Could this leak the hardware clocks?

Disabling PM runtime here cancels the pending autosuspend timer, but it
leaves the device in the active power state with a usage count of 0.
Without an explicit synchronous suspend (like pm_runtime_suspend() or
pm_runtime_put_sync_suspend()) before pm_runtime_disable(), the
rkjpegd_runtime_suspend() callback is never executed, and
clk_bulk_disable_unprepare() is bypassed.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-rockchip-j=
pegdec-v5-0-30658833cb68@pengutronix.de?part=3D2
