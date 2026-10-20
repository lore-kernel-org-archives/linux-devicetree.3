Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515883;
	b=Y3wxIPxfMiQ5LqUooBbpJ2VyRq1E9sMVam1n6Q+7iIYSC1aIG6v+miuAwk1y0L/qLDXT
	 wCpwwcmEl4CGHHKXGZ5PoSJENat2e4GmUP2wYa8tjNDNQgpVRNqk+PrIZFqr7ZlQZGm4S
	 txZeO8JhcFUICLbXqx4IYzH1Vd3zVSOcnJ5M92hyMc8ePcueVd0ZJh7Oi7IzusPCGBFei
	 jnRgemlXna8CtBl4V0hdWX4kJnZGFN3Gku6+USSQjZflKo+/ArruwcVG9JGFnzBBQg0ne
	 aG9VGP4OjYtq4CkGOP1V6XnGppIxeiXulQr4RJwO9178FODmQE/xp2ga2qcY4SkByaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515883;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/NkHEc14ap9EoiYBL29jm9IrWSVRdvFivLVyYI25HxA=;
	b=jFSXbpqHY1Le6zUeGa/zefCHHxJ7LC+GT8fQWTrBK5g54L9oo2iRFD/V4YJxakmTJH/5
	 AG0F+nc01SUgAiVnNXzSm25VeWIrkS9FVRXyoD5cK5sTTZkpi9P6GKA1mkSss+hF55aSB
	 G829ypXkVySB9m14BB60wfHC8t/JwRqSfbcgoUSWl4G9ngAaSAe8EaSmX1UH8DCTDIFQy
	 PhBfjqOVujvhjwwGdZrqfQmk5x1M3b73T2zwaIibDwVIifqlfEQ3ZcuD1K+p5qX9uy1sI
	 NkHvO2z7e9a1y+FtTaI+WPeR1gKFRq31raSC+ULecN+I4/f940XRQKBqj0zoX/Lsa6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Umvi28FK;
	arc=none smtp.remote-ip=95.215.58.135
Received: from mta1.migadu.com (out-135.mta1.migadu.com [95.215.58.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B2D606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B2D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Umvi28FK
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xIkcM/Fb30wHz4j2T9hWsL27wuK1xhSJcVgYRRZPvLk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515880; v=1; x=1793120680;
 b=Umvi28FKRZepfS/DRoW4dyF5barc4Na7Z2SgA/sKcMqgdUidhvDbV0AJcvHIcz1UXeBD0z2t
 cAhMBGb5jabvqXl/TDRMTGgoko/Rdgx2YxJQ6u9WnHkP6xLFZMC+eoI2aW58St+mvMw0uHfOB+o
 TUAJS4oIgkapPT3vuZcE7PMe+gbInOihz9ikOgB7rsn1EGJR7FWvPiOlbeUpb2jqJCy+K1nbh/z
 s2hmCyf3R+eVQP6MlGxIkNtUuzmM0LrIZxp5L11mHCQw6TcDYr6DtAcVHED7BjCenLGiGXdqXSf
 zg2eb03Cfa0SmnrFywPWyg+NSP9wAbKBo4mYj6QfEEdtA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d8308d482c88357e;
	Tue, 20 Oct 2026 17:04:40 +0000
X-Mizu-Trace-ID: d8308d482c88357e
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in typec_report_(un)plug
Date: Tue, 20 Oct 2026 14:03:27 -0300
Message-ID: <20261020170341.1641325-4-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020170341.1641325-1-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mbhc->cfg is only set by wcd_mbhc_start() which is called by the codec's
set_jack op. wcd_mbhc_typec_report_plug/unplug are called by the platform
device's typec callbacks, which are not synchronized with codec ops, so
a hotplug could be reported before set_jack was called. Though unlikely
to happen in practice, add a check to be safe.

Found by sashiko-bot via review of wcd937x Type-C integration patches.

Cc: stable@vger.kernel.org
Fixes: 0c105997eefd ("ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 850be84d65ce..fd40c1686d66 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -594,7 +594,7 @@ static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
 int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc)
 {
 
-	if (!mbhc || !mbhc->cfg->typec_analog_mux)
+	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
 		return -EINVAL;
 
 	if (mbhc->mbhc_cb->clk_setup)
@@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(wcd_mbhc_typec_report_unplug);
 
 int wcd_mbhc_typec_report_plug(struct wcd_mbhc *mbhc)
 {
-	if (!mbhc || !mbhc->cfg->typec_analog_mux)
+	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
 		return -EINVAL;
 
 	if (mbhc->mbhc_cb->clk_setup)
-- 
2.55.0

