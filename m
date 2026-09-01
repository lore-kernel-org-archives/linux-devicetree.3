Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53D3F076C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227147; cv=none; b=FFsmQax3NNpvdok5uAGrpdYGtgSU6pxBPsZlDyWz3+6PF4crem4sLP3MWGB5psEmGJMWXi8kWVTxYq9m2VDxWJbLJrtB01Ynw1orkhV/CQDc95ks6e668YEfA8p4V1LjWDsIlzwTK3Tww4MepVQ1PA7lndNJjDSpiUQM89XTRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227147; c=relaxed/simple;
	bh=Z+snRrbCPgsvekexupoXsJeBd9JDeOvQO2F5IvHXdus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZjeHvYl1GTk1bdaI0yjw53bqP/+Hx6vYd5/UYaO+HSWr7WkfP5vtTQNBrtmQWri8edh5VPmejiT7ZFXE3DZR/7P1AjmZf1ChK49mm9bqhKhX2n0ajqZzsbjQUN7km7xKsSmImP4mJD6PSZQ7+AzufFVRYHSIPHB35Mt6yEQI3fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaH3GK4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaH3GK4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB2B1F000E9;
	Tue,  1 Sep 2026 01:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788227139;
	bh=FYV0/GOD7exl8/AMzqe015n3OY9ck3pnjk5mOuU1Hr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eaH3GK4KVxiTNrbAFGVl5VAwfiN8xr1goRovu0R4LxcpUc6mPqJpoZTg0YUrylWwJ
	 mMIPq09Q6pxblnoh/IppxiG+sjKDzFOWeZm+ADVczXhpsBxYRQcMUk0qWOOskerC1t
	 xIR7SOzqaX5Q1mP+W2qIAf/dvlVlvE3aq/tR2uzgRNNSX3V2pKQ+b6let5/fMzDDow
	 ui6kYLUus2bq2D67LeXhUrKfkgfvvPuqemPov8xMgUKEYB8NaHaVXcBUjPiDT2uK+S
	 4AJ8f+fXEUIlNcxqrx+jdb/uTjyybnOYk4BJVWbau3SbCPAHZ4RPUPETvSKV5pXJ57
	 1EAoJh2FfBROQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/10] of: update /aliases lookup on reconfig
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831-nh-of-alias-overlay-v7-2-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
 <20260831-nh-of-alias-overlay-v7-2-02754604805a@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 01:45:38 +0000
Message-Id: <20260901014538.BBB2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Lock-free access to the global `of_aliases` pointer in `of_find_no=
de_opts_by_path()` introduces a TOCTOU Use-After-Free race with dynamic ove=
rlay detachments.
--

commit e8d4ce869294e7247761b17acbbfb6ac98d74f68
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: update /aliases lookup on reconfig notifications

This commit registers a reconfig notifier to mirror /aliases property chang=
es
into aliases_lookup. The notifier chain covers changesets and overlays, mat=
ching
/aliases by name and root parent, and updates runtime-allocated entries.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+r=
enesas@glider.be/ [1]
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secret=
lab.ca/ [2]

>     The reference makes the lock-free
>     of_node_get(of_aliases) in of_find_node_opts_by_path() safe: a reader
>     that observes a non-NULL pointer observes a live node, and on DETACH
>     the changeset holds its own references across the notifier so the put
>     here cannot be the final one while readers still walk the node.

[Severity: High]
Is this description accurate?

If a thread calls of_find_node_opts_by_path() and is preempted immediately =
after
reading the of_aliases pointer but before calling of_node_get(), it could be
delayed arbitrarily.

If an overlay detachment completes concurrently, it drops the notifier's
reference and fully destroys the overlay changeset. When the preempted thre=
ad
resumes, wouldn't it call of_node_get() on freed memory?

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index f7aa14d90e501..23d9bb073d8b5 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c

[ ... ]

> +static int of_aliases_reconfig_notifier(struct notifier_block *nb,
> +					unsigned long action, void *arg)
> +{
> +	struct of_reconfig_data *rd =3D arg;
> +
> +	/* of_aliases may still be NULL when an overlay creates the node */
> +	if (!rd->dn || !of_node_is_aliases(rd->dn))
> +		return NOTIFY_DONE;
> +
> +	mutex_lock(&aliases_mutex);
> +	switch (action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		if (!of_aliases)
> +			of_aliases =3D of_node_get(rd->dn);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		if (of_aliases =3D=3D rd->dn) {
> +			of_aliases =3D NULL;
> +			of_aliases_forget_all();
> +			of_node_put(rd->dn);

[Severity: High]
Can this introduce a Use-After-Free race with dynamic overlay detachments?

This overlay detachment clears the global pointer and drops the reference.
As discussed above, a lock-free reader could be preempted in
of_find_node_opts_by_path() right before acquiring the reference:

    aliases =3D of_node_get(of_aliases);

If the reader is delayed until after the overlay changeset is destroyed,
the node memory can be freed. Will the preempted thread then dereference
freed memory when it finally calls of_node_get()?

> +		}
> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-nh-of-alia=
s-overlay-v7-0-02754604805a@nexthop.ai?part=3D2
