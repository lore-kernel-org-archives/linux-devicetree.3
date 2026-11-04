Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784035;
	b=GX5KduyIrjjrPDbaCBEfXFIL6dSdF2lNU58cD9aNM0NUmkAUlfqQocsUzDqkA/0ddNaG
	 8msx/+Zy9PCp/9Tf8d9Q6mDx70krmQhA2wcODD5ODW/tG0SFy8g5JtppBVY5op2CTGp9T
	 jx6vzahb3MQ2/kDOtYljXtHQid6e6ohV6qjgeOCky2VHEPRSJFGxXvSUZux7CB6AA4O9Y
	 UNe4eynza8RXQiQHEp4VdQPHKamEqcytvcM1A0qF8mDNkE5HW0E2gGmSzBU/WNi+ZlPnh
	 scfJGg7u+BPqIuHKQ13uCpuBRHzIzC2xEva5RivUrahn2PXPxGttgg+0mHQISS/sdbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784035;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uMjF/chQexJDpp0ppaFT0lAl4UCDmFJoHUtF6hICr4E=;
	b=GqXWbMmm2NHKACVvRY4FPay8HXGJAueP68E4Xz8o9sQYd8WMpalaAhNBA+MVa4jZY0O1
	 Yed1CpgqS2+s1U70cWzk0yzppRNSRI6D5xCmhOXgdXDeI4GHiK+jzqsqfuMP/hTk7LRbh
	 GYZTj1ZUxDScqFlO7gp6XlCG28USRI/KshPdMwdk2r0mBEK1ECYMSjz/m52WQXIoN/pMZ
	 dSDztfyeIUbBp18ZBkqNwzCLlQdUwYRofCn4I2q8fossRhS8iKrMb+pp4vxsFxCTfUfN3
	 Sl9IDGqYbW9QhKGwIrNY1ZbnKTDgdXah+D0WWpp71nfc64uzklNHfiDdR7mm79QYyyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D957N++n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE7D606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D957N++n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895EB1F0093A;
	Wed,  4 Nov 2026 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784034;
	bh=uMjF/chQexJDpp0ppaFT0lAl4UCDmFJoHUtF6hICr4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D957N++nNtq8987qJYSGyF54XrANbX6L3mJUGX1dQ9lqzscegcx2P4AkFyRO6P/O6
	 5nxqAbu8neA1pd4pEteOruPt73Yf4He0aNmnGiBteA9Ji8jhyxJaD8GoArXbV013/h
	 XeTUqTpVfFFGx4Zd32wjooV5ZXBs06vopXaLlNPgx+oNAl1lWdDZDUE0eYMA/KdfvX
	 pTYLGWSYjtn6yquzniVT0bjIauN3X0M8jaM7K5Nn8R7c/23Fyh4Y9bjgFdkq2rS8aV
	 h6FltXvclzur7EXvs6fKeMFPoRl1yilsVIFpeTtM+E8kQjdFbWQT0sACHxpSRGXFf+
	 FVhK0+mQqddkw==
Message-ID: <sashiko-outbox-196944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT37802
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jayant Shekhar" <jayant.shekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-jshekhar-nt37802-v1-1-58e5e7fb2556@oss.qualcomm.com>
References: <20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com>
 <20261104-jshekhar-nt37802-v1-1-58e5e7fb2556@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 09:20:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: display: panel: maintainer email mismatch in nt37802 s=
chema
--

commit 5aac2d7c3f53fb607c4bdfc23eafa7cc910f9e16
Author: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

dt-bindings: display: panel: Add Novatek NT37802

This commit adds the Device Tree binding schema for the Novatek NT37802
AMOLED DSI command-mode panel.

> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37=
802.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37802.=
yaml
> new file mode 100644
> index 0000000000000..14a59a9b0feca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37802.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT37802 AMOLED DSI Command-Mode Panel
> +
> +maintainers:
> +  - Jayant Shekhar <jshekhar@oss.qualcomm.com>

[Severity: Low]
Should the maintainer email address in the maintainers list match the
jayant.shekhar@oss.qualcomm.com address used in the commit Author and
Signed-off-by headers?

When scripts/get_maintainer.pl queries
Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml, it
extracts jshekhar@oss.qualcomm.com from the maintainers list instead of
jayant.shekhar@oss.qualcomm.com.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-jshekhar-n=
t37802-v1-0-58e5e7fb2556@oss.qualcomm.com?part=3D1
