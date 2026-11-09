Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227840;
	b=xoOuliOAxrMdlj15gX3D9rA5a7MLT9bX7Oc/QpdcI8wknrAsMM4RDfUZTdCVnNNofmoV
	 B7Kib0/PBvhhDxP3dTpxC9aB4DBNfzdFMvbohnMfFK01pJp6C9vPua9IITpBeZjhRPz6x
	 oXhYmCytc8XwW3jdsyc496YRZdpyBjOZN2kKcmatSQ1GJLHMpY4/vUiP+9CTKQVQpDBuL
	 +Jzyj9o5ESKs4s3M4UF5rR/Q4IxsqanzSrE/R+k7bLlxJKzjgOX8QM4cLcZH4s7dQLY4T
	 iwFp1uXj5mBrl8ZpubkQJVSwzWirX/fTMmcbZwFiaK/pfQTlTOU+7p9DU1/+98rig6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227840;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=K1CWsVs0IPjpIDw2JWkNBzEKlJiME1CRvTNW72z+Z5c=;
	b=QyBZH/aly2rekb6F6gjigbWF5Z7CteuCXFIO5PwUHbGsh057yNqOzMBR3eRxSsphmvrN
	 4Fh9kw/F1j3wne+YqL8FQuSSGJFAWZUQnHdlSmeQdLvaihP47eyixuSn4gQmtwI3qhAwO
	 r4g/0FebtlgxNRAscTAyOZIohiXgnCLVzy0fTiXzmhbgGtsaI/Akn+RX6Ao4HovGTX4w2
	 BGVc4WQzo07AZ0sHfHD6y0ym1Uva/u6nvxrMjkPLtZqu6mpwlF1PSGaIbJn/2Zr2C8PoR
	 6v5DKFSc+cZlrPlG0Ctos/nhHVJ9ru6MY3S6zfpjJT03CWLVY7FOjTFH3mBFv7/LgzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOiMeJ9N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14030606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOiMeJ9N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25E01F008A6;
	Mon,  9 Nov 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227839;
	bh=K1CWsVs0IPjpIDw2JWkNBzEKlJiME1CRvTNW72z+Z5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fOiMeJ9NpINJhEWER3W2ji4evJ5usAogUOq97fLlOhiW1j+cDan4XbqUlot3B7vHX
	 Rt7X2shSlbzgKF9d49yT1f7yei4HGUB+23soaXcR72xD2Zs+NM9PTTu0cKYNwbCReo
	 bMQU7fVS1Ae30A8xx+dGqhkRaPiCbcR5HwZBOGSLYxU9Vz41hLSY/yfrQMEHYWocUm
	 ue7LN27qUqdREMbW/BT5oFcHEzvM+k8dMdOz3qaQG2eXmvr1fWcjbYwnM34LkQAQGD
	 dSz17Mr8d9b3W49b9Nabyv9be9YsJorCvwnM6mvuVLLoxiKqrHKba2wumxYpfEhvjM
	 Mp4FWVHqTG/Fw==
Date: Mon, 9 Nov 2026 13:37:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <20261109-unbiased-fancy-bloodhound-a6504a@quoll>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-5-joel@jms.id.au>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109051050.105623-5-joel@jms.id.au>

On Mon, Nov 09, 2026 at 03:40:44PM +1030, Joel Stanley wrote:
> Document the RISC-V ACLINT mtimer and mtimecmp hardware, as described
> by the riscv-aclint specification, commit 4e570bfd3201f2 [2].
> 
> Multiple vendors are shipping silicon with the hardware as described
> by the specification, which was abandoned[1] as a standalone spec at
> v1.0-rc4.  As we have multiple instances of hardware that implement
> the spec, the widespread implementation of the spec is de facto
> ratification, providing a stationary target for the bindings to document
> and an exception to the policy of not accepting things that are
> pre-ratification.
> 
> [1] https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/107177435
> [2] https://github.com/riscvarchive/riscv-aclint/blob/4e570bfd3201f2c09e5afd290b5091526b0f099a/riscv-aclint.adoc
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>   - Rework commit message following discussion at LPC
>   - Add reg-names, rework description, fix example
> ---
>  MAINTAINERS                                   |  1 +
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..403875d5932e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24185,6 +24185,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
>  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> +F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
>  F:	drivers/clk/tenstorrent/
>  F:	drivers/reset/reset-tenstorrent-atlantis.c
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..e6f3d08d4f93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Advanced Core Local Interruptor (ACLINT) timer
> +
> +maintainers:
> +  - Joel Stanley <jms@oss.tenstorrent.com>
> +
> +description:
> +  The RISC-V ACLINT specification defines a set of memory mapped devices which
> +  provide timer functionality for each hart on a multi-hart RISC-V platform.
> +  The mtimer device has a single mtime register and one mtimecmp register per
> +  hart. The specification is at https://github.com/riscvarchive/riscv-aclint/
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tenstorrent,atlantis-aclint-mtimer
> +      - const: riscv,aclint-mtimer
> +
> +  reg:
> +    items:
> +      - description: mtime register
> +      - description: mtimecmp registers
> +
> +  reg-names:
> +    items:
> +      - const: mtime
> +      - const: mtimecmp
> +
> +  interrupts-extended:

Use interrupts. git grep gives basically zero results for such syntax in
the binding.

> +    minItems: 1
> +    maxItems: 4095

Best regards,
Krzysztof

