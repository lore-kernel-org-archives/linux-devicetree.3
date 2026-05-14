Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1374315A
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726670; cv=none; b=GeYlzDTnGxFUiq/0s0+t/2jBCSsISViGSNGfVSGgPg27h//M8kQ5xpzD6uXMx+cTHdEM5AxmNVt/XpjPIPc4H4MT7mQvfQy6vnLzeC3L+3e1bpnaO7tGIeyr2lN89J9+byzMMB70cUe1OLJhwj3aoSJZXuvpMCo9v7iNvSmPWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726670; c=relaxed/simple;
	bh=Q5agcE0n6A+VDsncm6Ag28s7ymlRWhdnh+qp8Ej5zF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qe8JH9No7UvdR/q8ARGOrhRUTPAie679bqgDEV7W6mezqn+f9enOEn9JQoAlcjLkzN6fuYDZYL9AB5VjlfhvDdwR9XZeJW0/+xR5RDu/gjam00fu6u/ItNgDGRjQhr9eHWefxzg+8vicA+xNtSdrBe1sUhSTOWX1VQ7v8DfuFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcXRTIbk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcXRTIbk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E423C19425;
	Thu, 14 May 2026 02:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778726669;
	bh=Q5agcE0n6A+VDsncm6Ag28s7ymlRWhdnh+qp8Ej5zF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WcXRTIbkl72lnXFgMCzH6M/iRsZFMDruEohuHCM4UCbiFtwHf5IBcEFUIRA58pD49
	 /4BmtqRBhuw19ba9T5adEORAS01ueOH6oiUTQgiQQcD7uGNCBU532TDAsTzMIzy9kA
	 WVL/qbhb4gzhMLpi8MtZUgM7qbpM7ssxkyGToBlEdZ4KjnNWv0ltoUqce2EQKtRKeG
	 iNYD7wkaTNjYFSYVQDLbAcA2WGeyfCHbLHarQNriqpqIo63QyoM4H1EqwT/mhkSFjK
	 hWpgI4/cCjoVOni6ez0PClaxqLsHQgEIJ6M+E5gYwX06B7N7jHdOHaNAMZxPCqmIaD
	 KoMlDHaCLR7Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: socfpga: use consistent QSPI boot partition
 label
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <eff34df0c67d39a26d20ec91eda8dd9e15f9f5cc.1778658884.git.tze.yee.ng@altera.com>
References: <eff34df0c67d39a26d20ec91eda8dd9e15f9f5cc.1778658884.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:44:24 +0000
Message-Id: <20260514024425.5E423C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Renaming the MTD partition label breaks userspace ABI.
--

commit 4ade0c1cd1fb03537998130680736791486edcdb
Author: Tze Yee Ng <tze.yee.ng@altera.com>

arm64: dts: socfpga: use consistent QSPI boot partition label

This commit aligns the QSPI boot partition label across multiple SoCFPGA bo=
ard
DTS files. It changes the label from u-boot to Boot and fpga data to match
the combined boot and FPGA image layout.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/a=
rm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> index 262bb3e8e5c72..5ce825dd6afb0 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> @@ -86,7 +86,7 @@ partitions {
>  			#size-cells =3D <1>;
> =20
>  			qspi_boot: partition@0 {
> -				label =3D "u-boot";
> +				label =3D "Boot and fpga data";

Does renaming this partition label break userspace ABI compatibility?

Device tree MTD partition labels are exposed to userspace through /proc/mtd
and sysfs, and are often used by utilities like mtd-utils or software update
scripts to locate partitions by name rather than relying on dynamic device
nodes.

The u-boot label has been present in this file since commit a63766f32d62c
(February 2025). Changing the label to Boot and fpga data might break exist=
ing
userspace systems that rely on the old name to perform firmware updates.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/eff34df0c67d39a26d2=
0ec91eda8dd9e15f9f5cc.1778658884.git.tze.yee.ng@altera.com?part=3D1
