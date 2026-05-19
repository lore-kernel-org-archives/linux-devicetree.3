Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E881A9FA0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183893; cv=none; b=s3Kvk7arPk3EeLJPZ2OPBuVzOK/9LMpmv69SK78QcIZsfP4PiIA34h8Sffwdy/IUcY6/StmvAEvQK22P6lDkZGnmVgU8U+p6lUmOBcnIdryvf9pr4/CYUEO+UhwS2+3LYk5/qclM1ugWJnGvU7z7ebIra1GVizvhtdCiIIDYNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183893; c=relaxed/simple;
	bh=FTYTczIc1aBAyK6mj/W09ziIoeWgN7l81aDq6c73bFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g8sLdFHJ6Tr2w9T2S8OAZTxPegzqrNX2tNCnh7WrdLBIN8+pEW3vS5hEv/ksIBYg9dT4RGTOi6hI4uAoFCKZXHh9Vk66EMQyzdwRXed7Rj4vaZLyOeC1kKhBdS+8FbcFJB9Cl4XCpO+9LvlcjISVyNt1kp2yJR3LeA0PRc5hlSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=whynothugo.nl; spf=pass smtp.mailfrom=whynothugo.nl; dkim=pass (2048-bit key) header.d=whynothugo.nl header.i=@whynothugo.nl header.b=iqrZmEo6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ystsk0Rv; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=whynothugo.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whynothugo.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=whynothugo.nl header.i=@whynothugo.nl header.b="iqrZmEo6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ystsk0Rv"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 9325BEC01D2;
	Tue, 19 May 2026 05:44:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 19 May 2026 05:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=whynothugo.nl;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1779183890; x=
	1779270290; bh=3YXxLOaltJYYk3/PlymhQ3x/UTuqn9AmNJdc8Yf+frg=; b=i
	qrZmEo6bxtJdjQ3AxkHRv9M9aKe8r0nJAT8BTiI7/Zg8hApkC7OtAXeFcEh66jWS
	3jj4Mu2Lf1HknXQ9mgtWlkACL3kAud3jdXG1kTlmGbqsbJfAWPCiNAWzT7//EXMj
	6pcnULXjFEZsGk/uVr/a4ThVaEzMdu4FxTK5DPTxqeVlVwPjf/JbkqU7Dfy7+CfD
	DHjj1FRnMCjTCbsUcwQ545OxnhAr4JKKa/jXGHoI2U7kX3sJO9MV7vjnnQCN95fY
	tiCxOAf+qT2d6J3EZCZqd5/KABMyuXIy8Fj2Eaq0kl9vpt41gpqsce3siFL4X7ww
	BKJJlPiqJu0iuEE9yk1RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1779183890; x=1779270290; bh=3YXxLOaltJYYk3/PlymhQ3x/UTuq
	n9AmNJdc8Yf+frg=; b=Ystsk0RvA/fA1rGufXb0WS6+vaYJHS6wUl5+6C94kTE2
	XPBLAuwAo7F11nmgYD2ysIIOBKQq+dQdsY3KnVQLRiIW8miHdPEVxJxTcMxZdpo0
	4qFkm/TtcR38ZVs+kFWIfbVY9pCUu+Y9qmBG9ppMcqzk86GQGWYiPyBrlnRQ7ab4
	1dkaWQqBCYyzJ5sgnb/gGkkU68pdj3MBMuZcphjVhAJeTES1c9U5KlozuQiFJdCG
	c5n2sexYjqXRI7nTy2F4OFiLlWI+qrgfPs56JG8J7gCFYQGzT3lE95rUbTOiSZSy
	i+HPlEz0rd8CwlxaiPvKa7lxpyPUhaovzY6l6apsiw==
X-ME-Sender: <xms:EjEMaoJbgspDhgvBlX49MjHmvKNU6lvAjVUi1ZOblWNgNE1_RJ27dQ>
    <xme:EjEMaprsMPVav_5ISayTJg5zD3Cs4FbHWclpTQ-J_JJF-jTn4wewKsw0gyRKSfvlL
    _wI3cJnO2AWR5l20GX56BDJ05_eL7NBAshnB2VcEXR5vqFPxrZi>
X-ME-Received: <xmr:EjEMaozWdDnKskFFQaFfOBcdGlJZ1TmJAGywSm1Et7-Q8jEqNdx4mvsD8QuHvCvpjcuWhGuC1aATwiwn1zE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugedugeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefjuhhgohcuqfhs
    vhgrlhguohcuuegrrhhrvghrrgcuoehhuhhgohesfihhhihnohhthhhughhordhnlheqne
    cuggftrfgrthhtvghrnhepveefgeeitdeileekjefghefhheeiueetgeffgeegfeekuddu
    iefhgeduheeuheeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhephhhughhoseifhhihnhhothhhuhhgohdrnhhlpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdrug
    gvpdhrtghpthhtohepthdrshgthhhrrghmmhesmhgrnhhjrghrohdrohhrghdprhgtphht
    thhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehhuhhgohesfihhhihnohhthhhughhordhnlh
X-ME-Proxy: <xmx:EjEMalN7jaTpnuhlf9CPJ076tz4bgQSLo72bPcck2QS5U4HN_5eqXA>
    <xmx:EjEMal5cxy1XCzlMEyJUzUQCWV02mySNj6Ui0-vh3FcDLipY6PVSmQ>
    <xmx:EjEMamkJ-Dx4Lgr_YHY8PRw0l9gJrcOpqGA-V_rJAxomdX7OPrU-Ig>
    <xmx:EjEMamSyn9FOfWi8g3P0UxbU4abUoNyEE5fOdIk4cfIEukjXkmYKaA>
    <xmx:EjEMakRMBoRCpls_Dznj-qrGL1WHkjlO7EirREnXjB27bhf-sS5rTs7F>
Feedback-ID: ib8c04050:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 May 2026 05:44:49 -0400 (EDT)
From: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Tobias Schramm <t.schramm@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Hugo Osvaldo Barrera <hugo@whynothugo.nl>
Subject: [PATCH] arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook Pro
Date: Tue, 19 May 2026 11:44:39 +0200
Message-ID: <20260519094439.7918-1-hugo@whynothugo.nl>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vcc_sdio regulator supports 1.8V to 3.4V output range according to
its datasheet.

The current DT incorrectly limits the max voltage to 3.0V. This limit
causes issues issues downstream with u-boot, which refuses to apply the
out-of range value, and falls back to the minimum in that range: 1.8V.
This is insufficient to power the SD card, so driver initialisation
fails and booting from it does not work.

Set regulator-max-microvolt to 3400000 µV to match hardware capability.
This matches the rk3399-orangepi for the same regulator.

Signed-off-by: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index b5c05928142c..f21fcdc1b49a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -526,7 +526,7 @@ vcc_sdio: LDO_REG4 {
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3000000>;
+				regulator-max-microvolt = <3400000>;
 
 				regulator-state-mem {
 					regulator-on-in-suspend;
-- 
2.54.0


