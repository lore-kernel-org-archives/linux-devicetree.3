Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A9550EBF6
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739455; cv=none; b=I8duXp7FDcYlg6toSMJxjNqEaHOsusi/nLNl91bJXLI4x+ToH3WimejIUONNjSLj1Cr4T3XqPE92DL2iFwxUXdg3wB1YiT1i29dfTA2x4D4zloPEFkntKPGLMWjshPBhcKztNl+GNk0JiTUNW0Y3f1HGbKZQTwL1sfAhMizE9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739455; c=relaxed/simple;
	bh=IukJ9HPXEZzmQTs3Rh8RIUC0ngERMHES7LUMqGF/C00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YoZEjj01MaHPYKNIKGictbJBqozhi6YGR/auuSxv6G0HZlJ2HaVwQXydHi96hdEpIMulQYEGM9Sf9S/pWqeniN3PTYcI1G6cRKtGp0yHGJ6QTibWxCa+G41cuVwzncQLUQssuaXXr1LxhYqt3qo5RILXFKAG0y6DlXSKDOJ5I0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYJkPtIN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYJkPtIN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B431F000FF;
	Fri, 18 Sep 2026 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739453;
	bh=1DcYho5IjFylLDuKgVXa53DsFwogK8plbjqYn7+5BsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYJkPtINKuXymzxg0n0fnfpLJHwYGFomoF5mT9p4R5jCOnq7/MI1AQqkXbnFRq9eE
	 eehQbGullnQznUYTZpBePPjlWSLwH9htVvHDdUCgURj9mq9exKou4AmwW+rFYNpneg
	 0eG9vmJ/OK1ouOFq7AkXhXTXg1IvrPO0iUWqWJ4eIV96du2uZ4W27QavjQaYk7FpxI
	 mG7ggYHfz7UgybWFs7euMuaoUf7ZwA0hbEgbXdzKcIssW+YvENFSX6p9CaGpsOuNOQ
	 vB/9NSRDbOkg7EUD7lNK11LSXsvcd3+ZigoKPi0XFfgGm3U/ztDQHeQxp9119xk6Se
	 Yi+WUO5SYXMiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] ASoC: qcom: qdsp6: lpass-ports: add support for
 QAIF AIF MI2S and TDM dais
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
 <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:50:52 +0000
Message-Id: <20260918135053.13B431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] qdsp6: reversed RX and TX slot masks for AIF_TDM DAIs
--

commit 055572fdc6d4e48c783378d1d4ba29423dfc1ef4
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: qdsp6: lpass-ports: add support for QAIF AIF MI2S and TDM dais

This patch adds support for Qualcomm Audio Interface (QAIF) AIF MI2S and
TDM DAIs in the DAI driver. These DAIs are used in Shikra, Hawi, and Nord
based Qualcomm platform devices.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qds=
p6/q6apm-lpass-dais.c
> index e204fd59e5129..83f2711bceeaa 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -386,6 +386,7 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
> =20
>  	switch (dai->id) {
>  	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  		slot_mask =3D (dai->id & 0x1) ? tx_mask : rx_mask;

[Severity: High]
Does this logic incorrectly flip the intended slot masks for the newly added
AIF_TDM DAIs?

The active mask is selected via the bitwise parity check (dai->id & 0x1).
For the legacy PRIMARY_TDM_RX_0 (24, even), this evaluates to 0 and correct=
ly
selects rx_mask.

However, since AIF_TDM_RX_0 is defined as 179 (odd), wouldn't this evaluate
to 1 and incorrectly select tx_mask? Similarly, AIF_TDM_TX_0 is 180 (even)
and would incorrectly select rx_mask.

Could this fundamental mismatch result in zeroed or swapped slot masks,
leading to audio failure or dropped streams on these new TDM interfaces?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-qaif_dai_i=
d_support-v1-0-ed863c0e5e45@oss.qualcomm.com?part=3D2
