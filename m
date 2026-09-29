Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557AE51D519
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686716; cv=none; b=ZbFTMTM/p5/yRviUpiwBI/yTjhLh9Dj0fYylp9WR3sw8WlkSDMW3ClLDT/AolhhGsKBifdhg2PPZJ/7cnyUHSThyQFu47YeoeQpYO8p0kk5PO+8pWxysi/HiQ0nG78oU6T/kkf1E+8IFarH1cX8r6kbQW9DKDSNYThcbNMvdTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686716; c=relaxed/simple;
	bh=qxl+Atr5luw+W7OfXI5w9oFesDtEHRqgE0NcT9ttH2A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=F9UvQXrE/Eqh5MjySjEC5zJolAhQUUETBWnZOg0115rZG5ALxYT8WHYQxPFb3vasvjSyM+jb2MAwgBCXS8tuUq6FPl1S7b+ZiUDyPfroLaDGyDnID2VWx6El1SUlx35VKQGNnh8sPtCa3oUDI5KkUDmIYTCsarRmBIf9AsW8Blc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JukNy7j0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JukNy7j0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so23739315e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790686712; x=1791291512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnfU324HArntK/V5m555W6h2CudfIeZPIQ4Ghrx/YkA=;
        b=JukNy7j0iWQ9EtXJWGZBaci9IGUBhx8Mu2uh41ioYqrIWUpv5RedDBWpgj8k1fpwHn
         i32dwVyU3kMzZz6KwM3qRBXyNhorgrQufCagcmfs1RuqBjlfCVlz1tnei9Li6Qh9qDdV
         CGg1lKsLpHXDBaaobdW5csSs5pFZQpPozXALEErXi9nf0I1oB2eBKPdKFwZNjMO5NByn
         NrZDzWyAYE0jM6OZZxfqt8kjTQIjI1lKm15of8Bln99ZH2ucYTYlAXrDoqxcDVFkG0Y6
         v6McflblT/FDnDXqZYgJb4ecDi8lbEY2N7bRhRsBN6nwGtc+aCiGKc725qOBjV014VXn
         OcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686712; x=1791291512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pnfU324HArntK/V5m555W6h2CudfIeZPIQ4Ghrx/YkA=;
        b=PBOSgvHBlugeBWIdoAZSeRlSfxkFtxy0JmJPOkZQd4EtK5tb15ezmzhUY6ae8g2vd8
         6tLOUgyspcps267+FJQKYD+VGXv/9wCoqiSGdfCOXr7GMqQKSCmq69JfO9UpJfUTQU6V
         UyRhEb/oYkTmzv0kZSWvzmAYvqEQNEnc6OkJL5zdwtF4FSDqFv6N+3VW6FIZjen8Rz3E
         l+JL9NPV5gspRfm+50RIWrwf/bIfssDBxxqa542Rw1/WpnoffpdyQpLaNcdBt4t4Gpql
         3XfIrZxynWkI6BNe3DmFhFQWAw1JMWhGYbWfNy8ciIF6+uJJxoaO+jpDV0uHa2soFnI7
         XHgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZbGglP+VnPBBctUH/DgaAYbxnnftVk933y2HrKus+JLHNExUIee5amWz9QPiybvkyzBVD3Ih4+Xrm@vger.kernel.org
X-Gm-Message-State: AFuF++mmm0zFfK7heHI288V0wNKuz2lHz/WBTYk1DKFNk0SzN+r3NOZf
	A3thm2Q3I9LO63iCbWPazXRRZezHSsTMc+gOTjHuPLw5LPKbIIWn9ZodQxq+m+SYkVY=
X-Gm-Gg: AYBFou0StBXMs7De3C54exwJjFn93IMWBpwJtKR1sGjuGyt0yEGWDn/IyVymtPZ3CgJ
	P2ZFz1C2J7Rdm719jLRbLZheUkElvE6Ze2J7i5gNmBZKvV/AOdkQMwWVI7kg01tgi+zV4yLGpmp
	EvwI1N7zx0K6D2B6y0fmemkU6dXCz1t82J0g8euyE4j7zqx4PxZcgBaOiqueMzPdZSTeC+utqwM
	b0dM1luX9QpuFUDBpHTitfvdiCV/+Zr0vpi4oVxi7+6AJOu84R30LVmZpox5kdyk2C4/RGbSgqQ
	IlwrqFgT0Qy9NgWNenijsU8BIOQq/InZrWFBfohKfyVWQ19QY251Mo5rRU2fTZi0ZjEblK9Z8gc
	27gpnBpDNpwmdE7gHPPSNGW6fAERjziMcIds3temd7J7C3ZzdpieF9Fll6wCyLPNalm0aAXbNxq
	Q12JF9clNes9I/sIcii79YPwLsZSPakE/xSMQbugLE9f4GMC+tirmPOjrdypzbqzfmgywlL9M=
X-Received: by 2002:a05:600c:1d19:b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-49fe66f1486mr272629675e9.21.1790686712414;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50a65f4sm3682296f8f.35.2026.09.29.05.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:58:31 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v12 0/2] Add RP1 PWM controller support
Date: Tue, 29 Sep 2026 15:02:10 +0200
Message-ID: <cover.1790686331.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which will be exported by this driver via
a function. A subsequent patch will add the function to read the
speed to this driver and a new device and driver to read the RPM
and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V12:

- added a comment to better explain why we don't need to save and
  restore config registers upon suspend/resume, hopefully Sashiko
  will stop complaining about that.
- the RMW access to teh global control register is not synchronized
  via spinlock.
- patch 3 from previous release:
  "arm64: dts: broadcom: rpi-5: Add RP1 PWM node"
  has been dropped from this patchset since it's already applied
  to Florian's devicetre-arm64/next branch.

Link to V11:
https://lore.kernel.org/all/cover.1790606188.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 428 ++++++++++++++++++
 4 files changed, 502 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

