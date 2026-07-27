Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4C3DE451
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141529; cv=none; b=mM0xAYlY6rz2FfjrJxxxn+6bPjACqcbxt4HU+xOd+Hd1yz1lVq4oMj1NXyMleLiY1DO6LwxYDvPZLZlII9gLLGepeupHg9/DhmIt6ShMfdl3ld1Ld4bX63TIS/7JvddXNg5lQsdG8V0pN8TU/eqfOTc728E6fxRqEDb33qlaK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141529; c=relaxed/simple;
	bh=jB5M4bYhsocIGAuDvT9EqOw8R2zyITHy1nknUJ1z0HE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H72eDhSm4RjExoVw2Ia2T7oLomSOzj69BTk0Kh0kOOBJpw5/SjJf0Vdvny5f4r91rvInARCBf+o5C93ys4Y1kHufJwKUFoK8XonLnHoHrepG1c1erUvwlOzfeBzfAsSFJeF0F3djZG1XPxkKUygxKUOet5mLgVf5oioKKTI4m2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khfLSRUU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khfLSRUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25DE1F000E9;
	Mon, 27 Jul 2026 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141527;
	bh=dr0lLmfx4OmJUgJ2ouISQQufmv2rJBn0T1rZA/rMD1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khfLSRUUwvohVqj0Tq937oVqBAi6FvePAvdXyFy15hUlrcIYvaZjD0ovSMzvC2lSp
	 iI1yqof5M/DLv8ONPz+qw5ly50D+U7IXItjsyMMt9jRTgyiNlmJkwgZ/fuY4+0eCPH
	 CkQAkdoFDxTxWT7pYlHp9ZWWrk20nS+0zi5pga/KM3sjFDx40nhTNfVKdgH5HkVd6W
	 Dz+0zH5/BY8qpC4Eg+uTqfp5kuxKN7CPWydNMegVZ9MrUaTk+IC4q/FhN76hI2r5U2
	 2LJr/hgmQIRb2NR5gkTnd8SYyCpJs5TzStdK5UrHtsooINGvteLTDNacO8Ra0z7gRY
	 wAMb+AcyaaAbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260727-mira220-v9-2-e869e7ec2040@ideasonboard.com>
References: <20260727-mira220-v9-0-e869e7ec2040@ideasonboard.com>
 <20260727-mira220-v9-2-e869e7ec2040@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:38:47 +0000
Message-Id: <20260727083847.A25DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unused `fmt` field in `struct mira220`.
--

--- Patch [2]: [PATCH v9 2/2] media: i2c: Add driver for AMS-OSRAM Mira220 =
---
commit 1a645456404fc78085c443f892a4b50ad94cb5ab
Author: Philippe Baetens <philippebaetens@gmail.com>
Subject: media: i2c: Add driver for AMS-OSRAM Mira220

This commit adds a V4L2 subdev driver for the AMS-OSRAM Mira220 image senso=
r.
The sensor is a global shutter imager supporting monochrome and RGB formats.
It implements MIPI CSI-2 output with data rates up to 1500Mbit/s per lane.

> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> new file mode 100644
> index 0000000000000..f977bc5988261
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c
[ ... ]
> +struct mira220 {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	enum mira220_variants variant;
> +
> +	struct v4l2_mbus_framefmt fmt;

[Severity: Medium]
The commit log mentions "remove format from driver structure" under the v4-=
>v5
changes, but it appears fmt is still present in struct mira220 and unused
throughout the driver. Is this a leftover that can be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mira220-v9=
-0-e869e7ec2040@ideasonboard.com?part=3D2
