Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37920407CD0
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723912; cv=none; b=bMhTGB9pURvo/2bu6IoRpQkDMEURaYJ3gEj7W/xO1DDCqNEFsbr0S9JyBINE7mgrWgTor0vfeBP7Rhda5To84qHew/aAp2444TgsHhNQdOTH6/TmT9Ru7zSmPCwQ/RO1+7hG/tMuDWk2r38C/fYpasgCacLYBI1R2nlGCixsZXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723912; c=relaxed/simple;
	bh=s5we3EIogjcFMVGpKBg1jRISXbFhD/6aQFi9zxu63xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qMaIEtzdnbE8wS6o+sn43M0qwKbb8YWLCV0dYPObJmZvHyxCKq1QzNnvKraqm7EkUXB+JrV5LVytYdGX+G8O+suxURCcuRZBX5WcAtEmsfbL92hUke8VSvCcODaGESVNHusqpQ2dG4ZopH01GsgLSVLaPt6lL1QNQ3Xkd+ApgAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dFAHVYAo; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dFAHVYAo"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb3865ea6fso1073665a34.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783723910; x=1784328710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnM6cAp2TMWm35jXNIN+b+Kb6RD7lXwbzaZa1hCMfZM=;
        b=dFAHVYAofKR18Koen/BF4zwKlcfSApRiqLsRwS0759EZMB4XtDCNacF9zNUcB9IiH0
         pTJvFKES8MvkSGwwIkCRNt+yEWx9LWR7TMOhsB1DaM1bFqVORrNxRV/cu2dC7Bxf9pUy
         0cnwEjsskn4kkJDqobbMJBo79Zt8vQz8g3/SS9WNUhWnpuIEY9VS0ZVYe9iK5SILtX5X
         TAqDlhvfQb5Ulxmdx/C/B1msaHUIm8KqQB7yJlbF5nsj/U+To5tRvTnWl0KMupz4Mm4q
         YOFa5296L0CdU5vm1xhMX28/YpN/hzhVc0lu3ShdadVJHRMDcqziR9/fANU3omkBT+YO
         j8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783723910; x=1784328710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnM6cAp2TMWm35jXNIN+b+Kb6RD7lXwbzaZa1hCMfZM=;
        b=H4ZrR5SSQv0aI/K7Qfxu47yg/WUKPirSPuh6H+p1Mahd8eNw/rZMQ9qgq2HaogvfW6
         u4Eqq3x7YYjh+35MN83NQ5HgtMIbHmGpVREnoTLxyMEtegUG9FcQOgXmbCnaAR4rY1wu
         TzFP7wCpbAiAWL1mPoAt+2LD4ZSpWynFLsqz5Auk3u8JNLb0nXes8P8IBDh8H9ASq3oH
         SeqJ2CCR8cOtqOftSS61FhsRlBrbgXA7bhIHoxLGgBMLwSgSsnDL5VdNLviipx2AcaqO
         9upFmYbpNDUodKZo6f8CcpVo/0xGCWtcf7BjnkNGZfjbJ6T7HyGn0OBeR6YgvsA+98tO
         Qmxg==
X-Forwarded-Encrypted: i=1; AFNElJ9TLx1mzY/ODmkLS9J2rqppqEB49Zo1juahrUBKWqkc5wOv2t+3HYaiA/QXPvQW2wBOXR6+h4TWj4gm@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuZeBmZ+nMub6ur5GOkaqxQZMmtqYGC0vu01fCtBvT6Tv2xpS
	jE5OtQ3CqUhimvqdPnF8dszC6tzJ5fX63W0yISGhE35w8eqmlFFuqeKJon00mALco6E=
X-Gm-Gg: AfdE7ck59oVmEAiAGn3bA63E5DK2C8oXRAMe0IjSTVlqEldqxJKRZq4JsHbnPfrzv/E
	FQSNr9ap2/yZnErmLQhwlrNZ7Tl1Coy6eXdbD/lu7RYi4TjssqlYm4Yd5Qpx4JlK83uGFIVeZnv
	83SaNkdgZOtlNuClIUIahjC9euspARzUl7R8udnwVBHM7dDm1uTPTE6siM85Zcyy1m4kuvMndzx
	qIYc0sWqiUsaHNSb6m6j6lgd2U1GSK2Yi2Q9oUlC0Ei4pa4G6S/MXHWNcO5BhGHgynz7vXENxb2
	Kbw/ah9mo/7Aw+mgO6e+KYMNqCpT8TOjAnnf04A2wst5Wst4A/Pnwdu9koiar14N45rQhmacRQV
	QzlRvZ/Ob4ilb3KOqIL5RE0cAy0wuiDQFCE7Sq85snbWlcqPZeN489uW+vwnmBHhp51mea+q9sK
	xpM+1Zokabauf+AB+t
X-Received: by 2002:a05:6830:dc5:b0:7d7:c985:3a30 with SMTP id 46e09a7af769-7ec096772fcmr556049a34.11.1783723910329;
        Fri, 10 Jul 2026 15:51:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1b03:95c:fbd4:4d00])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae177c5sm7613512a34.5.2026.07.10.15.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:51:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 10 Jul 2026 17:50:34 -0500
Subject: [PATCH v3 1/8] dt-bindings: iio: adc: Add reference-sources
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-iio-adc-ti-ads122c14-v3-1-746d52cbf1d0@baylibre.com>
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=gnJcOpkZvI6QrZ8vVSRd8XUtUDqGn+U84NE4BPUS78o=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqUXdLdBIxUMh8djEQQGZS15inbRwmeySTH/7Xu
 OGzaAFwsRqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCalF3SwAKCRDCzCAB/wGP
 wK4fCACN1zA4AKg+WrGqIBacqTUYBki4LyYu+S9YK1DP+11MYY1sx0QxQwJcWnfSJSlhvUEU5ag
 5RdXqvJFbIvwoVi7a/Bql8DaUSz8L2p/uNmO9sBSpYlAl9Lo/CM7PNytb+wc5FF013EoRMagzVk
 /5DEKcV29l1m6hdYQDQWYsk/EtDDeT5oAkoXwaY9pv/Rj7NasKFbIp00XpZjkYh1zQYcoSO1THZ
 uaFF7IAqU154zADGgXyt+gx4D3kacukKFzg21Zfl5Ha/mOuE6yXu+i58+UAocFCqikKQ986cTMn
 xJBRer+t7GjGCZXOTqg++PuvEnbY7yDomjJ6I5L6xzQyVLH4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

From: Kurt Borja <kuurtb@gmail.com>

Some ADCs have configurable voltage reference sources for each channel.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v3 changes:
* Removed minItems.

v2 changes (compared to Kurt's RFC v2):
* Drop maxItems.
* Drop 2nd paragraph of description.
* Make reference-sources plural since it is an array.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b9bc02b5b07a..8f608bf0b24d 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -73,6 +73,13 @@ properties:
       device design and can interact with other characteristics such as
       settling time.
 
+  reference-sources:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      Indicates the voltage reference source or sources for this channel. Some
+      ADCs usually allow choosing between internal reference sources or a pair
+      of external pins.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.43.0

