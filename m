Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CFA4AB3CC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051923; cv=none; b=edTU5iozA9Qfriz7eEXhDDeGA0D6DIFTT2ywPQBPVj97ypkD2BjXeU4iLHKiSEiZcxYchJ6nb6HgC5+heCwwGPnbtu9A+sQhDQMeA7EprQLhjhGXaJgmQlwxmxJA919jCnyxsUF3xaCTzGx7DLX/8+fO+cAFA8S4VMYosasUWDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051923; c=relaxed/simple;
	bh=HUysfWcwgaCnsXaXq97C5D3DJcHzVD/nOuWhNnFXHNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSdx4Z2KDGdE3jtxr8PoYydeD2Mapf7KUfi8NDs2+vyIqn36DIpt/eGU1RqGc/YaHnexLeBW2l/nDbI/ovkFkxEpLoNIuFhmDdIh/k+GwMfs5vzKg8Zrrhfkoeqd9TXNnvyeO4Ae5+BN4hHBDy3UpFjBq9/3gibRkdv6xn5djc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIi3eAIQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIi3eAIQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso137935f8f.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051921; x=1792656721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=QIi3eAIQsTmJiUBBDp7ZKpRl3L/y98j6LExy24z7934D9LKdXUM1B2VRI9PqDrt88w
         tlPTg5lOVLsxnjvBLAu5a+iIXft7UaI72LELliTmfJjpoOfZ3ICi8M2OzrcdcSjiix0i
         7lZs6Qy8qx6g0jTIWHV66aXWFQspl4WfXfsrVU6OutWg/gXo55CTWwt2ADGox80qIMy3
         HKNl4+k8LKt2ATBjW3KHSQdlxB4ggG3fQKf2AxlAWzx+ip4HKgEZqTaR5Urr1TckuDe3
         ky/NUrBUOI5uuLt1hSJL9cjhSbj1GtgWu8AtrBl+Wm3yCweR2ABMX4/E2LTML9xV+YrT
         u6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051921; x=1792656721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=0dsGHLeHGRyaYqq+FDtzXktD5yPL0zevWvvElKoJor0q3S8QUoS04RSlZXO51gOpUO
         kcQqw2oyJtCVScqkqlgYTRIZXD0FupM5ty/zxRjknU39A7Rs7yoXtM/5B5EWhKuWgfM6
         I02TVHGYvQ0SKL6YfryGMziCysvNLsTi/YVNIRK1q0xpaYBmyYCK/7XjH7j+fGEYCPc8
         lUIAO0lKNgQvaOO2TxVpVBc/S5J+YFLfLyd/jnYOQaw3bI2xGJN5s1a4vmmBKHd2pjAw
         ZsW7CAVw0QJ9ZMPiP2aQRtyxIl9lYtawaSQwr8+pGdwM5jzR3FCa5CuynsQRmlaII7Ee
         QbNg==
X-Forwarded-Encrypted: i=1; AKwUvBzuXqDqGn7p2ZJBBwSq7rEuH/zAnoyK0DBwkOC+GDXs6uM0VASzw1vb7TOeOfXdqBzFbTdlIg/cni9j@vger.kernel.org
X-Gm-Message-State: AFq9FYKPRn+/yVVTyIXbsgCs5WGl3R3LrssdfAUkJAjCZwUVRJJbXyok
	D0lb7Y4IUdQ+3l2JsHvvE+L+BKdk9buJZpauvjIPaqpG36KfoN2iSpBrj7juHA==
X-Gm-Gg: AYBFou3mpQnPk5l7HMQfH9XFwXgnzXIJzsD1DMIZi/1jA1RdwCqwOg1lkZp/rb7MKxB
	ot1pal8PPA1qw8CZ4X5iHTM+x7I3DkjywzFZv1QkLBp4fCwChjHp36Rz4Kb0X/qdoSUzafNXuMn
	jh29GKYkUpq+Clg62rsWXIM0wRiiR6xnRw5O9DENZ6gYpBr5aN1lPjRf/A7qVghOaN3sj3eU+Qq
	tJ3e9qmds4PudugBezLfOOWEM3Ormvpy07fMITWqcFIlm5pYKxD3l3jMHFOMLBPREZlppaCd/qT
	Micxdh+9mmt+PfStfu9m/vTJFwinHNTQIIgD1/wCeNcyrQWMx5bGY1DB8xCuzizfrQxL6vviIxG
	fcAqfiLB0JRPH/Hh/ypEOFRGFJ97g++OORFbDUIjbfUt7OWA82acnZ0L+29B/ayN/Tv4IdG0sNW
	kV1au7ohAnCI8ohxTlVvi4EJ3ypkLkeVVwZhbPiALLQuPboy2NxconUjQX8jGEDJHSzOqXsDU04
	GN9jNgReh2Slx5c33GPPonEnECtF4i/tsM1EPOPWljQ8oLs7AxH1uOfOEQ6PsDEaXu43Bj4lTQD
	E+4FgGnj7DRtLMLDrquQsZUSlK9jHWkP
X-Received: by 2002:a05:6000:2993:20b0:48c:4442:54e with SMTP id ffacd0b85a97d-48dbaae710dmr26750262f8f.30.1792051920518;
        Thu, 15 Oct 2026 01:12:00 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm16237534f8f.35.2026.10.15.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs
Date: Thu, 15 Oct 2026 10:11:49 +0200
Message-ID: <20261015081149.5919-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
following run-time warning is seen:

gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 3e590afa4fab..036afa0f6990 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -287,8 +287,8 @@ &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca6416: gpio@20 {
-- 
2.47.3

