Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477D3BD635
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429362; cv=none; b=Pt8m0U87xJz5F8Bt6DBEcKq6KyjjOcn5vk4L27QttIaXJ2uVOQExRQ0S2eQ3kLHbGVjwIa4BGvrEWJFtKpw5U/uLDWjIf2ucTteI/UodY70Y4nVrbajXFohynLvBDLbanEH9bqf+7npoXiUFW/c5PY+WDasZP2VOxSeyW9Vg8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429362; c=relaxed/simple;
	bh=jTBTENqLnAfn2XOZzWFUoZxTCKIAKjj31QqEG0QcGBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pVrlNJmE8cLpqjAtnHyOcHvme3sW+8q73x0QnvRku8uPeUnsc61ls7wuAvXoKAJX+UFgYE4ug4fQBArA1pWWwG2mQ3L6k2JBkm0HVyRzm2AIUnqgpeT5QU1YqcEtMlUyZ9T09O33u4KeDj+FJlR3JxxCM66f3o2KsJFY2E0LSyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgjF+wIv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgjF+wIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624361F000FF;
	Sat, 26 Sep 2026 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429360;
	bh=IC/VVJ1Bm5oTxEehklk7YbEM6GcMDPPToGH/v274ptY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XgjF+wIv75/l6hHmnpWpoXL9OP2iyLqtBbCOQ9u7dP4b1Z8J4EGzCyLFcO66ZH4wK
	 PHHrxv0XZK7dBrubqN/ACeSjFZKFGreDs499h8WLw/L7VjUpW5iFr0PZa9e3U78AdE
	 RMZmZhIHiqp+obyla8jp0p8ZYAz0liL7hiwPCEpubJQxLEnPcp5SZQzeiEo3G0ljYs
	 Yj/YZyDadbRo631pdNHDdhVgMqHaviEluzQ7PY8CrWSvA9fMNtFA6PNOSxt1B1hqcc
	 qhvCbRPb/C5hC7fQ3WjKGAXdF3fJm05gd6frgWESJkf8L+vThiZeZA8GNyJQ7NlHxI
	 m7CKRdxQwrXew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/17] media: v4l2-ctrls: validate av1 tile info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-avd-v2-4-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-4-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:29:19 +0000
Message-Id: <20260926132920.624361F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: v4l2-ctrls: out-of-bounds context_update_tile_id due to inc=
orrect validation
--

commit e21c9b1dec9408bc9aafb56a531be7a72e6ad344
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: v4l2-ctrls: validate av1 tile info

Many drivers use tile_cols and/or tile_rows, so make sure they are
valid.

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 9caca56478d1a..f1d5049810747 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -800,10 +800,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl=
_av1_film_grain *fg)
>  	return 0;
>  }
> =20
> +static int validate_av1_tile_info(struct v4l2_av1_tile_info *ti)
> +{
> +	if (ti->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
> +	    ti->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
> +		return -EINVAL;
> +
> +	if (ti->context_update_tile_id > ti->tile_cols * ti->tile_rows)

[Severity: High]
Does this boundary check allow an out-of-bounds tile ID?

Since context_update_tile_id is a 0-based index, the valid IDs for a frame
with N total tiles (where N is ti->tile_cols * ti->tile_rows) should range
strictly from 0 to N-1.

Because this check uses the strictly greater than operator (>), a value
exactly equal to the total number of tiles will pass validation. Downstream
stateless decoder drivers (such as the Rockchip VPU driver) calculate and
program this tile ID directly into hardware registers. Instructing the
hardware to use an invalid, out-of-bounds tile index for CDF updates can
lead to out-of-bounds DMA memory writes or VPU hangs.

Should this use greater than or equal to (>=3D) instead?

> +		return -EINVAL;
> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D4
