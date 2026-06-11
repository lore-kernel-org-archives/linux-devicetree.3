Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25BB3F7898
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192472; cv=none; b=X149arv12onJD98/P0Lww++O4RdzZ5r0AZOzDx+nnQijInIIgTDvkT3w/aAZviPDGZ7bDsKO7s3Mf7UCP67qi/x9UZkYa3DjUyVQ0B45bqiPhDSqD7TDfXsja04dDW84mT5y2NYpjziHni8qKsbJ4I0mIW3aAgnSv1TjMjsuSiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192472; c=relaxed/simple;
	bh=ebXLyVr3JOCPXclIGOJBUPNthHBwpZFkakdGzKqdBY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRKlz0E50YPMupUnSCdtVDN09efwHy2zggUlZkg6p2xsWpm9bZK95PCdZ7WMpbjHhYrRC1WUjnM1WFe1dcCwj9IywsjUhcDS/xht5MVO+OmcdZfznfSrWbV9qCbafzqhzehFLSMNDibPxSJk6i7W99XQ1LBupjZapYZcVD5bYJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giJBuZFC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giJBuZFC"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68d9dc18so8535317e87.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781192469; x=1781797269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzSm4Qq/KxzVj8u8GEGr0oKQBUxc9kOWfTUnQrB6WRI=;
        b=giJBuZFCTSIr3Dk87tE2YT5TCDSzlhs826gw0KZxeZUN5TYmEbOEgWGP3iLmES3bUQ
         I5UssPDloItTDzLUwLRzCO4ZQVdIw3vcrq+EhHIlygMrPaFaYabMDwfy8j0+JF3QS667
         A53lRR7s2zsvmb+F8N2WrNoKFGmcmXtiUXoPrFEA8kK0VRm6Rx8svKkHDT47dYDWy4Y4
         JpYQL9zdXX5X3kqzy2ESbxJNGkoKiu1/v83Z/Je2WKzGNnQqAx6ZUBPbu7YE26Z/QF3m
         fIQG62N06i5imdqNuIO/l3eX0SbJ2fFIArbn2cV2iSI9/weI3pkVyukRUIIJCi9lzB7e
         SlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781192469; x=1781797269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tzSm4Qq/KxzVj8u8GEGr0oKQBUxc9kOWfTUnQrB6WRI=;
        b=IvOV+AuME+GB7xvRmckNw7rfHRAxQepAI96sggJzqDBeQ3kcpBGbBSmvGoIfc5zuYN
         TdMHvK6Is+9g8cvbv3efyS/3KiCzpLwXJ/2pnuT3w8F3XfxsxR2+PXtyZGJFQWctyyFV
         s4ulzX89746ayb2y+pYcsOfj3AXW7cIDm6Ls1Tvpfo6i2VtWJ8NmEpWK2QECly+MgIBn
         o6X4Vpa1mT3xFEQkQrP6VuerDJk5edAm2yrSY9Bn66a1HXfRPmWSW3QkDfqLfFQ+Mdhf
         JR5Bf+0swCi7miDSP/fcGY90gIDCF3iogves7oJleXpPlCEBrrns69BhgKdK7jWrs2dK
         Tbqw==
X-Forwarded-Encrypted: i=1; AFNElJ/jbLHkudAQQKRrV4utuuruh8/perbn/1IUdE/+lkmgCGHNOFeTn61Q3sKd0aKQPo5parDxrC0yYt2t@vger.kernel.org
X-Gm-Message-State: AOJu0YxvgiQV8XiF4Av9Fw6Bnc4AelZc3SHiN2NPNcQJRLmLcnHYo/qL
	yuWQFVDTQjv0URfmAHj6s+5sf3kQ55cBC9WFwlDXtQRpPLfcNHnnUfsM
X-Gm-Gg: Acq92OEq+p8YEEYFhKcJj1sf13eVGQA94p3yUDAQSm5MaBZ6LH83X2AQFbXwYmsa0Kz
	SNtNLme7DZFBQLcn4N/13l9XjsUaBDBC+TyRcCfxewd117i2xjgzZMvuo+KM+6jEZ9kfUicJELN
	NxW5lWoJFRbnk1SVnUJGpcScQroLQD0XUhKPUlwCBkMyCavl/YiGrioeZw0VzjhC4sVrlHRF7de
	NsNvn6cQOSYToOyyCyIpV23/ktoPrP9KFt9RtHk3Ngu5KgARCeBjsPG4h3SX3gnzKXXAoOqv4Rk
	CxJSiHOqtbvDGu8xiosiyae+kOMi4T04ckO1PyGzikAEVr1ZwId+2Ri+iD2prl8q2vXnficl6YY
	5LTgWTJiGyJOznXBG4xj1gtl4i3uKdenJGxRF0Oi/8kH9iB2nVoyTibNvsH1wVoM9HreOeEsCcm
	aJ7j2ju6IiWBYpzt2tsbZ9dl87VivmwjRl3aHPB/07GCdmGB8BJrECmGkv37Fl0iGaremF2LIkM
	17E3A==
X-Received: by 2002:ac2:51cb:0:b0:5ad:229e:385e with SMTP id 2adb3069b0e04-5ad27fb709dmr1021446e87.44.1781192468919;
        Thu, 11 Jun 2026 08:41:08 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3991ac81488sm5994641fa.1.2026.06.11.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 08:41:08 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: iio: st,st-sensors: remove lis302dl and lis3lv02d from deprecated list
Date: Thu, 11 Jun 2026 18:41:04 +0300
Message-ID: <20260611154105.3727-3-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260611154105.3727-1-shofiqtest@gmail.com>
References: <20260611154105.3727-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

st,lis302dl-spi and st,lis3lv02d are being given their own binding in
Documentation/devicetree/bindings/iio/accel/st,lis302dl.yaml. Remove
them from the deprecated section of st,st-sensors.yaml to eliminate
the duplicate compatible string warnings reported by the kernel test
robot.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 Documentation/devicetree/bindings/iio/st,st-sensors.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
index a1a958215cdb..ebe9041f6326 100644
--- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
+++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
@@ -88,12 +88,6 @@ properties:
         enum:
           - st,lsm303d-imu
           - st,lsm9ds0-imu
-      - description: Deprecated bindings
-        enum:
-          - st,lis302dl-spi
-          - st,lis3lv02d
-        deprecated: true
-
   reg:
     maxItems: 1
 
-- 
2.51.1

