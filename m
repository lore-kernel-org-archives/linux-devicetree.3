Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02C361678
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224523; cv=none; b=L2+KBrpHdEzm/9nixTg/sp2bN/aWC04D5DhLLHL7xFxeqfk/Iub5TcdI4shDZ6IZriIf62RTg77TwjwJXzajJhh5ExW1gXw248X0JGTZBqdtYpJ/icGm+3XIoOlblj84A6lbIjS5d1TUB4I05f00NOB+FEhOGwh+4OyKbj0y0u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224523; c=relaxed/simple;
	bh=v0N8xo6MFWIwVEW8StRaWQk6fHZBEqBZmxy286b/97Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/QXPN7sQ1pSNMnkhkfxwDqgRjNgxvddY3tD1KqrUtC+/dzue/SQ4a4YeQunT93TgkXIdDGMJbOH9G15HADAstvisi4lPxd6bKBTlOOBuxV4ZpBccNp5R1KDBcEpeKK+aTcKyGMjPUglyoKHytQAjMn0+Cpxo9SEg0slCvImvSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pitMKBff; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pitMKBff"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66e56756044so701995a12.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224514; x=1775829314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=pitMKBffVYy8pS3eVc2jLbEX/YabbXEkPdmH3+7Bh0wvmHVH5Lx5UqB0JyiLfRV5Xx
         gyb4BVZJlPZ42jWX1Cg7AlUIMGub913rXtCxWz6CwzAJ0NYuDKH3zxo76LIz1aBxqD/8
         r+FJswYi/uKfh7LO+qGKIS/mCccQ0OQWapV678f/NPyiBwjhfpSilCaBOf15iVDIK7tH
         d8UTXctvWm21Z9uVUDxUFIm3NsQuXfrd2OCOge4EiC6JsHDOPizkPJ9I74LvvWZPilQ4
         G6N6PfN5NL+E/YSry+SEI3N/NiRkholMSOzxdYHv7MkciFpqH7VZC6+DJWGtoSr1YdyP
         JIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224514; x=1775829314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=A1mTLh4/KKYuoNL4JmhoIbn2gB/wp8pskd0w8RhK9sGakJf1JBw8JgOj6sXU6lNBxM
         3CP++VISNv+gxjKO2YMx/jdVgYVNZOzAYHOgStlsgqThGeCu1pXvPdnbOnxws0fStuNt
         doGQFcp72e9Q4WApoYFpNfWRlvFUElakFbRRy2ph+UUzaCzhS4a4EzqaWzWNTR6vI8E+
         /1HHOZnp8hsz6RyRNd7lXtYV7JjO+8H/zvfbnWLeqi9pLfqZYfS73X9s9ePCUEJtcgVt
         4Bws1cz4OTrqEMCEpCuhJ9CT390QOeZOBhJvMKxBSdxNbfO6CMtI41I4fIW9+AwdAyex
         d/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPbeJpMpmGvfZpyUBHVXzUWvjqVrFn2H5kY7L1zazv9fg42JDOlQYQ1t5bkLIJCZaIbDLvvzAvjhK9@vger.kernel.org
X-Gm-Message-State: AOJu0YwxA6tAL4YLy1KHOfXr3mhrSVZva+GS8p7q6h1AOCOqHXV5jLfN
	wd9IOoykRohmvDDRgbGJRD15tPya6oq5d3puhdFgMuRELYytu+BxWKGcW32+0HcZAUM=
X-Gm-Gg: AeBDievwOSnTKA+S8brx9u86vK4O5er7oHFT2hpYZBfKgjEh3bStzHhHH7aBlf3aXFR
	dPZsX0u7UTku1sAgmeyYYtMc1LttLD+YPqW5CWWghnJCwvJEurSMDxyDCprPhWnXADL1y0jcp+w
	oSBWr8M4J/gl3a9DVZsqTZE1wjUb9jY2Y9vSbaaDSfIcGDP2wHuOfD2EyMA8Z8hCAsSvDyfKTMV
	n9X5RKUC3IMrwPxg/3/nnd/ytH9kavfRqdFL28D/tQ5mU/A7bWTY0jWHySNXuJ+yrKevabG9PPs
	VX4/HAIByr+vCeWyxdlMtiS+yuAQO9nnLjjqwVO9YBxmNC8UbUyennZSpYEPozkn4VbZjHumDMk
	MArJT2STxhZFXb1ghCSdh296rysjRbmdtIDZxbH2zka3EkLxKEbI0WwWOWL7mwiFYTvNks8u743
	Le3cmsdWJuiFRg9YDFWMARirt5rFEwwMW7UF8x068ygp0UP/RXUaL9JYZ84dIEjoKUgDlrnWKoh
	DkLiiL6Ue3xI6zbnTgpRcQnYvJxHBqUeNdH0g==
X-Received: by 2002:a17:907:d08f:b0:b9c:10c4:e708 with SMTP id a640c23a62f3a-b9c67a34a9dmr143022066b.42.1775224514386;
        Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:47 +0200
Subject: [PATCH v2 1/7] regulator: dt-bindings: qcom,qca6390-pmu: Document
 WCN6755 PMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-1-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1270;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v0N8xo6MFWIwVEW8StRaWQk6fHZBEqBZmxy286b/97Y=;
 b=lmSluzrxl2IvHohqbLRwM8ZeK0TA0Y4HsWh+y4B3jOfVOirTRYkehiK7ceZ42CboR9e5Ts5BN
 rMEWV8MPDVyDP+/ux64qnG2NCnxwOhrrXEqE51f24EPFDrswFgQmVZA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the WCN6755 PMU using a fallback to WCN6750 since the two chips
seem to be completely pin and software compatible. In fact the original
downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/regulator/qcom,qca6390-pmu.yaml  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 47c425c9fff1..105174df7df2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -16,11 +16,17 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,qca6390-pmu
-      - qcom,wcn6750-pmu
-      - qcom,wcn6855-pmu
-      - qcom,wcn7850-pmu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-pmu
+          - const: qcom,wcn6750-pmu
+
+      - enum:
+          - qcom,qca6390-pmu
+          - qcom,wcn6750-pmu
+          - qcom,wcn6855-pmu
+          - qcom,wcn7850-pmu
 
   vdd-supply:
     description: VDD supply regulator handle

-- 
2.53.0

