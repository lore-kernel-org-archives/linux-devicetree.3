Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00353845B7
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267903; cv=none; b=pCwhldFga18iLas1fI2GZWxk7I2bx8s84+ETNmq7cee6ccJyCMNE+PAyAbsOBD3/IF0/2jGAYaoB+y+ECPy+tEaC3FwplLVJrrtCqjc4HR1CMINM6Jy/ailucgfxlGfoAYWPQhznbatAEZTdYvHhiFXi6akhze2+3G0j0p4sDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267903; c=relaxed/simple;
	bh=2LtYHeta5/Q9EvymN62gVMZCQz+7wtkWlLVE2E7UFUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bEviLIsAPzN5C/R3yZSWvLMjHyBdqT1gIfNzZDwrWuPGf1RcvOd3eZnYgPcOm13MeYYUzW+sOh9+grd/4Bi1lZULibHpyqexlz1Ae1UteMujA1Lg/Rpi1fdAW7nDanQxYxc0lWnQQbt6LcIaBYhky7b1lMbdR3cJMmw3KpbDD6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gK0joD5U; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gK0joD5U"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6aca105971eso182921eaf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785267898; x=1785872698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+qnxHjfq6t9kvIEcBFY4jjWRY7rxCRA39LvB5vINPkY=;
        b=gK0joD5UtdJW31L8M9YrnPCfLEr9oRkwZOXkIfCSCdy1GZsmP2kNRSo15KzL9Yeh3L
         AXQfNbbQAW82uBYq9hi0YuPwz+tXXAItMzbd1kDVVF6yJpEgu92bzNdkK8Ncv3mnZjeT
         c3Jrt/+LRTf+m11HNMFJhcqMMm67g2vb53428aH6ilAMorRNi5GZhpiobV8sbgTXXJE0
         XsaGwNfF71pZGh07LHK+Hhdh8BXgU1piLFC0Lxz6/9pFA81pWnki6/tHcgCBEXlOR+eh
         FuuK6e6gNLTa/aQqghaHwFKswtk06g/X2sAUrsDHuT/z/4dqxMmnkCKV4XASn+V0AYGM
         ZCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267898; x=1785872698;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+qnxHjfq6t9kvIEcBFY4jjWRY7rxCRA39LvB5vINPkY=;
        b=BUARgazbG8maawAMELT551M3LsRM7X4aHKqJ2BgR6U/khOnt0ekPyZVUyan6YeN50B
         JwfrqaUujL1dO01Rq2F+ZwnGYFhia9/BNbT4xHdQDC+fX3f0D8usCqGUfzlVxsnVV+xQ
         RMzHrvR3AmpNYZoCl5QNN2wE3OyPxvYpwv9QVyFDSbc5hjGHnTTf4vGw7Gwk9AOEiYUA
         HGpenIU0IK9p80oackdOiv9GgMhH8c+Uarn0KqF7d7oNCVquuwpy9+SEHAFR7q350Pay
         FZqSRSCkv9aPZVz5HiTmU4ICAS4+QqHoPOjIoc9ZkzYCtu+Kzyx1qoVGeA8JB9JwV36G
         1VsQ==
X-Forwarded-Encrypted: i=1; AHgh+RreIqV1bEfTMrwnEuyFtds4HAw1Zg3vOvuwXHuOSa7v0xWTiULf+BWl5yc8u8cNB6WxZlfoJ+jFlk6t@vger.kernel.org
X-Gm-Message-State: AOJu0YzgKHnAVwQXOHh53+PeIBV7vSDgLcDHJrjMyZM+Lc1Sk8T8WPsr
	+kv6yr6sY7pAkEzZgV3muUQjdLnDNwTDwwcyWwXjXxpaMMkt/l7xmd1gze+uu6ggb0E=
X-Gm-Gg: AR+sD110rut6AdSueHa9AS1yBlgXH2gcjZqhuG+AopMlXIVwzz6e0g9HV2v4il/tkAS
	aqnjPCmtX4/dwvpzSgdxXXEBz706wNv09xtt+fQ4TWEw6OnUnUbKown+x+S/Bke7/snpW3Cgbd7
	onlKmcdXEzhABjkIl3GB6/JWj7Uufy3Mj/Xor9Mtv+jFFKdIJ5RRVH8qTCWj/QYa4YPGxUOnHBx
	d+r+OillEWSlnQSOSHDmPk2W4IuytSlPCD9zBGC1wMIqJMqY0d0tJ990QfKl+WR11EP9NPqP7te
	uNR53W1JqJ3O41nEu1qE7LVi4aBy2z7Hu9ubjt95zL6dgXVk3viuzbykJus0rtcfEDWr1CVFYP3
	4deubtYoD7gV3qlxCEsY1TEMwdb4CL+jqXp3Y4ltTytC0AJkQ8MpRTikgU41tznFKiSFN66WNlp
	mrFAC3XrA=
X-Received: by 2002:a05:6820:2087:b0:6a1:7790:258e with SMTP id 006d021491bc7-6ac96a456fbmr1548148eaf.18.1785267898559;
        Tue, 28 Jul 2026 12:44:58 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:3026:75d1:db9d:8984])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca5254057sm290017eaf.4.2026.07.28.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:44:58 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO improvements
Date: Tue, 28 Jul 2026 14:44:35 -0500
Message-Id: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTsJVhH0KsRFSz91jLakg0ZDu
 LtVl2/zFlJkgdKpWijjKSopFmw3FQ0XGwNYfDGZ2hzq1nRs8539rOxgww1vKxwmSSxxTNwed/C
 d2/umAZVhyhjl9dv789/6cFcM87ekdf0AHxGSq38AAAA=
X-Change-ID: 20260728-arm-dts-beagleyai-gpio-info-793ed8b4d55e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=2LtYHeta5/Q9EvymN62gVMZCQz+7wtkWlLVE2E7UFUY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqaQal18LUWMhjrqnpK0pfzz0Z1H2msfl19+NAD
 vym5EAFqM2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCamkGpQAKCRDCzCAB/wGP
 wEQuB/982hhpMKtY3Wt5Gmb0F7J3rsfasP1hDdkuvTgLrFCrACZulXjq5uGUDotjNr/8dYyY5fd
 zZ+fK1UDXDvwyX1IOWDvMab54WQ/+QXnf9iLQ/gI6Vwr7BbmN68kXhhowqP9k3Nfbx27WUvUW/d
 Y8pyIC9XZN1zDSroCMc08hyuG98ITIql2ano4UxLZ7MwvC44K6FUHkdief2Okre2RjCoMuI4CRx
 lnb4fqCLomo8vRfQZMU2lDAda9xsoaP86YSe7OYVbTJXxK+HqC8HDgfqSUoQCywpNaujc/T/cXA
 HPwQZFbPYHcnmJINlkN4mZDtBlfW50cnXH8xYU0q4TmVPQ2x
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

This is picking up a few downstream changes from [1] to make GPIOs
easier to use that I missed when using the BeagleY-AI with a mainline
kernel.

[1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=heads

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
David Lechner (TI) (2):
      arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
      arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names

 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260728-arm-dts-beagleyai-gpio-info-793ed8b4d55e

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

