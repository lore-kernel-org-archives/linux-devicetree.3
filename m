Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF69440623
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318348; cv=none; b=eMA2s0/2vcbgYONNLBZpY8h4tfFeNHTe5WlafZT3BqRF3IcNTqL+8CIre9QJw3AM36yZBDaceR16FWmxgdL+ji+3x1BwS1PrUtT53Ey3z+/NqJE3ZiCf9k9jGyNJdoI6TqKDUdV8wbNyr6GLKtqyd8IRkv45cHmHrZ6+7zDAkWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318348; c=relaxed/simple;
	bh=NyTgz/hgDxQKSuA5Ck4SyFt9fR3sfL/MexR3R/H3dxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=heZUDqK0Pjr3h/4hL/X3n+UqWdo65J+NWIXjSR1kSVyOmMO0x9gUCAVMcu2yh70pVp2PleipYcir6TfKSYf5CKBW3GKVGIuvflw8AqVO+KcsL96JJB0pXKuLMCgSzklOaeUS0Zp3T0ry9eVzwwLImCFjPoAWfumI16mjphVXLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EQ6VdN6+; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EQ6VdN6+"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6d290b10a35so438690eaf.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318346; x=1791923146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=EQ6VdN6+PBIjbqN1Yv/AvFu0aihTFJ8RPiAOsbtPs8ZraddOOLKDEyeFGB40qbJSuV
         FWXnRmH2Kmbe8TDWVeBpUI63mGg9w5d6BRror4rbOpoD5kOyWaqPEIWmv+NAWKNIVfhN
         KKpE6rO6B77eaivuDNwMwdLu/cNlVC0husQXNh2zZglfrBxgnkmRAF8mZ7V4WDQqQdlp
         ODBz6M2ZDe5IX7QQHTSsFNuKzFyhzve/09SmP6xnLi76QSm+/q3c+JmCi9IGwBI1WGod
         COvv3HaoRDf0BEnksP1Ctd3Y3QQhr/0OAO0t0qS/AAAa5R5oMv6nIONNdXHUEDZ/ejw9
         u4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318346; x=1791923146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=Ozi4j/hGysRNO1WmlS/nxMmvcWkISg3XT+B8J5VTxe2tPLk5IkuMozieu4LN3NSujW
         Jse6X1pJli1gzBBRPmtQnhmrj+qi21axy6P3rU2mcCDQLBeZbbCrOn/HPEWVhQIPgljP
         aNXZIWxML/PFbbTfsAaxNkskcgUAmf215NHW26Q9kappxPwKeRrG78KOBecRof37d6ii
         +iUt258X3tPwfhdRXOx9dSLBIYR8czRKIQumUx05F9kstkEhfWwm/mcVvXq9Tyb5xxBY
         Cd7gJgj5yodfjzd34s7sjcOn5pUnNX6cfO/FvLZhGPjOGZ+XCUlACs8NxVcfVLxEM/Gm
         j+Rw==
X-Forwarded-Encrypted: i=1; AKwUvBykXjqRv+kzfTpUepzVZpy9cQcByD5itp+E+8z818+ZW8d/ZDr3pims2nzcECxT/HV+UsPA8V8KRVeX@vger.kernel.org
X-Gm-Message-State: AFuF++lgUTdRRyXi3Kcvr/12eqXD0vuKQUUO2k1CI40JzsdpHv41l2x6
	wJsLXyi+v1t4E816r5K9P4wkCtcVJnLeUbLR8Ib4P++vPWF8NkWG5NP75yftUYa3eV7MWXMDRSX
	02bpI
X-Gm-Gg: AYBFou32RVw3VNxPZ1HNi8e0x+zr1O0xbZPSUJ3Kh55E9ot2+EMstpq1S2lNAZhAHoV
	k6zqoXCFuVJU+JLWmrzPq4RHEWHiYsmIq+C6f9ExuyxIwJGk7aVuvrCCMfnSwkzSL+VLvb3vvuj
	UDxqPJUoK+tPthb6GEuf/ymsKRPnwU06/7mUThsuyIJNDNkTlGIuXYlt8XI1HLsgNuq7nwddNXo
	qQxxuAmPTUiAoBuEgqE2SBCyfJsQCx+5cii1NZEYoZ5NImQMwKYdO8XHxNGRrxY7s6233aJLikl
	F1N3p4aPNarLzHKT2AzZUqBZ8TECzurfHhesHhOBob+K6zBA6vkY3BLM5lrJL1Gm+d5yPhd7s22
	9WWAlYQiCPtaIKC5lKkJhBwY0Ir0bd7dmQ5Iz8whKQEXyVS2+RD3GyQZU4gRaeUEyryEgGNd60b
	hka1TKKKor72ToopaeAt65268Hyq7i46ofTV9hYGe3ECJwMVDYzuvYJt6r/aVQlV1mKL19CrpRX
	g==
X-Received: by 2002:a05:6820:1996:b0:6df:961a:af2f with SMTP id 006d021491bc7-6e7ac5151d7mr253655eaf.85.1791318345779;
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:02 -0500
Subject: [PATCH 2/4] drm/panel: himax-hx8279: add the VDDP supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NyTgz/hgDxQKSuA5Ck4SyFt9fR3sfL/MexR3R/H3dxg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVksNR5t/ywYjewlDcdi0ghHLOdJJIGqzYu4S
 0FRGFjsMxSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZLAAKCRDCzCAB/wGP
 wCSBB/4nAAPLD1Yv3Td1SgrZyG8pm0J+BxnvcD4ztUnuid/60B8XkFmMjr6FQkqLK1d/baXFatE
 cbGI8eGxXtN9EELfUFzkaiI6pbFo9vOfFbKfurBWmbBbZqfRPcn2p1P/KwOT8e9ERwN3pJBgDtw
 IJnA7ofvPQwKGq+hg/++URBXqdhW+mxUBDmxQ5lrxAKGaRxYsDnjzMf9aLhuEGGceSHp46P1zX7
 guK6fHdEksNWYX+mLcopg1bP6zp2KmcaUalp9b1hlPC3s2Xtoq75Qas1m+fWyast2NbbU+XFCNI
 OcROe3ts3gEeZSCMkm8yhiT4SXC0JamLJMaY4PxVT7cnbLG/
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Get and enable the vddp-supply along with VDD and IOVCC.

The Startek KD070FHFID078 panel has a VDDP power input, which the
MediaTek Genio 520 and 720 EVKs switch with a regulator of its own, so
the driver has to enable it for the panel to be powered on those boards.

On boards that do not describe vddp-supply, the regulator core provides
a dummy regulator, so they only see a "using dummy regulator" message.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
index 9e443c719843..fe665cd3a3d2 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
@@ -112,7 +112,7 @@
 struct hx8279 {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi[2];
-	struct regulator_bulk_data vregs[2];
+	struct regulator_bulk_data vregs[3];
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
 	const struct hx8279_panel_desc *desc;
@@ -769,6 +769,7 @@ static int hx8279_init_vregs(struct hx8279 *hx, struct device *dev)
 
 	hx->vregs[0].supply = "vdd";
 	hx->vregs[1].supply = "iovcc";
+	hx->vregs[2].supply = "vddp";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->vregs),
 				      hx->vregs);
 	if (ret < 0)

-- 
2.53.0

