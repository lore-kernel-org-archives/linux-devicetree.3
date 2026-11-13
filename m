Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574672;
	b=fahG20dnPyQ/v9P3ln3pbleSer9/qmat2fNF84mk+MXj3DB4bvcGeh+tSV8CSz9DbywS
	 rBkAG4PoWj1KVaW1U5g9/aYn3c2jIfMHwjQO7Jzv7zwy4kwQxEX6WHBi0J8LflVbUy/jY
	 nFRtLfykoCo2oaEeFLsUnVowBQXXBEE6TtzkiKJ56JbEoLLGXLMG2PFAMYRnMXJLQlMeo
	 DoyGho9x32ryim1yJBoyyOtNVRNwDWCOH9yarx6UzTYX9giPkAEb5vh50NaB2T7Etyz3e
	 6xuFT4og5P+WM6lacgY8R28bTZVkw3ZeeeaUfF+Zx28g0xUgnzRnZbPEOCmZFeMPoRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wYV6EPu+BtQXXXBnsFf6lz0B5JrC7OOFXKzeGP67YE0=;
	b=mf/17SeebkCFpXsZWRPUlNIKevOSOMFli2goMCTv1f4oxbEQrACC53Mr5jsbFg7Ph1VC
	 +/3wqK/lCJ/J6vt3IcU1j4tYPAVFIa6rilMmuaxezMZcrmLfmra24a38eTJcErGe9CQ7c
	 Vv9OT5khGihnhe8CS0F5mbbxaCV9x3kqdk5QlS7fPljYfVW7srzwVHzc6Pqgtz/cT2UcF
	 Q9fMKJtaGda0BlB9Q6esPFsH6ixM0Xr1lrm+RTSTLxY4ch6dd+478pGzx4X/hCVeMcoPC
	 BUNyl8+lGvB70sw1yPl0jw/t+y2oBBx7MKog+oNzjcN5+fFipdTXV4yhi8k6e5PvQPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OsfcJp/2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806BE606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsfcJp/2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EB91F000C4;
	Fri, 13 Nov 2026 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794574672;
	bh=wYV6EPu+BtQXXXBnsFf6lz0B5JrC7OOFXKzeGP67YE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OsfcJp/2vE0YoWP+8rf3bIcvB8BlvSPoCYeRXWedhtrLLXkvNv8FpvZDEzeOCkcAa
	 mV8D+iOiDv1PBSdNFBNWxe7zLj6KzWll1bTINXsJxCsCOmkS+W3QxaDTR/jtAQvtiw
	 HAt368GZlpoHEK9K27y/linh54qGgL/Jw5uQ2Y7pFLi6wciUmo//SXcCeQRoxQw/0C
	 tbP4poWK43J2WK/BTFTAPZ8luebgV9oUtZpgNyyOPaULP+c9UavszdkHk8fKqKgugO
	 R2hsZAzc+Du5iYqJsmyyBM/BaL2vzzRZSox9XtU/CSpEHdpjv+dh/5RAIzssTBC1yu
	 52JNHGBI2zUuw==
Message-ID: <sashiko-outbox-212800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: zynqmp: Disable DP for Kria SOM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJ?=
 =?utf-8?b?Q0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <ef31d389e963485d19ea5837d442ab0b1ac39b6a.1794574131.git.michal.simek@amd.com>
References: <ef31d389e963485d19ea5837d442ab0b1ac39b6a.1794574131.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 12:57:51 +0000
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
- [Low] arm64: dts: xilinx: missing Fixes trailer for Kria SOM DP
  disablement
--

commit e2f41fe54ad1036405ec0ba6b0b3df56fe2caed9
Author: Michal Simek <michal.simek@amd.com>

> arm64: zynqmp: Disable DP for Kria SOM
>
> DP is enabled via DT overlays and there is no need to have it enabled for
> SOM only. Schema validation also reports that phys/phy-names are required
> property which is not valid for SOM only DTs.
>
> Signed-off-by: Michal Simek <michal.simek@amd.com>

[Severity: Low]
Since enabling zynqmp_dpsub in the base SOM DT without phys or phy-names
broke schema validation and caused zynqmp_dp_phy_probe() to fail on
SOM-only DTBs, should this include:

  Fixes: e05d2f969cb5 ("arm64: zynqmp: Add dmas, dp, rtc, watchdogs and opp=
 nodes for SOM")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/ef31d389e963485d19e=
a5837d442ab0b1ac39b6a.1794574131.git.michal.simek@amd.com?part=3D1
