Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1840D599
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 18:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781892919; cv=none; b=UY1jln+9BlLszJOn8U2nl31ea1l9oOx1DpQWJrOp8AFxjqQrhk+Gu9X4qJTfNfXkNwcIPofr5Z3LnPhnd3qbB/I+0j/MSCf1qLRqA/BRKfqrzIsZYmODUmjHcoSsYsApkwu2TjKr+7bv004wVkc0JXTdumyV54XijARuZKm47ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781892919; c=relaxed/simple;
	bh=6HoMB+3QBXwusvYhdNpJdLXZlliRpnL9MxOCqtQH9R0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RNKy4ihtHHUM6B/DE9menADBt11OHrag5x7Bl3z00nV5p13NnRD3LwQXcME4ousZJj51uAbAytDiJxeD4UXH/+8s3kWAXIjmwFK7XzpJih05KwUy2bXTdR3IeCCE8BTmeIQKycdLLF6EBtuOX7+HpjjHNDLkj9a4b6tHJr2vm24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjWwYFLi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjWwYFLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD311F000E9;
	Fri, 19 Jun 2026 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781892917;
	bh=DSEFJbJr2dttim2iyUqnxVh32RlpA23rb2lgfnS5rZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UjWwYFLiatTt9NN7OW4J0NAWAIzdkc6LRaqD0pioJWn7vNerv0UvNPh2GfXGuhOD4
	 /889GJoSfhd6wDtwmhX/yEidabHok6aJE5LI3evCH6dxwdtH6MNQ+eBuc2Fy/DjfJK
	 aCUAgqEiNPDmrd5s3MDWDafYhpZ2bVTxWkrf7gPIz6qUqt35xaAMq6RfaWwKk9Wm/d
	 uxG75o07HGXn7XnkpBqJram2tXvgEaYS7Y9vZ9ILuRF2doi9pmqqndOkOGB6TUFP3x
	 SWq5gQFaPGUcr/2JgS+pVMW8X0GMvZJMrH8KHEMOfW8O7dkcDTHtQiN9s62mtnhnq7
	 WJywuHr9BHKyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: install DT overlays via
 dtbs_install
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishwas Udupa" <vishwas.udupa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619180951.325272-1-vishwas.udupa@oss.qualcomm.com>
References: <20260428123725.3457865-1-vudupa@qti.qualcomm.com>
 <20260619180951.325272-1-vishwas.udupa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 18:15:16 +0000
Message-Id: <20260619181517.9BD311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims to add 'all DT overlays d=
efined in this Makefile' while intentionally omitting EL2 overlays.
--

commit fbeb39cf8d645f798555d038d5b4a1e5e3393c7a
Author: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>

arm64: dts: qcom: install DT overlays via dtbs_install

This commit adds explicit install targets for Device Tree overlays (.dtbo)
in the qcom Makefile so they can be packaged alongside normal DTBs via the
standard dtbs_install flow.

> Even when final DTBs are produced at build time, some distributions rely =
on
> standalone DTBOs for runtime selection and application by bootloaders or
> firmware. Without explicit install targets, DTBOs are not picked up by the
> standard dtbs_install flow and therefore cannot be packaged alongside DTB=
s.
>=20
> Add explicit dtb-$(CONFIG_ARCH_QCOM) entries for all DT overlays defined =
in
> this Makefile so they are installed via dtbs_install, matching existing
> DTB install behaviour.

[Severity: Medium]
Is this description accurate? The commit message states that all DT overlays
defined in the Makefile are added, but the patch appears to systematically
omit EL2 overlays.

[ ... ]

> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile

[ ... ]

>  lemans-evk-el2-dtbs :=3D lemans-evk.dtb lemans-el2.dtbo
> =20
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-evk-el2.dtb
>  lemans-evk-ifp-mezzanine-dtbs	:=3D lemans-evk.dtb lemans-evk-ifp-mezzani=
ne.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-evk-ifp-mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D lemans-evk-ifp-mezzanine.dtbo

For example, lemans-evk-ifp-mezzanine.dtbo is explicitly added here, but
the adjacent lemans-el2.dtbo is conspicuously skipped. Similar omissions
occur for monaco-el2.dtbo and x1-el2.dtbo further down in the patch.

Could the commit message be updated to clarify that EL2 overlays are
intentionally excluded from standalone installation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619180951.3252=
72-1-vishwas.udupa@oss.qualcomm.com?part=3D1
