Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115013932F7
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745848; cv=none; b=KkCTSll46LVikPxy5qBdXybHaJoo0rLd0AeezJBEWcns/zaROzpG2A13M4h+gOIEYRVUBaMOJFhQ388PxEnvDzzHfD+L/CSjslS9jQad4Osb/saMtYnB50l48j8+r8/74b63pmkyd5qdwQ5ConHpt8aGpZmuDGeX2mVkJPXDJEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745848; c=relaxed/simple;
	bh=FQpo8sL4METOgekKA8In8MB/4q7eCT3gYeGZAlDgndQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXbYZ3Hz2/czrS/pUuBUZoXSM3c8nBeuOI+6bpSbNTwpyhQ8zJ5DERNupDvi9PY1ZcA8PC5kWIEp+hsOQMH0NvJkVDxrVbzIXivSBkzc7xwknRtSkrJUe+cVYWjtRbAITmAxMYiBswQ3/g6yqVSfumFBzosjktT6RJKQm9nbisE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUuQbj7i; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUuQbj7i"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so7889595e9.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 12:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745844; x=1792350644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GmhGFE2ooIB1nHkCJeJhIMAuZpyyC5xWSFp5d59d0HA=;
        b=OUuQbj7ieFVmzh7/YEmK3rN5LbcG7yWR963sqXYwL638NPRNrGCJlDQNj3m/jiufxp
         gXC1BBAuXqamG8yI8rpnWmYmgTmcBqH6plgDiD3fdS3hvPfAJf/Yb7I7SmRKW7umtIYa
         8BNzpsELu2n3C8m9BnXi7HR+XrH/dnM/5+f1aG90Kqj0aJXMEE//Y5+QiME4XLCvoso6
         QxTi4iZC37SsSnL7T0FqJHInbanAtUk7TVXE4B4RK6TuFDWYqx2XhIq6ccMV2jpGxDAr
         Y5q3Vlp2eYMbJybFYGC+rVgwaKcHy8Vyk1a5uRw+7EC4bgQhQ//OrN3nesIUWMg587Zm
         SokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745844; x=1792350644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmhGFE2ooIB1nHkCJeJhIMAuZpyyC5xWSFp5d59d0HA=;
        b=PCHthqGUSoZJlSfUei6WZAwms1k7HWImAFR4VebdQW7mBfbP4xBq9gqPnVXWRyDXo1
         XKE0hT933KzCHdIwB6q4f93sYtUUH1b9FKX/7Ys43BXMWhjPiv2/BqWxtr0+ehsgcUnu
         QOx6zTHjlLkf9CfPVozGJtkDU3Mhha/9n0MVi5C8trooZ+SzOz6TssJrhlUYWZOMmsHC
         5lViA0QSs49FMkmxCuuqpxfH+00+bMQQ4sI/jpyQ90fXEv12hkpb8pZzXpBeR3v4Gm+8
         WPdArnhCSVZpRtDMTqi1sXFwTbWEpS77n4DmaI7GE5m7/Gbp/XJlF11Y6vWZGvGG6S+j
         c26Q==
X-Forwarded-Encrypted: i=1; AKwUvBxF+MqAolyPrw0d3MzCPXRIlgEVB1kYKMOd6gUHg4FAdxZLKjY7H3TcQ+zlrDsk4PZfMpkOP2ys3RHc@vger.kernel.org
X-Gm-Message-State: AFq9FYLqTzseClfqnxOjmOnyWK3s6mpTuD9t6YgHfHMUCfi32x1NIgYV
	Joxk8PPI4sCVXNfMts7HX1zcsA19EAIVC9Zdwq0YuFqpI4xFjCdf3/RH
