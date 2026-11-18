Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012391;
	b=JsaVZxKh3Ad8UNBEOfczkH+DQI1u5gEhjj6uVQ/NdsgQazwHFjBg/Rwb90UOAa/Ljx7m
	 bi9dY+qVOVIGuRpl+59pxwKeIMyOKRYp/tBaByiieulHobh7xRbGXBkf1QPKYQSyHbu0H
	 9Ltrkyr0inn/WYCWieJLP4PXXtmdYvimkjVfakcOlHHyOXeg8royS5wujPHMK6y4jk/pW
	 nJkXld5DyyinDyCgIMReyQSSvdtYGTH4FtkqBeSkhXT76ENLWyiPzbGaML91o5Fe8vQwk
	 W2tT7hltarBPZUvAkADK9t1vX+uIqMA9YMZdIdur5oyx2zg/5arnYwicTINhadAN5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gE8KBW71nPxc4N6xgCF8I6HDw/1u+18iX8ngybPZOLQ=;
	b=g/9MoG9oWh9+I9+g7TzosyXExodjJ7hqd0yq1jCrqqPul7j8PfuD/XoSN5KgyMZQDfG/
	 BXRv0mArVPz7KewEzC43ZT2cneA9Psk2/7lscDhzSdQeaFo+/7jAUtszAuXozTApWDkPj
	 a/a3WKpbeEV2KVBDOg5ESR0/Oi4Fsb5v7R3unlsMhyJ3QCXGkzSoz2sPUzUzFn3iOs6QQ
	 JFASlxyVv0iR6eaX+S+8ZkgTeM8D2PeU/xO8SXNxW2Z5aci1jxsxLGLrsl0dgG2WUxuSt
	 C/pLcN8gWR7/WNV/IFqy1Yo7d9WPAQZN823KC3Vb97kymOjTN9WjtvrK9rYYDmeIKyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onFE+8Bb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B5606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onFE+8Bb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF1A1F000C6;
	Wed, 18 Nov 2026 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012391;
	bh=gE8KBW71nPxc4N6xgCF8I6HDw/1u+18iX8ngybPZOLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=onFE+8Bba2gTq+u8cm56M0ciCAxiQZhfBmQ/kIgX2B+dvp8vhzJ5o9Xzki/D6a0DP
	 avk0YQcUWOKcxNZgFyFX1T9e8/zTfnJoIuiUI1vwSMAvEMAZ4q2g6ZJU9kBiBHTKMK
	 tR9a1hts5GPJOLMz/g9tECaSzHk1LXa6bQk14oxocYpDksS2zIe0t6lDWguCLGG9vP
	 qyw1AdqkNNBNFkGXdxKTfjtWL/1C29N3ToX2rrnE+FVwdhE8cL9ycF6c9BvX75yPrB
	 V6azG0SE1ooCs9/yDr0GYqQXe32iWv+QzbVHhmhkIJaheb0EibIJSsrwH9ziV+OWRC
	 K4ix/+38Vbpuw==
Message-ID: <sashiko-outbox-221219@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/12] EDAC/versalnet: Add bounds validation in
 rpmsg_cb()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118142213.100581-5-shubhrajyoti.datta@amd.com>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-5-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:33:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] EDAC/versalnet: stale part_len on split-message failure in
  rpmsg_cb()
--

commit a43cb655a4c7983a62adb71672a8f139d96e6c3c
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

EDAC/versalnet: Add bounds validation in rpmsg_cb()

This commit adds bounds checks on the RPMsg payload's offset, length, and
total error length before indexing mc_priv->regs[] in rpmsg_cb().

> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 2d1417135e42a..0364648d91a1e 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -607,6 +607,13 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void=
 *data,
>  	length =3D result[MSG_ERR_LENGTH];
>  	offset =3D result[MSG_ERR_OFFSET];
> =20
> +	if (length > REG_MAX || offset > REG_MAX - length ||
> +	    result[TOTAL_ERR_LENGTH] > REG_MAX) {
> +		dev_warn_ratelimited(&rpdev->dev,
> +				     "Rejecting the faulty message\n");
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * The data can come in two stretches. Construct the regs from two
>  	 * messages. The offset indicates the offset from which the data is to

[Severity: Medium]
Does rejecting one part of a split message leave mc_priv->part_len out of
sync instead of discarding the entire message?

When the first part of a split message succeeds, rpmsg_cb() stores its
length in mc_priv->part_len and returns 0:

drivers/edac/versalnet_edac.c:rpmsg_cb() {
	...
	if (result[TOTAL_ERR_LENGTH] > length) {
		if (!mc_priv->part_len)
			mc_priv->part_len =3D length;
		else
			mc_priv->part_len +=3D length;

		if (mc_priv->part_len < result[TOTAL_ERR_LENGTH])
			return 0;
		mc_priv->part_len =3D 0;
	}
	...
}

If the second part then fails the bounds check and returns -EINVAL,
mc_priv->part_len is not reset to 0.  When the first part of the next
valid split message arrives, its length is added to the stale
mc_priv->part_len, causing rpmsg_cb() to report an error prematurely from
incomplete and stale data in mc_priv->regs[] and leaving mc_priv->part_len
desynchronized for subsequent split messages.

Conversely, if the first part of a split message is rejected (leaving
mc_priv->part_len at 0) and the second part arrives with a valid non-zero
offset, rpmsg_cb() does not check that offset matches mc_priv->part_len
and accepts the orphaned second fragment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118142213.1005=
81-1-shubhrajyoti.datta@amd.com?part=3D4
