Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63171A9F90
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533816; cv=none; b=iTzEbq+b9Lb/j7vfgGAS9vCJzJjqyPuviB7mXWRhmpJ4VTDFBU6sYg7xX8anlWdO95xJtREO/lYoipbzR6LmPizB6JqVbxyBsP0j5VlvKj5p3MJllC6dnu2lNP8W5eRiAVtOBT28ahMeaDx6Y5URn0L+lCJWg4qjNWmq4YJ2mWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533816; c=relaxed/simple;
	bh=JeSaqO5zCH3c/MdrPtfbwKwlqv+E1F8+YMYoKXIS/XI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=roJ6pH6amJE8pBQsbrsK8QPWwRoPnPMlttTXcWJ5px6EhWjxQxLKcCB8PYz5YPd6SL1UywQvOgRNASYxFJBSzwe/PG6/PXrl6R7R9JfVm05jnQ90BD4sTpATK25PB7QZxASQ2mCY1Um95NgduEXYkM4emNh7zRh3tp6yvU+2B+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGq4YFAA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGq4YFAA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA551F000FF;
	Wed, 16 Sep 2026 04:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789533814;
	bh=PAf+u+WNjZUsQt6XafKM6sUdklXi2nA712lah0Ier+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGq4YFAA7zUsSTUl9mHfkfPMsn5pF8IJDcNIPRwObryWA/axDmTGTGCcOvIG256hx
	 To/Qo5bOoXKtKWSkN3bshtl54FTTnQNRDd1ZRUKR3lcyL8etPluCFl4jipQDJLQAA6
	 DjfZLrnTKACPSpPsOyOFDBujFofZAlYeglwDoBOOW1LJdp0QcWjZfC+nP5isDIfV+H
	 3YKSBirIahzyhcgjDGNGX8qSovXKb0BuULdfqZBwuasnD0x002NPbwdcxYNzPlGPqc
	 fuPiromTx0wHpPA7EutrItt2whPoPc0Z1iU3KrHgBPdZJf2cGnHRXX2vAv0/aqYWsv
	 L48QaGdLlOstA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drivers/of: Add of_detach_node_no_notify()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haren Myneni" <haren@linux.ibm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916043249.2062676-1-haren@linux.ibm.com>
References: <20260916043249.2062676-1-haren@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 04:43:33 +0000
Message-Id: <20260916044334.3EA551F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: state corruption and resource leak via of_detach_node_no_notif=
y()
--

commit 900ccea33cdd682696cd3ae6fb47477962cee9f0
Author: Haren Myneni <haren@linux.ibm.com>

    drivers/of: Add of_detach_node_no_notify()

This commit introduces the of_detach_node_no_notify() interface. It allows
callers to remove nodes from the device tree without triggering reconfigura=
tion
notifiers, intending to provide a cleanup path when node addition fails.

> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 744ce0e1eb24a..fc6f22371a97c 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
[ ... ]
> @@ -318,6 +318,22 @@ int of_detach_node(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_detach_node);
> =20
> +/**
> + * of_detach_node_no_notify() - "Unplug" a node from the device
> + * and return without running notifiers.
> + * @np:	Pointer to the caller's Device Node
> + */
> +int of_detach_node_no_notify(struct device_node *np)
> +{
> +	mutex_lock(&of_mutex);
> +	if (!of_node_check_flag(np, OF_DETACHED))
> +		__of_detach_node(np);
> +	mutex_unlock(&of_mutex);
> +
> +	return 0;
> +}

[Severity: High]
Does this bypass of of_reconfig_notify(OF_RECONFIG_DETACH_NODE) cause state
corruption and resource leaks?

When of_changeset_apply() fails during the notification phase (for example,
if a subsystem returns an error for OF_RECONFIG_ATTACH_NODE), earlier
subsystems in the blocking_notifier_call_chain may have already successfully
processed the ATTACH_NODE event and allocated resources such as platform
devices or cached node pointers.

If of_detach_node_no_notify() is subsequently used to undo the changeset, t=
he
required OF_RECONFIG_DETACH_NODE signal is intentionally suppressed. Will t=
his
leave the successfully attached subsystems blind to the removal, resulting =
in
permanent resource leaks and potential use-after-free of the device nodes v=
ia
dangling pointers?

This path can be reached through userspace-initiated CPU hotplug operations
(DLPAR) that exercise this error path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916043249.2062=
676-1-haren@linux.ibm.com?part=3D1
