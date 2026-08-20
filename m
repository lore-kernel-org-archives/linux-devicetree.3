Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E912B94
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236354; cv=none; b=cRqy448u0Tw1WWtAr/b01qm3tFSgieygYZCnGwwGY2S7NlomDIB2/C/r5i4ZJ+JtXo5e1ETOnAUhluQVz00w05w9vJxaT5HEz8f0+6WGVrlJM1KQo+ozdBQ6Jq3eOsvQHgM4qpUM/9aE0EkcPdr1+YJHMPkTbCTNIAzDOOZG4Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236354; c=relaxed/simple;
	bh=a5RakhIEYhfE5aUZzebBLZ1wAm/eAbhVK1uouFMH8eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IUKbUt4fHkZTKQofqiJGxDzh/ucAypeIsvpsYeF9rUdp3BHmn02JhmYj4pTKCjccePqbNtGDrNlh6PS6LbqXt87nS2g7t65gB3jfa7FDPSjkWWWJqW/bInewzu2V7netvqdAMiI9qzwOTUCzS/RbujLzo+/ofKUZXW1sNAu8i6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IE5Soujw; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IE5Soujw"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso1767130e0c.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787236352; x=1787841152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T85RHS8VejstyEgBz1/jasjfhA3Et8B7A5u7SqIabRM=;
        b=IE5Soujwbit64cJH/D5E1UTwfDu4hmr4bT9iuGr+HbIYHtxVcdH+x4WMFNzFVS0kDA
         JokQGCtc8h6cS1rJ1ASXfyBGLxKUmD3VlIIv2fHCq68s42OHT8ZFYxD3X50/9lxLAV8t
         5VpO8DXkQkDxgD3cqHJJ4khwFMFynaWQfwyJ1q2GA8iWMIRIQuJdme3mow/0vsCFGH6/
         sBd7GG9K1fI1pq2cqhAj11lBr+/l7JQM/x+FQlMXU6QjMmF5WDT8JpEOT+zE3L1bW8IG
         +cBIJBAxSFAyycQfxLM8fnLZnOT9zEJJo+mUBwZAW3qbJ+G4kTdAiRRIbP4Jpc2+Dw1E
         i0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236352; x=1787841152;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T85RHS8VejstyEgBz1/jasjfhA3Et8B7A5u7SqIabRM=;
        b=CAjY6EWid6SaojudjOaPC8iAU6mK0lFQdHQFDHLiLJz3+ICLjQtTJLmsElT9j3sh51
         eVJsSPk5RsXe0Ln9bDENrI/X5VoMSzxM1iY3dfm+s2kglxCthTN8NaB2GUMiI4vSpOZz
         P1/Z4QHCMvqvCsd3Xj0kR1Xo5B8GyvBeaionP1u2OjCdCQJnLHziHFUpnK4do9loQSWy
         25bgEMdsPlKSFalPYoYY64xkICoUi3VNu486I+WvFnCC4wsc8hpvNyvtlyjLrAlHAeNP
         7OL+5EnPWcA18UgpK5c4NB5549Li5sOKQkjqLryjqgAlD9gmQ/on+zT7OuEfgKG53kgX
         SVSA==
X-Forwarded-Encrypted: i=1; AHgh+RpOXCNzpPHDf6k65hrVF65N7rUTPJGZ3HMq+FOe9xunK6dXRXJPQdU8smtz7xi3Cnx+BBW4pudbR5rX@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKdckMzCMHB26UpOppw76ZbInxXlwyyMiyxTR9OmPYUQFHVEk
	SOWVi4q2cdILmozSpY92DcHwm7GjKzHhr1QRRJBxfzpN2wZYKq5MxzI=
X-Gm-Gg: AR+sD12beA/m5gVaghSE6uYYMt8pnaOaHLUwvzRkusZObLdSOqmi+hVr5iTt5znj8RF
	xN6VHgDnmngToPjN/TUBAtdN2XkuDthox1PxQrg3QplwZQdfu/ko1BOn0NRnrjddW1Dw5KJfpWb
	2grqWnkMOUKbjXOt/Hao8mVYVbTkqwpq7takq4nKDJkEOWu/obkBg1mrbQS058REzxRtWDdhNa6
	4eVvhyBU604QASfJYAXoHiDMHQyMs+ECLjXwFL9IuZ+cCY6cEEv3L6IvXCHzb/+3XWrVCghQv7p
	MOqP/sXUxAArHRLUvIyBMvymL2a98JR2J9jFqUn8GCZzBrYSc7WvPwuKo/Y1eKi6YPAGUovP8X2
	bTCCQRd8qGIV9NJZmfu6vvLrwB3XtbtBKd63v2b33Tr9Yw4Ioa8C7AnLi5NJB43FHwvBdKbZnef
	iD24pd/s9t9DPM8WLqszbNQqDrXgLQ0MYs8Wi2bhmU0WBeA6s+ocM2w5LNhY0WDyA+kG/NQvnba
	/d/CeSqMt7gXcNUCRwdmAL2XZluXdrhimQM60yn
X-Received: by 2002:a05:6122:3a16:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5c5e3de4dcemr5807238e0c.2.1787236351791;
        Thu, 20 Aug 2026 07:32:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3459sm6393922e0c.4.2026.08.20.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:32:31 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
Date: Thu, 20 Aug 2026 11:31:09 -0300
Message-ID: <355f97d79939b0fee740f91e0d4a74b484639092.1786973355.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786973355.git.nico.antinori.7@gmail.com>
References: <cover.1786973355.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Aosong AM2315 and AM2320 are temperature and humidity sensors that do
not require configuration.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..92b757579eef 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -62,6 +62,8 @@ properties:
             # Aosong temperature & humidity sensors with I2C interface
           - aosong,aht10
           - aosong,aht20
+          - aosong,am2315
+          - aosong,am2320
           - aosong,dht20
             # Arduino microcontroller interface over SPI on UnoQ board
           - arduino,unoq-mcu
--
2.47.3

