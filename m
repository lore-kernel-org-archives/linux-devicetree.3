Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795702222;
	b=jBfCAWYr43cG8esvZ85VpF7j/OPqTOzjIdUGCeZXiWpqYNQuhwRW4hoOyq6Jq09HqXrO
	 bWTcK3cFXOtMCQd95l+xKox46ZuZxZp8ec7Xe6ZzxzO6rzRie9s7Mni+fFnrs1lC18tvd
	 n4R9OOVjSDO2iEdjMd+tfSAyVpt2I2WNOM8XhrUYC7YWxoTHIBge4iTt/dhKHQLMZ9bfo
	 PIsTQUSZLI9irfItxKdYQMibKbBdfyu9cEYNZd3Yhofz+J++fMNgOP8HdRHn+UZHVgiR2
	 mP4Uxwk3mPJASyN9qiVDZL6h+ZVDiwtpb0rAuuZzF13gN7xcpO0ugIDNBWlN+Y4cuyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702222;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EDcV/ttepQPHFJKeZPmlC0+fDR/M22VyS6AErk0V7xY=;
	b=SF1Z1ukCxxB/ZEpV9im5kWuxohZaq1zCMsxsBeCfY6zwsh75jIkzla10V6RNHiJRHMh2
	 66D/Yy8SKt5N9nQOv7WR+NGPxtfZhMzhCKn3uJI95M40aikGY1tR5Qr3Y44gAEByO4hJf
	 5YF4ObmEfwlEkQ9JszaIZrrfMOucotI7zHIvmYrK5KMwi46MQ3KXiXDObytJtqYMBtb54
	 316GTac+lP6Y6oGyBXtJaj7eWFRBsnByJ8qJmgg++ZH2ZnBgvR+Pg23WZGY5I2LQ+TKf/
	 Hq6fZyFZebzi9A2Erj7J5Kkp4AflFEOxd6Bw4B9MKUFxgHmLCzSde2EoeG0h81D9C4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CP1YOvLH;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D38606A31C;
	Thu, 26 Nov 2026 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CP1YOvLH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795702222;
	b=uduZgbeh4rxJ++la5kVjcouBALJOIlevEpRrQH1TlKqG7CwOjQe8XrARXTTARQ3hstMA
	 6uV82kjKb74p9YxkXl3taa0y7zneZaj5smyOcLlDqNmovVDf3SZjLRN4tMM+7tsoDEaJP
	 AvsMXlCmWTMAs71hEUBA0i4U3Di6FHTOpPxWg2z8wFJkolr3zX1uhVh3+kvvv5Kz+qhMi
	 zBkTTNTC+3NxZSrBA3MC8ejfptI5Qp9CnnLGKLnzti0DdyYcEexSrVHLM3tXG+vb9mQRH
	 vn1Y2O7zvDmdG8Txrhzft4fSZ0cXuUiU1l4JID76pR4YaxJe7yduOobBvt6jCx9hNPA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795702222;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EDcV/ttepQPHFJKeZPmlC0+fDR/M22VyS6AErk0V7xY=;
	b=e8GQV/08IXJ6xo9AHaUnyZpxg0CQsoIEWUG5WmE2Y9jRyItyjwtqKynl5RgGB/bAVOna
	 43FV0RgeVbCtxMklvejBg67l73BFi8tBSeTo00UYBgTO/qrzsJPstxrXI6vNP5yRImqsR
	 RaIymzaoj9v6hThLp7ryvtn+Wgfog11/f8hlHYoe2ulVdqlYDpwRbDxvYUUx3fb/TAChb
	 BsWFzGOoO2i+c5QzkpoN8OH2JgmpG8lE6vJVNkD9mYOQMjL6Fy8IhA9mJ7RevLmQ0Tj8d
	 r1YGXEC7PUeT3NJM1ZFm0B5U9tzqfNRFcI1BHb3RA6cNF1RWDqEGXUOlLqthceauHmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1170B1F000D0;
	Thu, 26 Nov 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702222;
	bh=EDcV/ttepQPHFJKeZPmlC0+fDR/M22VyS6AErk0V7xY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CP1YOvLHBDKrQyV9I4GUmrF4QoyTiebFLD1ivcK+LSrHxsMb9a+n7yo69gUX8DNH5
	 Jhil6J26ZU5YhrmXDl4FcTA5aF36PRWp2rBiu5WQL8CPMSFHhJXfW1M3uHwdESU2sH
	 NvAOZMsBHtiXKTDhndWfkhE2EyIWmFl4SArM53ap5rLGA5g4gHNbFnYsXlco6MOO5f
	 sdpuRcOXfXaaROYki8CeImXD5AJFYrX4i9RlN4U3XQltaR0Q2dGOYJzWpyqvoycmoi
	 uPW9brUVDHII7Nnb2DKGJpkehisYcH2cGGHZab/xQB63wAi/yVqBq8F13S1YsNaYxK
	 /OQtQakOxQbjg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8E0794D57C;
	Thu, 26 Nov 2026 14:10:16 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:10:16 +0100
Subject: [PATCH v2 1/3] dt-bindings: sram: Document qcom,sc8180x-imem
 compatible
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
Message-Id: <20261126-sc8180x-dts-ipa-v2-1-e919ed1643c1@gmail.com>
References: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
In-Reply-To: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702215; l=802;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=dn2iumU+xZu7jFHoKhppBtYJi14Aa8xqhGV0sQfQ17o=;
 b=JgZSLCIu/wgp+eO5Rymz0a+sERXGKGyZ0a/5fhgNVDfcU8E0gnjbvKzNLRMMebjenfqLupMPw
 GBwonaX9RQvChn9jL5ftMNwkbibHNlyjJkLEA3YnQNLuU/GXe291n7n
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Add compatible for the Qualcomm SC8180X SoC IMEM region.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b09a70b3d57652f79a4ae813cfac2ca677ecffbb..f12dcb1d1e2fa5414fba8a9304893e2c6b6af319 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -44,6 +44,7 @@ properties:
         - qcom,maili-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram
+        - qcom,sc8180x-imem
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
         - samsung,exynos850-acpm-sram

-- 
2.47.3


