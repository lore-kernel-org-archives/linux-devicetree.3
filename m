Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65973B71D2
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082490; cv=none; b=r4ajR4O9PStCSktDDePA+4sI9UQFKO/stp+1WnWfWnu2HM3pL8+fiK/je79DX7k83d1o1hLC87gjjHNRj4HWafBP7bhfgmnSjr1S9C+11Vrz4LJ0tVdSEXXIJ0n3PlbpnfADqGxkPbfa/p1cIGcsQMG0V2acilsB5V/XBF6mRuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082490; c=relaxed/simple;
	bh=hgeFRLJJRxqaEwyBORYbDqOtfdG0HHBWJITRiEsCAug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ny32Dfz21zAQ1K83SpKC4HAKLy3fPqnDaGH4eCHuzLJt8iCrrhBTkMDucHj3up0WeScEDh6pnZDmDIl3EF0o1vHP8oSeWPoX6HxobjYid79y8MuCwwdFdesL/GwfmJuronIJ82aoDNJOP69xxMf1rWTNMx7NPOm1uyHgz/q0xp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFTTZvST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFTTZvST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CBC1F000E9;
	Fri,  3 Jul 2026 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783082489;
	bh=1tOmilb6pjgumSodoHiiEHp+NcTPTIKHlB3XKJuWzm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kFTTZvSTmScLNFpeUihbmO8LMPpRlx39Y+k6CzlO5jvZWLtWmtedH23+W94bI0V3U
	 S/iMIg6jsICm3NnsiPVzEuv214v9cY2auGQzg+Db0P4jSo1pql/GpVL05Dj/HMImsk
	 r2JLiZ0cz+NTCtws3fxiwPXuXIghTQFw6tYzbWsJWBNLmNUzHt7/VYQHKYWEXIuKN5
	 bl57IEOiupdBZL82Eaz1PDHoQv1EJIx83u4rHQ8TqDk8TJnbnYMrnFvZt0UP51lv/e
	 knK3LVfhJ88tqmeO0baP8J8j0HZMG0zKLI58IefL8zun+0bpx3yF1phXt9U0H2n9/e
	 2OPV4OsI9NyEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ananthu C V" <ananthu.cv@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 12:41:28 +0000
Message-Id: <20260703124129.57CBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing fallback compatible string for qcom,glymur-soccp-pas.
--

commit 13add5a1ca37328da1883f3c5d77042558d05a52
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

arm64: dts: qcom: add SoCCP DT node for Glymur
   =20
The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
This commit adds the PAS loader for SoCCP on the Glymur DT.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 5f44f68efde27..bc259dfbaf0e5 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[ ... ]

> @@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
> =20
> +		remoteproc_soccp: remoteproc@d00000 {
> +			compatible =3D "qcom,glymur-soccp-pas";
[Severity: Low]
Should this compatible string include the "qcom,kaanapali-soccp-pas" fallba=
ck?

Without the fallback string mandated by the device tree bindings schema, th=
is
might cause dtbs_check validation warnings or failures during the build.

> +			reg =3D <0x0 0x00d00000 0x0 0x200000>;
> +
> +			interrupts-extended =3D <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-glymur-soc=
cp-v4-0-b706c4c9b3e2@oss.qualcomm.com?part=3D3
