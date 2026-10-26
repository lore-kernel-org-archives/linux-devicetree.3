Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049122;
	b=d01W17zN/Yi4lKCp/XzW6aVpPqhkIgRkKJefWKt9lKnoAlOWnjWKsInZ2+spnNgopwil
	 lB3IqhNnpGRhcptUf9fcjDe2mfk2oHWuux0HiZ7gfOuIRG3fsA5MQbjbgsxd4mP33OhpW
	 cCkjJZGi2w7BiBgkid08jV2UFzCoNrw5PSVnBFpnbHCfKfbnzSDxOZeT1QBUa9znyILVQ
	 //kio91lrLZ02QeId5mbvEMXnU3/P7FS/5FwEaPaRt+e8rdxSBt08cYRzrgBozQBxwzTc
	 qUm/mcpuN5y0QQGl92BFeyV+MNLFDo0j3vOkwTq7x00359On6CykYsdL+Y5MS9PBYhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049122;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
	b=vCKMbKwAs6wbDNMQMY5ao6zwgwaAzlzSD26KW8FcMEGcAbzheUjIUrNnNY5oeSvk9YdM
	 PQXSvdK+k2MWt7z6uF265IVVyN5IDzVDv4r6xR/38xJ86DqAiN50hyH9qryLfxgoXzlhg
	 GQiQz/+ZRm9KggG4BqCWVhsSywYkDNqXA9EgKbLQXWvhg1FE9NZ0jsH0StB8snja/Sawh
	 tKzgEFp5kiCNDMmJIISGw52UWjWCET8ntl6uFZWqxM8IT+UhsLaQrQsSAdLuju6JzwodG
	 I/22ToI0ykvT3URDi3cqgdy1xO745bbFzmvFeQelCj9Qur2cQbkDUeVw+5JW5r6ZteQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="N7msw/Lj";
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CC606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A41CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N7msw/Lj
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93f3c895a0eso268412285a.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049121; x=1793653921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=IAvAwqVM9DR2dAf6smeobq6IHT8uxDridJR1WYfy6V0ww3bbvsqHksNb2ZckwSNS8x
         9s4nOh3Wf1MjbmNz1Rv+ZYbK8U1UwpjxBrmnRH45VHuJ1CnlBYBFxPKIkTC0FEQ+0X4Y
         8m7PdmJ4ACJ9kaMOCtNZtsfaO+xbp+Oz46iz2s2fmY97JytfvM2MibEhY35HImV7j72V
         Uo3zbBYwUOeSPEjhX11oLYX1YSJfXS1J/ERVri4VbaS74Ujh2elI656Zcp9v0wADG0GD
         /+rStvRx+whypnu2Fu+qyI3iv2pQRo8m5PYYAQj1Fm7MsURDP7lP39ubbNIoDYom/7eO
         TyCw==
X-Forwarded-Encrypted: i=1; AKwUvBwjWMTa6xn082cwri9EBmFUe63OgtJocgkB1cUkb1aynMq7D11iwVts5rPP4K8er76ObjeOhPKqw6Cm@vger.kernel.org
X-Gm-Message-State: AFq9FYIbXbFHV4BfwMvop/nes67lLnVln6sLrGCecdfIzTeD/gN0UQEf
	PQ4OeBX2ajKvgBnBzTU1eyZFqRYDblEnnWhPdq1KOMUV4rwpTEP/YA7t3JyY9Z0TQ3LzTE6CnRE
	dK0hMXkC65TWQexgXLMXWJn1zypcY0/EM9ZzdHBPXN0Outft4qa3VZGpa+9zZN97oK8taxvFazD
	cpwbiblW24tPqZdw89EBwbKjM2HOjA+z+ZxNass6v1Zb7o78axsFiS1svO7wezEn/jlynT3VOut
	9+jREQs4PFAG57wcouk8bu7
X-Gm-Gg: AYBFou16ZyjpmJCkE9Hd6QzDuus8vf4SL6Iv9y2LYL5DAm/SkwuW3V2YVbLSa5GtJTs
	aU9C7fUOXdKe7hIq7JNNb7pGGmu4E03a1lvOpfgX976z4ZTds1p2fHzooTDkiUl/3VrGBpjPnUz
	IhH2TWCt5VQVbHEN3/mziXOs00ueSDDsIDH3C/f8lpyaA08Ubt7twX2Aj6Qm+6wlva6LU3kiHy0
	/NTGnDG9v8fueoSmezcFDRyreP7s9zRo/hDDsbi2oa0SdEjmXv9qrNK2iBXw+mjauoQuGdIF4ag
	4hZugxlYH7AnOAk78xgTq7V4+yh3r9upqwEKWtemL43wLtkBhhste+LRswuEiAKBMn0ZSzfWvE/
	HeEKxfrkHo2vcP28w4pjXxJO9JOSQUwPqVYbCqYGsRh2ibkKX0CdNoYfFFXjceJr/USmqFKOfy4
	ExNx6tCfFCmWJ6efjreWztINXnKc4UFq5gIGupHUfe
X-Received: by 2002:a05:620a:6887:b0:93f:643f:4f5b with SMTP id af79cd13be357-940ef96b4c5mr1184429985a.48.1793049120585;
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f0661db0sm108132585a.3.2026.10.26.14.11.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18b5ee75447so3762670c88.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049119; x=1793653919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=N7msw/LjUAO06jTT33HAeE2jfXss/tWdcRa9CMPvn2AKZ84mrvNCO+U7NZQpgULCVG
         ktJvfFKjLUPxWZyP7zlpGrpw15mIHiNENiWyKewSda7W+LPLvHHM0zs50wssyTonX1Jn
         HhxxF+MXnk2PkUrCusJPEKXuOzENWxd0e7gWw=
X-Forwarded-Encrypted: i=1; AKwUvBzRrSYbhrEnixYe63voyYdFDNbWi2Uw2aVMGfGTKuNgSILagnSg4UBA0S4wjIQufYeoRSoDxsWOZTWE@vger.kernel.org
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809690c88.26.1793049118860;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809638c88.26.1793049118184;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 0/3] Support for BCM5301X AXI trace PMUs
Date: Mon, 26 Oct 2026 14:11:48 -0700
Message-ID: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for the BCM5301x PMUs which are AXI trace
engines present in the chip.

Florian Fainelli (3):
  dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
  perf: Add Broadcom BCM5301X AXI Trace Module counters
  ARM: dts: BCM5301X: Enable AXI PMUs

 .../admin-guide/perf/bcm5301x-axi-pmu.rst     |  92 ++++
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  |  43 ++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi      |  15 +
 drivers/perf/Kconfig                          |  12 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/bcm5301x_axi_pmu.c               | 450 ++++++++++++++++++
 8 files changed, 617 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0

