Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793881;
	b=tEFAFEsxrgRrjQ7FKXmkcGaI/5/qLOjS/t8ykt1OOtbdRFCwMhSnaN4WHuRzAAmbk45R
	 D02f+trLW1GvVYJ95/S/UpSW3Gbr2xVdT6jn/2vHgft3YrEDdXhlUeliVWXr4/kK1jtQU
	 +1fKM4P2oyC9ANeltrhp/zwCK9xOCXfOtEuGBg795iEEtVOQpHAgYVD6hzLQ3D87B0Npb
	 C65L4SuZFSPyISN6L+aBT6+YmCRYQayHilUYuXZ/B0vAo3u3GEZlokjkZVJabFzjOHfD+
	 Bq0UK3p6BPLWZX+7o5fDZB5d4n8NZlDgNTUuuIiUPdSarsH2WRV8PIDCrJ1sElEtE/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+WLLtnN2R5M/5/EnMLDzbwynr8R1odsEdwLSn/mSjI8=;
	b=wcsWeS85BhaEi0iWo02HEeYBEdh6YZ24VrKo1OXgP6n7sdH+GKEw/WZJ9uMSRADLF3wA
	 I3v5PorAaws5RcmQS0CoeBskq7Kc3bnbA9SlhBSlYBgPe8MEFlJOHqvmRCVS+SS0W5MGg
	 lWO4KZZzNfoXD2r4WNL5QehMPU3RTHjhJD1UoYs+wVKao7wzUb+4fuHcNiYU8K8VwvVvz
	 vHqZIOtRxfl+TiQMAHRhLBFOsvwvBzaq6ZxrU9jQFInYrLMNYszOxCHjfl3KAXiUQGyyJ
	 ImyMoqPzSVGoqGd3m5H/k2xkzG89W4fMCagE4yDGdwbWVtofxsxcQ0BYERCj48Zqv9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8+0R5Of;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E45C606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8+0R5Of
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088651F0089C;
	Fri, 27 Nov 2026 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793880;
	bh=+WLLtnN2R5M/5/EnMLDzbwynr8R1odsEdwLSn/mSjI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8+0R5OfsFjO33opKrRKuW1ZOsc/GpwUnegecgpgPETJ1eAQbi4bMEmdO6CCD5DuY
	 WI+fpib9/uytV2K/6bysheAhgizkX7WWbIOzQN9lsBQU4HKTcDXwyRdaAO46OEavs2
	 pLzFHiwK+0CvNgWjraziYFUrxdvPMhr3tx8xWQWeCfGQzbBi2KM6xfbp+f+xE9FWmw
	 0bAL1aHQTQ+tKEAwyQIUdNyyUjxQkkZX9KwVKAlnjb/1m9/P9AUsPfSAZT1uyNXOAy
	 Vc20eKYwh5nTmm7urcZ0oDZ0RLjKtFHReVZm7Srid/M8mSg37GMAcodm6wzFh8jD8G
	 psMS6DLs9aqpA==
Message-ID: <sashiko-outbox-237759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/12] dt-bindings: soc: amlogic:
 meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261127-meson-drm-create-hdmitx-phy-v5-1-88c43eb95468@aliel.fr>
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
 <20261127-meson-drm-create-hdmitx-phy-v5-1-88c43eb95468@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 15:37:59 +0000
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
- [Low] dt-bindings: soc: amlogic: missing Fixes trailers for
  conditional matching fix
--

commit 3a6f82497ac8b3eb518b14c0bffeec3b4447c0f9
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

> dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching =
in conditionals
>
> The conditional schemas select on "compatible" with a bare enum. On a
> list such as:
>
>   compatible =3D "amlogic,meson-gx-hhi-sysctrl", "syscon", "simple-mfd";
>
> an enum applied to the whole array only matches single-entry lists, so
> the if: blocks never match as intended and the per-variant constraints
> are not applied reliably.
>
> Wrap the enums in "contains" so that the conditions match on any entry
> of the compatible list.
>
> Doing so exposes the "phy" child node of "amlogic,meson-gx-hhi-sysctrl":
> it was forbidden (phy: false), but some DT legitimately describe an
> "amlogic,g12a-mipi-dphy-analog" PHY node under this system controller,
> which resulted in dtbs_check warnings such as:
>
>   system-controller@0 (amlogic,meson-gx-hhi-sysctrl): False schema does
>   not allow {'compatible': ['amlogic,g12a-mipi-dphy-analog'],
>   '#phy-cells': 0, ...}
>
> Allow the phy child node for amlogic,meson-gx-hhi-sysctrl by referencing
> the amlogic,g12a-mipi-dphy-analog binding instead of rejecting it.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

[Severity: Low]
Since this fixes the bare compatible enum conditionals and the
phy: false constraint, should it include:

  Fixes: 4d023beb3998 ("dt-bindings: soc: amlogic: document System Control =
registers")
  Fixes: 960a4140ade8 ("dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Doc=
ument the System Control registers found on early Meson SoC")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-meson-drm-=
create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr?part=3D1
