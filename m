Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618566;
	b=mVLl3g1h+GgVBHbZGHiDuuVhoQ4Zt+39hryv9cxAPmDzrIKiJGZeRVOKicPjipDE6t6g
	 ZjJMqu9l0btNCSAtxpca8Opsx95rkYMREkDeB9SlcF0MH53C04Hj9riGKU0sjxOwJx4zX
	 3BnFxOzbSB6DcP6pDEWRMrLLuSdTBVhJegpngRa4l3Q8KcxgZ4A0HaoUMTvjraAAVp23t
	 kaHyGXZTdsS0R3X1epOGS/qhto95Wm2iHLipVzF6uB4RWamYuYGiDKh8PmX+diCv05MBu
	 5U6lXTZf2X071/LTPa7dahgIlNtrDMw8jddW18gV9ivpe67ZC5LLCk5MHQul91d0hgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
	b=ZRuLrdSmPOcGKmiQ1867N5CiPifNV1IS6T38PMhzvjKlNCMidB6emUwgJEbeIrX9uTKv
	 3y05DPt6cDp+fRqZ1fC326u5hW/GxWsJLE+ZOH29saE1pkZDnl8w2UyEKiWrPM9mSG4Q/
	 n9sCxJSt0HamW93gzovk0LMg71TLpUlEyF57Jk5R1rZA7qitX8vUn9aifdwAhJ62sHsan
	 7D8crgQdyGztxNSWlaE9mkz6mPlo3EJXO6pDgPm6FB4Rr7XK5ZXotNnfOJUUhrs+M+/s5
	 90FJc4w6WASvRLowU0i1JzJElHDy2sGkzefdBSvqS2w42Sf11jenZ/ibjqSMLV4dh1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DF1606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DF1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5477177f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618565; x=1796223365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=rP3+wvtvUd5BSIItbmrOs+fMb/0tNd75RRq96JkoqhT2eRlsZpvHYs58csYL9y6jC6
         23pnbPaWHTI7RwfuLJWrG+fVkrzK1tNpTfHSaYctf3Iqve72h8d4lReRmROahuOsvu/T
         suSTKS09GzA1gOQ1e4myNrKP+7403yLnbs/XIJmiFg5fGdEjknPDIozsIJEW30Rb2LZF
         B/LOHyMnSajEVKjqKUfTUHyaIWT5ZAKRHNAMaPDCzBshEJVslfraeBKopAJEhsswOIpH
         EuxLM3ZDnQHzClCqb6tZJBtxYNu6l433fvIlgFI9OWyHQo46c09tLu3U1mNY4OBKBG0C
         2jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618565; x=1796223365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=Ej6kmuetBPp3Y+elxwVaJRO7QvtjEth3DBXGE0CKwwL7wnEKF5xA4DyXhUMX+Z5uP0
         FMpdBi4QDsXxucb3M7hFLEZ6hmJMBRoTu38/c59s6Fw3f0eW3hqNJ/9dpfePDDe8eF7o
         qfC1JHOEb27makk42vmWNg6y7vpYxATbzpxv5ZKN7pE8JGpFB56zmxw5JVjJoF34AHgU
         3waC3iEmroa8KLNADtYNv/oTVO/oJ68zvdtZi5qhnRNNZsYpCP8hqWDMztjnS6/xaU7n
         PmXgzGBy2YhKNXLqVG+ky1KC24MhhBopNNiW92pqJnhxop5Mr+o1Bwa8JMVxz8HEJ2dk
         vG1A==
X-Forwarded-Encrypted: i=1; AL+hErFqEc+v6NQAMjESQPSLE+NZIhlQtEM+ZPlxrxH5Kk1gFJRebMLBJAJY/TEo/+R6c+3L9w7+qqL0Sfwv@vger.kernel.org
X-Gm-Message-State: APuU4Z+FawhcOFUmKiKPXNXyiPVcgZADU5xmgITUkG5YMFc55tYi5+QY
	knlzLw4ewolt9w49fXxrQSOfEdGwkJpAf9I3WiuwXZU/V7Vu3hh+/CHs
X-Gm-Gg: AZFdTZejruFM9ClgWnzPsHRuqjDKytZgYLnB4JLD6JGa9yk5o9bi1PVxLW95dyAh2Qz
	unzHfbURv2LWnnFInZyNnGgFhtnn0xWoJHrK6DTDfhwaTR0NPP9AenrIfpD+c9tSIPCKYqqRxt8
	ZpCXqztfbBBYkAkzLEErtgcVJ7SxWOtOoBK8D2I40mP/vYsBFKmQL47bE0DbOmjBLoS1AzdGTDP
	j47iJBGzMMCfkkc+840zjBLDNNlkD1gqueStoa22OJbVG2u97USgepHQrSJSlwSiteo1eySbuCJ
	DpsYrD6gRqiPv1+y5BnxXPzFEAvEAJJ7YZU5+i6Q35Z0q2K6dV3xhypGup32zxPy5JyMyLH5p+d
	eSRGQP+fu/y1RtLK1ZDtPP6Q+trwZQ2cBCPxxjt577kHn3A6M3IWFyexIJNdhO5znBZPXo/wi1N
	Pz02XwYPQdZotphZKDJLsyKZNM3NI2za8PZuo6XvHUMDtgYo6Pj3l2KnMD4E1OgeVSZZyhFKf1a
	33FY9H43OGxg0dCo12qZvICndM+atElv/G8g5GqofWoH9ZGrpOQdmxjNXs5RahJGcFQsmEW2J78
	2azNtRRLx6J1cl7ot3qc0P8PEf+aXsR0XBnzpvapOMO5pS0OPvMLc0wPj9R37NfX18miultWfNB
	c6I6qoQQeL5Vhm77T9b+wR01HuOjwzKb0Jg==
X-Received: by 2002:a5d:5888:0:b0:4a9:4dfa:c151 with SMTP id ffacd0b85a97d-4abb683b6c2mr32518885f8f.26.1795618564618;
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:53 +0100
Message-ID: <20261125145458.2594179-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

Changes in v3:
 - Use an enum with the exynos990 entry to keep the exynos850-compatible
   entries together and keep code clean.

 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..25536859e5dd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -25,7 +25,9 @@ properties:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
       - items:
-          - const: samsung,exynos990-dwusb3
+          - enum:
+              - samsung,exynos7885-dwusb3
+              - samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
 
   '#address-cells':
-- 
2.56.1

