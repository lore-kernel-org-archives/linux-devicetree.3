Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1323E9286
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264926; cv=none; b=tBc26DE0X6Ng9u5oKpjxSR6f+HeoowJXoS9k8sZ7fhTuwgqoNLKk6KjBR+kzZn+FZdzbJctgsgR0bpFC5EirnxXawr0g5027KQz6RfyuQkwC/nKYbqu9aB52JfTh/YyolzMrVBBy8RbG5m3w3dVtz6czEKyjqkDwnuCIGV8xb64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264926; c=relaxed/simple;
	bh=AF94pZgWZWVqsTIRirBQfoxE7HLABTCo9Nf76oJ0aWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lV1b6L9N3ef8yBy/Ib0Gl7rVIj6sjy7jpmly+KfBSBN2eSYZgnMq88+04B2l9bmxiJhF708trHmZuYYXhOH/M1e/Fn1+HbZWmosfRSSxrYGE7aw6P7e9ywFD2rFeiExV91+MDpsOQFAi1g+DD5FnX+cqEZxta/ZQNl8rPHftjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xv8EHyeZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xv8EHyeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7B71F000E9;
	Fri, 12 Jun 2026 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264924;
	bh=l0eK6uNfs2/AAI8q6LCmmvtMa8kyEdDo6RbjQv9ERJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xv8EHyeZCaSx2J93dkoqiTlI/5GZ9btasnMNpkkGm4QQCvGPf5IEF+T6F0tw+VWnv
	 qitRQULie9owWPFRmKpGtfHTW2abNbDM1snLGLZ+FMzTmq22R1TKFMKi7TWL8KUV5U
	 1sqmL5C7nCOQO57JUXNIWX/SSPWEFJJ9zp4mJ6nF2Q6cZkHE3Jf4ky+jir7LwpYosE
	 8IPSPpkHl9LdydpH8fKzL7Qa5fumiHeYMJzxEt9zrAe+zsc23txdyB8/bsoW5Sa8+2
	 C5QiQsPxSayWgVyDhfqshfA8n2XoI9ZsO/RAFTJip4HnDK9qZYWWisSx+4/H68u3IH
	 oMNHRgtjJZHpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/9] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260612111816.3688240-4-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 11:48:43 +0000
Message-Id: <20260612114844.5D7B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] i3c_master_direct_detach_i3c_dev_locked lacks the unaddressable de=
vice check present in its attach counterpart, leading to a NULL pointer der=
eference in controller drivers.
--

commit a7f74140d15672b8f2824666071ce06e3051e0d8
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Add APIs for I3C hub support

Add helpers for attaching and detaching I3C devices and CCC helpers
to check CCC support and send CCC commands to prepare for I3C hub support.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ec3547f75469e..59e0f82de6ebd 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller=
 *master,
> +					    struct i3c_dev_desc *dev)
> +{
> +	int ret =3D 0;
> +
> +	/*
> +	 * We don't attach devices to the controller until they are
> +	 * addressable on the bus.
> +	 */
> +
> +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> +		return 0;
> +
> +	/* Do not attach the master device itself. */
> +	if (master->this !=3D dev && master->ops->attach_i3c_dev)
> +		ret =3D master->ops->attach_i3c_dev(dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);

[ ... ]

> +void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
> +
> +	/* Do not detach the master device itself. */
> +	if (master->this !=3D dev && master->ops->detach_i3c_dev)
> +		master->ops->detach_i3c_dev(dev);

[Severity: High]
Does this missing address check in the detach helper lead to a NULL pointer
dereference in controller drivers?

The attach helper i3c_master_direct_attach_i3c_dev_locked() gracefully skips
attaching devices without a static or dynamic address and returns 0 (succes=
s).
Because it returns success, callers might naturally invoke this companion
detach API during teardown for these same devices.

However, since this helper lacks the corresponding address check, it
unconditionally invokes the controller's detach callback. Controller drivers
often retrieve the device's private data and immediately dereference it. Si=
nce
the attach phase was skipped, this private data would be NULL.

Should this function also check if the device has an address before calling
the detach callback?

> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612111816.3688=
240-1-lakshay.piplani@nxp.com?part=3D3
