Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE83F86EE
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093933; cv=none; b=uaSuQBaEHvY3pFYk5WxLS0Tm26WKkvO7SVzyNQdUoGUqRif+rc4gi6IPUrd8e9FpWokEpmfwjXqmdW3lN55LYF3PsrzADqTRp8YQyM/fTzx9YRa4BaRoFJcSmSF4Bn2/n4HQZrUf7BTl1ExLBFIReQY8QlVRxxllkFBFyFwjZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093933; c=relaxed/simple;
	bh=0PoYA2wCuvvrL2s4prwBCoBYU9Ml+9hC3D32pPQSHes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dV6Xeud77ccpcuxONum9jjoCplEqWbE9ekAEZ8qXYElbiAg1aIt6+/1gw8SvpgTToJvaNTRrLiFtUY3vvY5tgbIHM+PzMyUqFrxQUpP9JOw7q63CCqk0g0hn8xeh3IinSmximPRdluVBtvX2rS6u65nv70SNC+I8gQXEeERYOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0UoRaji; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0UoRaji"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso585961a91.3
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 23:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093931; x=1791698731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=k0UoRajiRxYN+8yrZVO9bQ2RpJ/RDSnqlFSRz3bPVwHCcKtYPPcE1/aCyMzRL/j18G
         pkpTEkKL8ajzGJDxq5+UZrQOXMjryUldbuw7LOO55V6GT3pDI875/BKVTAjHcwpxx6Rq
         9Ha3v68geB1+7htzpUmuRokriw0PRWsZGhOg4i3nWQMf23JWfwiPWoyR0DHoVN1Ic83a
         Z4ptqcNlrtVidZCIRB3wJSByJ3UBGrO/qxtsaz7AnSk2srTLh+g7+0pJ0nn/DPtwTbxX
         84FYpc2Wg+SD3JM2DP+mw8JUwiXZN9AQRvOBtDYWQ93pqmdFXDKWXAJ1r11syN1Grp3Y
         TGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093931; x=1791698731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nB/FQkcwt3QBSTG/xH/tXn+vR6SVQzg6Sj+xR8pJscw=;
        b=yv9dfnYyR6itTeNqMR4JVi2IORcl/g8Qj3NmiDuqs6URji8YgTQsV7sb6PSpLplGOa
         FcytRgrB0WtQxieaQRdS+9MGEAFiiDNMWEksfqnFzAcq7gEY///LlbhBS0h++FoIUkwV
         pIbvFKUkWAdyyNfGAueMwoTihIy5+L8lsiN56sDTeWpFZvRCp+FGx9iRync9m8bkyTwa
         kp7T4PYFC7y9sGgkGAj7qX5RaYaCaO9ldHr8FjXAxlWs07KMHuxwrgLXCHgfUHeyDC2j
         vN51IwWRa+A+pVmSdf027d7CTMaCKzF+4LnNLF/Ylz304ut1neT7n4uIyIfh7yT9r0xO
         MlMA==
X-Forwarded-Encrypted: i=1; AKwUvBxsSVwkWD2mXHJeSI3/eDe7AOoQzgN+7PVISVyq+WnNsFxSZOgKSKVpnpGVhEOjkDXUxi20XB5lNmnE@vger.kernel.org
X-Gm-Message-State: AFq9FYI2KOORdxkCMdhqEHQGiP00x9rfqhzKMnCIHZ/2bbXq1rx/jo5p
	53qDjFg5d59K1RYsaZfd0xX8vJHW+02DyzkBy4iaYuMhuLWbXjRy8XQg
X-Gm-Gg: AYBFou2LNYdi1pHguWCEqWZlY4vGbiS528w19FLH5OsE7G0lxpVDt693R8MTU2PZmgf
	c/a2Cao6KQFTKu2sAxjEewO3N0OPV/CvPDg6ED/TuAVYmYtIbMt9z8trwhNsemeBnWokTWm/7Jl
	+38g1BQyUhdxfpU9AbAghpakYQx5h7jcA9oeJdTwti5fy8lqfQVzuvdB7fM+fP7sX3ltyipwKbk
	Nis0Jr+mi4Y1cx8YzZ6NJeyEz8dXYzLZb61dHsIon0oxSJ0jqQV3N3xWUAcbu7MoL/9oLYzk+jO
	KwNSDnXnnL+7e+pF64Hu2SK8tVYEJ8hHLzEpkfVpKPBYObdm6bL/+u8Jny23ROwfV2WN7tZFlq1
	uKZfGRWAdRT5XcOx1mR1DFqQWqvHnRYX6o+RFVX6zyaNSndFdE6ZJxdF4prQUsuQvCY2D/EQ1G3
	3yubWVbSZtZV1SWNEf8at54AGMr6Ncxq0POma3wZwcSTLIFaU8aVmDATa5tQFq7ysEzyFUaOpRt
	Wx6QsqEnORw7SkKt5Pdz5twYzpmbJWsb2U1UIkyyrWW4hy1AOdxHRw3DQ7+FVDIYZ+Jt5thrNAb
	2D03I1ZsjtQOgqwaIYTMEdnJdva6hwUFUOJm4GDfYxF3Ybc=
X-Received: by 2002:a17:90b:1c10:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a6ced24dffmr7196757a91.49.1791093930602;
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:34 +1000
Subject: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V04jnN0BX/eExW8BMvJ1EKB7GQ8dS9/fHjbsufpPsJ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SeP9XEmjx/guFTlbP/bIJ2rTjL/WTnSfEZCmw/P
 y19vanFrmMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVoe8Z/vuePN21q59JkvO12slnkrwfTh72P6jFlRZ0v4Vx55PDL4wZ/grlryn
 T7nH77WnauePd1ue/z2nyi7CuluJMFOmuXr8gghsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 69 +++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 973ffaf6f060..f356b553227d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 4d799c5e44f1..b1eb74e24193 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	struct snd_ctl_elem_value evalue = { 0 };
+	struct snd_ctl_elem_info info = { 0 };
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		evalue.value.enumerated.item[i] = sel;
+
+	if (kctl->put)
+		return kctl->put(kctl, &evalue);
+	else
+		return -EINVAL;
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @value: string value to set the controls to
+ *
+ * Return 0 on success, else error.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
+			name, value);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0

