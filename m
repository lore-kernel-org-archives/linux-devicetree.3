Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E462192FA
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148399; cv=none; b=ONaeVkKHSxLazTbG3Fd4vmbYGPaIYhud1PYd8wRzG6rjd5iIicM1fbb5xZkWtZK5v1p2L/0rWmrRXZ6Ldqff6+807HOMlxXdlW5aTGbGjfJkO0cK3h6PoRs7QJyH3RCwZe6Az8OkEpAXovgj+ITBRwjnjTeYBWemuJM5aou2JhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148399; c=relaxed/simple;
	bh=deU4HWSdANAOgvcmrvh/SZGqdR6SuV/fUaYM8ktru6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JmeMwD3skgfH4v6GtTa13Ja9v/YMTMeASN+fmw0hdHKeTFdXi6CdFT7yHVwj4OzAiEbUK6H5Xa+5gSvb4TbAddeXGDr5SGEEAe8hilD5PAMzQvqzq5iH2KSQaSt0WiShzdAfG5T/iFuh3bvKUEpKQngxih1zAcN4yeNzSu+Aq54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dg7no7Ok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dg7no7Ok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22FA1F000E9;
	Wed, 19 Aug 2026 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787148398;
	bh=CGvwEKyC8FgYUMxWcdWt8Q8c5gvZYXj0LryEi4L0QlQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dg7no7OkHoXJPAuz/80/PMn9SL3LogDfAHin1NdDN6YptIY7qRuIE6dKEWosNmnQC
	 AsN6Zk0zT3z9NRPT2r6WZuYX6nohPWo4gPAM7CLlqPC/Ygq1KY7z4A0F+2lvaL1DB1
	 RSuakVhEhCnLfSmR4VD8BRNHbkqLbHTmAU24MKwvis9/HlCxiDhR4CqPZIk/zxKH9N
	 VTcWL9q7Z1PVM1ZgspvyYy+y7dTsbsGcDYAFwpkhyvUMaIpoEyYG2qOvCjSWDkJPMA
	 RwU2nEm2sc5YVsm+9iCRdTpTdisAy7Dc2VdVnNQ8ta3v87oVZP9Us8uRO6mVH6+Pth
	 M5VwR+ltx0Qxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-1-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
 <20260819-b4-monaco-evk-m2-v1-v3-1-988145ef65cd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 14:06:37 +0000
Message-Id: <20260819140637.D22FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch provid=
es an incomplete fix. It adds `compatible =3D "pciclass,0604";` to `pciepor=
t0` to enable PCI-to-PCI bridge matching, but fails to apply the same requi=
red fix to the identical `pcieport1` node in the same file.
--

--- Patch [1]: [PATCH v3 1/4] arm64: dts: qcom: monaco: Add compatible to t=
he PCIe Root Port ---
commit aa27523e9b0a54b6db3c28da2c6526d7f13eeef7
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port

This patch adds the "pciclass,0604" compatible string to the pcieport0 node
in monaco.dtsi. This enables the PCI subsystem to properly associate the DT
node with the PCI-to-PCI bridge device, allowing downstream DT nodes to be
matched.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index e4c8466f941bd..44526f4d85870 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2413,6 +2413,7 @@ opp-32000000 {
>  			};
> =20
>  			pcieport0: pcie@0 {
> +				compatible =3D "pciclass,0604";
>  				device_type =3D "pci";
>  				reg =3D <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range =3D <0x01 0xff>;

[Severity: High]
This isn't a bug introduced by this patch, but does this provide an incompl=
ete
fix?

Looking further down in arch/arm64/boot/dts/qcom/monaco.dtsi, there is a
second PCIe Root Port that is missing this compatible string:

			pcieport1: pcie@0 {
				device_type =3D "pci";
				reg =3D <0x0 0x0 0x0 0x0 0x0>;
				bus-range =3D <0x01 0xff>;
				...

Without the "pciclass,0604" property here, the PCI subsystem cannot associa=
te
the DT node for pcieport1 with the physical PCI-to-PCI bridge device. This
prevents downstream endpoints from being assigned their respective of_node,
breaking the binding of PCI power control drivers (e.g., pci-pwrctrl-pwrseq)
and leaving the devices unusable.

Should this compatible string be added to pcieport1 as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-b4-monaco-=
evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com?part=3D1
