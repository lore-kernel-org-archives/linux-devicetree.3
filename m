Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587712;
	b=27x+g3QzaIe/oQh9qdlgizS/nqF9bzb83ARKbrSxY020naoe7Kje9L9+l6AUYoN2Fhs4
	 4evfdVk33lDDrim/kgyJ//ZsOvF4LfX/1JvaLyWqXRuic07P8f2uRykKOj7LLivpSBilr
	 ilXnCLLg+kdsLEZ0d7nYZPfWjMEG6VfVK+IaGsUB9O9oO4tPGANxLUco58dFQJOZEttj8
	 nXGfVEv+WUGZGl/7Ho+DgmWUK+Cht6HrppkKnQvB3R0ph5ImYVu8mAdeMEsq95gkOoPRl
	 2nJtvHV4idZZ/DdXAAmiYQ6YcDqQdCmMCQpziryCFGnk8eyxT71N8+7dI2EyKylwmiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587712;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M6MKg7cYW4cIbhJriEMjE1jJ5v3XRwoGx7F8bmva1IY=;
	b=cajOg2vLvXvpfnpdhMUeGe2ik158ZmgeMnA+eduwHZ7bLgcdBGDjHZvwwzd7nelJ3AqF
	 tKD0BQakHHjDd9Ehybmr9SS2vwyXaM7gV+5/1mrC6/wePhnxQ+pQNEaeHzv7gxjquXC4X
	 u3iyCIMKzzuM48F9tDa3ECvnpXyr8BPGj8stNE6QTlWmYkpFSdIWVFAKEbkDVdNlRc8zd
	 oHw2BobmLWGnQuIiVnpqt6A8OyE2WSWsH6r/Xfkw1t1vNBQFmlcuB+T7v28Duy30+I0T1
	 Z7a+8zAK2a3PKpUEToyDK+1Q+SXFF7hKFk+5woonNFSNPpv0sm+pvqhXzlQsfBgbSxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VmV4oFSX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03587606A337
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VmV4oFSX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C9D1F000D1;
	Wed, 25 Nov 2026 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587711;
	bh=M6MKg7cYW4cIbhJriEMjE1jJ5v3XRwoGx7F8bmva1IY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VmV4oFSXrxWY/EtDjXO4qlkn5GJc9gQIr8j18nMnvQHCv85EFCKS/KkUIQq2HiAr/
	 iYHGukry7BalWuyUm6bKMvKw45t1OtDoNd2f32Pima132XZ1NEOkXqi/2EwPfwsS/7
	 ATWtKwO1EgLIZnrMjpG1o5c19d7QxBqotC4p2aBzUuawcJoLeznz/3v+UU32VdErMt
	 YwysM7mym5AsnbOr+vb2erFVSPIsprxn65tKpW1smyFKFJA6F8uFxgkxOpv4gmo3ja
	 apJPtBmbQyL7p5yQsKZc/xdyJbfIsjL6YesmK48nsszm5kIoEDDSApOKMl+svhoosR
	 peQlHUkQht+5w==
Message-ID: <sashiko-outbox-232676@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 09/15] dt-bindings: mfd: syscon: Add MT8196 JPEG
 SMMU compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125061618.2544386-10-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
 <20261125061618.2544386-10-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:21:50 +0000
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
- [Low] dt-bindings: mfd: syscon: unrelated and undocumented MAINTAINERS
  change
--

commit c96a483b72d1a409e80e78b68c423c55f8ca87cf
Author: Kyrie Wu <kyrie.wu@mediatek.com>

dt-bindings: mfd: syscon: Add MT8196 JPEG SMMU compatible

This commit adds the mediatek,mt8196-jpeg-smmu compatible string to the
common MFD syscon devicetree binding and adds a media JPEG binding pattern
to MAINTAINERS.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 742c4e6b291ff..6690f1efa9458 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17063,6 +17063,7 @@ F:	include/dt-bindings/memory/mt*-port.h
>  MEDIATEK JPEG DRIVER
>  M:	Bin Liu <bin.liu@mediatek.com>
>  S:	Supported
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg*.yaml
>  F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
>  F:	drivers/media/platform/mediatek/jpeg/
> =20

[Severity: Low]
Was this MAINTAINERS entry for the media JPEG bindings meant to be in a
separate patch?  The commit subject and message only describe adding
mediatek,mt8196-jpeg-smmu to Documentation/devicetree/bindings/mfd/syscon.y=
aml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125061618.2544=
386-1-kyrie.wu@mediatek.com?part=3D9
