Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE03F54C9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495437; cv=none; b=ZyixvHx9tVYoc32vfLnPlgIZU2RWMM9+OnwaNiDqESwzLtdpvClqsAbuO53w6deArlzADYhGPxWEIRpEi7lqZBOUIBMPm9I7Q2IZyOH3cQsPpfL0PBh0xMce3f9LfpKHbqfzmDUa3pzOhCUq+bur7Nil1hOqbPZ/tRh6GJQq6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495437; c=relaxed/simple;
	bh=MQyVj1/YEyzdXCUs64ppkHreCxsY8/7HeF2R8vP80Ik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MBG4PW4WWGZVc4J20457qwTZ/93m8S0wijby6vM/vJAsnCLI3p5kL0MYWU9dUKMc8wlNUT935lZmJ/cMk+QsZQifXa0CBJSABrNIEsQSjz3Hm2fwkzbVGQGxd3ywCDjV4bhBhOPZFeXUHdQdZikZ9g4xa6+omoor2Jtk2FeQj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtHhwMRY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtHhwMRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBBB1F00A3D;
	Wed,  8 Jul 2026 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495429;
	bh=j9zCWPAJlkmvbnaKxcoZyn8rzwEGgc1ZEZo6ZMjrE5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OtHhwMRYowxku8t4r+QDnhK1+7AsiQTKfbfuradDNDY5nWRnLUmxfUFSnxhiizdxB
	 jHUoeftB1goDg4BrcDwQGWvDs93KAMF3C7AusFp4GOZxDmkEHPMN20RsXI43RftFpb
	 KK2sLrCmyASJCwtrkGaNMLO/OR+bhCSiDQQa70QkZ6o9zbGaxIcOXvW/5Btg0xwSOC
	 RlRnCSk45clxfLOXYZlBMCZyF0IMqKAT9c89ZdGoBikFT01/0WS1SUYniMV43rQWL0
	 rI4anQXE0GT3JqGFpIgNXG5WjbUtNbabYtDcgAasBPyggWJ9H0vWt86GJHrUJEqbk5
	 g9jouWwqpzS3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 22/26] remoteproc: qcom: Move minidump data
 structures into its own header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-22-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-22-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:23:48 +0000
Message-Id: <20260708072348.EEBBB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The newly added header file `include/linux/soc/qcom/minidump.h` use=
s types `__le32` and `__le64` but fails to include `<linux/types.h>`.
- [Low] The highly generic macro `MAX_REGION_NAME_LENGTH` is exposed in a g=
lobal header without a proper subsystem-specific prefix.
--

--- Patch [22]: [PATCH v3 22/26] remoteproc: qcom: Move minidump data struc=
tures into its own header ---
commit 2cd4dc20742b94f6ee105c751e369816b8d27d0f
Author: Eugen Hristev <ehristev@kernel.org>

remoteproc: qcom: Move minidump data structures into its own header

This commit moves Qualcomm minidump data structures from qcom_common.c to a
new shared header file. This allows the structures to be reused by other
drivers.

> diff --git a/include/linux/soc/qcom/minidump.h b/include/linux/soc/qcom/m=
inidump.h
> new file mode 100644
> index 0000000000000..7449a04e6e158
> --- /dev/null
> +++ b/include/linux/soc/qcom/minidump.h
> @@ -0,0 +1,67 @@
[ ... ]
> +#ifndef __QCOM_MINIDUMP_H__
> +#define __QCOM_MINIDUMP_H__
> +

[Severity: Low]
Does this new header need to include <linux/types.h>? It uses __le32 and
__le64 types below in struct minidump_region, which might cause build
failures if a driver includes this header without previously including the
types header.

> +#define MAX_REGION_NAME_LENGTH  16

[Severity: Low]
This isn't a bug, but moving this macro to a global include directory
exposes a very generic name to the global namespace. Could this cause macro
redefinition collisions with other subsystems? It might be safer to give it
a subsystem-specific prefix.

> +#define SBL_MINIDUMP_SMEM_ID	602
> +#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' <=
< 0)
[ ... ]
> +struct minidump_region {
> +	char	name[MAX_REGION_NAME_LENGTH];
> +	__le32	seq_num;
> +	__le32	valid;
> +	__le64	address;
> +	__le64	size;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D22
