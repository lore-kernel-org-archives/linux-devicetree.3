Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DCA34105B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884329; cv=none; b=WYWIu1vM7HNXWR2NkxPmRscSGYp+Akn1i9lkYXgttffAczU6kc9mQvn9yK76mWMt6hMUYuzZTygQcwFnhAHE4RpMVNBjyPNkVqv2oTEoff/m8kCHtdNhJkmwjt5X2x11dUSDIyvIFNvTu8AwJF1TZgb9VXAq4yVl6CfpzZYMoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884329; c=relaxed/simple;
	bh=WVhLnZ2EmGBxqENPWfNXyMc1MEjchMwTAMwswedf6kk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c3ZXHGq+UG1fbmBA11qw2mmuyNQxEb19vaOSdnoJHALGgcdfVQRcz5DypYCIV4sG68fOjmft2oNnhAgc5fIBsr6TYsTLgzXAOwUXv47Y9NtLAlRSOHCmvYD9KyuKKuWuzeIamOmtraJ6b7kKBGgWiyQcE5ymdwC3KW77tlRdLMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZk/h7u9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZk/h7u9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so614693466b.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774884327; x=1775489127; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJnnB2pPQ6ncWBZL6xleP5qED5g2TriMKPwgfGIkEwM=;
        b=RZk/h7u95vCgZDXIoBQ4swZ2qTQ3ceVFI2Pl6XODVsDpaDg0EoA6E+bjwGonyN3yT/
         8sZXQLiJbbges1RgLoFDVtO7FkoMgNcW9FsOl8+0O7KbDyx1qZh8bEraG9vNCKNYrk7n
         8cqlRpxvjeo+aTKpbBFazOewdVRN10yu20XI3XpFPVi6bv+iPCDEbiy0DppDcQX2XOhO
         yJ2nt6O61Y+X4xg2Y/COQPApVxnKzeGN22p8u/K0jV2imLYzoHv81Y5v5WvK/dTwmIYR
         5xxoB5ZTEmoJSA8g8448lAcugDEo0mPu6UhdfXjwKOyxsgpSjW7IwEAT81tKK0Zfm9n4
         ZVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774884327; x=1775489127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJnnB2pPQ6ncWBZL6xleP5qED5g2TriMKPwgfGIkEwM=;
        b=FOzRnKYC+n0DtqlLQ+q+fJcdHQYqT6uUmNBw5sisvbl+yWcljOJNYuFaASV0wviKIL
         L6ZKsbrjKjnDAvyaHNL43X9LTssSDZ6hbkk2hg9sJyD58DDhpO4eD3LixMpdnkTF+o03
         VNm6Zd5DgXubbPI7ajylv04LvR7S/Zss+Lu/IJVszsX0Pe1bNt+bnyoQLjMNOm7DVXGb
         e1U9tFTlMkQW/r6bbDAxqG9DUp0PWV6ODPfp9hzYe6NK68DmYzgKgdelt6UKT2ltERe4
         Fk0Wny1bKJ/9mSPKN9KXJcI+wNSKDIwoUImqdiiGgcIgr/rOXsEm3cPGMgprbQJtwCSI
         hAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpey+/eBPU1LlyfYxyZ0A0if4bhVSS1on8B/pI1lx2tnsnP9LnXrT0QdNUDQ2K5qv2JhUh5EOckq3r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OC08bBXVUBfWcLdf/7DbqNo/ntA9f13MWJfOwSdFGp0QtYUj
	CBi2+i52e9nSstJlokQdgd7Xf3ldWdzGgba9FYdnuxNqxLBQ+fm6qRIP
X-Gm-Gg: ATEYQzxFhDeBu0GmyPNwwwzZK3F9bF4TZBDtZcAfS4E9IH+I4DuMEyhr6itJlSTit8g
	4USbVM7Yq34QmsBl6BEFs9z9aGVWhzdGGKd87ABYAuzv+tcJ+oiN9M8rqdwhqevXx7jxDjcwWIs
	fjN903lns+ioku4fbyLQ0BihdhKWpYuLBxdo5xMXOhgBXJPFpKn2q3FBbqSUnjNu3A12KoDO8G1
	iLsSj33iCDfH/69qTlSIIqn1YO3V9Sl2ujLwdc1aojEYRktFC7xpLtEg1CCI1+e12dmvvQtLIOa
	ZKPECLPmBh9raQ/MBxPLg3T6OKlwwWxqHOrmRnNsF/RATHjt5+vA4IsXWYF/IFiff88BsHa680g
	8R622XfHtYCyRERzML3ZP6Ue93PGWz2ULFU+5zJ9NXeQCFZsoKGh3ojQgjrTSjHkheiuyHOvLhi
	SaJQ/PJDlLS0NkWlAgz9CnmnYDg7H1Tb0sz5K2Fx/X1/VUl0EJn9d97JMbozzKXvA=
X-Received: by 2002:a17:907:1b21:b0:b98:1062:afdc with SMTP id a640c23a62f3a-b9b507a5dcamr785644666b.27.1774884326453;
        Mon, 30 Mar 2026 08:25:26 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm301058566b.49.2026.03.30.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:25:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/2] arm64: dts: marvell: armada-37xx: USB3 PHY cleanup
Date: Mon, 30 Mar 2026 17:25:15 +0200
Message-Id: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnA3UVFfcr4iHqNkMzK60ODrEf
 7d4fJd3QJKokuBZHRDlp0m/vqCpK5hX9m9BXYqBDD2MtQY5brwwWpcz7mmyGNY/zh9hvwfsibh
 rHbm+ZShFiPLSfPfDeJ4Xy2oZzW4AAAA=
X-Change-ID: 20260330-armada-37xx-usb3-phy-cleanup-922a5472794a
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Robert Marko <robert.marko@sartura.hr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stanley Chang <stanley_chang@realtek.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

There are two small patches in the series. The first helps to avoid
triggering a bug in the USB core code, whereas the second one is a 
small cleanup to align PHY definitions of the USB3 node with other
platforms.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      arm64: dts: marvell: armada-37xx: use 'usb2-phy' in USB3 controller's phy-names
      arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller node

 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 2ff6cc999a04bcb094b8cbba68a9251f03a5c876
change-id: 20260330-armada-37xx-usb3-phy-cleanup-922a5472794a

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

