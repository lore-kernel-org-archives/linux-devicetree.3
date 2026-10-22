Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660623;
	b=liIJv0ebqJjfDxI+deeFemADXCJH7vfc+Ieb8DKKRTc7d+EI4jqyoui9rKOUe/deQn3I
	 SK8Y9H+YyFlIeEuk0WeA4T1idtl6SfHz2sDGG+153OiJuipX428Wk1zVhFWi6mnVcBH6Q
	 2N3SyQFjnrb9LwoD8IO38T5UUJS8zMSJgEAq54FkWC491FKyf3zGVaN+N7owdEk40T7eS
	 J3ICiR2ND4/2JPvaPgCuJTkTv+hQleTfyoc5nFPFUSPFMXY1f+8qahJRd3QkXyaR6eNnX
	 Pe/kFQtyHtO6yC2jkCObKruz+g8LrkBP7OTKHjpytrB8ScZ+CMJxs/9BC0fppGKOrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
	b=LdiBWnDrmEF0utPpTH3FaVgvtQVXGpBN5Cy/w6ubRyxqV0AGb4UbpbHscuZX0t9Tmgwz
	 Myee+TInieYW92InBhsICE7rYDLvK+DPTXn3kU1D4NF67Xxb2yioirow4hvF1kb429x+X
	 gmA+fpmxoMfcumlzxbwNj/RuWEtMxCS9Yb8ZLJpEPM7OgdzbSvLzqA0vAXWQM/mNtHgjk
	 UaLFcI41BXVuRGrE9JCIBamCD0PPRxG6zAvWfkMBQrKgcZm1sdyeo3ORq8oiwj4ejUecx
	 ULHCLkvUb0EFgBN19h/Gxt0B8T9WAta96fuv3R8J6fTdQcXKIxzqTvigsM2hmwC35Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoB5nAPU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C814606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C814606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoB5nAPU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so1984705e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792660621; x=1793265421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
        b=NoB5nAPU72HPKSj24x2jYmQAVMrvyGV09hmlsSiU4mdh2uFiHPP0finmH7n7quq6cQ
         koAOQjkS228hRuZkLi4VpAPiS+X39KrVfR/hYEAVBQRNipi2xyxEC5LEJxl2iBMAM1te
         H3bfs5NWHPCiOGojsTSD6QZtFJvqJ8GlkJsFiB9XUAis2a591OZNzCTzqs7GLUdotP4F
         5SI/dA5xk4Ao2tUPznmKpqLd2XxJ7qy1Z95ghawXmP/ZcgwrWt9UDzMjiEfewX8D/Vho
         Chr20vwuTuJ1C0rEbM/QhWLl4lQ3guh2DBeTBCGAhk7WK87kW5gR26wl3xQlKW0/asW9
         PPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660621; x=1793265421;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFDfLWzuLmzLc7JScTXjpTuCNPOQkIh9Celfe9MAx4I=;
        b=xeEY/Nw6Mj/TYl/TGmyFcJr8omJwi6SIE97rVWSVO08uA9rjNj75np5gJB3APPEI7w
         ydvMwq8rVQ6yElhSToYuvIZw12r47sVhtIRQzff37j39HODHeggL6t5dKo+Z37T55UTX
         0JHeyfyyrM6EZBDopE5pXXIdt3TF6wHvyliPYeuCUgI3HlR2O4mKnH1FJyZ0q2zh3OHF
         +t74Cc8Hrh3X8RGv+ErT+c/n15ueFGY11ZulaOhG/oSuXPBt6Ps3hNMx/TTkIMfTG/xJ
         Ogytwv0K+jPbnert6WkvAccbYfxyTbouzd3uiJVmbT0mfTWutUUXlYGoplygIFGTENFU
         vkcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8D18ZwNXTWKit/Rk6rCbnEEjZt6JI4j0evzLbcPv5+xXiSC6iIzZNgs5W+T3fAUbP0G4dCN9WNQ8V@vger.kernel.org
X-Gm-Message-State: AFq9FYIPMduTiUbPY1mSWi2P8P5eP+rNZ3GUPSlMXgZUWOLSQNBFWtqv
	3ncmKsdJSEDuHZGZRpUqwbuYPCBYm1ZZEssHjz3kiI6Htryf+bnsHLIybYJuLaUsXVxn9RwdNJn
	u9NI7
