Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B5C19E96D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974103; cv=none; b=WB1IBWlm6e7w/7KTEAxlM/N/mfCNuWdYTUDqVvYx0ME0mBkiv4MOJTRbZ23laBsMDmvNEhAuenhP+qr3029SPLUVCK2itRXiyvjcAR3V2uLUhtqDvJm4OblgcR/ziRn+OefGiHmOv0hgx9BAsBUzocnlKc1icVxh5yQwYK2ZYSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974103; c=relaxed/simple;
	bh=HPKtnde5H933fXSA/XLsEy7h/+LvMeiBoxj9OAZNnrU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gp2FzidEUBoGmgO3OqBIg/WU63fmyDOYTrutkrCVtZJ8Z7iWJPl4v506P3rKZZiGOuC4tVXTo7pEzifoS3wnmejWN9DpiRoEJwLAWMvQv6H5r7tdxooR7c5a/p15DyrXQPXEHGUb9n9jaKbSkZOsKb5JpgNMK5jcxkDjE+JdMvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F81AtFwK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F81AtFwK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B111F00893;
	Tue,  9 Jun 2026 03:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780974102;
	bh=VynpMsYUwfHI7iZ+mUi8Cseig4uXMg79qztvsDnnn3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F81AtFwKEIyj/fPi1uwaHoV3cOoYzmCdEkX+EWad24+I8tQAqvQw0vKTTpWC6hjBu
	 rkzHPDBwX5cGz154Wurnm6xdcoHiaoZGCSuIAK5ZteEHtKaDRqMZBqICuikyW7ekb0
	 YRuFAhYT38eYbqItdMgn5hMZ0yLwbncJ4lNCUt9/7WJNCH53nhHNrZP6Qd1egJUw+l
	 8vMN7x1Ylx3ymSo0ckpLQVxfsJ3rFLT1xNCCki+oj2PXjJba+k6MYDgP3uIptBRyQI
	 r3TWf0Gl0dPqL77Lo732VY4K/RK+bjONftKqV6vF1LJfhdHeyxCpTY3NpQEovNNvh0
	 okghPGVzWe8lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: ES8389: Add members about HPF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609025605.16945-8-zhangyi@everest-semi.com>
References: <20260609025605.16945-8-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 03:01:41 +0000
Message-Id: <20260609030142.11B111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds a clock-related property (`everest,mclk-from-sclk=
`) without documenting it in the commit message. The commit message explici=
tly states the intent is to 'Add members about HPF' (High-Pass Filter), com=
pletely omitting the new clock configuration property.
--

commit 1602f24c0f54f1d184d3693108b41af9cf3c92cb
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: dt-bindings: ES8389: Add members about HPF

This commit updates the ES8389 device tree binding to add new properties
related to the High-Pass Filter (HPF).

> diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml =
b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> index 75ce0bc489045..be92014c0c597 100644
> --- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> @@ -38,6 +38,27 @@ properties:
>      description:
>        Interface power supply.
> =20
> +  everest,mclk-from-sclk:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicates that SCLK is used as the internal clock.
> +

[Severity: Medium]
The commit message notes that this patch adds members related to HPF, but
this property appears to configure the clock. Is it intentional to include
these clock configuration changes in this patch, or should the commit messa=
ge
be updated to reflect the addition of everest,mclk-from-sclk?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609025605.1694=
5-1-zhangyi@everest-semi.com?part=3D7
