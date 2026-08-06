Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983613EAC61
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008829; cv=none; b=prXkLQZgbLiDDhJJYjlaKOfjw3z0fzRj8UM4l4rUfuRyNSwkEDwuAIjWdUO3lzGPfo4cld6DxHy0bEIKtB2ZIdkHlqY6uJpHYu2nF6PpBo7P0G+/WVihJRxjbOkOtULtXRtQKo7bVbdjswPQYi0BxiY8tcfms6yCtD1kjnt2aQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008829; c=relaxed/simple;
	bh=iIDciSgbECrgdF3SO2+r3qm/qCnx813s3Up6Oz7OyNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BTui2eHpfvqmDEvdfH076K+XhNh5o6x+lD3sg+jkTSLPIwwVDjR82V2zndtP1btuHVKSkwb7L836XcclgQvYbcIiOOasjaKlGuQuIepjyN+BW167+zUBmyC8lKFAb6PsJ8asFltKq1AvrHMCqOxU5WeXDmiAtkJhjhdxRMFApRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJt2dl5y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJt2dl5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7421F000E9;
	Thu,  6 Aug 2026 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786008828;
	bh=hmtQG9egTMopcqqu08MkETz8jaJvgMsgY2mH4rnrHJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJt2dl5yDnLCD1twMW8qMdKrOg+WI9R2lpyojuNO7kpCmxNYxm5dWQ78ORFkRf5yH
	 CrnFuVJTk2UByFUulDFWVlqPc/N5Hhzl7+ZoH/A9adv86lYkSu6tQ3fm4G6qaiVKb0
	 Cc4sKNAby/2AF1yDD8kijtxPoilYnisZhEjjMErX42DCAagy6LY4e2qFKXXbowyL7p
	 JaGi9bA0eq5MEhCfM4g2QqtgUDrIWMDyGq6C8yqDDa1+TDmEcTCRN9NfB9QedYcOfw
	 5xi5i/2LzYjey8Y4HQ/nLPp0w16hOia4Du8ebVbQ/RMYbM4jKdDmJwEZD3d55hFVKp
	 V4jusGr4Ps9PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatible
 vendor prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:33:47 +0000
Message-Id: <20260806093347.EC7421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Destructive removal of device tree compatible strings breaks A=
BI and schema validation.
--

--- Patch [1]: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatibl=
e vendor prefix ---
commit 7bb728799feb3a9be3367a121312b26bbd930632
Author: Chiam, Evon <evon.chiam@altera.com>

dt-bindings: arm: altera: fix Agilex72 compatible vendor prefix

Altera has separated from Intel. Update the Agilex72 SoC and board
compatible strings to use the Altera vendor prefix instead of intel.

> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Document=
ation/devicetree/bindings/arm/altera.yaml
> index 3030cf46fe74c..2ab53cade2fe4 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -119,8 +119,8 @@ properties:
>        - description: Agilex72 boards
>          items:
>            - enum:
> -              - intel,socfpga-agilex72-socdk
> -          - const: intel,socfpga-agilex72
> +              - altr,socfpga-agilex72-socdk
> +          - const: altr,socfpga-agilex72

[Severity: Critical]
Does replacing these compatible strings completely rather than retaining the
older strings as deprecated break the ABI for existing bootloaders or
firmware?

Also, will this omission cause validation failures during make dtbs_check?

Looking at the tree, arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi still
uses the removed string:

arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi:

    / {
        compatible =3D "intel,socfpga-agilex72";

and arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts also continues to
use the removed strings:

arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts:

    / {
        model =3D "Altera SoCFPGA Agilex72 SoCDK";
        compatible =3D "intel,socfpga-agilex72-socdk", "intel,socfpga-agile=
x72";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786006669.gi=
t.evon.chiam@altera.com?part=3D1
