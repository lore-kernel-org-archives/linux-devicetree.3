Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249C138332D
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552695; cv=none; b=YArveKYDrQOlb7CYJATzxvUltziwDZ7rB06o2/Vg/xQpR/rEoIN1M250YFfAlddav3nrE+hSuMt8PlfBuMfynHO9W+kAocRnDc6Af0L/qNNcT/Z9xspavO9qV78+LkQaz6sIPWKm5qHPxRh4qymUNATaDaK+GVOz9wgVkdSRIKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552695; c=relaxed/simple;
	bh=GUq2bjIP++wUPsstZZZkcgQ57nWknCwbEBuI8LmS/Pk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CxETKpTYZ++mRgmZcop/QgP2bR6szhArGzj5paMMl+ZSD6riW9l0PUeXv4CpxVHTFQZaRuoFdqYABLltrhsHZfnogzAtr67VtlP13dG4QB/np+u4us45QIPoc4IvMh9ezCjRHvTiCD+zszCsI6BYFTJsvVzEfRVjsG/JQT0FRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRBzEAsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRBzEAsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77615C2BCB0;
	Tue, 12 May 2026 02:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552694;
	bh=GUq2bjIP++wUPsstZZZkcgQ57nWknCwbEBuI8LmS/Pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SRBzEAsdaqdElVcwlYe7ReMDML1bAXFItdQVrsB7rMG+hQZSXql4C/R8M0Go9z/eq
	 jSE6Z88MRUGpN8L3EF0j1oDa1NrsV/aDr65YFeS2g+A4/l6pJ7XkKebQIy0TvTkqnV
	 iPoWM83tQy5nCQEKuW6ZPYKKzsdGZhlitqoVljlBNc7yp3ViMaMSZR3QfTHs/dDQuJ
	 K2AjjHRUPhLpCS2ZaLu0vzyNS+zuFI+XfV1xEOntUZ3g7vpW+/5scTLw87q8NO8T8/
	 6OFm05hO0KvMnF9W2jWzqqa/wbf9xEmYpvyBvaKHxEVKDIrhH5G4w6XMJoMc7SfT7g
	 rw5LKpNmDnOrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8550: add labels for thermal
 zones
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
References: <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:24:53 +0000
Message-Id: <20260512022454.77615C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit claims to add labels for the cpu thermal zones but mi=
sses almost all of them.
--

commit c8dbf175273a7084796c662b38cf2e0899deb30a
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

arm64: dts: qcom: sm8550: add labels for thermal zones

This commit adds labels for the cpuss, cpu, and gpuss thermal zones so
board files can extend them with trip points and cooling maps.

> Add labels for the cpuss, cpu and gpuss thermal zones so board files
> can extend them with trip points and cooling maps through the &label
> override syntax, instead of redeclaring the zones by path.

Did this inadvertently skip most of the cpu thermal zones?=20

The commit message mentions adding labels for the cpu thermal zones, but it
appears only cpu7-top-thermal is updated in the diff. The other CPU zones,
such as cpu0-thermal, cpu1-thermal, cpu2-thermal, cpu3-top-thermal,
cpu3-bottom-thermal, and so on, do not seem to receive labels here.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 912525e9bca6f..a9c678fc9cb2e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi

[ ... ]

> @@ -6028,7 +6028,7 @@ cpu6_bottom_crit: cpu-critical {
>  			};
>  		};
> =20
> -		cpu7-top-thermal {
> +		cpu7_top_thermal: cpu7-top-thermal {
>  			thermal-sensors =3D <&tsens0 13>;
> =20
>  			trips {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-pocketds-v=
2-0-299dd4247f2f@gmail.com?part=3D2
