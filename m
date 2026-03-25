Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D4C234964
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774405466; cv=none; b=ZKXPWpdtAFXZOPSToKYvEiL55oQQ+yQ3DcECYDjeVzZI93YbE7wh3Ld1LX7Y7Zpt96PBO8tJHQhRDh1swIfdOSAaFeARSq0sSzgJkaiuIE+J1MknOmHLbumSCrpIVjODWERjcVu2LzOmTWIgXhEI6wiy1hh/n8GqU3ko8sRWBNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774405466; c=relaxed/simple;
	bh=T3wmcEio4nV98m1Ned6EMqO4QaNGiBBOKlkusXtBlaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mb+Cg5hCkXgCWVPPYWCGgLctOIp2reFGzmZNPM88c0xM01EF5t7wJma79CTDZ/p3lLnyPiVUimjPerQkF3FILWBMAlQmSsNJmZwPXRgO/aa+2rbHoORE4dIizCXhoyypVx98d0WETzY5IH1jF8OXEZtXENZM7EY7xm1KAFFzr58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWZV4EVP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWZV4EVP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aecc6b0861so35183285ad.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 19:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405465; x=1775010265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRt8TH5o+UOIPSqAYAlinmlE/GxmV+GvavMDzY+Mpr8=;
        b=RWZV4EVPsZ3ZfqRB0wC7oX8QJbOPPV1ckLLigYHOeVoCpQHHFphIWuUXtKoh9QNxF2
         ehczUpiz2fMccBos9P0FBkF+hA01ky9I5txNn0ss7qvyBVHI3Z7bQtyQeLZfHOmFuREM
         N/hVkHzUyj4+I2e2nFTUosFnNUmi8g7QvAzHfkuhSrcEgUzzQnKhEX7M7r2rCv6sG2ts
         B5gt/ZICJlGmfaFTFGkRq/8euLwX39B+9Gd0sYGEHkGWIkp3Nsof09ZCHhRRWZ7Sxu8P
         4OQpyxVw1DgY9f0Q7E0owAy7UFLpwmglpPBRSTY8X64/+Rl4ZW6asLbvcFukaXSxMXFV
         7/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405465; x=1775010265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eRt8TH5o+UOIPSqAYAlinmlE/GxmV+GvavMDzY+Mpr8=;
        b=D0vwEdwKRXkSRdQCJ4AKe6AGEmoaExWhvsrqdiTXTm5LgwyJmd8PntZz3Vc9kk8Ji0
         FWaHe39TZLXboYEmNB3goTX+KbA39iGFLNxZhEpVeoQNRLoD6FH5zASp//HrsgQ7pups
         Yr0AxCbICQdS2+H5nx3VuS0LDmHEozV0MtU/ERf8RGn8pvi4AQV7jR4nEIZPY13weLTZ
         04YeYpvpNtusXS4TOmh3i7FSgBkmkKAr9H7dKXFXB+zWauJisiZKuV3AcScUZGlddtdU
         FxW6vbh6bPXXIvazGCkyRcjCxU/F7EL+BkHZlu4GQGv6FQ6TicS2/36eYhcoQT7j2Pme
         m7dw==
X-Forwarded-Encrypted: i=1; AJvYcCWBHSCbUC+yvaILIb73WQc4/u1mHVOS/oWe/8UvA+0sa11xFpICPu4WFbvt5kByHi8emMhToGh5oIwg@vger.kernel.org
X-Gm-Message-State: AOJu0YxX9qwTGy/AvFYtPyx8BOAe30DY9rUCRbI8XdoMAbJ2xsKU8u9A
	KaEZuoBjHWt7Q3b35Idsu1EbXezondBE0W801h0y/buutSbMDO9kHIof
X-Gm-Gg: ATEYQzzsZglnsUluBL42mVlmHnQNc1mtTgRmN9PKlFmyWBTtjXJCVLUW0X9mfXCC1FD
	yUHL7B4+dmLwogY/CewaMV/z97WfxWsTMg8MMqPVRtw2QQ4xX9Vy8opF65RuDt64njuJh+MnajF
	urIEYB5X28xQ3zVNsHV2JJiLjbt+qELvuXvl151oJ+qpNJoaga68plJrWLgE4L/+6EkTCdJXrI1
	B7UFM/7aIhs6ZRf9UUB4eqhN/aSTTp9ThcIrk/M4x+PV2LFccfruZQr7G0qEKVid4CvDUUTJgcT
	ZCAc14lDwQoSj/LgVvIqPrj9fVZaxzEjjI6AUrl4A/6Q49+8LWaJeteqJoV0b2CRDtLLPCZSCRn
	T5aKxvya4+ITqxLlvKhF+ZHC0YWwUw8iKk/kZHGBZyVcOpH6YVEfWqZj2s9bxPwL6bRTMZHKuZ7
	Ky/aoedw5OK9Tp7PenJOeLPmk7DvnRmq/LZlzhGvMvCsHCcSZSl0JHnapWaOjByzY=
