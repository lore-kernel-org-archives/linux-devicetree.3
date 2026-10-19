Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2324C33D3
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404592; cv=none; b=HAoYKavAvJSBBwxsyXhbQFNuJW5lqzlpkF58vJXiUP8qILLLzDHuFBOBsuCyQGAnufT1mFDnlvYX5ISKbQjMtajvxHC9RSGGDTFPR/csYW0DOw5eS33d8Ur6UtltB/0xIcBjLguWVo477w2PwieOsrL7WgW2Sm9uvmr2i0KUAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404592; c=relaxed/simple;
	bh=dE+CLRTmP2biIMs5iXmOIJYZyHULbF2+dSHPt4eaWFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZmqbOP0zFL7EkVUm48zR2JTutE+L8umNPqrI5f6P5HsGTqjqTrkEVh/TErMikFLwni6v9Avy5V4wucMzi6iyhROspzSFkPWlCa6CtFfeHtt2nYOuAR1I+Kmnp1Xd87f1THrHoYL9NrUWXLCFHZUsij22HdvEhmFc0Tws6R+/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6qji9U3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6qji9U3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso13439105e9.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404588; x=1793009388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=Y6qji9U3pfynSD73L35J7XBpx1K3GqRFlOkvsHy/FFdsFLcUzF+XHmL+uR1sGHViRq
         2mmTUyxpsLVUIcUktGAPiUICDroXdIo5g1XaSCmvLEAI+sYh6Wx35r9fATc9XZcNCSsB
         ySFRxmt1wnxglvvZ97tdt1A7oqXJlIv3fhIFeOLNRwJK0A8dn9ziBilxLVQeqAWmT+Of
         hvtgXbWufjNO828S8TJ5zgPeNkH851rvsHNFeSGR4N6VT+4HJWamrbZ+WJwpX4bELCfL
         yS0iaM5J7DeGnaAUycvMskhHRJBR7+8NVD/NV76sX3Irbtzal0i1lmRWyG2J3kGmZceF
         i9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404588; x=1793009388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=bk41qd52hrRpHX1NhilbF8A/Se7PKHaJoZK9qLL++hZ8y76RdJDZZG152kvQrjwyrk
         Yq1Lwub/ANsnNcxEu1jG/IECEd8fSi3ZtmhxX1i8kTgoAe3wN1mNDkG9HQSCBfruORVo
         k8+lxb++oal18pZsOc9HFNtJSpmhXq8z/D/zz2W/mioh9YLHjeoHNdexkoeFjqn44iN9
         Z3YjC4dUJXeQIYwQM8QN4v+2aavutIcOKi6KQdgCczkwF9Du2j9gMfIPyYinJvEe4s7B
         rtYs1zOc4SOpHtEZU6LkrpMJREHrVT0x73oq4PHtUZuqxjK10bS6jFcpDu+VQ8k+ZnSJ
         OX+w==
X-Forwarded-Encrypted: i=1; AKwUvBxIlHMUPA7othzIrxCiATfaIgZAPCdiSayRi6nAMisJHuZEx2csDlCivNBVpP9gcgCeEvSOINnQ1m6r@vger.kernel.org
X-Gm-Message-State: AFq9FYIDBiyUuB4+3AokHQIjHRdZEjHWn/6YvFCYpw9UfKYjeY7pSBue
	QLAF9cU64apDoZuEOmSufMZ8SEJlz8E1amiTTN3e9zxuvuvbQ6K2XLhL
X-Gm-Gg: AYBFou3+T+vY8EwHFlQefTJx9dRgcIHnj89ZMkoE3la6L6MP2fer3Z9W5Fx/Frlkz+a
	7qz3TUNHDVvqCKdatmGP6aAN+7w14p6yibng3OnPIHbdXCXNNIQK/5XMjP5dZ26vf4otOI9NeMr
	gJHGLQEyZhzt40enD/7XJ+OuwQTDzgcIAoYTPb1tKj8Dz0K4aOXP2EPeao47584mp3HlgHXkkZS
	aSvdtDBPA2geddsRY86gR7eJL1pINWzUn98T6okMiVqC7+Rmi74pg4sFW55Rgt3nYGb8HSx7d+I
	dbEwqma0S2ONGYTWnI/A1MkiTKHx01vyVS2gh4I/CkuFYl0t4qC7XlsCizx8MxrFY9NnMdnRofN
	zuGfdkIOkLr0N9uBc6JKw3rUgmIEFXjB3yTlKGnLxcEeFVF18terC2A3gf/CMv4WAFfABrMv84l
	1RumZ9PsL3CaEoPz3dzK5eBdFB8F8aak9WYPUUPNNpqeEsimAItO7CTiVsPJy3HxXRXi3s+aFUt
	+PNRJvNIOzmABz4r218W0A1FbI41g==
X-Received: by 2002:a05:600c:3e0a:b0:4a1:ef9d:1b68 with SMTP id 5b1f17b1804b1-4a1ef9d1bcemr8412035e9.10.1792404587670;
        Mon, 19 Oct 2026 03:09:47 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Mon, 19 Oct 2026 13:09:30 +0300
Message-ID: <20261019100930.110954-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index fe43ef675f257..0284c5fa8fb54 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 
 struct aat2870_register {
@@ -309,6 +310,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

