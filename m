Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392546;
	b=5syzUeA9ATMJybSEgoCOFUuKS0zJ6bs6yXcSjb/VYSsEMUDVvsO1FCZWSoKmszwNhtLN
	 3/cjAHX9JL6BwBDvYNEFxpsNiprwE1xAcPyfxaStozNDL1FI3SC+UQ/a01wutjYPSGLqV
	 yyGicVk05TDjPqOCz7GUmjFTWmMzZzL4kVj8rVu9Fk9HBBusqemAX/leiIc8NU7ztoWHc
	 x1m5npA++KiDpZpWx8/bK0FdCE05+/EmwWElhdk4+Iee0KilfOYcbt+S2opbx+xoPjbPy
	 0WRvEXswMZSmKGv9eYxJtPzSgJaO+ZiNm6g6PLUbto7UmZD2Mxn2PjyRjiKXEoNC0UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SN1nku32vaFiTenqE1IuYVioDYWxzqsexpbb3IFiLMA=;
	b=F0SoOep7wChs9rD/7QmI5Ne8bzBRaawYR5VaCEQMe4wRp54y4ANm3pXLtO1y9MopyRee
	 C1WFdGs+NGC3evycsU7tVPMjGIjwFcyHB2E2s7w/Y6gv9tjP5rmTERe2PFkk2i808Xls9
	 Zktw0cwl279EldmBFxKRHloRzaFCCtWwYUvpRC3V7Z6XNF7ysn+2QPc+IB37wf6lbH5XE
	 tJEBcf/dmdFWniG6ybxwOdyGIQzTs+2aTo6a1QV4pJMo2CuZ4wYchtZhfrhs98zmFmvi7
	 UpVBKPeQg1cx2O5SqJsu6ugWohZ5i5ojK8KXXSlqMIv4Vb/oJEMPpHt9d+lg2EnRWtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="DTlfrjQ/";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E201606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 20:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E201606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=DTlfrjQ/
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2761c69fbso138888c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793392545; x=1793997345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SN1nku32vaFiTenqE1IuYVioDYWxzqsexpbb3IFiLMA=;
        b=DTlfrjQ/VHNxMLfWO6pvlc5ajLU1MYy8EDBD/923WefzkcYMPYXJTMQaOqCdT0VbcU
         TmVzApEgUoKReUCNLlW2Ffw6rqKbIui/Fx21a54XebtlnplJphN4JnfQ9QrVWQJhJxc7
         9TAhPbNMVSc0scZmk/zRTblZ2zrP78gg6IPKJBA0ko26IQ6mgDJLq0ZpO/Wzw+0ckN/l
         /tIKhcBSLvTyBhi67UEKRfwMyq2fc990wiBUSfPFaNxahhC3jNgm0LZqWuVj8PrDZ4KC
         81M73Mgs+3P1K9Nt2kdIJULcgN414SlSqiEDBku9aS8QzhB3t/+uXW3bY/2sAtBAdgCF
         HyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392545; x=1793997345;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SN1nku32vaFiTenqE1IuYVioDYWxzqsexpbb3IFiLMA=;
        b=YIiniKWjIJWetfvQQOxtWyWwBG6BPlxwopuXcvwhh1MvBRGWpKoPcrQ731fBiYT9hv
         TisF07BzBWHJhVju8wbUtkn9hqXFpKRkrCFQW10eIavzXti23uc+gx0IxRl5D7/FfeVV
         XEi2Hb/GXzDhKaPMqeYB+e2DaiY8utb+QtVmdt0j1Nn7TrxehT6mqjUVMrGrHGfuveb8
         94T4A3jVKvD/fXeCVVcW+MExPlFKR6Wr7uLYrP2R0QbxboZ1OLRFTtjyeXE8RjYWr1SY
         mPm2ni3/9DbSYErC0eZT1VLNg1wBSiCfw4Dclfoejf6E6Skd0KKJxF1BS9V7f2v89tcc
         77Dw==
X-Gm-Message-State: AFq9FYKqgdm4A6y/FLBDgApwuXl5/7c3A9dZIl80LX9zqsPd3SVFfxXu
	Ph1YqpQy/RKuHXL3ouV08w0p+8TCrEuXCuzWn9iuHxiAO1V3HeLzOqfwuJ/2152W8dQ=
X-Gm-Gg: AYBFou3OakWRkBSvm00pHHETz4m0YIUUGWKcAlP6qkCff3Wc+oahWoLjhyE0VcJenB/
	X9PoV9q3xJB35nfBq95dcw6RMOOS8Sdq6gMKLVrbR/uk9P9hMXo78m08p2Mb/nU2QsajE4Ovl2y
	p3fhjWZVsgGrcKJy7lDa953B7tqo+3MkMqAxuYSSYAnLY2N8UEh1UWMe5QPzf9Z50zULUfi97nf
	6qaH/FTG3/jR6WrDdztScsue0WTYjZeIUYFpMIa/yg4O7UviWUVkBiXqc+vzwn/en7zgllt3TFQ
	zZJRCqLHZGQx1kxcg/jvR8y4MIyoRbJ4q1artEirUEyyxn1ffBwXX/CD01TFDluhttV+RiIIt6A
	EpH/9LCr/jEWYFR561jDDPkhDb7wVDgOKRtNWdLcA0nBx4gLVKfFidp7W1QUX3IEwKda5Vkiz5r
	M7KE+segz8sFg+GM6y0Avoo8mwvvmGpNoQZkcStnUpeqIhHOmKORvkq74uKqJpBcLfee/Wr0WhR
	AXlzrRdbP0nRotorryVw6DvxQBJlWLfsgcGzzmFDSHOjhc936XNkQkhIPKCXfX0MgJv1fB2EFN7
	R/yAqONU721GRuIrc+J02OhBoIr/EHdX/T463gZOsG5h
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1ade9e3e335mr2396890c88.31.1793392544510;
        Fri, 30 Oct 2026 13:35:44 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm15120020c88.7.2026.10.30.13.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:35:43 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Subject: [PATCH v3 0/2] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Date: Fri, 30 Oct 2026 20:35:36 +0000
