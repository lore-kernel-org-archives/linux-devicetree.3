Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83014746AE
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932444; cv=none; b=pTdrN2Q7EZCEYzZh0yEX9uq/B1tAsiekz1zu27xVv2x4eFaL9wzLH6yjaJMBzYC26Qsvx2uaoa17AdiHqBq876tOTFBSH3GnWRPVJyyIo7/XRuG0i0c1tbyw8zSZBQwvKfj8Vyl74OGE5mUDcRWq0d20CvAPoj26HjFXW7sdqfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932444; c=relaxed/simple;
	bh=rnfQLvdqZKWir31ricde3mjE6DL7vWz7DoCRHdhcOEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cJ+HUI/iPRbRdgtJf3Su4xrOV6oAtq/YmGh+VBCkgtHdvAhOIyZR1ccoZv4J8QGNfV3uwbqMSTFSdJ8lfgQhpanvEuWtk9Imfrjp9ldqfD41fYqvtbgtumjrjWq6wMfeC0xdnlk+/kL5afHiWQZY5wpt8RjRv5mNgK4yogeAHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdQiW4vZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdQiW4vZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878431F0089A;
	Fri,  2 Oct 2026 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932442;
	bh=P1QzvxoszUfGHcuOYFVkiCngzYZlzTYSKDsIEPwRd4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdQiW4vZ66oepzHTDInI0/3yBrC3QUrHbr4+N3C9t72YINwMAgTCv/Pzrfc8Kfa9C
	 ZARzlxQ8xmeL0yyP1xxbuF5ZoNI2TUqgcdOIgfyvHI1QPq0+EkG2g2x59S+ul19kC7
	 8tX8f67oSUsHZVsrH3LdKM+E+b3fbwzEpxU0L+xn4QSrKSghfGmqg5SvhVMyN7vUtM
	 chZk2OeEY5J0BxmxSxnbMyyCUBuJPsxM8iUgQHEbt6oNkvyOUuJxJbwAjuyPtM9uaM
	 lD9pOtg1U+4zOUK5m0j+tJ0EE+aKiRP/uXsAxAMl/Q2dqgYXE5nQ3uEGJWAm6Ga50p
	 div/lMdj0dfPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: power: qcom-rpmpd: define
 RPMPD_VDDMD
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261002-sdm632-rpmpd-v3-1-95c47d0f26cf@mainlining.org>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-1-95c47d0f26cf@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:02 +0000
Message-Id: <20261002091402.878431F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: RPMPD_VDDMD incorrectly shares index 5 with RPMPD_VDD=
MX_VFL
--

commit 12f0f9a3ab8aa298b418ea38da861f57dfeb42fb
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

dt-bindings: power: qcom-rpmpd: define RPMPD_VDDMD

This commit adds a new generic power domain index, RPMPD_VDDMD, intended
for use with SDM439 and SDM632 MSS.

> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings=
/power/qcom-rpmpd.h
> index 4371ac941f29d..beb066b3aa8c6 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -15,6 +15,7 @@
>  #define RPMPD_VDDMX		3
>  #define RPMPD_VDDMX_AO		4
>  #define RPMPD_VDDMX_VFL		5
> +#define RPMPD_VDDMD		5

[Severity: High]
Will this duplicate index cause a conflict for platforms that require both
the Modem Power Domain (RPMPD_VDDMD) and the Memory Voltage Floor Domain
(RPMPD_VDDMX_VFL)?

These values map directly to designated array initializers in the provider
driver (drivers/pmdomain/qcom/rpmpd.c). If a platform descriptor array
includes both, the duplicate index 5 could cause the compiler to silently
overwrite one of the array elements, rendering that domain unusable at
runtime.

Would it be possible to assign a globally unique ID (such as the next
available index) to prevent overlap?

>  #define RPMPD_SSCCX		6
>  #define RPMPD_SSCCX_VFL		7
>  #define RPMPD_SSCMX		8

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-sdm632-rpm=
pd-v3-0-95c47d0f26cf@mainlining.org?part=3D1
