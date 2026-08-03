Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0713B2FFE
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748805; cv=none; b=ZySA/8xlxulDR/FRX1UIDmmYMtXDuJeygWhuRKpVz/3tvNaf4stojyYvTWHgTd3gR02dB9eGDEy7D4b5WwV8vY4G0Q+gPHF8JZpcqpoIweWSKb/qjn+oOpbkXD6LsDvR3qd8XnEIfEFQT9JhvPmCfFJ4KzwcY3j3oSmIDTKB38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748805; c=relaxed/simple;
	bh=tkNn6xPjwUIo5iC/Ob4SC6y4rSzDmGa/jk/kQbImPT4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k2nkZ+owB9Q8tK+NNxjAoJLNnX4iwWQmvx3xq3tC7DWtaVBcrCbm/4/4ildxdMSvXTeTbptf9ozzxuafJtpTVx2FnB87FbneZTKh3haRp5UMePoAZJ32avQnveMNLZyeFtI6kaL/Vs9njW6hoQTc/pxEhoPA0ZBFArkYbuLhSxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyxA9Lee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyxA9Lee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C771F000E9;
	Mon,  3 Aug 2026 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748804;
	bh=lkwCLdMWZZD1S4QvHw/i3O8c15UseU2VUD+Oqpi5ckk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eyxA9LeeoqAP9LcPnPb5iOQoTfJCUMSWBEXbVVTWAmmbqJXjgf17++H4DMnQY2qti
	 PXlqz367imLDFKiqgXgudJ8AFaKQfkcQeatd9rPHCu+LXl65Ww2ZM0U6XWWB5YQq+h
	 y42ZrPFnwZjXecTTk2NcTA91MmnE7wX/qxoYukKT1g+sFCRMX+oZUjLAsmHz1UVh1o
	 2rG/91AkISFO069LhCN6q38/dyeDwUsplmB6Bmbhc4g4rMZMqvffHJ+VYZesBgH76c
	 ZQ58a03pS6FcYgRkpVGcRqNUp4Wit7aK3fQr986u194px47x+ZnUasUarDxAEc63uZ
	 91xew03UlWwZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] dtc: dt-check-style: Handle sorting of
 top-level nodes and properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-4-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-4-6c9776928cea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:20:03 +0000
Message-Id: <20260803092003.D6C771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Spurious expected error line in a test output file will cause th=
e selftest suite to fail.
--

--- Patch [4]: [PATCH v3 04/11] dtc: dt-check-style: Handle sorting of top-=
level nodes and properties ---
commit e2a1efff1b6b0ed83316a48d24047cc58103d45d
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Handle sorting of top-level nodes and properties

This patch updates dt-check-style to handle special sorting rules for
top-level nodes and properties. It modifies the tool to sort root-level
nodes by name rather than unit address, and requires the 'model' property
to precede 'compatible' at the root level. Test fixtures and expected
outputs are updated accordingly.

> diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dt=
s.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
> index 4bc21328625f9..29283f3451c78 100644
> --- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
> +++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
> @@ -1,6 +1,9 @@
>  # mode=3Dstrict
> -bad/dts-property-order.dts:15: [property-order] property 'compatible' ou=
t of canonical order (should sort before 'reg')
> -bad/dts-property-order.dts:16: [property-order] property 'device_type' o=
ut of canonical order (should sort before 'compatible')
> -bad/dts-property-order.dts:25: [property-order] property 'dma-coherent' =
out of canonical order (should sort before 'status')
> -bad/dts-property-order.dts:30: [property-order] property 'compatible' ou=
t of canonical order (should sort before 'ranges')
> -bad/dts-property-order.dts:40: [property-order] property 'compatible' ou=
t of canonical order (should sort before 'interrupts')
> +bad/dts-property-order.dts:8: [redundant-whitespace] extra whitespace be=
fore {

[Severity: Medium]
Will this cause the selftest suite to fail unconditionally?

The expected output file now looks for a [redundant-whitespace] error, but
the dt-check-style script does not appear to implement a redundant-whitespa=
ce
rule or emit this string.=20

Since the test runner requires an exact match between the tool's output and=
=20
this expected text file, does this spurious expected line break the test=20
suite?

> +bad/dts-property-order.dts:10: [property-order] property 'model' out of =
canonical order (should sort before 'compatible')
> +bad/dts-property-order.dts:12: [property-order] property 'chassis-type' =
out of canonical order (should sort before 'qcom,board-id')
> +bad/dts-property-order.dts:20: [property-order] property 'compatible' ou=
t of canonical order (should sort before 'reg')

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-n-dts-styl=
e-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com?part=3D4
