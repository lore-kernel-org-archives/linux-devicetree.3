Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6863D40A93B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227613; cv=none; b=mNvt/Cup3Lz3dExGP4saGygWTFH7Pd7M4WO/aq8Fo0sL+M4vB1VcbvgdNgo2/8LPBl4Ma5ZO6hoVtmLtnheZlUSiM7jtueWcqANtV8rFAF8ICppNnE+FSJJIWVP3OjaWXBcbJSQ4NY+Uo4mrrfUfvRRYQ7081UkZmd0E4ty+ZFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227613; c=relaxed/simple;
	bh=6Ldba/N/bGxoTM/CQz1LF6t1qpziSLdkJQZ+ZlPf/2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JitIQBrG5YzSFcU/+eqbTuC1BoYzCXUKmo3u1d1MognfnKUm9cOUKRRi9V4HHu4FtLYOpoGpn9EMOKtvqG2QatUvw6bPqKopl3Nwkv3OxSKrY1spUaduUzQ7wuRVssTFx/h9LKqpO1htbg++LAfs+4oIw0jG4xin4N0TNFfCSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GltvunTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GltvunTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61881F000E9;
	Tue, 28 Jul 2026 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785227608;
	bh=KfD4vIKDZ1tayhvxAAlWomG9aITxdxq71ZQXWlm8Nzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GltvunTwKakJ0OHKT1y1Oia9+rhXK7GrvECLMfUsQCHmyDlmeIgieDxIZauV/vVHo
	 ptYQvc08XEmZ/yj/7JJZNLoet5AWfBaVHvS+HD+IYvf3DpdImEIHwXxED0Hp9i8q8s
	 F9df4+RGLyvysrk0otnNVSzAiVY4tsBKlOFFRh5qpNGYRZglRzRTllx1VTKYg0BB9L
	 MO/0uY+dhuFOUyXc+Vg8ElUyLeSRB7U8feRV3lhSoXvxbgLg1HWRTWG4ADgwHz3pxa
	 1CGK/t7QWugVfadVZhv7hPxJVp37aRsIJX+tvUFzHPBxQnn/NYtt0ERO++Ir3whn59
	 gtuc8H2zPRrJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:33:27 +0000
Message-Id: <20260728083327.E61881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing documentation and schema constraints for `opp-hz` mapping t=
o device clocks.
--

--- Patch [1]: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder bi=
nding ---
commit b9c2dd6a295eab81ceffee829f7471d1cd7459a8
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

dt-bindings: media: qcom: Add JPEG encoder binding

This commit adds the device-tree binding for the Qualcomm JPEG encoder
hardware block present in SM8250 (Kona) SoCs. The encoder is described
as a standalone hardware IP within the camera subsystem.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

[ ... ]

> +  iommus:
> +    description:
> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
> +      for the JPEG core engine on SM8250.
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object

[Severity: Low]
Should this opp-table definition include constraints to document the opp-hz
array mapping?

The binding requires 6 clocks, but it is not clear which of those clocks
are being configured by the opp-table without defined schema constraints.

[ ... ]

> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <100000000>;
> +                required-opps =3D <&rpmhpd_opp_min_svs>;
> +            };

[Severity: Low]
This example shows a 2-element opp-hz array, but there are 6 clocks defined
for the device in the clock-names property. Could the schema constraints
be updated to clarify which specific clocks these two frequencies apply to?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728082548.2511=
694-1-atanas.filipov@oss.qualcomm.com?part=3D1
