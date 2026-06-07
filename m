Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B06278156
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780820463; cv=none; b=bO0By5tJhrXjEFaRzk6yCgq6TyRh4xcjPrjB1t4j2k1wPLY4UjDrS86lFoxnNtsy0hgqJKlJEMxzJq5xUZiwcZOJoftj+IUzOIg2OSh/no8PD9RcXEG/JXjQiZ3GAecPGTYZaFPhyVe4rqrTlZp6TCRBHUbirPuqlOhCpj2Wr+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780820463; c=relaxed/simple;
	bh=rATwyjdaFtrJ0McnHdAuGN/9Ljvwmb/HfIFoHuMVL+k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nqxm2jlILwwYxOTLGj+WI8V4zWLwxUV1KwWupe2GtGOKFJ5U56QxvVOkBdYz5OeeQC0AIeBngTncFZfDiG9/FjDyTXLZE65bAFJ27FUsF8z3XtBrE/uvw6xrN6UkVVCJa1XkTNLG53uj5z8dimypbW4nyao4Mp5PkIjwkD9u7Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=kyghw2nl; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="kyghw2nl"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13807d2f898so2030647c88.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 01:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1780820461; x=1781425261; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9J0NH/I43sYxlpFkbjUNBNG1mQYZWERsQGhvxWJVjs=;
        b=kyghw2nlPz3O/H4RXEDoukcgqkU3OwEPXOo2o42CjsubDe2Jc6qMyosEo2PJlh6Vqb
         KPoGAIgyOSV9lEJnXBjVbMq01LPEa/Zc4oKIoPrNtTvvpF6PxqNU5ehJn8p+dbgHnl/g
         i5HVerlYTusZvY44v2KOnx+kwFhnUhaQfQ0aMJsXtGyIlczQlCHkO9RG9ssHOATN8TRm
         7Zf0nAS9PvY51p9zfzmoP0YB8hvDjIeKkWumCZiYC/NCcJLhwL1SVxhkroFFGaknR6j6
         42pHmJP1qnUzYBKU90cbqBQUMMOfSOy5mxnsbUZV8vnLI4EbAnljzXcSc+n6RTpOWvvj
         ITaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780820461; x=1781425261;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9J0NH/I43sYxlpFkbjUNBNG1mQYZWERsQGhvxWJVjs=;
        b=QkYxNSvWqYZ7ftuNo7bp9HNv7GwtSTqqWS+muOyMPvvc7P94Bqn3JB4T5QOIVWApuM
         9VqC/CErw6GkmFw4OJ2oHDoc5O6ONq/G1z8YyE7/djxDPAj7vR6Y2MD8h++LML8K1rFg
         PPOkggUtMTzijKdsKaOyNpgtmFBc+Z0tMKkd0SUdYGTJCwg86YXIKrop0S6Febp9X+RS
         B/wDtqgqNAnGL/ISinz9SgTxQYTUgDmGXA8aNNWwd6lyvYUWmjekEVayXQP/gla4lBtO
         APalm+e7tHhhBI04bUkxR3EEsCiRzhqQkl4I9sAsCVxywpR8J3Qrw5XX4Nc40KcER2DD
         s6wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ootjLv3nYdfl+T3r0XvC0mul/VRH6GoKzB2kjvYwRBnhEgMJ6YzdQP64EL+CoHKCjasbuyJm4GPvc@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvVA4MqP1vBGiiQ3CAj5TQGp7bN9GzUrchySioRZQ3ojYpm5x
	m00wKjraV3HNJaybQyPdqe6v29+a1hFHj0ulvD8xFTvIt8cb5rF5GT7yI+7hN00Mdgak/1mNm63
	4td0Z
