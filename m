Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072753C5826
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916116; cv=none; b=cZzCPIxWjj1bcOVtDJXXW5sSJIk/FKzfvsgJRKEQjjSyOqOfJEAOADkqFMZJEEZcADLiAlFn3iWWWYwYeNYxJ2nLDTDjHkqR1Xv7xX+urMuJZg34vuM3ihz6w7q0MhFIsxUhHOlvsLHDkUD9Um1+/AGSMwScDi5Ld//YQJhao5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916116; c=relaxed/simple;
	bh=EdYe4NmHLzfEcXfTD0KKtKVWiHI/j55HS8/9YRuaA3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Uf7HvTvgin6zofvbNWv+xo2md8uFim2+w9OBcOCla7POtefFglYYU6O/WL/HBFYTFW6jFLAMRmcjDU7c4HCYG7NfFth6VPoJxThq+iTpha3EOTAS2ALnKqg4ovepywqXjDIApBKT0dpCj4d8JW4kV2G1djc//+2Rd55etOoFYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/fy+yiQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/fy+yiQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so304980f8f.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785916113; x=1786520913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zjZpHq06gYjNP6yS8alCV4qUFIXmklNycOXjGjR7rig=;
        b=p/fy+yiQBz3RdicGwDjjBXOF0Xct9KYcH8TnFKL0bviK93KUcjvqp3/cq/PCBH5mhI
         0+BCvJsFgkqJh85oqmohSevf9g789wX9vI0DnDWtu68kWOQDw4EK0/atw4ZnLx9RFtlP
         hqqCmDI/cbqtYM8gUarslhp8t6NZc8Lu7zFQ3a5vBjM6Ms7v1cTq0Xs1j/Ftj31cuNEf
         txGVWJ/gIjzeBk9Mx2UkGIKXa7QXphKWE5sb20ow7MR+jtsO6I3zaKVgfOF6J4PgwwIn
         ZfxvbQ1lBIGRpGpVNJvQpo2B/u4hIbCCV6Wlg2yVnmgKAWVJmfQlSoLjsL8IH3VK3FEr
         tApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916113; x=1786520913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zjZpHq06gYjNP6yS8alCV4qUFIXmklNycOXjGjR7rig=;
        b=ULr7KR1fl5cnDfdVmOh4AB6DuTdXyvRtzYHF7ACaJBEBmVPqSHPpANHQJmWpgiSRcm
         n8PDhTy9GfxionQNw6Ri3DN6mdr73TA3VAKxS/MzvTx9cNKFwV1t7CfjoyiOviOmjZ8H
         gSOEFr8ndmuVWNRGzpQtntTQ0bH33moDnPXhAnPq9PpXCaFIOZhI1IQy4Q9Mlm46S/gF
         118ww5RO2I47P471G1uARzsljXk+2A8//Yh597V7mWDjP62s01Wtuf+SX7N/XRGBmINi
         7aSZUjoJQKPLeS44rI90uLoi30Kjqu4qFiZhEL+Habj8Qe8KmiqOcJkYOshaRkP3oK6B
         SiTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpI6sRhtDZ9jcKJhKqJvFrlykGpTiVrtjuUp9jRxAPS6lwz1Zh+WNepadUge2OqiqBt3NnNAcABjXP4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1MzEV8g9NDK5DddxRWnG25KcJANnHWLqsAyaBHGDBM8eh+4Zr
	42egiaAnJZas/6zM8dhOWhyX9LBQnLI4JPQLeeay9ZX2n5R61EhSN0WZGMQzjH9yRN4=
