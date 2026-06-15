Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D91A40F8F8
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542143; cv=none; b=m6y0F2ZvFfYwDjGvg3MKkHysyCOBkeuUEEGweTnUDZwgxBXwdSrEruw5Yt52kcALk3HorqFpGXgJ4xiFp2kbIt5tOHTr6Dx6f+tkfGD+JLWFKoAmwHamM94Jlrxst9n7OeQUhddNk3xpQ0jofG0+RJqtzS/1sAy9/NnLUZ8mj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542143; c=relaxed/simple;
	bh=BLYP69on+acONkpbj7BDPcs9Wrpg/jph8ahC7zS8284=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TJqxV8212PRshJMyVjfoMtnZ0+eDcrWU1AlJl5TmNzydGFsaTNjh6hYuvpJ+M6PnN0UWRzIoP6Ys7XOVj8vwT4395g1aC8kqp6zcjGZyPAu539fT+6B4LhgFrZFXSH/sHpc2VL7dGetIQuJMdxSvxokjDQiRbVKK1uNl3t9El9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyUAz6Qn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wyUAz6Qn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3e03939so26607905e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542140; x=1782146940; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ1dZAWMIqT78hOt+sG6oi20VAgpv8dyMe6SBppclyU=;
        b=wyUAz6QnSrGFFbhxDGrUz6AbxotOkGq8Q7cE8WjKh5KdVhZgyrpoNvElA0b1xaW3h1
         bbCuMWNPoqEEw1l8Nlw2uyaG32qqNQ46mT/UZcyULURV/w2QoSGkZg7bmyFYNElSmVnH
         fgYdPXdEfkAIVP0Mxg57p1Qb2EpJLKe/S1HpZeO/EpNCc3iJKIV5IisLAJm2RgMg0dfd
         KDNjcJGL+Hykmr1MivaI94Yh9XIXVeTQNTGgx5il7g2LlZHMmAEtF46O8TaJWPgbNQSq
         epjn7+nzFvG4qS7KS3luMiFPn9iWXFBx+PIAN8OTeDTlOCSH6zVUDVTphMvDgmwneCOZ
         oDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542140; x=1782146940;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ1dZAWMIqT78hOt+sG6oi20VAgpv8dyMe6SBppclyU=;
        b=INhpMi+fDSZo/TnJZlMr96z+nxn299UbnY31+OEV+jKyut40j5BHYDTE/xtK+wUW+7
         A5qKdRTICV2ZcnBgbTQAUcfFn16lGYCTYdCcxvGSYq6dIkna3jBxDYwXPNnjYilUT/WD
         7QQbJhOcHqKDWod5faF+GH2hHivxTRFdpr81X+oojMDwEx2abruQ7AL3pqqFDAXdTAH3
         QKIi7ffMscAmatBwXNhEqywq/XUpQ98MBCVLOWrvxVrrcIeEGiYxo57N+yoIHdpbzhET
         ng667EzRtbS2XhaUHnFZsP7iPq+bCXn+sLX7iG4ETN1xmu3MhzYYK7DgcDJfVU1TVGx9
         nrlA==
X-Forwarded-Encrypted: i=1; AFNElJ8stZN0xTtFHRhzt0KekEs7qOdSL4oJ628p3zaNodBLuSCUrOz2KlIw2li3Uj5gvr+3RktB0U4yFHgU@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZEYmTz/GbC2fnWFBub5Ep8eiQyga/r7K1eS2f/Etfhx1gz6U
	sEpacZnOsOESUK6rf8gxd8IrvKYI9ppty/Tx8x5O210LdIiynhClsZsnTB+oGdDySfs=
