Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368665;
	b=xJ8pdQNerxrirL+SJsOCUUHAzLv35Bes6+SXtEOvYdN3gi2at86b22qPwm5nT5gq/kzt
	 OqgDd1XH0DKaRVSatNsU0HMUFXIjCBgTO6wUC2TaLxC6IT49IvWv/v/1OsFqGNH4XJdWr
	 Es67oUxPcSV25XGPZO8ImMzc3B3TlDHpqgEGKAL6vzQVRE8O1NLByzsIq4mIQhpcHprrV
	 fi+6qZouxaf2vHAanc1pp0hCsJgNjgnyND7VQ9jZEKp7hVniDA/qY/o6n/ugqoBe3uE5e
	 IJaT1Onkz3xy5oyg68SOsZSqSl6ZpeAvgII2xwv9vpzGu4XdMhnpHifhLdOdaoAFQNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
	b=Q92EH3zCOYFW29Fi8H8Yt41MqQQXkeF+tAUX6IFDp4HptorBnAtBJKvbSlLiCt8HMmFY
	 zCGxYhWbAyUajy6Kj7eBoOZvmUGb6cBu0RU9GSfWamMIAZQObT8rJ/nfNmxvuOX9x1tOe
	 K99nfnU8lb/XDNzjoMdDcuU5G9QjiXAFpZLCyHiupQiFQmpL+YQV9qLZVfOB6ofYPDudL
	 xs7/AM6XnN83Gr2ve3hOIRVw9LjOcCYAvLyC34RLG7WDUiQ+aIb99BzSflXbw86vPm7SE
	 DgZVDMorHgaqk2waCHnGKyEeuVcsM/hoeMQOlUp1oVxoiUXKEQd9lFQGc4E5wY2BBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjSgRpm;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54416606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54416606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjSgRpm
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-714d57774d8so1759014eaf.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368663; x=1794973463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=lcjSgRpmHuggSjhLdMHCnVvH/bPQWR68Mb5S3pirIshxAAOFAwuzdPIoiY5Q2wL+Vw
         Yhug/XMF8ZDHULfO0FYBg/LLd9IWrLa6mRdEdGUkB/SFbtHo4kvjkBzjgrByaod8g8tk
         Dx5FsYsmhLSdCykojfTNjD2NEFALj2A4moqJFlH9hwJ/6WFbv9VFd0TOO9MT8p57cfzE
         O5Ndz5TSFcodXjsbtvIKSfi2Hh6Ss6+zpqwtcXuEdbtuO2XK8iYaNGq4xMUPXnFZbJPG
         MdqRETmoGSnW2R+vTmyW44vjbrCQOyxFD31eS7RDt3UB4iy71huiaM4AlzOcZ/3kRJj2
         2Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368663; x=1794973463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=zjT6S9hMIntsR7JQUGnKGdj9nVe1r1WqnJQdElIfVNHLg1PqGshkiGg7jeNnGHS7Bd
         A9MD/n2Bv/aFmPE+frXLnr4BcAkhrPQNA+7dcOuz3YzV3hoIlcVIt/QF58gWq6LA7reJ
         KB6NpqFKKGTBUK1ccEMKum4+24WWiiNja7JQ7iGJhixbAbNdUL0Se7/tSOt9+6SH63lK
         pBrTb5EQjJiEx/mQUW3QliEsAaUA8tUHa1PhRGonnF1Tiq6HElpEJLYARnc2pV5oPDMl
         X708Q/D+zFClNIXk4CdOrw7Odzu20KLEzjqU3Wm/o1iI5Fu6nfcrRz/J8iJsN1FhzSSW
         fDyw==
X-Forwarded-Encrypted: i=1; AL+hErGhoyEGja2kx07BVcasA2LIACbMNt22SLpFFodCMAovxQWAGEocKeqBQ0QYs0XHq4f22TbVfiwnTrx9@vger.kernel.org
X-Gm-Message-State: APuU4Z/8LK7Zrvpg7Y9XD3rELs4aTYxugoJWxiG7rbIYTIdfJG9GJMuo
	HS32LjxgaKh93Te8aPxw9r9U63/8mXMPJwicDQeKE9hEQilGdAcW9iza
X-Gm-Gg: AYBFou2rgHFi3F98ZzED4DzXjiQ3qkdLktlW2FQnJL5HM9kH/+6LLxBc9kz8Z1CNQzR
	nrRSRUuIpPwFUeS6vR6rQ9NXX4KC4dQX2syMcCZ8uYtA47Z/sq/oHFHRrKqLv2ZV0oNBCq381L8
	T1OLQy2121wKXlqEpanugHAGnLY+pjq4tOMUiI3/+dFghc8IeV2Vt2jZAxlyFXlcO0fqWa4eOSX
	FWw58Kb+rt49C7IMEuGQAHpUhZPPBes9PukzJwvL4kBoTk8ooBVUo8oq9kyUSswW3lpb34YJVoR
	Dgu/WGmceS5BQ+M+vmNO4sLe8fjUViHpF0oqCsC5j+jKvXgea+MQripoKQcGeMEG+CXZS0R7hON
	31w0GKWR0ZmwoW0gnsJEepRnt9YznHNyL5Y0kKMl1zeaSkS/Ugi7gmple+VlGhJNvrren9JXpSi
	mHyM1ueAUoBZlKtk6iukK9yiiacM4e76AS/Jwt2x7r2uO8VhIwxRbvDwHmR9c9gFqDgUF+Dn4Io
	F+i/BOdg0aepRUI2b3XtYZp6GmR1D1HQUbWPWRFIk1/kdfG26VvcUV6mRQPWF9h9SFkQQd4SQgU
	F2aEfbQ4MGsdtIKxpHgMS6l6ZjuH5e37SzF0cpO/8qkKZshoxZB76D2qFt5t8+KSzHT+9NByZAG
	1blFs2z0Vl9qyMq/SDcStejMhrGWqR8wLIcyxQ8MQel7C254CRtS/FXT6j2I7X6ZVw6UCY5Kbr5
	cVfA==
X-Received: by 2002:a05:6820:1ca4:b0:6f6:1e3a:6fc with SMTP id 006d021491bc7-7191795fda6mr882755eaf.79.1794368663202;
        Tue, 10 Nov 2026 19:44:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23031a4dsm2487525fac.14.2026.11.10.19.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:44:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
Date: Tue, 10 Nov 2026 19:44:18 -0800
Message-ID: <20261111034418.194610-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ath10k PCI devices can be described as children of their PCI host
bridge, for example to supply the MAC address and calibration data
through nvmem cells. The only compatible for that was "qcom,ath10k",
but the generic PCI device schema requires a node under a PCI bus to
carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
validation.

Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
ath9k and ath11k PCI bindings already do.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 0cb065265df4..992926ce5c5e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -15,6 +15,15 @@ description:
 properties:
   compatible:
     enum:
+      - pci0777,11ac  # QCA988X (Ubiquiti branded)
+      - pci168c,003c  # QCA988X
+      - pci168c,003e  # QCA6174
+      - pci168c,0040  # QCA99X0
+      - pci168c,0041  # QCA6164
+      - pci168c,0042  # QCA9377
+      - pci168c,0046  # QCA9984
+      - pci168c,0050  # QCA9887
+      - pci168c,0056  # QCA9888
       - qcom,ath10k # SDIO-based devices
       - qcom,ipq4019-wifi
       - qcom,wcn3990-wifi # SNoC-based devices
-- 
2.56.0