X-Gm-Gg: AR+sD10eYa3gCcGSxoPLC0RNa8IaTRS27IN1E29lgy3jwBCvzi1nWzRFTKHZSNOYnzS
	lhMj6IZkr+av0YhfMMWWNyrjXFqJwPEgzB1n1/3zdggOaWoXplA/rjNti5qsuVsqBoWOc65q9sS
	IiH8pd3a2+5GES5JNw/oKOFBd5WV8ozBG1ryA2pHOhFhh9Y0Q2hl2K+XwWHP8/qlAqTqRB2rAQZ
	jogAIxSHoqTVYAu8JSY4CBvTTADdeGpXJJQs/gCgOoa6wzpWBZFep6uMFxoacqvlbSAhq8VUdTI
	7rbFssd5OczAdGmvcIXnXpEmLaBxjY4GvAsngcNTrxp8blrAyOzcmoTIRqhAi90UoAqZh8HZNGu
	Iulcj62JWt3mbci9adFwJFWlrOA5u7W62VIlApYnL1mjk1I3tg5iCQ4DFuyIvLVxBOBlCUvH+vn
	v89VDVWZuot5v05GmyAsj6P0pna8pm/doJ0k1QkWGuvGX5H06EBIq9VUvYNhgI0qhn7ECThAYga
	cEFK74/dA==
X-Received: by 2002:adf:e010:0:10b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-47fec509a94mr5676165f8f.6.1785916113106;
        Wed, 05 Aug 2026 00:48:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm6470840f8f.0.2026.08.05.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:48:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] ASoC: qcom: allow SM[456]50 HDK board to play audio
 via I2S
Date: Wed, 05 Aug 2026 09:48:28 +0200
Message-Id: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMzqcmoC/42Nyw6CMBBFf4V07ZgyBQRX/odxUcsA44OSFgmG8
 O8W3OjGuDzJvedMwpNj8mIfTcLRwJ5tG0BtImEa3dYEXAYWKDGTO8yhtx0b8Pd8TCW0NPbQlFd
 g9JCVmTKYkiFtRPh3jioeV/fx9Gb/OF/I9ItwWTTse+uea3yIl90/nSEGCagKpWVFidbF4catd
 nZrXS2W0IAfKhX/UmFQJWhibYhSjeWXap7nF1JQ8B4gAQAA
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EdYe4NmHLzfEcXfTD0KKtKVWiHI/j55HS8/9YRuaA3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqcurOWkQWyZsqObCKVHV7QV0sJUC5vxG2OfNxGRdM
 Pyl+7A+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCanLqzgAKCRB33NvayMhJ0co6EA
 CpxDL+k/OtkRRODfQe5EsQvn6u+rrcH2/0xQOvATsKcTaoF9gDQK9HgyHqJ8Vq+Swrc82kfdAWTljY
 hnHxvZbQQosHFooaP8nKuArdf12/plgoKX3I5zOtGMw8r0CLlP08ODyhauY9eeYQdTuQVqd0LYWAY/
 piBxssKhY20QNyKiiGAblsa6q06QczX5jqu9pgX7j23Yd8A/DgHt5SB8YsA6NkArU1gUl1G6YLiqDs
 fEEkNYzSG+wRYQ3pG4P3GtSZiFIjtYSQM7i2lfQzt7uOvxXw6HJdozV4fB+QqdpIZUBX3TtKs7yDUn
 4uAPnVSBmoL8HLZT2nbUpuhM+sYK7QE1xxECobQlfZaecpfUpqQ8BqdC01nmkboZqgJ90z6AQyb1n+
 2m76epn7P3iCWT1QxMeesiEjtdkF/B4yeC0PRr15DBbZaqLM/yReODXJYhItBKtYa2tWbm4lLtzmfW
 SeaEQAhNsc2iQ+CPEoMVU0Jymkw4QvreIEmzr/BZ8GMbWdEfGftyZf8f5ZR1v/X7O81ObxlsL0ZdXy
 3I0pyJOLam1ij52gN0TE3L1MbylI93Lu/6fmL3BcrGPm4Tck2Zg4PoKCh+nvwIybxc6o13XX5M+fDm
 ApOsbc3Jyr2outIx/fHAyKZgKxV1oW1BxsaLSdUUeCPzTZzgamnipg1pk2qg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merges into sound.git for-7.3

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Fixed node unit number on patch 3
- Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org

Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++
 6 files changed, 257 insertions(+), 3 deletions(-)
---
base-commit: c50ed4627e333934aaf0473a822169786c83dce5
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

