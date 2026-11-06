Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946178;
	b=PUMmxsyOtqWZrycD6nHU/2OOmGjgbxFaBiLDbHIbMKy9jspZgPqtTB+YuORzwz0vtfNq
	 QKlc1GPt/pISaK9/7TcBvsv60ICb9fyL1aS2qdxOv337b5y66DP9kz/rjzq/RzcuP58yh
	 TqBfV1Ba0NybVJ61VjFd8OCKP34+RGebbDPGEkPI+r6fOA9T5DgkbbojVpmAVv5pdq3yg
	 M172xrUYjz79muUaBkdIoQHSSpAkE/96qqwIzQItjjE7hhbq8af6M2gL2+9ucQzRzjY9B
	 97+42nylxE4MZn9szPjHl0Bc3Z/wPapDPe3KD+uBOXO0jlDkQHoBXQUsmovECkY5NRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946178;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cngu9erjAfs+mQ/psNredywhqpPTmus4IsfYIKX+VIc=;
	b=maeqxwG8EsN88Yv1yDScj87jJ0SOHCtUnBTa6asVuAaSkZYSweTlIaFDemOwV0lFyvuP
	 ASFyYHQoWDNHMpl/hewAZJXJbaUG6vpEK9wrQ84U4fxGSeHKNw9bXJLMOmA/ehwE5pOyt
	 GzcUep2iUurlDH8CzN+4QxFqJLTjjz3nwpuFlZTFG/bU1XVEiKlbs/TtdU9yFQzwaI5o2
	 NQKbnoj87oGVbi5Sz8TCKmeo80BjBvtugXhUwu/IoKnAtf0qLGKXrolo58K5CZiQ8H5S8
	 Y+ILh+3Mhb6qD3dIjzchbzZI1+U++GDzqTBQHjdp9/0x1TPRuvTXT5nmnIVhzFOH6GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZAsXBab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F430606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZAsXBab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087051F0089F;
	Fri,  6 Nov 2026 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946178;
	bh=cngu9erjAfs+mQ/psNredywhqpPTmus4IsfYIKX+VIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CZAsXBabys0OyJDf2cwiQhJgHue1qE7/npKYqr8oKez87Fc0soRnBsIqWRRBGSCfl
	 rp3/zambFVp+YP8r3439pwQVntq57Z+KRtbBAzLvYfGJMD8wWw+l7EikporbRHTFCb
	 O6J7TCzVZ/We1PkGOl41LIpO1wshQfs3kdwuJqs5zLRImD76CzFpjjC4ivXQb+HbGE
	 k676aSHNMo6Ze+LK+ukxutkBklb3sLFr1SBZi/yinJxTTF0NG1+BARNA4J0vffnQxi
	 x0tUCvVxtrGgWKtnkCdpMfeChvFx5mh+qaz1+KWMTpLvgICrmWvZ0V5w5XMYLhc6lv
	 SZpEkzGL9EB6g==
Message-ID: <sashiko-outbox-200889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] mmc: sdhci-cadence6: program PHONY_DQS_TIMING
 for extended-read DDR
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-sd_cadence_ddr50_v3-v3-2-cb50afece614@altera.com>
References: <20261106-sd_cadence_ddr50_v3-v3-0-cb50afece614@altera.com>
 <20261106-sd_cadence_ddr50_v3-v3-2-cb50afece614@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:22:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mmc: sdhci-cadence6: missing Fixes trailer for commit
  882fb340a956
--

commit a251f955cff38a0f481d2f8c32d309cec95d2889
Author: Tze Yee Ng <tze.yee.ng@altera.com>

> mmc: sdhci-cadence6: program PHONY_DQS_TIMING for extended-read DDR
>
> The SD6HC PHY left PHONY_DQS_TIMING (phy_ctrl_reg[9:4]) at 0 in all
> modes. Per the Cadence DLL PHY documentation it must be the rebar (RE#)
> pulse width in clk_phy cycles minus 1 in extended read mode, and 0
> otherwise. Leaving it 0 in extended-read DDR duplicates one DDR edge
> (the silent odd/even edge-capture defect).
>
> On this integration the rebar pulse is 2 clk_phy cycles, so extended-
> read DDR needs 1; confirmed on DDR50 hardware (1 captures both beats, 2
> corrupts reads). Derive it from the extended-read-mode state and apply
> it only in DDR modes, since SDR extended-read samples a single edge and
> is unaffected.
>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

[Severity: Low]
Since this fixes a hardware programming defect in extended-read DDR modes
introduced when SD6HC support was added, should this include:

  Fixes: 882fb340a956 ("mmc: sdhci-cadence: add Cadence SD6HC support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sd_cadence=
_ddr50_v3-v3-0-cb50afece614@altera.com?part=3D2
