Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D435F163
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513184; cv=none; b=aMQmiwg7ycgxA3ZKKs7jav8+g4xhl2VPJrtrxOt3u+AJxuHe52NLUJIUW1/KsGeJC/7tOk8yTxOk0IU4MwW9fcPb0JlQs50tU9jL4Okju5Hh8Sa2HcZq3KZoO71FOY4kcYA6hEEKHS20T9ssoi82tJtKMqb28G1+zW41dQ+2J/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513184; c=relaxed/simple;
	bh=kBZKR+bWkQM8x6oXrYtc0d5ZcgZu9b5HKN7QZBTO9fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHQdriWjWuK0Snxqkt9sLPKle04b8l+nilLhBM33tkhNQ10BMntzVOolgxu3i2Hrye6FvRRseI3ofAnFhkAlxgnqUGQEV7grxEgSvnoqHfb2TP9eLQZbkG8VFptDs6fbzaBZGV77u16eWOcToU0hNpUI9VvU7D6lShj3XaidQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvk0JB8/; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvk0JB8/"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506a7bbe9d0so37244251cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 15:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513182; x=1776117982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=bvk0JB8/9+VznreTV/NGCxcQ4jgz/+sVDXTHS1yyY0W8OBdQYaOEy/hlNMuoL0qHK5
         sCcUmHLawzC7yM5MFUvum9hAIAGPGGeinOiPa54ZjGVujzg/g+PfMpV5NigUlYYzdO6w
         jGeglzYqgvX3iszT018lsqIAbmemygIoGb6t2TDSiX186vyGzE6gAgmu7Nle5MD7H68B
         67BP/8kw6ti2DyqAMj3SNgCT177Kh4WExdw5CYb35CatI0lyVsjN9M+3PhFEpAga0jvQ
         FEPGYhUnp0Qhpx1+Xyj6+JPX+1pWoKXuXvkn30/GoKYTUBrapbhqEOgDVdBA2YEAbWgf
         ruUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513182; x=1776117982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=h378YPogQjWSbQECWhU3B71mEiGKZLpTYxq+lbk/oJlZzR04rQExH/QTRbjY0s/US4
         BbqDEleDBOxNX0ASmN2TvOTzveVAoxF0iyUOSm1Fndz8DDmj1fuOBc+jH/0a7Q9PlgW9
         Wl+pBEJMSr8tDHGj/I4O7V89b3aNjRnCRD1G3jsNqnk9AriPA1SRRXJD6OTtcqy4HvxT
         xlGIp3Qf/ExqwA6LY+3VPmN7HgxAXtBYBjfkxL3gFMJJmBmMoMJP61QB0ZV1YTUfYNm9
         YDEkx0rqufcItEZF3WbPhBvQDEgX5n1JAdIkiFMpEk8keL8BlX8voAoHDcxoqlrHE+l/
         blyA==
X-Gm-Message-State: AOJu0Yw2+daTb5PId36JcJ9uRfyO3e8ktAW5jk+XF9yEjrVG2xwA6I6i
	jddrSLmWLvCw5Nm3HHlS0sbdalyL7ZNOAui+lChOxzL1OF54Wx8AYlRrwH7x+A==
X-Gm-Gg: AeBDiesRTVEXU/H1+Y8+arG21zRU2rFe1i0Co+e7nDAoxxopaQQFwSIzP60OkZk30gK
	CmjBXXFshmnAKqBEjx8lj6/VD7KqhLa2gUmqkX/lIzuIDGNSsJtLFI8a4UFAD1/h7k6WEyyGl4B
	OkdZCyMWCt41OnWnUcaFkPEKmowCl8Y7QBOPM3zBlarIHTvFWRYqH0A5/UosYyLlRgPESEH6nFG
	NIcAmaHz7W9UTvyWW8X0T9aPc1ycddqvCXeRd93ig/JP4qXeAv0SaPzKlLVXEqBNP4QilLT1Kgh
	omORiSESX0QOOYZSeYjky5zzHxD22p/h4tjTPjl5u3MAYh9k/Y1O1F5947svkEEvH4D6wjGjpqj
	zq3yZJZdvO36URGJALhyi1qsWr8em1uCswdmAl7vcWNYprEOTXJgf551PeJO38DEvR8aJMkUHae
	YCSQPQ5gOYK7BEsx70RcZ3AIuDcjNBUCA5fy66XYz/Tt/kJ1nR0vvAiH7ZVHLpFnexZg==
X-Received: by 2002:a05:622a:544f:b0:50b:29f0:299c with SMTP id d75a77b69052e-50d62b53f30mr220835751cf.60.1775513182026;
        Mon, 06 Apr 2026 15:06:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ab9acde896sm19775156d6.8.2026.04.06.15.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:06:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA6500v2: fix USB3
Date: Mon,  6 Apr 2026 15:06:03 -0700
Message-ID: <20260406220603.101494-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
to do so.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index 0454423fe166..ad246f9a734a 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -43,3 +43,7 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
-- 
2.53.0

