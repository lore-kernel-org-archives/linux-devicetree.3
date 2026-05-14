Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C24353EF3
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741381; cv=none; b=t0K7Qb/yv5OiZHXO94l3NCdJ/Er6bQlDOZYWH06eRP48NqbHjfl7utGumTbi51WNfLeRWeBgjVqvp8eeizjQAUfmaYnuYs5OWfKQMnO60LoJZ+C6nWuhh48e/KfAfUll0ENz1zDq3arN0YUFEPtQgeZ9DOOLBHPlEU6far8APYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741381; c=relaxed/simple;
	bh=rJrFiOv4HJ3RYG/VUBXQrto0C5r9yv3FzaP1/XXbz+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jvy7rwW8SAQZlQu8q+CUgBGObwRPosnKSRr30cKxZOqJWyIjgD7CgeJUE/b9GrSxGS+o+saHuQMx8JOLLS7bkO8X0JSW2QUpPxmC87nn9ZdJzzx8O5AxBUwXj1zTgr087GTzDcgdTmiRxqWS5AGIrCRlKUt4YryVr4APWUuX9Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPw7QxBg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPw7QxBg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5060CC2BCB7;
	Thu, 14 May 2026 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778741381;
	bh=rJrFiOv4HJ3RYG/VUBXQrto0C5r9yv3FzaP1/XXbz+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EPw7QxBglUIXsFGyWEBw/H5UtA4xu+1NnTiVTGMm7tPwJsxhF/C4fLO/1sCsrhdTf
	 9zszzR/WIypVhKss0oDAS8acAIKL15UpDkn3mW8aAIeG+ihKDUBrg07BmHPLI18Ygu
	 WZKXT8S8grrKQGhoAXp7K0v71qzw2jkCstW8MrX/C/9olkLTEdoCe4E3JWESjtrz6x
	 N0VCH2dLqQe0JWEoNiUCe/P9WhCd0tqcf/jS3JactFYeLZ1QE92M8jSKKxQ0xZpNoL
	 RqWbMEnzk/m9X/BUskhAyT9YSfCTAdfs1ALBHNmkobs1jejAt4rKe+LI5R5kIDxcqi
	 yFs08Tm1FaYDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/17] ASoC: simple-amplifier: Update author and
 copyright
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513081702.317117-17-herve.codina@bootlin.com>
References: <20260513081702.317117-17-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:49:40 +0000
Message-Id: <20260514064941.5060CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Copyright and authorship changes should be squashed into the releva=
nt code commits.
--

commit 8c20a26d5c232c4d2ed2b81d9a71f2b38091a58b
Author: Herve Codina <herve.codina@bootlin.com>

ASoC: simple-amplifier: Update author and copyright

This commit updates the author and copyright information for the
simple-amplifier driver to reflect the recent addition of gpio-audio-amp
support.

> After reworking the simple-amplifier driver and adding support for
> gpio-audio-amp in the driver, add myself as the author of the
> gpio-audio-amp part of the driver and add a related copyright.

This isn't a bug, but should these copyright and authorship updates be
squashed directly into the commit that introduces the gpio-audio-amp
support?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513081702.3171=
17-1-herve.codina@bootlin.com?part=3D16
