Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35746440639
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223845; cv=none; b=b4/tRJ0vwf1v8H4Ly+cTaqFWLx1Vm6B+6zHjMOPj/Swy1wcGHLyjaUXvhmQmVbeSTU8qR6mN59loYhWb79wpXhGzqk7YiV8C4TnYtwMIHrWp2nsZZSfoZX3FvBeE/unuw6gFGpNvrW9UAML1IRRmEh7MiFEXInTebWkr7jg7Gys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223845; c=relaxed/simple;
	bh=OW1itF3pW04ZwcOtTe3C9hR1GDukY9eaIRarItB6Cdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYnemDz+Q0h1OZ62buHdzSycir87Ytvi3FhbcDYoL+fi1YYwRsWVDz5X7JRLd/FPUOvsJNjcyOGv5HBg9bLrugVJP3zTz/1H2WBe8WWMgR1GEPxHR1NchdkdPXYf6WZunkGoB/0jrCY4MpemhlHd8e3u5egqqrmnktDuwUp1r7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9vAOiha; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9vAOiha"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38101f85591so612349a91.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223843; x=1787828643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=89O3yIa8FljSyPfxcumxQ9/l44h1IUXkEORh/AimdNE=;
        b=G9vAOihaUZTgQZ6UzZkxXKMutYOtScbinxZSsBUa7yEeWMp/j15/ECJHzVFVL3diiw
         M/PV/AlKgCGgJ43pesySRv8gCC0957Aj0OjguKIpzXUJmr9aj2jlW6Ml22W4aUrftk7G
         Fill+n8BLiwVGw3zM5gwxcEEuFfdA65XfUsAQdbfXu09nbGuqGGvGsXBlJ58U+pnzvby
         vz14uAhv6JQzDu9wSRq+qpy2LWxzJPb4p0oDBhUDvv/lBxz4AE3EMZvNDwbney4lHJoD
         5EUKA5U2TSR6D9tE2XPxSxFWj+CgQbwhnfhFhQOURiTrcv2jXHL24f3OmGaj0i/0WTvX
         Wc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223843; x=1787828643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89O3yIa8FljSyPfxcumxQ9/l44h1IUXkEORh/AimdNE=;
        b=qAgG2w1OegST6mY4oUQFYg3d260bMnQW4E9099sJe+rvO9uHeMyNq2n+Y/qoCKQ0iu
         qp+kbHbwWUHwTDiCTHilYGuXmhhn5/ePlsXMuO/WD4Bf0usEX+u68vn3Hk30veG9Hk7p
         SL9Up9fHaoUIv4lC4vOOKRtH7LDExjy+TYNd4PygVEb5RFkMdACOKA9oZS4R5K56KCNl
         lYRKvoYKp7+2hEbrVWeOoO57ymNVG0xfj9HI67kue1xioxVBsKhoFmPGiM1uh8CMWPwy
         RnMpQFN644WZFv8DH4iSAXErXodnZ9ne08mRspIszcAT/Ylsr5+Zan158LD7NVeUe6QN
         X96g==
X-Forwarded-Encrypted: i=1; AHgh+Rp72/6DFRPd/dWYZ33qJDqp15pPHn6mmjMMGYDTkJiRSOw/i57yrPcj6Ot08xSuTN+mEDvcNcLxcnss@vger.kernel.org
X-Gm-Message-State: AFuF++nqncwSAcdpT22LXwL4NuoT+PIOJQscCpGAd3X/soeUE0S5jQoO
	KgwrZHqBn1lL+uXOPh1xqwvL42S2A8d4yvpy8DUnN4gs0xm4YC6a3lKx
X-Gm-Gg: AR+sD13C1dXmukJINfpYwxqLbCZTVSG0/Qgrm4xGVXFHlkCUk9OZnOdK/aeH7wdDKDI
	qYFY3Yd+IFnw/WeqhvWzerChB3q98Uc13d22zUrHFlOdfgX7gX0Ip85InC1B+ILiLNcY2qKAxw3
	J7JoLwog7vLUM/uL2/7nuKe8HXznoC2FV3w/7/I3s/WDW7IFMM6ZciUR3gnbgoLZCckwhZBgAji
	FHp/hcj6+IqwwsWRZodAuhexKEI+eNeikxH3Q4zSgwDueNYspZxgynQBdZhUAfSq2IKkutmwVgD
	OQXw1yAUDr45QHdUFxtgh8pf+j65e5nt6uMQiW1aPRZmPzmN6oHdYSBbuDyAJUAlRlf4dEOy79s
	PPp2UnV3NFHD/O8vJy3a3haVjzJUwo9t9lNvAFn4cY5Lnf+vVMPV0qMDC3GlnPQxaia0JEImzHn
	oNJzXpVw8GjFgPhKAaYYcsENyHOQQ3Jn3dr1EcvJOanBWXy+u4nmE=
X-Received: by 2002:a17:90b:4ccb:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-395a06edd3bmr6114006a91.8.1787223843243;
        Thu, 20 Aug 2026 04:04:03 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:02 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Refine device support for Xiaomi Redmi 5A
Date: Thu, 20 Aug 2026 18:03:44 +0700
Message-ID: <20260820110347.98068-1-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
- Simplify commit title
- Add commit description
- Drop redundant status propery in LED node

Changes in v3:
- Add vcc-supply for vibrator

Changes in v2:
- Split the patch into multiple patches.
- Change name in Signed-off-by field.

v3: https://lore.kernel.org/r/20260818093548.27803-2-imkyufie@gmail.com
v2: https://lore.kernel.org/r/20260810105337.855546-1-imkyufie@gmail.com
v1: https://lore.kernel.org/r/20260810062611.735673-2-imkyufie@gmail.com

Reza Kurniawan (3):
  arm64: dts: qcom: msm8917-xiaomi-riva: Enable debug UART console
  arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO haptic vibrator
  arm64: dts: qcom: msm8917-xiaomi-riva: Add notification LED support

 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)


base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
-- 
2.55.0

