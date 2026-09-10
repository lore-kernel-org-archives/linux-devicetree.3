Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7A3BCD2C
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044059; cv=none; b=PIUF42MvpfOhrX7eNjDnKcovmc02ayx0VjS0NGwZrS6Gs53y2ta3gmqpwc7Nke1EdtmRBU/tdow4GTZAt2/xj8uVUG6ef/7ypeQAJFpEBt6vlrZpMLZ6W2TasDONaf0+cIhaMCfsXtPNuqHmy5n4+3jQ85qUoqIC+z05ueyf4kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044059; c=relaxed/simple;
	bh=QC4oJfZyc1t2idVQqggHtEsbVf+ZZEQyRKmrKemYCNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jiaG6NuxMTDrO5Rn3UvSvyMep4aEGXkR78hQgrEaJ4dCAtX6MYa5Hhvmcv62r1ZKFpYnnOrPgjNfY9maoTNsxAiz/Wc6FC2brr3pCznQMfondNkxW0EftWN6DiPWpnpBL4Edr6vKXIkpKBYllgHf4pv+fhpW3i7SdrJz+Igf200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNIQqNp/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNIQqNp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0481F000FF;
	Thu, 10 Sep 2026 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789044057;
	bh=oX62sUMTLhau2OaqnrWVB4F0vrhdyICm1f48AVkYt20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kNIQqNp/dDT7GJUpcr3bsYeoYFqI1R0C3sk8YJnWLjnyjnddJfkkNa4j7MaIgKiWh
	 R+wPzbn9L1kgX+2XSGqEpPsUtSq7dAzb3moKecXI6u55sqYLhkEnBqurEldpsv9wLb
	 j+JkCpwQuexI0AP0PoCCXIneooHG071D0Ry4F5kvfgoT3HGE3/KZbewG27zXYftGPV
	 FdlXd7zxtJuDL4U8Spgg7Ln1G++2EgpMcXTxDILAnCiatIGepxPmWMwNXDFuR6fTIF
	 t5hYOAX6GZmpKUnwCY/yXVNbW91em0nFuKHXtpiQqX1WitupqimApBfBff2OpdR9NI
	 SQhgfSf7b7Phw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 3/3] arm64: dts: qcom: sm7125-samsung: add
 initial device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-sm7125-samsung-v3-3-c467bea0fb9c@gmail.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
 <20260910-sm7125-samsung-v3-3-c467bea0fb9c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 12:40:56 +0000
Message-Id: <20260910124057.6E0481F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `rmtfs_mem` and `framebuffer` nodes violate unit address conven=
tions, causing dtc compiler warnings.
--

commit f4aab33141cc83eeb5caf4d1bd15dc706240103e
Author: Erikas Bitovtas <xerikasxx@gmail.com>

arm64: dts: qcom: sm7125-samsung: add initial device tree

Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
in 2021. Add initial device tree for SM7125 Samsung platform with
support for various peripherals.

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm6=
4/boot/dts/qcom/sm7125-samsung-a52q.dts
> index 0000000000000..ecba5be8164ea
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
[ ... ]
> +&rmtfs_mem {
> +	reg =3D <0x0 0xf4f00000 0x0 0x202000>;
> +};

[Severity: Low]
Does this reg assignment cause a dtc compiler warning? The reg property is
assigned here without updating the node name to include the unit address
@f4f00000.

> diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> index 0000000000000..b8863e111bc4f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
[ ... ]
> +		ranges;
> +
> +		framebuffer@9c000000 {
> +			compatible =3D "simple-framebuffer";
> +			memory-region =3D <&cont_splash_mem>;

[Severity: Low]
Should this node name have a unit address? The unit address @9c000000 is
present in the node name without a corresponding reg property, which usually
triggers a unit_address_vs_reg warning from the device tree compiler.

> +			width =3D <1080>;
[ ... ]
> +		pstore_mem: ramoops@b4600000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0x0 0xb4600000 0x0 0x100000>;
> +			record-size =3D <0x40000>;
> +			console-size =3D <0x40000>;
> +			ftrace-size =3D <0x40000>;
> +			pmsg-size =3D <0x40000>;
> +		};
> +
> +		rmtfs_mem: memory {
> +			compatible =3D "qcom,rmtfs-mem";
> +			qcom,use-guard-pages;

[Severity: Low]
Should this node name include a unit address? This node is defined here as
memory without a unit address, but it receives a reg property in the
board-specific DTS files. This typically generates a unit_address_vs_reg dtc
warning during the build.

> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-sm7125-sam=
sung-v3-0-c467bea0fb9c@gmail.com?part=3D3
