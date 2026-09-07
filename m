Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8DB40D590
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766373; cv=none; b=e4tHRK3dzUfi9os8H11OwyUJ5SYf4RYcwGAeKKfIfe6bMJiaXIlX8uhusqoMJ1a1wGy5vju4pZvnw3gkN6D3izwnYC0eCBPB7cGEMkHzSIGxlEqH2Wmf2TXsiamlGliDkP4UwaQdqVO3uDTSqPJI+hU2VjiNFHSrnG369xnw6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766373; c=relaxed/simple;
	bh=o30OwlOgjphEHHZdO/w0ahn2SvtGQlWPmxPj+qdMqSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VsqTdsZTR29jqI1KsATkFA4hFib7RAXF9Eh/FsaobRYWZpWWnlhkxtWTP4MDHSFO33DAY+mzsmyhl/CjYVa3vHXAfQ1TmXP9OoEQuIzfVM7GGZ5Cv8gd+LDEvIzGaGZbuSQsgU0ppfEVEU4wMksoocgX4vwx5TQkQ8WBVHxvyDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZsWoyCG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZsWoyCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C108E1F00A3A;
	Mon,  7 Sep 2026 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766372;
	bh=DSxUGQuoCpiCUflI6VRWG4s+3klAoMYrXX4A3PpTnOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZsWoyCGQhY+vtq7DUdBYFbmtDSfVOKUiwPG34FnHZ+PCP6PL36f+l2r2v10jd565
	 Etc9Pr8y/CFudARU9f7M1smTluSIgGneMH0kUCs7G+Z2SFYB0wK84hiFf07+X+NkLl
	 D7zrWxmNn6mX6L0R6bxTpTzh2QhP9q/KzhSOTavkYseBhq21hMH5GqxfBVTlBo13Mr
	 3KMV4oc20X0nyfgAXRMKpJPzAK2ehlTRjxc5tQ8S8LcKOBByCOytlaf0Fp9WU8ePWB
	 Ty3u3pXMJQBP8VUTjlrixrwUhUSyvgXWFX3rH392dWbKCIgteMurH5lWqY0UACktn/
	 gowkXF64oPaNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260907-08-dts-v5-3-584e5ab50b40@oss.qualcomm.com>
References: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
 <20260907-08-dts-v5-3-584e5ab50b40@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 07:32:51 +0000
Message-Id: <20260907073251.C108E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Ambiguous root compatible string for the NAND variant prevents p=
roper board identification.
--

commit 054f8927949f274ca03510708d77e6e740a88b02
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file

Add DT file for the NAND variant and include it in the Makefile.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm6=
4/boot/dts/qcom/ipq5210-rdp504-nand.dts
> new file mode 100644
> index 0000000000000..1145fcf0a3025
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5210-rdp504-common.dtsi"
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
> +	compatible =3D "qcom,ipq5210-rdp504", "qcom,ipq5210";

[Severity: Medium]
Will this compatible string prevent bootloaders from selecting the correct =
DTB
from a multi-DTB image?

Bootloaders that rely on the root compatible string to select the correct
Device Tree Blob (DTB) from a multi-DTB image (such as a FIT image) cannot
deterministically distinguish between this newly added NAND variant and the
existing eMMC variant, because both define the exact same compatible string
("qcom,ipq5210-rdp504").

Since the board must be physically reworked to change from eMMC to NAND,
loading the wrong DTB could lead to pin conflicts and an inability to access
the storage medium.

Should the NAND variant declare a distinct, unique compatible string, such =
as
"qcom,ipq5210-rdp504-nand"?

> +};
> +
> +&qpic_nand {
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-08-dts-v5-=
0-584e5ab50b40@oss.qualcomm.com?part=3D3
