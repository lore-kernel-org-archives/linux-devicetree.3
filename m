Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0422C15B0
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778725205; cv=none; b=pC/exn1nG3XQZPZKA59vRCeaFWOMXiY/nRnP1HwOGUMKrtIDf7xgoXraa0IdW5vp8E/D1eYYGcA3niXXgp74Z+Pg/jRKWnsJLYA4efZ/efTjtIIXVgDq5idJ8dT/2UE+cKYqeJOmi2WZV5TT61ICrjpUAg9TSfBScysDo5D1aZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778725205; c=relaxed/simple;
	bh=zhBbiVIKbJxxUjYi2pKorbgockCLfPCiuHv8JXC7BLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vs4Ce0CVgoR20N49TdumxIsWrbJyfBowdr/AQrcNfm+kI3eItmO0Kr1cfdBqlzj9Q18QbaB7tkSZ5tqMe32b7uDHnJwe5aqikecN4Aj5a24eHQgyRR+YT7l9ajQxPuh9PUiBw6FbQIwmE8tOQ9kRug6njq35eZhC1BMQg3m0bxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pt5cBsiV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pt5cBsiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E99C19425;
	Thu, 14 May 2026 02:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778725204;
	bh=zhBbiVIKbJxxUjYi2pKorbgockCLfPCiuHv8JXC7BLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pt5cBsiVMnHqtsCmII+fsFmKRppSQFWm18e+NIXr7ul9pWn2CVpwxIdWmMieZ8LDR
	 srcmhln0oOX6G/Ypt5mHvnaETkDP9CRqlfoWb0aL8MI7D7d98wd8OodniWzST1Ck6q
	 ZTMAFkzsvOmFFlIcjNOmX8pI62iEg//Vrgvga1BZyZa0saTSZ+qhpQUcgfp8qYBIk5
	 WbL7zUrPsDnaAMShGWLK/gHqP/EtGimrEABLEm0IJWOo61pzGj5D06qIwYr+diJ4XE
	 HZugwpK9W+viektWUU16erydIpX7KlTq5uctAvMwS2JeGjWnONFtPh6U88ZbJWAmoo
	 jZPDcFBwXyTUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/3] arm64: dts: qcom: ipq5424: Add the IMEM node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-wdt_reset_reason-v10-2-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-2-cebda08ab1ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:20:03 +0000
Message-Id: <20260514022004.66E99C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The device tree node maps the full 112KB IMEM region, exposing ina=
ccessible memory to the generic SRAM allocator.
--

commit d275aea75b5a17a008a9020c79777d0cc37ddedc
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5424: Add the IMEM node

This commit adds the IMEM node to the device tree for the IPQ5424 SoC to
extract debugging information. It defines the IMEM region as 112KB, noting
that only the first 4KB is accessible by all masters.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5424.dtsi
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
[ ... ]
> +		sram@8600000 {
> +			compatible =3D "qcom,ipq5424-imem", "mmio-sram";
> +			reg =3D <0 0x08600000 0 0x1c000>;
> +			ranges =3D <0 0 0x08600000 0x1c000>;

Could mapping the full 112KB region cause XPU violations?

The commit message notes that only the initial 4KB is accessible by all
masters in the SoC. Since this node uses the mmio-sram compatible, the
generic SRAM driver will map the entire 0x1c000 region and add the
unreserved portion to a gen_pool for dynamic allocation.

If a driver requests memory from this pool, could it receive an address
within the restricted region and trigger an SError upon access?

Additionally, is there a risk of speculative execution or memory debugging
tools accessing the restricted region and causing a kernel panic?

Should the reg and ranges sizes be limited strictly to the safely
accessible 4KB (0x1000) region?

> +
> +			no-memory-wc;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-wdt_reset_=
reason-v10-0-cebda08ab1ef@oss.qualcomm.com?part=3D2
