Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89F47277C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799791; cv=none; b=W3i9lQshF3PLgMMahlXjF8aK7QrjV1CbENsM7qvSu0TlQ5zv/w1fGYS+TqZhdrA/wj4giCQuTg8hLsL1ld8B9/MQzuv9I0gx0frZpUwFX2Kz8pHtJJLftwRIP1+M/cl2+UpJYEdzHAsv8CpiB54jvgtju7ofz7qzgew/izfkGwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799791; c=relaxed/simple;
	bh=lqFyZF/H6AwrrMe7UJI3gtjvDDPQczserSqPhG0tCVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNYuNB6VJD04wI9Q+HaXIAyrE0zNJGGd730lQaGmNt58e3OJaH8UocaRBBeJ0cA4BLIGC034e4h4RMqEPoQNcJqSU5rMNYZP+0f/5m8TuZ4oAbtjL49MymupXh1qwcJDm4e3LKwzo7HHj++AJoc16gn3MFh2hDttOn8icIaz7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmq/V/aM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmq/V/aM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso11359355e9.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799777; x=1792404577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=Tmq/V/aM/h0Pl3GQ3Ck7W/bxyq36UrnhH0snINqjcZOO78hpJcvxRNEBBebxMsHDXj
         oM0knIxF1Vda1z9SgUpmhVpKP7qSz5fcywFWj9p9gmAHP58DhXoTaQ/H9B6tcLVJ5sI4
         AfT+hCNuJJ1Mpq0Aj4+twBmX0rU3NZKMJsdbYbGY2X8cppevI6GuAOeuU2mb7BG7fpb8
         atDf1Op1uCBsMXDI950RNmIcdAbrQn8F5/4zbGRE2EY03wqFqy99VNnraj2efyYxDHLV
         HKkW0rsbUuznCpBQVvfLco83NT++ij2WLXxhDy+/L4IAf+PwTZluqY+iefzqvIUb8rOS
         GH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799777; x=1792404577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=ghOo+52d+DcF4laoPDOPpzTFVEuJTIHo2MrmK70a5xw1o4LcptRW9DBi91SX8y9X7P
         ZVgMs5IwGBJUeTVx4s2f4wesojw3acyeqtlRGXYRMjCzN0e3rBcm44IRBLAfWjBTVvJl
         x/sD8PMZm4HiVlSG3CaP+ZXSAJ01zHB9W8M/LIBx28DbI9ngzQIIH4Mf4EBgSQph6Gf2
         XvKWjCdpvJYZjQnYEnKIJ8PIJc9VZcnCOziGecgcqgPna5trr8OWKG+ZYhZ4TJMPGex7
         Cqa8rxXtNlwt0/ZTqIDI2Fan7i0t+7VpIDlKaakONMSJzfvyRz28C6+lCmLKEoD8OGtL
         dMUw==
X-Forwarded-Encrypted: i=1; AKwUvBywqKE2ocrOFrYlhXmiAqJuoSpMYmCIytxeDqwnqHA1u6ucCmM8IPoERi+fRxW8+WfjobOqGv0Qf/oa@vger.kernel.org
X-Gm-Message-State: AFq9FYLs0Gfm01BW+En8tvnQbIR0TawnObqWU3u4/exUOKSOSVnUBqGW
	P68kvjseeB21IeSXKWZ4jlRn5VL0VVGXcDJbXbl+GxKcbgGvUW7Z4UVF4i/yNGfaLj4bXw==
X-Gm-Gg: AYBFou1bkQAD5UHj62HieMobEHyoDuWzSSHHRoAXk4Ja+0LFloIEwNbzcrYK+xJ9xsb
	CrX7A1V71E/ityjpqohA++V38zBwOHpowcD/LKz5bzJoKLqz9Hd8B41GMcOWIx2IlLLjE+08tLB
	FhPW8r8/zIZHHWTyVA4vxnA0dQulgGopV1HkIhSrZN9lbatsjKLDw2Jcn/+CZdn04NddR6jRGu8
	0LddKTvb3DcYhkh9xiHhUuDTiZWBS9jd7ywbNq9Zx5o6MAOYzOdDtUnqN1hbkoiVwsg0+YkpwXA
	NmAGDaK/1njkfmV8PKzL7POKFZ4Nb/iOkhmOa3kSQEGi/9dopiT31QfndUu/eSPKhXrGCtSrY9U
	u/AsKWYKShUGATbCjZ6CWX2Uk4T+C0KEBvNWhRP6SKkgPtHzpPOpyZ1YAkSlE6T0ZnFC1k6vodc
	GlMsV07rZB9FVOaQOj0Fs8q3iLU/2SeZ2yksMiot/H6Z9XvocPHtE7yy2mbMHv/fO4z/13QJVvV
	YUH98GBECiytfTHRs5SiAmdTlqnBKYF
X-Received: by 2002:a05:600c:6290:b0:4a1:813f:2a61 with SMTP id 5b1f17b1804b1-4a18e4ad518mr163049805e9.15.1791799777253;
        Mon, 12 Oct 2026 03:09:37 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:10 +0100
Message-ID: <20261012100816.331033-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0