X-Gm-Gg: Acq92OFfvpY4bmJgKQCy5xMYnlfhI7w6RZMY+EdqqsV+86X1c38WT6i6nfxZ4Gh4SHV
	CR3kbQTYbyGN0EtsiDK3YuRJhmPk1CK34wok2RggKG1uYOCOT7HrirljUvI5JpDNHyS7Xplin7t
	cF6283WO5bKNRZNwUsm1afhVgo2KwlrtYHQE9Qw+6Dyty78TH/czWMqecBVXg82K/nK3tr7wnUJ
	NQFVA9+Cgu1r1wXoCPCZrX9PXg298K1HYMODputMX1vbWTGDy47dick9WIMSqRIi9CurmkAM6vl
	trnoOtZnFZjNyc4SSuFODX4tM/M+jEvTz7ZZamp/ByKiLtZBaemgckxYWl4jYgBAKr4v05S8Nb1
	uNm4CUrYWKQTlaIGEOD3bs61AYGIgvXSX3rOfxGNUoIMQd0vI3WRCYrwEp5LM9nIH1T8Yt45NZV
	A62drbRL7VwptBqBCkw6YMQ3ocunpgeDgUAA8k
X-Received: by 2002:a05:7022:7a5:b0:137:6781:7dd4 with SMTP id a92af1059eb24-138066b5982mr5211833c88.8.1780820461416;
        Sun, 07 Jun 2026 01:21:01 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5489d17sm9439232c88.1.2026.06.07.01.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:21:00 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/2] i2c: mux: reg: allow fixing the base bus number via
 fwnode
Date: Sun, 07 Jun 2026 01:20:54 -0700
Message-Id: <20260607-i2c-mux-reg-base-bus-num-v1-0-f193b5a8fedc@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYpJWoC/y2OQQ6DIBREr2JY9zcIRcSrNF3A96s00bYgxsR49
 1Lt8iUzb2ZjkYKnyJpiY4EWH/1rylBeCoaDnXoC32ZmgouKV1yDFwhjWiFQD85GApciTGkELWt
 SrdNkDLJcfwfq/Hqo74+TY3JPwvnn+ycCfVLenM8Ye9sZh7zYFNK2plMWnawUVeQEttJxbTiZW
 jrDb0bqslTq5zlu4Gsc/dwUi76WEPDGHvv+BRvTcsHeAAAA
X-Change-ID: 20260607-i2c-mux-reg-base-bus-num-738e5db7e99c
To: Peter Rosin <peda@lysator.liu.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780820459; l=1501;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=rATwyjdaFtrJ0McnHdAuGN/9Ljvwmb/HfIFoHuMVL+k=;
 b=jXU4iMmdYuSL8QvxM7LJ4+BMOuyIXr3vqVBFjLaZumdJBEWPTLjDtOEOLIqZxOBp679Xk0v1l
 UcdkmuiY22CB0QfIvwWhG0UqyXmr6PspKz71yXZmLh7OpEqlsSCvce+
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add an "i2c-mux-base-bus-num" device property to i2c-mux-reg so
DT/ACPI/swnode instances can request a fixed base bus number; the
legacy platdata path already supports this via data.base_nr.

Patch 1 converts the legacy Documentation/devicetree/bindings/i2c/
i2c-mux-reg.txt binding to the YAML schema and documents the new
property. Patch 2 reads the property in the driver.

The series applies on top of the device-property accessor conversion
queued in Wolfram's wsa.git i2c/for-andi:

  c191ec71250b ("i2c: mux: reg: use device property accessors")
  https://lore.kernel.org/all/20260519-i2c-mux-reg-v6-1-a27ff50dee67@nexthop.ai/

Without that conversion there is no probe-time hook on the OF path
for the new property the driver reads.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (2):
      dt-bindings: i2c: convert i2c-mux-reg to DT schema
      i2c: mux: reg: allow fixing the base bus number via fwnode

 .../devicetree/bindings/i2c/i2c-mux-reg.txt        |  74 --------------
 .../devicetree/bindings/i2c/i2c-mux-reg.yaml       | 110 +++++++++++++++++++++
 drivers/i2c/muxes/i2c-mux-reg.c                    |   4 +-
 3 files changed, 113 insertions(+), 75 deletions(-)
---
base-commit: aa61612ab641d7d62b0b6889f2c7c9251489f6e3
change-id: 20260607-i2c-mux-reg-base-bus-num-738e5db7e99c
prerequisite-patch-id: 3ad9f5acb365e6eb2cd3b0790e983b9049371155

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

