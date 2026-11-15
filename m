Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765714;
	b=TGAlPOwpTMpUcp7z9SbYSCBlmVNmqHjcmjLJvWWrB+9TWAIxCv6G/Usy/JOuerz1JEO6
	 ZjD+86zIbTwt7F6GYFLaOv5JDNYrrFOPV7SvKQh2x30L2d9sEq4B5yxKx74exKjwi+HKL
	 ciHuUZGw2Qvirl6x23NJXkGvJxJV4UgUQntLivRu/yj8vegPu+Z178ccD98Gc6vbXdUOj
	 O32TcxJtrLl8c7InvlEQqfUKLHGLx+H1Ah0goxt77NUBgdGgxgaZ7n/WSof0H08VxYJVi
	 uTFv+3+5p/U6e2RAmJJ7EX8cF4xDAPuzY1bVUPq2N7i0NLun1ho0KRhWwzRoI9N6sFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
	b=PnSg7eqUiG3ZS6pN2uMR48PEF8Rs+KK0cdXzJJzjdEdr2kisVMcPsbA9MbNYeb7TALfh
	 BvWb8ihYdmdMQwEK0dUWFK81fuQ8Vttf3qowQd6h/cDGbrSELB7y6+9b008MjFNyvEbPW
	 h0Jg3wxU4gI6B1YIMbXt8KknmGCX4MQTbvBX7tcTh42/pN9PnxLTubr2MaWf3itODUyiV
	 gl7Ii3sRRFFRJ0DlcayDbX/xtGXWNz0YjkyZGi0ilphm9xTbE6jJNtTttved689GJset+
	 zzSirRodYK9gq7JCVVfHn1NHek+jF4Wtd7hsTTiY1A2BdCLL11vKbKBHW3DMbDFBnyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="XtSwzx/n";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611A1606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611A1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XtSwzx/n
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b09a466295so2125927a91.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765713; x=1795370513; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
        b=XtSwzx/nbNSdABS3ofNzPUu5WUAj9iWd2sCzzx/2SYxYje2plnvtlJ40Ntr4F9uQDQ
         F7H5djy/gljmrV3UP2T0/gBiv9hrripDXokExFqWnvjsYc82tH7SkH8u41B3ARrIJDab
         /uUV+z+vW++31aC2HyzjHy2C3gezHJa6phJOp/QDDW30J8KbIWNXK9XxLjpv8XItVDvU
         WqP+7CLGRujI+nU3M99MTp++DwrALk9thWRgAECRYSev3q2Afw9kPmVOO0dDr4SNuF2r
         S0tjvlFxC7PA17mNleht6enFGXZ6yheRpoyG1HEJJfFUfjjtHD1eNllU/oimkXp3mTri
         5w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765713; x=1795370513;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
        b=Ppqb7ouYLUoC4ahjHe9u6O9zmsAbvm3/47LLd2Ih8/AUmON8npyOV1OgTj+TVZrYMA
         sjiWO4AC+9kpggmkO1FJYruufeJiYgK8cJGuwTnBqnMDoRFPuRzKy4HCFu7EBE7vKFi7
         gA8pJ9bD8UOFCXTGJhBcLqYeRnpNSe9D4UJz5EmdHa7ZNYQPxc7YVKa7qRuQShMviSCR
         EoscmyBf62Z0dPIQF7B/Ek8iQRrqjgwZbFjtVn8Oyf8LIyBOHxIgsmiA4eebxg5s/0Sn
         rF/mNQ/2yZpxDbKLnNTWjnZakpaR7YfQwtzG3e8Jl0MMmNdjoXIug2yFzZASDFrhCjS/
         r+cQ==
X-Forwarded-Encrypted: i=1; AL+hErFc/LzBe7dArQycT8qb696S0OCqZ9foE10vZMvRzz12RwaMgvMWttm9VopuyJEdSWKGOKjWInL3K61t@vger.kernel.org
X-Gm-Message-State: APuU4Z/XwEHe3Kum1t0dJpU4TYOPNFHkEkXzgySC+qjdG0OQ7yia+/At
	hGeF2z7egNEGXaIftbzUgGgVpHgyxzn4wnfVas7eMctetl0LuSAMbWGFd/Q7jDsl1t+03Sfe4ZL
	qZmVd7+X+MwX0iVYNZCAl9WD+Leq1cc6DLw==
X-Received: from pjyq1.prod.google.com ([2002:a17:90a:e081:b0:3b0:99cf:4070])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2246:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3b1b0ba1c76mr7285600a91.47.1794765712405;
 Sun, 15 Nov 2026 10:01:52 -0800 (PST)
Date: Sun, 15 Nov 2026 23:31:45 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115180147.1208082-1-vamshigajjela@google.com>
Subject: [PATCH v2 0/2] spmi: Add SmartDV SPMI controller driver and bindings
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

This series adds Device Tree bindings and a controller driver for the
SmartDV Technologies MIPI System Power Management Interface (SPMI) master
controller.

This IP is integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga",
"google,lga-spmi") to communicate with on-board Power Management ICs
(PMICs).

The controller supports MIPI SPMI v1.0 and v2.0 non-data bus commands
(RESET, SLEEP, SHUTDOWN, WAKEUP), register read/write, extended register
read/write, and extended register read/write long transfers up to 16 bytes.

Patch 1/2 documents the Device Tree bindings for the Google LGA SmartDV
SPMI controller ("google,lga-spmi").
Patch 2/2 adds the spmi-smartdv controller driver.

Changes in v2:
- Dropped v1 patch 1/3 (vendor-prefixes.yaml) since no "smartdv,*"
  compatibles or properties remain in Device Tree.
- Dropped standalone and fallback "smartdv,spmi" compatible; use only the
  SoC-specific "google,lga-spmi" compatible and renamed the binding to
  google,lga-spmi.yaml (Conor Dooley).
- Dropped all seven "smartdv,*" DT properties and moved the per-SoC
  CONTROL register parameters into of_device_id match data
  (struct smartdv_spmi_config) in spmi-smartdv.c (Conor Dooley,
  Krzysztof Kozlowski).
- Dropped "clock-frequency" and free-form clock text; made "clocks" and
  "resets" required alongside "compatible" and "reg", and switched the
  driver to devm_clk_get_enabled() and
  devm_reset_control_get_exclusive_deasserted() (Conor Dooley,
  Krzysztof Kozlowski).
- Updated company name in descriptions/Kconfig to "SmartDV Technologies"
  (Krzysztof Kozlowski).
- Removed <linux/mod_devicetable.h> include and changed sentinel to "{ }"
  in smartdv_spmi_of_match[] (Uwe Kleine-Koenig).

Link: https://lore.kernel.org/lkml/20261103042608.387626-1-vamshigajjela@google.com/

Vamshi Gajjela (2):
  dt-bindings: spmi: Add Google LGA SPMI controller
  spmi: Add SmartDV SPMI controller driver

 .../bindings/spmi/google,lga-spmi.yaml        |  56 ++
 MAINTAINERS                                   |   7 +
 drivers/spmi/Kconfig                          |  10 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/spmi-smartdv.c                   | 488 ++++++++++++++++++
 5 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
 create mode 100644 drivers/spmi/spmi-smartdv.c

-- 
2.56.0.611.g1030f0b940-goog

