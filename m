Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D29373C1A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426113; cv=none; b=TBnLqDt7Jl8Ord2xU2LmpbDbJrFqjixXqomaV+jg19DIf1BM6YkpQa4hSdbI5EjzyUr+AnliCozequH02irt3ZvNTEeHMIWlD7Vh2jf5pv1OazJ1K1e9KKPzgI42RUs5gt254+AZ+qWrStsC4OY1ZNx+tvU30IGJnVPsMY6/U7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426113; c=relaxed/simple;
	bh=p2LLxDh+WfS0Yn01yHZLegh4Odas0zv8U2Poc7pSVrY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d30QsOZ0mkCCwk/YHnhzqlGNMM9hQCCO8miuuv/G3TxnrkRwD8P/NpM8a9OiUGR9v6sJnVgyhdaGHwryPFtDXzATCrJx7l93RvDgiJNJPZKjqRaqXC7uwyIlnsJ6s4RLjaQKY/KZdw5MvigNMyvyVwmnsrSaJlbd9qxz1SLCP5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RK0ISmwj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RK0ISmwj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302B91F00A3A;
	Thu, 30 Jul 2026 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426112;
	bh=whrul3qqnj9A/3I1tfsn3VfO/EoXnU8Z0yQNO63PBh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RK0ISmwjRtgpEt/AhNOdmT/QaWNyQ9geaDk5OxEwUrgAzjj9qQ4RiqGo2hz/MqvBA
	 1BqX+IsIGraz6nxXEvIQNMERa0C238rKqh3H9JHyaleovHYzWhh6/OokzKyGP6Oy/O
	 CCzDhrevf1WgiJbkdsy/jWT8f6OsPq2f0M1E9Ziz6qzjiL6GCGZygB2DmNZe2TVZxt
	 mjMpQUaN6weJL+2ChSwIPqyU+MAwf4wAnHx9zXe7fAXh3c+lVIwpAJt2eeS9RVKoaM
	 qyumhRN5tQqFR8DqX2S6f2dL3SOx7MLmIHUjptU3g7ZUY2QMjTLTaWHJIPAFQk+FaZ
	 To33y9W81B2WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/18] media: iris: add vpu op hook to disable ARP
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-7-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-7-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:41:49 +0000
Message-Id: <20260730154150.302B91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race conditions and data races in `iris_core_init` state machine a=
llow concurrent callers to bypass initialization wait and modify `core->sta=
te` unprotected.
- [High] The `iris_core_init()` function fails to clean up initialized reso=
urces (such as DMA memory for queues, firmware mappings, and VPU power) if =
the hardware fails to respond in time.
--

--- Patch [7]: [PATCH v8 07/18] media: iris: add vpu op hook to disable ARP=
 buffer ---
commit 53560a9c747444f7e2c1b9214a99baec4904f498
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: add vpu op hook to disable ARP buffer

This patch adds a disable_arp callback to the VPU operations for the iris
driver. This optional callback is invoked during core initialization and
resume paths to disable ARP routing on AR50LT platforms, allowing the
firmware to configure the ARP internal buffer as non-secure for encoder
usage.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index 6dbe18be5b495..526f925752646 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -46,6 +46,7 @@ static int iris_wait_for_system_response(struct iris_co=
re *core)
> =20
>  int iris_core_init(struct iris_core *core)
>  {
> +	const struct vpu_ops *vpu_ops =3D core->iris_platform_data->vpu_ops;
>  	int ret;
> =20
>  	mutex_lock(&core->lock);

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition in
the state machine of iris_core_init()?

If one thread calls iris_core_init(), it takes core->lock, sets
core->state =3D IRIS_CORE_INIT, drops the lock, and blocks in
iris_wait_for_system_response():

drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
    ...
    core->state =3D IRIS_CORE_INIT;
    ...
    mutex_unlock(&core->lock);

    return iris_wait_for_system_response(core);
}

Concurrently, if another thread calls iris_core_init(), it can see
core->state =3D=3D IRIS_CORE_INIT and return success immediately without wa=
iting
for firmware readiness:

drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
    mutex_lock(&core->lock);
    if (core->state =3D=3D IRIS_CORE_INIT) {
        ret =3D 0;
        goto exit;
    }
    ...
}

Additionally, if the first thread's wait times out,
iris_wait_for_system_response() modifies core->state without holding
core->lock:

drivers/media/platform/qcom/iris/iris_core.c:iris_wait_for_system_response(=
) {
    ...
    if (!ret) {
        core->state =3D IRIS_CORE_ERROR;
        return -ETIMEDOUT;
    }
    ...
}

Can this lead to a data race with other threads checking or modifying the
state, and allow threads to bypass initialization wait?

[Severity: High]
This is a pre-existing issue, but does iris_core_init() fail to clean up
initialized resources if the hardware fails to respond in time?

In iris_core_init(), if iris_wait_for_system_response() returns an error
(e.g., -ETIMEDOUT), it doesn't trigger the teardown labels:

drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
    ...
    mutex_unlock(&core->lock);

    return iris_wait_for_system_response(core);
    ...
}

If wait_for_completion_timeout() expires, iris_wait_for_system_response()
returns -ETIMEDOUT and sets core->state to IRIS_CORE_ERROR:

drivers/media/platform/qcom/iris/iris_core.c:iris_wait_for_system_response(=
) {
    ...
    if (!ret) {
        core->state =3D IRIS_CORE_ERROR;
        return -ETIMEDOUT;
    }
    ...
}

If user space retries, the next call to iris_core_init() sees
core->state =3D=3D IRIS_CORE_ERROR, jumps to the error label, and sets the
state to IRIS_CORE_DEINIT without releasing the resources leaked in the
first attempt:

drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
    ...
    } else if (core->state =3D=3D IRIS_CORE_ERROR) {
        ret =3D -EINVAL;
        goto error;
    }
    ...
error:
    core->state =3D IRIS_CORE_DEINIT;
    ...
}

A third attempt would then see IRIS_CORE_DEINIT, re-run initialization,
allocate new DMA memory (via iris_hfi_queues_init), and overwrite the
previous pointers, resulting in a permanent memory leak.

Does this sequence cause a memory leak when the firmware hangs?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D7
