Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3EC365A18
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224518; cv=none; b=rVlUpsV9pyq7xYnArN41zk0ZFvFmUG8M1QZNjR/f7k7JrwOitgtmq10oROJXWYXhw7w52Fou5VsBFwcv9rli4ZC31wuaGWUH5GhgfoCn0QnpYkHlaceNHg9RL83mvb4lNFIfHCRmj6F3nnaV+RQ4STYyIFqwDigSeGyDoUV5bto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224518; c=relaxed/simple;
	bh=BF5TJfTjAHAamhIZ3z7tthOS+Ma4qFWW4uI2TjjrfiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KR/5QZiQBMjcdJ2SK1zsWFK+DhMYig9RQhzmKXXW0TmY7AQyOTa4172ODPi5THSY24Txllu5OFytRPV+254i8jRMU88FO2JBwEIlDXeK4QNuCVS+aBIIapyIRKJaTJMkd6trEfJe9gW9cFrXxJK+SU4jHRwOYOQD0tJhbaAiWfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zLJfnmrd; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zLJfnmrd"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso272008066b.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224513; x=1775829313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr3vVgaHqynfRwr0nQihQQVF1MqwcT9adBqdvMVF6WQ=;
        b=zLJfnmrd7IwQH6jBIst/CazD9GSOjzcGAuig9yuWw1DOrhayV6t1lZMRxZqpfYCnMA
         2QKoIFcFmROJTgiDrucvnel4zQwLuBBv6EtVrR68ODcmMyXL2ZbVOzv2o6EEHoc3FuNj
         K/Z2Ve0zOat0xTN4zbDwhf46fWIugfUtReye5Zt2csFDp0l10y/0YaQZFrnyqVA70AiW
         SUVPLbXqPPbbPJJnnQu9+cq0xLWGcMa9CAAiitDdVd12Fvb/0qSKOUkA1HrfqsiDBPgS
         eg4+6MqRCqR+qSOxISzdXoICL7k2ex/raLt4VeLyoIlCyElFn5XS4f8EBJAUcV/oLO6V
         zdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224513; x=1775829313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr3vVgaHqynfRwr0nQihQQVF1MqwcT9adBqdvMVF6WQ=;
        b=SWoxaSN2hjW4DmBlP7Wcta8wjlgbl1gZQdlYU7OkwGEmScy2pRPT5j/ro54NxzzyMQ
         DUbzAqwTaW+Zp5JwOK+XLXFOuvrKYcOL6qsCvpZ4duu2V5aEOLBDTMr6fAtIBi7UNXZK
         uwACa0QTtZhHcMOh+STagoJB34rz4SSav+QdbrH2LY2dMwxFv7t5WUxkkGF3qNGmGp64
         MNbGtrzPO/Kj4clkSgfLZXSRQBbSjaGJyErPlqDmgu4xoG6EhV6c8CLNO0PmYngb42zC
         VpVfw485rPIfvtilouUfhGSah6fTM4VDDz7FbcjFIdD51lr18xKnmqG0o0mwIRpqlg8h
         FD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/0xANu8YH15BEks+KR2qSSiBuDbYwFMY+hw/jHkPA1KG11K7hrg4IpNGKK/EPu9UUPmdZ2uJ3rgax@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzrSrnhVCYSaqNQto8N4/vYa1GR2ktGTHdcwluE5fc1QSX5vL
	hpMNu2m+A1MFNm4bnn0sPBiNRLmy7nfJdzXYuYQVE04Oa1cDTGtF0nIQnHx7RpO8wC0=
X-Gm-Gg: ATEYQzxNyWCL1Im9LVeXy38jpeTKqI9MMWq+g91F28DEJtan/3cQwKHOiL9yhMsBTZ3
	OQOAflVgiieG07j+vlpy3hmcL1W9D18WN9kJlOg/bl1+BBnom68H6TTeSUdOOK7YaP7BmmWP+5s
	EfdIIHcxiiSSPDJ6ENoS6DOCFQVMEI4foEbKwR/nUVAVl2bXJ6FZ7W3jKZEGlNsfvWEhNJWyR6j
	A3niFwbNtgoGwZBEDq2H0eVoKEQUtYuhkHY5EAEr8EQs+tzVSvhB+5cANFnitF5MakOD2fkVhc5
	dScd2DVxjBlhLesj5AtJNXrbJb5pPlxBBJ2wkm9pSFHhFr/EQhcYd8bUohVnqWc9K51QDBvhItx
	N88cdNgvyaqKWolJL4FbdH2xoY0bizOM3Mp3SH+0bR5SNbu8Sq/KxZrVUkHM2XV+YyZS6yyEhho
	z8m5nVq+FVGG2nOD3n6vTMOvIldHyVD0rMpYrdntV1ZqPTPib2mgSPfwLScs6gssBoborKFPNZ0
	gr4QI0sa1RXGSZYWrd999EnTwQO9E/MYYMrBg==
X-Received: by 2002:a17:906:478e:b0:b9c:69df:4d8e with SMTP id a640c23a62f3a-b9c69df5f1amr156882866b.25.1775224513349;
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
Date: Fri, 03 Apr 2026 15:52:46 +0200
Message-Id: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6CMBBFr0Jm7RjaIFVX3sOwaOtUJhGKbUUM4
 e5W2Lt8k7z3Z4ZIgSnCuZgh0MiRfZ9B7gqwre7vhHzLDLKUdSlEjR0/fEQ31GgSvtkxSum0VkY
 c6Gghe0Mgx9PavDYbB3q+cjptRzA6ElrfdZzORU9TwjVflRJ+Qssx+fBZfxrFavyZHwWWKJWpn
 DFK0clenOYwtL6nfd6AZlmWL7EDcifnAAAA
X-Change-ID: 20260116-milos-fp6-bt-wifi-22faa7b15e8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1518;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BF5TJfTjAHAamhIZ3z7tthOS+Ma4qFWW4uI2TjjrfiU=;
 b=ednRrit/bAoAzVhkyGxL0NIrpVGJR0/5C62DiVQLNXJsmwqOGJ0X52r5uAazLmVy1hmNy7lOE
 ooCDQy+mLlJBCy0nu87HL3O/iRHxdVPR3Q8pIcTIF19ewqq5MrpRoDg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the required bits to enable Bluetooth and WiFi on the Milos
SoC-based Fairphone (Gen. 6) smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Drop applied pd-mapper patch
- Add compatibles for wcn6755 with fallback to wcn6750 (wifi & bt)
- Rebase on linux-next
- Pick up one tag (discard the rest due to addition of wcn6755
  compatibles)
- Link to v1: https://lore.kernel.org/r/20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com

---
Luca Weiss (7):
      regulator: dt-bindings: qcom,qca6390-pmu: Document WCN6755 PMU
      dt-bindings: bluetooth: qcom,wcn6750-bt: Document WCN6755 Bluetooth
      dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
      arm64: dts: qcom: milos: Split up uart11 pinctrl
      arm64: dts: qcom: milos: Add WCN6755 WiFi node
      arm64: dts: qcom: milos-fairphone-fp6: Enable Bluetooth
      arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi

 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |  10 +-
 .../bindings/net/wireless/qcom,ath11k.yaml         |  16 +-
 .../bindings/regulator/qcom,qca6390-pmu.yaml       |  16 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 191 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  74 ++++++--
 5 files changed, 285 insertions(+), 22 deletions(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260116-milos-fp6-bt-wifi-22faa7b15e8c

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

