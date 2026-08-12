Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0192645D5F3
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545062; cv=none; b=CqX/+DpcRTnoMfA0zSP62trqpJcgKQdHkpFq+JSE0oaqs8fbJA0t/OFv/okDm1YzW0zvbSNnx5+TW4LSIwtUPw/xgLSY0QxarTLB1yEIR6wAt9sWej3Pcqypy0mL70Oy0dLGfJQi51a1cwAk8iovEBMVIaBmckulQcuhqM8o26Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545062; c=relaxed/simple;
	bh=tzfxlXisttEhbwqNjklxdIHoQtWVVaaErftAi88NK6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QG64Y40+qdnF+zwHPbRQjFGb19IqNIUu1LllnxCqOwlRGjrKNbrUDLhPTIiUZlccHoeo6V01ydpOCGMZTwhTKI5PpDNPIAlGpX4p5+uR+lmoJugOrVhUvVpEO3qjf2/7m0BLM1LOMlk31pA91KFpwgmvrgBi29HL4MrpaskFwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=sjTuthNM; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="sjTuthNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1786545050; x=1786804250;
	bh=XJ9dsEYOltvcV8dNsiIVCzLj7uR8oL/YLG98qkFwY0A=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sjTuthNM1upNX1ST2lG75KmGa4Jpd+L+GZ+stZwv7MZJVvwwnZcSm84AmGaH6weMc
	 qHzPx/Lvv4+3p/yjngj7WeJ0NAnSUoo0S/dftjGGZWl8ZKvEUuhH000cWEFmRM74Jp
	 35AVR6AAyAUxO4sqkr8iT9XLWDxgh/qcNQ/P4UvajdHRkuaqTXBuR2RteJds7asgCX
	 scdMQVHQxzmN8KqYo4b/mYdMH7hNDgpjM0MpFdHLrauggu023A+zlyFc8rn46S4Vz3
	 vhgmdo4JNjxx7Ymg77YXd30GdZhNfhwqy8PmikMI4Y3CrsmtOfjYuyp3AACwsby7EP
	 vkDxzmuMnoESg==
X-Pm-Submission-Id: 4hKrWY00zGz2Sd2n
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 12 Aug 2026 16:30:33 +0200
Subject: [PATCH v4 2/6] iio: accel: mma8452: Optimize struct mm8452_data
 member orders
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-mma8452-open-drain-v4-2-bfca15d02b59@geanix.com>
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
In-Reply-To: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, 
 Sean Nyekjaer <sean@geanix.com>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Martin Kepplinger <martin.kepplinger@theobroma-systems.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786545039; l=982;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=tzfxlXisttEhbwqNjklxdIHoQtWVVaaErftAi88NK6M=;
 b=zyRfIA/5/E3+gLwpDcATtpEZwkeHneIpnlXGSWJUvb6Db0g0uG4k+/i0C4KufOY+7rCQZFmPt
 Ee7mqrHbPYuAyfM+ro1X59U90Vv9BlLro9xmvNGG+J5aFYEvhSxCYMN
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Reorder struct mma8452_data members to avoid holes.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/iio/accel/mma8452.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 7d683686dd9d..f645a5c6fd1c 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -106,10 +106,7 @@ struct mma8452_data {
 	struct i2c_client *client;
 	struct mutex lock;
 	struct iio_mount_matrix orientation;
-	u8 ctrl_reg1;
-	u8 data_cfg;
 	const struct mma_chip_info *chip_info;
-	int sleep_val;
 	struct regulator *vdd_reg;
 	struct regulator *vddio_reg;
 
@@ -118,6 +115,10 @@ struct mma8452_data {
 		__be16 channels[3];
 		aligned_s64 ts;
 	} buffer;
+
+	int sleep_val;
+	u8 ctrl_reg1;
+	u8 data_cfg;
 };
 
  /**

-- 
2.55.0

