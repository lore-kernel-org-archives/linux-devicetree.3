Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691654;
	b=wPYb4avFqZyoOellMyXV/PCrtVWzWTEjjnIP07wUgqenSzv4SiaPDY+ZCV7AecCIe9YD
	 D/nRkRtHg6xsJYscHG88PNS+xXJCiMfReT0OxnrBKrFnAk8mNKkBosa4aGDGdz8Yp4AkF
	 VGYND+HT5HQOowNesKG3NYR+BTWXpzHQO2VltjAaR0Wq7TXduey4CEipLDDeJne1mYDVs
	 dGYoR7Hy1k9TYkNU+vN2yyMDKjBH3eEuTuHSqJS8+CHTBtZ9KrP7pO4Q0+memARBhiWsx
	 GDp/Ovtj/AMYXFdOZ2aVqs3JLtl6PfR+JUDwIxiowSwIHaazkrCCRPCGKwtChshi1jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
	b=z9wslCFCX+j34czjXgbKFh4F3LguhxbTW0qmvQGU7iPcEioOPBpwOIOdObEKHmgQO0G8
	 4YnoUKbBAIzLzuopNEQPwNvPkdHHlD/+XM7yxk3UVdPtFcb5/3YSAFvUwZ/oSVsQQixXS
	 S9Z3jEsLUMcQE7/QMfWjEL0KvoBFX3sVDZKl3QQKsyDafugQN4LGqC7DxbS78RHOxuP3N
	 p8bmX3tzikdpjXCUCBrhZNkTcUOdLIpXbGjTHUOmA3Y4dJ2dzyJV9UR1sKAyJrAlaPmge
	 55diBA1vj24yUcKnTrti8tbJWF9o42ClKRPh9gTEZHiJ2zOZGIjLfTAXoQDDDnaeKvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYsZINop;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F741606A32D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F741606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYsZINop
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea0efd636dso34850415ad.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691654; x=1794296454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=JYsZINopGAhJD2XdEHbK/2MLYlw2VflxRBMN9jc/T5vq4t3tl+DTLqNY/4pMuEkaJw
         1n2vhIVksD8VbMn1YoZR3tZn9ZGM8ZkJHje1vvsj+dz5o9hf+WBic4Dgd4iMvEjgOtom
         lO8+Bvgzfhsj4SYLVsAjRsPtJL/MmoYpaJNhCs+e7J+rIAcuVysHMsc3Y3Lr6w8M7W6Y
         8EQ+C0JVnEmJ4K2zoBwjZVSaN1oK6mTv2rvqQskFD/XTTlmE5hQlKVEwikveEeRah6UB
         /+c0oeAvBO3dpiy0ZmY/cb1pKVrx6zkVyeQYrtqLRQGBI2UlR5PLaAHdvAjcjdwiIoHV
         /apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691654; x=1794296454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=PW537XyLuDReDWzay1iJmK5iTYfpPGCLlV55/K7HTgb5bWt4yQuOS3zTT8hsbduex1
         BEQqUpmzqh5k+crvnqtJVcsskJMCgqlBkMPsDvR8BWUhl08evBfSLazr9tn5cPKKHGQS
         I9CI1KME9mIYngDaGx/1r375Kavz4KQNseK6eNTixuoJGLJEjXLcfm2+EVFaZbaFCbna
         ZcGeXUYXJvnVK+87PURwvkyukwWezcNs5ZQQXP5R2R0TPnKZjFaZ7ixyfqxSu11H41wr
         VcDGNYFv0DcGSSTpRRjc1U0bmXsHTnCU9bGxw2osVgkB7omQgd7TPd4ScB7Xw7PjBBQw
         373w==
X-Forwarded-Encrypted: i=1; AKwUvByVFlR0wowS0Rd6mgeehGviyAiDUX0m+aa5A5SG0rgEp3O6APObSfChVAQZk1huQ7yfOfW0iCifKTL/@vger.kernel.org
X-Gm-Message-State: APuU4Z8f2joEzMHYK2+vWbdt4UKWMxtotrBgnwOwbV74xCj9Oeb0Mo/o
	kNXwRfzgy8Q4AmdV9eEl7LnIx8SEedzjkiJEuCLwWUHHXgcE99/QINWs
X-Gm-Gg: AYBFou1QImNkEhnfUg/pBx0DmGvnD4pJjG61+y27o5hkPcIDBoTjU9u3NO+wBzadZqR
	npRv7fwi2kh1aqtWan0F8tUmEwd9SOEHdOloG9ZR0TAADyFTxU9eaGXVvJSjO1bb9p4A2SNI+Il
	Bd1/PWCtd3G9ccoDCUbjoL6I4Ol8Wo074WksLUilBnfY9OX/5zszg2ZG4ZMT9C7AwAwBaSKzbUU
	YLCQWJSjQaM8xE6oecQ9udYEXVidIGhDPNQiAbTz/jKhFSnqGrAxXrydhatHTRLzginOeCdr0ag
	YCmREhFcKsL8RyGOlz0FgdJGXcPBhgyyaw461T6qDLIMyA8aoJMXrGsX6WvSLO3XzxExcFcEo3y
	6JzfkaRKQOIwmPOfTKqzeF5vgbHwWIJC9ke+Chs57Gc+4EiogPK3gQRBXQyqWIqX/Ttr6xCBdtp
	eTzkGU8CRZBwYGssMVc+6zESvXUODSEFhymRbf4q8IDszAQKbg7oMJ2qrYfCwvhYZr6Ae7zC1M7
	CoyoSXTNyo2BsxF4ILZ/H8DxHzHpNb3ZWz28B5jQPuakzSnubvkL3LjwRweii2qkzstQtCt3Os7
	qFqawPKcwAmhTin35qx7VOUup5UrE3pgAlQjQNaFTsQZFULUdtHyP91LlBohEswqUyLel7cPxOZ
	++SmZH6hNYS/b1Eel9PNY0HWhnHWLCU+DfMGGdwDuFHPIP78PvSalRJj9/X/N20UVezeX1BdR01
	20jEhM9ag2nKR7rGnSeGjxPl7a
X-Received: by 2002:a17:90a:ec88:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3ae89817e67mr10390517a91.39.1793691653576;
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:53 +1000
Subject: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
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
Message-Id: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hdczG9NEn27ni3LRkyWf48VrrSCYHeqmgsUnxw+t7c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/m/vxd8mT2w9wzJq9zHr7fds5GpJlvk/hZ7rBVm
 d+O7vvj3TGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqp05GhrWvelleP2jLfaEW47KL67PTlYtSmlO89EQ8JZyOOl2/pcfI0MSmciz
 Bue742WSjd8f01zrYWO2W/i56zGoSMydD2E0OPgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f346..fbef941157ee 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -565,6 +565,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 497ea82c1778..1d60e290e40e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -473,6 +473,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_ctl_activate - Activate/deactivate a control matching a name
+ *
+ * @card: where to look for the control
+ * @name: name
+ * @active: zero to deactivate, nonzero to activate
+ *
+ * Return: 0 if unchanged, 1 if changed, or a negative error code on failure.
+ */
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+			 const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	if (!name)
+		return ret;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n", name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0

