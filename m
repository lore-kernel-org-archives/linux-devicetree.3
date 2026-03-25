Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF11D435F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774405461; cv=none; b=Fsfw2XY7cTS8aWPimoXN5uh+l66dqxK41NS9dIxF4AkqtENsLrIYr91V/XOaNL1YzZMcUbgXG8ZvvAQCVoatSgYnEWdI1jsQ/i3t2AhJSWIgYPep8A+iEnL7A5a5Rdc7FOLE5mk5O04ZEAR0zu4q+7o7ckRYQqI3ux5e1licz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774405461; c=relaxed/simple;
	bh=FzENZBAvRZZsTX8EeF7d0sOdVF5SKnZiivIQ1hUCx20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DU9eVHYRZ2i9KQoaaXqaEkBfin4IXWGRs1a8xbWj/0Ip7zKZxV/Aqqa2n/HwLz0x6B9bhxhIxLMpBirSkORaElror7ZNw4ikJ6PUrY2pBqBrMFsRZp4VojbTutip9rDp90SARv17lxZvnC5aghVo9B/jXINC+tV+lhrpHyDNIgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwp8L2uv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwp8L2uv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad21f437eeso3315835ad.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 19:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405459; x=1775010259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9/1zhUKOOXLoKvPhRttSSA3T4On3X7D9Umcf7OYSGI=;
        b=Uwp8L2uvX/aF67YpJO250Pn7m/fHoJ+tIm76qa0KOpP7kuGEzpmdhsvtaKHU481m5q
         BB1knsSJoc29CFQs+uFgTmJAvIKJESop5bjmb6l4dM7gGtaF5EekVbiH5w/yPtCBPw1A
         237q2p0lDN1d72V7i5f8DIkfyk1vLNbBXBhhcAxv6EeHEQ6r2wmpxX1JY6zQkR33rj4c
         zgaggojJTHW29Sn/IrxN4QRW793wuPhvY1SJ3Gi/glPwmgt95fJFiYsqqJkD1z/g1Brd
         qcMOQB+HekgfEQsuir/xX1RNPQvkCg8hINbnjGaEHEoQBdK8/3A97TGw27HLmPsPwnY2
         S+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405459; x=1775010259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9/1zhUKOOXLoKvPhRttSSA3T4On3X7D9Umcf7OYSGI=;
        b=Lax6h9GN8iJDMwPV+8aItbu39W50sudbrULh/uQsU9u8pHTfWAP34wiixT55Dt39mV
         pdFUGxYfe35Ltw/PngSLsxsCzlcvnCYsHvZV6goxRq44JGtaQyJmwhOSVnnHPtXzCA1B
         in35Jx9N9jiny6uKNxWpRFQSNqf1bIUAdZRr/BV0Wo1HpY7C6utZmX+zl9m+auBBvNc2
         WH/f9TZvTYVrt7m5eJJcPh4md5dbkxL0tO4nedq83wS0ZTTU/gapalUtseAp56zqTlUq
         zDCVPY6874gPDRdkZHgDQ+Xr3wVKNbrGzZTun8yMblo4qMdjzb0YvtbMzg6j5Rvhd6KJ
         Zrzw==
X-Forwarded-Encrypted: i=1; AJvYcCXVFU5W5hlm+tAXEwis89J5ylWXnSpxDQhoD50KoZnYAI+OzZmts/+tNNIP/18ubhPJAIDwazDouVgP@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6ni88y4xkzjowIWmJ+1bFu7E9fqj2MaRVi11fcuA3BEAJg+N
	sobUlKyHjihip0DA8NRIfIY5jFpJkEyOI3YPsIgiWR+0IeXDRQS7H/0b
X-Gm-Gg: ATEYQzysvscL+0VKvbClBH/0I96gP7b/8G8izHmtWeVA/FgqgDNFyqnUaf9h9oMg7th
	5sJwIe3q552GopUiRmRkVcZgH10b5YS4BaqQzcIh5myyxa/9uQFJaBvL3W81srW0au1bDJnKbI6
	z7lgbMomGfgS/mqzajDMWccOyPzP16Bdu0WF4HMhmcxWXg+8fApZqAue7+mAhHz36Oz3VBQ0ki/
	BToHnw3sOoIuNGJOlxvPEpybsouZS5prqCbsPkG93VpK0dWCUqFilJsopLlRq4CD0/ukvgONH6i
	3uTJ+rS7gKDl32SsGuVSY1ziX3Ov+LuWF8++Kcd1s0/FJw7yL6KqN70I7RXobG9Pj0O17/OripZ
	RbSsZTaQILyWqZ33SlyG2hZdstjIh5aX9O92qBrsxaw/LXB0XIqX9UpXdiWoiPGycxtve7wm56x
	GGofaakeVl0C5b1vGFD+GK3kNYvj0TbaoQCQSdKgJ6F3H7qxwpZnrVhlBYjHEwi3Y=
