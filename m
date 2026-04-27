Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03FB37D138
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272148; cv=none; b=tjPHwxHvdegdibDE4T5vsaAgaYtIxmlY9Yo7i5ev0T1zDospX9pqsAyJKDSwsp4GdFiHU/+UINe61UyzU0wwcp2qSnNpPF5TwzsRp+2sdDXB5C+iG0tIpkhaGWYUb473x4953tszEXVLTYvmL0Myov2IiP2SNeTz8ZsJfUaf83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272148; c=relaxed/simple;
	bh=mw6mwptDA5uoTeDrka/qYZXjH+Vrm1JywJJ0ewmeIPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qXKHzpW695TOhhtxmhgtc4hZZ6kPjd3kkZQmYh64YUf3DmxKslKg4f83z3zIKxQeLGYBXGFrCcpaI4/ja0INbYzdFoTY1oZJVaRTR//F5R6bD9aWcYYqDOZBPgVk7mq0REp9Y6IG1NNDvUeb+C3Iyfywo2Q2ETGWpOyd25p3Lus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=UOHO4pOX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="UOHO4pOX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3857385b3a.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 23:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777272144; x=1777876944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PdwCjZ9cqGXmbdLC2LWsKAWhycfXBl0zq2VQEo6gMUk=;
        b=UOHO4pOXrBSLFRJjGCl9b5OLYifm/Ve/IWc6c+oQXkbz1/fdVkOZ1KO7DZMqH7Gl8I
         WnlZTC2jl7FhpJvHly+88Wi4u6FMNy1yGpjKlP/VW87mNZhkNs3preYi9rSHuCwD2u0n
         KtbS7/vpUy6fcsVocGP5/jeAskpVxYUl9obrCFZ6sWCEufcYGpyIM0WmddEUYiloUcRd
         sLfh97X7+qoVffs17rLFJhdaBBQsq2BnODtHGV5xl5SeVMFBLMLcwiR9Lg3soi3nwYHd
         CSn65M3ZPDg0kVKbJjt9cTMpl5B4GwXkmGBwV/4mqJzvCHo4+biFTNNFsm66cqs1bm4P
         8L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777272144; x=1777876944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdwCjZ9cqGXmbdLC2LWsKAWhycfXBl0zq2VQEo6gMUk=;
        b=ZcE3ifF4EMBT5hCmARdIUN69DFfFcsxpAymop13zUk2FzgZ6skkWPzaIIimHUAqUZf
         IE2OEXzDFgumhf/1RWg4xKWCVL72z5tQtQ7cHslUUBEU0M3pEnzsNrpyHL/elnT3dYrz
         1aUSWcyRGee0hb3osk2rVKFhKKK6wHgit6NxGEckLpiOM6eoqMVW7OwQ8wdF3eVm6OTg
         +ihRMW1b6NQBkMWoyRTxURRzA+I8eQT4ijfDpKxAqr5OZM3oQsgvDaWPqKYYHe1RAKuv
         auqfo0oOXArlwL762Ym4xzuoVx8dCS4X/L3CABm2WIUUgX4S3x1VAmZwnydF7RznKUFB
         oT4Q==
X-Gm-Message-State: AOJu0YyV2BdDBvpti9L+nJ6p7WDDOHUFHgLEWBdShVbgddYnXaDcE7Xa
	Gb0R8OYTOa/cXLG9YszAs1dQdqmPR6Hu9t4gSVjoSVJL7X9kg3puZDV0Eb1eDY4r6S8=
X-Gm-Gg: AeBDiestANHHzdPxzSghZjFstdP711z8VxuR4sM3lxFlg2wo6itjwBFcrOclUXo8hbF
	p4hFHZraYwwfb1nJxnyvglBGmHw3epsdjPR2h8t5ZZla872cFsWgve9IUv5WV/0KImQhPis5rlF
	oCe5mTvlVZrAW2lJzlFv62DUw4l9ot+Bb/Bx6Iqdkss6NgXxFhMuutT5b2DAxqNJabySyjFcHkz
	TM+w7l5HoqAP7/zYxtZCJapKJjUjm29PbCKcqi7KXbVMnxpiumsFJyOsugOUXHEclB/1Fw1PaRL
	aCL8ktTNuDP6pBmCNUqqNLwWGdLj4TXgYmC6znnLdWNn4gJSF0Q5t5qeBsf08TlWIYO+BlF5aQ2
	fp2Tm06TWjLlN0Ndo0PqLe3045NQPwy1iSNNk6JatkVcvmya0mgrZ0LkDvwhcD1wW0m+l+tqvol
	AUAoFmWsS0a4Qw+cOibDyMu628tVcgfG1b12o6xwvQTRCkDUGBKokVss6iCobjHvxGf8xwyXAaW
	N2R
