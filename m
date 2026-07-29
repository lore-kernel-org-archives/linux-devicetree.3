Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB1483BC1
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331827; cv=none; b=uhuMZJNPYySWaFB+u/yQLvfMY2sn45u7vQfDKAl6kO46wG9aHTSMyjZv/A1SJKp+E2nvUaZWDfuz1eYj/jW6KZxXnAn1X1Xq4lGpyVrnKwhNYLyNWKn8ozm/EbohMPsbk76SmuARISVn1p9dYtHC6p1G5By3e61lmZOklMfDxGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331827; c=relaxed/simple;
	bh=JNPAUINbD0RD9KybCqO6mE+R6lBKwrezk7Zf9d2lUIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dr8qFFKzZVkrClZjRUUcgRGjnI4zF7OEYIUgz6kfb1R7nWlAWKDne3kqQI7firT+5M+l8Er3tnRgNbxBex66KtqvuaK5BTOkOXsk3F+M5IiG2XUbUzSZoao1D/RCr7vkQD8hzsqt4GxUe4O+51lJPJvSkUoEv15VQcGrHryGRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TkQJrfGO; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TkQJrfGO"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4ab89cff9c7so304245b6e.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331822; x=1785936622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGY9pJ9HxACe2V5dSfk8s/efrdxSSwRbR+Ftr/FTg6A=;
        b=TkQJrfGOnJ+TUAHwGpumGr3sfyOodaoPGSBN39Epa8WquMSayZ2w3v6ATkP1wFwHSd
         SMVDQ1C5LxDPD25a+haBhY2t4lqAgJ2yt4/V6eRnB4BCraNqEY3It/5IC/UdgDTia2dk
         XblpPOcCnfHzICLcub+p+dDubANL9x3tN0J30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331822; x=1785936622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGY9pJ9HxACe2V5dSfk8s/efrdxSSwRbR+Ftr/FTg6A=;
        b=dNrc0XP1IZ42AQblkiAPjUd8V2k8f3ncwUtqDRcrnTVFdI5OeHdVHIA/9WOWFkfy8X
         o5HrxhDAYc9CO6gfQ5XT1EWQCP59FzRBFTxR+duWetIdold4qUdfKkQg3u6xgv9/F0bX
         n36Be7NerqBVoC2x+8bNCbsPyrIa3o1JYCJpdjxhs6Gy1OMEK6PjipsERL/q+7zT0Sbe
         Di/dWXeaUnWSca11xF3i4/nK6V+G+reK++vpmgPIDoPa0lANGHjxLiD5065eZcH453iL
         WeAekloeB9YPcT0uf3oRTFdumYXDzBqpf05/c8uivYMSA5scji5lEmIP4yV6UdSQIyMW
         rY+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr+u6etDo0ovgKRM7r63ufYys0T56fD7+3G/HHc8UNPauQH9WkxLvAq2LqRsWfGY54juF/mqQqXnUI9@vger.kernel.org
X-Gm-Message-State: AOJu0Yygj9JinNNoTufBObDiv57GGEms6/NlhBmKR4EIqZ6cAFEaijcI
	Zde8NLUNGCxUwtld3+biMC40Mcj4O0oE+kII9DDMiDn9FbN/9dhikpaq+EWg+YeStA==
X-Gm-Gg: AR+sD10EVAlFroC4+6fE7kDhK9NXLnC1AoVKMKmx7es7sv3trBfD76s7npUwihau2Vr
	fWWtWhipL3A1FwVb7ocGxu3fHgT7GPEVDSlY4Xpue6lOZ4NI4kHC5oKqXV5JLJa680C4Z43HINr
	6XxxNyMxSKF2REx1mBvfrFZ0Y/MXwRgcGAy4Ou6GEyuuekqWYuryAXOnmM/9JdD6rn/c/3e72jX
	BP/scwUF1i2zbs0rioEth0XxhB7i3T2T5+qbwTPn9tyesHaaTFmYiRogkUj1IQ95MY18zOjVQ3I
	u/CDSwz5O46v0TLfdVXPP+t/QeKIqTRMkf7u9SO8xLqR59Ep8Fso+hL/M24UMdj3JO/bg5nzjPT
	HqCPP9vSEYzR/bntKO+yVF91dZiPpVYbk0x8PZTNohndGOyU7cM1qUTAQOUHe67tx6OkE3FbPpb
	6VgZ5rgQTAHEaKJp2cvcG/VbuEp2LahNqtHkv3U5UNx0WPii5WO1BjqiexiT6WKlq4Xw==
X-Received: by 2002:a05:6808:1905:b0:496:11f1:f2b5 with SMTP id 5614622812f47-4ad5b987d6emr3451568b6e.10.1785331822286;
        Wed, 29 Jul 2026 06:30:22 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:20 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Wed, 29 Jul 2026 07:27:27 -0600
Message-ID: <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0

