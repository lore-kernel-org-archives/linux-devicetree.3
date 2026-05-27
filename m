Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF23ED3C8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876988; cv=none; b=NtFNE0O/Sw+XIz0qrjWnDkebLu0FKnLHxsZ0LrNti9mDzdHb6C56cR72hE6F19Yl4Y02LQzd5ED6Xmz6pPBYX1xQXVKiQQtngSB/LvPKxLJYVI/L7j4P7HuP6MIvLYIzpFkjOJ18+/9+q096BXi3wvy0OMpm/cgXTzg8A05Dz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876988; c=relaxed/simple;
	bh=x1TrvwN+JL/ykiG3qpBKSiQ0rQY2ziPcS2pUic8gcX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oqgS/ZYC3KC+bgkiO6WdFCPWqUPW/zCr4h+buw6AjQe6AKYxam38pb5K+d+19emfsna+U+XoqZnkSBYKGl2iVauTaibCb6QT+a6lweUrZoWEAiKpGMhHyjut1HxeAlH9zlWaFnnjdI1LgXE77+kEIfoOOMd/F9NWfrTUUKZLoxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEccPmiD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEccPmiD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83141F000E9;
	Wed, 27 May 2026 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876981;
	bh=OL0YgFF2FuCD4A5UVfui0qPIuDKCXYekLukNnn5CT5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HEccPmiD5XcVtQ8nP22AH7F9zDmhNigby0F1GrBEY7Qckiy7iQpBRleE0+kZE0KfZ
	 E4IqcFw6Ci294kenlrcFXCWWfhUqX8ZyWpuR2d2VzSHUfeOovN66DST9a074HZxMar
	 1iYz7YFJDzXnZS1+3QUpRSVtncRqisRdEudzxjJGysxBj06t5ZbTNevJkhHfe8i004
	 etwP6rP9XfTm+0I8wNOKNo2K0Mr/FTVPRIFr3vP7kCGPuBRg5S1qOdwhRrTNSLCsOq
	 8XMNSVSaywPyljwlqN8WoshbIrH1W+J+k+JYQwEHsxywfqlx1Ipiy0kHL7a/MlEwVR
	 krwzhtCpWBH7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abhinaba Rakshit" <abhinaba.rakshit@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com>
References: <20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:16:20 +0000
Message-Id: <20260527101620.A83141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Mismatch between OPP node name `opp-75000000` and its `opp-hz` val=
ue, incorrectly specifying 750 MHz instead of 75 MHz.
--

commit 7df0ac8d5186b38efd03084ecec240e439760d84
Author: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device node

This commit adds an optional OPP-table for the Inline Crypto Engine (ICE) U=
FS
device nodes on the Qualcomm LeMans platform. It defines the operating poin=
ts
by specifying required clock frequencies and their corresponding power doma=
in
performance states.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi

[ ... ]

> @@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
>  			clock-names =3D "core",
>  				      "iface";
>  			power-domains =3D <&gcc UFS_PHY_GDSC>;
> +
> +			operating-points-v2 =3D <&ice_opp_table>;
> +
> +			ice_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz =3D /bits/ 64 <750000000>;

[Severity: High]
Does this opp-hz value have an extra zero?=20

The node name is opp-75000000, but the frequency specified is 750000000=20
(750 MHz) instead of 75 MHz. Requesting a 750 MHz clock frequency at the=20
rpmhpd_opp_svs_l1 low power state could potentially cause clock scaling=20
failures or hardware instability for the ICE block.

> +					required-opps =3D <&rpmhpd_opp_svs_l1>;
> +				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-add-opp-ta=
ble-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com?part=3D1
