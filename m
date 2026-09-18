Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C11C6FF5
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723019; cv=none; b=GT75TP2cIYB34Fb7vKoyBvC/jHnJsNKxKY8apXmpMBKYcrdtgaVLPjO2kJMvvWU+tZVrf2+D13S/T6HKXqrJ+Lu0ZrT2t2K9j/35LkUzguSq/ro2ZqMA0ZFCoQHu5tYtdq6YH+Sdb1G8GBPH+PCwBSly2LImfrJ9XowALedjeq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723019; c=relaxed/simple;
	bh=tpTwWQbvd/R9RtnaVzw+ZATmbgAXO20+pZr3EJCdZoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bMxZE+ghAGb6buBPT6pH64lmYI5aMqf7HiYwKsYak8mB24WW+QKM9iyypMdAb/44MDbXMNjP5v+/P9WxK0suskdN9GnMWVrq+sivwDOytXHt3wdPLS5sh7uqSsulfVZAzuR7p0X4Tqlz+NzYXRhui3Y/mMU8JVUnQDvJTOUPGn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9SR9X0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9SR9X0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1381F000FF;
	Fri, 18 Sep 2026 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723017;
	bh=JYOQbpmB+SZVy9XRpfg4JS8xlHck1lkMeOHPXUsEbuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M9SR9X0BbBlyt2F/n+EDex29UDODxq9hFhRFih12yUUA4X85XeaR76VyddeJFEPaC
	 vtz70VQcIUffMA/3phLJHvGOGNqttVolGfLMMcxb9ajAbJhkHyn47MLLLzJGTVB1Im
	 tNd83YnVNXV9ITa2wPDgIK0JNmS5hHyUEBW98IBiBkKg86fQmViubV+YbsTPqCcchs
	 yXep/cHCLWZwpAY5nZVNggRpvOFxwOLfGCtzWD+OfoLn3ZGk1qa6B7kPMu03WwfNSh
	 3t+8irx83dVdNI5WsxoBx4BVSifFPgtXFd++mHnXc3Vtlw3cL5L560bL+K5C2NE2F7
	 omnTY826yj4Tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/21] media: i2c: it6625: require a DT endpoint and
 simplify endpoint parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-17-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-17-78d72d7886a5@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 09:16:56 +0000
Message-Id: <20260918091657.4F1381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dev_err() unconditionally logs -EPROBE_DEFER causing boot log sp=
am
--

commit 60b825e6a08d82d6c62f40c034de7563ec028e05
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: it6625: require a DT endpoint and simplify endpoint parsing

This commit removes hardcoded configuration defaults that were applied when
no CSI-2 endpoint was found, requiring the configuration to come entirely
from the device tree. It deletes the early return for missing endpoints,
allowing the fwnode parser to handle the NULL fwnode and return -EPROBE_DEF=
ER.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 4a54de2eb42bb..5fa8441f07369 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c
[ ... ]
> @@ -2098,13 +2095,6 @@ static int it6625_parse_endpoint(struct it6625 *it=
6625)
>  			of_node_put(port_ep);
>  	}
> =20
> -	if (!ep) {
> -		it6625->port_num =3D 1;
> -		dev_dbg(dev, "no CSI-2 endpoint node found, using default %u CSI lanes=
",
> -			it6625->csi_lanes);
> -		return 0;
> -	}
> -
>  	ret =3D v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(ep), &endpoin=
t);
>  	of_node_put(ep);
>  	if (ret) {
>  		dev_err(dev, "failed to parse endpoint: %d", ret);

[Severity: Medium]
Looking at it6625_parse_endpoint() in drivers/media/i2c/it6625.c, since the
early return for !ep was removed, a missing device tree endpoint node resul=
ts
in ep evaluating to NULL. In this case, v4l2_fwnode_endpoint_alloc_parse()
intentionally returns -EPROBE_DEFER.

Since dev_err() is used here instead of dev_err_probe(), will this
unconditionally print an error message on every probe deferral retry and
cause boot log spam? Should dev_err_probe() be used here instead to
silence the -EPROBE_DEFER message?

>  		return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-upstream-i=
t6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw?part=3D17