X-Gm-Gg: AYBFou3TeO+l9oyX4dnae8w8dhia4kmr1IuFBSfxaeZQPA2ICYgnb8sjpybqMl6hN1Z
	2mMfRjitK1a0uAAlBs+GFp7uhaeLi8HDXXRrUlPcTyo8gBRMX26FlB2Hdp2DEmIFdDWvwVf6xBI
	5CcY8RqM0BQfjp51fG8yG6xk0zlOGdsY5JPXKU08s2WFTw5eG6QQLeMW7j9TPYqjPh+GGd87/8X
	GlJprnOEwtbtMiDQVDV89Nm23TVn0P+z6FjfQcO0UUz4jA90dcaXER9z49nRmpz4XMQ7tt5DeZM
	PERtx/dxgE0NnQTD4oAHUHBl47bhnWaQxBnX4JDz5ykUC4qwnd7e7SqdKQRV6kdwW8YOaD9heAu
	QenN3bcAqDrAfkfl+GD8HrU6cCST7/oJH6ZC1MnoO+hLWthWahkFC4a7hTavWlLzdmA50RNUcuY
	XQde/yWyRuF2+e1m7Cey98lURUwxKlzc5ZLB0f0vJXQyrSkZ5mpcWbdLxZzM120ErNHLRnzICls
	LqwpNojI0dxA+hYlCkVblKh0C5RXk0+HGzq60yJPDqxEQ4KSG/jPC10lIbK2gQIr0ywrdrmAgHu
	vQodosrUW8wtWRX6
X-Received: by 2002:a05:600c:1f88:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a1fdd4b4c2mr93088245e9.25.1792660621117;
        Thu, 22 Oct 2026 02:17:01 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm11293672f8f.11.2026.10.22.02.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/3] arm64: dts: qcom: allow SM[456]50 HDK board to play
 audio via I2S
Date: Thu, 22 Oct 2026 11:16:56 +0200
Message-Id: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjU2WoC/43PTW7CMBAF4KsgrzuVM7ZD0lXvUbEYnAmZ/sTID
 lEQyt3rwAIqpKjLJ42/93xRiaNwUm+bi4o8SpLQ5+BeNsp31B8YpMlZocZSb7GCIRzFQ/qpJqe
 h52mArvkCwQRlUxqPjj2TV/n9MXIr09X+2N1yOu0/2Q8LuFx0koYQz9fysVju/tMzFqABTW1It
 2yJ6vdv6SmG1xAPaika8YEyxRqFmbLoC/LMjrB5osydqrRbo0ym9JZKWxlvjW6fKPtAra+ymSL
 E/Le8v63/rprn+Rfn5YL7tgEAAA==
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RwnJkJ4XSH0ufql5jTfBYo07LHUrFtd0N7J3Im52S5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dSKpuN+B9pWmXeCrZNed6s0pPHsBbr5qOVLlc+U
 eId9T2eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnUigAKCRB33NvayMhJ0RexD/
 9gBz+Ie8BYVTB5BBYgZWK12eBH56UZay3Eer5hIJ/18hQ0ls0+wPVwNi3YfRjrC4LYl4Urhd/4G4bw
 KXBNxl4/IeDXAYKCIKxAE3ujjoScUJcE0v426FU7nxMxQUyM5X/82IFiKRVIlmd0+zvW/kXb+fuTDP
 MvghTI186A46mr8JF9WzCSLb9a97tVH8l+k+tE0iXQ4nhJr94fi0pPLA45Bx/FGR2BEOWuCeYJCi9l
 SBC/A9AaSJ3fzh8JwjgptK+YaumOu/Q8dSLgk0hfZvJHVrTldFDQ9TKVnsCt8GlSXHCVLtXdS2yke8
 U/Ld9hmLdxLQrIHu5MeWZKiTQsGJb3tmT8UJhejxt5vAntw6QMfJ3fBpd8U34XzQo4huED4StFgVW8
 4/Jz38uyOXlKqWEAo2aznxqUiVdegeuvuvkY9leBhNgPMEAY5pkjJhxFPzElH03wrZIf0drGKEi/7A
 RlfLtAloyMh4zRL3cxTptn8Csx1IZqGqZRKsNJPekcadnc7cNr87YBkLY3hIbxWB6czk9JgdhhLUta
 Y4sn8y376AuayAH+ule/1uKQ17aigLfXKqiT64e0QS8oE6G9ydCXPMGY+zCbO3Rrw95Yy+GEzOFskU
 t9TLCM2V3XRPDOY2UgYtpmMvC7RrbMxut2HM58Yg5ZxV/2Lnb8MKA/98m7AQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merged v7.3-rc1

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Rebased on linux-next
- Link to v4: https://patch.msgid.link/20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org

Changes in v4:
- Rebased on v7.3-rc1
- Link to v3: https://patch.msgid.link/20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org

Changes in v3:
- Fixed node unit number on patch 3
- Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org

Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

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
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

