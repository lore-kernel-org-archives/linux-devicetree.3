Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03AC356744
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360638; cv=none; b=lLkhY9rQfZYyQpAOvmIzbiFDUHZtZ2cL5Uh0bL7l3gBsfm8sQZV/qn5bxwSc17HIgKRFm3X4HQ/GexWeeUtO5Xc4yS/0oDDaEFFR9FSY73tHmvfWKYFj30Dbl7M0dcGiqbmK0UFvhG/crOvMP8rhy9z/ACAJe3qpiDB99501TJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360638; c=relaxed/simple;
	bh=kJNCL1LLifMin2bc7uH4kjGNGknslNwkjX4WuIVTPM4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GudQ7PUkkFIuurANbC9hHk0hZmgpZEITRNzpSs0fI9VPY+J8jMLq8l+AE66Hz+dvLMKBO0sXma4hgal05/goHfEzzMW4qNfGmFeDTHz59JKONfiXm2D6R0E2GoJq9YEYqYJxshud4mItQWHgymIYwG/tPwByOuIttWTvJh4R4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+VyP//K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+VyP//K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525031F000E9;
	Mon, 10 Aug 2026 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360636;
	bh=oIVGABIDxeFCAPtYczO0HwPJcema9lIcZyJApwdqTJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+VyP//KZ4cO04uJd8W0qjxXgOGW2QqBWyXg8gO/yJ7Kk9q4vmsxam+gIjy6sUU3/
	 DpG5zxUcE9H/b5/mFvibWKMF4R8ZjMpEbQPq0zwk6mRXsheCWs4CGLqIo8DtsrtaTD
	 akd12wxxAdoxQj4w/sTkyhdIGoYlN7fTTPKWaICweXzAovz7rIyFdMuY1LvHjv55rj
	 4hd1IxyiEp7CqXJoGzslf9KxFcMRrbAb5qQcat5Lf+vmbvYxx2dm/GW965/4LfebZr
	 reyzkn9M9BBvhZV/fyJ3KwWEGyLOQc0FvhR6DwE1dL/Wz4OiiC4h0iY4+HuadWzhKl
	 C45+nwMC59dkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: add HPASS ADSP cluster
 boot-order and SSR coupling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260810110726.775084-3-shengchao.guo@oss.qualcomm.com>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
 <20260810110726.775084-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:17:15 +0000
Message-Id: <20260810111716.525031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unprotected iteration over `cluster->members` in `qcom_pas_cluster=
_stop()` leads to list corruption and use-after-free.
- [High] Premature clearing of `restart_pending` by the root instance cause=
s an infinite cascade of crashes during recovery.
--

--- Patch [1]: [PATCH] remoteproc: qcom_q6v5_pas: add HPASS ADSP cluster bo=
ot-order and SSR coupling ---
commit 644aec14bb718175878ea77cb26cb7732aee67b2
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

remoteproc: qcom_q6v5_pas: add HPASS ADSP cluster boot-order and SSR coupli=
ng

This commit introduces a boot-ordering and coupled-SSR (Subsystem Restart)
mechanism for Qualcomm SoCs with multiple PAS instances grouped into a clus=
ter.
It uses a shared qcom_pas_cluster object to serialize boot so that the root
instance boots first, and ensures that a crash or stop on one member brings
down and restarts the entire cluster together.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index ca8e61254c449..61e8dc64e2ad9 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -433,6 +433,18 @@ static void qcom_pas_cluster_mark_booted(struct qcom=
_pas *pas)
>  {
>  	struct qcom_pas_cluster *cluster =3D pas->cluster;
> =20
>  	if (cluster->root_node !=3D pas->dev->of_node)
>  		return;
> =20
>  	mutex_lock(&cluster->lock);
>  	cluster->booted =3D true;
>  	cluster->restart_pending =3D false;
>  	mutex_unlock(&cluster->lock);

[Severity: High]
If a member crashes, qcom_pas_cluster_stop() sets restart_pending =3D true =
and
initiates recovery on all members.

If the root member completes its recovery (rproc_stop, coredump, rproc_star=
t)
and calls qcom_pas_cluster_mark_booted() before another member enters
qcom_pas_cluster_stop(), won't the root clear restart_pending prematurely?

When the slower member finally executes qcom_pas_cluster_stop(), it could
observe restart_pending =3D=3D false, assume it's a new crash, set it to tr=
ue
again, and trigger another round of crashes.

Could this regression lead to an infinite cascade of crashes?

> =20
>  	wake_up_interruptible(&cluster->wq);
>  }
[ ... ]
> @@ -1036,6 +1036,36 @@ static void qcom_pas_cluster_stop(struct rproc_sub=
dev *subdev, bool crashed)
>  {
>  	struct qcom_pas *pas =3D container_of(subdev, struct qcom_pas, cluster_=
subdev);
>  	struct qcom_pas_cluster *cluster =3D pas->cluster;
>  	struct qcom_pas *member;
> =20
>  	mutex_lock(&cluster->lock);
>  	if (cluster->restart_pending) {
>  		mutex_unlock(&cluster->lock);
>  		return;
>  	}
>  	cluster->restart_pending =3D true;
>  	cluster->booted =3D false;
>  	mutex_unlock(&cluster->lock);
> =20
>  	list_for_each_entry(member, &cluster->members, cluster_node) {

[Severity: High]
Can this iterate over cluster->members concurrently with list modifications?

Since the iteration occurs entirely outside of cluster->lock, it seems to o=
pen a
race window if a user unbinds a PAS driver while the cluster is stopping.

qcom_pas_remove() takes cluster->lock, removes the node, and frees the obje=
ct:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_remove() {
    ...
    mutex_lock(&pas->cluster->lock);
    list_del(&pas->cluster_node);
    mutex_unlock(&pas->cluster->lock);
    ...
}

Would it be possible for this regression to cause the unprotected
list_for_each_entry() to hit a poisoned list pointer or call
rproc_report_crash() / schedule_work() on a freed member?

>  		if (member =3D=3D pas)
>  			continue;
> =20
>  		if (crashed)
>  			rproc_report_crash(member->rproc, RPROC_FATAL_ERROR);
>  		else
>  			schedule_work(&member->cluster_stop_work);
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810110726.7750=
84-3-shengchao.guo@oss.qualcomm.com?part=3D1
