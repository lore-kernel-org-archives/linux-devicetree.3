Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE472165EA
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833213; cv=none; b=BrWum79JzB1+AsYgqJx+yaryMiJhzEPHg22guUPEydCm5EE1hogiHlYEEqLfvGeS/zSiCOXlVC8dLvXB2I3Cl0t95oDdfEpJF4XceRg75ZtEFmWqWnG3FBmOXkW5pASvn5IJKtbQ50KKBFxi7K6eTSEehdMUL0HZlY9xSnQQJgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833213; c=relaxed/simple;
	bh=nLvbLItfZ431jCXba2nnrv2YB2Y2uKSOFCP6xQ3ovVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CGzxY346+8N289ERD82MUJYPXBxYYSLZZIvcyYNaO/OX5tdg8wgwSsnLsmM2chBbgvEQIzRpYhmZx6ysMJkT9fujN28RAOrZhkizhbyiDl1x4WxRvRxq7DbQlleRd9LEfHzjyW8HKHjAapzHI/4VDAxYK6dqTkRVx6EJGmha9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlZu3cKw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlZu3cKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8171F000FF;
	Thu,  1 Oct 2026 05:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790833211;
	bh=MK1hCXoLnWMtJ/vAv9BmlubZvpHNU9CguhbKInjqA8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NlZu3cKwu9FVrphi/WjYaHzz67bHKuibEXVuQqxF5M7EY+anJ7ATkj3NMY2H+zoym
	 mL4Vf3650F+v/35rDvsD/NFMwsL+4xpb5n0G+tSTRzXoafF6sL+TpRhQplUNUdM1Wp
	 ndlWJSHTJRNArjlDbSQMdJtXx0M5cfxbbZg8wqnSjcSKqqf98utX47HmNx2Bhbl2xz
	 Qmig3J1lRKMse9JjJD1DJtg1Sd6VH2DHk4hRVQkeY0PJApdG8fc0x0NmhO5BmzYQkc
	 eMYP8/SYZjnP0BnNLym91Suabh6pGKjVUAj3FS+/lIOP06z4zY6UKDt5ze8THy2hkW
	 icHwfCTZ+Jwmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:40:11 +0000
Message-Id: <20261001054011.7A8171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gtrace: wild pointer and UAF during concurrent driver unbind
- [Medium] gtrace: lock mismatch by iterating over path in gtrace_path_copy=
to_auxbuf()
--

commit 727fcf662499fff522c570fa7a02e693a5593303
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add function to copy into perf AUX buffer

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index d7f1df90aa31d..acbeb3df21354 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -715,6 +715,47 @@ int gtrace_path_stop(struct gtrace_path *path)
>  }
>  EXPORT_SYMBOL_GPL(gtrace_path_stop);
> =20
> +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> +			      struct gtrace_perf_auxbuf *buf,
> +			      size_t *bytes_copied, u64 *format)
> +{
> +	struct gtrace_comp_priv *sink =3D to_gtrace_comp_priv(gtrace_path_sink(=
path));
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +	int ret =3D -EOPNOTSUPP;
> +	unsigned long flags;
> +
> +	/*
> +	 * Copy only after every path using the sink has stopped; otherwise the
> +	 * hardware may overwrite data being copied, or the same data may be co=
pied
> +	 * to aux buffer twice. The last path to stop does the copy. Holding the
> +	 * sink's lock also stops another path from starting the sink before co=
py
> +	 * completes.
> +	 */
> +	raw_spin_lock_irqsave(&sink->lock, flags);
> +	if (sink->start_count) {
> +		*bytes_copied =3D 0;
> +		ret =3D 0;
> +		goto out;
> +	}
> +
> +	list_for_each_entry(node, &path->comp_list, head) {

[Severity: Medium]
Will this loop cause a lock mismatch if an intermediate component implements
copyto_auxbuf?

The function acquires sink->lock, but iterates over path->comp_list to find
and execute the callback. If a non-sink component is matched, its callback
will run under the sink's lock rather than its own, which may allow data ra=
ces
with concurrent start or stop operations on that intermediate component.

> +		comp =3D node->comp;
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);

[Severity: High]
Does this code allow concurrent driver unbind to cause a use-after-free or
NULL pointer offset dereference?

The to_gtrace_driver() macro double-evaluates comp->dev.driver. If it is set
to NULL by a concurrent unbind between evaluations, the macro yields a nega=
tive
offset rather than NULL. This bypasses the !gtdrv check and dereferences an
invalid pointer.

Additionally, since no device lock or module reference is held here, can the
driver be unloaded while the callback is executing?

> +		if (!gtdrv || !gtdrv->copyto_auxbuf)
> +			continue;
> +
> +		*bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format);
> +		ret =3D 0;
> +		break;
> +	}
> +out:
> +	raw_spin_unlock_irqrestore(&sink->lock, flags);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D7
