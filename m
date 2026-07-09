Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A993DB649
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630473; cv=none; b=V6Kke24w6Qtd5hNJ/MvbK+XvwjpevkS1tqkekGHfrEm0hAPH+QyRq5KEC77fA/aCMH4Yh0biZnEoZfQjNdIpjBGRQDrdi1xXq1GQ1UkKSDNw+F6etUH30LmDVRotTQVOUZhlaY3/sc/BOjgU1x0Jxk3GQftZjxJaqYU5owwXU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630473; c=relaxed/simple;
	bh=XYLJO0/C15vBPeeXSUcp4mKOHLjEDJ1iTDYSwr3gr28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FdFu2HxjtljMIFX5GRVCUJSx10Gscj1+GI3sPjr0ePcg+3owOu5rvYZ34IWGkUP+rc5GD0mzmj2T55OKOXduEMNJiNhMg9qOmbQlExSCR+gm6khg2+3CuYDKb7o05GfFTU7UJsuBOie8JswXw/yB9GCbEMEiuM9A2QJf/TEbmSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVRnYmzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVRnYmzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA0F1F000E9;
	Thu,  9 Jul 2026 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630472;
	bh=XYLJO0/C15vBPeeXSUcp4mKOHLjEDJ1iTDYSwr3gr28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SVRnYmzRHk2B5mAbrPp4vVs7Y9NXep3EwBuPIan1jsQBjgT0bcxG5sLqD/gR+0CBT
	 48rdwIp828TfQm18Yahcup/YxXmZM4vxVaiu3bZHMS6agjqWu3I5M542KwTGqJ7LD5
	 4ovZ6uC9WO165Ku0e6R8jNEcWEHb6Pq840haJ4L8czPqX+v3d4VB4pbW/cblHDXnu8
	 BGk+v8OiM/aO2+6Ho/0u5+KSqB5urEsQFpM1YjKzPF5aM8pjHG7bS0gV73XmIjKGPD
	 UXr54rhdmBd3TsMtoBWT5U0OFbIImz7VVPihMuf0jUudeETrLUxPxguZM+yXqGl4YZ
	 kd6uXVCQ8HEsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/19] selftests: crypto: cmh - add kselftest for
 management ioctl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709203037.1884436-19-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-19-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:54:31 +0000
Message-Id: <20260709205431.AFA0F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new selftests directory `drivers/crypto/cmh` is not added to=
 the `TARGETS` list in the top-level selftests `Makefile`.
--

--- Patch [18]: [PATCH v2 18/19] selftests: crypto: cmh - add kselftest for=
 management ioctl ---
commit c0e9965b4adefe82198fe9afe458b32c7561a9a3
Author: Alex Ousherovitch <aousherovitch@rambus.com>

selftests: crypto: cmh - add kselftest for management ioctl

This commit adds a minimal kselftest for the /dev/cmh_mgmt ioctl interface.
It exercises basic lifecycle events, input validation, and hardware key
generation capabilities.

> diff --git a/tools/testing/selftests/drivers/crypto/cmh/Makefile b/tools/=
testing/selftests/drivers/crypto/cmh/Makefile
> new file mode 100644
> index 0000000000000..86cb63839b27b
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/crypto/cmh/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +TEST_GEN_PROGS :=3D cmh_mgmt_test
> +
> +CFLAGS +=3D -Wall -Wno-misleading-indentation -O2 $(KHDR_INCLUDES)
> +
> +include ../../../lib.mk

[Severity: Medium]
Is this new test directory missing from the TARGETS list in the top-level
tools/testing/selftests/Makefile?

Without being added to TARGETS (e.g., TARGETS +=3D drivers/crypto/cmh), it
appears this test won't be automatically built, installed, or executed when
running standard automated frameworks like `make kselftest`.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D18
