Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B6422552
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827331; cv=none; b=dRDod5Bl70Cu9V+N5ewQsDsbRmzOO73w8EeXdXuYuh19Bc+XuB93QWwWsNuQB3/o+jM0DhTfiOgBZF239Kfqn6JG1Ik+5tfQJ7yFVhIRHEAxZsSnUkfeBK2oZOS5659yDTjxtAp2JdrkmGFDR3K+kJVk3VrwaO+WomiyRZ3pHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827331; c=relaxed/simple;
	bh=wxY8CakCJIwUQLN2eVRFEcCXKd5dmGrHCFSx8JWcvZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XtGm40dbThAacz9FajGA+9wrOgRMkgFBC7O1knCN8vLZFaiNBZbtiHOml3hZCpJzel3KwOEK7WiZiFZYDYyYBh6UZGWUceDvdl+L4jRHOumUALF2oMlu/rJSaALUCwvSd9d4AZmvgO0d35P8N+YV65lrfjBjUMl07TJeKTD+Y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSe/J0yn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSe/J0yn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4169A1F00A3A;
	Tue,  4 Aug 2026 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827330;
	bh=tCgTUqAjvq8i7HiFYdEKLbJrD1TYLl8rR5mk7UIB4fg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FSe/J0yn8g9jv6/fwGttqbUSwhE+SmCQCwidS1egli7LsCud0cZkZeYELMFYlhlq+
	 QKUBhasv24YaYg4tw8ci9Fx0u7pBYe26/ihZKQfkh5E/xaqBAVcQQG35/PLgcazbNu
	 qv2lr0jNj5dSJENz4MDJeD+4i2sO+1qfTDm00cvyi3CGSQUqpbWVv82aKoCR5kJdbM
	 w8T+eNWegg+mEfJg3RCNk4/cgTxlmZIXSiTHdChT3xaB1RFfu+ATHSXJ71CkznxGuo
	 xfel3rE1dqA42Al3ik+ws+DKYQlY2AiMyM7EzNf8/FOK17IobPJKHL8yIZuvXJG8vj
	 aKNEyrAL90wew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:08:49 +0000
Message-Id: <20260804070850.4169A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added dt-binding macros use the misspelled prefix `LAPSS_=
` instead of `LPASS_`.
--

--- Patch [3]: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: a=
dd Audio IF clocks ---
commit fc46e0e8ad5b4e05db5d3982d7d3f2cb53429499
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks

This commit adds the LPASS Audio IF clock IDs used by newer backend
interfaces. The bit clocks are requested through q6prm by platforms
using Audio IF module backends.

> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include=
/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index ca84952c38841..2e879a3c09aef 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
[ ... ]
> @@ -237,6 +237,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
> =20
> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71

[Severity: Low]
This isn't a bug, but there appears to be a typo in the prefix. Should these
new macros be named LPASS_CLK_ID_ instead of LAPSS_CLK_ID_ to match the
subsystem name and the existing entries?=20

Since device tree bindings form a stable ABI, correcting this spelling befo=
re
it is merged might prevent needing backward compatibility aliases later.

> +#define LAPSS_CLK_ID_QAIF_IF0_EBIT		72
> +#define LAPSS_CLK_ID_QAIF_IF1_IBIT		73
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804070307.1171=
19-1-prasad.kumpatla@oss.qualcomm.com?part=3D3
