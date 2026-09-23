Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38DE53163A
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194996; cv=none; b=Z+3SUd1S0EXC2uBO4VX7/EuxHkgHwYKbWa1gmIhOdQaKbU4tVAeMG6xSJNMGnZPNx6q9LCeVBbp1erVsjJov+4rhon5fjLduRjKyrghC2wQRygw0gIIDoGiiJcfMGvt/IdT60SJMCE8ChG2D6CujPnUitnS2g5ouQAZ2X89ydyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194996; c=relaxed/simple;
	bh=9msDYNKS2pX3bRTMRkqLXL2c0qeGUzPeGcRivpd7UC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0b3Vf760ZDUSmMPwucDjyaqS7YH4qItyL2XNiffl+5q8l/a1UTd4N7yc4xs1o8cRxkvKqpBwodujuVe4NoEvdOcBj+PWr3xzr4+xvMgUMLEf6OZJbp18VDRE2y/H9id95b+VMRnMn6JpLl390Dte04oqhmfHpcG9biIbSmBDyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1tP7Fn5; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1tP7Fn5"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so205457066b.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194988; x=1790799788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6NdCou4tWyO9h5BHGqM0MWB7dKTxAp68NTU6wlSIys=;
        b=g1tP7Fn5T1naBF+UH/jpfkBlYbWdxxg3xDTzyuF8coAGMYevR1Pl8iac4Xq6eHtXra
         +33Uvokv9jeXW4E+pxaSlGqDVYZNDEDsVgxesW0qrzj69DUiLP/I1NLXrFbWWCfXwE+6
         /foVqdlogYYHUFBzH0a5mjgLBnWve4zusT3Fygs9FOqAdvohgJ1fDKnS041zIHsuJp++
         DhvdJV/vvXmeLCFK7xmiFiIxe1S84aYH60HV+j9DGnYzeccV/ewGd6pKCUazbKp4o+cF
         HuwqC4yrNJ1bmtzmGGldWBjjFH5nzO7nJF1Pe4IijhGpDXqGQmIReksteREeUCPnmucK
         /1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194988; x=1790799788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K6NdCou4tWyO9h5BHGqM0MWB7dKTxAp68NTU6wlSIys=;
        b=XxiCpPTEetaaaHJ88AOYKT+iZQZZ+MGbSvkifePk9DJBbc2oESWVNIyue4pRhlJz1G
         c4nWVs9IglcSY3rOjl+K98PlcGeQEp75xDt/x1pKsWtykFNO6bIIAQOsmo2os5xxnunx
         1Z/+4TM7uGoYxiVGSGSXesgrEiJOCSCOUGYD5FziEZT+xK0KvXTAzntKH2OcfCpgzT17
         ffBi/1nERVX1xem8I3xfr0HqqvUnr9WhOlFwjl9SrYrwJpecFWXnaZRuPU6S7LSIEQPC
         o+cHHTEgG4ZmsnPARAmfjcoO4WqZkBOoJ8YtU8+b+8LgM0weFJda5rENwDxc/FxTpZm0
         MihA==
X-Forwarded-Encrypted: i=1; AKwUvBygukgaxnEOXdFZcF21ngOq50s8AL9vChyUFp6l05MivwX8lIwzYHiG1chJoNz64Epd6ix1NTGyvhVg@vger.kernel.org
X-Gm-Message-State: AFuF++n3gT69tQOrZYlRgagWdqZS9Ayz2hPZlpDwA519tBaiGMxR+hSV
	0U48B9ttY00mxGTFGixzHzWQa2Z4g4FhXCJylqHLUghLq0Cv9snnvJ6w
X-Gm-Gg: AYBFou3Ug5FNVSs4DnNVhihevYZdgguVfW350tw9ajbl/se6dC6gubLYm4jukOVmN6Y
	jXBbTs/cQr4dNAiZv9AnZl6hCeK+B/Djam9oZo72Se+wNU/y31TgktAZg3zMudgQLaQmi5KOpij
	TsaKjPJQcpxop11zWRyJT5wTfdya6hFBxVu2dJC0Rw/qW9tY48LzuhYJWWy+NkR2RqBkELae8Ou
	z281Nh68e1GR+AAbb8dj6fP11cYqdf48+8DcSCehpnM2SfRLex3vbO0dxnWq2ODWDdVPKVBWxOl
	po5ocBmL19/ivRjBls3WEDaCqMde1QWDieE7pss3Wenz0CyaRMXVFPtUjTo8HIgrT54RM3eBDDp
	vzF6/325qLnesIiFu9Lv07KZng4roXwfEqGL5UDMV/NolQQUThkzBlxLjcRdHd8OJYRoWJ7tCGK
	zju+dVRNFGWjUFEB1t3XTgloibAdkppdRM7zj3fBHzuC5Vv28E4gNumwtxurpNgo7W5wxijmlwm
	40rfbrQh9KTw4gc1XpFDcLjGm5gSbutBZ8P/RFsW8uRsN65w6d8qw==
X-Received: by 2002:a17:907:6c17:b0:c29:f5d8:9c71 with SMTP id a640c23a62f3a-c2ac223e35emr24501766b.32.1790194987758;
        Wed, 23 Sep 2026 13:23:07 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:06 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/11] dt-bindings: i2c: mv64xxx: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:57 +0100
Message-ID: <20260923201701.43391-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 controller follows the existing Allwinner variant.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..d3b6f7668621 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-b288-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-- 
2.53.0

