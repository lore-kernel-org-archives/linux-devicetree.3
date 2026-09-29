Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD039E6EB
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711131; cv=none; b=Wp5zX+08q9Q76UKR5IbjhF5n4POh4tyTPwOat6AjU2DLnUsx2Vb1OhP1DO/D5fjsyiyXtadxN9HKo92XnYOgQMfvv0lKWUASkYHaEk0vxBBsecmj1AqwVLqNVpy/5DOL4Rn5Ixu4oABai51yGxXdqtz3V1LzTqc9AjIX9Brn7Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711131; c=relaxed/simple;
	bh=/ahoAMeV0TfBTBheCOMjP5/rSj9KKVQhFsWCIto9Vmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G09xIPVQ1WPxAmHZKu+RCgaDHdyChbL47R7JdtXBF+9XDvqdO4yaGHF3zSjnVM5eNOaTPivukjZGgVVlcL8svGJcBZShCgVA6rAIvJocLQ7Y1PmDwHlgaMLXVT3HD/mNTZaBWh/G7Zc8FKzUv7vVmjoAvL0Blcnm9FENuyOAWdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqrIxXKz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqrIxXKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C2B1F000FF;
	Tue, 29 Sep 2026 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711129;
	bh=/ahoAMeV0TfBTBheCOMjP5/rSj9KKVQhFsWCIto9Vmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QqrIxXKz38Q3S4M0/FwQ06OTqdnrDTVQHsMR/3jrMx5XauC51ht5fOxBkmyOzzldh
	 A3oWz3cJY1ouiokbk7d4sm/qGmhgOHGTb2Au0uHm2g1KcUcvoUbAqDd4e5Dnel31Og
	 9Ai37UYEwSfROLo3mw8nnX5D5ZWdqr6SEm/WHdibyuzkFrYxFVdDJWBz1D4YoihKl3
	 nj4l9DLlmZkJ3vL8YJzpwZTbNaYxxQFOWB0GtfojudNlZKG7/K7C3PqRaCkYSemZp/
	 f76kW2u2WYk2w/vRAXYx60jSrIuNCUEUdBQlNh3TZBxRFkhqCumpRdoRUEcwuWcS9w
	 eyuOkFD0QL3/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: st: Fix PF7 AF10 comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929194035.496244-2-marex@nabladev.com>
References: <20260929194035.496244-1-marex@nabladev.com>
 <20260929194035.496244-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:45:28 +0000
Message-Id: <20260929194529.46C2B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: commit message body incorrectly refers to PF10 instead of PF7
--

commit 78899a4544e13cd3538df70fff331acfca47086d
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: st: Fix PF7 AF10 comment

This commit fixes a comment in the device tree for the STM32MP25 to correct=
ly
identify the AF10 function for pin PF7 as ETH_RGMII_GTX_CLK.

> The PF10 AF10 is ETH_RGMII_GTX_CLK , fix the comment.

[Severity: Low]
This isn't a bug, but the commit message body refers to PF10, while the code
changes and the commit subject both correctly refer to PF7. Should this say
PF7 instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929194035.4962=
44-1-marex@nabladev.com?part=3D2
