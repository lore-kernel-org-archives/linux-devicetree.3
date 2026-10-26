Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008663;
	b=2CP9C/XO3OWY9bGMQWIpJsr5tX640KDR5S8D7c46cGgOSUIztwMSUOfjmU1/o2TuedFS
	 TrAfXui2/8FrMt3QiOpnTsaB8vt0ruDr3y2f+hvZOncjsuIgrCplo/ni4nmqVCg/7Xmlm
	 O7cFNC0uTi7Xh/SagnI6oQV3mfdQqqRbV3mcC3yKwSDjw/PpHNlpzF2ddo9ERIcLH/pYk
	 7uj+4yesmz8vWZe5lco8ha183JwQ3DhyT8P4Mt37DgdPlbu3w2sLzqnXecOBD7rzl7LG4
	 TbprVOmichbOoTIpJLMGNaqTU5F7c6QEp83ew/TUTSLYqD0DeHsZ+bouA5PVx+QcMOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
	b=1RX3PL/m7YEltA6xqX/xKpPE6r6Z6O99hYPxaf+WDZnnKVM/tCimqQcUqOHvAunNezC7
	 ds4vABdEVW3tK9xqGqp9k3TkeSfZwsIPIrNjOs/lo2pfdJpztMAioUAd7kwJT3Ga1ZDoI
	 QmuLNaDD/Rar9ytqauf2AqDa2IMRIYccTwe3HT61/Rd19xgZtuimmRp9hZ6CCvb0+GIil
	 kAr56ofljjXs423MJWTcTiepA6k5w6att8JlCcLYzbqWORDosQMw0APV0bEKiB7ZpR2/w
	 Z1IqNSCVPhNJZ8s1cGfs/E6lq9RgQytrd1h49NlZsZTWZF09fwOaa1O6XzPyBNRQiZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="UV/qb0HP";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505A60A260C
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2505A60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UV/qb0HP
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214af2076so19152495e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008661; x=1793613461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=UV/qb0HPbMrb2B6zXLYA4NlhLlaR2DPvvZIQmmoUo38gPZEtTgiFcItuCXB1+g4u+C
         E4/nOqZvYvtImM9zA8bp7McRQRP8meil2gvA7KznmyLj+DH9zj48lEriFN3wqHxyJFKS
         ngihqYgc0yKMUeyHuRskHrM1HZbRrL3Gb9W8GydJf+m2wFkHRbp4VqfDkLs5mvhtWTN1
         t1WVDQK0vC6sksHshR6wEXzapfoiUNZSb5HDDsxmLh/kHcs7KnJSPThCAkC5T+z9cD6c
         iNEDE+Ie5djLz8Dr1IsWv8XUjGa0QCAp5PHd4HT0IEUu+ZuxYvVJIU66Kvfd4JG1ZbCt
         bZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008661; x=1793613461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=xRAHwPL9wqnTzVZTFap01xnWiyq+fXCzAqBi+19eN4W1otyeCpKD6YeYqUmpOLwcsQ
         wv+nXB7joHonKlT8ot5QRnP6eEcwTR1Rf3xPql96UNz31d7GUJQtcyiwGCnXmfG/ZGfA
         /c32PQHLtPqUppdX3r++Yc7bb+9XWSY9xZgyaAvJisLjgWoDjLoL1O+F751+P5UCd5Pz
         J07VACzdGrzIoX+MZpeYALZlJA6iwJdyQXoRuYi5jGcDeQJ1tP/NGPQNlH8yqFPTVCn+
         EY+6fDZyrtI3TqwcZMGc4hccv9KdpzW2gKrmZ3G6sVpyPQQk9/TmWidrIcu3bxxbfY1b
         NCAA==
X-Forwarded-Encrypted: i=1; AKwUvBzqODE2xH04vFV8/oI1uol8cWlCfNNiZTjw95IUeUz4++zsVZmre5YD5HgT3wI7Wi1EBed99h7SoZX0@vger.kernel.org
X-Gm-Message-State: AFq9FYLnIlvO8Genvhg37KDvdr4kFSt99FzFJKovpfXFXGjq4GvfhKfz
	IvWZNlhxSBwwh5XWKpLTcenQ7xLM2ypJNZwzc6DCZrjxGdRVtdN+Sf5B
X-Gm-Gg: AYBFou3FlEi9eiHxPbjlTngZeMnakI1KiRj4IC5112+ZkYHtW4cLKMFhYWFcqN3YRzg
	XASqGVwmw6mj4I9v6AEveLLcQG3cWp/+5awxWXU/FLKdXemBZAui7uEy+e/3I8m49mEsQL1kwJD
	yJjfKcwItJNOhm/Rayp+jDmjJEV858ZKrCScTueZqcHMOIqWHSragT3uvtQd8vWSFk8xlzkGS4I
	w2fe4jrcybuzRwc05jnKRuNT+SGNYJ1SeB34BtPk12thbi4/dkc/DLc9Yaj4Qe3cfycxEQ7OwwB
	jFkTh6X4kc14VVoy3XwTSc2mfjrmaSgY2u8VsWf4dWl69SP3MKxCJnsev8XXxF9UGiS7BYdI8+B
	4OaK/rPDzDm2dgOQd2oJ7KqQRxiOHRkklcdtdev0huaMTguvozscpGq980Y3JV0KgwBtLdr9g6U
	4WEAewSut5XDmxm5KIQ2nBUdxtXBiUlqOKWCsnvxTkGvJ2K4zZGguePHT+IdKmaBfAcTnFLANdy
	9xwZjs9CfisqXYErapL53+4FmTR+xO79UhaEysEmwy+IN4x9Tqtb1+Sq5zzVMg2z9H85vYhJRqT
	gZmjhwqbBhqJn9+5FcxGLRVPfDryIA31r8KG3udX5qVNRbFF0IExvEveMlKoh5g1plve26xez8w
	/qI3hUQc=
X-Received: by 2002:a05:600c:4e87:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a35acaa6c3mr112485855e9.30.1793008661422;
        Mon, 26 Oct 2026 02:57:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: airoha: en7581: add watchdog node
Date: Mon, 26 Oct 2026 10:57:11 +0100
Message-ID: <20261026095727.31708-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add watchdog node to catch stall and correctly reboot the system.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 58bd8b318910..3a4a4fb0eba9 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -484,6 +484,14 @@ uart1: serial@1fbf0000 {
 			clock-frequency = <1843200>;
 		};
 
+		watchdog@1fbf0100 {
+			compatible = "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&scuclk EN7523_CLK_BUS>;
+			clock-names = "bus";
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.55.0

