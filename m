Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA873537FB
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125405; cv=none; b=Pv6xcMSpFUYK0ypYeEoSyq//FT7RHYvf4VntpD7lSsYuRs2iIw8imq92dBIAc45x3vj1PWKb0S4JI5/hxcBL1SRvftfqeE3rXiaTSi4wqECATOSIGcA+hm9s/EW9IZpC+ci6rG56WjloGr3JK4ssHmeb/F5VhO2wYiST9diMu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125405; c=relaxed/simple;
	bh=uszvtJa82XWrOSqORf7TC6HdPugIpNuUd1QDQWTXWgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hRRYC26xvOdBpE1r9Et7owlfT3IRy9uvVPGy/2jNQKDPaginMrpMNLMkxgdUnHL2qLUx+klv3g0aXQWG9UqFBZqH7HKfjHFdVAZWlz8PEDiqRv3dLfyenE3JKd90ZD8VAcJCZ6AdN9xc1GPyf9GMKLtQidkn/C+KkqyrvAKdi/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPFU+cbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPFU+cbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0126B1F000E9;
	Wed, 15 Jul 2026 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784125403;
	bh=l18ar/JzO9L9YOk/+MhT+yToGFd9rUeD7YempeESnAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gPFU+cbS0sIh6I90qGHv7avSJYEr/bxivdU2wzvlO3jVQ4pnslLb5AFxBU1PV0Jou
	 6hL2OhN4mltY0XzOJTjqfeFRVB9eSb9Ncnfmt8LHjMgdevN/v0O/q81K8IR8HetuOm
	 okE+uAzJEl9huFy/QIMCDlIJGR2g/2xB1A0KMMxoT5770G78Z8PSsBdIos1j6nQnoi
	 7pvVYVExgJQYtfi8sVGXk7B3zb0kd2m3fCZ5o6x6Ns81I4ZW0bVLRrlNzkQTF3ZmfM
	 RlRrOllX0gB6oEQgRAwAmw9CU53d5ilxjwWiBrC4285cqFDGLi4Za0RJQFIvepM+9W
	 9Wc77sremcbqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/14] media: iris: Add hooks to initialize and tear
 down context banks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-glymur-v9-2-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-2-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:23:22 +0000
Message-Id: <20260715142323.0126B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of the delayed work `sys_error_handler` durin=
g driver removal, leading to a Use-After-Free if the timer fires after `iri=
s_remove` completes.
- [High] Devres lifetime mismatch with video_device causing Use-After-Free =
on file operations if V4L2 file descriptors are kept open after driver unbi=
nd.
--

--- Patch [2]: [PATCH v9 02/14] media: iris: Add hooks to initialize and te=
ar down context banks ---
commit 5c638b17a5df1cce5bd95764cd52706cb2e251b6
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add hooks to initialize and tear down context banks

Add platform hooks to set up and tear down context bank devices.
Different iris platforms may require different context bank setup, so
let platform data provide the required operations via vpu_ops.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index c2dcb50a27824..2594f5a67378a 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
[ ... ]
> @@ -207,6 +222,8 @@ static void iris_remove(struct platform_device *pdev)
> =20
>  	v4l2_device_unregister(&core->v4l2_dev);
> =20
> +	iris_deinit_cb_devs(core);
> +
>  	mutex_destroy(&core->lock);
>  }

[Severity: High]
This is a pre-existing issue, but does this function need to cancel the
delayed work core->sys_error_handler before returning?

If the device triggers a hardware error, core->sys_error_handler is schedul=
ed
with a delay. If the device is concurrently unbound (e.g., via sysfs) before
the timer expires, iris_remove() and iris_core_deinit() execute but fail to
cancel the delayed work.

Since the core structure is allocated using devm_kzalloc(), it is freed
automatically after iris_remove() returns. When the delayed work timer
eventually fires, iris_sys_error_handler() will dereference the freed core
pointer.

[Severity: High]
This is also a pre-existing issue, but is there a devres lifetime mismatch
with the video_device?

The core structure is allocated using devm_kzalloc() during probe, binding
its lifetime to the platform device bind/unbind lifecycle. However, userspa=
ce
can open the V4L2 character device and hold the file descriptor open
indefinitely.

If the driver is unbound while the file descriptor is open, iris_remove()
executes and returns, causing devres to free core.

When userspace later closes the file descriptor, the V4L2 core invokes
iris_close(), which attempts to dereference inst->core:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
    ...
	struct iris_inst *inst =3D iris_get_inst(filp);
	iris_remove_session(inst);
    ...
}

Inside iris_remove_session(), this leads to a use-after-free when it locks
inst->core->lock.

Could the allocation of core be managed without devres, or its lifetime tied
to the V4L2 device's release callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D2
