Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541114;
	b=vc2h7cCHIHNAkNnUj6zvg3T0UuMhU1T2WPUMFGbFWzDXpnXo63b507J8JxG/RRT3UVyv
	 cJOCobUICfdmlD3F1LMI3jgbxyT61KlapHIgEL4Uq/gqqXqRQvjkH0toXloKbOPqEHhv1
	 OdSpD23dfoiu2rNLxEt+4i+pZeS+chkPgXmN8lUiw3fGV4UhBebU5Gg1VQoFaMaG9MvRu
	 Cr3LLaeTYLEnUGrYbw70z0Ll+eX45Teo/ZxXTcqr39+ieA/RbWuVziv0aZ7PeEEC8w3we
	 UkxllCoj1ac+sCa/bdluM+q8GDckCqDzXKujf2+8Bw16c45iry7u0ncyJBQBCAfDLGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541114;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PmGCThcFJGFjNl22A58PyP2+6KXeQzFUJd2Nw5ezitQ=;
	b=mKEM0ZL0p1A6F5wDFwPrJcJyXTH9p1ZBb3jfR1XIvXp/dsNXj6cfWpjdiaZ7z2Dp/Uf2
	 Lt8iCKYcIxUB6Wygkp6oiqwUGxr+ed8/vyhFu3kPRUMwmaZNWm21fQxPWh0dqYarbWXPZ
	 HWo33QCuTPEUXfEimzmwqH6JON9yQEJvnYdHJBFeDIjAQkaBx37/I10vAGRIm4jwYFTwL
	 N1d7Z3pku81e7Ny0aGhsM3U4t8+Q9uHqBK4910NzXzW1kxcBAFG6gGavTuMwFeDegIc7c
	 rVrZioF5FR7MWA3BQZX0/SFkKuSzda1WdqCeayo5tE95ii6kdzk0AFNNbiFw9xEeYew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f/nyR3W9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687D606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f/nyR3W9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2711F000D2;
	Tue, 24 Nov 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541113;
	bh=PmGCThcFJGFjNl22A58PyP2+6KXeQzFUJd2Nw5ezitQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/nyR3W9w5PoGQ3ebNvd+eJ7cnTwH3JHPTlfnWCbxMgO+oKy9qfC4oxlWeRB5wKjL
	 fVVpCO6TyhWNm1X9bDzav5uoG3JzpUN7L7wOopkwpYOmji9qKDzBnRN1XVCflqxS2f
	 PAPrMrf4rmFNuZvgPg/ZZQxi8s22+rF7gPvEtZvDuO5HHaCHFstKqOcB6HK+HKiA2J
	 uMBk0KdncibG5O/LodKuZkUlkY0AnJ+bVznPL9Y5iGgPya4AVVHYlq3CGtf1mJI+np
	 qC752ZcO4YQ/kmwQWa9bXWQcFcaDNkdQkNhvESUEn9Aj7ZfY8pbQ4CB7hWhQz962nx
	 KG51Q299E1BjQ==
Message-ID: <sashiko-outbox-231702@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/24] media: Documentation: Document Mali-C720
 statistics capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-19-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-19-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:25:12 +0000
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
- [Low] media: Documentation: kernel-doc warning for undescribed
  MALI_C720_STATS_MAX
--

commit 47e2e3be519a4bd1656602aa074bece5f7c29afe
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: Documentation: Document Mali-C720 statistics capture

This commit documents Mali-C720 statistics capture, the
V4L2_CID_MALI_C720_STATS_CAPABILITIES control, and the
V4L2_META_FMT_MALI_C720_STATS metadata format.

> diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.=
rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
> new file mode 100644
> index 0000000000000..1d19183cc07a8
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
> @@ -0,0 +1,40 @@
[ ... ]
> +Arm Mali-C720 uAPI data types
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: include/uapi/linux/media/arm/mali-c720-config.h

[Severity: Low]
Does pulling mali-c720-config.h into the documentation build trigger a
kernel-doc warning for MALI_C720_STATS_MAX?

In include/uapi/linux/media/arm/mali-c720-config.h, enum
mali_c720_stats_type defines MALI_C720_STATS_MAX without a kernel-doc
entry or a /*< private >*/ marker, causing make htmldocs to warn that
MALI_C720_STATS_MAX is not described in enum mali_c720_stats_type.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D19
