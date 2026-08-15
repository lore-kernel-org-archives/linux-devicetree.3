Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7530C366
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786801177; cv=none; b=bXfDl5leSO9pYQvvIn725ucwCrZoJTztPjAqne19UrGbNuYfdiZT/WCwNOgEQ7PyBHdmyqGeVwMGCNv4heXn+wQuR2ZXV5fbqpwRtiHezgZut9dwhZ966tKms8XTIYGnDRntdx6Y7sBIq3RaBT3NDQpwwOBn/FTfG3COgWJHa0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786801177; c=relaxed/simple;
	bh=JP4HESHDwdVl2PBfxjPcF1qMXyH8XRkqOIHaq8wWqCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n/OZj9V0oO5TTS3N35CvTokV+XAVqHhpeN0brm3kBwLxlqiZFB3Wuam4fhbPMZv7eUv/8sWzgMgqnbsW432K8RJA1m3qZ/bqmONvlrfyTk8HXWc3pXCE39yPVYxcP/xj6343bsK1sK0ti88qjtIW+B+GBXqi3G0BxGCDF8VqDXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnBJ5jmw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnBJ5jmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0502D1F000E9;
	Sat, 15 Aug 2026 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786801176;
	bh=ZlvJ1s0jRHnpMb2XAlPL7N2mvnUp9XymCb1hrcKBreU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UnBJ5jmwQJvK+6igjIQLJvLqRkUJwL4AHDiTadLPhV4x0eDax955oky4gqt5B/Np/
	 YjJRDqKnAEDAb+1WPYG+sY6pi2oV5X+haBF9FJz+iXxWNXl1i6R6gGz85XP0ap+wfX
	 aWyD8GewUz0sonl7rfrhiigWIZPoMcxBlrZ+agxLQQbM51/962iT6LD8/DFpLszON+
	 YVwplSRnOJjeGKkoah0WM555eSnlFRPItsDrZ364LlbmiGO7laIbHsyeKnIX5wZ0Uh
	 o/ef0GfOpPUjEyrjoLQqlSy1GilrQJDmavtkQMKLPe3Vxl+ziz4cNRaYdi+Pm8zJdC
	 IHbdWdUZcIUwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] remoteproc: qcom: pas: Enforce coupled stop/crash
 for HPASS ADSP clusters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260815132541.1575121-8-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-8-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 13:39:35 +0000
Message-Id: <20260815133936.0502D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Canceling `pas->stop_work` before removing the member from `cluste=
r->members` creates a TOCTOU race window that leads to a Use-After-Free.
- [High] Coordinated stop state machine permanently deadlocks if a particip=
ant has multiple power references due to the use of `rproc_shutdown()`.
- [High] Concurrent crashes bypass the coordination barrier and prematurely=
 power off hardware, violating the cluster constraint.
- [High] Sibling auto-restart times out prematurely when the cluster root c=
rashes, leaving siblings permanently offline.
- [High] Lockless iteration of `cluster->members` in `qcom_pas_cluster_casc=
ade_work()` races with `qcom_pas_cluster_init()`, causing list corruption.
- [Medium] Concurrent crash of a cluster member inflates its `rproc->power`=
 refcount during auto-restart, preventing it from being successfully stoppe=
d by the user.
--

--- Patch [7]: [PATCH 7/8] remoteproc: qcom: pas: Enforce coupled stop/cras=
h for HPASS ADSP clusters ---
commit 6bd05de74159725dcc440502485f8bb8e3c952cb
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

remoteproc: qcom: pas: Enforce coupled stop/crash for HPASS ADSP clusters

