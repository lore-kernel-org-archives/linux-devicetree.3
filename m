Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692E1470116
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786712448; cv=none; b=Fr81Ab4ekQVSPOepw/84xM2uxoqAFT3MwkONxaCJpoE2yv7jvhxsSONGxlpM772cjb3qTF6Q8WilTbZFpBOc5lqJk099pEAuO6/G3lgbluQz6aBBgnkKU0QpoaRonI9X9fUhDc0a9BbDjobKNcngfDEruvkp/0MzEN2ix7pq9O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786712448; c=relaxed/simple;
	bh=E+67jbQXNGPkjICXdFPGJp4nou7ncQduKQF+HW8eAlw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cHl24LtYGFNp7uFseD1rB4dXZYsZlx/TuzK2Lfp+jLkXEFusSUun1J2fX98Bzw9kuucXHZbAHXPHpbJmYCwhQsF9Wf9DsOzNhQ656lWIRsi0uCbxVP7++ATqqrky0bkWRz4d4UVIptVRgIMSdtrHSnoWQeZs4h9OmBMNO7lbVIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfLDxMv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfLDxMv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4632E1F000E9;
	Fri, 14 Aug 2026 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786712439;
	bh=MA4Am1PGpMxQd4tsvT/jAeu5xlnBjKJph57Wkz8Czm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CfLDxMv4haXsVcthA04KIt41VzOGoexzX9J83RKYSkxLNz1wByWpn66RuchbxzXra
	 BSiLsgKCp64f7CvjQ5c+1oCknowzQSEr++5OJZ6hTwqHTd+x6x9YTv4f2SGgBvCRlE
	 hrgtU567C7blhHRwM3iDONpmQC8zd7Tqc4ZW8905RiiUUCzrw+j/MP+k/bLghaqcot
	 sh2+iyO+c/phnu0mx4gn+IgAMfAwyEG1l4dE95/pImpaHHr2x/ahRkG4pegsq6+8DE
	 bdMM09um9Fj/VZ8CPOHV+q1M6suy+gES9ZtRS0Wea7H1iSbbJk4X5MoqtLEs4X3gdL
	 3HRNRSXS/moVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: armada: WRT3200ACM: add
 marvell,ignore-regulatory-hint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Georgi Valkov" <gvalkov@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260814125025.90522-2-gvalkov@gmail.com>
References: <anoYr9H4KojJv-aZ@google.com>
 <20260814125025.90522-1-gvalkov@gmail.com>
 <20260814125025.90522-2-gvalkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 13:00:38 +0000
Message-Id: <20260814130039.4632E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#address-cells` and `#size-cells` in the `&sdhci` node cau=
ses the `wifi@1` child node's `reg` property to be malformed, triggering dt=
c compilation warnings.
--

--- Patch [2]: [PATCH 2/3] ARM: dts: armada: WRT3200ACM: add marvell,ignore=
-regulatory-hint ---
commit 28267c9e17b352aed9318b01c48207c391929954
Author: Georgi Valkov <gvalkov@gmail.com>

ARM: dts: armada: WRT3200ACM: add marvell,ignore-regulatory-hint

This commit adds the marvell,ignore-regulatory-hint flag to the WRT3200ACM
device tree. It creates a new wifi@1 child node within the sdhci node to
instruct mwifiex to ignore incorrect regulatory hints from ROM.

> diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arc=
h/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> index 4ab45f294de22..c5f94463ef710 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> @@ -165,6 +165,12 @@ &sdhci {
>  	wp-inverted;
>  	bus-width =3D <8>;
>  	status =3D "okay";
> +
> +	wifi@1 {
> +		compatible =3D "marvell,sd8897";
> +		reg =3D <1>;

[Severity: Low]
Does the parent &sdhci node need #address-cells =3D <1>; and #size-cells =
=3D <0>;
defined so the dtc compiler can correctly parse the reg =3D <1>; property?

Without these, dtc falls back to default cell sizes, which can cause
compilation warnings about invalid property lengths.

> +		marvell,ignore-regulatory-hint;
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814125025.9052=
2-1-gvalkov@gmail.com?part=3D2
