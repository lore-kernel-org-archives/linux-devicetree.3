Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF842AEF5
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800883; cv=none; b=tE9/j/0EMqivIdozYkSlUb6MoTmeYzMpwJ+NHwpX4zhjW81wZJUPN0ZSrsAWeT2+Hrxd2fMRs6rvoJxmaZ1Qk17D2T7/jxpC19UdMLVyWAOsAMKhMdsG/OgfKbvn3eJie2GDtfXdjvTRzaJhliEfaZD9RZRPs2LTSm+L5vS2pv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800883; c=relaxed/simple;
	bh=Dc25uHRR3BGRjUk4NAR8DnWVO2iUstLlR1mzhZJ9nG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pTmcqaDYgh7f0cFCLfOFMxFxb+/G9NhmyFeZxZhT7A7K3nKDJHXW1kNaf6GSRyzuYpri81e6DTQ/i8EXWXCwmMbwWzvHh6VgAg6qWbeZCs1Y6jTl6lr7COHdrUOBBXpMDbt+eQSnGE+puG5WaXzsTeHNpSiGdodB0Ecs6ox/5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYmbvmb+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYmbvmb+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369171F000E9;
	Sat, 15 Aug 2026 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786800881;
	bh=eoVrl+YJsPm2G7od1hCUmGOHbDnJ1h1AtjguamArfi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PYmbvmb+Lbp9rDjcZfrUgh3ZfM3fz/ibPEj2waDrQshphqmjIC+4P+Q/+hrolKxvX
	 u+1rZePchgq/dxybEucFWmhAsBhpcXIdLAfLqXfm40vyke9SnDZKUEXdr44e7eho97
	 W29oUlm+c52j78ZZXqasAbZptJOE8pUJkr7P/EIFHz0WyZ7Cy0eFJvSrtMvxWfB1RP
	 tdy95XObuA3bk/5+cjJUbHAQSHw/yla4xTw6uWyrtb8oxojJvhzJnPnYmkY9bvkNC5
	 2q27uR4Abx0Kd2meMJCGbbJwfMGPPeLuuIqV2X8UhqMd2uocrPsIH7pUkurWseYQsz
	 5okoMKROc2MtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] remoteproc: qcom: pas: Sequence HPASS ADSP cluster
 boot root-first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260815132541.1575121-7-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 13:34:40 +0000
Message-Id: <20260815133441.369171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Accessing `root->state` outside `cluster->lock` without holding an=
 `rproc` device reference causes a Use-After-Free if the root device is unb=
ound concurrently.
- [High] Missing state check after `wait_for_completion_timeout()` complete=
ly breaks boot sequencing, allowing dependent members to cold boot before t=
he root.
- [Medium] Concurrent execution of `reinit_completion()` and `wait_for_comp=
letion_timeout()` causes a data race on `cluster->root_booted`.
--

--- Patch [6]: [PATCH 6/8] remoteproc: qcom: pas: Sequence HPASS ADSP clust=
er boot root-first ---
commit 7abf00410ddb06041e837e4d053d61bb3ef43922
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

remoteproc: qcom: pas: Sequence HPASS ADSP cluster boot root-first

This commit gates dependent member boots on the cluster root having started.
It introduces a wait mechanism using a completion to handle racing dependent
member restarts with the root's start and stop paths.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index dc6e7d601a9bd..ef38a1929f56b 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -267,6 +283,51 @@ static void qcom_pas_cluster_exit(struct qcom_pas *p=
as)
>  	pas->cluster =3D NULL;
>  }
> =20
> +/**
> + * qcom_pas_cluster_wait_for_root() - gate a dependent member's boot on =
its root
> + * @pas:	the non-root cluster member being started
[ ... ]
> +static int qcom_pas_cluster_wait_for_root(struct qcom_pas *pas)
> +{
> +	struct qcom_pas_cluster *cluster =3D pas->cluster;
> +	struct rproc *root;
> +
> +	/*
> +	 * The root's PAS instance is enabled in DT (checked in
> +	 * qcom_pas_cluster_init()) but has not necessarily bound yet, and may
> +	 * have unbound again. Without it there is nothing to sequence this
> +	 * member's boot against.
> +	 *
> +	 * Note that nothing refcounts members across unbind, so a root freed
> +	 * under a concurrent sibling boot remains unhandled.
> +	 */
> +	mutex_lock(&cluster->lock);
> +	root =3D cluster->root ? cluster->root->rproc : NULL;
> +	mutex_unlock(&cluster->lock);
> +
> +	if (!root) {
> +		dev_err(pas->dev, "cluster root not bound\n");
> +		return -ENODEV;
> +	}
> +
[Severity: High]
Is there a risk of a use-after-free here if the root device is unbound
concurrently?=20

Since the cluster->lock is dropped above and no reference is taken on
the rproc device (e.g., via get_device(&root->dev)), could root be freed via
devres before we evaluate root->state?

> +	if (root->state =3D=3D RPROC_RUNNING || root->state =3D=3D RPROC_ATTACH=
ED)
> +		return 0;
> +
[Severity: Medium]
Could this wait_for_completion_timeout() race with the reinit_completion()
called in qcom_pas_stop()?=20

In qcom_pas_stop():

	if (pas->cluster && pas->is_cluster_root) {
		mutex_lock(&pas->cluster->lock);
		reinit_completion(&pas->cluster->root_booted);
		mutex_unlock(&pas->cluster->lock);
	}

Since the wait happens outside the cluster->lock but reinit_completion()
modifies the completion directly, does this result in a data race on
cluster->root_booted?

> +	if (!wait_for_completion_timeout(&cluster->root_booted,
> +					 QCOM_PAS_CLUSTER_ROOT_BOOT_TIMEOUT)) {
> +		dev_err(pas->dev, "cluster root not started\n");
> +		return -ENODEV;
> +	}
> +
[Severity: High]
The commit message mentions that the dependent member "falls back to failing
on the root's state" when it observes a stale completion.=20

Since cluster->root_booted is initialized as signaled during probe via
complete_all(), wait_for_completion_timeout() will immediately return succe=
ss
here on a cold boot.

Are we missing the fallback check to re-evaluate root->state before returni=
ng
0? Without it, dependent members might successfully bypass the wait and
cold boot before the root.

> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815132541.1575=
121-1-shengchao.guo@oss.qualcomm.com?part=3D6
