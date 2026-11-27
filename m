Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759856;
	b=faHUe1Q8dSxmEn9rGzOchnaaugamPtG7Ip1V1uWA+qTSX/zWOWdrW+jz6ywyOKhW2lex
	 Q4e8sij8fkAlQPd+3E/S6FeouAU4diXnpjjkyRxHASaS4maP1+Z/0Wry3wzTctlc8K9Vf
	 dHHV8coLO2RyuSocdOvNLbbDnUIkAcbhFw0O3ANhuS7DNwUGYd+t5q62maAn40zcNg0Qt
	 2iqU3Jmb0T3nc1PQ1Q1KEXVyPaeb/0O5hmWjyMJpalBDzMBWgNPwidIotFYkSgU77ylrj
	 QGfHr5fdiTXrYsuJ5EqiiGg7XoEceAENs7WlcxtKkE3LlGLc8y/F4ba236mOOUcTuWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759856;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LJzV9SjNCDoNpYW2PABHFxsWCmU54MLMVw2eXG57V+c=;
	b=R3UTNVdx4kZ+iLZK2XtA4y51u6lUuknZJgWiHJ6QjBQj2m4+W2ZwfoDeTeYcIUtBPDOD
	 U1PuglZT5hzg/FlFBbSKcbY81pY8BJugiU7SSoXRIAu9jQrrUR5QfLsbtbq9z5WWxq8aO
	 tMVOq9ZUr736CoX2OfjUQhREQhBBNsTjJhdAH+46GLEt+VLuCUKKEmipliR4EeqyCcQ03
	 0NXFokqpBLIfP05in1leWDF5dZsoJhJomhyfjvBpCrhjmUG3ayiwlVAjS601A5C5FxjGx
	 eDIymtluko9buF3naFic4nfm3QTrIc2EbtKvCKt2zDMrkVK4pudXyEE5sJeiP7xBuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuqdiLnZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D503606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuqdiLnZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9F41F00898;
	Fri, 27 Nov 2026 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795759856;
	bh=LJzV9SjNCDoNpYW2PABHFxsWCmU54MLMVw2eXG57V+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AuqdiLnZXFniQVcZcq41yu/VO06SIIuvFXQdNlVR/1CtxsSxsJ+w7GlYLpuOj0lyy
	 olE/xz62jFF+055lgiDuSFv+Mm1hMsNf/HdzQ2fcctaqa958UUaLaO5XHrFSkkhPCx
	 gdBXhUVuOSbbzx2wBfULSrr11beCxG6ZayL2wfUGWwNpLtgJGVnEOYP0mCjcyaFd0a
	 o7t50I5zJUi8CQjSPwcTYWec8P915BbfI8elfv/dq+BkSlUMQXNFLFpnfEDY0yFN2T
	 x6UVcJN9Oy+x1DQyzUEA0PQedIdYeIEABw7sRcst0xsu2edJGLR2SHYrZmNqRUSMhx
	 5CO0QXzYnui1g==
Message-ID: <sashiko-outbox-236687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: display: add CIX Sky1 DisplayPort
 transmitter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127055807.109667-2-Luo.Liu@cixtech.com>
References: <20261127055807.109667-1-Luo.Liu@cixtech.com>
 <20261127055807.109667-2-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 06:10:55 +0000
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
- [Low] MAINTAINERS: unexpected devicetree list and missing F: paths in
  cix dptx
--

commit a925e6ee61fd293f46e99dd02a193ee54a3f3d96
Author: Luo Liu <Luo.Liu@cixtech.com>

dt-bindings: display: add CIX Sky1 DisplayPort transmitter

This commit adds the Device Tree binding schema and MAINTAINERS entry for
the CIX Sky1 Trilinear DisplayPort transmitter.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcade5bfbafe9..b71e46f6fe323 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6527,6 +6527,18 @@ M:	Satish Kharat <satishkh@cisco.com>
>  S:	Supported
>  F:	drivers/infiniband/hw/usnic/
> =20
> +CIX SKY1 DISPLAYPORT TRANSMITTER DRIVER
> +M:	Luo Liu <Luo.Liu@cixtech.com>
> +M:	Wuyi Shen <wuyi.shen@cixtech.com>
> +R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> +L:	devicetree@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> +F:	drivers/gpu/drm/bridge/trilinear/
> +F:	drivers/gpu/drm/cix/dptx/
> +F:	include/drm/bridge/trilinear_dp.h

[Severity: Low]
Should L: devicetree@vger.kernel.org be dropped from this driver entry,
and the three driver F: lines moved to the patches that create those
paths?

Documentation/devicetree/ is already covered by OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS, so listing devicetree@vger.kernel.org here
causes scripts/get_maintainer.pl to route non-DT driver patches to the DT
list.  Also, drivers/gpu/drm/bridge/trilinear/, drivers/gpu/drm/cix/dptx/
and include/drm/bridge/trilinear_dp.h do not exist at this commit, causing
scripts/get_maintainer.pl --self-test=3Dpatterns to warn about unmatched F:
patterns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127055807.1096=
67-1-Luo.Liu@cixtech.com?part=3D1
