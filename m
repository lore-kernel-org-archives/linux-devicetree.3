Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057F3FA5E6
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403389; cv=none; b=b0Rw32zT/0rOMccvOiSlEy3L6AsJA/5AtPSXiK3VZjgSS+xxfcB3Fv8XV3d/EoavPCzAWNjlmIJ3HffNH+KnI0sgre/u9l0Zq86XvEIp01AwS2r6x0qjATgyC9EznkXqETeyZa8aB3TustmdrOPxjBbSV1dre0IW2VwueB1X8iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403389; c=relaxed/simple;
	bh=ySfkNi6u/Xc+LnABympw6WDKyKLWbE7/fAO1qnlh9i4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZfKLjwZ9W++sCN3QuuV+F6hypukVSsgihHH7rAh2AfZfNUW5OxG3YBDTWAT2PFqVJmTQj5M7OXQ43MV/35tbTJ8p/eOMMeYJsWUs+0ZHQ0Bbf7a9u2zhSEkvfem3Sjoe4+A0MnqjVLOndIrgMDe3W3Jwzmpz4OoCLNzXmJ0ijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG6tzxlN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG6tzxlN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso13180935e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785403386; x=1786008186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEVMeO2gE5AFjmkT1VS2N07BKr0N4iKu0FoXOV951KE=;
        b=TG6tzxlNRkpScn319b9F2BgD6jv3UrcWOqgXjd8TK+oNZvfASpP+jkmShLRNxTcKK5
         JBXxyITZoRffTdbfbzRn4qTTFSiRi5A7xdGeRRuKiY0XodQUBITu6Hb1uC+PnOgz57EG
         jPDQfMkiOEpgZbCqRXg8NfDlwp38v5x5JNYWPonBNUPwGGbC4zU8OnPJLjQQTkboEaeJ
         UusAUaIWqYDbmLz0c0JUTS0bYzt+atoiQkCi/fQkSReK9mGphQpQWYzkEqwfWRemSNzr
         ehgMSfzeb6RRN0iyAzMMooGSSArMx4fMqELm1V+ud07LVZ105k0Qlxn5jDpZ3oKQOfDW
         f56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403386; x=1786008186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEVMeO2gE5AFjmkT1VS2N07BKr0N4iKu0FoXOV951KE=;
        b=HupVFv3UqIpRLIp/EurFgfnJ4yxGLpFgEeIExcCW8mgOgj7q7MquV2HLLtrn8jIoXa
         9hkvXBDfhb/P3qDEWJm5T3R9bIOFVueh9MMV9I+iJp1lmF6D7Wjbfokk7ZjDsseGyO7J
         eCSUTjq5A+2aZ4zjS5LEPqDUwf+evdHdEgYH7AVKghPkDw3BOBCVOWbvzXvk8xduFapC
         s3LbvSbjpHDt2hFCH9Kdpezbx/JTfS3mKYiCbB/M5BsmoZhLLIgVHxihErkVXZE4GoNC
         SM2Xi7ca4VQiw7j8H4dUVih3I36PymF9fsDPqM4iCNFQN+8muu1+Fg6PKLNyOzdW3X1b
         6liw==
X-Forwarded-Encrypted: i=1; AHgh+RqB8oERi+vjG9N7AaHw9XmJiYsJKboAoyDbs7/dZ7iy6+uKqTTop5usVyPEQl8PpIr0gEoFVqj7e1Ck@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6OujyG3er5D8KzJdv30cr/v9al9gvgpC7Ojl1K0N0MbQd4+3z
	XH1pKz63M0ehnVnphGoXlzPKCP/m6zxvfq4SI3W7T1R7yUgDu+NFJImq
X-Gm-Gg: AR+sD10N1lZ5MJaTVqwJAsOhUPhrLKDLxBiRoZHlboK17YqvjtRi63bghAU1BieAqif
	h9G/jjFqFpz3/mm07bRaBXrZSbOgah4q+RnAXw1WPeFJh7uvocQ7Fq36f4tQ2L4AjeqjxpPHn7P
	JIHPbJd5Te3PGzkexJVjRQNFVMw49X3XllxRNLK2waSKuoW4oWKLYiATy8jv8qZBwqCe+WUTgPF
	PQb5Ptn4NO0yQUaQELi3V2MZ+y5OcNMtfHiynJ7+llUBi2ePuH+QNLX7QUDdsX24Qeef1opf/Oo
	e2giLki4Cncj5NSvnu5/rUS+vD0rogiEaMoumicYgsaB3J0Wa2dA3tT2k2EhtVrUsac1CsqpAz8
	nOfnSPFOfeLUqhzjuvqYo0UA5qJyoeDWWg0XJJNqI8WUxrxQupEJ9TTDciQscKSeJmCK1vVk1Jz
	423xMUnpuz472Dl3URKw4D/m6pP16DpsjTTQuVjyuZ2AQ5zMHXfIlHnMB783wogn8net+I2aFPJ
	Ip9D7p8MBOLjkeiMzw5NwcpERJqSXr+cw==
X-Received: by 2002:a05:600c:548f:b0:495:4732:1eb9 with SMTP id 5b1f17b1804b1-49800ea1e9cmr24176065e9.21.1785403385560;
        Thu, 30 Jul 2026 02:23:05 -0700 (PDT)
Received: from fedora.tail6d6c39.ts.net ([82.77.79.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm4308425f8f.15.2026.07.30.02.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:23:05 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH 0/2] dt-bindings: display: ti: Convert ti,tpd12s015 to DT schema
Date: Thu, 30 Jul 2026 12:22:43 +0300
Message-ID: <20260730092245.52034-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the TI TPD12S015 HDMI level shifter and ESD
protection chip binding to DT schema, and fixes two device trees
that use it.

Patch 1 is the conversion.
Patch 2 drops the unit addresses from the TPD12S015 encoder and endpoint
nodes in am57xx-idk-common.dtsi and am5729-beagleboneai.dts.

Eduard Bostina (2):
  dt-bindings: display: ti: Convert ti,tpd12s015 to DT schema
  ARM: dts: ti: omap: Fix TPD12S015 node and endpoint names

 .../bindings/display/ti/ti,tpd12s015.txt      | 44 -----------
 .../bindings/display/ti/ti,tpd12s015.yaml     | 78 +++++++++++++++++++
 .../boot/dts/ti/omap/am5729-beagleboneai.dts  |  6 +-
 .../boot/dts/ti/omap/am57xx-idk-common.dtsi   |  6 +-
 4 files changed, 84 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ti/ti,tpd12s015.txt
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml

-- 
2.54.0

