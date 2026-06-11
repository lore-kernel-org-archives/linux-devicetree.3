Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116ED3CA483
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172069; cv=none; b=Fvr7pye+AEefcHV5lx0P9CVRgwd7IR8GUSptGAu6wBUe8i5Yx3Lla8Mea/xs7VQuJyzyevgLfixhaNnn4fBHdJNiEP2f3a0vmgB+EDy+btEBesQaagz9grDBKhN/UcK4JcDiLm+giVdrI0FT+Fi9XIRmsNe+pBi6h3Lgs8wj4u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172069; c=relaxed/simple;
	bh=QyXGOSCMhNFMYsXpPKcOvXoQAJoVbNEMyk1T1kn3M2g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kzQ6fUgYd/obSUAZNtvifwhXFc64JLEjLMHngPciiRF4SbEtLgLTJLN4PkCiQauV7KfwrNpiUzco6QEqCUC5E8pPueGBgjggrJtGag+1nq+QYbwKdN/eg/GF0rxgz7QvZLk+7lvtL6k6+VhuIc1t5i5jZkMNfWHq9jfVu4kdoZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+vw0V7A; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+vw0V7A"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84236f9b638so3717622b3a.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781172067; x=1781776867; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BCmmGp98tP7vpTLYAGl0cPpmP2dXSe3pZaGWlv+WcE=;
        b=M+vw0V7Arx980+SHOfNCDSyqUDQGKKH5ZyYMPwDXi+Av/pP29TOjOe345/oYvKhuNe
         qq3vrN/6m4bUo8SyLVasCFFwBvbYnqXjJe3K0VqgF/GL8logty/gXdMybfRGHFFEtEWM
         r4l1C0CbuRTPzDGDieiemeU+60uOPlKmE34j7dkxJvJLHJ3UE+N6g+UvEFZAv+gkxV9/
         UGJLKqUT/YExjCTuA3X2XYdnNGMD9lHDw5au1a17bRJYBjG+7KsBfs9btKpGbALzmhzL
         aYmNdUDD0T7a/NntfWdGh0FeqCokacocBTNhZdl6G2E5GzMiW+ySsc/KA6+3BSHNQLkk
         EHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172067; x=1781776867;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BCmmGp98tP7vpTLYAGl0cPpmP2dXSe3pZaGWlv+WcE=;
        b=nw9xOGlt4ArCN1lQtrkr/+TZ5Ohuto2oOOs0NdGIZyKoTYWVI4m8JU3dAxyyu4tCu2
         0554d5Va+5sZAoAlTrwhmoXkVejR0zNbodvzfojLiTkZGWE+B51w7ufw4I+0gvO06hnP
         8f0xQETl/GWmXD0HXKG2QBKboj9urgif8KUUjeAwdhw0etEG2dm7VHtn1ERDmiMyY3Jh
         HHzsyuOmZaRIkXcwf5gwBnP/kU0FIKvRxKjvGvnn9IbITh7zvxgifH6UqJlBLyzuo9U6
         E8+ob5PCyKKfoC78Axkj7yWBN7VAQxCfj3IYGFar0Ad8Vh6CoIZUiSrUem9IPYO/cPrK
         mkpg==
X-Forwarded-Encrypted: i=1; AFNElJ/sAc5JuNgkoD8fa9gfkxLxHZIbCbNX0qQ82SqWy7sF71zAUpmdN6Zedp0r/lsl2W7DOVcE5jEkSn0M@vger.kernel.org
X-Gm-Message-State: AOJu0YxcP1jDwYUE9ir1VM/By5NDShwKOgHCydvIAvxL4cxS+fL6unIN
	a4HGW0wOtVBtgffyz2f3EUDWoupMBfQ5IpOtbkAJxtUMdKQqRdWZuYbS
X-Gm-Gg: Acq92OGJK1GyDU9smx4TnCx50qEnVRNx5AcmTwyeyeXec89L7cFx5FTsx6sa4GLTCAG
	GqNM7wZo2/kEJ21CJuq5LSrKHycwlyRKtDAs2vX4rhuFaALF/5srYM6Dg31ZKUYhmryIMyuHR62
	sljiVbFlbmbLiHdAdi+wx/1bKZ3fKwuZjpFypqnDfnDyb8k6GxTIngYM6MrektGI0Rc7LOTUB3E
	c93iNBjYkDlb5agFWMS73uoyUZCcxGgVkWU7wNppE+s+x+9mmJpFmkMqoRmZWQScpEDtSSyXa4R
	pWVhxvRRTZjAYbPE21A+yMM7JlGtjw0G03NvEt6gawABSA5v/kjC0j1C+5HgU9GRGK9mwnKwIkD
	jwMv5/1ZUq9LqdvOP2jEg4NlVMHXzkVsn9POebrW42wRJeH6ui7XIF17dC5fxjnFn0UBNGw0h7C
	ERfQoFPVxRApJqsL6nWj42ndIpBuJu1+8bEPVqjmzeLEUFzEHGgSKGtgZcLsguRGI2mUMFWsuYf
	MEQpqdNB8WzK0Q=
X-Received: by 2002:a05:6a00:390b:b0:837:a211:4ee2 with SMTP id d2e1a72fcca58-84336df7ea7mr2358672b3a.38.1781172067225;
        Thu, 11 Jun 2026 03:01:07 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c92edsm1458228b3a.32.2026.06.11.03.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:01:06 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] hwmon: (pmbus/lm25066) Support SMBus Current Limit
 configuration
Date: Thu, 11 Jun 2026 17:58:43 +0800
Message-Id: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANOGKmoC/yXMTQ7CIBBA4as0s3YSfgJYr2K6UBxwTEsNtMaEc
 HdRl9/ivQqFMlOB01Ah04sLr6lDHgbw90uKhHzrBiWUFVZKnBdlhLXoZ/RrChwxHOWoTHBaO4L
 ePTMFfv+e5+nvsl8f5LfvCFr7ABw/BZZ1AAAA
X-Change-ID: 20260611-lm25066-cl-config-f81925f7337e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@qunatatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172064; l=1224;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=QyXGOSCMhNFMYsXpPKcOvXoQAJoVbNEMyk1T1kn3M2g=;
 b=Jm65z9PjYXe3Kw48Woq8SPQDkDDjqvOdDF9/YhrKoC7y4aPXtJmIBWK8ovy39qCX2XfhAqhfi
 aKEUvgX6l4wAI+m0Rh/S1aSRTirdGLidQT/Envcn3fU8BIabB15F5vs
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

This patch series adds support for configuring the Current Limit (CL)
behavior of the TI LM25066 and compatible devices (LM25056, LM5064,
LM5066, LM5066I) using SMBus settings instead of physical hardware pins.

The first patch documents the mutually exclusive Devicetree properties
'ti,cl-smbus-high' and 'ti,cl-smbus-low'.

The second patch implements the driver changes to configure the DEVICE_SETUP
(0xD9) register based on these DT properties. It handles the dynamic differences
in the CL bit (bit 4) mapping where LM25056 and LM25066 have swapped logic for
High/Low settings compared to LM5064, LM5066, and LM5066i.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
      hwmon: (pmbus/lm25066) add SMBus current limit configuration support

 .../bindings/hwmon/pmbus/ti,lm25066.yaml           | 20 +++++++++++++++++
 drivers/hwmon/pmbus/lm25066.c                      | 25 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260611-lm25066-cl-config-f81925f7337e

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

