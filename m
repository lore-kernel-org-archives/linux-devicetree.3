Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2493F9F50
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 22:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362592; cv=none; b=kUCqic9dATA2YW76ByLMWkSrHs7mAxJDT1ZIrCgWFUXE3qz0bxtLyHIa/Jt5crHUZ6VEfW4X1QR67KV6B5rjyOOj4aMa/jtPvnjbpXKXVt7RYqO7hAAbGabAfLKKl8t0HKm0EsMEKBDwdHY81ozu0BISOecpVV4zWAfONUZfayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362592; c=relaxed/simple;
	bh=iOFmTnrfag+WEv4LKTt/0kEDkYrXMZ4TeJbhAUkRNYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NhvQzteKPzBMOwe/uFhvd8Au5oL2OVDl0yGT7uZlHHabG5zCakz3Dy06ixyezfb1OJ4QpvYFRKjB0t66tljxtNSb2yzIT+p3izRlaOS2rSIztJmuQ/P2JvnwaXlVw5pvcVJY5y4Sy+DMCVkT+Yrm9iaZSdwFhyZMEQPhAbTJJ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwDOGB6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwDOGB6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FDE1F000E9;
	Wed, 29 Jul 2026 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362591;
	bh=USkJLTMR+nfRSK2/WKLwzYUWFbWPZwA7ceTCsL2NQJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VwDOGB6Z3DkBqvRWAVyPxjhTREBG2uVx0MP8w9NfgauuyMmk0Db0/PLViQdOU/pdr
	 UlxhpHLD4k6um8EUO+pUj9lcWMHWrMpCLSc+rWFa5SgMGh5ExaIEjwH3Yqdx2CDkgx
	 AlnrTj8jjkJlOwgo5T5LyjJJFSiM6Z+0pR6fB+QOUcy617y+tFFEzAcwiHFz6smZMS
	 s55+7iZCf67GoJZc+P0uvVIWwyFtRwIHiWil3gwBpN/WW3WxjyvWXjVpk5ibvxbeop
	 L7WZolSZaJo3zffEDRPgmLQCPXHxvCURu+X/m+o9r8zuWMb+Dvun0LWfFwtWs6j4uJ
	 Aq5YqBNxCBaow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9714: Document
 DW9714A and V variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-dw9714v-v1-1-3c479b3cf8c0@ixit.cz>
References: <20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz>
 <20260729-dw9714v-v1-1-3c479b3cf8c0@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:03:10 +0000
Message-Id: <20260729220310.90FDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML schema enforces a strict linear inheritance chain requi=
ring the `dw9714v` compatible string to fall back to `dw9714a`, which contr=
adicts the commit message implying they are parallel successors.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9714: Docume=
nt DW9714A and V variant ---
commit 365235f208f468a1251293b975a2766eb66ab8bc
Author: David Heidelberg <david@ixit.cz>

dt-bindings: media: i2c: dongwoon,dw9714: Document DW9714A and V variant

This commit updates the device tree binding for the Dongwoon DW9714 to
document the DW9714A and DW9714V variants. It uses a oneOf structure to
allow the new successors as compatible strings.

> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.=
yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
> --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
[ ... ]
> @@ -15,7 +15,15 @@ description:
> =20
>  properties:
>    compatible:
> -    const: dongwoon,dw9714
> +    oneOf:
> +      - items:
> +          - const: dongwoon,dw9714v
> +          - const: dongwoon,dw9714a
> +          - const: dongwoon,dw9714

[Severity: Medium]
The commit message states "Both of these successors are backward compatible=
",
implying that the DW9714A and DW9714V variants are parallel successors to
the base DW9714.

However, this schema enforces a linear 3-item inheritance chain requiring
dongwoon,dw9714v to fall back to dongwoon,dw9714a before dongwoon,dw9714.

If a devicetree node defines a 2-item fallback for the V variant like
"dongwoon,dw9714v", "dongwoon,dw9714", it will fail dt_binding_check
validation.

Should dongwoon,dw9714v be allowed to fall back directly to dongwoon,dw9714
as a 2-item list if they are parallel successors?

> +      - items:
> +          - const: dongwoon,dw9714a
> +          - const: dongwoon,dw9714
> +      - const: dongwoon,dw9714

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-dw9714v-v1=
-0-3c479b3cf8c0@ixit.cz?part=3D1
