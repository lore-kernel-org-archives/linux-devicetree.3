Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D802F8E8F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507374; cv=none; b=fhZcXA8dfPLtkUlr+2BVJ8sAVWoPzOv8WcGTQY+dHayLOkrTdXJNdgt1+PBg+5VwD4myrVWr3Au2AB8LPvfAuQOjP1cMg16S/ioSp4L6q7e3qZF5S0uuunTsKi20ggzgjRkeYn2hoy1TCoKDPgGoiY4zT6rFHtcgBite6NX0y54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507374; c=relaxed/simple;
	bh=TCmpqhsXFZvHB2hYI7sHMF1aP5fPfOZ0+46+VuzusmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qySyW58+0KpJ/b6l59yAZwScSLh/hqs8DM70Vb3CVJob1rro5IgEVfQpSdj4yGwl11HPWPm1YxAzm2G0TYX/2r1SxBfO9iw1dKjBij/7BcMDNyEQ+JNprssAIl6gIqggvD5UZUmoccgOXXTQxWfsPjkZCt5Jxm0xt9P7GH0L09U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=hdYwHpPr; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="hdYwHpPr"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso122629eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507366; x=1792112166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HtES7fePFnMezxtZEKW2N4T9F4gvLmApUzPD0F+adIk=;
        b=hdYwHpPrRODKcbXfgxO0VfjbViLi/+rEroIl5DNoHuDWcXkwmEwB2Jhy8Gk8Gw/TfU
         Vr5bNJT+FPAmTIDnNWlNU8ps/jvBWlt7Y5/SEp9S0FwpUtv3LhP3OKbPNpWhGyKQHzJE
         bVmNsaQ5z7HvnpYRjOBDwlxgMRAa+ibQt20vSV0rwi9gFya59F9eXL1MZBt2fwvzR/EL
         5qgMYbhQrJqdy/rgWNZYxQkTwoSW6xMQUSpFZBRq0srw8z/a2s+BcwbOx3AhaxTBG+03
         DojB/7vekxsMb7Vh41kmT1dXF+myHMF30P08UASCVkDy6TM5BHYI6IzFzfLpXlRqYyY+
         ihAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507366; x=1792112166;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HtES7fePFnMezxtZEKW2N4T9F4gvLmApUzPD0F+adIk=;
        b=t7ljFU3MoS3ng6HSB/m2gTfImc6P41CPhhjfPZmgvi1mEWIjrh9Ml7O5+2m36Wjd2N
         HLW2Vkjzm442IPDU0KKSBiaCdBxV0bpzyTwtSly2tVF2FYus5fj3SHl67Dgw4SBVWZbN
         5s6zfbbhaJbpE/LGbRDeq7/zPBJ/PtL5HdKJDQX1ERl16WtRnOwwOXMei8wx8hpM2afR
         blpJR3HLrLVjK6kTO6JxvaZyK202IJKeQOCp0/CPnW63l3vkj59fjmO576y1E8MXUPnl
         4V/d+A7+5WA77gkxfCHgjusZmd199bAFtl7AB+ur1RF8Gu6UVfJWf6LzZmsd73S/bEZs
         QJ5Q==
X-Gm-Message-State: AFq9FYKw/8Zj7Cmx99FoT9FMe5naBaqjE/66k2UNSyUYdldEr476cFms
	Dj0RfICZNPaxFDJt5Hvvjh6b+bMMZFG98KCQr5kEISlJflnUiJVJVkQUK/jogdZwCWpLsm/Ffc1
	NLjerpTE=
X-Gm-Gg: AYBFou1ZfHKb5ZCAp364+FE3/4ZIt63iFGvZzxgUG37SmDsRlHrv9ANlwLhY2GXthh3
	pMNeXE1Zo1X8ixYCatvuJOBHvJdJHQ1uLvt3jYahS1VrloI6i7Bp7a+W+EF+IVLljIY+exL92Rx
	pBJZUXLG35YHQMj/QVCT6GaKIWU8c9ZK10ZXcinHkarDK/iSjacWe3kMeNlk9cQkqqivEcN5/O4
	dpxOPJ8+HrdiBE6rEtLYD9sI9mF894FyZmPpuirJkYXq1oDCqJUo+LndZkmvpiFkw+aMTkM1uti
	3Y4yt8G37Gs1IreLZ6a3zZ7vqmqgEtEP0I/mSSrPiTG87MNXPp7wvQducWJnbTs9QHBq8SItEbZ
	wYqmib8/oXQSdWoYlNbFabR3Uce/KX+k4cMGQvfp2rkXSef2Wy+zTVj75Wo/XgRjwHDRt4+Asyz
	/Qtxn2eaWRQSCOnlBFHggnGd2TNVaQM2Jno1wjpOptq1HRAh50m3U5MfAnrvjljIe0xDNBNLEfY
	g==
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr881856eec.12.1791507366213;
        Thu, 08 Oct 2026 17:56:06 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:05 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/3] hwmon: (pmbus/fs1412) Add TDK FS1412 support
Date: Thu, 08 Oct 2026 17:56:01 -0700
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTtJpzagXsWwkDKVMaGQDn8J4
 e5WWX6L93ZQTsIKj2KHxIuoDDGDLgX47hXfjNJmgzW2JGNu2K39EHHsm1kxKDmyGFrnrq6iytM
 dcjgmDrL9p8/6tM7Nh/30O8FxfAHOM4/MdgAAAA==
X-Change-ID: 20261008-hwmon-pmbus-fs1412-fd4434717c19
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=1864;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TCmpqhsXFZvHB2hYI7sHMF1aP5fPfOZ0+46+VuzusmM=;
 b=R/58905oO3dCLNvhwPY8tQHf7EUw/OU/AJTnHSg4u/p8RsbmL1yQPDlcoO0ise8CjHl24rRQ+
 P/K/uALm+oFBlRy0MvoJKKelkaLq953P76jBDofuzCk7Qw8Aqny7jft
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with PMBus telemetry. Its
VOUT_MODE has bit 7 set, which makes the VOUT limits relative to
VOUT_COMMAND, and the PMBus core rejects that mode, so the generic pmbus
driver cannot bind it. This series adds a small client driver that
clears the bit and converts the limits to absolute voltages.

Patch 1 adds the TDK vendor prefix, patch 2 documents the FS1412 as a
trivial device, and patch 3 adds the driver.

The driver only advertises what the datasheet's command table lists.
READ_IOUT and OT_WARN_LIMIT answer on the bus but are not in the table,
and the part reports OT_WARNING at room temperature, so the driver leaves
both alone.

Tested on a 6.12 kernel with an FS1412 behind an AXI IIC controller: the
driver binds, input voltage, output voltage and temperature match the raw
registers, the VOUT limits convert both ways, and a written limit reads
back as described.

---
Abdurrahman Hussain (3):
      dt-bindings: vendor-prefixes: Add TDK Corporation
      dt-bindings: trivial-devices: Add TDK FS1412
      hwmon: (pmbus/fs1412) Add TDK FS1412 driver

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1412.rst                     |  87 ++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/fs1412.c                       | 179 +++++++++++++++++++++
 8 files changed, 288 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

