Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D431F9A7
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462721; cv=none; b=uRvxKDhR5yfy/jBXC5KeDJ3B9DfUtM20b9bXFm/oN0YvIKi9txSiQOH8OOPe6x9zzSyr8Py0hyQD49Y/PJnY9hec28m9s6pmP71S4iS9rFcUDl+yuymsuCsaJ219Sa8jTOvU7JyL8/HJocG56LEVhN207DoFFRZIR4zlN8Xkp08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462721; c=relaxed/simple;
	bh=N/ier17d2Lbzu0Q1g9bHoRNxFUZJ/Lp4YCLJMq3+HeY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nm/rKe9Mex9Dj93RdXbyHw6ymgA8qPRaaIv+5Bg9bnpz2i0zBOjlzzXtHlCDXbZdvIDDgx4LBP88+oSnDfqTTDpiLK0S638yHmvLtVxpg06ontQ9nsDzjoTb+RhnGYI0gW61vTElfs8w+fLHwrFKB8Mw8FMLNiRzwvtNFukSJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXtrJz5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXtrJz5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EAD1F00893;
	Tue, 15 Sep 2026 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462720;
	bh=fCav2b52nfiCHR1uqbuoTkNoT4p4dJiOfR/bWB2E0FU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXtrJz5meT+uT5qLDFGZIzgkSlELWm2LZkf87h3QkYQw1vaQga1OYcCf1u4Efum4c
	 mvCgppsw9B3lCEW2ukLjcPXcmLUaffXzaUaGZiCHSxg5etcmFZBqdT/tC81+YA1sgi
	 NUhZe/ovjdSFFtidtm49xAs1zrhvI7y24jAno5uHcbU/vYDBsAsnuibtR6kQhz+GBf
	 1LjDX7g9oVWGTIuXa0yF7WGCcLZNCEI8DxMb8WoHmpkVncAjuQaXc/KnYwXMvWWTG7
	 XLBUY46VpQftKeaGqjT8SEx10xiVgMZX5txTfaUlcDDwdbOKot4qgcJrltn2Fms8xo
	 A30FJjz33d8AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: qcom: add
 xiaomi,taoyao-pmic-glink compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Zaikin" <zstaseg@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915084901.56622-2-zstaseg@gmail.com>
References: <20260915084901.56622-1-zstaseg@gmail.com>
 <20260915084901.56622-2-zstaseg@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 08:58:39 +0000
Message-Id: <20260915085840.21EAD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: mutually exclusive board and SoC compatible strings
--

commit c55f57a1517ca9ce82e67923ff8313d8fc20239f
Author: Stanislav Zaikin <zstaseg@gmail.com>

dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible

This commit adds the xiaomi,taoyao-pmic-glink compatible string for the
Xiaomi 12 Lite 5G to the pmic-glink binding.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.y=
aml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 16ad4f5698fc3..8ca057c4e3e61 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -41,6 +41,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sm7325-pmic-glink
> +              - xiaomi,taoyao-pmic-glink
>            - const: qcom,qcm6490-pmic-glink
>            - const: qcom,pmic-glink

[Severity: Low]
Does this force the compatible strings to be mutually exclusive and limit t=
he
fallback chain to exactly 3 items?

Standard Device Tree design dictates that compatible strings should be orde=
red
from most-specific (board) to least-specific (SoC, generic). A board-specif=
ic
compatible string for a subsystem should fall back to the SoC-specific stri=
ng if
they share the same underlying hardware.

By adding xiaomi,taoyao-pmic-glink to the same enum as qcom,sm7325-pmic-gli=
nk
in a 3-item list, the schema forces the DT author to choose one or the othe=
r,
preventing a complete fallback chain.

As a result, the DT is forced to drop the qcom,sm7325-pmic-glink fallback
string to pass schema validation. This breaks the standard DT fallback chai=
n.

Should the schema instead define a separate 4-item list under oneOf to enfo=
rce
the board string, followed by the SoC string, followed by the base fallback=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915084901.5662=
2-1-zstaseg@gmail.com?part=3D1
