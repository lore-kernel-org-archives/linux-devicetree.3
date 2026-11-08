Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794159186;
	b=tui+prkpJKIrdH9nrbMn0gFveEKzd0pDLnFDG+LqEVBw+0KkCaOneHVLZeh5rEVhDzhP
	 fsBhptB/5YCQoRwoeFRXKMM3/DVwwnsjWcMMKHF0xXjk04k7xbh6Janw60oJ0vpEYd0TB
	 BxJvz2c7m/LNKdPl+tkV7+f9eca/PLaamfuYh9rMCKjGobq9kPf31R7hgALZe6OlVGT2w
	 Db3wwa6hgLNPcxs5tdAEXl/XCuevigs8YOeNSiVRgjemIS6slBww5xR8TdqsTCoFWTyOY
	 dXRyeDdBRGzfUt1Gdzd88mSzWUjEgvFWcWYsDA+Wn+wYDZ266VuMLrdDARPpQmMwNkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794159186;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=;
	b=ruc6w97wR4HDUMCuk3lGZe9UnquHw9uWHKs2GRUrIRh6h3h6B1n4/9o9XzzJlz8NnaO/
	 0B4kuJe2kulN2fQfFVGze6/UnTLyE3r+QvBSX/MFUwli36AVnojUm1SnxhEk6EO3JCCsJ
	 ShD847HEJ4KTno3Tgd6Wqb1o5j+bHaiSq8YcNydyBtASrFSNMloi+5F3sbPd1JKRUgps1
	 SdcmSBTBY/YmrYZwiqJFixO/STUriWkTQRuIqdN3nEehcwxWDTsRFlBdOxA1j1UmKHHpd
	 fawCDfWheKQ1iJ56/wJAVW8opp69E0g57rTod+lLwMl7coGXUBdsVIFaNUhkbTpV95A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ubuntu.com;
	spf=pass smtp.mailfrom=fe-bounces.ubuntu.com;
	dkim=pass header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=hUH62b6w;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08512606A32A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 17:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08512606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=hUH62b6w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1794159179;
 bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=;
 b=hUH62b6wWLBQaAHtKJmhGM8hS/IgZWJAg9FAPlzX6nxk7E1AFgrue1+f2e0Wxu+S1eIKEgK+6
 sEvU543Nw/HnzaLYnOWE73w1luC6CZZH+AgblbWKUrMz0eg7DfE1xQLk6l1DcEEzCv6D0MIVMmA
 PzlENqckvChaKYAt3ZnvXm1bS9UtX4zLYUl90GRVF/6Zxg2vJBUS7IgE7bFB08PY40xSYvW2F3Y
 lrA+XJ+KfVLXoTgT4zj8GKpF9gALE3U/i3RtK7YQyC0UVmpq2rf401FxvR16R1/xznypzK1y9fN
 YitKq34puxj+dX1lGM9uuf/PwoDW4WmjavVVk62kgSIA==
X-Forward-Email-ID: 6af0b240935e4de7801c9067
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 08 Nov 2026 12:32:46 -0500
Message-Id: <DMQ0CENBZQGW.L35BD1BXYE9Z@ubuntu.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>, "Yuvan Shen"
 <yuvanshen09@gmail.com>, "Nick Chan" <towinchenmi@gmail.com>
Subject: Re: [PATCH 00/13] drivers/perf: apple_m1: Add M3/M4/A18 Pro Support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <myrialsarvay@gmail.com>, "Will Deacon" <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Sven Peter" <sven@kernel.org>, "Janne Grunau"
 <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Marc Zyngier"
 <maz@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>

On Tue Nov 3, 2026 at 5:14 AM EST, Myria Sarvay via B4 Relay wrote:
> This series adds support for the CPU PMU in the new M3, M4 and A18 SoCs
> presed in apple devices. These PMUs have new encodings for events, along
> with larger codes for these events. All of these events are as Apple
> describes them in the various kpep files found under /usr/share/kpep on
> macOS 27. More events may exist, but we have no idea of their affinity,
> or what they actually count, so we don't include them here.
>
> These patches have been tested on my own M2 (t8133-j413) and M3
> (t6031-j514c) devices, as well as by Yuvan on their M4 (t8132-j713)
> device.
>
> If possible, the device tree changes should probably go through
> apple-soc, as this is where the recently picked up M4 Pro/Max dts are.
>
> Tested-by: Yuvan Shen <yuvanshen09@gmail.com> # on t8132-j713
> Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> ---
> Myria Sarvay (12):
>       dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro SoC CPU PMU compatib=
les
>       drivers/perf: apple_m1: Remove unused variables
>       drivers/perf: apple_m1: Support per-implementation event size
>       drivers/perf: apple_m1: Use macros for per-implementation init func=
tions
>       drivers/perf: apple_m1: Add Apple M3 Series Support
>       drivers/perf: apple_m1: Add Apple M4 Series Support
>       drivers/perf: apple_m1: Add Apple A18 Support
>       arm64: dts: apple: t603x: Add PMU Device Nodes
>       arm64: dts: apple: t8122: Add PMU Device Nodes
>       arm64: dts: apple: t604x: Add PMU Device Nodes
>       arm64: dts: apple: t8132: Add PMU Device Nodes
>       arm64: dts: apple: t8140: Add PMU Device Nodes
>
Maybe the folder should be renamed to 'apple_arm' or something like
that?

> Nick Chan (1):
>       drivers/perf: apple_m1: Support per-implementation event tables
>
>  Documentation/devicetree/bindings/arm/pmu.yaml |   8 +
>  arch/arm64/boot/dts/apple/t6030.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t6031-base.dtsi      |  12 +
>  arch/arm64/boot/dts/apple/t6041.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8122.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8132.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8140.dtsi           |  12 +
>  drivers/perf/apple_m1_cpu_pmu.c                | 664 +++++++++++++++++++=
+++---
>  8 files changed, 662 insertions(+), 82 deletions(-)
> ---
> base-commit: acb925da49876e74b806ccd48a7518d2d3368e5d
> change-id: 20260929-m3-plus-pmu-events-e4010ab44135
>
> Best regards,
> -- =20
> Myria Sarvay <myrialsarvay@gmail.com>

