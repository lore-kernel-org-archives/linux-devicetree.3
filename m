Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE323C4577
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376035; cv=none; b=b2brjaXir76Qi8SyfelEpzz/8vOF3agknIHyU34Q6QPf/E0BMt5dzeoWzIBRJhVL7Y5tVBr1MQiQfsB/b+q5NWH41AZ8f7gV1ToE0cosB2rRn3u43IUhzj3S7waV6S8l5X0mY+r5kao6vFyAF7gutZwxJCwjlHra9XN7Bh/LV7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376035; c=relaxed/simple;
	bh=9scUDCOQ3QTIhr4w54PF65vPWzsKJBgATl99k+ZovLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ICWAOXkh3QzCK+Wheml0vHjLU653+G2Q1OoHU81CNtvh/zZ40g9js0k8Jts5fu57ktLlXbYc8RgnQhFKyvKaqA/3sypyskjH3H/T7ukp8GQfA+8M4sMbtQRTykfaWEO3or6UudIO4yU+hTtSLdOFfvevUDQKqq8QF09Bj3KcXNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H78slq/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H78slq/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A6E1F00A3A;
	Mon, 10 Aug 2026 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376029;
	bh=XaI7Hf0gsT0xwBE+kkrwJ06u02uzdlr0v4PwO/2YSIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H78slq/q8735+vgU8a0fmMVqKvc1V/jkDr4MUK7OGIYHcaw00n94q4eWaWdLEtL6A
	 Bp1VY59wI6cKsrIRYpE9XVvrGQpnM469sn80mCBJUDIOujGSizVsbFtxe1vEReFGEm
	 mn0F5/oZ5eXfnrOdVQmDFkG6ZYLbsxDkNw0Y8cwghOnUFTfWcZcwjXzWNKcnF0+OlL
	 FPiPBr3/gq8nTCFw9Fw4q/1DMIRkZ5ULARWtd5tA1g2ReP3GH2RzySzuHhYVZr+Oi+
	 B/gCVr7igAk+MMcL4NtJsJYHMrBtzWH+fSzW9UlrsUsCt+bfsYfHnzlCQZg1vaAkED
	 qUiqPIakJSjbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on
 a component path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:33:48 +0000
Message-Id: <20260810153348.F2A6E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing rollback in gtrace_path_start() leaves components in a par=
tially started state on error.
- [High] Early abort in gtrace_path_stop() terminates teardown on the first=
 error, leaving remaining components active.
- [High] Unsafe dereference of gtdrv without NULL check and lockless access=
 to dev->driver can cause a kernel panic or memory corruption.
--

--- Patch [5]: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing=
 on a component path ---
commit 24fa9f699451874fed23109ef92badb57913e17b
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add functions to start/stop tracing on a component path

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index a89d195ab5b89..6ff1b30879472 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -582,6 +582,50 @@ static void gtrace_release_path_nodes(struct gtrace_=
path *path)
>  	}
>  }
> =20
> +int gtrace_path_start(struct gtrace_path *path)
> +{
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +	int ret;
> +
> +	list_for_each_entry_reverse(node, &path->comp_list, head) {
> +		comp =3D node->comp;
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);

[Severity: High]
Does this code risk a NULL pointer dereference or memory corruption?

If a driver is unbound concurrently, comp->dev.driver could become NULL.
The to_gtrace_driver() macro evaluates its argument twice locklessly:

#define to_gtrace_driver(__drv)   \
    ((__drv) ? container_of_const((__drv), struct gtrace_driver, driver) : =
NULL)

If comp->dev.driver is set to NULL between the two evaluations,
container_of_const(NULL) returns a bogus negative offset instead of NULL.

Even if it safely returns NULL, there is no NULL check for gtdrv before
dereferencing it on the next line.

> +		if (!gtdrv->start)
> +			continue;
> +
> +		ret =3D gtdrv->start(comp);
> +		if (ret)
> +			return ret;

[Severity: High]
If a component fails to start and returns an error here, do we need to
unwind and stop the components that were already successfully started
in previous loop iterations?=20

Returning immediately leaves the hardware components in a partially started=
=20
state, which could lead to hardware inconsistencies, resource leaks, or=20
unexpected DMA operations.

> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_path_start);
> +
> +int gtrace_path_stop(struct gtrace_path *path)
> +{
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +	int ret;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp =3D node->comp;
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);

[Severity: High]
This shares the same risk as gtrace_path_start(). A concurrent driver unbin=
d=20
or a missing driver could result in gtdrv being NULL or an invalid pointer,
leading to a crash when gtdrv->stop is checked below.

> +		if (!gtdrv->stop)
> +			continue;
> +
> +		ret =3D gtdrv->stop(comp);
> +		if (ret)
> +			return ret;

[Severity: High]
If a component fails to stop, is it intentional to abort the entire teardown
sequence early?

Returning on the first error prevents the loop from stopping the remaining=
=20
components in the path, leaving downstream components actively running and=
=20
consuming hardware resources indefinitely. Should teardown paths use a=20
best-effort approach to disable as many components as possible?

> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_path_stop);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D5