X-Gm-Gg: Acq92OHnyDZm0h40Najt5+C6XOYjaV8L1JT5tB67uMKXElurvhhQibXbTKEUDfQBj/v
	07j3e42ViwnZfJmdr8U2pqAsLl/LzfOt3U1KbXYHwPvtUSm4lgZjboAb3X/oW3TPcZqT0ylUIZn
	wHTDz6ApA5dTYbDvA7MoBD4MShKCJL5ScBBxs23xGDiyfoF6szDAkwAIarGWzWFi+u4SG07PhTw
	31cusBo7kdYojUPvzXM91pTCRK4R7b2sFRU8Ivcw5fAm1ejbBR8x6KCkXhTvcX9GM7HJSP7H4A7
	uuHRB12wdRALhbkVUliiXnd4hql75VHdGJU+CaZoxyImrXFlTdCKU9q9eyb+wMOkzw/R+ilHMY1
	ef4XO+mp32qS99rtoO97KJN5ZApNhH+/51DcVokiJrjJp2n0ruDe7fM5T6Xyj82rxPY/DgAY56k
	ic8Iybu/XVAX9ltAFvVoknfk+D8R+CbSgSUkAP8EpcY5w7
X-Received: by 2002:a05:600c:6c10:b0:492:1e36:9a90 with SMTP id 5b1f17b1804b1-4922fb09049mr3353075e9.18.1781542140287;
        Mon, 15 Jun 2026 09:49:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa58f80sm5670735e9.11.2026.06.15.09.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:48:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] arm64: qcom: sm8650: misc enhancements
Date: Mon, 15 Jun 2026 18:48:55 +0200
Message-Id: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcsMGoC/43NvQ6CMBSG4VshnT3mUP6Kk/dhHKCcQhOhTQuNh
 nDvFhbjpOP7Dc+3Mk9Ok2eXZGWOgvbaTDGyU8Lk0Ew9ge5iM468xJQLmI3VEvwoygJhsX521Iw
 g7QLWGesBqyKXklRGmLKoWEdKP4+H2z32oP1s3Os4DOm+/m+HFBBq1bYFKaoUVteHnhpnzsb1b
 McD/4A5x98gj2ApasKqE00r5Be4bdsbahn4kCABAAA=
X-Change-ID: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BLYP69on+acONkpbj7BDPcs9Wrpg/jph8ahC7zS8284=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMCz58NhdAw5qQ8hzNTZ0av58CRBe/QJHRSJ7gPhG
 gFVhOIeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAs+QAKCRB33NvayMhJ0dW3D/
 9OvD1c3Ry6pRrTJMAef998mSW5c10VJ4IS7GGGjIrqZyCditjiXWlVQ0NxR8m4oTWLwivVnaJBHiei
 UAu21HK8AdyHeX0mYmz/mQ+ZWh6obsc/KhTMFts1TXOG1hobfl2xLyaBjhoLaGPsCdEFPtv0RlY8IP
 rc5AfemYzFTVR3l5pWo0MvD90AfRI0AMEQGIR/09iR19yp90fWXiboR6IDfIZn6AXrf/Uu9e5izHsz
 smL9t4KrJuMRdSFAGTTjEys5F+RBD2NOTYP4xekgPmrrklR8RWaT+MF3xbqSjwI3qfYvjRWjGVVwaq
 3z4v8uciFW9j4cQmAtFOD7TN25z2cyHBfXUPRAxIGtCrVYwLepiC/IuE/aBdxkd6zxZ6MH4dYbkHbY
 wHkVFaJvK5sOQhpz2z3woGe/Nolfc0XSwongfdD7iHmTwXQ8rVDWXRvvmWTLzKt6XP+R9NIRj4m2BL
 4bV6sAMO+GHXC526GJlkDFtYEcFh2UfDNAkEoCYjGWdmfEIEIFnm591x6t+w2Xg/i7W8rcfXc3qvv/
 KBrJWoRY2hw2n1EDmYzTw6NNEmELyP9pTl6IWb7tmEfCpccJo7fybzYluaJ70j3yB3oWi/LYcgIv53
 cH0WZSYV3zl3f+/LSVcN0DT74XffU1Ud6SyBLV88tebyOu/cgFLOg2a7L3eg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Misc enhancements for the SM8650 platform:
- update the cpus capacity-dmips-mhz
- add the CPU cache sizes
- correct the soundwire ports

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Picked tags
- Rebased on next
- Link to v2: https://patch.msgid.link/20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org

Changes in v2:
- Add review tag
- Fix l2 cache size to 512KiB
- Link to v1: https://patch.msgid.link/20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      arm64: dts: qcom: sm8650: add CPU cache size properties
      arm64: dts: qcom: sm8650: fix soundwire ports properties

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 110 ++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 27 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

