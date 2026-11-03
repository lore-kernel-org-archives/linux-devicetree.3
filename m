Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703399;
	b=B9AT8uAdMrzpaWcGZjOlNaLGWyVsXWU0nJ98AQnop3puwuYb1BMLyG/mIYQZa8E9yxrH
	 7To//elPMnF6HVr9pJpA3IupttFX+PBwlFSEtudsqOwbJcIBhaq7PBFtz7WOw/uDW7I/T
	 cvu240iWlXE1MBM8ABWBy8wa5k/44NbXkpUSnGCl9ensj23N3mXhB2RW+IoBv9Fzx+kdD
	 CHwaWTTEaq/C4gkZ/8N4lRmRaZ/3UkW+73R8weUBSfgMMUW1uEKfgDcU4eSiOY5noyCmZ
	 tZML69E7DNEpmlYokFImijdimQcc7Hps7ShQUfDxX+5uvSum6fGTl8095Am1wK+Fqww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703399;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X3uNTxzJ5UFNAWBq1CS/GtIwDgeixGPpAQXfyA/vaps=;
	b=qKyf5dF2VaymILJX37FUO/vFZ3hVo5EE97nCK9fYa/OfjrewIHfFpPBV0buSjASF86uu
	 pj+6YSZn9QnPa+0nPP3jyhCMXkecTN6l0P5cmnwBv35YQAlk7goLzPYsaMSSVXbI+p+dC
	 Pd3JGr8yg+IG0ZnjRqDgZwsoGmNkCYy+gTTdA+FeuFv1nd/i66Ahy7De7ewLnGoAyKXQ7
	 kFVuID0AV8PgXM3L2jBCdabmS+BTsCr/CeGm5paPXF2bjJjevvaaAzJCvKNhZ5RouFBSP
	 /JcL7zMfSdKBR0t62fXpcNNfzJ+I/ZfciSRPHtkj2x0QBY9r+KDlXBI3hLA1B4PFvVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mcUmT25q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727C606BA5A
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mcUmT25q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EDE1F000C1;
	Tue,  3 Nov 2026 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793703398;
	bh=X3uNTxzJ5UFNAWBq1CS/GtIwDgeixGPpAQXfyA/vaps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mcUmT25qZSbh7fuT5ECJvgDDHXDSTU0QPJ1Ae3HX2lMMqFIYdaqAW8iiJMlvspmdh
	 bwdwEktBSKE3A8iaHzRGEmLeezyUF2AyFL2GQ4RpDFFFHfplPiy1o0+933BHyh2IMd
	 4pAWVPbG8m0G6so9ZMdjlt6zzLxWad25TY4I7OY9nlvEl4nDRyLI5ZZWfv+djZPfd0
	 KbAxUCAzNxiSD5H6hTsTHRWNewtoCc/MREa0u7zmn6MIOgI5RX58kfJkb/2OAiTVfN
	 1zg3YbL1d9XZkG91S4TamrUjl/MPSt2nfluW0FfFcLgwiYgKoBovFyDzHT7l4vArGL
	 6Zl0i74y9dilA==
Message-ID: <sashiko-outbox-195086@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: unittest: fix node reference leak in of_notify()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103104236.1373612-1-vulab@iscas.ac.cn>
References: <20261103104236.1373612-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:56:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: unittest: extra of_node_put() in of_notify() causes refcount u=
nderflow
--

commit e1e7dd44b042cb6a35f29a5d1cce9e3a35006236
Author: Wentao Liang <vulab@iscas.ac.cn>

of: unittest: fix node reference leak in of_notify()

This commit moves the of_node_put(nd->overlay) call in of_notify() out of
the default switch branch so that it runs after all notifier actions.

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
Does moving of_node_put(nd->overlay) outside the switch statement cause a
reference count underflow on nd->overlay?

Before the switch statement, of_notify() acquires a single reference on
nd->overlay:

drivers/of/unittest.c:of_notify() {
	ret =3D 0;
	of_node_get(nd->overlay);

	switch (action) {

	case OF_OVERLAY_PRE_APPLY:
		found =3D of_find_node_by_name(nd->overlay, "test-unittest16");
	...
}

In all four valid action branches (OF_OVERLAY_PRE_APPLY,
OF_OVERLAY_POST_APPLY, OF_OVERLAY_PRE_REMOVE, and OF_OVERLAY_POST_REMOVE),
nd->overlay is passed as the from argument to of_find_node_by_name(), which
unconditionally drops a reference on from via of_node_put(from).

Only the default branch does not call of_find_node_by_name(nd->overlay, ...=
).
With of_node_put(nd->overlay) moved after the switch statement, every valid
overlay notifier action acquires one reference and drops two references on
nd->overlay, prematurely releasing the node while the overlay changeset is
still using it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103104236.1373=
612-1-vulab@iscas.ac.cn?part=3D1
