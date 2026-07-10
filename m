Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2487285CAA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696147; cv=none; b=ECUVOezrECl8voPsbxVVMFAURDd6yUMy7nabuLisPl+foJ76dBx8usejHSvnRskoXYo/yJDDMBFzhnGtwiFjK5ffopVQydG88aNmdX4ez8BGvUkoDHJXAJCrGqL6heYcUm4nbPebsZxa1QCNgP3kRxOAJfWgqywsO0TEZZqr3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696147; c=relaxed/simple;
	bh=x9t4zSwHP8jSzATgTslXNP5z73fUFpFBf0ZosgYoxDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YCAVMKBkFRc8z4SWHmWqbsFsi5HemcR5GxlvXQ38SeXQ0w5ujwQqy/ErIqIX3tjFekVZLwvRI486miJGTXXyOJ5vLOiHJexlYI2OZZpN3yreSWt3nvEBG+rNdjCz61xmeupaENgDY+Qv1/8GL84Vu6ji984pyFm5f5F0Tb6HwaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhdWWMcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhdWWMcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173661F000E9;
	Fri, 10 Jul 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696146;
	bh=fjndfOkoXRphqeSwyu11a+KnForSarAk0PM0Tl6DA1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RhdWWMcPKP8oORHzGl17lDdHhU6DXuoZjBEpRczJj6Qvee29DfG6qsSHlQTEk/LN9
	 AyY+kkiuCoje9zLSAL1OzaYLsciiDj/8MDtWP2KIV2XMkWLxBzzjf0eyQAI/kBJkFW
	 oNBLRj8QQO+59HBwDL0Y5p72blQjNUKo7uyreSvugVdFmvp5klqV2t8SijEo3jYhdo
	 6CKOTWpmQQ9KYWNeAm5bYnzYDt6SlF0Esc7FjqhvgpFdtZTr5WOPzVqrhFPTBEv3Cb
	 t11/g0fcvSfmt5+GOOdYJA3Om7u+61vtESbGfpo9NrzuQ2aqzspmySPQdK2tqKE3i6
	 /z6s3//8/wrww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/18] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8195
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-3-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-3-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:09:05 +0000
Message-Id: <20260710150906.173661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `mediatek,mt8195-sys-clock.yaml` binding documents `#reset-cel=
ls` as a property but fails to enforce it conditionally for hardware varian=
ts that act as reset providers (e.g., `mediatek,mt8195-infracfg_ao`), and t=
he example is missing it.
--

--- Patch [3]: [PATCH v2 03/18] dt-bindings: clock: mediatek: Make '#clock-=
cells' required for MT8195 ---
commit 42e0c80a3dd56f332e8ace6fcaa3d35d00fa2f11
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8195

This commit updates the MT8195 clock and sys-clock device tree bindings.
It adds the #clock-cells property to the required list to ensure clock
provider nodes define it properly.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-=
clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-cl=
ock.yaml
> index 69f096eb168d1..ba1b36fa01699 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.y=
aml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.y=
aml
> @@ -43,6 +43,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - '#clock-cells'

[Severity: High]
This is a pre-existing issue, but the mediatek,mt8195-sys-clock.yaml binding
documents #reset-cells as a property but fails to enforce it conditionally =
for
hardware variants that act as reset providers, such as mediatek,mt8195-infr=
acfg_ao.

Should an allOf conditional block be added to enforce #reset-cells for these
compatibles?

Without this constraint, an incomplete device tree node lacking #reset-cells
for infracfg_ao will silently pass dt_binding_check validation. At runtime,
dependent drivers like the thermal driver (which relies on
MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST) could fail to probe or operate
correctly.

Additionally, the example for infracfg_ao later in the file is missing the
#reset-cells property:

  - |
    infracfg_ao: syscon@10001000 {
        compatible =3D "mediatek,mt8195-infracfg_ao", "syscon";
        reg =3D <0x10001000 0x1000>;
        #clock-cells =3D <1>;
    };

If the constraint is properly added, wouldn't the example also need to be
updated with #reset-cells =3D <1>; to prevent dt_binding_check from failing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt8189-clo=
cks-system-base-v2-0-2926da3db6cf@collabora.com?part=3D3
