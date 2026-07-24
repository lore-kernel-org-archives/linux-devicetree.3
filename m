Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1042046B
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888700; cv=none; b=chp+aey9DQF8hT6W87wlpTM6v+rYCmE99M52azUXDsmWKZs/DdKOIurfub7cNXWzbKN1thnJ5mbkUehwtTIOQR1wzKBURDF51ONn45IdlYupNEeOfHZaPRiMsMc94cTpFfPon+oEQFmJ5+LqGZCuTi4lx/6N5ec1MIDRT37WG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888700; c=relaxed/simple;
	bh=0t46aqpO9R0CB/WPTzmkuVXXZABvCy5rxpmFRsyOVeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aFeJFgAZYjWRVUOKbH79pN4Mbv050vFREJdW0k6VyNjymNm74NNidDwnhSkC/55oqp1IuYxtC6EUFFSgrHvDxDTG5FHFEKcVWfuN31ApIbiLsLgG24ZMA4N/h7ODW7HiFoArJewmNc//iqr5BEaGzXRLjXL8REa0S52FzHmEr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nReata2B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nReata2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491DA1F00A3A;
	Fri, 24 Jul 2026 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784888698;
	bh=A0e+G9FQ0VoIH9lXsojl5b4XJjcZbajz10nr0fB04O4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nReata2Bb5VIqzDhsydbhz1VncAxCiCBgHJvw7QI7Cd1jTvH8+z34b4BVdrwSsvyG
	 tUUnsImA+sEjrRtekTC8Ozzlvlzok0C8AWiiXlvfcR6zO2hhh3Wcz/BTc2ummR1N2Y
	 p0SkeeXAgxlBpAzfEwuRnJ3SQrx+rt3Jk+FPx6Hvi2VuIbeeVwiMQ42EtZt6RbTz3i
	 JVH5M5+BvNgf+ZRqhnok+mv5UbUPzxcWtHF0SjzfbcmlLKFxM4V+qtULn2x4cdW/G1
	 qO5iCwRTujaL3RBkno39v9Dn35ZKRtKE+Pmzk5JFq69tagU+1Bx53AXIDrHGv0/kLO
	 2ui43U8Ysx5Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504
 variant specific DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260724-08-dts-v4-3-65e61a1061f0@oss.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-3-65e61a1061f0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:24:57 +0000
Message-Id: <20260724102458.491DA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Identical root `compatible` strings are used for mutually exclusiv=
e hardware variants (eMMC and NAND).
--

--- Patch [3]: [PATCH v4 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 v=
ariant specific DT file ---
commit 6bfd22f82b1e8155e76a4f15f37a5a0034a061b0
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 variant specific DT file

Add two DT files, one for the default eMMC variant and one for the NAND
variant.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm6=
4/boot/dts/qcom/ipq5210-rdp504-nand.dts
> new file mode 100644
> index 0000000000000..1145fcf0a3025
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
[ ... ]
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
> +	compatible =3D "qcom,ipq5210-rdp504", "qcom,ipq5210";

[Severity: High]
Does this identical compatible string prevent the bootloader from predictab=
ly
selecting the correct DTB from a multi-DTB (e.g., FIT) image?

Since both the eMMC (in ipq5210-rdp504.dts) and NAND variants share the exa=
ct
same root compatible string, the bootloader cannot distinguish between them.

Could this lead to incorrect hardware initialization and boot failure,
especially since these variants multiplex mutually exclusive storage hardwa=
re
over the same pins? Should a variant-specific compatible like
"qcom,ipq5210-rdp504-nand" be used here?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-08-dts-v4-=
0-65e61a1061f0@oss.qualcomm.com?part=3D3