This commit enforces a coupled stop and crash mechanism for Nord HPASS ADSP
clusters. It orchestrates a two-phase stop and hardware power-off sequence
across cluster members to prevent sysmon timeouts and recovery failures. It
also implements an automatic root-first restart sequence upon a crash.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index ef38a1929f56b..ac3b92c7e7e79 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> +static void qcom_pas_stop_work_fn(struct work_struct *work)
> +{
> +	struct qcom_pas *pas =3D container_of(work, struct qcom_pas, stop_work);
> +
> +	rproc_shutdown(pas->rproc);

[Severity: High]
If a sibling has an rproc->power refcount greater than 1 (e.g., booted by
multiple clients), rproc_shutdown() will simply decrement the refcount and
return without invoking qcom_pas_stop().

Since qcom_pas_cluster_stop_complete() would never be called for that
sibling, cluster->stop_done_pending will never reach 0.

Could this leave cluster->stop_in_progress permanently set to true and
deadlock the coordinated stop state machine for all future operations?

> +}
> +
> +/**
> + * qcom_pas_cluster_cascade_work() - restart a crashed cluster, root fir=
st
> + * @work:	the cluster's cascade_work

[ ... ]

> +static void qcom_pas_cluster_cascade_work(struct work_struct *work)
> +{
> +	struct qcom_pas_cluster *cluster =3D container_of(work, struct qcom_pas=
_cluster,
> +						       cascade_work);
> +	struct qcom_pas *pas, *origin, *root;
> +
> +	mutex_lock(&cluster->lock);
> +	origin =3D cluster->cascade_origin;
> +	root =3D cluster->root;
> +	mutex_unlock(&cluster->lock);
> +
> +	/*
> +	 * Membership is stable here: qcom_pas_cluster_exit() always
> +	 * cancel_work_sync()s this work before touching cluster->members, so no

[ ... ]

> +	if (root && root !=3D origin) {
> +		int ret;
> +
> +		ret =3D rproc_boot(root->rproc);
> +		if (ret) {
> +			dev_err(root->dev, "failed to restart cluster root: %d\n", ret);
> +			return;
> +		}
> +	}
> +
> +	list_for_each_entry(pas, &cluster->members, cluster_node) {

[Severity: High]
Is it safe to iterate cluster->members locklessly here?

If a cluster crash recovery executes concurrently with the probe of a new
cluster member, qcom_pas_cluster_init() could call list_add_tail() while
holding cluster->lock.

Could traversing this list without holding cluster->lock result in list
corruption or infinite loops?

> +		int ret;
> +
> +		if (pas =3D=3D origin || pas =3D=3D root)
> +			continue;
> +
> +		ret =3D rproc_boot(pas->rproc);

[Severity: High]
If the cluster root crashes, its recovery thread will trigger a coordinated
stop and schedule this cascade_work. Siblings are immediately booted here,
which eventually calls qcom_pas_cluster_wait_for_root(), enforcing a 1-seco=
nd
timeout waiting for the root to boot.

However, the root's recovery thread must still generate a coredump and load
firmware, which typically takes significantly longer than 1 second.

Will this cause the auto-restarting siblings to prematurely time out and
fail to boot?

[Severity: Medium]
When auto-restarting siblings, this loops through the entire cluster without
checking if the members actually participated in the coordinated stop.

If a sibling crashed concurrently and was excluded from the stop (its
stop_work didn't execute and its refcount wasn't decremented), unconditiona=
lly
calling rproc_boot() on it here will artificially inflate its rproc->power
refcount.

Could this permanent refcount leak prevent the remote processor from being
successfully shut down by the user later?

> +		if (ret)
> +			dev_err(pas->dev, "failed to restart cluster sibling: %d\n", ret);
> +	}
> +}

[ ... ]

> @@ -273,6 +364,9 @@ static void qcom_pas_cluster_exit(struct qcom_pas *pa=
s)
>  	if (!cluster)
>  		return;
> =20
> +	cancel_work_sync(&pas->stop_work);
> +	cancel_work_sync(&cluster->cascade_work);
> +
>  	mutex_lock(&cluster->lock);
>  	list_del(&pas->cluster_node);

[Severity: High]
Does qcom_pas_cluster_exit() have a race condition that could lead to a
use-after-free?

If a member is being removed, cancel_work_sync() is called while the member
is still in the cluster->members list. If a sibling concurrently triggers
a cluster stop, it can find this member in the list and schedule
pas->stop_work via qcom_pas_cluster_trigger_stop():

    list_for_each_entry(member, &cluster->members, cluster_node) {
        if (member =3D=3D pas || !member->in_cluster_stop)
            continue;
        schedule_work(&member->stop_work);
    }

Could this result in the work executing on a freed pas structure after
device removal completes?

[ ... ]

> @@ -625,10 +866,18 @@ static int qcom_pas_stop(struct rproc *rproc)
>  		mutex_unlock(&pas->cluster->lock);
>  	}
> =20
> +	if (pas->cluster)
> +		qcom_pas_cluster_trigger_stop(pas, rproc->state =3D=3D RPROC_CRASHED);
> +
> +	/* Phase 1: request and await this member's own graceful ack */
>  	ret =3D qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon);
>  	if (ret =3D=3D -ETIMEDOUT)
>  		dev_err(pas->dev, "timed out on wait\n");
> =20
> +	if (pas->cluster)
> +		qcom_pas_cluster_stop_barrier(pas);
> +
> +	/* Phase 2: the whole cluster has acked, power the hardware off */
>  	ret =3D qcom_pas_shutdown(pas->pas_id);

[Severity: High]
If a sibling crashes concurrently with the original stopping member,
qcom_pas_cluster_member_stops() returns false for it, excluding it from
the coordinated stop.

When that sibling's own recovery thread later calls qcom_pas_stop(), it sees
stop_in_progress is true but its in_cluster_stop is false. This causes it
to bypass qcom_pas_cluster_stop_barrier() and immediately call
qcom_pas_shutdown().

Doesn't this power off its hardware instantly while other participants are
still executing Phase 1, violating the constraint that no member shuts down
before the whole cluster has acked?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815132541.1575=
121-1-shengchao.guo@oss.qualcomm.com?part=3D7
