Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660768;
	b=yuqRAgBt2xfmXhLn2jbDJObf93pb+Z2SHaw22qQEEzeAEaL0Bk53AcCrYOIiXmM7Dhrj
	 d3AQs07oUr9Zyxn2WeVK4wqtlfTo+jWw8RCZCaAWjjX1lFntH3bd7L1LQsuthJqGN7Fqr
	 /mP42ynrp8+hahImXOMHE9gWp/2zVPkw5DdEs11jL6i5kp/b2im5JCCIzck+fd27tedu4
	 D1HPFplQ390U9X9yzsZbu3Q1xFwWrWey8wnC+S3t6rymShMTBN3a+dZX1l8C8csoA1Rha
	 paoAAA97WJ5v9tzKdMRcvLVTfTjXkSbo6Ne/XuXcrcQD2ymzxa3NnUNvpIsf0h8E+fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
	b=a8AhdKkfb/otcHCBXaesMQ9N4lPh7mX3dlZDVKmAFf4/rWZMJyXsD9KXv3urEvEutu2X
	 ty2WFd8n39hAOkmePE7ZydCsHXcRqnli508FgPiQECLKhfTmc5BR62WfPL2+DCbM/y8hE
	 4beGqsbIy7/qqL0eXMn12y7Jdnzdt6xT3manGmyPkOTPnjninii9tBvwOuywwWJN/QFtC
	 FWbd0WBNR9dxnwaJfhHYJYfRLESGEts0mSI2CLTQO8yv/2XwG3BNkCSgZC2tLUwtfheW7
	 YGMMOgMlR82gcUDB2cwfL769jhoLNlV6EMgJHMfv3V15LevRICzLlHwcrB6lSGpSAIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=GLqS2jxP;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6720E60A2609
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6720E60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=GLqS2jxP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4550d8ab15so201340166b.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660761; x=1793265561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
        b=GLqS2jxPj592NSbnpzPb3btzVGgCkLlIqc2/z7sbSOnfobGOCMPB8gzQsJX7Yqfg43
         6Wmitb2SYy20M51IJ2RxNzAyLYyJG8a/inWV2I2vjrxkOfbceXzBKX1tbhGzq4luXZSW
         hkKAHhUplOKV7QXrGiTrKD/HZvQsw0TjMzrk2Nyk2H3fP19rvg2zstpImhy+i42vkxIQ
         maiv4olGWTyT7H4CCb6ExlCxY+W/5GdhZeOsGaSU8N/hRAfBQJf8/pfw/ge2J+f6rAdu
         GP4iBpkz+V4clHyvYWFuqItfblDI4QNEdCR5h6Wm5SiEZPoNUv8vZuR2bMmiqMbY7TUI
         hqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660761; x=1793265561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
        b=mPf9TOx88DWn2D7eFpq3jASsv87J9Fnm77XxvmpDdrPoVhcyS96kCZBkY5ZZpKzXR/
         nYKEjpqL9JX3a4eL534+Xr3dXE5NwQi/OK6fZwkSN0SxM/IznXGd4qPoAmXbkgND5hkk
         AOAiFxTmw4A3miLxXODNhko7C9/55GX6mAMkf1ArXrX5z1qioE8xZ0Yly05kDpKUwXyY
         0MjtuQfiL9K6YIBdmR7eEYeD76KJgcjGHI83J5zix9aXjQJoJd9oMyFFV+8hZktUBf0H
         YtxO/ikl/za+FTrzD3y/oNIhMVK3zr9HCL/8FyZsTWhlyr7WIGbYOWPVgjZ9vPW0BK17
         iZVA==
X-Forwarded-Encrypted: i=1; AKwUvByz8VaHbciqrg4oG8MFnp+IUnb/SjkUDJX5vPlLLhmkTeWBEmZ69DwYny0WKJ22RpAH7dUeb8GV6AE1@vger.kernel.org
X-Gm-Message-State: AFq9FYIqD9EkOrZbOhoL1J9X4lBQWQGP8Xg0OeZRMnWXBsRLLs6Ofur+
	ghVQ8XzbkrIMXPZpzptUJqAuFd7c7TdbXh3+gN1D7+7l8hqMfFlCPz1NCON2yVlT4/k=
X-Gm-Gg: AYBFou1lToPRTwu6yeN9YoWUKnTwXoyasyiDvNaC8DcpRQ8aMS9zkyEkMcMLL6Dm8DE
	4DzsZA2Ihcxe1abp+dUvcLBtlO+jqF8wHNbrg9CuaWk1IeqT84f7CO6Pk0HDynpKU69jEw5k7OW
	sJ8gH6FqWBF/SayQirRD9Y+PMK5oRLfPoB7tSgJJnqPhN2YkZfUIKYolQEl857fz0FjmCljxdd9
	/uKhbipsZmCEWMn/5jj9jG/AV2Kejfk/xsxzawlXwNgtn/sK7pSdAMugw/Do4V3N7mv4cHZtMH5
	4YJB/C88mRbDpFREMxpVjiO1yWATey8kpIO+ZL8zXWxbWUYm0qx1dR15r/N1mhzQ9cJmGdtqjbH
	BZtYj+5iQSO+awFJWcYWo0+hUEjGlR4mSfMMgqoE6UFIVFk2uRMbKmy/uXQdBWCGCdeCdR2rgTW
	G+poUaHbzrfLu7lg6jOUQleZb2MGqaJCnZvSJVIdERIajYXUgRgSGbFh9FScVObyQ8wo1viZw92
	3EzSiXt6IP5nS0q/3BXNEsSTKoOMIux/pXSQ5qJOoPy2NbFsASjavSQvHm6O7rvgn2Rc7uC28wr
	3XWpKuSxm7VQOn53YpVPBKE2UW+Z5bnrBUXPjdemKvfrb7GmzqIG1Y1BlbBcb1L7JD3nDwiIP74
	JIr2WhyGPLebWL/LrQYEelNz/xe+cTAZXarVpshq1Q2qHn8mFfxrcg0aiBRqJL0hSuJzQ
X-Received: by 2002:a17:907:969f:b0:c42:24ea:3220 with SMTP id a640c23a62f3a-c467970e3b6mr441406766b.31.1792660760888;
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:18 +0200
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for AWINIC haptic driver
 family
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-4-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=880;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=pi2nL8kvBYr8FUFdGc6j29pfQDAldTc7iyEJBmQFvzs=;
 b=ozZpMWob2iUFdSZSQQRasTmd+MG2lGCrchPwltTq2tgohqewvze837ywdzkHno0JEnexC4HzP
 6KXAChSxZbOCovVdvHsD4hokJQTcLOOgtPYbLKKhap7193bDvVHJyRX
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

There was never an entry added for the AW86927 driver, I will take
responsibility for my creation and maintain it alongside the other
drivers in its family.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c103edaab227e7a21e50f6d9fd733..5b5792bfd58b9b4971bdd8471cb832068f8aec16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4419,6 +4419,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/pci/hws/
 
+AWINIC HAPTIC DRIVERS
+M:	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+F:	drivers/input/misc/aw869*.c
+
 AWINIC AW99706 WLED BACKLIGHT DRIVER
 M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained

-- 
2.43.0

