Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547910;
	b=l35sD3jhPNeB+kOk0+LzMBXwDXhJvfeIh0/wHnGAYyCQ3Gs1c5OuANrWzSgnwc4rcVQD
	 WGvp+DBIlMX3ll4pE5U7KdYFHH+vOsjjB9xYpeObokmarzrcm2cZApcbf3E+rCXwJ/iKB
	 DoGVg70UFHR66BWcHhsKCJss4hz+3ihwp8UQNeTvocObLmVmtzJeSbQu+F+nA0XYal5QQ
	 r1IzzXHpHa8BUWUVdIYglOuIOoDR3uXP0F2zm6OqjnrGlqxGUmX8d2dNjUguWaMv7neRP
	 ouRmRleIoFijkgR0A6NXgL5yK8Jq/fMAD5qLmeobXO2em0oxohlT4eA64znoyx2uztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yPaStIqUsFXmNLYCrNHs2JQTzK46Sd8vnaUQkzY6azQ=;
	b=ezeN/jWCSkv/UweryKWR3HolYEBKB4Bt1eUDmwMrS1QvCwroiTU5njkdCz9NpNcu2rBT
	 hKrs7nY/B17sHGbXHHNs1B2qq/0BKpdtndsOk3e9JMayyLSKqnl/T0x3kbut4uzi39fAQ
	 xUnxyDSFtPliYf9JksG5HndezpghtDjYN3l829MwLEIJPf2+tyRiK6TCjNkgU4YEHBuv5
	 Nie8OYOyhzZAJEneMprXbLrERtHOgVyMN3f0yEXIYbqgAtG7DaiFzr4HMQjVmoOXCMHAj
	 ryZparJUjA5TU4uY2FCLBPbemjNMbCouuAqKBsciJICGpJeYErLtJ1qaXQGNxeYfe7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+vE4Np7;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46A606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF46A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+vE4Np7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so47960305e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547908; x=1796152708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPaStIqUsFXmNLYCrNHs2JQTzK46Sd8vnaUQkzY6azQ=;
        b=z+vE4Np7heATfeNUbsGa+8Y/j19RZ/ggk1zmUogTT1iTjRESol4zWOwX2BNeXKVzqb
         S2L+aaS4/WRGjwKeC7PsrUD1IXxRAmepqxC5c4xEFUBjS4SOFxvE5UHvqeEOQfWjkKq1
         0fkimxO0+Aaz+iznCSSv9Tqnvoi9eCWEYwxZxWjKTPYrxDvjbWS4v7nQiV04ZphDJM4j
         bGS5LqDUwqXbhREs2KqvuHzV90AJX9LpEY5qj1DOFvNRYgCBtKi28L75UXzKu66gM9xa
         Btjr2pux4f/NSFpilNuaobGJ5Lw5qSsQDMJIJBSjU+51+h2nICgoZSxhFnEYCiSuDqa8
         IpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547908; x=1796152708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPaStIqUsFXmNLYCrNHs2JQTzK46Sd8vnaUQkzY6azQ=;
        b=24G8fYzDG2C9hgAbavsphnpnhEgVaH512rCbW3xScSWuuyfbIxr+sy08nF6qZKtn0Y
         bpNEJeRNfhhR4xMkTzqko5BknUtRFkUf2ezmkINbWCpE7xjNnC3DXsIC9FCo92GDgBiF
         cPp4+ONPE3+9vWt+3iVcy2kTxMdAtn5Jbb+19DPD+yZsyoUIgT+MkE2Ebp2x3H0+jS7R
         qPl6ve/pr8pbalKeXdePw/NhInIGrwRJZQti5S8fMUZu2rG5VTz4AgUkUVrSXzpBy3au
         sFllducwxn5iIp/8COy9tAlz1EE21szOHaDzrQfoXU0Fvr/wt2DJixJbTo4e4ut+aGKu
         VFmg==
