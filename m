Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C162264CA
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783193263; cv=none; b=pVcdecvu91PD80RTA6v/jRvDNHrxwlMFMloV0TBbq4i1B7T2f12c3Kt2QymZuqDPdMfpwJTQkdxuHL/kZJPHGwprBq5k/q5oSkEIT1cITyk+kaqFk3/QutrSoOAiGGWTue5AbE6VAUwSPR0KgGXLMvt58LIuUDVbFxfGLuxzOBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783193263; c=relaxed/simple;
	bh=L+f8JD49ZTr1MbvR1PFCUw4qfWJYXp9nhttCsNPUe8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQAjsBceIN0v4e3bVxw8IQLCIQI0pbgFIMw8FBRyaYhRRoJZibH9+mdDy2a4upAkoe7p6TF7CloQq2ra/FBlUzMvM+tKXSZNCYPKpLYcdFkw1k4QIJZ5GgmuG4EOTGae59ZAmjnT7JMRUl8hI5acqxY+yP+C44Run40OsOmlZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFJEXjUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFJEXjUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1DB1F000E9;
	Sat,  4 Jul 2026 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783193261;
	bh=03g7czpja5Ip7yarXY0FEmXXYkED1G4qbXwfWBkf0Bc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFJEXjUCxuJVMKnSACkuFTrYwmXnUHLNp8lYz+FlcwoYs7X9LoqvNApS+6qeKKqk2
	 E6s2Lzt7NQviy4qYk9A/9ZONtgd9El+PEmNyX+ts0LOXJsvmBOS0+AndTXPi8jYMmo
	 5i+RDzpk4y5IzR6UNDuwpCk01rtFrJLfZEz5ZQkRRFFcCSHhe3RjLs9yVNy8b6eYYa
	 dt/styYxobNM3hHszfq4QATsv5m26+eC6QFvuE7T1rsyDG3HbJxS4U5VDgRc92oxD2
	 vU5Dia1cc5ZKVYypdS1GegMrc+J7q/FSoGDDJXOhEC6HPWDlODnDAImIpl5rCI+a14
	 Y/GtALGLfW5FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: mt6572: add cache data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260704-6572-phase1-v1-2-61c2fe6be19c@protonmail.com>
References: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
 <20260704-6572-phase1-v1-2-61c2fe6be19c@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 19:27:41 +0000
Message-Id: <20260704192741.7A1DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect L1 instruction cache line size and sets for Cortex-A7, m=
isrepresenting hardware topology.
--

commit 7654f13f8bc1ae70f4b6b62c66fe88fc8cca8e2c
Author: Roman Vivchar <rva333@protonmail.com>

ARM: dts: mediatek: mt6572: add cache data

MediaTek mt6572 includes 32 KB I-cache and D-cache, and 256 KB L2 cache.
This commit adds information about cache size, cache line size and cache
sets to the devicetree.

> diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/m=
ediatek/mt6572.dtsi
> index fa0e5df766c20..5716505dc9e4f 100644
> --- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> @@ -20,11 +20,34 @@ cpu@0 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a7";
>  			reg =3D <0x0>;
> +			i-cache-size =3D <32768>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;

[Severity: High]
Does this inaccurately describe the Cortex-A7 L1 instruction cache geometry?
The Cortex-A7 specification defines a fixed line length of 32 bytes and is
2-way set-associative (which would imply 512 sets for 32KB).

If the kernel uses this device tree to populate the cacheinfo sysfs interfa=
ce,
won't it override hardware-probed values? Userspace applications like JIT
compilers might read this incorrect 64-byte value and use the wrong stride
for cache invalidations, potentially leading to skipped lines and the
execution of stale instructions.

> +			d-cache-size =3D <32768>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2>;
>  		};
>  		cpu@1 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a7";
>  			reg =3D <0x1>;
> +			i-cache-size =3D <32768>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;

[Severity: High]
Can this also cause the same incorrect 64-byte line size to be propagated
to userspace for CPU1? Updating this to a 32-byte line size and 512 sets
would correctly match the Cortex-A7 hardware topology.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704-6572-phase=
1-v1-0-61c2fe6be19c@protonmail.com?part=3D2
