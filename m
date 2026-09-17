Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F24AF67F
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649562; cv=none; b=rmBmftHg94eMiDv1zuELGbYxFQCJdZnki0cfCfdFRct9iq0VodCDMGL9kthdIGk05mE3m2sNwF2un2QWxw2+rIJctynyr5ck6QfHsursE3tzTsTWYqULEhedaCnvUkMcZgY9m2yjLQa+SAt0WPjtDLBqqT6qBVcShtj0UNE5Ppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649562; c=relaxed/simple;
	bh=Nv/AeZqB1i7T4EDS33Kmpqyp4PSKWKVwoi9VnEv7Mpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZmWbjesX8Z+AtT/MeDVyqKO0Cv3SBQ+XjEHbgUD9N8hB3EnW1S55HmXVrcBvagFuJhzWfj+DUK+kDC3iqbN5PawPY0vPlGmeUrFOXklOXYHdrz9firwRUgzR5Nlh1iFPO7gFjoKEbDLydE0ifXPp9p55ubtmxRybeYqpuvH2+Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcPkDlLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcPkDlLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DD31F00893;
	Thu, 17 Sep 2026 12:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789649547;
	bh=8oXOl5GgdOqpWulbJgaUMuKKXzbgT7prJLQrKiHc/gc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QcPkDlLbnc1I8KoHqpY8t1m6Ro3Lgk1BYe7pPYt2+0M8R5FJHjBT/yWgmGH6nCvBM
	 qEsqatnOlSItX52iyLHhwPkv422boJdywn2YlUm44k/MjOUg7H0pstUqhP4FbsqPYv
	 ZopTMvvupiPmbmGYS+UZkF1TZZGUiBKvEw1zmt0itGuN4PvOvPamL2wcB1aIylDZU2
	 y06nITlXYk6GbwSWe80fy3756eJCe+nEgaGzAkUxnoeTgtljYneCociWC/ezXl0csy
	 364SMQpj3kizZdc0dIRT/kvAsBpMg0qInfhIvD3/IhRvuwhzON5vf0PFsQfeX6pnm/
	 CHUlw2agnTeEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: unittest: Fix overlay node reference leak in
 of_notify()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917124457.2151809-1-vulab@iscas.ac.cn>
References: <20260917124457.2151809-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:52:27 +0000
Message-Id: <20260917125227.80DD31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: double-free of overlay device node in of_notify()
--

commit 2fb07d7f45ad569912e3b48cd4b44d5fe901b5ee
Author: Wentao Liang <vulab@iscas.ac.cn>

of: unittest: Fix overlay node reference leak in of_notify()

of_notify() takes a reference on nd->overlay but only drops it in the
default branch of the action switch. The PRE_APPLY, POST_APPLY,
PRE_REMOVE and POST_REMOVE branches return without dropping it, so the
reference is leaked on every notification. Move the of_node_put() to the
common exit path.

> The PRE_APPLY, POST_APPLY,
> PRE_REMOVE and POST_REMOVE branches return without dropping it, so the
> reference is leaked on every notification.

Is this description accurate?

Looking at of_find_node_by_name(), it explicitly consumes and drops the
reference count of its from argument. Since these branches all call
of_find_node_by_name(nd->overlay, ...), they appear to naturally drop the
reference on nd->overlay.

Could the commit message be clarified to explain what exactly is leaking?

> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e255f54f4d760..3202781998808 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -3460,11 +3460,12 @@ static int of_notify(struct notifier_block *nb, u=
nsigned long action,
>  		break;
> =20
>  	default:			/* should not happen */
> -		of_node_put(nd->overlay);
>  		ret =3D -EINVAL;
>  		break;
>  	}
> =20
> +	of_node_put(nd->overlay);

[Severity: High]
Does moving this of_node_put() into the common exit path cause a double-free
of nd->overlay?

Since the non-default branches already consume the reference via
of_find_node_by_name(nd->overlay, ...):

	case OF_OVERLAY_PRE_APPLY:
		found =3D of_find_node_by_name(nd->overlay, "test-unittest16");

will this unconditional put at the end of the function result in a second,
unbalanced put on all valid notification paths, potentially leading to a
use-after-free during the OF unittests?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917124457.2151=
809-1-vulab@iscas.ac.cn?part=3D1
