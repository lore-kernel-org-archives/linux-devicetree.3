Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A043EEAEE
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779904988; cv=none; b=OAq5Un3arjLSO1mKhJdvBUYCePUi8wSUKB4GZ7wGiTrmXJLZnx5Y6ffOhi8ee/r6BM86eRv5xEmp0XR3oePshOvFC8pJ2Nonnsk6Hzs7MEFsJW4RExYS/Kj/0risIh4v5zjeF4s6WHeVa0qGI35u3Iu4EBcWC55pUGo5fO3qhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779904988; c=relaxed/simple;
	bh=rmlflpsB7TBVCjKoH2Ms8fBAdiKcVnENMI8HINKPn7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O77VcRWHQkr8LZ6edBMZl2GxlWjpFQ4xGnahAJ+FPA1Zq79X65DC+NEuLFxOUE2TVk8Ylyy7T7Xs6LqK4wMy7e6lz9p1sDpjWjZDSEZginBwZ9US/FUXev9FLHSpyW3iIh+5qmaWI/eAZYi/2QHi9Ay3lM1b/dhVGzirEVGwxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDYDHHO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDYDHHO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEE71F000E9;
	Wed, 27 May 2026 18:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779904987;
	bh=KudxRillJJqvLe79wDH6TfjnmRIm+3RWZuMj9Q3xJao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDYDHHO3DfHSEhyt/ZO2vNNHSXTh3w6fz8yb+JeO+2K1dnkSGKJSgkFO1OoFSCADt
	 mIsqLg1424NIKzv0NOCFDkFuUkyTPnJbl3+07AJfXUHDE9AF/GOUBpzDcuevI97sqc
	 trNHDXAc4SDlE1Vv++SyTDdR4VMifmn7roIeZ7PI6lgi6qTis+q3L5ZlFHjvCH65Ns
	 r32J5tBN6zgb2cZpFegramc2fk/emNjcC8kOWEmZ+d7YDak2HmJ4jP9SiS+902f5HD
	 NnYj5QjTvrI3ODlk4PkzfTpMsvlCycYMXSKQwgMl7RLTI6r8N3IGUvMKqK9L54h658
	 lfa08/Zduy40A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 1/2] dt-bindings: i3c: dw: add resets and reset-names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527174221.79259-1-dinguyen@kernel.org>
References: <20260527174221.79259-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:03:06 +0000
Message-Id: <20260527180306.BAEE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The commit documents `reset-names` for a single-entry reset, which=
 violates DT binding guidelines and codifies a brittle pattern in the drive=
r that causes silent hardware failures if the name is omitted in the DTS.
--

commit 5db0a7d3c21cf60d537f37725a5d5312d88c8c4f
Author: Dinh Nguyen <dinguyen@kernel.org>

dt-bindings: i3c: dw: add resets and reset-names

This commit updates the snps,dw-i3c-master binding to document the core
reset signal. It adds both the resets and reset-names properties to match
what the driver currently expects.

> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f554..7a39fe62bbbc0 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -35,6 +35,14 @@ properties:
>        - const: core
>        - const: apb
> =20
> +  resets:
> +    items:
> +      - description: Core reset signal
> +
> +  reset-names:
> +    items:
> +      - const: core_rst
> +

[Severity: High]
This is a pre-existing issue, but documenting reset-names for a single-entry
reset codifies a brittle pattern in the driver that can cause silent hardwa=
re
failures.

DT binding guidelines recommend skipping *-names for single-entry lists.
Because reset-names is not marked as required, a DTS author could provide
a valid resets property without reset-names.

If this happens, the driver's call to request "core_rst" will fail to find
the name. Since the request is optional, it returns a NULL reset handle
instead of an error. The driver will silently proceed, but calls to assert =
the
reset will be no-ops, potentially leading to hardware lockups.

Should we drop reset-names from this binding and instead update the driver =
to
request the single reset by passing NULL instead of "core_rst"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527174221.7925=
9-1-dinguyen@kernel.org?part=3D1