X-Forwarded-Encrypted: i=1; AL+hErEyCpHSPOP/BnhMPAiqStyCxuvAP/ecMPwvul6q+qLCNyBOQlf3tNdGqs7X2RR671sBnnMHJP5isvo1@vger.kernel.org
X-Gm-Message-State: APuU4Z86NK4nYY4SD6ey9T3+0ZnRnqNESn5zLMae+AHMD5f29Gg+I935
	Bq8aJW4nZ3j4lL8nfmgB/PWAaRPZiZ8IWtJzFXxUUW6jzCqsQiLtblY=
X-Gm-Gg: AZFdTZeiCJf5UEjzv8LBP1eEY6Wg5KzaDagWWfXjeqw5cPciZ5oJejGY/Fd7wTGiWEG
	nPbEPK2UbumdRkk+Tp/VV44qoqzPhzj3NzR6je0BSPh5HGNefd6P5l34XZKw3zL+8A5oceam5tV
	PxX7m3s1CziYzabLY57asWq7cyW7UK2uayG/1QalLwKMRwOLGHIVI8ZxIW7V/8iXcJNKuin8qBw
	XJNbLwy2YCED6oyKxO+8+mh5ae1c0L3ZssQM8EQe+nXTECueuX3MU910YzuIS3okDhsAUeUOOM6
	TTLdvjxpODPg2SA6EcFQKE9FWkSRcHLaF3jNB6dO467wiQttTn1UpRo1tFd9+1sd04t6vAbHQ3V
	DE28FXIYl+fOSI8z6jEREHOiD/ix98JR1GAixmgEFcii1rMNrAw78u/ioLD85xLTAk8YOKXRVUi
	kNATDycdmHcMyMDT25DIltFxDEx9xPkrBkxQ6HTUNp3qKVdIm18w8DI1bO5kGEXTh4rDKmlLPWl
	QSbYiFwsd9SHzMZUmsGJ8utsCFqm9DhzPrdR5cO1DDPDfzxIoi9pBtIq6ri+rmb97Kkye3v47nM
	bbPFHZ9CNKSktRDrKc3BsYUQcfsVQiPJHYWx15T/fxzTykcHNu0zug==
X-Received: by 2002:a05:600c:5249:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb8893a89bmr317787135e9.28.1795547908057;
        Tue, 24 Nov 2026 11:18:28 -0800 (PST)
Received: from localhost.localdomain ([93.145.31.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm463320985e9.15.2026.11.24.11.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:18:27 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/2] drm/bridge: Add Lontium LT9721 HDMI to eDP bridge support
Date: Tue, 24 Nov 2026 20:18:01 +0100
Message-Id: <20261124191803.283266-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds Device Tree binding documentation and a DRM bridge driver
for the Lontium LT9721 HDMI 1.4 to 1/2/4-lane eDP 1.4 bridge chip.

The LT9721 accepts an HDMI 1.4 TMDS video stream (up to 3.4 Gbps/lane) and
drives a 1-, 2-, or 4-lane eDP 1.4 output at RBR (1.62 Gbps) or HBR
(2.7 Gbps) per lane, controlled over a paged I2C register interface.

Patch 1 documents the "lontium,lt9721" binding, including power supplies,
reset GPIO, OF graph input/output endpoints with lane/polarity remapping,
and the DisplayPort AUX bus.

Patch 2 implements the atomic DRM bridge driver, registering the DP AUX
channel (supporting both Native AUX for DPCD and I2C-over-AUX for EDID)
and populating downstream eDP panels via devm_of_dp_aux_populate_bus().

Hardware-tested on an NXP i.MX8MP-based platform on a v5.10 kernel
(driving a 2-lane 1080p eDP panel with dynamic EDID mode discovery over
DP AUX), and forward-ported and build-/schema-tested against linux-next.

Gianfranco Mariotti (2):
  dt-bindings: display: bridge: Add Lontium LT9721 HDMI to eDP bridge
  drm/bridge: Add Lontium LT9721 HDMI to eDP bridge driver

 .../display/bridge/lontium,lt9721.yaml        |  169 ++
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/bridge/Kconfig                |   16 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/lontium-lt9721.c       | 1640 +++++++++++++++++
 5 files changed, 1834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9721.c

-- 
2.25.1

