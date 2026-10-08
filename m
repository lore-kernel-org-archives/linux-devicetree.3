Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723337D12F
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430692; cv=none; b=LbxGxSlGu1UIASJ+3dCj/avi51bHF6L0IwSoEOtrCNKILiPry5TJKGlm2uUaglWbGQad4w8bI7wDnz18hc4l10LO9PiytvQPp1/mBw++cXnHM7kOsCdH1qAt8VwCeoVE1IjsyEYDXpQKPYbJ+W6wSZo4f/Rivdm4KQ/x5J/f5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430692; c=relaxed/simple;
	bh=ymoGLnlNhIBxhZzJKIa9/fIjKpO/1UErp6qHDN53BG0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aBICZrd0A4ryoKLMyxtwKn+X5pjJIR7MliuwQin65hvr4+GV8UeDarx0fD9dYv6LqsadODjZExPSfsor8RDBEapCiCmPOSMcVoSVz3NWLlQMs2Dqr5RMPI93NhupPQfk0hyvhh6RFzcqKzV4W6b/fid1nAYLqOpv4Nbkl+ZX9lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lR6Gfr1G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lR6Gfr1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD0C1F000FF;
	Thu,  8 Oct 2026 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791430687;
	bh=QHcv3dwRgaHhPUhE/kzOF9ONz6ha2aY73TBl/v43Uec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lR6Gfr1Gu6JC5vwlAwP5v4699NhTw8s8dxLRjjucLUi63btEMfRpLPS3gO/DNjVB+
	 JN1k9iEiWrTgUAqGgLAG70XbJdzZldQX6mOxDFPzLfSQHqbbTprLUq2aYuuG0SzDuO
	 jqv06SLyNff+NED2gUXk5DLEHzw4ty7NQ4VVIrqtJB5qKWno3si4nj2Kg3So3WWwHu
	 eFTIVesi5vN3or4lrof88cyuPbgZ8nTPvpoGiFAra9PKFgODhZYpDf8cJQxhM9oX8S
	 xqkLzlLdh+hbPgiBYPACz0wrEdoUzjMqrcdyaGHUvWBy0wKsRiNlpHuDBkU1ZulyFS
	 kQ/CC8M7Mx4jA==
Message-ID: <sashiko-outbox-163566@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 03/10] firmware: add RPMI TEE bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-3-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
 <20261007-riscv-rpmi-tee-abi-v2-3-45939a13d223@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 03:38:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] firmware: rpmi_tee_device_register() stub returns NULL breaking IS=
_ERR() expectations
- [Medium] firmware: rpmi_tee: missing modpost support breaks module auto-l=
oading
- [Medium] firmware: rpmi_tee: UAF on module unload via device release call=
back
- [Low] sysfs: modalias_show() output lacks a trailing newline
--

commit 8388a45d46f5e78edd5f56a8926f96afd8a74a91
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

firmware: add RPMI TEE bus support

RPMI TEE endpoints can provide multiple services identified by UUID.
This patch adds a service bus to allow consumer drivers to bind to these
services, exposing endpoint IDs, UUIDs, and modaliases via sysfs.

> diff --git a/drivers/firmware/riscv_rpmi_tee/bus.c b/drivers/firmware/ris=
cv_rpmi_tee/bus.c
> new file mode 100644
> index 0000000000000..1393adda0d3a7
> --- /dev/null
> +++ b/drivers/firmware/riscv_rpmi_tee/bus.c
[ ... ]
> +#define RPMI_TEE_UEVENT_MODALIAS_FMT	"rpmi_tee:%pUb"
[ ... ]
> +static ssize_t modalias_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct rpmi_tee_device *rdev =3D to_rpmi_tee_dev(dev);
> +
> +	return sysfs_emit(buf, RPMI_TEE_UEVENT_MODALIAS_FMT, &rdev->uuid);
> +}

[Severity: Low]
Does this sysfs output need a trailing newline? RPMI_TEE_UEVENT_MODALIAS_FMT
is defined without a newline (which is correct for add_uevent_var()), but
reusing it here with sysfs_emit() will result in an output string that does=
n't
have one. Should a newline be appended for the sysfs interface?

[ ... ]
> +static void rpmi_tee_device_release(struct device *dev)
> +{
> +	struct rpmi_tee_device *rdev =3D to_rpmi_tee_dev(dev);
> +
> +	ida_free(&rpmi_tee_bus_id, rdev->id);
> +	kfree(rdev);
> +}
[ ... ]
> +struct rpmi_tee_device *
> +rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
> +			 const struct rpmi_tee_ops *ops, struct device *parent)
> +{
[ ... ]
> +	rdev->dev.parent =3D parent;
> +	rdev->dev.bus =3D &rpmi_tee_bus_type;
> +	rdev->dev.release =3D rpmi_tee_device_release;

[Severity: Medium]
Could this lead to a use-after-free on module unload? If userspace holds a
sysfs attribute open for an rpmi_tee device, the device kobject's refcount
remains non-zero.

If the module is unloaded during this time, the release function and the
global rpmi_tee_bus_id IDA are unmapped.

When the sysfs file is eventually closed and the final kobject refcount is
dropped, could the kernel jump to the unmapped rpmi_tee_device_release()
and access freed IDA memory?

> diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
> new file mode 100644
> index 0000000000000..c499f0427833e
> --- /dev/null
> +++ b/include/linux/rpmi_tee.h
[ ... ]
> +struct rpmi_tee_device_id {
> +	uuid_t uuid;
> +};

[Severity: Medium]
Is this missing from include/linux/mod_devicetable.h? Without adding
rpmi_tee_device_id to mod_devicetable.h and scripts/mod/file2alias.c, modpo=
st
will silently ignore MODULE_DEVICE_TABLE(rpmi_tee, ...) in consumer drivers.
Will this break udev-based automatic module loading for TEE service drivers?

[ ... ]
> +#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
> +struct rpmi_tee_device *
> +rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
> +			 const struct rpmi_tee_ops *ops, struct device *parent);
[ ... ]
> +#else
> +static inline struct rpmi_tee_device *
> +rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
> +			 const struct rpmi_tee_ops *ops, struct device *parent)
> +{
> +	return NULL;
> +}

[Severity: High]
Does this fallback stub break IS_ERR() expectations? The actual implementat=
ion
of rpmi_tee_device_register() returns an ERR_PTR() on failure, and callers
typically check the return value using IS_ERR().

Since IS_ERR(NULL) evaluates to false, will callers assume device registrat=
ion
succeeded and attempt to dereference the NULL pointer? Should this stub ret=
urn
an error pointer such as ERR_PTR(-ENODEV) instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-riscv-rpmi=
-tee-abi-v2-0-45939a13d223@oss.qualcomm.com?part=3D3
