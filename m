Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262544;
	b=Z6IgT79Xc8UoOEkOINFBWniD5ZBAU4RdvYVmcPRj9sHvLK33dvfzuKQFy8XOWJSInzeO
	 f6bO4WConem6gpiCoVY842DN1II7TkOf6NgCgHUeSeuKy3imuq4Np8uo1qaZcNDVrWYiz
	 wvSJYznYqx/THUHg5z+gY67LYjN2vtjKaCzAV9+d05KuKGpT0JPA2l/AFa3y+0fIErLZm
	 Ge2MqZ5SjmIOXo+k9CfJBBZWs1uAZ6mV0GowLYTRyJnOv6T1fn8JH3G2P199RDhdL+7R9
	 11tm/qcOyNfQRvG/0kALMV1/cbLMZUtvJtwAwJTgeNG3sMQdGc4TWSHru73upKROSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cnbWzp8SRYw9JefcoG20foTHGQw84aM7Os7qfOEDv2g=;
	b=bg5QzkxQL5QQQfyZhOO93JFipYxeYzDcWa2y5cUW4X1FLlQBbYpA4YLSmt140aX2X8PA
	 E3O43NLbd7LnhXJ1mq6s+Owur4GjgQxb/AOxcNoxn0pQoDHx+Gq8Fa5fQaegq6yrCB9ty
	 x9waMx6/viA6gQ4ndTdwgpm7aUteBr2lorkOVrVfZoX/+p24K5k8iSmH8rEv+71Jyyr/D
	 mlwjef6HQccqAPiGJm3Bl3XLVBuPsSoPen4UfYU79NN2DcP7V6R8Reb5FHQvwYuLEvjyQ
	 YYV9BNfGyxjrdYI+q4VtlTVkjHY6STeC5crbQwiDCjaW18l6SxcKymm0U4WRdWC2Hlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk;
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ED9606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0ED9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jz5VysEAlQcAxLlojRgxtAz9V5M3QMUrbakks1zM4k8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262542; v=1; x=1794867342;
 b=nm3X2TUkLCtFAcB756h2Sjpim385SJKevpzzsFjEam/gxjtEqGNPmb13cV3KL0fJvJFick9F
 Cwrtvg/m5WlYvrODPKPpfD3gqG5g2pyJqxGly/VGlEKeDR+5z2c42TtCy886+fNM/uXwJB64mcP
 tpxDwDtNuSNC3V6QUW7gROVMac0yPyJh0zP3iuxUrQiC967sL8+G9MB5EKZbaILjLk/wtrWcXqj
 xjnBqO0eUiZJZACy2j4DmfVybZ8BNzQ272jxNC9b7saBrh28QFZKvwgU5009SawVzJd0b1ezFZo
 njTMnQ/iU9BMESPAjkDZQ5hE5ygAZu6ZL/5jWpil6SEjg==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2300422c34a38f09;
	Mon, 09 Nov 2026 22:15:33 +0000
X-Mizu-Trace-ID: 2300422c34a38f09
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Power
Date: Mon,  9 Nov 2026 19:14:31 -0300
Message-ID: <20261109221453.658316-3-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add compatibles for the Moto G9 Power smartphone, codename "cebu".
There are several display panel variants, start with the Tianma one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 37443849d0bb..9c463fce515d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,cebu-tianma
+          - const: motorola,cebu
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - motorola,guamp-holitech
-- 
2.56.0

