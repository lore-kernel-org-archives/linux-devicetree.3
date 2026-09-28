Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A227AC4D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600474; cv=none; b=Bf3DWTLhImU9ehiKyxYoF4kCOdx6SYvI6hDZWplmXaTCHO5R2GPDbca2LQdQUCakJKZtPuNJtW61J2g4nJAdguXdQJM3fWwILGoHkJsfwiWrnpMeqqI2vAWbl4B4nDR/wm6JivgtzyMKG9M79Kfeo8LfaNADxaDGjReAXAF89OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600474; c=relaxed/simple;
	bh=mpnsW3eGoObbA97kMTnocJmjuSfSudSPDxMY12PzE64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cx0bK5Pr3VYVu6AuTCO1117++eQD9QET5M0HMrQZssJue98iwYm3wx2dOPYMZOhMX/HwAC6WdgxxfmNU1RwOoIVVGuQwolOpXl0UlO1vhSvegeJLmy6+HC1Uozl4nrm9v0fkPYURnSePsDZBtD0jzZXLohUPAPm4+IjLUEDcXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeeXRvNn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeeXRvNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C603A1F000FF;
	Mon, 28 Sep 2026 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600473;
	bh=aohhjCwGG+oGhDUvs4rztdl1UY5/8wre3cGhynJmDJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GeeXRvNnC0yrJ7TvX6xxebEfdHSQMlw0vtcdF56md2I6dlWlyknhlwY7KpVzN2c74
	 cEOS10zDwiBC2G53Ah8m3G27KDGuZs/TpCEwOYYWOQcxaMfJvpI3vijxKHf/Qa324n
	 zS1KTYoH4makXxJ46SWSd4B2ZvALGoFMRx/lE2+dexFQGEQKaHALlQXlqPZx5eO5K6
	 kufsQgWy5ENWtwcMFbrF4+y4YRF+noRjdh0p3tX5oqOfJPxgOMsI6CGWueWnkDm1jw
	 wSVdbzNgEb0w+yJJJuGBIfP8ahOXWcjDfDcTsviCbdnyVcfHvvwxfn5ehmAw6NRqJk
	 whTiv17U/0eEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 13:01:12 +0000
Message-Id: <20260928130112.C603A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: omitted header file with QAIF DAI ID constants
--

commit 1e97e3fc9f754770e71857dc90e01e438eeb58ff
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding

This commit adds the Devicetree binding for the Qualcomm Audio Interface
(QAIF) CPU DAI controller used on the Shikra audio platform.

> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.

[Severity: Medium]
The commit message mentions adding named constants to avoid raw numeric
IDs, but it appears the corresponding dt-bindings header file was omitted
from this patch. Was this header left out accidentally?

> diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu=
.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> new file mode 100644
> index 0000000000000..5cabbe54d6fd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
[ ... ]
> +patternProperties:
> +  '^aif@[0-9a-f]+$':
> +    type: object
> +    description:
> +      QAIF AIF interface child node for PCM, TDM or MI2S configuration.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).

[Severity: Medium]
Since the header file defining QAIF_MI2S_AIF* and QAIF_TDM_AIF* is missing,
device tree authors following this documentation will experience build
failures if they attempt to use these macros. Should the header be added
in this patch series?

[ ... ]
> +examples:
> +  - |
[ ... ]
> +            #sound-dai-cells =3D <1>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            aif@b5 {
> +                reg =3D <181>;

[Severity: Medium]
Because the macros are missing, this example falls back to using a raw
numeric ID (181), which contradicts the commit message's goal of avoiding
raw numeric IDs. Does this need to be updated to use the named constant
once the header is included?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-b4-qaif-sh=
ikra-audio-v8-0-ac618057fe85@oss.qualcomm.com?part=3D1
