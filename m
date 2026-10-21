Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582476;
	b=iJGy1VPXQ9RXWdL+PSCbfAvXKBY4f/rEHEuP5TyGqD5bMzuAS/+ZG7txus0lF4mfRgh8
	 IJoOBbgDwone2Qo0ffu7tsD4r+xi8+onBWajBfkEdxP+6fhfSFX3jrNfbaPY79otcZjIZ
	 G600A2hgMj8oMeghffHUtGkpzrKq6bD7AjNJ/haKVGsCmQNVi0nL+2UMcBCbRnZwSyOy+
	 VkwqjVRpRnkJe+LK1RjZNLp5D1qLiF4XYMCebzBP+KQeHI/ny4Pr5tgH6iHzh4gcPhwkG
	 AErVQGFTK+yTptPuApJntgs+SohZR04Iy+ieOV0TsEBJg6WRIq7nc1AjpVLQJvOrqRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
	b=Azd0vPNo0h1ATjKFoG7ot9ocQidMlDD2EJDmli3uoubEeF9Dh7CYAkbZmokCjVKbQRNO
	 SAkFqfu3ky88JslkvCLK7+LK9zvh1SefVUNGOpXPN+BcWSr/E1jfNZ0k0Zo+NNDyKshL1
	 bgzDFRXJgTkBj8fsQWr9gZIL/Udl8t9sZVh8utzwc0H1D+3SdSjl/6tyIxtGLqoWd/wy+
	 HUMSkTwHz5joFi9knlVQaxKhvPpwDmgmnpSfehEGUSeh05I6nbsG09RJtu7QLQiBq7Jqv
	 ZpdMaizA6pRdPYrvpI4dAnZU7TfMsevkngteRHkfh0/2H/x3+8VqqTUQC3nNUXvWgEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ra/IZ41H";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F3606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE2F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ra/IZ41H
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so464565f8f.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582474; x=1793187274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
        b=ra/IZ41Hpm6RTmSY67bSqqFGQAqsRwPm2xdKmwPlFt2eoCzqB/u3fQxsNKwxH87N4D
         TC0fn0lspl6/p2aBdSJ7lMtzul9crMCLtm1ZjF4Q6ro9+/11cyqlZhqSwz0juFgaB3sM
         TE1x32Gd75RVcSdyDibRlPkjclmKQfLad2ieU3gjjVEOIacXgdbWjFNyBoMSGnvpuqYZ
         5ePfbBIGII/hfQCxF31N3ikSHknBNYv9EUuXGYJmct7pfLCv6bb5IHATYE5PwbHPwv46
         Mz1t3rAg2/zH1n1suaJ6RzJy+9P9evvK6uXJ6c2pdATLzsCH8AvqWNo+a+DYve6kXE5J
         bTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582474; x=1793187274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
        b=bz2LnbJpKl1pWe/HhvcFBoMQIX+aRRfEZeKQ3Us09zENaRBwyH2bm1bzrDZLIAxubM
         r7Ey/nRO7A+vvM3P6Q15HR7Y6ip0PNNU/jtD3JzvKxBN8l24flQmT08ggWysVxznnQzH
         QeJN4xCl/9A46vEX5x+8uvJtbfUZ932zwOasd8R83zjoLYNt/vAD9IB2VTVIIkOg1cCu
         u5e+dCQEPVqAlN5TC4meIRipuNlcfy80O258lJTJfMEKJ6PAjZKX60DC4SQPfJsQIEv/
         QqSZz7R5BQ6dvjLOAwF7sEhIu5UESXMua3kczDp7Cb7XAohjT98Lb0UxDzODtfkPDsow
         DTeA==
X-Forwarded-Encrypted: i=1; AKwUvBx3aZCwnysaf+Oy2ZKvMmMCxiKmEEVimWJjf3ZycI0R6ZM9P/zo2BFbIOEHc8uMHEDf8YevdMV+D9/g@vger.kernel.org
X-Gm-Message-State: AFq9FYKCG3sFPSB65wf0epTlaDIjWfPgnSRAxET31Ek3NNvl64l2p08a
	S7POO00FM3BxHyOhIeYqB51N4jtsCRHv9fDR1BPlt7IqwgwXQ7r39vEQ
X-Gm-Gg: AYBFou3ipekaLLspyAorHce9Bgbc1eRL1KUlFMSUULEj3ejN9RDKzNjTbKh2IheWJtk
	2dOYZ+jKSht5LyO+gc6ctmzCsMW299R5jM69vqGCzUnfry7uKj3KCon0xt//nKrMVwg9BQwBSh2
	j49/3DRLW8A27HHvPPENaTTP0EG7mTHcw9X6SWwoP5y02Vngv2VcVjpcTLJWDFvri2tWsHI9mW9
	fOoFsZip2wchTmqWBsZleyJayDsaMiQ0UINGZ65cOQBsEAZe/srB0mHl0wr/R0N3cRliw2IeAZx
	sSUn3GT7CfmRu7Zj9q2C6e6S04bpIhB0B31VZ6u6VubBey2h6pjvgfoK696CuFD6ttTgvQ0HCdK
	XHUQWqWUMjYNlxi+RvS4HqRGN2zFKAlJYhPSqaXvU1QMzsKgDAkGTobFprBaLcyRD+s0k4+7/Ob
	J/RNZjGLQXORhY11Oo0wFPPZ85NA3ET3YH1SfmZ54n1jmTEvnT/Bzsxy9A+9Sic40rZrw74WDkq
	2br74ZS+eNOj0W+225fx13imZg9ja2sMRzDAvmeqV99CfXQDkRlyiU99km9cbTFEFQO5HSj6vRG
	rBAGJPb7kZL1UDN9/b9AHb6AYLWZphN73cKjf36wDwmn4ye+JmlQcGBoi0s/
X-Received: by 2002:a05:6000:4553:b0:48c:7d67:8ee9 with SMTP id ffacd0b85a97d-48e264ce5dcmr2487077f8f.19.1792582473710;
        Wed, 21 Oct 2026 04:34:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25833b9asm5068768f8f.33.2026.10.21.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:34:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/2] mfd: add Airoha AN8855 switch support
Date: Wed, 21 Oct 2026 13:34:15 +0200
Message-ID: <20261021113419.283015-1-ansuelsmth@gmail.com>
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

This is a subset only specific for MFD changes for Airoha AN8855
switch support.

The old series with all the patches can be reached here [1]
Changelog is included in the same link

[1] https://lore.kernel.org/all/20261009161102.38961-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 579 ++++++++++++++++++
 4 files changed, 770 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

