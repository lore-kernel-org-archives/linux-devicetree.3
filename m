Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0CF1F418F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287596; cv=none; b=EcVlvak1+bDsY6sXam+CkjRHvETG23kepYiiAB1CN2vyZdpxs33quCoh08IorotZu+kkoGNHD1OfrTm5N/E0fpyxoZARB+yD8E5/NDG1cVjdJ+lYKUXV6/o5v+Tcm9JgT2HW0HCAktC9XSIL+TPLMtOTMoe5aDtPrdKa7YR6KAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287596; c=relaxed/simple;
	bh=AHH7Kg/exNi2PhaTWUXTrrFYAREHAusvBiV7SvefBBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ODm80rSLtxUCdldjMgtR8EL+20RNWTOj+0z352vdA0MSAEtzLJd1lT4Y2iYNe2NSGg7Jxi+TudY6wMFPKy6t0p3IkJTgvVwSwMWCNTVeyJ999mMHw+NlDFdE3p7jhLXWi6ISMockEZLK+SJe/2rRPmb6q6x7ZWjyuzAyYw0nUKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0VZ4dhZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0VZ4dhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3B81F000E9;
	Wed, 29 Jul 2026 01:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785287595;
	bh=RkH9Y2M/dX+4HY7BIOgA+LYqLvbwSySyvdgNCGHwZVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m0VZ4dhZ4eA19qwxl3RaO9vGqxF5NUeURJsaDNTULbOllDTx29A2FXJZNIuyzu4hH
	 40G23U6cp5O5VZosNutyTRnSWSSmVtIEe0F6A5fYF6v7Lb+qTOa6E6q9owOs2K459Y
	 Vqk/cXvRXGZjYgohOcrqyYEYJuCA+c7WPwpz4XaE4Pk12D00jcWDpVCK4ugoISxonW
	 ngQLMLq7NDnQPebNDKNoxbn3aLPhEO8uoIvbr5GFhptU84vwLCMHafoUORQJr0lap8
	 GaM33EurbQ+HMsns7MkWJgFdFfyo3MfTO2uZq4IaULDxyPKLu9u3peAf0KfkydHGTU
	 rb5bhzHawFUxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: Add device tree for Nord RRD
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729010022.875799-7-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
 <20260729010022.875799-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:13:14 +0000
Message-Id: <20260729011314.ED3B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The comment for PMIC A describes it as 'PMM8650AU' but the compatib=
le string used is 'qcom,pmm8654au-rpmh-regulators'.
--

--- Patch [6]: [PATCH v8 6/6] arm64: dts: qcom: Add device tree for Nord RR=
D board ---
commit 563913f28894928090f9bd89b1b6b23bd7792224
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord RRD board

Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
Reference Design) board, which is built on Nord Embedded variant. Enable
the debug UART, UFS storage, PMICs, I2C and SPI.

> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/=
qcom/nord-rrd.dts
> new file mode 100644
> index 0000000000000..a2a19f2304fa1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts

[ ... ]

> +&apps_rsc {
> +	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
> +	regulators-0 {
> +		compatible =3D "qcom,pmm8654au-rpmh-regulators";

[Severity: Low]
This isn't a bug, but there is a mismatch between the comment and the
compatible string here. The comment describes the PMIC as PMM8650AU, but
the compatible string is for pmm8654au. Could you clarify which one is
accurate for this hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729010022.8757=
99-1-shengchao.guo@oss.qualcomm.com?part=3D6
