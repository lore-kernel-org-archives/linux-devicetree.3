Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B834F474
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 17:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123675; cv=none; b=GF849zp5u1acZJ6xx7Qlr05DUaNQo4N7pLZIj0kgEaTZ35upBQ77yTG/Qwh49/fxCw1xegwLG23mtU0ef4RsLs+ZJNsGog6MI7SeyHuu4J+lJ/d6u/6bZGGg+wZHW38uvwCFY+cCSQAAiWtz4/l+rW5KMWNzCsACNzWPpnfRRZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123675; c=relaxed/simple;
	bh=xy0gv9yeC3o3DN69vqcirFBF5EfH7V5AclKXWhDPn+I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jwnak9EA2lohC0DovOgr9elrbwsUZC6DjtGhwWhmI0NXEeAfun4q6aGfgewypoQTqmW0oApM8cBQhzMXGMSq83dnRRjuxixmcjCdOjtjOIX9Fhk3BM9Kwk4Ylilpq4LEF9u4DcIr5Ej8Hw42bB7xIz+s31j68funLumMoFBbDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFLooS1T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFLooS1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A43C2BCC9;
	Mon, 18 May 2026 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779123675;
	bh=xy0gv9yeC3o3DN69vqcirFBF5EfH7V5AclKXWhDPn+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pFLooS1TCagsNTjNwjxobCcpipp/seNhrguWid1vIgohp+R4Py97uOoFpk78GOQj2
	 dcr8zkCP7ZJ9tfn0DCCgnIr8eW2vO7qX9KdgN3hia8pC2QcjxJuSqVJAUF9pjl01kQ
	 /UR9aRFPzp3HQJrpiMZxGyJYadz2WPe0nuWW/tJfWw+zOWv8VnqxwMbvCc2Ag0mGdx
	 qm9ODLQ9jLFK9m0Fmku0UYHJD3jlqDHb3X3GF0crfq3BRcq28SOEMqrX8ZvytVMYr1
	 C1t12CA471aCG1Uu2mxb8G5OAF+VskvUnkAMEV5EQVRytFhwHpVuPJ2A8jTBEo+3R+
	 uacvr0zcMbZxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V1 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Hawi UFS PHY compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: palash.kambar@oss.qualcomm.com
Cc: robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260518165346.1732548-2-palash.kambar@oss.qualcomm.com>
References: <20260518165346.1732548-2-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 17:01:13 +0000
Message-Id: <20260518170114.37A43C2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qcom,hawi-qmp-ufs-phy` compatible string is missing from th=
e conditional blocks under `allOf`, leading to incomplete schema validation=
 for clocks.
--

commit ef81b61a1b44f94e3b68451c007cd7fcd7dfb417
Author: Palash Kambar <palash.kambar@oss.qualcomm.com>

dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible

This commit documents the QMP UFS PHY compatible string for the Hawi SoC.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-=
phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.=
yaml
> index 9616c736b6d46..2326dcf38a467 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -37,6 +37,7 @@ properties:
>                - qcom,kaanapali-qmp-ufs-phy
>            - const: qcom,sm8750-qmp-ufs-phy
>        - enum:
> +          - qcom,hawi-qmp-ufs-phy

Should qcom,hawi-qmp-ufs-phy also be added to the conditional blocks under
allOf?

When a new compatible string is added to the top-level compatible enum but
omitted from the existing conditional blocks, it falls back to the top-level
schema validation.

This loose validation allows 2 or 3 clocks with any names, which means
device trees for the Hawi PHY with incorrect or missing clock properties
will silently pass validation.

>            - qcom,milos-qmp-ufs-phy
>            - qcom,msm8996-qmp-ufs-phy
>            - qcom,msm8998-qmp-ufs-phy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518165346.1732=
548-1-palash.kambar@oss.qualcomm.com?part=3D1
