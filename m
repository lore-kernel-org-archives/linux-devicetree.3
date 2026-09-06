Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52663B28D
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788721421; cv=none; b=ZYgAF4HV+FMvulBpyanzRxVrvadxBspBlg4kGlWT0C9g8DN9bPdkvJidjwlCUXDazTTM0/83AaNKuZA3yIGJ+lwjTGBsv5huXSOwLaYq/tq18CM/hq0gNcWqq0JHmQaMgdSp2O8tkpzsVCvEo6h6Qdw7EoGPAIbeSx+K2m0XY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788721421; c=relaxed/simple;
	bh=sI/jYU5JoEM77t2GqSDAUjpw7I+7BrvOZe6F2RHk+OY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qwxrzxoaXDytPUPHUXM9BwdbHW1ipz+RJzmF9pcU7tcYaKHZk0O5Fe5fNPyQ7GfuxlbII3YGPYJXabm4EoECx38YTflFABk9YuFpzuzn7bmoc4lt0SU08D12JUESQVgrgIxwzQpw1+iTymPatkzx8vX0+ZsTfKfxUYZK3qBFtxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCvd3D3r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCvd3D3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B761F00A3A;
	Sun,  6 Sep 2026 19:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788721420;
	bh=97rbfvrKgmnY+otgCz/9rQJTkcrmexZ+cBGK4zwXNF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HCvd3D3r5xjquaF2Da0ZjtyZqTNlp+kFkycQFSkhgvXtdlbc4QfuUjqaAhmXzemF6
	 6Mmp+IK3QVrtSmIXMSLTKcuESPY6a3ODlk/2e9lBdB5Q5Osy1yHr3EJjfcfZVjGZWL
	 elAW9I9Y+v8Kn/r1IQneUXMSbKKqpd935fVP4fFcZHyMkQQJ9mvC7cWxSPDjFZxnI5
	 cGzbLUX0Kmp9/XLdUFQM2Qk2LFDcAKLaXImMNFD1IwAZl+djYbiORLvOF/fn9kaWcY
	 dJD1XXjdbK4GLd3aUOP8bW+GD9sB4HYGisuagSo9F6PEB3/3SYDGIHdkNNcmT0CuBy
	 S63hfGRb6zPBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/22] thunderbolt: Unlock host router ports during
 startup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-10-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-10-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 19:03:39 +0000
Message-Id: <20260906190340.01B761F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Empty downstream ports of the host router are not unlocked during =
system or runtime resume.

Pre-existing issues:
- [High] A concurrent execution of `tb_remove_work` during domain teardown =
causes a NULL pointer dereference because the work isn't fully synchronized=
 before resources are cleared.
--

commit 26f03f28fcb6a632e2cb7c69ea5f90adb5f5b97b
Author: Sven Peter <sven@kernel.org>

thunderbolt: Unlock host router ports during startup

The downstream ports of the host router may still be locked after a
reset. Unlock them when the software connection manager starts before
scanning for any connected devices.

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 47753a5c0f2eb..bf1c192ec10a5 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3049,6 +3050,14 @@ static int tb_start(struct tb *tb, bool reset)
>  		return dev_err_probe(tb->nhi->dev, ret, "failed to add host router\n");
>  	}
> =20
> +	/* Make all host router downstream ports accessible to the CM. */
> +	tb_switch_for_each_port(tb->root_switch, port) {
> +		if (!tb_port_is_null(port))
> +			continue;
> +		if (tb_port_unlock(port))
> +			tb_port_warn(port, "failed to unlock port\n");
> +	}
> +

[Severity: High]
Does this logic also need to be applied during system or runtime resume?

If the system resumes from sleep and the hardware resets to its default
locked state, it appears empty ports might not be unlocked.

In drivers/thunderbolt/switch.c:tb_switch_resume(), tb_port_resume() is
used to check if a port had a connected device:

	tb_switch_for_each_port(sw, port) {
		if (!tb_port_is_null(port))
			continue;

		if (!tb_port_resume(port))
			continue;

		...
		} else {
			/*
			 * Always unlock the port so the downstream
			 * switch/domain is accessible.
			 */
			if (tb_port_unlock(port))
				tb_port_warn(port, "failed to unlock port\n");

Because tb_port_resume() returns false for empty ports, the loop will
continue early and skip the tb_port_unlock() logic.

Will this prevent the software connection manager from discovering
downstream routers plugged in after wake?

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential race
condition with tb_remove_work() that could lead to a NULL pointer
dereference during driver unbind or hot-unplug.

In drivers/thunderbolt/tb.c:tb_stop(), the driver attempts to cancel the
cleanup workqueue using a non-blocking cancel:

	cancel_delayed_work(&tcm->remove_work);

If tb_remove_work() is already executing and waiting for tb->lock, it will
continue execution once tb_stop() releases the lock. Meanwhile, tb_stop()
proceeds to set tb->root_switch =3D NULL.

When tb_remove_work() acquires the lock, it observes tb->root_switch is
NULL:

drivers/thunderbolt/tb.c:tb_remove_work() {
	...
	mutex_lock(&tb->lock);
	if (tb->root_switch)
		tb_free_unplugged_children(tb->root_switch);
	mutex_unlock(&tb->lock);

	tb_free_unplugged_xdomains(tb->root_switch);
}

After dropping the lock, it unconditionally calls
tb_free_unplugged_xdomains(tb->root_switch), passing the NULL pointer.

Because tb_free_unplugged_xdomains() lacks a NULL check, can this
immediately dereference the pointer in the tb_switch_for_each_port() macro
and cause a panic?

>  	/*
>  	 * To support highest CLx state, we set host router's TMU to
>  	 * Normal mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D10
