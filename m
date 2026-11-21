Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249658;
	b=V2fPnz+7Wo4eEaEp8e5oJ8wtKhbHg+uEIOu67KwjCWt/TzwoczFrYf+vK7p84pf6AcpX
	 0jz8xfkkgcmojgrZ01ysVjryz8IrcemR1SUtxQVC5kK/3jNKoR5P5M4wuTE9cz9Y4KOYK
	 ZcYAmHmrgd1KJPHTz4yvP4fSqTBcI+4WcPkZmZwub5eHBQlg4ghGQ4TnFKnNnljcYiFe6
	 v0X+SCOGJreJMXzqvkl2Glndj5+IBUSAswTZ46H49LrnfuuJHYcyl5WxGzHbwOqy/P9uM
	 YWz/Ub616zQa0yQsQK8yYllp2HLn+3TJG+M6VqBGkV8fOceN7sOpHrsFsONS92qZD2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249658;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mSsdYBj1+i2i6gNkZGFCu4NVruKN4bjut47MmHW45yg=;
	b=DmcJblbsGpe1iKzSjKQTg/JugkX3bB8S9vXSjxdimYqtkMsIEok5a/JeNKD9fqvty35E
	 TQnGFjlAGSoNi2srUY/KM2bKzPlth3/0DkOPUi1FLmPBCLFKdg2wEQDp7KwdmYpaeU5xp
	 7kIthwWZ6pOhblU6S9bu1RGyEY0wa/KBamyEC9/9P7d8lcG9MLTqcAOTHEfvvXmKV5jPB
	 JABk8uuiBPNb9i0H5F1ZBEwweBSxQTnZKohtZHosWZ/Aq+26e75xjInVC03G4J6oUQoRJ
	 CW50amsJRmhDILk7M/2YjQhven10dkacgPBKuvuJ38+TylaeGQZglFwYoQFVRLBX2PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eX1AnnJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD19A606A325
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eX1AnnJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E691F000CA;
	Sat, 21 Nov 2026 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795249658;
	bh=mSsdYBj1+i2i6gNkZGFCu4NVruKN4bjut47MmHW45yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eX1AnnJDvgD+mvjYmJH7JGapIf9xr+8oJG7Id/GvLxKvk2iXACh5+xWNa32RsROXo
	 TKrS85dmZC6y69jJVzVv3PGVa6Sqzeul9YNlb/7Ow+VU4KK2PBwoYPjUZ7I+QVS10S
	 Cpho2A85o9p9U2IOzZKAhjxK5I29UT3154/5j1r57tIyHQ4zlUhqbrF1tWYVzG6Xpu
	 M3GbRQ+Ay4+c+pwdiszlKXZfGqJNt7LZGW8OhMjaJWnm20dipk2OA5+sG/wNn3KtGQ
	 QB13FGntUb76ax5KAIBW1mPZh65NDWFOsD37r+ctqBXXd0APEwy2IJfB5+9IZg8Yl+
	 zh7IpC6Aca5mg==
Message-ID: <sashiko-outbox-226825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: samsung: samsung-boards: Add
 bindings for a20e/SM-A202F
Reply-To: sashiko-reviews@lists.linux.dev
To: "Henri Ommer" <henri@ommer.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121082404.24864-2-henri@ommer.net>
References: <20261121082404.24864-1-henri@ommer.net>
 <20261121082404.24864-2-henri@ommer.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 08:27:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: arm: samsung: redundant word bindings in commit
  subject
--

commit 53b148fe6d3224e56b6bbaff8e0921f7c5e931f2
Author: Henri Ommer <henri@ommer.net>

dt-bindings: arm: samsung: samsung-boards: Add bindings for a20e/SM-A202F

This commit adds the samsung,a20e compatible string for the Exynos7885
based Samsung Galaxy A20e (SM-A202F) board.

> dt-bindings: arm: samsung: samsung-boards: Add bindings for a20e/SM-A202F

[Severity: Low]
This isn't a bug, but the dt-bindings: prefix already indicates that the
patch adds a binding, so "bindings for" in the subject line is redundant
and can be dropped (for example, "dt-bindings: arm: samsung: Add Samsung
Galaxy A20e (SM-A202F)").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121082404.2486=
4-1-henri@ommer.net?part=3D1
