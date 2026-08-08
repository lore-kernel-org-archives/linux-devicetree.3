Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780F02F39C7
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786210383; cv=none; b=Pbhc4CkVbLaJSWNdtx0MmW5DlgC4G0NdwQPRh0JVLUjmrlalbeO2GGJfux3tgFc1AzehS93qfblNtxmqZrafrnonmJAXO/BBwOQtqPAc4vvNkW9/FGgZTnRxURS2EOmiSesaxE7vdyRCLmaQBSdTthVnZQDqyozovi9vjOuGEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786210383; c=relaxed/simple;
	bh=h2JOnE/XCB9OpUnv5Yhuah92CPZOiQG1upUaaj1OWy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rbOxha9GOkpwaYxfx8wqLnNHoUD/PZcF+F1/HfrUltjM8GP9dOcWb+XskKM71A1Xr6LI+1GppnG//4aNOdVuN9ChsS13qlQVFdPMnM6ePmqdBeRLjHbj8gavfgXHuFeZ5CKfXVF6QW0ngRM0KdkZqqDfDyUj/LzIs8o51Tjrbec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dte4aMt3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dte4aMt3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B877E1F000E9;
	Sat,  8 Aug 2026 17:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786210382;
	bh=ujcU2JYtF2/iD6B36pBDeDP2cTXQN8C8yv2kpXH5jmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dte4aMt3ebGyJzCrXEFv2bHG6SGtsz3IuluPdMrZ2zRBpQ07jOsuuTqH3rH2WZO36
	 1fpNJSHmNyx6kCu9mqWLj1FhTBwq4TVX/Mwmvu25TWFbZLdihzvRd9rncUhbDlZU8D
	 L4gcskiZZDUChCL/SbEIDC4W5LokuMgops3IrrwaCBjdGhGn3Gm834L7xDv/rjrj+2
	 s/bURbpL0VGHN7UagVI/XkjdYx1mhJ+LeSJFre+xeRMYxOfX7XpR0oOCsLrcryDqYZ
	 RGEXTZQIT2Wt/2DDi56NYo/jFHYpf0LvYmOD1gsGOMpZRFJWY1QWjGqh6xcf0V7hI/
	 Fyf/Ps5oWYkSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI
 transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jesse Casco" <jesse.casco@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260808172211.137577-1-jesse.casco@gmail.com>
References: <20260808172211.137577-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 17:33:00 +0000
Message-Id: <20260808173301.B877E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Dangling pointer in xfer->async_done leads to stack Use-After-=
Free or NULL pointer dereference on late delayed response.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI =
transfers ---
commit 7c8d066ac6f378514463d4f6eb7b970a95b13e88
Author: Jesse Casco <jesse.casco@gmail.com>

arm64: dts: qcom: glymur: use polling mode for SCMI transfers

This commit marks the SCMI transport on qcom glymur to use polling mode. Th=
is
works around the CPUCP firmware writing replies to shared memory but failing
to ring the completion doorbell. Using arm,no-completion-irq ensures the
scmi-cpufreq driver successfully probes.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index f04058d2e0891..b9db81a19d186 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -412,6 +412,12 @@ scmi {
>  			mbox-names =3D "tx", "rx";
>  			shmem =3D <&cpu_scp_lpri1>, <&cpu_scp_lpri0>;
> =20
> +			/*
> +			 * The CPUCP writes SCMI replies into the shmem but
> +			 * never rings the completion doorbell, so poll.
> +			 */
> +			arm,no-completion-irq;
> +
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> =20

[Severity: Critical]
This isn't a bug introduced by this patch, but could a late delayed response
trigger a data race causing a use-after-free on the async_done stack frame =
or
a NULL pointer dereference?

In drivers/firmware/arm_scmi/driver.c:do_xfer_with_response(), if a delayed
response takes longer than SCMI_MAX_RESPONSE_TIMEOUT,
wait_for_completion_timeout() times out.

The function sets xfer->async_done =3D NULL without any synchronization and
returns, destroying the async_response stack frame:

drivers/firmware/arm_scmi/driver.c:do_xfer_with_response() {
    ...
	if (!ret) {
		if (!wait_for_completion_timeout(xfer->async_done, timeout)) {
			dev_err(ph->dev,
				"timed out in delayed resp(caller: %pS)\n",
				(void *)_RET_IP_);
			ret =3D -ETIMEDOUT;
		} else if (xfer->hdr.status) {
    ...
	}

	xfer->async_done =3D NULL;
    ...
}

However, the transfer remains in the pending hash table until the caller
invokes xfer_put().

If the delayed response interrupt fires in this window, scmi_handle_respons=
e()
can successfully acquire the xfer and unconditionally access the unprotected
async_done pointer:

drivers/firmware/arm_scmi/driver.c:scmi_handle_response() {
    ...
	if (xfer->hdr.type =3D=3D MSG_TYPE_DELAYED_RESP) {
		scmi_clear_channel(info, cinfo);
		complete(xfer->async_done);
		scmi_inc_count(info->dbg, DELAYED_RESPONSE_OK);
	} else {
    ...
}

Could this lead to stack memory corruption if the async_done stack frame is
already destroyed, or a kernel panic if async_done is read after being set =
to
NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808172211.1375=
77-1-jesse.casco@gmail.com?part=3D1
