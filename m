Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795135171;
	b=huDS1zZiEGcyWiMx2vBV1OFJ1Bn5XUrJHC9Ox9+BQ5EkYgSxypKLzFIWc/F6IlrD1B2c
	 R1h686TO1mgaANERUZQQDidVarI5RJ5K8NBYvBuz3imHALhGd+iQbKGT1UUDjNh786bCT
	 Orlo7xJP2mc5PeP2rXzJOBMFoFg4Ybp9MqEl9UKAaYsJ5jbn9PL3rDk5VVwrulMLqJiHM
	 NwqP8FrUNP24kcVZtUW6SOGAONHq0HkFpyYOmAEQwhb0J/Z68JEjT++6cLA+7yx/znXoH
	 z/KwE8LuVkXuvk9XARvnwoMhBuWR5BbeLmF5/2bAPF80wX3D7QVUl8sIbDNsNbJPk5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135171;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iUhuxoNwq1ObQ8ir3thbZMB4/VIrGIgGYNqDwDmG5po=;
	b=xJW+YAgkzd5A3BZpYBELVG7o9Vi9xoGdje4eqWOqTTRJKbgOv3dZt6cclvXqNxjBussH
	 YLmUbv+d+G6Qmo0m7jKzWHK63BT1EkyIonouHuzRGhrBgyl4/3ONdWgJ2HtnvyFlHuJaz
	 l9+x14e+tXvGTIk0x4jBRCIqRQ8oVmpnlVjYLfyI2gjqUQeSauXzbCxJ/ufue0LW4/uFi
	 e9qYQYGtRAXu5XlRsSqUDgfFqU6K+qpj4SJal8sBGvM6RF5zzg7MDT2RXNeNTg+wSq91w
	 DlMS/Yvb6c0Fk/IKHP/0SsvSs/hFMnMfYgTI3LwNgjx6HXSe1Uuj5VqciBkb4ylHx2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2ABN7wk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0B606A33E;
	Fri, 20 Nov 2026 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2ABN7wk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795135170;
	b=0x/ddWcNMbC+eUKOCeAgy5cmlPYbbx8cjooKlwQpMCtidIme1IZwUKt019sKEvJBH64d
	 tj2ZyTzS+fXcde8NwJBGkvmV86pDNF4uDEhZvqNpQvuLz+FuDzM9R7wbbGHng8ohQyWPe
	 SsGH+TqMQ7ESQjDJM7s7RiHUyW0QC0hheGwQQ3Dai8xWLaW9NUHhDiFNczvWIsBee+0Cb
	 4vE8KEP8nbMpHwuxosiXGXGkhqP9cf3xugopNlIDpEcsFtPUo1gulNNqKGv1dnwe2LeNs
	 4gPIrHOFUExt8eEh0XcYHIH/ZOOj7nYfyaQkgFTEgkNqGeDqg3RO+TLGdHrBDCHdUPg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795135170;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iUhuxoNwq1ObQ8ir3thbZMB4/VIrGIgGYNqDwDmG5po=;
	b=uxhJuStZFFH3KRuwERjlsUfaQ2708d5ZOlR7y0g9wHxS3EmnNdoUC+ZtH/zWuxJS5o2h
	 XAisgij+vocnzCEnfU2oUMWnZCTCbgTygg5YCZPJrNnydrvnfYQ7mWSgjWBU6hHWk4fJO
	 cIIXhV32mkaIGSoiicaUVg++QHyc6EYrQ+kfp3nXvHPla0lm9yKYsHhASa1bKd9nT2AK/
	 2s5PUlytie5VgCNMBrLeKC2CVA9cmrbHLhtYPIfyLW1K9d2AxWDNDidpH6sbeeLAcH4FB
	 T/fLyZBmhKR1qiC9L+SJnBFKOiuX7INlfNF0wz7HDLBlispW1kKtlvIBdH+i4WTaTAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EBFD1F000CA;
	Fri, 20 Nov 2026 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135170;
	bh=iUhuxoNwq1ObQ8ir3thbZMB4/VIrGIgGYNqDwDmG5po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S2ABN7wkzPKbR94kwk/FvJCsvtImOyG9gRg4rqPEidTUcHUdsZqhYCMdFHuErjjwF
	 UO48WElkJlheblOsQ1Q+hPIa2sVX8FO+Ws19RzH7aUp7v+wptq9oLwBcNA/G2ZtyBA
	 936YolD/jZKWG1mfVVfBHBB5Twb8J0gPoKVJlYEdubklyyn1K/uk+YAWHPv0Tru89A
	 MBtK5YiXrs2bqd2lHmkjxjVSaPRf1ySDe6N1P25JqVZ7vvsQvpY139dnh9AxrnFKqP
	 xshKlCjgwQQiDILRxrpjvJU67X3xI6N9b84QD9tQDtQEZZhflckXiXxxughdvnzPGj
	 4HTi0LL5PyBXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 92238425E3;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Fri, 20 Nov 2026 01:39:28 +0100
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Mekotronics R58X-Pro
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
Message-Id: <20261120-rk3588-mekotronics-r58x-pro-v1-2-4e70c077c7b4@pardini.net>
References: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
In-Reply-To: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=2G78J0UgfXoTrXCAbZ5jv/J7JIo2b+DqfUU1E8WzZBA=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq/5bAQTWLRYGYREzXDvbPG8mt9JJ3ioqRNk0VE
 Fipxd+VixaJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCav+WwAAKCRA7Xj/jnsft
 6ZJKB/9njf+S8P+q2eGygIUa18wgD85SjCrCbvr1wsJiwBNdxtRLlRVd0ndrpH3qLha3/8YXSoJ
 7fHN4FmrrBwBQr9u4rYQHMzfwGIf2XSNuLLV4fEQ78Z1KChohTvOLjlWpYiZtM5iLeJN1cc9ziF
 dM/XY3i9/xxdumSuKinm0qH2nesOET8QnDrT8SHmkRZ2sTLH7NUWJN0+Cv+U+Dw4+TVwAuedagq
 FW7il78IV8/LvkWn/mPv9+S2vx1NekP/8SRlrvCuvhvo1GiHIf0BDlAQO2kbDj4M4jOPdfaNFrB
 X4O29dFdsjn1me1sx1pYoj+VzxZMwWV3nTzZJ5Y2NW7+BOe7
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

Add the compatible for the Mekotronics R58X-Pro, an industrial mini PC
based on the Rockchip RK3588 SoC.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..e8817cebdba9 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -864,6 +864,11 @@ properties:
           - const: widora,mangopi-m28k
           - const: rockchip,rk3528
 
+      - description: Mekotronics R58X-Pro
+        items:
+          - const: mekotronics,r58x-pro
+          - const: rockchip,rk3588
+
       - description: mqmaker MiQi
         items:
           - const: mqmaker,miqi

-- 
2.47.3