X-Received: by 2002:a17:903:230c:b0:2b0:b41e:c5c3 with SMTP id d9443c01a7336-2b0b41ed524mr6509125ad.29.1774405464543;
        Tue, 24 Mar 2026 19:24:24 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm170348635ad.23.2026.03.24.19.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:24:24 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 25 Mar 2026 10:24:21 +0800
Subject: [PATCH v5 2/3] iio: adc: ltc2309: explicitly assign hex values to
 channel enums
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add_ltc2305_driver-v5-2-e0d29daa54f9@gmail.com>
References: <20260325-add_ltc2305_driver-v5-0-e0d29daa54f9@gmail.com>
In-Reply-To: <20260325-add_ltc2305_driver-v5-0-e0d29daa54f9@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Beguin <liambeguin@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=T3wmcEio4nV98m1Ned6EMqO4QaNGiBBOKlkusXtBlaE=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpw0dfhUjCRx49ekcHNiYWpM7+PkhgJT0qLQj51
 oMivaSlCKSJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCacNHXwAKCRClg0K3CVbE
 gaTKB/9SLADHIgra6NriznrRkqlVJfP2AleyIpDVzZnbnLTtXAXjREbrG7s9ZSR3xHh6vXm9V+u
 EBL+cmbnGBRbZufdB55zJ13UqQDVtJRJWrGWz7mBCQq6nz+M5PD2j59/4lvsaNluTo+VvuljMks
 fKO4hsKcuE+xPcZBQshVu31mdTtdA9v+Coy6QJkylZk6DOpkuURalLVrIkPbi7AgZemXmidd0dJ
 R+N2Cos8/d1uxsyjFctyvDyh0D1tNaUXV+6qfQJTEqHD+MvKPpBdQ0QBZOfY1xfiuEmDJpzfWOZ
 LEbS1Y4jTcQrIiRf9WR1GnbTabP8AZS07eLYzuHvNx8IiJI+
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

The current ltc2309_channels enum relies on implicit sequential
assignment. While this works for the 8-channel LTC2309, it is
not intuitive and makes it difficult to support other chips in
the same family that might have different bit mappings.

Explicitly assign hex values to the enum members based on the
channel selection bits defined in the datasheet. This improves
code readability and provides a consistent pattern for future
chip support.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 drivers/iio/adc/ltc2309.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ltc2309.c b/drivers/iio/adc/ltc2309.c
index 5f0d947d0615..3f27ffc66668 100644
--- a/drivers/iio/adc/ltc2309.c
+++ b/drivers/iio/adc/ltc2309.c
@@ -42,22 +42,22 @@ struct ltc2309 {
 
 /* Order matches expected channel address, See datasheet Table 1. */
 enum ltc2309_channels {
-	LTC2309_CH0_CH1 = 0,
-	LTC2309_CH2_CH3,
-	LTC2309_CH4_CH5,
-	LTC2309_CH6_CH7,
-	LTC2309_CH1_CH0,
-	LTC2309_CH3_CH2,
-	LTC2309_CH5_CH4,
-	LTC2309_CH7_CH6,
-	LTC2309_CH0,
-	LTC2309_CH2,
-	LTC2309_CH4,
-	LTC2309_CH6,
-	LTC2309_CH1,
-	LTC2309_CH3,
-	LTC2309_CH5,
-	LTC2309_CH7,
+	LTC2309_CH0_CH1 = 0x0,
+	LTC2309_CH2_CH3 = 0x1,
+	LTC2309_CH4_CH5 = 0x2,
+	LTC2309_CH6_CH7 = 0x3,
+	LTC2309_CH1_CH0 = 0x4,
+	LTC2309_CH3_CH2 = 0x5,
+	LTC2309_CH5_CH4 = 0x6,
+	LTC2309_CH7_CH6 = 0x7,
+	LTC2309_CH0     = 0x8,
+	LTC2309_CH2     = 0x9,
+	LTC2309_CH4     = 0xa,
+	LTC2309_CH6     = 0xb,
+	LTC2309_CH1     = 0xc,
+	LTC2309_CH3     = 0xd,
+	LTC2309_CH5     = 0xe,
+	LTC2309_CH7     = 0xf,
 };
 
 #define LTC2309_CHAN(_chan, _addr) {				\

-- 
2.34.1

