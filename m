Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC4335BDB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279301; cv=none; b=Cjo0lzcvNPh1MnUmCiBsuTjMWMF6WVYgPYT6PxhAEo+XF+RW186/O1GL4IyFRtrMxX7hXnIPbEgvwBfAsGPwXBmJ+ZCOfYk4F9Iw3e2cX8meQ+QsAlk2NdVnunHnOrcOHTHjlxwwb/qqA6s86wJWl2EWccImy1jOnAtKyWAXn98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279301; c=relaxed/simple;
	bh=FStDs1QLXBULcvy9mcclTjM97EJjIMpHj+q+dyPLZGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XEM6Bfs0sAzSL9pVyU5a/UzwEZYvhYV5rd++JMLEhudhpWRou98Q+zlPfvRfg8ebXGnb/UuQl+AaYzLer8xreRZ4+i00CUTJgPW/GJ0hSHItUS1It55pc6QGMHbXPqH3hdKWgl9ISgzOIbJe9nBALi3bMMZj1xNDH1bV/LDGYeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrYLQVOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrYLQVOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC501F000E9;
	Fri, 17 Jul 2026 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279300;
	bh=FStDs1QLXBULcvy9mcclTjM97EJjIMpHj+q+dyPLZGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrYLQVOpba5GkzbZ2UI+DpyP6UByJdzU+nyecsFEkpvz51cgIU5Stzm4UtyOU23DW
	 oAtHKC402gqiAsjai1EINf1WjXqZjOtNB8dgIF6xpee7KIdmQVMDrVkcqn456i1spR
	 nXW2dcv2AbKiVQJ3hrSEiQPKXb1QV9Z++4eHwgeRWoJn9bwr6PafYct8fUue/S86ql
	 4J1LyWUgltMZhXlNH0Lj/n85mJb2FavD0qf/uHrsDpQ1XqvLUHC7bo8KW3R4F6p02o
	 y+WstwtZFik1UL+9WQIApCSybghCUAZRBOildhvZl4PRm0M9nn6xSsFjz1UixDXW1D
	 z9c3jmrn9RFmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] mfd: axp20x: constify axp313 and axp717 cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-axp318-regulator-v3-3-779dc1b97dd4@baylibre.com>
References: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
 <20260717-axp318-regulator-v3-3-779dc1b97dd4@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:08:19 +0000
Message-Id: <20260717090819.BFC501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating the MF=
D subsystem convention.
--

--- Patch [3]: [PATCH v3 3/4] mfd: axp20x: constify axp313 and axp717 cells=
 ---
commit fa2a5821d61bb79ab715c28d8480fa7cf50eb9a0
Author: Jerome Brunet <jbrunet@baylibre.com>

mfd: axp20x: constify axp313 and axp717 cells

This commit constifies the mfd_cells arrays for the axp313 and axp717 chips
to match other supported devices.

> mfd: axp20x: constify axp313 and axp717 cells

[Severity: Low]
This isn't a bug, but the MFD subsystem guidelines request that the
description following the subsystem prefix be capitalized. Should this be
updated to "Constify axp313 and axp717 cells" to match the standard subsyst=
em
naming conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-axp318-reg=
ulator-v3-0-779dc1b97dd4@baylibre.com?part=3D3
