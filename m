Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB13101D8
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028569; cv=none; b=X0YMLkICbslvmVg3kGUlDQgw1fpCM0uKYG4lszR7c4bqfw0vk6Waz9EN+Fjq7YjONWbZbqWvjg02dN6ahd1opOS3iTpRmOpzNOxvg8jW/AbpHwotqLj8P1TKp3q6s8RMoBkHF9mZhBpmajS/8pnyUNpXwUG7kmP7v09YXMyaRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028569; c=relaxed/simple;
	bh=V/xwlsEIlQN68izK5bH2x8e0x/a5Vci9/8zYNCEatrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SkiuWK6o+LFBwms4FPU+uMebnWq4RT/Pa1l6Rue4363vvLpEuNZb0T1/P+3tSHwiwsFKurHInh8lSM/gFPU5udVp01QQCWKro5P4bcFrt7n2yGIsEeEQIMG01B7LUUdIan9VyBhMV4fdbOmFieamqiwq+E9a7W9hdS93A1FAfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoYy6zH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoYy6zH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BA5C2BCB0;
	Sun, 17 May 2026 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779028568;
	bh=V/xwlsEIlQN68izK5bH2x8e0x/a5Vci9/8zYNCEatrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XoYy6zH8gv978xd2aLmbkrgF1mQAITYUSrJ66x9yS+c1e2WJ7c6XD2cqU/A6GUIjU
	 fBgySf0AUxqdNxCtqno9SKtijMqit/dRKcFHyQuY+Z6Kz9iKVtQz1D2YhoGQLPix4o
	 LHvZy2luz5cV95wEPVSoOYAQWPtYilE30AoYty3Z6rcaA8OTmSJ10ei+gEGVZsdq9X
	 z5ZvDWj+c0u4aUjt+PbUMBrW95IV8lP/G98RtAld3l+Ch6RiI1opsO4MZbvlW3Mjhf
	 hZwpBFa8kcjmbUrMzNkm1UMYx9585nQa3Qtce8a0fHyOdwzgQHRBIGg+QtWT5nxGtl
	 Cylf4D5kj2acQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for
 sf21-topcrm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chuanhong Guo" <gch981213@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 14:36:07 +0000
Message-Id: <20260517143608.98BA5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-bindings header file exposes software-specific `MAX` macros =
(`SF21_CLK_MAX` and `SF21_RESET_MAX`).
--

commit b39e2fdfa1953205f67f3e13ae23a09e43917c11
Author: Chuanhong Guo <gch981213@gmail.com>

dt-bindings: clock: add binding header for sf21-topcrm

Add the device tree binding header for Siflower SF21A6826/SF21H8898
toplevel clock and reset module. The header covers both clock and
reset IDs provided by the block.

> diff --git a/include/dt-bindings/clock/siflower,sf21-topcrm.h b/include/d=
t-bindings/clock/siflower,sf21-topcrm.h
> new file mode 100644
> index 0000000000000..3690b3452501e
> --- /dev/null
> +++ b/include/dt-bindings/clock/siflower,sf21-topcrm.h
[ ... ]
> +#define SF21_CLK_PCIE_REFN		29
> +#define SF21_CLK_PCIE_REFP		30
> +#define SF21_CLK_MAX			31

Should this MAX macro be exposed in the dt-bindings header?

Device tree binding headers define the hardware ABI, and the total number
of clocks is an internal software implementation detail. Changing this
value when new clocks are added in the future breaks ABI compatibility for
components compiled against the older header.

Could this macro be defined internally within the driver source code instea=
d?

> +
> +#define SF21_RESET_GIC			0
[ ... ]
> +#define SF21_RESET_NPU2DDR_ASYNCBRIDGE	16
> +#define SF21_RESET_IROM			17
> +#define SF21_RESET_MAX			18

Similarly, should SF21_RESET_MAX be moved to the driver source code to
avoid breaking ABI compatibility if new resets are added?

> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-sf21-topcr=
m-v1-0-438f2e0513ff@gmail.com?part=3D2
