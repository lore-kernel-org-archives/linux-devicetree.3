Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF53C3439
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794702; cv=none; b=XX4XndhplR0TAFmU2cwjMFKIABO8okltSOwdVy2aMPOrBA7CEgoB8iBMDsl3J7UnIY/DOaONjjmkoAk7VR5k83ptKxcpj2ECrUgWd2PnkvfqtROxFx+8+wzp78RnvX0GYm3dfMbxQWQp0LjmEKzxXbqXuCt4yhmG3ikgI/iDwgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794702; c=relaxed/simple;
	bh=BP0hZZlA1rf4vyuYYHjP831UwAKNHer26sQ5bmN8R28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=arkTWGdeJtrZ+BPIhpuGxNnUPuRhxIYVjJJeHj433rxpFsfl0Z5Hq8Nzc2lEmFBVwvoBNyCsocNqoA7UxAYYHzRnkfYfedQP8Ld4IbHgLvDIWOePlxM8TU7W2ryMfWEDp2Tp4RDVpKBiLU9m8xEWhZM6oJk8IF2S8bIU+Qp/Y18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJY/7SQu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJY/7SQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5893CC2BCB8;
	Thu, 14 May 2026 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778794701;
	bh=BP0hZZlA1rf4vyuYYHjP831UwAKNHer26sQ5bmN8R28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JJY/7SQuESxZIguZJehqlX1D7fQSt2uuLtTYfA+E2bgoshNzxRQglyikdTwisfENb
	 wTFaIerPqL1MPXl+VfFZSjLV+hSNUtl7QghHij5sdGJqZjdnPVv8z6X8sfPxCjExAz
	 Rx0Y9wKaU6et9XRedTIJYUkmOqes7gP+bgYJYpSljwF6WIVVdwiWEASm098G9gmJbm
	 BPKU6PtmOFMUfYLJowRaX2r2jp/o37Kdz6Nsk4DWRV6G0msna/Hk7ExHv0+1h+xr+z
	 OiNVgC13KbYCq9Mk5ISk91m7t2vbwm+x3528IK8MAUvvKPCbRVMZZhEpzxwx4uTWAS
	 n++BJJ5oO6/pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add Chipone
 ICNA3512 OLED driver bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-icna35xx-v3-1-c304f04c32c4@gmail.com>
References: <20260514-icna35xx-v3-1-c304f04c32c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:38:20 +0000
Message-Id: <20260514213821.5893CC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema incorrectly uses `additionalProperties: false` instead o=
f `unevaluatedProperties: false` when referencing `panel-common.yaml`, and =
redundantly re-declares standard properties.
--

commit 147cb49a799b46e870bd7eeb02f8dcbaa4223d43
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: display: panel: Add Chipone ICNA3512 OLED driver bindings

The Chipone ICNA3512 and ICNA3520 DDICs are high refresh, low power
MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odin 2
Portal and the Ayaneo Pocket DS top panel while the icna3520 is used by
the Ayn Thor top panel and the Ayn Odin 3. These ddic's are generally
compatible, but some MIPI vendor commands differ between them.

> diff --git a/Documentation/devicetree/bindings/display/panel/chipone,icna=
3512.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna351=
2.yaml
> new file mode 100644
> index 0000000000000..90e69f30cd91c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/chipone,icna3512.ya=
ml
> @@ -0,0 +1,79 @@
[ ... ]
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
[ ... ]
> +  blvdd-supply: true
> +
> +  port: true
> +  reset-gpios: true
> +  rotation: true
> +
> +required:
[ ... ]
> +  - blvdd-supply
> +  - reset-gpios
> +
> +additionalProperties: false

This isn't a bug, but since this schema references panel-common.yaml under
allOf, should it use unevaluatedProperties: false instead of
additionalProperties: false?

Using additionalProperties: false forces the redundant declaration of
standard properties like port, reset-gpios, and rotation, and will reject
other standard panel properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-icna35xx-v=
3-0-c304f04c32c4@gmail.com?part=3D1