X-Received: by 2002:a05:6a00:2d1f:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82f8c87b8e6mr43418498b3a.3.1777272144263;
        Sun, 26 Apr 2026 23:42:24 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm32209315b3a.56.2026.04.26.23.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:42:23 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v6 0/2] Add support for q50sn12072 and q54sn120a1
Date: Mon, 27 Apr 2026 06:42:17 +0000
Message-Id: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkF72kC/53OzU7EIBSG4VuZsBYDB8qPK+/DuODn4LCQdqA2m
 knvXaaJcWK6qcuXkOc7V9KwZmzk6XQlFZfc8lh6qIcTCWdX3pDm2JsAg4FpxqmLkbaPaRrrTNN
 Y6WVgrXBgGqgrsafc0vWfNoC1qKLhkXRvqpjy57b18tr7nNs81q9teuG31/+sLJwyGoTR3iULJ
 vjnXBYsM4bHML6T29ACP7hiAtQRHDqutQ9aI8ag1Q4ufnHJ4AguOq60G7iRaIU3O7i8w7k8gsu
 Oe8PRoZM2Jr6DD3c4HLp82PDkjQYFRv29fF3Xb05qohdZAgAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777272141; l=3332;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=mw6mwptDA5uoTeDrka/qYZXjH+Vrm1JywJJ0ewmeIPo=;
 b=ULr/evwWo2ule3iwKhE7dCUvIOHr+N+H9qhoK5drTs1YpjWTaMpTqYcqha2SUKFpAH6JD8oo3
 tKMX4maA2WEBxbJA3cKLhzRjC3T2Ng9DTHwp7WzaoMoAE8ZUx0+VLlg
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q50SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <Cheng.JackHY@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Changes in v6:
- Add lock to debugfs read/write handlers
- Remove the incorrect Co-developed-by tag in cover letter patch reported by checkpatch.pl
- Link to v5: https://lore.kernel.org/r/20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com

Changes in v5:
- Rebase from 6.19 to 7.0-rc7 for review
- Link to v4: https://lore.kernel.org/r/20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com

Changes in v4:
- Add null terminator to prevent comparison of uninitialized data which
takes place when ret is shorter than strlen(mid->name)
- Link to v3: https://lore.kernel.org/r/20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com

Changes in v3:
- Fix MFR_MODEL detection by using strncasecmp prefix match, without the strict length equality
- Move blackbox_read_offset debugfs entry inside the q54sj108a2-only guard block
- Sort the debugfs entries by the order of PMBus register addresses 
- Link to v2: https://lore.kernel.org/r/20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com

Changes in v2:
- Drop Q50SN12072_DEBUGFS_VOUT_COMMAND debugfs entry
- Add .format[PSC_VOLTAGE_OUT] = linear explicitly to all three chip
  entries for consistency
- Replace hardcoded MFR_MODEL check (ret != 14 || strncmp("Q54SJ108A2"))
  with a loop over q54sj108a2_id[] using strncasecmp to support all
  three chip variants dynamically
- Remove of_device_get_match_data()/i2c_match_id() early chip_id path;
  derive chip_id exclusively from MFR_MODEL hardware read
- Remove unused .data fields from of_device_id entries
- Guard store_default, blackbox_erase, blackbox_set_offset, blackbox_read,
  and flash_key debugfs entries under psu->chip == q54sj108a2 check
- Add dev_notice() when configured device name differs from detected model
- Update MODULE_DESCRIPTION to "PMBus driver for Delta Q54SJ108A2 and
  compatibles"
- Fix commit message typo: "Q54SN12072" -> "Q50SN12072"
- Link to v1: https://lore.kernel.org/r/20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com

---
Jack Cheng (2):
      dt-bindings: trivial: Add q50sn12072 and q54sn120a1 support
      hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 179 ++++++++++++++-------
 2 files changed, 123 insertions(+), 60 deletions(-)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