X-Received: by 2002:a17:902:c947:b0:2b0:427b:909d with SMTP id d9443c01a7336-2b0a4e2d8ebmr54804325ad.20.1774405459063;
        Tue, 24 Mar 2026 19:24:19 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm170348635ad.23.2026.03.24.19.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:24:18 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v5 0/3] iio: adc: ltc2309: add support driver for ltc2305
Date: Wed, 25 Mar 2026 10:24:19 +0800
Message-Id: <20260325-add_ltc2305_driver-v5-0-e0d29daa54f9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFNHw2kC/33OyQoCMQyA4VeRnq00SZcZT76HiNQuWlBHOlIUm
 Xe3CuLC4PEP5EturA85hZ7NJzeWQ0l96o411HTC3M4et4EnX5uhQAWIxK336/3ZIQm19jmVkLn
 BJtoWNGycYXXxlENMlye6XNXepf7c5evzRoHH9C9XgAvuoxUNmug1isX2YNN+5roDe3AFPwk5S
 mAlhIZoGhelsvRL0IvQAlCPElSJVgHJ1jYmtuaXkG+CAEYJWYmNIyU8SRPp64thGO5wjWQAfQE
 AAA==
X-Change-ID: 20251223-add_ltc2305_driver-728fa9161bc7
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Beguin <liambeguin@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=FzENZBAvRZZsTX8EeF7d0sOdVF5SKnZiivIQ1hUCx20=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpw0de+KnlqvaB6rZ9HNX/ws1DJFG1mZvwtNa/y
 2NvORpTyDqJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCacNHXgAKCRClg0K3CVbE
 gdOaCACWSDdgiF91cxmOFN9SWGcc58c0abO+x2tESPazB2pjMe9cXjg0NJk+d8TytfhOpWot+BM
 qCEyrRyFg5BA2OPsbnsFD4GaPf538p556IgacrxZnxJzOnNX17712aDBMRwK+9M4oRW5lx3LfXI
 hvnXE2Xuf+sa9EzjtwvNkDMMI2mKX3NQ3sF1O+4vEfWLf76AVoxYAW8diXidcGxMrH+G/H4+vN3
 Wns2nZ0AlL+pWZ0Q1fnNy76fWZwAB7wUhciZfqi+PH1SuVwvl3afxIxSvko2YPRUhYkz62SkSuX
 JNzGsnjvM2AIWu+XqFn9nBE1g00lYZInqd61NlC3y2bhavqd
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

The series add support for ltc2305 controller from 
Linear Technology Corporation(lltc).
This is low noise, low power, 2 channels 12-bit successive
approximation ADCs.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v5:
- Split the patch series to refactor LTC2309 channel enums first.
- Explicitly assign hex values to channel enums based on datasheet.
- Add support for LTC2305 on top of the refactored driver.
- Link to v4: https://lore.kernel.org/r/20260311-add_ltc2305_driver-v4-0-bc350d347f33@gmail.com

Changes in v4:
- Fix build warning in ltc2309_probe(): initialize 'chip_info'.
- Link to v3: https://lore.kernel.org/r/20260126-add_ltc2305_driver-v3-0-951349a87f97@gmail.com

Changes in v3:
- Modify ltc2305 channel mask to compatible ltc2309.
- Link to v2: https://lore.kernel.org/r/20251224-add_ltc2305_driver-v2-0-061f78cf45a3@gmail.com

Changes in v2:
- Reordered chip descriptions and code from low to high order.
- Renamed chip info structure to use ltc2309 driver prefix.
- Switched to i2c_get_match_data().
- Removed unused variables.
- Added chip info to i2c_device_id table.
- Link to v1: https://lore.kernel.org/r/20251223-add_ltc2305_driver-v1-0-dfa0827fd620@gmail.com

---
Kyle Hsieh (3):
      dt-bindings: adc: ltc2497: add support for ltc2305
      iio: adc: ltc2309: explicitly assign hex values to channel enums
      iio: adc: ltc2309: add support for ltc2305

 .../devicetree/bindings/iio/adc/lltc,ltc2497.yaml  |  7 ++
 drivers/iio/adc/ltc2309.c                          | 81 ++++++++++++++++------
 2 files changed, 67 insertions(+), 21 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-add_ltc2305_driver-728fa9161bc7

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

