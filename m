Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6B8435523
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633960; cv=none; b=Epmf6r2YriM1sYkkllFYv1mtfkOPmKtWqXh/m0oOfYnvr/2NPbU6mD6anSm4G/rUJgaOTaCwYvV+yMbpqk7QPlxm9VnGY4SksXsi7eyfgkdew8UQZ9UqRfaC99Nl6KKoNo6fbdaGbcYjxBmKGXHQyI7rZlF4gFYH4QRu3XlNByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633960; c=relaxed/simple;
	bh=4FxYxNr+Xq/drNjYG1Ab+NTqzC8ls2qCwu/WptjMmPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sL81KWaor3ZEXjl3XACX+4Iu6roVd7oAkU32vfYzT68cEcc2xlGy2PuDS8VHUYRR5y0fsZVc4TPigmCK/1YRx29y1GpHiSoqUFIQkAkPbKrJcFjDWadBon8UgO6eGWalNIrpWpaabnHo1hUqLgz+VuLh+cY3OlYtqhF1G+bmBGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3tLrKkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3tLrKkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFDD1F00898;
	Thu, 17 Sep 2026 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633947;
	bh=F/QQK1K6QfGGIrwiuyQ0UvQFbwxxZrX/r2DpXyGtX6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3tLrKkBlOLwimM5Pp63yNDBAfhMGUuZrpBlnNDjKytyTsrquIusYg45cZu2jS4oW
	 gFBexw/4y/huIG9h8EtQ+5Cc49MN7PAN/troM/W6/0BoLm5+GUg0VJ82icpOD+buk0
	 qXj7rdAAR2gDvjtEaRFI6coEX9aTxmkKif7bpabIRg4e4fe80D90eauuR7R8GljUPb
	 4Jn1LIBU4xZqH/PRy6Iup7mQhJ2nJM0q6g/AQ1xpXw6MSaMvE/Rn/5Bqb+ZVFWVyZ0
	 zjfdEKWgj52S3J5kCNkQtQ5hvD5tMKcTycjNDL8XdNgbXgXa1+xPDg6jFHLkZ2yhx3
	 bGJEIrQd9wyMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Tibbo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917082632.626614-2-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
 <20260917082632.626614-2-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:32:27 +0000
Message-Id: <20260917083227.8CFDD1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: vendor-prefixes: vendor prefix '^tibbo,.*' is not in a=
lphabetical order
--

commit 82f70f6fee71fff5d4d4526f6ffdde8383c90112
Author: Andrew Gaylard <ag@ffroot.co.za>

dt-bindings: vendor-prefixes: Add Tibbo

This commit adds the vendor prefix for Tibbo Technology Inc., manufacturer
of the LTPP3G2 board, to the vendor-prefixes schema.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7c..bee050d59baa6 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml

[ ... ]

> @@ -1692,6 +1692,8 @@ patternProperties:
>      description: Thundercomm Technology Co., Ltd.
>    "^thwc,.*":
>      description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.
> +  "^tibbo,.*":
> +    description: Tibbo Technology Inc.
>    "^ti,.*":

[Severity: Low]
This isn't a bug, but does this insertion break the alphabetical ordering
requirement of the patternProperties list? Alphabetically, "tibbo" should
be placed after both "ti" and "tianma" rather than before them.

>      description: Texas Instruments
>    "^tianma,.*":

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917082632.6266=
14-1-ag@ffroot.co.za?part=3D1
