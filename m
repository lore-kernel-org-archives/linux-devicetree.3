Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE8128B7EA
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601468; cv=none; b=s1rFABZddpmTAFFV1iCBRMHW68fevIO1zwe7aQl/Lf82mLmpCl3AGukaJP/og27uhGXcrMwM/5P1vufJBfktS8qY/rDi8qzUz0I57CkwBkQ/hIZybgXZ/gmIA+1OiINcVOMza0Gue7Mo8TX7bk7hUXc8dUeA/uoPu42IYUzFYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601468; c=relaxed/simple;
	bh=qNrv4r7PjQUPZEgRDBl78lTlVetFdVN5CqjmQjybSvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aNqiM/1T8DV5HobURl+UzE99zTgNjhpOxfvFARifIIIysSR4F//XnW0Pkeg40itMJQRXUX5/eBsUacywexWYC96vv3xI2lg0htu4svmobkpSZCNRnJHcmejtpKlY5vUFiqJUK+OSU2vok75OdSroVmoYAwJxgce9UrRUiKZ/xTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cchFqQKL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cchFqQKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1F21F00A3A;
	Mon, 24 Aug 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787601466;
	bh=C/GTsfpWxVTyiI3ZqgkYztXVVANsc0bhr1ckF+KvMe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cchFqQKLbl4fwpiy9e8v1EdLQ2sOnZUwzgX9w/mqew6BezI4+4GdBxIsg8QBelo+l
	 saeeX3v7WzBwLNZPwN7TBQQS9pCoqEmKO/S3V/KZzoxNiH12sW1T0EeLK/e3tHV2wB
	 ewd/K6JLX9cjFa0A8SLEqf86pJEjW0HiFB33XmKUVcWjEexio+LJr4Avcyv4XJE2ch
	 kLlk05Q/FkhjILq/1U68a9ia0AB9mjxyNO0/eqR9FdVA8tGwI10KmWw17wQur1rogg
	 nGh2AYR7e7e+Mu2J/UyOj9MyNFBFNA3+YfZB8t3pdk4joewmM0aEIimp+PpDGmNvAP
	 maLPLvm9siH5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: Add GlandaGPU binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leander Kieweg" <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824195418.17707-2-kieweg.leander@gmail.com>
References: <20260824195418.17707-1-kieweg.leander@gmail.com>
 <20260824195418.17707-2-kieweg.leander@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 19:57:45 +0000
Message-Id: <20260824195746.3D1F21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new vendor prefix '^kieweg,.*' is inserted out of alphabetical =
order in vendor-prefixes.yaml.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: display: Add GlandaGPU binding -=
--
commit 987b0ae0b2509987f3bf6af799a254628d7f7d34
Author: Leander Kieweg <kieweg.leander@gmail.com>

dt-bindings: display: Add GlandaGPU binding

This commit adds the Device Tree binding documentation for GlandaGPU, a
custom FPGA-based 2D display controller. It also adds a new vendor prefix
for the author in vendor-prefixes.yaml.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 1e54877628c75..e20d045980ac9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml

[ ... ]

> @@ -668,6 +668,8 @@ patternProperties:
>      description: Giantplus Technology Co., Ltd.
>    "^gira,.*":
>      description: Gira Giersiepen GmbH & Co. KG
> +  "^kieweg,.*":
> +    description: Leander Kieweg

[Severity: Low]
This isn't a bug, but it looks like the new vendor prefix was inserted out =
of
alphabetical order, landing in the middle of the "g" entries. Should this be
moved down to the "k" section to keep the list ordered and avoid future mer=
ge
conflicts?

>    "^glinet,.*":
>      description: GL Intelligence, Inc.
>    "^globalscale,.*":

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824195418.1770=
7-1-kieweg.leander@gmail.com?part=3D1
