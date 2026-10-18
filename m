Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169713D6478
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318726; cv=none; b=jbgk5+vO9Vpm+qRQW6YgYYxPYmlpWn0Iw4KXAbeqpyA9MGJBJbGu06vDPAM3nRHqTnguzniJYPZEUsoxUuem+04IsDpAOfhD5L/ajfGyqXC2L4Y3cjnTFUjQbF9YGTnr6H9w3utpY9R+8mVVQaX+tOsqweQLmEEtdZ9HMMibGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318726; c=relaxed/simple;
	bh=Qk2A3Ng49JvEP4XBMLZ/d8qcgAPxfwhjjFg0wL1puf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/om8kO+y71cxezhPu00npl/wVbLSnwQpDkEAVXcUCIiSxWkZhPE4pZmza4E4/SumUa3LlVxQLJAcCyvO3eVyv2kB/8VpwPSfiivwm5REcAVCeUF2Bpq17IFGt/hAI3cuRFZCZyc4O3UeLrBABPVCIoFcr2I2QeAUAFFnsDxOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bsIiYVP5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bsIiYVP5"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d885929so642960f8f.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318722; x=1792923522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQNZ6Re7mqkz64OCBvW/WYYm6ii+FqgQ5/P5td06ppY=;
        b=bsIiYVP5x/ik4LINfMEpmcTWm6xfqOS73fbtAGhtvTzY066fG9SepR+dDZpynSo7ge
         +Oq5hwW9SeA9HpOYEO1kMfwAOSRMhFU+qTXuTdAgXIQvL0kMUd9/o49B/6PhHK5yRiMA
         WlfCc77VfCwTncwr+SUvLbnUTEikhtLeQ7Z18yxDZVwm5YhP6agvVY3w6cwUStMy/JwX
         /fqSRBPM5hvyPj4c4fDaP6xqWHlsx4arLT6EZhuHCx+JKhpOXa23MT4ke5xeDYqEZt4X
         nTwJ+YefwFi9lS4arjxAPibwsOsxk3xO8Ck7zUCYGuMlt7yR2YWaUV7FTN8k1O3gRbeh
         wBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318722; x=1792923522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQNZ6Re7mqkz64OCBvW/WYYm6ii+FqgQ5/P5td06ppY=;
        b=bhSe9WCLd1pHc1ec20FN6rmKqjZVNsR/p8ltt3byt1RiCgew23nErAphd3PxAcjB+y
         e4CCgAaQ/Xj6FeI+ntrLNBh5VsigMQPTj8a6Tc1fpxs8cmYW7iY6KhW1a5bam7OS28dj
         qm40nYY9+BN7T2sIt1HS9mPzFzb0Eb+PAQ5aoDlvfEAEq3rP9ikWMixVt4G9vgCj3gpg
         6D6LcpfNneTa7j+y9TZGEZP2duyW+S9IVbkBu8b0EeuJ2UAvNoDGDgkiyxjwPfLXPNYl
         Dsp7icZUY0bSO8w3e0x/snXV9Km2WPiXOv2iznCO58EEtKrAKn55deYnLDn3dSie5QkT
         /K3g==
X-Forwarded-Encrypted: i=1; AKwUvBwi/i/sIFRi5ytaGHcmbnmryRWKK/7e/q87SVibVp+PP6VxbPmr954ttoJRqVwnuXYp/YGuIV9gKqdf@vger.kernel.org
X-Gm-Message-State: AFq9FYKB5xrzIY2jXr8pgb3XOK7w8B6oz7faL6+YPEtW1Af9U1yVdkdj
	1/Ij1t2g2FKqqpq0IgJrGWmDjU9aS0+DMlqKklNqqnvbVqyyR/d3fQwoIkN+Hlliilo=
X-Gm-Gg: AYBFou0Mx3V+zMApk4Zlu3LwacJZy/x77nJ+FMmxzHkWGelpedEGepaU0Yg+LmXgquP
	SgkeHE5I6Rr8Cb0/9hfzXgMJNRH3gmIFkaj6GTV7p2Zh68tHZOg/evpWeJ7UMfVNrOvfAVnwXZd
	2qOpkDnHog/bYBFnwvMh9/8uyeHVpiTS/R61r4rLxj0o4f9MVFmqZHBNECAS0oYKMJp3sOWEIK2
	IshhauwQInFzJxA0v4mg1x3n0Me09QvVrwXSW9cQlzJ8Jy8TyE2grZMR7dgyDowujnyky5b49sf
	k5oT7cSUbmhh7Ntfgq6yjjBIMEr2B05SlM1PRvArUxFxJV2KZgDGzL/MJSWjyP7ec6kPD6JEHvB
	3ox2osMeaUwnxjvX7hKWaJXxh/eRpCsT7QFToZc5zG7yNOPLJZUk+tDM+SVN6u26hxVZKZFjQ/6
	HZwp4WT1jiDD4prIIA7R6BWCCBOO/gGAYyBqQIwiTHxHkjw6HdTrvnmdyQUFB31XKbRKtkBt6uK
	sKiziQ=
X-Received: by 2002:adf:f8d1:0:b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e07faba02mr6857938f8f.41.1792318722254;
        Sun, 18 Oct 2026 03:18:42 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:41 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:00 +0200
Subject: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Qk2A3Ng49JvEP4XBMLZ/d8qcgAPxfwhjjFg0wL1puf4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vx+EWnIz63dfPL3z2jti6pr5KfoJl68WJOeJRBh7
 XW3dMK2jlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExE8D4jQ7ODszx/o9TVn4E6
 i0vfrDTQ/e1VIPk1T8lh9kzuRZ7HfBn+6cdnxNoXdBupWPpFRPELfb++0FJJdKV5Ydfp2K8XvYv
 ZAQ==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

A recent Sashiko review [1] on this code revealed the following problem:

  If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
  and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
  snd_soc_dai_active(dai) remains 2. This skips disabling the clock
  divider.
  When the streams are subsequently closed, the ALSA core skips invoking
  hw_free again because the state was already changed to
  SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
  enabled, potentially draining battery or blocking system suspend.

This commit resolves this problem by using the 'clk_enabled' field of
'struct gx_stream'. In particular when 'hw_free()' is called on a stream
the code check what is the status of the other stream and then only if
both are off the clock divider is disabled.

[1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>

---

This patch is unchanged compared to v4 because, as I mentioned in my
reply [2], based on my understanding the race condition should not happen.
In case I missed some corner case please let me know and I'll be glad
to fix it.

[2]: https://lore.kernel.org/all/d90324be-c43d-4d28-9f1a-e28e437031e8@baylibre.com/
---
 sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 58dce9f08c9d..70ea39c77b32 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	struct snd_soc_component *component = dai->component;
 
-	/*
-	 * If this is the last substream being closed then disable the i2s
-	 * clock divider.
-	 */
-	if (snd_soc_dai_active(dai) <= 1)
-		aiu_encoder_i2s_divider_enable(component, 0);
-
 	if (ts->clk_enabled) {
+		/* Disable the clk divider only if also the other stream is not using it */
+		if (!other || !other->clk_enabled)
+			aiu_encoder_i2s_divider_enable(component, false);
+
 		clk_disable_unprepare(ts->iface->mclk);
 		ts->clk_enabled = false;
 	}

-- 
2.47.3

