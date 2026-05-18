Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E53E8681
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100061; cv=none; b=d2pHCjdLpoV+33FhExF7MKbroXl+G5F3auIY4cfXc7uZOtO/tgWm0b6S0y1wmqYl1vzkCCVcTY234B4VaAz8T8vUiCWq3ZFFewSUarHXRoubFQpnNmgH0ou25rn0NtS1s49CsZY4MPGninSzCN4dHgEC+T37QFfedVUX0B9UjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100061; c=relaxed/simple;
	bh=VnOrgsB/RAIn1p0b3p2RIWmVeown2QrCKy0DQy1hwBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kjsj//Uwrl1avJDYvPS3bskmFUk2OC8IpZTAfrv4TPCGARScae+bA2uqPO7VPcM0+3D7KkWp6y0R/uAtqgcM7IvrfMxn9mWYar2BDjZVQpl17szelJzmPb/5X2es+uVjlnVGWgDEYLp7taiVehjRtpapo29XmznXGxd4rIieEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLoyEcHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLoyEcHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65539C2BCB7;
	Mon, 18 May 2026 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100060;
	bh=VnOrgsB/RAIn1p0b3p2RIWmVeown2QrCKy0DQy1hwBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aLoyEcHVfBqA4tJq5JnnJSEvlozQ62zoJZAuLANa87Uh1Z1JPwYZ2aPWrpKMqmzFW
	 dOnU553SabuvFqy0fMnmDDizD+ZjAhsfODO5ldGqAcxlERY3qfoeqk2o7WEGhmEgkl
	 KT1vu7Zh4MSdhsZZCWgqpA5VWfjMEtGBKc9pGj0jm2zMCgL856N+3RQHzj/8vZnCRm
	 BRE89F3c3J1W2aSxAqbcuFtyap4+dT76ptU3biiRQo59bFfMi5oK+HTiuyvr9GHiIw
	 yiD53r0OqW7rSRdIeoUK/ShK4STVyYDOIL6cUSs1c+R5k7FpAN3KfLQqeKgeSLX8gf
	 LpJOCQ4/GkljQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] docs: dt: maintainer: Add Devicetree and OF
 maintainer profile document
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518101259.34948-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260518101259.34948-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 10:27:39 +0000
Message-Id: <20260518102740.65539C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `F:` pattern for `Documentation/process/maintainer-devic=
etree.rst` in the Devicetree subsystem sections.
--

commit 78607746831a0985a18a7d86f6aa537fdeb92761
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

docs: dt: maintainer: Add Devicetree and OF maintainer profile document

This commit adds a process document explaining how Devicetree and Open
Firmware maintainers handle patch review and rely on Patchwork. It also
updates the MAINTAINERS file to point to the new document.

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd163..300e6985f9d84 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19942,6 +19942,7 @@ S:	Maintained
>  Q:	http://patchwork.kernel.org/project/devicetree/list/
>  W:	http://www.devicetree.org/
>  C:	irc://irc.libera.chat/devicetree
> +P:	Documentation/process/maintainer-devicetree.rst

Should there also be an F: entry for=20
Documentation/process/maintainer-devicetree.rst?

The scripts/get_maintainer.pl script uses F: tags to map modified files
to subsystems, but it ignores P: tags for file matching.

Because this new process document falls outside the existing F: patterns
for the Devicetree subsystem, patches modifying it might not automatically
CC the Devicetree maintainers.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518101259.3494=
8-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
