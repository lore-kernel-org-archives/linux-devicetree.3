Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296AA3BE178;
	Thu, 30 Jul 2026 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396632; cv=none; b=MCj5gbXg5zCkO+EJib69PgijipvRb2ZxE3K/K2i3AMv5jDDlWiMfjxKgoPkERh8e1AlsTVrirr4dYXz77XN2AY+o8Y+hP2alGs6FrpLURDsipkjGzaxnXILlOlzvn3sd6F/o12bqApfKLIkRyqC+OXfUpGuCfU5Ldl0UbM2uWPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396632; c=relaxed/simple;
	bh=u1pdGcgUWHR1QDRJ07s9QeoCIf/qMqeOQIqJvcRayBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=casneAye41H44AAeiTBbOiZ7fB+Zad9hV3ed3ZuG9xRGgGq3T6lW2t04SoavOx0SMFRw8d0v2H9x+ni/lO8dVn99a66YR4ACHPkd93R7vgP/LpibMTwEwq3O9Tj5yJUBShZqpcI0Sa1g6/KUROLJigi6Yj4DHe/6kj2e4t0c1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaFXP1Ck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaFXP1Ck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FC61F000E9;
	Thu, 30 Jul 2026 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785396627;
	bh=ZTPrixUmtwgr78qH2RJ4wLaoGsLv7kGn8Js7Z2QIfGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VaFXP1Ck0V9BdeHJv8G5rOD483F68DwzBQkmWXUNLVFSQ45m6AOHuvklV/G+jMBrR
	 r6V6YYaqvTVzx0P8IAa2fmEWIhtMBV4Oct8sWX50dz2Swe/7qLVoE/rjoMWwOId68T
	 Xj96osaVn/qhn4l+HUunpelyPm/PFrB7FMUz2RIB90tZD28mUV44S9v1Z2xdWVX7TX
	 poT0T1gWkRXlcP1rqxnJrSp81QHSdIRXqw28Uykob9xbNjfLNa38/LWBQxfb2Mwmmn
	 ineMN+D+nEmK00UC4qVUnCHzo57lvs+vB17SBiE3KG1MZIu/zlD1Y1JNCAqpgImiN4
	 UrwNoMltTql3w==
Date: Thu, 30 Jul 2026 09:30:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	samuel.holland@sifive.com, dlan@kernel.org, guodong@riscstar.com, 
	dfustini@oss.tenstorrent.com, michal.simek@amd.com, junhui.liu@pigmoral.tech, 
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn, 
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com, 
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	robin.randhawa@sifive.com, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Message-ID: <20260730-glossy-pompous-quokka-c05c60@quoll>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729163908.249838-3-peter.lin@sifive.com>

On Thu, Jul 30, 2026 at 12:39:07AM +0800, Yu-Chien Peter Lin wrote:
> +  riscv,pmlwidlist:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      Optional bitmask of WIDs available for S-mode and U-mode use on this hart; each
> +      set bit N indicates WID N is available. Firmware may read this to select platform
> +      authorized WIDs for lower-privilege modes.
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
> diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> new file mode 100644
> index 000000000000..cc8b3747591e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/worlds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Worlds Extension
> +
> +maintainers:
> +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> +
> +description: |
> +  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
> +  Specification, adds World ID tagging for context isolation.
> +
> +  This binding describes the system-wide Worlds configuration for the /cpus node
> +  and is used alongside per-hart Worlds-related properties such as riscv,pmwid in
> +  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
> +  riscv,isa-extensions.
> +
> +select:
> +  properties:
> +    $nodename:
> +      pattern: "^cpus$"
> +
> +properties:
> +  riscv,nworlds:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Number of World IDs (WIDs) supported by the platform. This is a system-wide
> +      property that describes the total number of isolation contexts available.
> +      Hardware components such as the WorldGuard Checker use this to determine
> +      the valid range of WID values.

Does not look like property of CPUs, but the "WorldGuard Checker" device
node.

Anyway, SoC compatible defines this. Don't add redundant properties.

Best regards,
Krzysztof

