Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A858936C9C0
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974686; cv=none; b=s3AZbbO4TpQw3zxk/51AtNQwaye3PGxd79wwI2s52lHHV2S7/kRigvIotfkhbyTqaXpUhFLneczk4DeQdosW+umgVNDP67U81Eh/Ofx3GxrbjhrXVgyXphDhcoB0jLcaaKEwc8IAah166glkTvavo+LVrH6X9Ufbhe8Qr5D6B1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974686; c=relaxed/simple;
	bh=qiuNFtPb98vApClnnULP391sos7PBqMq9JUM+pb/ZP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZ4FwtVKljtofPaVHwLgrO6U2CRd1xEPqO+n/ofSBMBWAMllxl0VowjIEWl19jsx2WxXA+8emJu2Wk9HZCBrDP6LiYeCOqEIBaBci7qUKfLqMPcHMQleZhNSuFTJaBu9PXIlFZyQ1MfG4ymf7ov6/swQQLswhateawxfVB0aM30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7XQa5br; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7XQa5br"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so839574f8f.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974683; x=1789579483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stbPp1ceHQZuJlggdwVYd7G7L2eRqpT5oTNWM81y/zo=;
        b=d7XQa5brybrSRRE9jrock7WmaTMsJfCPSKKIZIg8RQzQwqubJF0JcGYwsrCqE1psTx
         5dXTupBPfZuwJFoo7qBsPjEIm4nPCf/gA7wydJ8hfz1ZhsA4WFv4r9DJnwlvk71QKxT0
         57d5b9Abw9WAxPvlOb4yOHUfQtNy/2HIjC0t+FIwlD74iisFXvSgXdFldNbbe4i+leDo
         a0xCdZhclL/r4INSsQQwso8qAC7jagR9oRaAX1XPuxBKbIF0WW3xTMbteYgvkNwpHlIj
         Mn+rqlw11zRa+PVO4yQQRVmI/RxETJ23qnS29YJPy2hw79RgQO2fQqwrhW+HAAKDMMBa
         gwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974683; x=1789579483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stbPp1ceHQZuJlggdwVYd7G7L2eRqpT5oTNWM81y/zo=;
        b=sLbsiJE5afK7qFogyf1L7hnNwV5+iPZaCVbu/OOO28db5kDjvWFH+87MqMqmRcEQko
         xdYjjG7JP7kpYVuMv7G1BsXIV0nEKXHngYBt0Z858RGerapChNlll57/KA9ozTQTo9ef
         cWWVSiIhntC/HovaWQgitxX/cJ/jVv4SSTOLO+AVqVy91Kq50k/XwvwpDbbqTYX7E6En
         HIDTShWNxE5kg674fxeBelceSgQBRm5MuH4WNrc4BdNhlnxRGgUCsP6hIQfLMOpMiU+y
         +0vPMS9DYDhTV542anM51oS5NCuXAzMrlpL/uJZpuAdelLLVF+1coGC1oMouNS49pdQM
         OVIg==
X-Forwarded-Encrypted: i=1; AKwUvByrb0gW+neIw/cOTBQE549w+6pB6ltoGf369RsH7JCiLjEtBc4NhstJVyCyuqshfxydttCjYI83ru+S@vger.kernel.org
X-Gm-Message-State: AFuF++npRooIk+13mQTkwEvO20mfqXfisFoELNFOU3USCLpN4cwMkX+o
	hdanxQV0bsCxq5+unZcvqoIO+Ywww8RqvNqdWDcLevhO2AwyeCq6QQ09
X-Gm-Gg: AYBFou0OgmAXx/ONFSA2qyo/wJsHe2P2wpkY+2/JU0CShV9qZH9eJtj1F+wzphtLncM
	vxLfcjA9pQhyVl2ZRQk3NLh0i1b3zdyNi6MqlSfVHfcqpoUzbAKJdbOhvBKCzPBqJqH1ovUJUz/
	71P250UJKxgmY2cvep0AMzRwsptQqQLTj9dZRkFQTzEaYnumO9WH2i2nXbAwDtOZvYeNLGrJdXI
	WUIBwjgqna6DB9BL/6btV/7SypQQYm/djLarN226Dydrm7R8zw3/2ZizV5toPdt8liLRmvzeHwy
	wm80kHjaeJUJTlZFlPz2fRWuF9Z7FqzgHShv7FAdPEjNFFPS0pU0MQxGam65T4hpqaSp0iF8cyI
	3+sYPGxUH2SkGtabwGhfRZ8WinbeGv1rhdzneQ261kSIacowHT+JQHhcD0mShE1PcqkZALheooz
	hWb7r4b96z90Ft4IuBdLRKX2HbsCRosbwjzt/O2M46KB/aQd2o840uSRHwybeKQ482/dlH1kUYZ
	0lmiXXRYTjiQ30GQXcZgJe8a7ZlTKCSY6ETSav3Na7KG25szi4eWD8Du4qzhwewaMgv
X-Received: by 2002:a05:6000:38f:b0:482:f0ee:1390 with SMTP id ffacd0b85a97d-485aaddef92mr16646815f8f.22.1788974682633;
        Wed, 09 Sep 2026 10:24:42 -0700 (PDT)
Received: from archlinux.ht.home (89-74-4-99.dynamic.play.pl. [89.74.4.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm30311792f8f.0.2026.09.09.10.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:24:42 -0700 (PDT)
From: Jan Paszkowski <jan.m.paszkowski@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: marijn.suijten@somainline.org,
	Jan Paszkowski <jan.m.paszkowski@gmail.com>
Subject: [PATCH 0/1] arm64: dts: qcom: sm8350-sagami: UFS
Date: Wed,  9 Sep 2026 19:13:11 +0200
Message-ID: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is about turning on the UFS for the sony xperia sagami
platform.

The patch is small, but due to the grave risk of the patch combined with
my inexperience I wanted to write this cover letter.

While digging through the reasons for the UFS bug in sony devices, I
stumbled upon a downstream workaround in the initial commit for
sm8250-sony-xperia devices [1]. The workaround did not mention the
sagami platform. Looking through android patches for UFS for the sony
sagami copyleft kernel, they seemed to be minor compared to previous
generations[2].

With that I got a spare pdx215 to try this on. I compiled a kernel with
postmarketOS tools. Normal flashing of pmOS on a single partition seemed
to not work, though the UFS device was visible when booting on the sd
card. That said both split flashing of pmOS onto two partitions and
formating partitions worked, at least for super and userdata with ext4.
The booted device detected the partitions and even worked without the sd
card. With that I wanted to send it to the mailing lists in case the bug
is gone this generation.

I guess that most likely I am missing something. If so please respond to
this series. I am happy to test  further to make sure it won't brick
anybody's device.

[1] https://github.com/kholk/kernel/commit/2e7a9ee1c91a016baa0b826a7752ec45663a0561
[2] https://github.com/sonyxperiadev/kernel-copyleft/tree/61.0.A.11.xxx


Jan Paszkowski (1):
  arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS

 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
2.55.0

