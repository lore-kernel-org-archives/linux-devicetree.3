Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175176;
	b=kJ0tIY36xS/LrGpdVBJRaQ5Sud7UHgr8qZi4jotydE3k/F/I8qwFyNP/yoiG/oFVFItp
	 1YTfyFs3frYrepfoxoU76h5cTX8KOQucEYey0SwQj2wUGv18BiBUPun8p+qSFn44OVDN8
	 ypLHsWHBs+D7e1fVbPoMecEUqB7lLhhlfk+vJNmZYsIE3SjUUaMyT6KXmdq0Q1x3QyReR
	 i1bPGXv/fhomJJnDR+du1G+slQrN/HyjayP5dFp/GACNkp9JkktxR92x8Mdo2UcZoFk40
	 slhnLMLl/5rq+69ex55LSm06QIIM4QeXECeLHRcOPTr/TGHku9BTayhzdtCgDAcWhaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175176;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5bh1TJoOcpKgh/VaRq1SPg66g7PNWyzRye9RVdcbuBM=;
	b=TjY542VHCk/v4fku+EIELABawi3v2U+Jzyf0pNIxTN4AMsl4fE6c+VOKMHGATtmmwwzc
	 /2nv1+4ulI9+RAeg8USMW6ACHKNJkrtVVF2ty577Ta3qZ+lXWEsG1K1Ji5aFVPLWE7w+B
	 dAqRz/WNFxWplDewUEWRLffOhiUYv2R5rGqdOA9y8QfgW38mo6F80pMUqiUwj9yQIE6Yw
	 yNhyhSZBB7xKWBepOTwCRUc7rP2AM8X1O59JGw0zLrXvG+dRSoP7Atp5e7NRgHl3X8Pgk
	 M9DTWxhJNm6tIyDMIyLj2+mEMPKLzRPQzum+1m0B7S2ya4dhQ8k86bh72wgSYQpc/pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTUVJoFm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64EB606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTUVJoFm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258041F0089F;
	Sun,  8 Nov 2026 21:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794175175;
	bh=5bh1TJoOcpKgh/VaRq1SPg66g7PNWyzRye9RVdcbuBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RTUVJoFmT9FgHG5aD3yOvxDzYD0Fc30Qi1yiXWU1VtARj93SQh1uP/sQPRjxzrs6h
	 Oz/SscqZLC15tb51PxvyNSV17IWoap2j/tGqaJDrpkFZLVmBxWNupYTwVOM4OOdjh+
	 gVnQCvvIpBGmZi0Mk3+rfZwhCumZ+Fea6IBBPNDrjqtsQPZDP41qPEI9Yu3C0BXqWL
	 QQ0otFtYdjAQs44oamssLbpbjbO2OS5PFUnhoB0LFmeVjmX3czeMt85y8DHnOcEAOm
	 hTMo+TyYvzZAkMMMQW8P15KxDQU6Id/mHzOWizLczkDKscSeR/DK2RdlAIMoFC54fq
	 asVmRDbNp6Vdg==
Message-ID: <sashiko-outbox-204101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <cyan2254650260@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108215010.351256-2-cyan2254650260@gmail.com>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
 <20261108215010.351256-2-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 21:59:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: soc: xilinx: undocumented alinx vendor prefix
- [Low] dt-bindings: soc: xilinx: standalone board entry for
  alinx,ac7z020 SoM
--

commit 1e47b64f622951246602cf5bda819bb5e711a84e
Author: Pufan Jin <cyan2254650260@gmail.com>

dt-bindings: soc: xilinx: Add ALINX AX7Z020B board

This commit documents the compatible strings for the ALINX AX7Z020B
development board and the ALINX AC7Z020 system on module in the Xilinx SoC
binding schema.

Link: https://www.alinx.com/

> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/D=
ocumentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> index 5f33f7def6a32..349987962e33f 100644
> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> @@ -20,6 +20,7 @@ properties:
>        - items:
>            - enum:
>                - adapteva,parallella
> +              - alinx,ac7z020

[Severity: Low]
Should alinx,ac7z020 be listed in this two-item standalone board enum?
AC7Z020 is a System on Module (.dtsi) that cannot boot without a carrier
board, and the three-item entry below already covers the AX7Z020B carrier
board paired with the AC7Z020 SoM.

>                - digilent,zynq-zybo
>                - digilent,zynq-zybo-z7
>                - ebang,ebaz4205
> @@ -34,6 +35,11 @@ properties:
>                - xlnx,zynq-zc770-xm013
>            - const: xlnx,zynq-7000
> =20
> +      - items:
> +          - const: alinx,ax7z020b
> +          - const: alinx,ac7z020
> +          - const: xlnx,zynq-7000

[Severity: Low]
Does the "alinx" vendor prefix need to be added to
Documentation/devicetree/bindings/vendor-prefixes.yaml?  Without an entry
there, running make dt_binding_check or scripts/checkpatch.pl reports an
undocumented vendor prefix for alinx,ax7z020b and alinx,ac7z020.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108215010.3512=
56-1-cyan2254650260@gmail.com?part=3D1
