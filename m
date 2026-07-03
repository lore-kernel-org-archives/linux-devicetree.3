Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3463C0602
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076632; cv=none; b=Ao3u/53sMn4ZQtCZRX11Y6T8PNwZO9IpUwm/PEjovuGRn+hSL5S9mzg31CKrP7taadeg3S9hSTLRyaVjqbBO50l2Rf8XUEf6LR8Q8oSKMYz18lNiDtPkgL4/91YIRrlIbn1VsvRRAw2OkqChHVLEsl9DIECKK8xgUxgrTNUtwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076632; c=relaxed/simple;
	bh=AzJgC/RVsjJ6k/SwatcooMrO5iTJhfE4K7EewIxT/yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQ+GQ1ixcV+zqe2sRMg4qI6gAdqY1m/7zGZ98HV2k6nMBXgOslyrI5+BHi7SMIofocNtDS6d/w+tyafbIIQKUSuLkKpm2QSqjTpjogXBHiwa97JkBF5O++1NHk6oWqK5Ju2w6iF46vbxJGEu34iBBHO+rg7zc1k/H0xTTVPENfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gbs5uP8o; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gbs5uP8o"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ca11143dbbso3577185ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076631; x=1783681431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRSQjBy62puZgUQngLjPxg+AegEI44LbaTaSEWvc+ks=;
        b=Gbs5uP8ozw1JQlSQnh0yXwdTHI5FERylCKPEkmA4LPHdMOFN9l5ixriYiyLapiQpaq
         QbqvJx9onMxQZgbuGmj1murrw7lC6/j4j/MKoUvfxTuHmUN2tCi8ykZHS6Xx6HmpnZVR
         gsoiVadah7COv31sQiN3j/MjbeSsGPPvkDG28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076631; x=1783681431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PRSQjBy62puZgUQngLjPxg+AegEI44LbaTaSEWvc+ks=;
        b=OPYQAzsruLOX+piyWW8Uikp4aT5f8NJtapj8Vx24invUGMgyQ8pUvkM74o7nmD+kCL
         Cfeifv4X+4rzzQWYKQ+8NFUPoIOQE1xps1NKknjUJZL0F7ZHMWvqJWTBXTPKqPp4auDp
         QxGx2PS4HtO8YrEy3nspn1THb1ul7fJShmQ7kvw01ulM9re3Tsw+EtAvF2NIaJcC1Xmm
         CZBplBNC7WCgk/+kad/0XF/prvDKjocSCN/Dr9dIVlAhZVFPeOHXy+xzTLk9OVXZcAnc
         epZfH21RYXw7lqFOet/Eqppp3pIcW/Rv/I0vAdlo6zQZ/EkaWOl8IZy7tprudjruIpRq
         X1Sg==
X-Forwarded-Encrypted: i=1; AHgh+RqqS4NGzJ77dN/HvVPLqfGQ2Ki1O6sbPCEuozSxbiV4d5eQOjtrVkQGX8KEUSE6DzzaOs5KdQ0zmyaF@vger.kernel.org
X-Gm-Message-State: AOJu0YytsJgGcrh5LOOJ4DO6PHNsB21A6zvzd31udu1eykw3pRWfI11d
	lAupNhxfIIb0I5R6uTmyOpfs+WR7KzNB4dgaYk/pK3qWIQCcaOpxdCSJIG7GvzkRsw==
X-Gm-Gg: AfdE7cmocklwfgGo6qWxCoar/J9fs4qQ6qBBEyD+s6G7tEiSCKIHGTUD1jOuhF0UViS
	vPVC1M/AaR2plEsM+4rFvUfxtAb8fX5QrZtR+HbuS1tuMK+4L42NET3huLIWoeI/a9PR29E5oDV
	p1Y0ePa/+mJsXpa6Zh9copDgO+Lr0rQ5BiN2nN5VNTY5XeTdHDxPq8SgdQlje15dAri5ALPsbO/
	hNeSFOKp3D1mzdDi36IQerA5EWMRpWqcRnMm+/H27kKmhQGRWum9kd6MMgfN0vkRNjMDxGE+mAH
	puQxMg6Gm1YW180xb4Wap/BEdSXsiFz1lciFkj8Fs7e9UwZRzV6an95cq9uQ2UQXuOaaAt6ZCox
	1hMzi1dyC272E6LDuelq3Egxx+V7Fs5aoFyteHnwYIB8Y+Ka3InXECLHdiAL6l/jI/hwyMljI7G
	bheyErTB9KEx2FmX+wrlE+kFVERPeU0qr/7jaxc3u1wxfpMFNwCfyMzx++Xjr1qBfY46eMXw==
X-Received: by 2002:a17:903:2383:b0:2c9:e261:95c4 with SMTP id d9443c01a7336-2ca7e8d9f8fmr111666555ad.30.1783076630618;
        Fri, 03 Jul 2026 04:03:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
Date: Fri,  3 Jul 2026 19:03:04 +0800
Message-ID: <20260703110317.1283411-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency.
---
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..72b96d36920e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on and 0 for off; negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..5a5eaf85d5db 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

