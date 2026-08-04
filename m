Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C7932B10D
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827511; cv=none; b=eLRJrOZyQCjG+xFzK8AQiqA5GjSysbs4gAqFYLQ+KfjFMYzVv4aNk/w51ClCAihs5nO5/H4ORca2aWtplBT7UJajosiyk8dAm8rqfudln3ziTt/Hr2BTjanBmT5t/Kr38yJLclKL3btfL7uFqO4q/g1MGhw3O5VAkbrJE+mW6VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827511; c=relaxed/simple;
	bh=rnQJJFQyPZnOQEpCYSup4RW11AApRih9Vo/a/6/CyiM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jJmqBlqdp2H5bIr7Mny6zj+Q7Boqw9beLavllAGVuZSoPIGir5AeRwmnuFjxoAyysZOJ4LaJo1rp8UCJsveZsjSbyoywPcQ8hIIcxaiGJ9VGde45RcU36Nt4CfjNp+BWSJ6h45Hhb0ESKCy7wb47GH7gwPmVNE5TkNDuzrjOFoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbyfnfkA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbyfnfkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23321F000E9;
	Tue,  4 Aug 2026 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827510;
	bh=byBevn8AQ9zrN1v2swZFsdfVmo/IfOVHDVU3N734/+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbyfnfkAYsb2raYkmxewF0mln0tIllnBjWcJEPCn4zEtJj3vgRpOlNUkH+wD5bLMg
	 B6smWxY6i9PBLAYW4oXevuFMl9WQKlaaRmB9kxdLxK0co7sNwyE+xIWcrSQoDsR0ss
	 9cVHWumXn1YZWIr3NrAQeXuPNKyI3ZB6o5xFIuiMTAIy8SabaJ4fHwgnXTn4WKl5c7
	 XhyXrvuDuTi5ECkj8tRNdvr7EEKSb+VoYXyPNeb4ipIgBicJ6ceLDvy9UudQOhGvbi
	 xJmj/dXWWTDQPwWPi/opSTTbGojEkLJIiMkWNiWBh3svD4r6sAepHeJ0Os4PZR7FjU
	 Ubd3wB+kJc5Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/7] ASoC: qcom: q6prm: add Audio IF clock IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804070307.117119-5-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:11:49 +0000
Message-Id: <20260804071149.D23321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added clock macros use the misspelled prefix `LAPSS_` ins=
tead of the correct subsystem acronym `LPASS_` (Low Power Audio SubSystem),=
 baking a typo into the Device Tree ABI and userspace sysfs.
--

--- Patch [4]: [PATCH v7 4/7] ASoC: qcom: q6prm: add Audio IF clock IDs ---
commit 92df360c5a0420b85998ac3f1d9ff28298be694a
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: q6prm: add Audio IF clock IDs

This commit adds the q6prm clock table entries and internal DSP clock IDs
for LPASS Audio IF backend clocks so machine drivers can request them
through the APM clock controller.

> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q=
6prm-clocks.c
> index 02dad9ee98049..f613e2aee75e6 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
[ ... ]
> @@ -64,6 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] =3D {
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
> +	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),

[Severity: Low]
This isn't a bug, but the prefix here is spelled LAPSS instead of LPASS
(Low Power Audio SubSystem). Since Q6PRM_CLK stringifies the ID to set
the clock's name, this typo will be exposed to userspace in sysfs and
debugfs, and it will become baked into the Device Tree ABI.

[ ... ]

> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index 938b1bfce2873..cca77cd92bc17 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
[ ... ]
> @@ -97,6 +97,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
> =20
> +#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT		0x500

[Severity: Low]
This isn't a bug, but similar to the above, these macros use the misspelled
LAPSS prefix instead of the established LPASS prefix.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804070307.1171=
19-1-prasad.kumpatla@oss.qualcomm.com?part=3D4
