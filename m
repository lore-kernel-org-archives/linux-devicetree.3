Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619960;
	b=J4YQzfh+0b3LmENDnlLAYE7It0Mq12v5xESiKE2avF17prLO8ZvZ2TUClEPppB4xCCDn
	 MjuVQFdrF2+JMEzzNebyYwSnrW89a1MnhxBUlOeCwxwW9sBYGHQbuXZSO/GUc5F6Y58SZ
	 9to1+f+kHhHkCHUapvgCWYZfQTrHcujIPID45XRS//vFa7N1iWtdtF1pEYDX67hSTRkaA
	 9JiKiqzZdDD5OFESw7bxGtaFcXmdB2atka+9FA55+t9+GTYfQum8UV6D0w333a9VrjWqz
	 sP1FeTg5uVtlhFnpUfzNCHuFd1TfOaHeZL6ZeXOAUPVF/HzgvO2z40RXwJgwszYVKBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619960;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0bMah48qB3X+dg0PPVfSOL0m6U9sK5JlwH5IOiq4eH8=;
	b=zT8t8xY3JXdCm412lN3Sda5HWLNTFhlS0H3eUYJk4qj88HIIOCqicz5JsDNZ5XKZ1Tyl
	 BMQafvA9eZE7sztkPNmbqgni5pNE3FInjaAojg04TFbQtzGCxt3rvZ0AK8y/EnkC+mFwO
	 lBxcQEJriZTRiQ8u7MenyIjAs24H2tAkx7l39ssquQUTnZDRriiTKeCx/196C9PM0napP
	 7kLHvJD24oq8QwnXohTDMXAykTmc+BvdT7twbeC40gR3brUeWg8MAU1RNwWS2SosFR7AQ
	 95mTXswz9o6DYPSq6vxXtZOyKpK76PC4Bzl5ELbB0SNt9oXwwznlsrJ/3LnUqt5tiNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+xR0+69;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E1606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+xR0+69
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951451F000C6;
	Wed, 25 Nov 2026 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619959;
	bh=0bMah48qB3X+dg0PPVfSOL0m6U9sK5JlwH5IOiq4eH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+xR0+69yAJWQiG8yZiBX8bWYYYuAT7s7JDd1IhmQmUHgVsWiKgwweztmKjpwYa1i
	 TjPFDljWZCtvnUDw4qYaoWtPi8jfBGC3oFfEYmSLe5kg/DeeJm+YSSTX7DNfJG6/7h
	 /uB4uwhe7vAq/I4ig8h27xstEtLBX2ZfSHhHBW3vjkYWB3UD7qQ2w2WlyE+vHkGLct
	 +3ofbbRupcHkOucD2K93V6szBl3dPEFHq1ssVygdSjK49MZkieos7jriH0Y3JUGdY1
	 WqEfnJZYnyWOTdQ+qdx7Rmd6HCpmliuR8U+j5VLlsKN8wEkqwxwFeOjr7jAG05uhop
	 NHX4WPw1nqLzQ==
Message-ID: <sashiko-outbox-233645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: Add Qualcomm Netrani
 RPMh interconnect bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-netrani-interconnect-v2-v2-1-4eab92854137@krgm.moe>
References: <20261125-netrani-interconnect-v2-v2-0-4eab92854137@krgm.moe>
 <20261125-netrani-interconnect-v2-v2-1-4eab92854137@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 15:19:19 +0000
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
- [Low] dt-bindings: interconnect: redundant word bindings in commit
  subject
--

commit 6ac5b7bed190306e2200c1964b7d2a710506bb9e
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: interconnect: Add Qualcomm Netrani RPMh interconnect bindings

This commit adds the Devicetree binding schema and port-ID header for the
Qualcomm Netrani RPMh interconnect providers.

> dt-bindings: interconnect: Add Qualcomm Netrani RPMh interconnect bindings

[Severity: Low]
This isn't a bug, but the word "bindings" at the end of the subject line is
redundant with the "dt-bindings:" prefix and can be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-netrani-in=
terconnect-v2-v2-0-4eab92854137@krgm.moe?part=3D1
