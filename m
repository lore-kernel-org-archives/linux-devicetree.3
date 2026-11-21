Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280434;
	b=KDragaFy2OxE5+pfahvqrps2vVJV30Ciy7SCqlohkwXknKxy03FgnfE2AwlS6ORHc3H3
	 dlARya7XGVxNV07uJ+6MiiSKudmKIZWEfJ6yZuxRob+/y2UCQ/yCGfP3x4N9fSPTtb3R2
	 05cYTjXMoq7jz84HfRTws5PGM0umDfVI/KAwOD7PgJyXE+vXN7po2I6JsxgfMi6EmDiky
	 a8PGDtJ3888PAElOB3/+aKv40L0D0tengr9FjU6uQVOCMvi/S1aLSDK4vi150l6eNxNOJ
	 eqh29OfsNJlw9fQiCw81Sp8W5BXFM9bHlcBRrcIuVT1PB5eh9a9r/RDebw6/g0RomMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280434;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UfEvT1Av6kpV+WzLsnNeTimkMizI3/URLgUJM2UlPVI=;
	b=INEShFnhVeMBY9Fc04sMUPy1jpc9z4c+nSix5LzoUFvsPAMYKM/gq9lVMy8jBwmpp/V0
	 598457zscJgbysFUlZ71DgB9s+fHW1qMghgl85T51h0hzFlBLCd2E7wfyNqxyoe4rfu2l
	 OPP8MzH7lAksMTkHOnSRAkDUgEkYgOWlasXTmXKbhWiRwK6hpBJ4e4nKr3DdyL2pxKyLL
	 FVL+CNYmqaB4Hs5hAGihLsNnCln9sGSVqSnHVqgk59a6Kqrg6hl5GP9tumCRSwLjXIudv
	 rBSOq22WZ3k5adM4eAzAK/9MUA3kGUmXRsGUAvFi2ASIq4UTTLQ5neGpAHE5q8/AJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQWS494W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9EF606A32C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQWS494W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B361F000C6;
	Sat, 21 Nov 2026 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795280433;
	bh=UfEvT1Av6kpV+WzLsnNeTimkMizI3/URLgUJM2UlPVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQWS494WccV5b9h+IPcsmofdxrc2wIlnrlfVbncecaD7ig7atMhM+nzNVpcMR9Ipz
	 nly2MqmAvMyH15bnn2YijvugHx6bpU/IoaIBDozHTG8h5BPowYb7UTmP1Z4cXigUbW
	 gn/qHINXoTmuRyWIB03X1ud8SJoKmoun0ui40/gxZfbm9L21ZSNB4vomnLfELCVOyQ
	 Ycr1QpdViLt7FiZ1ykW1bch7w12IzY5LGmiE6p6JXPnmLiHc06xjOkodoLmT7dO60i
	 xDkMA5/JqZQAbDqGGhVD1W+sGsKuL7MtZDIGLSYnjcytsLceatcF1B1WDDesxm5oFv
	 0/7Te3eIsR7qA==
Message-ID: <sashiko-outbox-227185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <b63e1b3cd0f46988b16c2f535c364e1f4dfcedc2.1795279680.git.daniel@makrotopia.org>
References: <cover.1795279680.git.daniel@makrotopia.org>
 <b63e1b3cd0f46988b16c2f535c364e1f4dfcedc2.1795279680.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 17:00:32 +0000
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
- [Low] dt-bindings: media: rockchip: redundant word bindings in commit
  subject
--

commit 42646cd7afc491b194c9024eee30d3ea3e9d3745
Author: Christian Hewitt <christianshewitt@gmail.com>

media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings

This commit adds the rockchip,rk3568-vdec compatible string to the Rockchip
video decoder DT binding schema.

> media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings

[Severity: Low]
This isn't a bug, but the dt-bindings: prefix already indicates that this
patch modifies a binding, so the trailing "bindings" in the subject can be
dropped ("media: dt-bindings: rockchip: Add RK3568 Video Decoder").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795279680.gi=
t.daniel@makrotopia.org?part=3D1
