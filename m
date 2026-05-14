Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53D73148D0
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753169; cv=none; b=fB8bTTZ4mzEjoxieVTq3/x/2EFTBe7bEHuGrSjUStsDgItsRuQV/Vw+xguwTu5zKaYstE+FaUAO4GWJ2vklNm5O9CINGhyuYwPjHU/L2bYiMOUKJtrCeUDKLGqxBnMT8ZHT0SyjXSgfKPfIefK6YYP1mw9jR00SUhuyTC1VKoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753169; c=relaxed/simple;
	bh=I3zoIbflBpfPbgL673hGNCOuNDwH9E+RiVdqGSUfHVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q523pOE9JbmUiBzr5JQwNlIr3A8G+CrRVMqeWRrhqoNM6LVOFvVpFk4KBK7TVWLDjxg9r2nLbvC0ETAFxagPuylDByYBgV9JzROrT5xVe5NrnMzZBQ2RAUTUY+80Az6z512AfldfRs0dPWCmhnHO54Iq5HC1KOfjO99e9sKeBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba9W4OOs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba9W4OOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1C8C2BCB3;
	Thu, 14 May 2026 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753168;
	bh=I3zoIbflBpfPbgL673hGNCOuNDwH9E+RiVdqGSUfHVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ba9W4OOsjae2WMptX4V5EyEUTODxbLQtAHasDWGzM5g+4sFHBkSncIdEsrtec0Hml
	 6YkbdkkClNbVieYDmDd9R6/5lSevmcdpjD4y2FsxwukZ9Z6rmcLL24Csgrfl2SLIKQ
	 YiNSGw1/i9d/+jyXPi+4jHPaLDz75qMDGFdvb3hCaAzGNYarafSCbJ7rcxNzSskX4L
	 D+PhRzMK8Dbn8aDBBs6aZrsPtLhEZq6/r8XPUtBFvzd0HD+u1m1vHCZnPXO1bAgL8V
	 J8sHxTkSlNgP0BnCVo4Fmg1kbGp2AdnFbkt/BT/k6Kx9JqKBqNMeEJiIE0jx42H42/
	 1fJXkadIsusXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:06:07 +0000
Message-Id: <20260514100608.4E1C8C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding example provides two interconnect paths, vi=
olating the `maxItems: 1` constraint inherited from `qcom,pas-common.yaml`.
--

commit 6b248da80633195199f478d98724a0590dfdff63
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs

This commit documents the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>

[ ... ]

> +        clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +        clock-names =3D "xo";
> +
> +        interconnects =3D <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +                        <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;

Will this cause a validation failure during make dt_binding_check?=20

The qcom,pas-common.yaml schema, which is included earlier in this file
via a $ref, restricts the interconnects property to a maximum of 1 item.
However, the example block here provides two interconnect paths.

> +
> +        power-domains =3D <&rpmpd RPMHPD_CX>;
> +        power-domain-names =3D "cx";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-shikra-rpr=
oc-v1-0-9afdedeee002@oss.qualcomm.com?part=3D1
