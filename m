Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13607364EB0
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499324; cv=none; b=pQia7yPV4fIDbGGa66uhBs+cN++v1n2Om1VLXtWbZ9gjDEEku+6IvkqOymqs+U7kWqGJv3Io93qNipvGZ5JvqoGDVXP4Xpx44lvZ36r1Xs7f3OvpbrPoZh+r0rl19M8J3mH0qIWdvMemhAnrPRPlavE07nXfxc1nGQ/53LUTW+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499324; c=relaxed/simple;
	bh=Aknwdtb7UmATw+AOcu7O9GHXQgmGAAM/2ZDbi5HJgK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GjthrRh8r3AvYK4HZtypoBzfx8o9e+3zwZsYWdO59R6Iu4ZyDDAqkGq/6a3QeQpq0s+ibiTQOxLdS0NQ+IjYWpPS7dExMaGuoMZmTZWeOdwBrz4Xrqbp9XH/2yemfh3Cv+QXWCVLWqILPkQ1etxPueCR9yXjqU6eZ7GCfsxKT0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATh47Ber; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATh47Ber"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC06BC2BCB0;
	Mon, 11 May 2026 11:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499324;
	bh=Aknwdtb7UmATw+AOcu7O9GHXQgmGAAM/2ZDbi5HJgK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ATh47BerukiVLDZl2JhvwNn6FnFouleBQOarwQ01HwwWp7muxDFndYqlcNwV//sXb
	 hM0mOQlrW28ye+jys2wyLwRVHGy7/hdPLAu0qR7Xe0BLbHMYGNLZLd8fxabSsiTKbh
	 x3FFFiSjORILeYqempUlSmpu5xZjB+olMTE71ftIWZiY2li+HnP9roW5v9xjy4Xhdk
	 AP7F7TizUfAmPbU2gkPEHlyqH0I6HTkBUwIZDkEZBzZcSWfK1dMn7hkrTse8GED+Db
	 C7rzY7tQTKSWTUrsgCUYTWTl0yZK1ttWUskTNwBWTGgVmEq+YVsf1YLue5qIn+0FNu
	 HuNHDxwduPpLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: chemical: sensiron,scd30: Update
 maintainers field
Reply-To: sashiko@lists.linux.dev
To: "Maxwell Doose" <m32285159@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510020758.233721-1-m32285159@gmail.com>
References: <20260510020758.233721-1-m32285159@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 11:35:23 +0000
Message-Id: <20260511113523.BC06BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit fails to update the kernel's central MAINTAINERS file.
- [Low] Typo in the commit subject line prefix.
--

commit 5e371f37c8537ade8dedd4080ab7c1188ea887e6
Author: Maxwell Doose <m32285159@gmail.com>

dt-bindings: iio: chemical: sensiron,scd30: Update maintainers field

This commit updates the maintainers field in the Sensirion SCD30 device
tree binding to replace Tomasz Duszynski with Maxwell Doose.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/=
?h=3Dtogreg

> dt-bindings: iio: chemical: sensiron,scd30: Update maintainers field

This isn't a bug, but there's a typo (sensiron) in the subject line prefix.
It should be sensirion.

>     Tomasz Duszynski is no longer the maintainer of the SCD30 driver.
>     Replace his entry with mine.

Does this change also need to update the central MAINTAINERS file? The patch
only modifies the device tree bindings YAML file, leaving Tomasz Duszynski
still listed as the maintainer of the driver in the main MAINTAINERS file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510020758.2337=
21-1-m32285159@gmail.com?part=3D1
