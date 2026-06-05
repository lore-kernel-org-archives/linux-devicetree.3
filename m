Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D134C990
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 16:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780677197; cv=none; b=VWJOHsgH8xUWlt4YxUZ8Jzi5ljP/ao7+jnbGoxXRw7UKMyBELmiW1WUSXh0xF1cDu/K2eDRLdkj4WawGPicPzWR7hse4FT/BW6paTcZsNF94mAEqVU4IEL4SOtDp698vyLaAJmoIMk1P+eI+ryufs6T0RTzF/olcbtS2DFvTXOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780677197; c=relaxed/simple;
	bh=5E9mx+NqbRvU3+D5w4EESNM0z7RN1dtmCDjdwVGLGlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gt7ZiufPaaK64QvSZ4WjiwhoWBraLcrsQzZCauKWm10EKk5Gx6MKC73mOUp6E4T8riTBKZWU7ehltXtRgxfaVcphAIKPGemDTjiQJeoVlxczCYAonA9/kj1PGqbO+woRihJ1b4aRXiRreCx5GrIxke5nWrhclS71DSvuVIZOpyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrCZ82Gy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrCZ82Gy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6538D1F0089A;
	Fri,  5 Jun 2026 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677193;
	bh=5E9mx+NqbRvU3+D5w4EESNM0z7RN1dtmCDjdwVGLGlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrCZ82GyG/nKTYVop/2nOJEEinLFeh0ASHZ69UbNDwUxevaaPJfVe9RySK/HgNlGZ
	 znauOedHpLL89nagjAvUgh+mZ7TLOZM+1OWWkwnJiocXEgXYFoK3UnB/yLVBLdGt9a
	 2lPP0Qdbs2ifVTckvwPYlx0exDYdyCeiGhHvOcQbqyekl03Y7GKSh8thotb/uFzyJj
	 eAbgXx/wq0lcjd4Rbgk+qpfQkuknnlW4zaVHl4JatlQ9CDfPhNWyDNDN/EX2/WHtqR
	 1slklZWv2wjOlmM2Zcdm3lqPjLDee0T+/7Ygf7Lud9pRQaoxbG7Lyb6Jvtc2J/M3w1
	 0VhTi81sO9KMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 05/13] net: ethernet: oa_tc6: Export
 standard defined registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260604-adin1140-driver-v3-5-5debdb3173c4@analog.com>
References: <20260604-adin1140-driver-v3-5-5debdb3173c4@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 16:33:13 +0000
Message-Id: <20260605163313.6538D1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to add definitions for PHYID and CONFI=
G2, but they are completely absent from the patch.
--

commit 9c5bf385611ec36b4ca605af23a664c1a3618b76
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Export standard defined registers

This commit moves defines for standard Open Alliance TC6 register addresses
and subfields into the oa_tc6 header file. This allows other ethernet
drivers relying on oa_tc6 to use them directly.

> Move defines for standard Open Alliance TC6 register addresses and
> subfields in the oa_tc6's header and add entries for the PHYID and
> CONFIG2. As such, other ethernet drivers that rely on oa_tc6 can use
> them directly.

[Severity: Medium]
The commit message mentions adding entries for PHYID and CONFIG2, but
looking at the actual patch diff, neither of these registers are added here.

It looks like CONFIG2 is actually added in a subsequent patch in the series,
and PHYID is not added to this file at all.

Could the commit message be updated to match the actual code changes in
this specific patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-adin1140-d=
river-v3-0-5debdb3173c4@analog.com?part=3D5
