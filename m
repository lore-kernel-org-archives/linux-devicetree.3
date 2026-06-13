Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70B38E113
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781377835; cv=none; b=mxvDqwVzgM/uNkWghCRXiDsbJRKhhPguXnkMX82UzSt9APZcRamdYVyGq1JQT2evxEas+Tl0S73X1VnjyEMnuM5gAHnPOUKlxy76Lb/XHn1VKp/QTwswsrS/cbd3R/pPWhIOK1L5VTenPCj08GwvuePUlOt4n5GvZWUSQcoRJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781377835; c=relaxed/simple;
	bh=5WojoqxUs/ntPznjUv9nyPMgBf7/G0hvcdYOyUnOR4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gd7XdU9uGlfPogiDWhvjKP+aVuVu3GtYMM7d3ksm0b5oA823Pb0wlrrVnOj/j5ZNp/+f5DXAFvzt/OBN/RMFCTf/NQ4E62vx5F2eiERnpGStGSXUmoKI0WkjgH1xUgfO398MiOtWkOwo7qyaUx54CahXm22QEjid8E0APQ4cBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNwLRfb3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNwLRfb3"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec4639953dso343609666b.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781377832; x=1781982632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODs+nJPeDxYTbJmLgo82ZIoGtAVgjXH6j+M6Vh+Y9KI=;
        b=sNwLRfb3zO0B/ei0Ec4j8ot2RRch4mem4f3ZMJYBtg9mkC5wL7/zIy60IxuQcu454V
         iqboEXwKmrG8AlwQAv6UGbBsTSSRrbjjFtQaFV5PqzOiPYzGp59K9EMForl8pnYlqmOQ
         w86hWy042s8wHtgh7ZT0Nl5akk7dyOyMUmANKABUyQc3VCOpNu48cSp41perY+3VbjDT
         clUqmjtBPNLtUNPKJrim1ybJj2LqyfIYuZgxxM+oVtN4IXO6/+nIOv6nTR1hy2eek/YR
         Wp133VY17E2CVqdfNlfEWTDzKSyZtysvhX8+VVcfqKlv1AyfmrxdRA/wXBBsfPS0Z/xI
         HfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781377832; x=1781982632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODs+nJPeDxYTbJmLgo82ZIoGtAVgjXH6j+M6Vh+Y9KI=;
        b=L35ZQyCn+3moWH2YteitdfEJxWmGDynih1eH+XXv5pDlRZsv0NEewkdmtdPBqcvLJm
         aYZgeIJlb7UyO/2YuRR5j8a0lc8O9v/AADZmtAFE2jj/JOaO9w5o/p7oy/oWbK6STvAY
         QQYL5dtBt/GoeK0Hm2p3dlz1Anh82Dl2NNWecK2rd8dilOTA7GrJUGAhcfw7h+8Jq2Jv
         zKKxD0+dtSI5pzinFGQxL9436hHsU12MnpYWCZxFyLkVyuwk4Wq+oQ91zCyAVlOfMLqL
         XL8zmGThzWqC6wJHzHJRes5JUw6yIrEFEJKQ3e6OuYoDm0de3PGpit1ID+1vjSUCDo74
         6k2A==
X-Forwarded-Encrypted: i=1; AFNElJ9U8RBzp02yBJAuuqG817t17PImEYxbMRXERP9i1WUqYXZakm26YFYBSE5lYCTjva+QxbZ4ocyP0tEt@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAPf0T2dRNvh99YfWs1pF3R4ck4KI7hNraHXbxvwa/0TVTwVQ
	YAuHCfVxknuqGMoJg6IGhcvgZIYo+196PcKbi1xjQEzv6p3OtSvK6XFL
X-Gm-Gg: Acq92OHJVKiBY5HhYg1lsIy7O1MCn7wBHBacEo3sIJlOJtUV2yLAnAGmhgfBBS9l4Ce
	58/H8nRiEEZNSkgEGpcz6HIQyHxJcbQ5A7dobW3oIbXGZv4MIPfyu3XmCvbxkFhQaAUmqjsRncD
	/A+jsoq17c6gJAGfUFtnCxkBmrb+v+qDPJXMQUByVYvl7+CvJxhhPKkwlH3VNwrLvJSUH0wpiDB
	JkNHN9ZbzomNVHGxXhKyjuk1OBM7Th3YUvfmS+Q+PAfN6LI9bGU9PAoL8VgiorBxiNWubrzIgP2
	0/ye1R/3Zijf1xVPt25UVSXoBrk/PyAC0mX1F5ax8LoBlhvAQ743/dP5sosyHC4CCORsJpq+vRS
	DeXGvCeY/f+HBH5ZGa+sjmg/MqfWKilSk+7EzbKkAewjV+Xjxu6I++yGP+UqxvAOorNWqLnqHOX
	BQh50ePAGKE1MWxga4r2M3EoI+bvwmcAm9WHVVG7cBgQEO19PdfJtnGZ/I2Q==
X-Received: by 2002:a17:907:762f:b0:bd9:2b46:99b0 with SMTP id a640c23a62f3a-bfe2b3ea941mr250053666b.49.1781377832427;
        Sat, 13 Jun 2026 12:10:32 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:9790:7740:8855:4d8c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b2276fsm237193366b.17.2026.06.13.12.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 12:10:30 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	antoniu.miclaus@analog.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	duje@dujemihanovic.xyz,
	jic23@kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	jorge.marques@analog.com,
	krzk+dt@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	marcelo.schmitt@analog.com,
	mazziesaccount@gmail.com,
	mike.looijmans@topic.nl,
	nuno.sa@analog.com,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	wens@kernel.org,
	joshua.crofts1@gmail.com,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
Date: Sat, 13 Jun 2026 21:09:55 +0200
Message-ID: <20260613190957.654798-2-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260613190957.654798-1-jakubszczudlo40@gmail.com>
References: <20260613190957.654798-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register layouts are the same as for ADS1100 but ADS1110 have different
datarates and have internal voltage reference that is always 2.048V

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti,ads1100.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
index 970ccab15e1e..28c5e2dd0ad6 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
@@ -4,19 +4,23 @@
 $id: http://devicetree.org/schemas/iio/adc/ti,ads1100.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI ADS1100/ADS1000 single channel I2C analog to digital converter
+title: TI ADS1100 and similar single channel I2C Analog to Digital Converters
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
 
 description: |
-  Datasheet at: https://www.ti.com/lit/gpn/ads1100
+  Datasheets:
+    - https://www.ti.com/lit/gpn/ads1000
+    - https://www.ti.com/lit/gpn/ads1100
+    - https://www.ti.com/lit/gpn/ads1110
 
 properties:
   compatible:
     enum:
-      - ti,ads1100
       - ti,ads1000
+      - ti,ads1100
+      - ti,ads1110
 
   reg:
     maxItems: 1
-- 
2.47.3

