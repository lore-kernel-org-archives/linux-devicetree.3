Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796F39183B;
	Sun, 10 May 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778431532; cv=none; b=HhPEtvEC76fpt9oseuCr6GpICnC/VZ5PVv/GX+his5OecO4+DP8kd7KlMCQoma9xpjyqHyIEwjQJcj4JvSDxAtboU8j24h+nn89LwWQIQ/M4fhiHBTTu08gZpIJA76tEEznkOtPkjvQtN57MFmPyMwUwRpTB3W6iFdTq9ZSv0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778431532; c=relaxed/simple;
	bh=/WuZUeZCMZrnceyX7+bS1/qqA7M8L6zQXpaUctGOv1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l12udJqQ3eDJdksjjGA90Sctuq3AadLrorwRwga8slGAv1sO9rpNVAkd50d+JYh7UotxLW4/1LupIjMnSnq9ZZIEjGHZov3ZcMORlvIL4TS9L89Mxd2fY1Fvgn1s/vRfzE1rUr6NqMhRgzfhe0t+1gs49o5BbFDumbozQOCRcKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv5qOPHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv5qOPHV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16E9EC2BCB8;
	Sun, 10 May 2026 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778431532;
	bh=/WuZUeZCMZrnceyX7+bS1/qqA7M8L6zQXpaUctGOv1U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Zv5qOPHVsAdULu/LE2wQOaUK4NGNMvtO3ywB7+ofMolpLCRZkbqiSzHWt3duXJ0kS
	 Rg9h/rupEMK+we0w7VZqLdXmriVwi7jEtz2jDNAqyBqhHrTJoHLFO+Dm4HOpWvIN1p
	 tFkMqZDLHGMxcuMAy9bwFLMwvxnJdVz+Isw6av/WC9Qb3/rXILpQyZ5tw3yY180ied
	 78O6j9dKd1N7OmEG1kedDLnW/Mjke8aqU48avdm6ntikQAq50bMccTUB7x3JubtWXr
	 CUvRuoUN0EChTML+zlUaD4+tz6MqkkkM6qrmrZ9+RBK+knia4pfNKqbY4JXKsLjzWE
	 VeyETgnNduaeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E51CD37B9;
	Sun, 10 May 2026 16:45:31 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH 0/2] regulator: add support for SGMicro SGM3804
Date: Sun, 10 May 2026 23:45:25 +0700
Message-Id: <20260510-sgm3804-v1-0-e5e8799e0aa0@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MD3eL0XGMLAxPdZGPzRIPEVLMU8zRjJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAJ9MDt9rAAAA
X-Change-ID: 20260510-sgm3804-c37a0ae6d7f3
To: Philippe Simons <simons.philippe@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778431530; l=1363;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=/WuZUeZCMZrnceyX7+bS1/qqA7M8L6zQXpaUctGOv1U=;
 b=GHTf8dI7l6dDpUncMLK2xLs1wfa08vt/n8RslM9p+yYSOk2hB/5tFRvrxlu9Q8Eer0wm1HF3W
 af0qFx78JSrBpVK/3QrNebK13uYSZctpCgyPJZGb8bfM77Qthz1YDnE
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

This series adds support for the SGMicro SGM3804, an I2C-controlled
positive/negative output charge-pump regulator. The chip is used to
generate the AVDD/AVEE rails for display panels and is present on the
Ayaneo Pocket DS handheld, where it powers the panel and is required
before any panel driver can light up the display.

The Ayaneo Pocket DS device tree, posted as a separate series, depends
on the binding introduced here to describe its panel power supply, so
this series is a prerequisite for that work and for any subsequent
panel-related patches targeting the same board.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Alexandre Hamamdjian (2):
      dt-bindings: regulator: add SGMicro SGM3804
      regulator: sgm3804: add SGMicro SGM3804 charge-pump regulator driver

 .../bindings/regulator/sgmicro,sgm3804.yaml        |  60 ++++++++
 MAINTAINERS                                        |   7 +
 drivers/regulator/Kconfig                          |  11 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sgm3804-regulator.c              | 164 +++++++++++++++++++++
 5 files changed, 243 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-sgm3804-c37a0ae6d7f3

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>