X-Gm-Gg: AYBFou0B5KUQcgDf7r3sVHVW5Qi83E7jgSBWnu5Af8FiZz0pMqd2lFDYF0y3ge11VGY
	91Kdo1aEMmtiwB99FT01vMP4JpIlIVVibHp7NlCPmeou+h4LiKJf0vpWFLXhdACFeRmMBlr23ES
	iOFoR/+3qUfb2Lv3ikvbwPyGtO2Z+V1H41lwNGoCIDn4SSbVVWnbcwtejEtqIDOLoZo0y+YhkMB
	T10qj6n41hsfn5VWte/UwE+tvDp0bu3gdByJ65R91iiyUDSdSXxVbDj2DA1iDYhY8HBBU18dxwb
	LVoYlSR8E3oPVZhDF/AyjpAs26nbB8dhQSbaciJAceQSKNQbIPOz/h6PS6wXYmo48gsnH5lBxB1
	GxFLfTRE+bwu+hSfSmDqTAtcRDeorcQE9XnJyTNPkUgzwXX9vM3atXC/3jD3Y4q0AYxF3yOuNYP
	vUVmks54l8RL6K+TyfA2HtOKSIVm2iPi6KbbrKfK9P6Nw31rrOa6ENMrVJTNAVTqs7DjaeCANKI
	wVLAY9kCNWcJGINHK429IQSxylU740OhX8=
X-Received: by 2002:a05:600c:1908:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a18e4dd018mr144049015e9.34.1791745844160;
        Sun, 11 Oct 2026 12:10:44 -0700 (PDT)
Received: from rillian-arch ([90.244.147.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm225209795e9.6.2026.10.11.12.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:10:43 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v3 0/4] leds: flash: LM3643 dual LED flash driver
Date: Sun, 11 Oct 2026 20:09:42 +0100
Message-ID: <20261011191026.149338-1-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a flash LED driver for the Texas Instruments
LM3643. I wrote it to support the Windows Hello NIR illuminator on my
ThinkPad X9-15 Gen 1, which has a single LED connected to both current
sources. The driver has also been tested by Ruslan Koreev on a ThinkPad
X1 Carbon Gen 14.

On both ThinkPad models the chip is described by ACPI but has no _DSD.
The original RFC asked how to supply the missing child nodes. This
series includes DMI-matched software nodes for both laptop models.

1/4 DT binding
2/4 driver
3/4 DMI match table and values for the X1 Carbon
4/4 DMI entry for the X9-15 Gen 1

Changes in v3:
- dt-bindings: document the enable-gpios (HWEN), flash-gpios (STROBE)
  and vin-supply (IN) connections (Krzysztof Kozlowski)
- dt-bindings: drop redundant minimum: 0, use led-controller as the node
  name in the example and tidy formatting (Krzysztof Kozlowski)
- driver: enable the optional vin-supply and drive the optional HWEN
  GPIO high at probe
- driver: reject an out-of-range max-brightness rather than clamping after
  registration (previously LED core applied max-brightness exposing sysfs
  before the clamp)
- driver: allow a torch output to be switched off while the device is
  flashing (previously returned -EBUSY)
- driver: take the chip lock when claiming current outputs
- driver: fix indentation in lm3643_torch_get_brightness()
- 3/4, 4/4: use DMI_EXACT_MATCH for the DMI entries
- 3/4: log use of the DMI description with dev_dbg() instead of
  dev_info()

Changes in v2:
- Rebased onto leds/for-leds-next
- dt-bindings: make flash-max-microamp, led-max-microamp and
  flash-max-timeout-us required
- driver: return device to standby state when the last output is
  switched off (squashed fix provided by Ruslan Koreev)
- New 3/4: DMI mechanism and entry for the X1 Carbon developed by
  Ruslan. Plus a minor update to provide a reg property for consistency
  with the DT bindings.
- New 4/4: DMI entry for the X9-15 Gen 1 and update struct names to be
  model-specific.

v2: https://lore.kernel.org/all/20260928094302.86966-1-rillian.grant@gmail.com/
v1: https://lore.kernel.org/all/20260821083620.68324-1-rillian.grant@gmail.com/

Rillian Grant (3):
  dt-bindings: leds: Document TI LM3643 dual LED flash driver
  leds: flash: Add support for the TI LM3643 dual LED flash driver
  leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen
    1

Ruslan Koreev (1):
  leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

 .../devicetree/bindings/leds/ti,lm3643.yaml   | 143 +++
 MAINTAINERS                                   |   7 +
 drivers/leds/flash/Kconfig                    |  12 +
 drivers/leds/flash/Makefile                   |   1 +
 drivers/leds/flash/leds-lm3643.c              | 929 ++++++++++++++++++
 5 files changed, 1092 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml
 create mode 100644 drivers/leds/flash/leds-lm3643.c


base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
-- 
2.56.0

