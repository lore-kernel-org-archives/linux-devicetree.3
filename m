Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737850;
	b=pzXRiHPvEmFuPNxMb3i9X/Cz5eDwKbotYSpJaLkofDYOcIwKtNPBzr6lHKooY2VCFQXH
	 P+wgq1ewlTvwMKt5nz52SppXJ8cRaljfv0pgnDrwdv7zByx5JvzMpKcpQmRgCmmf3I5OA
	 +3EYRp2auMvte25ul65PnFnOR8GAO+MswR6IYTwnoRwQTxtw3jZkzveWHnfKDApmL7VG6
	 vEjyGn1+VoATOnNRIBgeWhRzJmrTbuEmfC0J1Ng50MD4e+gFTfGgItZF9Dni22iZozeDQ
	 tDZQnYK9OfvZngXwlKSjWcQ1mgE19WaLUnCE6sRwUjxd34H8yAaP5OcrKwY7A+JDZew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
	b=xSx3Op5cHjoJ/SpppeX4ypQFDaCSDqss1euPQQN4aZm0NVPuu8binVNhXldnzGXI9Brp
	 a6Xd8eDPHHbanIxOg97h3jqQPgg2pm2QOu6Q6zvrmu7YiUonLYEssN5BqkGZn6txVRLI5
	 c45HfKXMIOY92/sbiU5ZR8U5sIWr2/GrDOXcKAWz01Wr5rdXaNZ6IOBvfdWgvrP4CLKXv
	 1bEwIpmzKANbYWLv5TzJM5h/xjOBwr3JfdD6w89LYjdvR/QoikYHwJd0336vg++0IMOIm
	 Uo4DjnOSsHs1rEa+72+I0obGELqTPr2TFEofy0qugBpVYXS06baOcxWtQZVZGiSYaiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aL5Q//cL";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6A606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aL5Q//cL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so45930815e9.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737848; x=1794342648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
        b=aL5Q//cLEuNpA634+unzLV+p9v8p+a7Em0DbXEgeZ0BLFIFGIyCSbF3Nqsauxl/uRJ
         Z0E3nWzxoIHGm4saKx1SkugDmfWNjfERJjzc2mGvK9o1fR4A8I8ep0/y9wUCzO/xTXct
         2AghvsWQ4UHnlt3GzSn5N/oSbJ7iixOUtMD6yjOTo0yErvx90MDFLpR6N9zITulkJLxm
         +L4fZy5hfzCvmjy56S+mKCyD8soisxcTerJ+ev5vhxjOqbr0ghbI+i+51cieCni1Ldaf
         JfLaNVjPToruZYOsf1EPv4IX2reBP4O7yCIBI3538/FyjRca1MqZjJBeSzXl8HL2nDuu
         a9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737848; x=1794342648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GOCfVQ1sa5WzcdZ/Tr3HQNmgJQJXir1JU7H6wk/nXHY=;
        b=z6my5tx4nVALOFaStpwc7WuThpEUtumtC3+yeF63hSqAACyBVWrTT9rVo93EH0fyhw
         W6VMwPfjuZi/R4Yl8+/t7qudeFbPaB1Xppi8TFcYlD/YnzFPHRKdqqWc4OwchgmerJTZ
         AnsWaN0MthNHLb2ZgOq8iPSFx7ItNZfuZq8woWkHSootDQ05XDUWTIefkX6jOKbB1J7a
         Ko0Zaq+tOwXA0RPA0rwAZiGZNDdYNUzTMLpQ48WlgMuu9G2ZNQ4p46htmDR7h6/rbN9d
         WOBb7gm9alvgUcVguXMd22NkLTaW55nNEK6uGThs1jmWxzvRbF0Woo4nV7qxb4Bq4y9x
         ejug==
X-Forwarded-Encrypted: i=1; AKwUvBxhsr97bmJYpFfDlgdU7njuLE7y/5O7w4QHpANX0azFDXGuxMIz5tR+x1d0raYnQXzK6s7nWIOSL8/J@vger.kernel.org
X-Gm-Message-State: APuU4Z82TF3olMfkeV++Q3cTPZwz1WIcBsvsj56MDfrwMcdkWHBMW5VD
	UqB2QHJVVgochHgs8lgvCAp3cksT6aW6FoRZpyCi5q2tw05HylfTlwF9
X-Gm-Gg: AYBFou1MhKFuQMRWUcsK6gBGZK535FFpQ2NFqHXhdtgk+XjVlzvM2TWsTJE48ymP3xZ
	QDR08xGwNHd9KxvI26WNJl62NSRpowN9MtiLCinWBoNblXZJXAsdIpwLaIaXaMGWrXbFcN/yCaO
	Ti6IbCmDtsNvBjBtX68A+ZttgHh1uWET5ViJtZG6Q0juV5vmh93dSzP8snHoT1Yor0rX8zIA9UE
	V/tqmjC0lFqOEShxI6W1B9EChBuPa6r2/gWBqCGW5FJQsJC4/oors219dHogzNVTelzljrWeoSB
	rtSDRNTBi/f2k6s6hO2NL4IKzHunlU/T2jS0C/xeJV+ryHd28/rejAFhXOuY8GBB/BPkzBNQEgk
	NIqQ6Lbn4lvbOruHKcHtNRLjK+w6RbZ0c5UrEOLDrpI/+4pzjza8f9QCpcLk72Bq/ft/i6vSI9t
	BTN9Z6Kr5YAkvu4m9r42lkzacd4tDn24SMFmdoISKBm8pkRKag4OIa2avQXTWlrQ852GQGMrT0p
	UzEeY+DT7Vtxb5z95PtxQaIOoCb0d+fHqStAp3LYQAEAfWllPCSmMwK45PLkJoNIkJRqLRnM2Jc
	+oBzRSBMvKtMQ/04dcMIF7QkxtZDq7q8h7aC7RqL56Plz1hJ4zr2Wto5it8wVb7j/FuGQl09pY8
	LPpGDgDr0jhkzPA+aboZzhtSfmktixsV4uw==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr323378835e9.18.1793737848028;
        Tue, 03 Nov 2026 12:30:48 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm75110245e9.4.2026.11.03.12.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:30:47 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] an8855: add MFD driver
Date: Tue,  3 Nov 2026 21:30:30 +0100
Message-ID: <20261103203034.12869-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This micro series is the AN8855 MFD driver that can go
parallel to the DSA driver.

Changes v2:
- Rebase on top of linux-next
- Drop switch part from DT patch

Christian Marangi (2):
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 134 ++++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 579 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