Message-Id: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJj/5GoC/1WPS07DMBRFtxJ5jJH9/IkTIcQ+EAN/XomR8iFOQ
 lHVvWMnalWG17rn+N0LSThHTKStLmTGLaY4DjmIp4r4zg6fSGPImQADzRnX9JS4ZoKCkkZ4hcG
 rmuTyNOMpnnfR+8eR0+q+0C+FLo0upmWcf/efNl56N2lzk26cMmpsODU1CKM9fxvwvHTj9GwjK
 dYNHjhgdw4yxxqTH2urfIB/3PU4Z8bvNc9bjhtJjynZfV5bvdyF3U8/DnTq3ZqKXHKgm8xyqNG
 jRCkCkw/y1zLM2YTUj30fl7aSjDnUjeLKC6g9Bs2YAZf5gA0Da0IjvAsun3X9AyIhysZ9AQAA
X-Change-ID: 20261016-fs1603-25483c5edc57
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793392543; l=3249;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=cTgLvVzXaKHSwBE678iEgA8UVGNfgBCAPJmAjE3eC88=;
 b=Vu7zVw+XBh1ibGSRgqoa6lb8P65/Wi0lgWnaO1NKouSN3Dltk2HRiB2+5WY0rOBTJfEOI5YHO
 BkAYsjPhrSMBOYx+cNrHCJ5MpxAjqf1sVpPccYMgN2Ml3AnTkHg9Fpd
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
an integrated inductor. They report input and output voltage, output
current and temperature over a proprietary I2C register map. They are not
PMBus devices, and their register numbers collide with PMBus command codes.

Patch 1 adds a devicetree binding, and patch 2 adds a read-only hwmon
driver. The model cannot be detected from the part, so it is declared
through the I2C device name or the devicetree compatible. Parts that
encode telemetry like the FS1603 list tdk,fs1603 as a fallback.

The TDK vendor prefix is added by the FS1412 series, which this series
depends on:
https://lore.kernel.org/all/20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai/

Tested on FS1603, FS1604, FS1006-3300, FS1006-5000 and FS1606-0600 parts
with the driver backported to 6.12.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
Changes in v3:
- Drop the vendor-prefixes patch, the TDK prefix is added by the FS1412
  series (Guenter).
- dt-bindings: Move to a dedicated tdk,fs1603.yaml, where the FS1604,
  FS1006-3300, FS1006-5000 and FS1606-2500 fall back to tdk,fs1603
  (Krzysztof, Guenter).
- hwmon: Drop the OCSet probe check. OCSet is a programmable over-current
  level and not really an ID, so it warned falsely on boards that
  reprogram it.
- hwmon: Match only tdk,fs1603, tdk,fs1606 and tdk,fs1606-0600, and share
  driver data between parts that encode telemetry the same way (Guenter).
- Link to v2: https://patch.msgid.link/20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai

Changes in v2:
- hwmon: Scale in1_crit by the feedback divider ratio measured at probe.
  Further testing after v1 found that on boards that raise the rail with a
  feedback divider, as the FS1606-0600 is used, VOUT_SET holds the 0.6 V
  feedback target while VOUT reports the rail, so v1 reported the
  feedback-pin trip point (about 0.72 V) as in1_crit on every such rail.
- hwmon: Use named initializers in fs1603_id[] (Sashiko).
- Link to v1: https://patch.msgid.link/20261019-fs1603-v1-0-8adf972386c1@nexthop.ai

---
Kevin Jia (2):
      dt-bindings: hwmon: Add TDK FS160x and FS1006
      hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters

 .../devicetree/bindings/hwmon/tdk,fs1603.yaml      |  53 +++
 Documentation/hwmon/fs1603.rst                     |  75 ++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/fs1603.c                             | 498 +++++++++++++++++++++
 7 files changed, 647 insertions(+)
---
base-commit: 400be69515c327ced60082b27ede902a8d93cbdb
change-id: 20261016-fs1603-25483c5edc57
prerequisite-message-id: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
prerequisite-patch-id: 48986e9a4b228cab399cc8b28ab5cebedebbca09
prerequisite-patch-id: e9d346bc8703fcb8032b663bddb7514ce31f2c1c
prerequisite-patch-id: 460dc5083895fdd9fc430ce886736561151571bf
prerequisite-patch-id: 34cc05e38fdf5462d315c20f186a2c2904a572f2

Best regards,
--  
Kevin Jia <kjia@nexthop.ai>

