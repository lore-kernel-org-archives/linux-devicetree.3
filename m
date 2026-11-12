Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473800;
	b=v7bYf6idCpDbZruyqKB7+S+FGDol1JpgXwD80sFRZjK3Gwluh0KBmiLADwPbXkGP+hrq
	 DDt/oI1qTRq0ZeZayhrA505pwHZHRB3ZAGa36vIIQPySKGHadypdd18s63In3m9XYHSqL
	 vn3IZ3aJ+RTCGGm3j0B8hF+uFpcUR1L15msrKtQY5UMLPgSMFK7LXmqB5e8qCC2Uz54qk
	 GeLS2xztjnXSBj3pCVC6igYhW4lzQZeHmdjVoYPOCjQW1jAKHTmaTmyTwko5XN9y1J6CI
	 GVru1BgXVfczQ8JC3d79DD7a93uybYeXGTnpWQm96yBA/52FPzSY+/i3QE1yME7YF/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473800;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AWNKIIb8b9V/6xL4uMiTEFuxM7xTOv/TgoGM30TGxss=;
	b=PxyNm9Q4H9JdEgt0dfY50ljj8fWF4JdryhCLoEYEMojaiitZv/myNiUIrnrNEGQB/ky4
	 u7tbOY2mqUb6ZwoSnyLzUK+k6zaxWb8vgc/Ac5ifnz6gBt+o/9jzVokAiadJi5qGKp591
	 I6zvLE21XalvR7/7O6BzfNBxIcE1wJxo0P4z6/cH3clHBGbh/aNdUQ6FJLsW4fltQ1bvC
	 qvqUwTCMofoRAEwtvOBMRapRGQBN5nnpZlBWE/Vt+Vc4fKpr1A1+4kz2RXFbdoV1slkxm
	 e57PmDvzLHxqUmJUGwY0a6+G1x+VBNijjF65hjQhmbjje/R0p2+URFwB1qNbsBh3ZyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Catp+HSL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB086606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Catp+HSL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CEA1F00A06;
	Thu, 12 Nov 2026 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473800;
	bh=AWNKIIb8b9V/6xL4uMiTEFuxM7xTOv/TgoGM30TGxss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Catp+HSLDGgqTej5G5xo2A2HaOtKrS3tp8epv+1yNkXgNJKT2uEuoQOA9Eu3SAcnI
	 qPshzoyWmWma8V7q9DQRNyEzf1iY5MbFNKJboTLUSS0oS9YVz459w36Pa9aXxmqpRd
	 mfeAjuGSsVLbvf9r/20tFBizfp7LaecOAgmnFCWacU8xwcegkgGPAfWKVOP/T5ngPN
	 i4Rx+PEXfYqRSQ2Yq0nvwDG9DcjdM2BRUY4wPDGrSO6iA14gGOBsB2GZY57trhhLlX
	 BfZ9rKYkoEPNVaOINRpbjE8O0IRP3OWx34yHlEPl+Rrh/ZCfwgivDmVs1Zfdq5H6oQ
	 +saVmgXYTn5OA==
Message-ID: <sashiko-outbox-210803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: versal: dts: Add PCIe reset IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJ?=
 =?utf-8?b?Q0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <b06d55abdb0671d9dc987057f44c989317e19680.1794473022.git.michal.simek@amd.com>
References: <b06d55abdb0671d9dc987057f44c989317e19680.1794473022.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:56:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: versal: dts: macro name mismatch between commit log and
  header
--

commit a1880b29ae774d1de118295c96e2eedcfea5ec9e
Author: Sandeep Reddy Ghanapuram <sandeep.reddy-ghanapuram@amd.com>

arm64: versal: dts: Add PCIe reset IDs

This commit adds the XAPE0 and XAPE1 reset ID definitions for CPM6 PCIe
controllers to the Versal reset header.

> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h b/arch/arm64=
/boot/dts/xilinx/xlnx-versal-resets.h
> index fe00f4a0ba65b..f8189d1cbc129 100644
> --- a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> @@ -102,5 +102,7 @@
>  #define VERSAL_RST_XRAM				(0xc30c05dU)
>  #define VERSAL_RST_AIE_ARRAY			(0xc10405eU)
>  #define VERSAL_RST_AIE_SHIM			(0xc10405fU)
> +#define VERSAL_RST_XAPE0			(0xc410115U)
> +#define VERSAL_RST_XAPE1			(0xc410116U)

[Severity: Low]
This isn't a bug, but the commit message says this adds VERSAL_RST_XAPE_0
and VERSAL_RST_XAPE_1, whereas the macros defined here omit the
underscore before the index (VERSAL_RST_XAPE0 and VERSAL_RST_XAPE1).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/b06d55abdb0671d9dc9=
87057f44c989317e19680.1794473022.git.michal.simek@amd.com?part=3D1
