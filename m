Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586736;
	b=mVEAag61aP7aQEXQsZ1g3cvYqnbgUCeEBlniSIp0Mi1sW59zMAVvkckaK5o5tF6V2cGv
	 22rQvB02cmMbN0Q/IBRbzoIJlB+l6pKUnfC7AVEqlSyeoI2q17Oxicryyot3xsnZRn5Z+
	 pt4Y5mjg2Ao+xYz4bSEvM1xPdNP8S1WQFCJ9aRg+Ipr/aEQeh3BUrkhYhcmB85PbqGljr
	 AKEu+07IDEKb0+za7atytP7g3FdbrtZYDBnNQN4dsncU9HhMeFl2ydBBVVcLWIUCE5Z9h
	 Kymhj2xuWUEuBu5HeFlWni+6hsbn3rSV2WL8o9ridOOGPRzQE7J7D2pBdOK2M/Hckkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
	b=xjgjKw2D9Nyi5dOX/wdxVCu0FCe+Zab91gaKWLDfzJ3nWIoVJJNCTyZz2N0T5yLcfyqD
	 L4Ed2PCrKPTJDbOzoz3YzplgNQpAzYiu+Aaj/y+1LL4DF9mOgFd1QJQJ41H+IWaSoQYyi
	 F1jzAwNOzxHPpzFZmFQvldxSamjgX5RjUMoOZtm5Ph949O7SVJ78NQhg340u7D2AJYWzB
	 1JgejUAsB6/1aB0qZcpxXE3O37AP11DHl4PzTx6M7jzaqLEsI00GbKlL4/V8bUQQ0Sdua
	 WgYgtkBKY8CN+9SZ3bFAdnwdvaB44fTlbZj7KbM4ayjScp1Lowff4KNfNVtdtVc4MMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E260A261C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38E260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so294910666b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586734; x=1795191534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=P8ApHqub6qGp7W+FFebdVrJ+X5iLbPmacffloHi9fTC0HsJXY7rSMdfof50ekS7ma5
         n0CDtUxTa0CC4Q4nNOGSpnUl0HfOeZHPKL0SXehFLng+heyqaRIn2Mz7ZAw/6ZVcE7ZP
         iNFnqariIlA6DrC4gcyGg/2D1pBSshzYTdQ1bWvEHsHedrWACgysTbNUuVTYyXtLbmqc
         92vsk1zDxV/C7SAT8Nd1NZtnJn8rbJa5wLroVgvVrmlYuhfpGuO+Aq2CHOsopwMjAyZ0
         OKHNz0mtuFA/3TwthJNbgyRMxZ/oK3bMMORNrMcRu1AP2qITEXEM8WsMI5E+PkuLgfBe
         7q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586734; x=1795191534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=KBnOZQYcroeC7AUe/CKtHruRaVIkDd58Is2n5t7/tYy5mNUYLiowSOmFYeN2xw+PBA
         yONLSUCW70gs3irUbsfuhNEeMoXTS8EeTcGEwLnBJ3b54bAKu3j1beJVqReTIMFI6Jjm
         S42LPelkngOlLeugmHS5MHcmChSvz/75JPz/LCHrF85J6hzg0hqQJbFOP87PQeViLmQs
         +SkF7GyApUwsKkKovlZ7ZOlb2PHSI31bzj0HdLcQ5asI4nvL7CKqWZzqdOFuGDefbljr
         WSdIObuXIpi6kwCYyh+++qC0r1gd18YaBfHfaFH5wSN9FO2JPb61bBEiomjIHPI2sTPp
         p+vg==
X-Forwarded-Encrypted: i=1; AL+hErFFgppUfeM6n3HqTVFhk9ESQxXPWHakdSTNAYRZgWwz/MsTbVI+Qmgt+toar2VE0XKTmyZM82Wn66qa@vger.kernel.org
X-Gm-Message-State: APuU4Z8EWjwqeKMLce1pzuqIhBG868RLigotpypKsAznAC1uUpEktZcE
	6USwraV8jYNJXIHE/AIvg/rzruTbIxWvMEyKerN614LsMFnfTRJsbsFd
X-Gm-Gg: AYBFou0Ymy+jFG8V++HQF7g9/I9CsGWnjU5N14JnFnl4cKuaHoHyY/C+fes9Ps0ws7S
	yjv3pmLXstFuseATc3qIxF+UjxIkjlS3uyAVnns1V/4c+GmDum1+IKzJnUON55GsfbPJsYSXdBF
	O6R6iyu6qC48Js4w90CUeDK6D5WJTEveD2tA3iJsV6+auyhK9/6SRQqBdCLUwz6aSePoyPnFJp2
	y65rij/YzTqqSDjFcndEi5omMuzPXHE/1dmwoFzv8tAO0PezOnylFQLobpbecMQe6Ljo1J3fxWS
	U62fJ71J4pxHagLzCNxmr7YZ1QziY5pZs5ZjQgv9gFhM9iZTjQcysUrmElxRP86rtCduhxukv1G
	Ti0OuCY28ETYW3W7m2UkHgYLyDp7SWi8gg1iBHjH7+662YUO00vs0J/DXX1ZZXM61ODXvK3gtfQ
	S7CVA0c+54junKXOLoxCVSEyyXSIm9RJgPuLIdQj1h8FgB7GVg4Don6IOy64aLH6DRFFHnjyOjR
	FyDkex4S43xFPXnOuaXjjGpeWp736QHRXVnqrwYTxk9e0qlv4De9tDd1bvLAq4KFjjPZDwNvIap
	otm3GfNYHirEzLTQtjzJgDdVFRCmroUWw3cw0/RwIzXqh9y5msAGZ1G1ttI2Xa65id5qMhTYIuQ
	9OrCMZmAaPw==
X-Received: by 2002:a17:907:3e9d:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c5096396e4fmr271748466b.28.1794586733814;
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 07/10] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Fri, 13 Nov 2026 18:18:16 +0200
Message-ID: <20261113161819.36847-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..0c18ac81c6d6f 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,18 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
     items:
       - const: csi
       - const: csia-pad
       - const: csib-pad
+      - const: cilab
+      - const: cilcd
+      - const: cile
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -125,6 +132,22 @@ allOf:
         clock-names:
           minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
 additionalProperties: false
 
 required:
-- 
2.53.0

