Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504437EFFB
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707002; cv=none; b=W9fl8b1CnIrbbChDNmZSmucn5N3dGo31IXTJYD57YicT6uNnXzwV/2K8Bqj/0B4KipL9CwZvmer8AtB71LO7OmWF/nV5KCQ/9VW72YMzBkoVW5FtNnJsTzxhpK+XBKEUKNl73VvBD4HoH0M4yOh3EWn1Z0zDjtLGuu+7BG02cQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707002; c=relaxed/simple;
	bh=SiSmZrw6FTUyj8kMcAHiSfr1hO/LWfZwBkZxkA7Z3GA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vv/2VZUtyigi7WC2BGZwBp9zzLZMmZNjjWKdDtxGnd/VDiPrJkwIjfjBpybhd/8DGFjOvAyjC4zwzuCNdKBDD1to3RXyctg7wI6XlQmQQP0UzYDASWOYLm7SHRGMBRfuwPSgNCbRjUeYiFprFLfOipJsPdE+Zf0oM8NT2gH865M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xsrx5o1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xsrx5o1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239A21F000FF;
	Tue, 29 Sep 2026 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790707001;
	bh=kfNN/MgL6pvIIwRbSiG2N1vd4UeuJXiQIyOKS5s7i7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xsrx5o1gvYVZyHlN8CBq9BtNflZj1levCbMmkacvcuQxFlEX0ibzKqOJVB8Wt9MxH
	 0pfSkj+wJ1jvsbeEm1eORVel6uRvnc83qC8NR7YtelSm0CFuXqSsb9Ko/QbmnBSZ9d
	 3njshtMbVlt3gnvMT1o0J9bBENz6NuJEzTBEFvp26sC8meKoyK5QH8MMAwevispFoY
	 axC6+LAul97SZq4QO9Ts0gCaOP7HWqnUiJVlehzn2zYiriy6iWMlHKxtqJkwr7PvaK
	 JWotr+fa1PCi/gyKWFN7+efGATYXmEx6eMGyZkhMYubz+gVD7ybqsH+2lq2T4twb6r
	 0BA9aqfE8tRgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: power: qcom-rpmpd: Remove unused
 MSM8953 indices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260929-sdm632-rpmpd-v2-1-97ef8858161b@mainlining.org>
References: <20260929-sdm632-rpmpd-v2-0-97ef8858161b@mainlining.org>
 <20260929-sdm632-rpmpd-v2-1-97ef8858161b@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 18:36:40 +0000
Message-Id: <20260929183641.239A21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dt-bindings: ABI breakage by removing MSM8953_VDDMD index
--

commit e44d0dc9a145a838a007b1d8e81abb98d56a4d20
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

dt-bindings: power: qcom-rpmpd: Remove unused MSM8953 indices

This commit removes MSM8953_VDDMD and MSM8953_VDDMD_AO from the MSM8953 pow=
er
domain bindings, as the hardware now uses mss-supply as a regulator. It also
defines RPMPD_VDDMD for the SDM632 MSS.

> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings=
/power/qcom-rpmpd.h
> index 4371ac941f29d..120f8855b4275 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h

[ ... ]

> @@ -84,8 +85,6 @@
>  #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
> =20
>  /* MSM8953 Power Domain Indexes */
> -#define MSM8953_VDDMD		0
> -#define MSM8953_VDDMD_AO	1

[Severity: Critical]
Does removing these identifiers explicitly break the established DT ABI?

Older compiled device trees (DTBs) for the MSM8953 platform encode the power
domain index 0 for MSM8953_VDDMD in the mss (modem) node's power-domains
property. Removing this index from the dt-bindings header and driver removes
support for these existing DTBs, causing a backward compatibility regressio=
n.

When booting a new kernel with an older DTB that uses MSM8953_VDDMD, the new
qcom_q6v5_mss driver expects an mss-supply regulator. With the old DTB, the
new kernel will fail to find mss-supply, rendering the modem subsystem
non-functional during system boot.

Is there a fallback mechanism planned to ensure older device trees still pr=
obe
successfully?

>  #define MSM8953_VDDCX		2
>  #define MSM8953_VDDCX_AO	3
>  #define MSM8953_VDDCX_VFL	4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-sdm632-rpm=
pd-v2-0-97ef8858161b@mainlining.org?part=3D1
