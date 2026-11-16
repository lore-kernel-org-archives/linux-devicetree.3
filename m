Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825729;
	b=Q4DBw3iLC6/hsnKJDVh99lhESCC3/rlPJsoquqVxBIw6KCiRtzNAppGCHQRDa9WKhwSe
	 h4a2aUAoG6HE9NiyKI5HI23huzOPBm9blZcqDj7jw/Ry10+lEUOhBL/QWGo7NzfRU4Q8d
	 a837Trk87+X5QYtZUfsLqolp3rkXLcrPRjF33atkN8SEfHd6Ew7rT3EsmCl1cOtU1dkFi
	 cJ4Db73RaB08NJ5VlJHmEGq3K9r5J87PPdLqdkB+qCRT01GRBmSR4KQHYNmRl2Q3Ngyrc
	 RtC1uxsqKESb/7msvT03ckPnnHe5+a+mhjc9TFgzrV7smUgo9RZNTsMtvrAxU7XOQQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825729;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9Kh85tLJFjvgV1Kkg/129i0o+Be5JMoyqU8cAKfB1n8=;
	b=ytsML0X6fVOBIoGLj7Xu+52KSrs1oNe8q7oqtHR+lwwSrIOQIA2imZcCQCbemG7MrWzL
	 JaL6MMF5D5T8UiV4P+E/Pgn9+gJZGk49z34lzQnYbMdFD6IvO2OFIhCPGlliuqEI6Qq4G
	 VuJqcHr5AUAQKIgVky3EZxAWv3bjeDT4Bd3VuSHaDYoJoJrDfRmgg8SgLCDB+yU6joN+K
	 Y84zzIxAket+7icb0VW7PPkR/kz4axehi+3r1mdtWqrXBBWOo8WoUyUMX+oeGyQ6xH3H+
	 5o2pFhW4TLiR+0w9kiLxsGrBsOWZPUpyEH1jrBMU5Wp9gUzFLFKDEOunE2JaDmCY67A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QK0p6Xlu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F828606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QK0p6Xlu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F0D1F000C4;
	Mon, 16 Nov 2026 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825729;
	bh=9Kh85tLJFjvgV1Kkg/129i0o+Be5JMoyqU8cAKfB1n8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QK0p6XluhAcWNNe/SZ7JoX+fl0Ac1SMurIXpIdmV8P8UpTKG5likMf4GZw9hhotno
	 spmu+DorJxQQoo+++PAsivQBLpk7CT26AeKibxS1chSNsOinSrOmrKxMmL80LV/Lv0
	 Nj7koZRNgbU0U/cNZyfo3T0pSAkuWx5DFVOtsuJDVnjz6LHUoTUTdd2FO3UBdKFArh
	 i6mQ3fKaGavcMUSUHSX2fQrsMzXTr4ud5WG0GJZHoZcFTBqOIfKrAMizpMY3Rl5CMf
	 wCEG2lOlJMCMXa2wdfsZhaEHABBGKSscD7zNFa/6rg6yc5DL7eTWbshT+TnRaswmIM
	 M+FcsAWuN9LiA==
Message-ID: <sashiko-outbox-216753@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp257f-dk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-stm32mp-imx335-fix-v1-1-01f538260f00@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
 <20261116-stm32mp-imx335-fix-v1-1-01f538260f00@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:42:08 +0000
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
- [Low] arm64: dts: st: missing Fixes trailer for commit 95ae2aa3caf0
--

commit ac59200a8a81d828de4ac31a7acb35a1002f80fb
Author: Alain Volmat <alain.volmat@foss.st.com>

> arm64: dts: st: add delay on imx335 reset gpio on stm32mp257f-dk
>
> The imx335 reset gpio is connected to the sensor reset via an RC hence
> a delay is needed in order to take into account the time needed to
> reach the level for which the sensor sees the correct level.
> This prevent having imx335 power-on issues due to the fact that the
> driver is trying to access to the sensor while the reset hasn't been
> yet properly handled.
>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

[Severity: Low]
This fixes imx335 power-on failures on stm32mp257f-dk.  Should the commit
message include a Fixes tag for the commit that added the imx335 node with a
direct reset-gpios connection:

  Fixes: 95ae2aa3caf0 ("arm64: dts: st: add imx335/csi/dcmipp nodes on stm3=
2mp257f-dk")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-stm32mp-im=
x335-fix-v1-0-01f538260f00@foss.st.com?part=3D1
