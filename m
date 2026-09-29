Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CF48E0DA
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651813; cv=none; b=ZNM0zlpre5522HrNVIlE0imaIdv50dnwxuyJLq6MTfNRpqTNYwEGqbQUg845WZZKi6dhXULUVjfxY84sJnMxRekXPE3tHM9kHjSaYN0YoaQXtqtdaG9FSD4M7veccMm09av5L6zbiGKXG+rujUHMAifGCgK1ps7VDi5PN8q3et4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651813; c=relaxed/simple;
	bh=SMSlTvSfXsy7s2d42zjhC6dYFOHT1FwtijTttihVBvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o62ntV2Qcvd/MuZYpgooFe97wMp03U3cFDEuQawPcRCFhAc8lRT4+33uy7yJCgZCwuqdYEsMPq3LX52Kx2Oyt3Te24PPIl5F+Vj0dm5IAnHVC1msKdzpBOYIjUotlZ3oVyKGHQiCZsgfTMboWENCTDcGjqJqGZxDq0hsM/whiRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxFjHwUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxFjHwUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE801F00898;
	Tue, 29 Sep 2026 03:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651804;
	bh=FFjMF3IL4gkDdXpBrxJElIN668kDsMWSTDQeqYtg0B8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FxFjHwUA8rdbaI1FO21FAWsFlg7akAiMvSW9GBMKJtCjU9KFlOXDCU1O/Y5vVoi5b
	 s8zT3YbfUUePEZ8GQxdMyoVdCb0A3oHRJOY1SgYjHzZIyhfIaicPHW9LGxyh+HdOFN
	 jKleHb+gSc+YZogvERkfWGoXdjSgk8++YTRLFVgywUXZhps80p5AZF8utI79ZThdwj
	 aY7zg68GIG8XorUhiCD4XhME1Fva2ijtazsvd5sEF4J9dgasJOfooowbcp1l4vWZE+
	 HlOBEH1g9PbnCgHQe+htlDwtcmy6QnlyRh7AhEFEDWuIGFdhXkuRjdqXD9vEkb5Dvd
	 S5FvfXXeiYJLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:16:43 +0000
Message-Id: <20260929031643.DAE801F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: exynos850: undefined phandles ap2apm_mailbox and apm_sram
--

commit 66e41f222fe556cc663cc05ae12d7a66bb68f527
Author: Alexey Klimov <alexey.klimov@linaro.org>

arm64: dts: exynos850: Add ACPM firmware node

Add the ACPM firmware node with cpucl0 and cpucl1 clocks. This provides an
interface for client drivers to use features exposed by the APM
co-processor.

> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f5..199f96f9daa2e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi

[ ... ]

> @@ -170,6 +171,18 @@ timer {
>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
> =20
> +	firmware {
> +		acpm_ipc: power-management {
> +			compatible =3D "samsung,exynos850-acpm-ipc";
> +			mboxes =3D <&ap2apm_mailbox>;
> +			shmem =3D <&apm_sram>;

[Severity: Low]
Are the ap2apm_mailbox and apm_sram node labels defined in this tree?

In the acpm_ipc node of exynos850.dtsi, a search across the file and its
board files doesn't show definitions for these labels. Referencing them
causes a dtc build regression with a phandle_references error.

Are these definitions missing from the patch?

> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
> +			clock-names =3D "cpucl0", "cpucl1";
> +			#clock-cells =3D <1>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-exynos850-=
acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org?part=3D1
