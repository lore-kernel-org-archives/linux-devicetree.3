Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C205150B8C8
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983129; cv=none; b=TEAGwcVnF5pEh3x1F6X/B03SkcGGvx2FRwsi7SoLro9/02sm5VfFIH+iy5iy9PytQ4fkwf25u1zYvQCrNg3vzQ917yfC4VfDDkNKsmQCQ5PaUfzxCGvzn+AaNQiNwV8A3REba/B5RwYsozgdz4+scK63zHo4a6mstR8rBbOGOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983129; c=relaxed/simple;
	bh=Pzse+yaekeAkSHgWAEzAP9JIku/YbnM+uauCwo/35e0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tAb/Pz1iVmq1rJzsDEAwBrsqt8SU7wO66uTVrI4FBXAB59qoloykYsD9s9VTstnVYJu8/ENKtc0p0syCq2pVh7B/gP9adiWNhXNnMZ+u/SkXA6LKsTCxU3h4M+lx8du8N5lkZBrOjF6WJ4SvWckJD+ja+ZJ6/N1SpyvDnm2SQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3KoH1ZJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3KoH1ZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373811F000FF;
	Wed, 14 Oct 2026 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983128;
	bh=DnjNAZ1QscxqZRiAnMeMw3kBf351TsHGL8fpij66lRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3KoH1ZJW7VIqRLDCkSnU1jjscVs0RaAgv3TQxgWCNPaOwsyZ4SRXCI59rBo/Sf3j
	 yACyR38wKCPaqJgBzQKB8WfhI6+7xXERyv79YDJttTJDtveIIbkLLSANWV28htGEcj
	 HWPzpFyWfKb8u8GXxhXkpbjrfFans9MdV6tDv2RrOYwJCVnezNQVe2PMXeayuhyrVv
	 f17lsB4rEOpUxAKjzrP7RV+m86ZHAwsH1HZX03VV35jA8SfjGRbAn096R7ma1b9cgh
	 aXIFsfojRXmuHCtz56sMDVI6BvfSJSqAwIoqpqZEibQZerdM58S7rkV/PNoqV9CMVE
	 wIjWU446rHtpQ==
Message-ID: <sashiko-outbox-171314@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: altera: Add support for the Agilex27
 SoCDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014125709.2106261-2-dinguyen@kernel.org>
References: <20261014125709.2106261-1-dinguyen@kernel.org>
 <20261014125709.2106261-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:05:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: Devicetree ABI breakage via removed compatible strings
--

commit b7069576f5ba1a0c7e169fe3bc7f1902d040e447
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: altera: Add support for the Agilex27 SoCDK

The SoCFPGA Agilex72 platform is being renamed to Agilex27. This commit
removes the agilex72 base DTSI and devkit DTS files, replacing them with
new ones for Agilex27.

[ ... ]

> diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts b/arch=
/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> similarity index 67%
> rename from arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
> rename to arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> index 998f19f492b36..15d331cdeeb47 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
> @@ -2,11 +2,11 @@
>  /*
>   * Copyright (C) 2026, Altera Corporation
>   */
> -#include "socfpga_agilex72.dtsi"
> +#include "socfpga_agilex27.dtsi"
> =20
>  / {
> -	model =3D "Altera SoCFPGA Agilex72 SoCDK";
> -	compatible =3D "intel,socfpga-agilex72-socdk", "intel,socfpga-agilex72";
> +	model =3D "Altera SoCFPGA Agilex27 SoCDK";
> +	compatible =3D "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";

[Severity: Medium]
Does removing the older compatible strings break devicetree ABI compatibili=
ty?

If existing bootloaders or user-space software expect to match against
intel,socfpga-agilex72 or intel,socfpga-agilex72-socdk, replacing them
entirely might cause them to fail to boot or bind to this board.

Should the old compatible strings be retained as a fallback in the root node
to ensure backward compatibility?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014125709.2106=
261-1-dinguyen@kernel.org?part=3D2
