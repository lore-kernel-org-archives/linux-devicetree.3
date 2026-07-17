Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78838F65C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278748; cv=none; b=tJZmFxKGz0z85crfpoYEghoAL7R1q93W7xRYRegC2djVwlzucVdZ4vvjDDYRi2+BJgZX0X+k0Fjk0dIo0Q+phEmEIwhpB9rv0qZv+dCwGC8B5H4uWh1G+i9qzWj4/OOoHSuDI4y3qWfIIg+Yigug3djQuyn5BxSkp8nQOUu02bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278748; c=relaxed/simple;
	bh=pTcdV0KH4nzcGFa02r5U7NPWB/O3J2sD4ascvqUoGiU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F+5ciNZS4/CpGPYff5aSYU0JKGyco/0rvzVRKtN+OxvyylOmfJWY4nDhvuT5ZLOEu+YBU+WqCqA57cjnVBbV+RjeXw1p7AnJrP5jCMNSwg5EzN+LvedNAOayT1WDFDheA9ezMCYQ1EN9/oWqIDvOq+wPlx8XJRiJTh2TUsCNriM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnpzyVlY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnpzyVlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96B41F000E9;
	Fri, 17 Jul 2026 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278747;
	bh=yCccH1sP9kHlyJzjFraPq2Rr2KbVK6Uk4HI9sVzHJ9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UnpzyVlY6ZxBFNTNullwtqpOdBhFXSZX4GGXMy4Wq/F+bS4gzcyJVUMv2c66orqJm
	 8CMqd+bhKl6DnRXf9kEIFbfF18+j7lEyck+uHm4SPHYZ4XC/ENmbJz+35+JVp5E7pn
	 0qVoV297Ku84xEmiIz9Pa6xiqkuBbJ3idBX3UZOGtyQ2VlQbUFnpB5FKq/dBMFqCXf
	 JKr+s1I1HfURJ4sDBBxabIx19Yj/rNaD7DVpY4ALrctb++gnpbC60RA9sQRDWDxho0
	 XkPzytwZQCScuNKlSztlgeJqzEnhZpNlrZCUsLdUPd3h99Fu1wTANcWQ4GHz+7nrDx
	 wXClRj2TkSGFA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/9] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717085220.3212274-2-gahing@gahingwoo.com>
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
 <20260717085220.3212274-2-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:59:06 +0000
Message-Id: <20260717085906.A96B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing `sram-supply` from the global `required` list makes it =
optional for `rockchip,rk3588-rknn-core`, incorrectly weakening schema vali=
dation for existing RK3588 hardware.
--

--- Patch [1]: [RFC PATCH 1/9] dt-bindings: npu: rockchip: add rockchip,rk3=
576-rknn-core ---
commit 9a2dabf1434398eb090f8e36b12d42467c86de03
Author: Jiaxing Hu <gahing@gahingwoo.com>

dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core

This commit documents the RK3576 NPU core by adding the new compatible
string rockchip,rk3576-rknn-core. It also drops sram-supply from the global
required list since the RK3576 has no NPU SRAM supply.

> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> index caca2a4903cd1..d904db3bf9281 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
[ ... ]
> @@ -75,7 +76,6 @@ required:
>    - resets
>    - reset-names
>    - npu-supply
> -  - sram-supply

[Severity: Medium]
By dropping sram-supply from the global required list to accommodate the
RK3576, does this incorrectly weaken schema validation for existing
RK3588 hardware?

If an RK3588 device tree node is missing the sram-supply property, it
appears it will now silently pass make dtbs_check validation.

Could this instead use an allOf block with an if-then conditional to
enforce the sram-supply requirement specifically when the compatible string
is rockchip,rk3588-rknn-core?

> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717085220.3212=
274-1-gahing@gahingwoo.com?part=3D1
