Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF3476CFD
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713149; cv=none; b=Z35u4XxUpWdd7cOxc3fPv2EqxFEJtA2gn66VFz9+4CbjVtULrvWBqRaTpmlsxwisfgO4JC/jemZXlJQBVCwuYyRtfa4p1OJoq/W/6dQD9QYhkiZylX5ivp+FSnhmYDrvZLaslzMtBMwLpBZ1omyKH7L91hcprXCGYs2qL24Ooas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713149; c=relaxed/simple;
	bh=K7xTQDvvJUHBSXiX8yjC/O827jthhxgM0cnalk37J/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UXYQsdQKc3q1A6YHQZpzivBSbPsva/zYNERlyJQlrW2vROd+CtAq753vXvvolRva/a5+p2sAWTvLyLSR+UVqjq8AtRdVBx5NeTJyBCV+kPepD+8A/aneTBuZIXcsw3e8ldmKpUpgjhoQO1Lh39/+oM5RjKrpOR64zQ1zHVTxG30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0N0zh+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0N0zh+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAA61F00A3A;
	Wed, 22 Jul 2026 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784713146;
	bh=2EG0FGhFlwhvH6bCd4kXBvYfz/8iptHAxQ18BJaWC9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S0N0zh+m4C7jOw7q07imAzpTdrp8J4r7PVNPiins5e5OtfAbzkBWEpkuvdQbjWRtE
	 9GneH7c06mp+rMByKFh/UZ+c4rJaMp7cdxvEB2hmMDjmaohmGgIzIdzGD2uKStJ+ne
	 Zh/XV1kHOgomG1EyUCw/sxc7Lt9dGHnjtbSIDg+T80cBlmqUXoUJlUUBeQ8Vibe34B
	 U/NDzYnefsfpjo8CQ//VkrtWV+BR4cdTOntGbA9To3/Q1B5wDW6dueCHr7xwTpVMP2
	 g0v9yM+w5Bp7sdEXP1HM1JdrCxNd5/7mcVbz/Ygp6RDJc2fiZ8hbwRqDXB4hZnI0TQ
	 /v9TJfy9IDf/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add x1e80100 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenjia Zhang" <wenjia.zhang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
 <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:39:05 +0000
Message-Id: <20260722093906.3CAA61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete schema validation due to omission of `qcom,x1e80100-i=
nline-crypto-engine` in the strict hardware constraints conditional block.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engin=
e: Add x1e80100 support ---
commit c7cd6f7e1716e4206c0cabbb6a305f96fda3ae96
Author: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

dt-bindings: crypto: qcom,inline-crypto-engine: Add x1e80100 support

Document the compatible string for inline crypto engine found
on the Qualcomm X1E80100 SoC, used by the Hamoa IoT EVK board.

> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-=
engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-e=
ngine.yaml
> index db895c50e2d25..29c9a1ff638c5 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.=
yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.=
yaml
> @@ -25,6 +25,7 @@ properties:
>            - qcom,sm8550-inline-crypto-engine
>            - qcom,sm8650-inline-crypto-engine
>            - qcom,sm8750-inline-crypto-engine
> +          - qcom,x1e80100-inline-crypto-engine

[Severity: Medium]
Should the new qcom,x1e80100-inline-crypto-engine string also be added to t=
he
allOf:if conditional block further down in this file?

Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml:
    allOf:
      - if:
          properties:
            compatible:
              contains:
                enum:
                  - qcom,eliza-inline-crypto-engine
                  - qcom,milos-inline-crypto-engine

If x1e80100 hardware shares the strict clock and power-domain requirements,
omitting it here introduces a regression in schema validation.

The dt_binding_check would silently pass device tree nodes missing a
power-domains reference or a second clock.

This could result in a synchronous external abort at runtime when the driver
attempts to read the ICE version register without the power domain enabled.

>        - const: qcom,inline-crypto-engine
> =20
>    reg:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-devtool-v2=
-0-d7e609ef7388@oss.qualcomm.com?part=3D1
