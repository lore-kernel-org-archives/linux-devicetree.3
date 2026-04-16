Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D03932E9
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331471; cv=none; b=A010gMsFOAJrbmXtOKQ3D19bOI4evgNfz2ifyBK20fLLEUEDtP40CjbrsPmSb9v21sM4Rxn0Zg6zxf+shUn3h2cokz7QTLkv+x6fa4tMHW4Kpnuf2UHjDYrgqv+Y1H4CvYknea5Ti+DxiRaaDGrfn45DQfJoIPdeXB9BsH8m0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331471; c=relaxed/simple;
	bh=paOrT4Um/61XT1noEDF5hTa2aMLicFVrvWEmzFdKUeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeEmwj/ZJ+rs8B5kJhOPL1suAbh68IaUAEmHHJQVQkqksBqAbqWHhz6ZuQ5DsG8qrgfUD2J6hnJW5prglW/iRGowHaSIUutaBRZNmSkW+aYNVv7TBUKPB7rVnluL9s8cWv3smPZIDaL2ao0MLh1lJoNqdNkezZ2jLrTCsFRk+VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Fw9/Eyob; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Fw9/Eyob"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bd801b40dbso306509eec.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776331468; x=1776936268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fdzF5y31CufKiwD2VPREbxrsOqwPtssoG5QIcGgix0=;
        b=Fw9/EyobMR437xaNAuD7amVOZJ4KmMqRj87I3Tr9/HK/OG2dOI2FBSn7STlOtxg4NA
         nYki6bYTwVIN45ZbYw/R+Pn1HXBvSpkXRxgSf2eUzN9+MHKdKWaseZ1OLhVzCEhzU4r/
         P4KjlLERfI5Ywq8tUFL7TdIlQj0+BuG41kr/1wvEiS5wwWVawzwll9ucvx9UUcmGfYio
         ugc5eXJja5DzF5wwtyP9VPgMloxkGBP/oGAPFbSLUPNv4sKuadBZU9impxu6NWFdpGO2
         9pJHZg8q12Hv9sSrSGbl+3g+yvxEa2MaqAjnFEOhChbpOzJOKQlJaSfz7LagELV2N5jR
         JQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331468; x=1776936268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fdzF5y31CufKiwD2VPREbxrsOqwPtssoG5QIcGgix0=;
        b=iNNgdC8aFeSjzcPREF/BGHaWduLpu6CFU3HAXodIPdE7TlRZf9OcV3Nsdo3sye4yww
         Cr0hTWfaHReb0vp7roJUcIeAYU+xNarvBmGvnrYJRruYLfeit7xESZI0s1Zia3cRWDGF
         cIifcjsLWzZ6tmkEvHH0QAtX/xFFPZfOCeS/ia2gc9gvJGj8fj0dKJ8kcSFfRaIes5eT
         E8jv7k0VTj7leHJgkj8Sdw4fuO7Vg3j5JhXzhT4J9G3V2seivd6kKodM+ZKxYhKKslwu
         lIHPdb2XjubgDnYfu2XByrF5MCccsUT/PsjY3OnaTxLzdL7BUZKgl0VzbQnGr16QxwqJ
         nmLQ==
X-Forwarded-Encrypted: i=1; AFNElJ864E6Ukzki+YWZbkiL79jIi1KFhGF3AoPQ7irwJlMgAS6TqzF1sz9RehnJnnKrYrx/5E+JDbC06lg8@vger.kernel.org
X-Gm-Message-State: AOJu0YwUM/IfAdFvy2HJ6QvujR3DXz7rTLCf410e7NDcHx/nyGkkd+is
	Gwr/dPvkC5Os17kHUZWBIIIpkoC1oJHCb9T2XeFGx/NKZuCKssBklFvkbCZz5dXCiw==
X-Gm-Gg: AeBDiesjlhSjDjiC91SlWTP2Gtpmx4h9OvXBLPnDyunjsqfLwDwo71atSrdNooYk7wv
	xeR8mm985rfEN/zk8vkkXdZ9Lou17qyuz5Y3U7f1ZXqXMywBAKqZmjX8/+OOWaIZJ/vgERU57BH
	jRbwbiK2ffDro1+NWxznt2Se00OmST065iJI16DyZK2FCbNH74DygMYxfj9RUNvc93KMWF+RL8b
	dg1C0xtdSGCe1xswrrBM2b7MI5ZRwjBIKbsiMohCJF+1wDrMVky4yETgpl2MGCph5B1X9puGdQd
	xtRZy0A5Ls8ZOcCJnwBAUQTV8pHT3oZuCPVDh/DgZ1G6fNzUIFrkEQBD2f1UtvUXL5K+F/CgLl7
	83G53QhjQHrFU/X/yWtQITLwcQTs6VvJql3l6AFb2nM7iqEDVYryECdk1MDhuxSD34/s4Y87fnF
	3Q7bWXE3Vrw9FMWxo15ZX75/PtZ+QWQ2lwtnVV4uaWvLcRcoLX3S8V8e7P1yk=
X-Received: by 2002:a05:7301:100a:b0:2cb:de38:c76f with SMTP id 5a478bee46e88-2de7c7615c9mr1268443eec.6.1776331468290;
        Thu, 16 Apr 2026 02:24:28 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm6423815eec.26.2026.04.16.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:24:27 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v1 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
Date: Thu, 16 Apr 2026 02:24:13 -0700
Message-ID: <20260416092414.3210383-2-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416092414.3210383-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configurable device tree property to specify
if a microseconds delay should be added before reading
the RTC registers.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
index bf9c1c4ddb7e..c7c2720a336b 100644
--- a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
+++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
@@ -29,6 +29,11 @@ properties:
 
   trickle-diode-disable: true
 
+  ti,read-settle-us:
+    default: 0
+    description:
+      Delay in microseconds to wait before reading RTC registers.
+
 required:
   - compatible
   - reg
-- 
2.51.0

