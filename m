Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795748422;
	b=ut1OTWmlEbRolDkcWUeEnod/VOIGkBWOCdCpu819it0kIcpy2v8dLnfeC6IAht/pSXBW
	 Nr8VTQ7uMYm3FWwWPcyG/4brPJR+SjgnoX/z76v6i5biHZ7tEKV4L3erllh0ZD+Xw6Qg8
	 IXKK5lsWOt0X9CaHT9ChsvheIIdhwnlgYEyeTAaT4X0EjWmWwkBG7wGWr3ZhFyhdFk4E6
	 IRBqYjBWbfhMDsrephLFThUg1Ug+6SGNFRiJYHlZEuua7A8oQN2oP+aRlXgUGQeliQCFI
	 NQn9JUponfDEavuGI4nkP+T+MuqjtSyKyK6q9Ux1V4i77dRG8BX0/dBp6zUjMl6vb3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748422;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ToQWodcxbp6TDI4d7JfrnA0mE0aAS8hR2DG78GF23so=;
	b=Q6PLhiXJsa6IwpP+NlnASDreFAGV6El00sljZqhOSN0oXdFyQMW95UKT66OAIz3jmaxx
	 Wfxd43Eql2yftoksSL8+JhNAtKl+GVMIZ1MYw0PhaKLgJ5AjT9pCMOgwBtJmgyvwMDEq1
	 +Y9ycVMdyeAKlTHb/hpWibTR0aEHplt/BoqbWy66NRA59hGvEGq7SqQG47qzIKJfnGW40
	 rpdgIiCWujkefdunLF7P+2gn83bcDQHcU52xKwHxOefwoWTvQ76govN13uT7NKSQ6m2NG
	 eXzOxtRHGngHg22+k1Xh6zeFQ26/tP9vfnnTKdDYCEr7NNzE7J7ey/zZP7ier4QD62A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIHfEZxz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5B606A338;
	Fri, 27 Nov 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIHfEZxz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748421;
	b=KxHcSQFTTYCLx/YjcE7X0BuqtIR/Me8LLOaUFRAaeiz9h0Bg5zrUwoCXu3ffASnIFw7j
	 JDaLAwwTdLloYDNM2S6nzQD7uhYTE/Vh9zUn/TMKjdlmRU7nxWgxbKDS0BfDkB1iXY5mr
	 6r4HoWxJUWBwps9p3t3BEXEL9QHKocVoM6ULCEfzXO9AsRs0hzPZPbtOG0UL/wSouniEL
	 J1HK2Z5vgA1vyHpo9dFDShHFtbuQDK/lLINknvfqel33v23jnIy3O0W7Bd/9TTPNoYrla
	 5wFnk+B96E1EfqB4riWi8WDn+ihQOeNaHR4y8bSe8LQE5lsT3mm0fA9aGoKmpW1+65A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748421;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ToQWodcxbp6TDI4d7JfrnA0mE0aAS8hR2DG78GF23so=;
	b=16bCMicUW9uzypO5rMVTMHefFKtQLFWrN1avylCgT8YlJEYjeDqbvEB5yBR9w5euN+4j
	 VorPyjzkQCe/h6CwNaM+a+Yv5GCYc+aSBkzUYNEbj2wXiJ30waPVeUztTWDOGTwap9S/p
	 bre02UjmFttMpU64tdfjjbmWilmClSSLTB36dZBffGU1IcJo7Sy8m6gvrjn+1NZ1NenZF
	 lsQ+MhjESph2tJt3/vZtRd2EZoys7vFdOFYK+1cayln4soRlBnXaqJSiABlPhDggyUn/4
	 4oEfBPJ+hhiPt1N/0gqK2dQG7C/HJogJ21raPCTrdxJ43eaVIwLRWFlhbPj29Nr90cg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFD051F00897;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748421;
	bh=ToQWodcxbp6TDI4d7JfrnA0mE0aAS8hR2DG78GF23so=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=iIHfEZxzUErxrAs+7fdTyUdshFbQZvhad4bYWTRrujxQ0p0ebd8aq797tVFucPMq8
	 lf/L0A5nZqDSAA4NqDogOjb7Z/4+qICtfklj7ahUJUnMplnMVyO3PAoUK9mlMzLKph
	 ra3gkZPGLxP+Zj325ekoNzRrjUi+AGXG6bLpeRI39rf9ZfYJnrrGVflmwXgnORLdqI
	 Rylv225BIawdth7qQ5/TnZYoc8JtJgiImLhCfqfg37rAgQ2kIPvJ+ZPCKpZLNwRBY6
	 cXHAa8frMOdKiebBInHKPrpO0aDpclhsXVa9gHlcWxYMvDiQS/Bl55NDIQ/pMU34rX
	 owsrZSLLYYq9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 320ED4B515;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: amergnat@baylibre.com, me@adomerle.pw, 
 Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] soc: mediatek: pwrap: Add MT6789 support
Date: Fri, 27 Nov 2026 03:00:09 +0000
Message-Id: <20261127030009.10572-1-iasnezhkov@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748409; l=1101;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=YvdzdmSvb+O0Tz8QIZiIDOVYHG627P6PfzDQt/Lq8Qg=;
 b=6ol1S4ut2o32IYsWppY97ebccrQQdihnqY7cQQMQ8JdejL4H5wJdiPHLSvNOUN8CCy9Vq1Tk6
 0N4L6GYMyQTDB+Q5Achp3Bh8N9SBikFzrk2bdEvG0gWLoxIIcQ5DUct
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com

This series continues the MediaTek MT6789 (Helio G99) PMIC wrapper
support originally posted by Arseniy Velikanov (on CC):
- pwrap v1: https://lore.kernel.org/linux-mediatek/20250715225746.1321-1-me@adomerle.pw/
- v3: https://lore.kernel.org/r/20261126031001.27288-1-iasnezhkov@gmail.com

Original authorship and Signed-off-by are preserved on patches 1 and 3.

Changes since v3:
- Split the unrelated spi-mt65xx binding patch out into its own
  standalone submission (suggested by Roman Vivchar).
- Add sender Signed-off-by on rebased patches 1 and 3.

The v3/v4 rebase and arbiter fix were prepared with an AI coding assistant.

Arseniy Velikanov (2):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
  soc: mediatek: mtk-pmic-pwrap: Add MT6789 support

Ilia Snezhkov (1):
  soc: mediatek: mtk-pmic-pwrap: Skip WDT source and init on arbiter
    SoCs

 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 50 +++++++++++++++----
 2 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.54.0 (Apple Git-157)



