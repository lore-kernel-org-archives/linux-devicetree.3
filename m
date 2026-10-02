Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450C9470EA4
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932422; cv=none; b=f6CW1KC0gQ15nDyiCDnq2ksnsqFcQH/ZJ4oFgcZ9k1T+JQ75xh6axQylf1Ys2BDwLlSn+JSTyI2S59K8gZ0t92lj/nNPAMezGa1CFrI4CyjAvQwO/OxdbKRa8vGPj6IaEuW5446DQQnpygY+ReY/9iAim2w69pHdAaoTMVeocEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932422; c=relaxed/simple;
	bh=Qwq8n6OJ5r6ZJHFfW6g+8rLi4ZCsb/wu5ftZRcSFams=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QbAbkXplwv1u5BS8LxJfu23XszS2xPWooppExV3jNadD4TnThK/UMeQa7G4hwz5Z5Ch4GLTp+E3kaVNoyYKeSiosrIpPXJ8NPXT1v0g3G/zWZ4DGzRHVLmKL4ftDcgkrqvmcC3cwkJCvw7AmHkKVOYRG40XiogKk/py5gQSfqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMu83/E6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMu83/E6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C1C1F0089A;
	Fri,  2 Oct 2026 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932421;
	bh=4cA9Mvu1ov2nYk+9GZkGPmWe581hgXBsn7rxdfvpgEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KMu83/E6UfEn4ZDBZ5M4ik74FuysPL1VIvUoFqtW6TQ3z8hAJSHUYiHPZiKQ07xm/
	 P3mP6Ii3vvqYFUzTk92VCVkCTpmnwt8KuDrRh/wn9z99LobehaPk33wtP17bjjU+RL
	 SzIRom06scohGW56w1OKDv9RTUmRLwNUoffAeTs30s6y1/KwspNvcMS9UCMKhyR1Hj
	 TIfsg/CqcWHNIBAcgHswQkGIyiNokA2Sg+wwe+bUfxlQ8eSj5Y6N126Pk/lzOrmUNR
	 +JD88FSZUH5shUprG+BQEFOaGXpmBuMFRnUw9sbFruhDRAbHPWMKNNd1ZhWk1jFiH7
	 msDan+6lcksYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2] dt-bindings: net: Convert HiSilicon
 hns-dsaf to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930201919.76465-2-robh@kernel.org>
References: <20260930201919.76465-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:40 +0000
Message-Id: <20261002091340.E8C1C1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: additionalProperties false ignores properties from =
$ref
- [Medium] dt-bindings: missing required properties desc-num, buf-size and =
subctrl-syscon
- [Low] dt-bindings: driver still uses removed top-level phy-handle property
--

commit d25b601aef3405df25a4432415cfd3e767a90222
Author: Rob Herring (Arm) <robh@kernel.org>
Subject: dt-bindings: net: Convert HiSilicon hns-dsaf to DT schema

This commit converts the HiSilicon hns-dsaf device tree binding from
the old text format to the new YAML schema format. It drops the
top-level phy-handle property and adds the media-type property.

> Convert the HiSilicon hns-dsaf binding to DT schema format.
>=20
> Drop 'phy-handle' at top level as there are no users. Add undocumented
> 'media-type' property.

[Severity: Low]
Is it entirely accurate that there are no users of the top-level
phy-handle property?

Looking at hns_mac_init_phy_handle() in
drivers/net/ethernet/hisilicon/hns/hns_dsaf_mac.c:

    np =3D of_parse_phandle(mac_cb->dev->of_node, "phy-handle",
                          mac_cb->mac_id);

The driver still explicitly parses this property from the top-level DSAF
node as a fallback if port subnodes are not present. Removing this from
the schema without removing the fallback logic in the driver will cause
out-of-tree or legacy device trees relying on this feature to needlessly
fail schema validation.

Should it remain in the schema (possibly marked as deprecated) until the
C driver is patched to drop support entirely?

[ ... ]
> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.=
yaml b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
> new file mode 100644
> index 0000000000000..36251b45abeb9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
[ ... ]
> +patternProperties:
> +  "^port@[0-5]$":
> +    description: DSA Fabric port node
> +    $ref: ethernet-switch-port.yaml#
> +    additionalProperties: false

[Severity: Medium]
Does additionalProperties: false correctly allow properties inherited
from the $ref?

Under JSON Schema semantics, additionalProperties only restricts the
properties explicitly listed in the local object, completely ignoring
any properties evaluated via a $ref.

Would it be better to use unevaluatedProperties: false here so standard
Ethernet port properties aren't incorrectly rejected by dt_binding_check
when present in the device tree?

> +
> +    properties:
> +      reg:
> +        maximum: 5
[ ... ]
> +    required:
> +      - reg
> +      - serdes-syscon
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - mode

[Severity: Medium]
Should desc-num, buf-size, and subctrl-syscon be included in this
required list?

Looking at hns_dsaf_get_cfg() in
drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c, the driver strictly
fails the probe if desc-num or buf-size are omitted.

Furthermore, if subctrl-syscon is missing, the driver's fallback logic
consumes reg index 0 (ppe-base) as the syscon base. Later, when it
attempts to map ppe-base again by name, it fails with an -EBUSY error
and aborts the probe.

Since omitting any of these three properties causes a guaranteed driver
probe failure, shouldn't they be marked as required to ensure invalid
device trees are properly flagged?

> +
> +additionalProperties: false
> +
> +examples:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930201919.7646=
5-2-robh@kernel.org?part=3D1
