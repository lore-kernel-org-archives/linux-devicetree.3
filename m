Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22062FD7D3
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776531929; cv=none; b=BV6Q8MFygDRGoGdWFAEsDZygDS8L/1Czm3cgCBF4Ktf5EV94J7UTTzWL7D87uiG2/Gh46MD6XzzafdBitj2ZeawovSMTGcjJJUn0C8rGwGHaTRFmdC79Z/2Nbyr9ERkH5ofjg43TOelYdrGbxWJZ4qAhxrMfwlyI0FRnC7mjeOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776531929; c=relaxed/simple;
	bh=neIqv33XDkWCxv5AJkbIxD2kIAFYCAOzQOTm8Hy9v9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NvMM/XIK3dgbegewu3EShm57GDuieGazcs567Ns4PfUfjqD8DVWWfBkQH8QHn1G0EXE5aMxa8dvP55xC/i3s6dwNfSTLp/9fIo5EBFFO6rjGd+OvAKsJIxmtMeat0j6+W4VeFZoeX7hINquWZ3pbR0XGCfwi0uE2MtJp/5nLbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhJdqZmZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhJdqZmZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f8b60e485so680578b3a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776531928; x=1777136728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MR+0rwyJXAQ9d2qblUNtIVZrppwjIymKB9Q8yoxGiY=;
        b=lhJdqZmZnLs53OEoLjtSn9DF6ijKyEQ98W/P4C1870FWCBfIphh/zV0CH5zB6FuKGc
         MKq/CwJySj5Lfa6X04ZQ/PDU5d6aWBeH7lLZLYh6ToP1VfnVOrYrEpi7GGBPWNvGhPqn
         JfYW+iN4n4k/QOTCM1RnSsfx58A7aJ4IIKeTkiwzcQSSzjkItc+wcLxIN8n3FGQSRj6/
         siELZG8rUwnyJZ30VUGeFQa0dp1my8IQCaBbm5jCIjGgbJab9tX66+ZCqNw9IHEkhHKb
         BzFsw2Ge9YrqPTnAx2YTOKbhDHidPWQbiuchfVfRtBUfao9Qiq649crsVw4dLz+dGly2
         1mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776531928; x=1777136728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MR+0rwyJXAQ9d2qblUNtIVZrppwjIymKB9Q8yoxGiY=;
        b=IWaFyeAtb5UStWI9eRnLt323sSrTGbk1rpgh5V9w+VTpLzzX9lFLrA5fU9lrdaGgxD
         UFIHAPXGWZuUBqxgVVMbScLYYfNzvLiSEVKjoHdtPHK2DWym+rxDI4H68UuWm7K4nGfm
         pRcwvucjY/uHPYhiFDjr9rIgarLmCtBtC3XIr5JIUhOpSiy1SIpK3q/AmZGo5RxlqNvj
         Dj1Ug/utI6JuZVphav6uvEJCe8h5Pur1pNEOhYkFBgS+NhJkpfLz7YBtmJtPdreCQc99
         EYRU8tUIerUuaNOdpF6CowaWJMWK2NgFLxxMvmrs0gClFmCMK8QQbYo5jxGyWjmX05bb
         J6Zw==
X-Forwarded-Encrypted: i=1; AFNElJ93dxoAFgz160/030uV/v6CGODHupzQnJsvKALnSiEwY4UY8FzSQFNnANJfoDWyN4nW6yq5+aeeo611@vger.kernel.org
X-Gm-Message-State: AOJu0YzisqWZqOQtmqMFXUJYPsjVC+pNj/uVIv8EmHR07tUDLw7KvO5f
	8cKKpSCP4TBUlpkiANHIBXYrnR0+TFpDVSsHcCF/R6TyMe1V04UjXfvG
X-Gm-Gg: AeBDietDgTr4Wengm/OdhaCIrmwINT/JlZr0bxPif8OFCKRdKuVX7EK9BSS6XJZtZFR
	+HyeYcvFQdPBK4Wh15jgCIOGN6QSFU9b7RXDa58rQ/HQ6FabqW2IgwsYE2pQCLJ0cvNasi2JLg/
	T48asCKSMNASCD9T/NQoykHAALbfpaMtV6uGe+vKPBRebeoBHu3nJdP0EVCkf/bKxmE1hjv8VI9
	f6Dh0AJD5bsvXLzrzB7hnel9VQUe4Yjti60kpMFtIREXXs6V7NS8ble0xWTY9N51xn1P2w6hR+i
	ZVTlAi3Wv192VwtVh5shnM5GgA/gxkwcq3kW0dUMGgH2WiFsJGpdLDaSrnuf/edBgVLszTIQrfZ
	DPoMNpfKlPNd1wN+/sVn+CS3hAXFEeYcz6tBa4/cvR0lGNL+jcysm441wfRDDgkcvILjzw2RV0C
	7SDT73M2CPEwgc6UEJ521Bwqpm6uLTT/FoGY49Mnwv7Tqk0zgeXaNAN9DKSgtAQCaJ9ZHFxAxJu
	JfHhxSLZW4qz9wl0Sekp/pk9MbFXqruoBIbFmhXyEUGc8zPnUI=
X-Received: by 2002:a05:6a00:bd86:b0:82a:5ef0:210b with SMTP id d2e1a72fcca58-82f8c8a5d89mr7538662b3a.15.1776531927647;
        Sat, 18 Apr 2026 10:05:27 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:3ec3:66e6:8cde:aa47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm4966352b3a.25.2026.04.18.10.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:05:27 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] iio: adc: hx711: add HX710B support
Date: Sat, 18 Apr 2026 22:35:13 +0530
Message-ID: <20260418170519.312360-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HX710B ADC, a variant of the HX711 with the same
GPIO interface but a different channel and gain model.

The first patch updates the devicetree binding to add the
`avia,hx710b` compatible and document the variant-specific behavior.
The second patch extends the driver with per-chip configuration, HX710B
channel selection through trailing pulse counts, and fixed-scale
handling for the variant.

Tested on PocketBeagle2 with an HX710B breakout module. The device
probed successfully and raw readings were stable.

Piyush Patle (2):
  dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
  iio: adc: hx711: add support for HX710B

 .../bindings/iio/adc/avia-hx711.yaml          |  36 ++-
 drivers/iio/adc/Kconfig                       |   9 +-
 drivers/iio/adc/hx711.c                       | 222 ++++++++++++++----
 3 files changed, 214 insertions(+), 53 deletions(-)

-- 
2.43.0
