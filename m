Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B84908B3
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877396; cv=none; b=hItNdpetUjAGdETzUvHIBO7Gc6E8olTWK3niQy96flugEobimVN+O5bfEuLiU9F4x0CifTG6m1cYIyDc2Fwsdzd0Cj5GFLjX0qs0YRZUXmW3R414m93jYHldTSe0AtxX5O8tBcXHFgAdtQHyvdnVppIYV/ew9DpGrfZITNcKbfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877396; c=relaxed/simple;
	bh=9bQb/QgNT5nVMCaDrWwkoWs6qV24v2YHK6dKD53IKR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XcDJCvKW5oAVgaY3r16avjeqCnj9vIs5smuvCmKH7ss7TIqb1ZORnKfvbHugIOPfWzam4NDCS6arf+w4sa07fCUV8qu8n6OoxRYnfhvExQMre25tkGrbAtekcZa/qA76iA473skRkKmf7BKpoJKGEn6U6VW37Rqpkq87hb8qLIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0Bd/aBN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0Bd/aBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F30D1F00A3A;
	Fri, 24 Jul 2026 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877394;
	bh=6gAwAFLXES+/tcPY54PonDzfLnzSzsanD75SOyawZ68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n0Bd/aBNLQ3X32N+0DIO/m2ZPRarUqn/m2u4rvwSbkwgO6A4wm/gltlMa0/NiBvhl
	 9oANmTii7QhKEFuSEqB3hKGBj1VAugFVF9FO8zVUdKyH8ae6TiEvt+jbf3jW9WOVzh
	 dQOK27QrsOwcL+XV6MD95hk4I1buRTMi2MiU+WoLicO8v55apWMgDbqe9qordo9xzF
	 02hJ9woE9WR32LSD+d/7k05wsJdv68KS2QAHQeBtv8WdsyfYXlcw1QQDvoxc/xgSRk
	 lGetWowBffjGpglwPZm7cDX4xc/+qJHPUBSRaStLnmjYaoQrO/l/wtm0lLKQzboVZl
	 ktUGx9X008P7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-5-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-5-6072a7ee7428@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:16:33 +0000
Message-Id: <20260724071634.5F30D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented addition of an `optee` node placed at the incorrect=
 level in the devicetree hierarchy.
--

--- Patch [5]: [PATCH v6 5/6] arm64: dts: amlogic: Add video decoder driver=
 support for S4 SOCs ---
commit 613b0bbb17703610934daa7467b942478e1bb9c6
Author: Zhentao Guo <zhentao.guo@amlogic.com>

arm64: dts: amlogic: Add video decoder driver support for S4 SOCs

This commit adds a vdec node and related canvas node to enable Amlogic
V4L2 stateless video decoder support. It also includes an undocumented
addition of an OP-TEE node.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 2a6fbd5308362..04fa52b357a20 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -96,6 +96,11 @@ saradc: adc@fe026000 {
>  		status =3D "disabled";
>  	};
> =20
> +	optee {
> +		compatible =3D "linaro,optee-tz";
> +		method =3D "smc";
> +	};
> +

[Severity: Medium]
Is this optee node addition intentional in this patch? The commit message
only mentions adding the vdec node, making this an undocumented change.

Additionally, standard devicetree conventions and OP-TEE bindings expect
the optee node to reside within the /firmware node. Should this be moved
into the existing firmware node rather than being placed at the root level?

>  	soc {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <2>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-b4-s4-vdec=
-upstream-v6-0-6072a7ee7428@amlogic.com?part=3D5
