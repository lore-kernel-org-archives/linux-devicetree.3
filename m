Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7B1A682E
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011806; cv=none; b=VR1dLt2PJPr1fHSjQFGiCZplHysW+XZNW3qokvPgJ/P9f8wZq1t2LYKOV9zgjWpbhEy8bTVQgyqNnxTlgELNTJck6RzGig7PLjjpG8JUoy0aSXXnVFW7sAEcsl9Wv2Al1wnuCb2SbCiY9ZB/R0drAm6/c/g1TAZQ4ZxzjV5UXug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011806; c=relaxed/simple;
	bh=eWyFo6wtcwjcGn72c1H93Yp+EkyaoRZ7SE6IqiBOBuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6OqC0zm4xTgeOWKAuF5p8CP0zlvkEDOT6p38r77b6XgLWCOKaLoKU5BVrCjvZoYTvECA3ZBQq4Gp+F8JEHW+F/2XSPyS0kcYkEBigUZKLjkAOqHzpnxRSF+C+T5YlU9ZRFODAl4BG1HTRrrMDlDv42uqBUyqXWgoDZdf1Ac+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=WcpssJ3f; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="WcpssJ3f"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso43621585e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011803; x=1778616603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gbkbiFxStV52q4s9W7vmjcqc2PkrySXx7kVEFbo+QI=;
        b=WcpssJ3fgoiR+TRas4ayEdM9jj8EIc8fGEQzHxmgrwXrf/pouShPx4w2QTUOfrgAXz
         WPG3loo95JUIlJweAfuSbIAy/ETKvkjwFhoaPRZ9NHGFt4logj2KfjyyScZA1UPmyRh5
         NtTbqvUVZ+hT/9cv0/KJrA/35daRJHTNkhxDcfT7fgRFhtzGlTRIKyBSqUeKGKz9xRsk
         2WDvaLAJI5zOKNBOSLrW0ZkwVeMOFQrzY3EWyJfC9x6SlXlAEV6MDlodDz/YZOVNCDwQ
         5E6u51cooJblVOXUMNuIg2gY45SsPvPtIixNxC0QKa5IQc8rBQuGCoaTBRe9dt6MqLDT
         6/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011803; x=1778616603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gbkbiFxStV52q4s9W7vmjcqc2PkrySXx7kVEFbo+QI=;
        b=dXGDSrzfvMnFWgAhjhuKyCm1sj/G/AxdF6lZejMpZ2CgLnYOKGE2Ki/ak9aHe+korQ
         LqLeaYe4zNarg2ZowdidTmEHHjiGeoe0fFHS56NBtMEPu06xrKfQAVFbRCUSJyN+LipZ
         Lc+oZ1tCuR8kxLmzvaRnx+OJNdTMdbz29yqaTuwfIETRh+lwrTA32jnpDleteii2ieFd
         XQqMDo9442hYkCzmXG7Kb1un3QPDBieo7gu1YoLxkgSVqJAil1DiDaHsd9QYb4qgGT1n
         S4PoHmfD7VUhv7hoqmpDiU6/UNJWf70nEx1oeC3+Y5MpFIOvaZzQVMLIbLql9N5HdVZP
         vHJg==
X-Gm-Message-State: AOJu0YzCk98o+A6m7o0ALAivVSxhHnn2CvtAILDY47/qx/xYncff8BLt
	vIwiSZYH8z9lgPwlwzgBYOu1p/JwSF9u0VyLpmU6sRM9AkYApyHtZd3jIO3KyOo+t42J3Aat7AT
	QhflQC9c=
X-Gm-Gg: AeBDievXrirvDanjrMSJk0DsAy7wIBy14pEdi3YIkqR+jhihlQxsnKxCCYbcwYCtGiV
	IPP3BCE5zIuoq7YvktWmflnCAx08Y8MwUbmL1qoe1lF9i04YXh8KJoVGfjyvlnzPvcjzJcLhevM
	BKmcvElvNQsz4ziaD6pw+SzTgxvRomh8pu9tNFKm6HMcTCjYSHGsDnpYT06o4e8uSNv0HKlADJG
	osLrez81iQEetS8VihgkgRcN7Jg3RFmei7wOYhqjgz3LH7FRAwJvP1zfhmAn/8kzo9Nc+i4JEAN
	Ga1oPgR2M/uMAkvWnoHB24A81sHl1aG1ECuvVepmjVnubF8Bh73KxsjfwuXOoAR5VkDbuc5DfFT
	GM0AzPHlKOMOaKrHzmmDkajfx3Lxb5i0KVMIsaVBYtsHrfiNu/DFKthudWztW+LE5f/0mWYoNMd
	saUPoE33rgBuWp/W9dbNcgDdE3o1F273V3uNIn5uFA1ELbRQh01mZOZfthMBGmS/7V5IJ/8Ooot
	y2a0rk8kWRwcgtWntSnwKJatWLHcTnQFIM=
X-Received: by 2002:a05:600c:c4a3:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48e51f45d33mr10958745e9.24.1778011803213;
        Tue, 05 May 2026 13:10:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:02 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 05 May 2026 21:09:51 +0100
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-1-b4767d0dd421@imd-tec.com>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add IMDT (IMD Technologies Ltd) to the vendor prefixes
list.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..2db12a1cb6e1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -769,6 +769,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
     description: Imagis Technologies Co., Ltd.
+  "^imdt,.*":
+    description: IMD Technologies Ltd.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^imi,.*":

-- 
2.43.0

