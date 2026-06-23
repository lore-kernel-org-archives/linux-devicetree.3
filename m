Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749E30567E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230546; cv=none; b=g872BnqPN9QhahHsTv3TjPb2fLbQ4gVg9cZxbJUpOryrziTGHGUwX2dln/YGtwK7c/qPJPWVNtKUwSOJOq6/Q152dgdv7u/5P8jCUBbBNsOjmrJPNl8BsyOrxLo0zasPA79U7uSVWHVssfGGHQsa/B+UqDxWY7+3Bzd5FAeds7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230546; c=relaxed/simple;
	bh=mTQgvnU1+5Ut1L3/wlZiXrv0CKat2sY0VUk04Svmbss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FKHc0F3QEClVaY1MCCaMa1bqHq7RlSHdzOQpHRV6jg+9rmUEG1AgbRkoQ3ikLVzqo/ubLDyl5o1pXKlXGnQeSVE00EsiTXwjs0rLf0eh6Dq+o5VAVaXsMeqwX1YDejz46O0j+SEn90/b/mJ7hSLzrLh3Aa+cqklF88C0ByaVM0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7t7tmCz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7t7tmCz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E99D1F000E9;
	Tue, 23 Jun 2026 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230544;
	bh=mTQgvnU1+5Ut1L3/wlZiXrv0CKat2sY0VUk04Svmbss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l7t7tmCzzMr4oo0DzDKyW+rHU7xQeVvyX/4s+E2FRv+EXKr8995SRgvH4+kolcfMG
	 ioUwIw20GEyuzfD5Ennk+ZcRF3+oLKYGC11CJOMSsEef68rzOWZK3fBCDOkTIGuN8M
	 xZYtisDUbEXpR9n1swa4VPXjKaMgVBoYaFgCGCQ+LkXbku0De0LFC3asgti5SufcWN
	 m4lyVGKfqXhHQHePNO60wtIoMBg9qXvCYvFQWvKE3XsnedWCspTNMs3db1f33VDq3X
	 +88xkNqcuV3urxnHDTMqq3Bp7Jfzr6ZbOaoj0eQN/qhLlx+uSzPvFo3/43Lbu8i5We
	 4Yyea/tGeo1CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: health: add maxim,max86150
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623155556.13701-2-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623155556.13701-1-shofiqtest@gmail.com>
 <20260623155556.13701-2-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 16:02:23 +0000
Message-Id: <20260623160224.4E99D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YAML binding schema file is added with executable permissions (=
100755) instead of standard text file permissions (100644).
--

commit c219f77d4696cb841b5ce1448aac625e0d36d4ad
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

dt-bindings: iio: health: add maxim,max86150

This commit adds a new YAML device tree binding schema for the Maxim
MAX86150 ECG and PPG biosensor.

> diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max86150.=
yaml b/Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml
> new file mode 100755

[Severity: Low]
This isn't a bug, but should this YAML binding schema file be added with=20
standard text file permissions (100644) instead of being marked as executab=
le?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623155556.1370=
1-1-shofiqtest@gmail.com?part=3D1
