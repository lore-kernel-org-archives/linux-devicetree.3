Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F17F31A55E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464603; cv=none; b=FeAn2mqILk+zWby1QAX2Ppet73H2Zsue1TOGTaJYNuw5SuG3CtIdXPP+cwLZ8tYppWpyDgpdIqwuttj8Lj2xPb6w6shKNmvm+mdW8gDMFi5UdWeb1tX8NZm88KMxGZtdiyLblNJB+XzJSZnTVr79aKHOYDX9CCgB1tt5zZkCLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464603; c=relaxed/simple;
	bh=7na0SlBVAFuH8iLOdpmXC2I/Hlua7woqypyO9MFKUAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZI97ZC8K2sg2SjQv75xXHu5CakIDDLh/bF/a6i4uQHZkIaIhWwDwS9T3TNY/3JS7yFsxMvWVJPMJRQ+rqK5sD+niwc55mVM+TZU3NEOr3HNcCFCHZiMsv5uapEN6G1E2vWyT16yEvu2Vu3Kux0QXJd3bG55PdvQPLm80D72fdKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ0SnoJv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ0SnoJv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1261F000E9;
	Tue,  7 Jul 2026 22:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783464602;
	bh=uwYH/ZKKhWa2S4qqR9IkbG3k/aKsrmZLtnU9N5uBHxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GJ0SnoJvMVGqaaSGKHk3OoFMj9No9jBk7Xql9KDovTajCi+CtJs5pnYWaLDQrXlpx
	 lUu0GgtK+KJN5epSLuaviiTEx1kk1A7ksTVp0z+jfXOlr4w+k25IuolsQRa0Ly+AuD
	 bMXhAXiD0DPcabdzenQ7B7qA+xswWt42CyGQgvhVUDueJuZfHT2N41Up132CUNFOWq
	 bWgHIXTPJ0q7T5+80YyT860hQP25Kn16jRyip8cZQwzxVbOOTYXItTC64S0uYPmpyL
	 JtJCMdpXyHPC9Er0cwBaXTv3iTqXaUrxX9UiixCMmlFSxIvP9YJlBM7XTVD51l6I4r
	 JUsPhCe32IB5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-iris-ar50lt-v6-17-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-17-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 22:50:01 +0000
Message-Id: <20260707225001.BB1261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A scheduled delayed work can execute after the `venus_core` struct=
ure is freed on the probe error path.
- [High] The `venus_probe` error path fails to clean up HFI resources if th=
e IRQ request fails.
--

--- Patch [17]: [PATCH v6 17/18] media: venus: skip QCM2290 if Iris driver =
is enabled ---
commit aca4e84f0aabcb82f9ee70af8657eb2e88c258cf
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: venus: skip QCM2290 if Iris driver is enabled

This commit avoids a race condition between the Venus and Iris drivers
on platforms where Iris now supports QCM2290. It achieves this by
skipping QCM2290 hardware in the Venus driver when the Iris driver is
enabled.

> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 243e342b0ae75..3c88594eb1d00 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the IRQ error path
in venus_probe() leak resources?

drivers/media/platform/qcom/venus/core.c:venus_probe() {
...
	ret =3D devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_threa=
d,
					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
					"venus", core);
	if (ret)
		goto err_core_put;
...
}

Earlier in venus_probe(), hfi_create() allocates memory and DMA buffers.
If devm_request_threaded_irq() fails and returns -EPROBE_DEFER, the code
jumps to err_core_put, bypassing err_hfi_destroy and the call to
hfi_destroy().

Should this error path jump to err_hfi_destroy instead to prevent
exhausting contiguous DMA memory on repeated probe deferrals?

[Severity: High]
This is a pre-existing issue, but could this error path in venus_probe()
lead to a use-after-free?

drivers/media/platform/qcom/venus/core.c:venus_probe() {
...
err_hfi_destroy:
	hfi_destroy(core);
err_core_put:
	if (core->pm_ops->core_put)
		core->pm_ops->core_put(core);
	return ret;
}

If a hardware interrupt fires during probe, venus_event_notify() can
schedule core->work. If probe subsequently fails, the error path does
not call cancel_delayed_work_sync().

Devres will then free the core object, and the pending delayed work will
dereference it when it executes. Should cancel_delayed_work_sync() be
called before returning here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-iris-ar50l=
t-v6-0-374f0a46c23b@oss.qualcomm.com?part=3D17
