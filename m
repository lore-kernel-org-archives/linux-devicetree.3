Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732125;
	b=FZYLU+0hcfMtVt+RUEm0H7KNgYTIlDciVvbW1IXNe9SwHEnIcleHxPY4LbhvVlQzO4mC
	 T+xOL17a9ydfBOQ5MQZ5eGSwIJcWm8bQqW1qgNfLU9epEElaRPuqnVL/e/0zwTHFW3ino
	 X67mEtt5u5Eu0KL2Y2oE9brRBpiRdLL2D6fmNF7oFVlNf0P9i1UXlZGbWYws8kzGTRFLF
	 sSqauBiBtgAj/D4aTX57+MgFoPRbxdSGldc/rXAnbgg9tox/Da8Cys94gLT9cDldX0y4o
	 4Mob+jp7DoTm3X5EUPbbVTAZTaL7o9doVLQ2ZknV2h0/Oa0VTUzxcVPEtGj6nvofQLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
	b=LobNbyLsVugneLzWcja716M2tNHJqUkhPeB6eq5Rfj6/x9du4A4PeQupyjtP5YECTxVZ
	 vJapxMCv03dfqEKF/+qo6Iobjj3C4bZJZa84srEdWFmjICMKtQ1RREYaTDvXc1OJ6cEs8
	 R7kCIRGjMwJYWORzGtae2ZOm+L+cAYePXQ9yuJAKBLOZQytySFiuLhSIX5VhXdxZZ7Ocy
	 BUfZ6vbYSPnexnlMRZysIBUa9x2sP4PAh1Qv3zzwQouHceZRMQTfB89YCAc8NpDretvOO
	 SkOrcL53vYUmBE05csEopw7BtHlEpcgx0UDbqX8P7DpDEED1whQrjgGgXds3vYaL/8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tkdbF0z4;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D9606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 18:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166D9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tkdbF0z4
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ac525c1f05so43895477b3.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732124; x=1794336924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
        b=tkdbF0z4yZRft389WuN/ZrjOIuPjxAA9Ugq9HfjOgx4SmV3kmI+0ffJv3VFnc1nLZc
         VKTaE+c2sgiJ9f6myskdGVQhcmvy2HvtyiA2EvYOZ1no19s4vdg5vMx+aSB2WTPefTho
         7UWiwz3Yl9xe0DEG8xG6yBQjf7AqIT878JCdFVQSppfAxRLn3OglXfeykQLFrUx5SrpR
         33FmvT2PDbmQECyw5w/4uIKABDEKSXWTlEo+tsblMVqWxNKmu0jNN10K27q6DfW/YpV4
         umEZnXeBV9HCT0lEmCItrcfTr5DGq9phvLog7+BERbaRauigtS/dN9ZWTWsPlodlANVf
         Ga2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732124; x=1794336924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
        b=CBuim3EL5YS/hzc0tZKQ9aRKBkr5gEf/3cca/vyYb3ZKmyInfeF30PFQI7OS64tWxL
         U+ffFabcKN2YwXOr6/x9TZZctW51U6QLjbYnRkC4RrjnZ9HnUEiP3DIm9k3DV6nBVepw
         WSiJ/EXDlxnF/BoU43K0zXsNnmKpSFQOxd7ssgiPpeQdBLLDHrbZ/ECoTxr7V7t0S1St
         3nnDYl8IzooPspcaG1cnB5qghpPkExlV/AvadAGB7hFaG95HoI8piUomphvYS5amzXEe
         mNcLxrVeS6rsyxt8iprgRXy+HMB3LelXLuHHYFDs07rOJSnwlB1SkSluyyv0Tk8l218X
         NGqA==
X-Forwarded-Encrypted: i=1; AKwUvBxm3sg4d6KNBWLBcR8CKX+40Ef+mRKAqhhE4fHHFg2gNUHQPno5KSNqhCLD5ivZgxJ4evrQA2Lebwrt@vger.kernel.org
X-Gm-Message-State: APuU4Z+tBUY5rIy7eaVwL411A4MPc632dbJW2gbvVYUqsfZCtQew5oX0
	OltoDjBAr9kEAk9gqVOe3jtEAfiHQg/V6Af4F87DbscMiZHjpwavKBcv
X-Gm-Gg: AYBFou0VWl/mCjvwNnvWO4c4naH8gFHI5Ap3dQkrxTTsJ+vb3UVEw7JLo2c0wUwdWVC
	Fmp5YJMjlb9W+fba0TRLGxR0yRRMG5cingrKRg3WYgVWfjDGZL6UsqVD9E2uQROkvEx78cal4zZ
	8kbdo1FP0kcUpuIN7bdrYyrZwjSQidKC0EVV/daU/ZhbMyvqWR8q21/QOjnT5Nc3pBQ8/6cu5W/
	i310rqlgIDLAqf4LnHGyefVWiP2fQRs/a42XCJlWu0V6bjEUVdJPSf5fTQc2IKJK4OF+T2ugrDW
	KktqDNxV9zx0jAMBWapb7RtoLS1+E7F/D+u8QmiQZmj/FlsDeP9OghXKp0pKDaXf7B2Ar2EBX7T
	qaCnNLo49A1FtKgwG3RwlXUEzLdpqYRwqukHlW+JXC8VsL9dyoOCqaRyGiPBWy5I9NPQOvIxilo
	ioDa6Cwhp7ogY3y939Z7H/3yUN0uj6PUpxzSNV2EvDJLPa6eymikRNiDdmJajbbFGM2uidp5hA/
	3ybTnxCknwY2zMhONtF7e5xw5WrvaJALfmHBcGoXVfl+pRI69ji0hvjvVkw/fv3ooBjfIkbFbi3
	PKXIuS66xvzSzcB7y5xkCFQDLSuVuq8HGcrdrm7lGgo7ufNUsrsRIFUQNtNIegwmq0kjvyRw1Q=
	=
X-Received: by 2002:a05:690c:f82:b0:8b2:edac:7a63 with SMTP id 00721157ae682-8b2edac7b42mr47668977b3.58.1793732124079;
        Tue, 03 Nov 2026 10:55:24 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:21 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 0/2] usb: misc: usb251xb: add DT battery charging configuration
Date: Tue,  3 Nov 2026 15:55:12 -0300
Message-ID: <20261103185514.72144-1-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Add a Device Tree property to configure battery charging on selected downstream
ports of Microchip USB251x hubs.

The first patch documents the battery-charging-enable property and adds an
example enabling charging on ports 1 and 2. The second parses the port list and
sets the corresponding hub configuration bits. Charging remains disabled on
all ports when the property is omitted.

Jhon Wilker Rodrigues Aquino (2):
  dt-bindings: usb: microchip,usb251xb: add battery-charging-enable
    property
  usb: misc: usb251xb: configure battery charging from DT

 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 drivers/usb/misc/usb251xb.c                         | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

--
2.43.0

