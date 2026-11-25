Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643100;
	b=JQKxUdLOpq/61CHCBaSwn05tI8pBo46Obla1v5DFqwbSgA/B+lMmoy7EgWsMxokVL63M
	 8Hh3CMlPCkHVnQkGxMEpEVAmghzgzCO294B99QmCc7R52dWsbErOeOKf2WkXietDd/x0K
	 Vu3QdqDFaQMnGT4kP9Aqt7oRpKh23pSaHkidhCYwQUlbz2bg4avOKddEZZdQDdPkV2B1e
	 QVBRXM3SdAL1sQDcsgwNLKwBUiapdNOX/oVg1bpsSDOTlKjWOckGs9Nn3Ied2LGbtLycI
	 T1apRm3oTvpnZUzElHGvcoTYRbkKfUKfR9KPpYVzzJOSY6QvIDI23x6y7xOR1THDhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643100;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
	b=3S0afsGtjXnAPMxW1NYLUtK1WcYOjYxf/99pYReOlYYNzvCfBkeF5SW6ODpKMsBEmBdX
	 grFT34kUqO30OfrPFUNhIst3wn6i83+vvEciZRI8gbRfj0DwiXHeo+mcq7IOVhfp8avTR
	 hWF8yc2hk35TRa3bgyVRfkFO5UmDGVFRK6HPjyp9bfsNCcgKvDVUeqEwuNGahY5dVOVTm
	 dXvDisVTH4x+jPxVTy09X4IFWNZojxwkQwQ2a86pMUaLRvtN2ikQ+w/HQ1kYARyGU46Ug
	 Y3JhsHj/l0AYJf7Tx8J2DHyFov8aqdVzuwj2J3xzUzTRdJ7LSxNyPkNL+ZXphdw9fPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Oqfv3YVN;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=L0Gs6XYl;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DEC606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DEC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Oqfv3YVN;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=L0Gs6XYl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643094;
 bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
 b=Oqfv3YVNbTbNkolun+erco6mq7bda+Nn98DEA5uq2w+bwpqIlU6ZJnMbTCsqaEcU9x4dHushv
 /SDE0Mh1TpRqJv3Y3Clsv5w35bSRSwU5N6ur86jFdwL57WNy2JRn0aMPzjwBH7royBbeSNWC5rL
 B98ZIIiv4AbI1OVBdnE4bUkgo75ocJmA/RditG0iqFFE21v7pP2inH1Ip3gGgldRATBAOMb7UmM
 NvrA4wMCHDp3BtsnNnnpEnjmEeaEYPRwKPz/XOES1DbhlOEsX/edpAZXMjZu7xE0CcdDTIjx8KG
 k1ypgYYvSfgK+ZClAzhJ/Y9JWeeGghCRU4K3z3QOXJzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643094;
 bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
 b=L0Gs6XYljuPCtweKYnTSocr1nrERhrQMxiU9ebbYYmIiiDxgF4rfufZc3b5AWiOVYXFH/17tw
 M4ZzmvKxe1QboWP3EPq8f6eY1OSDBl4SNU93NuxxHRb/Q5+43c3WOgLfi4v3+6lYJEDZTl5I1Xw
 uIcxlLb8XdjofSFnROkiFbc=
CFBL-Feedback-ID: 6b0756c5f930f38bf754f99a:55ace0071697eb29754ce598a7fc0c7a
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756c5f930f38bf754f99a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/6] dt-bindings: arm: rockchip: Add Luckfox Lyra boards
Date: Wed, 25 Nov 2026 21:44:15 +0000
Message-ID: <20261125214421.1580359-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add board compatibles for the Luckfox Lyra, Lyra Plus, Lyra Ultra and
Lyra Zero W boards.

The Lyra and Lyra Plus use the Rockchip RK3506G2 SoC variant with
128 MiB integrated DDR3 memory. The Lyra Ultra and Lyra Zero W use the
RK3506B SoC variant with 512 MiB external DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Update commit message
- Squash patches
- Collect a-b tag
Changes in v2:
- No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5eec2ecf23c..49c61ee985e7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -860,6 +860,15 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Lyra boards
+        items:
+          - enum:
+              - luckfox,lyra
+              - luckfox,lyra-plus
+              - luckfox,lyra-ultra
+              - luckfox,lyra-zero-w
+          - const: rockchip,rk3506
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.56.1

