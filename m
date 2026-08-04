Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501037FF46
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846276; cv=none; b=oaWy+ojZMJzazYO0VZ2t/jMFrJsUM6sn1BCu7Ys7boW6nnXRaallh4TVEPIcbKMHPCOxsv2P0JBNPr2kqk/XCcaGPaUm5Ewbxj/gUjyvYnhe4Mb9J6NwNMR26xvVAcraARO6ylWTdUXB7ILAC/cKKxg0XgCr8uwwQmHscAPP8Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846276; c=relaxed/simple;
	bh=sJejo/cNs0LEv0zkK8BSYi7JSapDjs7bJGkEAaKqXJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tAhIFJaGTAQ6Tn8Mr0GDY/sVtn1WOWhoHvtM8GfEGHK64+B5772pLR4VdtOjsoMFQ9skGv8qdViyyFRAD+2euXUzSPx4ur50OY0vM+1/OKIKm4JwpPMsF/64LBDr2tamEKpwxhJMNKVPyCn2RO2BDVWoFGjxDU6TGLNWYDlimSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rxm7KV6W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rxm7KV6W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CAD1F000E9;
	Tue,  4 Aug 2026 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785846275;
	bh=ns1roXYLV6myD2v3TK3WDZ5rG9tqE0zO5Iwow45XeEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rxm7KV6WX3uzfi/qnLuM5TvATB9J4e9i8lVLpYRIiQLWD3v1p1FwRXJfsu1isR2+J
	 PV0ueYJUW5bfBhMW13Be3lQPjH3/jp+RR52MESXpDn3IqMKxKO3YD5kE+Eb9IcW4Yp
	 wTr26Fz7SXOrxSvi7AJNzYwj5YD/BVzgok4mQW4pAB+t4evAThfJnX6iA1kmyY/Mcj
	 cDnVJsnDnLcwUf9uRd6NOPSRU7crVr0PLowIuvWM7u764/DcK1lKC3jpzotWL3PO3I
	 /vv7wGapo0KPcDltCo4928RH7KU0lBDB61xyfh2oPCcTHIhoI7jd0D4fR4RxLTHTb6
	 /CRUJPR3925aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/17] nvmem: microchip-otpc: nvmem: add emulation
 mode and OTP access validation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804113338.261782-11-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-11-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:24:34 +0000
Message-Id: <20260804122434.B3CAD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing locking in NVMEM read operations.
--

--- Patch [10]: [PATCH v5 10/17] nvmem: microchip-otpc: nvmem: add emulatio=
n mode and OTP access validation ---
commit ff3ee8b6ff65c931c28481b3cf9aabc752c44762
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: microchip-otpc: nvmem: add emulation mode and OTP access validation

This commit adds validation of OTP memory accessibility and emulation mode
status during driver probe. It allows access to other packets when the boot
packet is not configured, and logs an informational message if neither is
available to assist with debugging.

> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otp=
c.c
> index a17f82afdc37d..6b0184423463e 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -18,6 +18,7 @@
>  #define MCHP_OTPC_CR_READ		BIT(6)
>  #define MCHP_OTPC_MR			(0x4)
>  #define MCHP_OTPC_MR_ADDR		GENMASK(31, 16)
> +#define MCHP_OTPC_MR_EMUL		BIT(7)

[Severity: High]
This is a pre-existing issue, but does mchp_otpc_read() need serialization
to prevent concurrent hardware accesses from corrupting the read address?

Since this sysfs nvmem attribute defaults to world-readable, multiple
unprivileged userspace processes can read from the device concurrently.

If they do, they can race in mchp_otpc_prepare_read() when modifying the
Memory Register and Control Register:

mchp_otpc_read() {
        ...
        ret =3D mchp_otpc_prepare_read(otpc, offset);
        ...
}

mchp_otpc_prepare_read() {
        ...
        /* Set address. */
        tmp =3D readl_relaxed(otpc->base + MCHP_OTPC_MR);
        tmp &=3D ~MCHP_OTPC_MR_ADDR;
        tmp |=3D FIELD_PREP(MCHP_OTPC_MR_ADDR, offset);
        writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR);
        ...
}

Could concurrent reads overwrite each other's requested addresses, leading
to incorrect OTP data being read or stalling the controller?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D10
