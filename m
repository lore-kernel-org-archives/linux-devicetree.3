Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262531;
	b=QtTpSEvJlIOxikJm8g899AlQnJXfb/J1xqWrTVz08Hcr1chUESCKaBwgDHYv6DuCZvpU
	 DTGf2IvVPGv2oY8A9HMiJuJW5k4YcEB04G05HdjT8yrb1+B4gqW6CpXbLttla1gdV1n+i
	 ZMn9ltEukUwt6oN8NRiJPOUA+NtecJVofH20B1LrC+1wY+yHY9d0P1JWASaGIGfCMICNb
	 JzXRAEHGdoZ690/fUQwUBr7gSdz0TrcwaakKUvaCmHQ/0Owaiux1QKQGMA4gh5QXjUqhO
	 UmKxslfOMO7xYmI9tTSYOYqVz3Zi2rf+nsxaXOJxaHvsgcOl5ugeawrpSOr11lfsCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262531;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4lKRGPKRjEBS3HRBukS+pW+bipLW37WZwjli8JaaFQ8=;
	b=k70qWSemDcCwlp+Z6Bqnz9l4oVYKPFUiRD/ZmbF8ulWfiX+Ubjb+AXp866Lpi2ySKoHC
	 hPFZARbji3V5+uL/bhcUi3ajtLnhxwGl8XOxz5KmUS7hgHpNKMPPEnw6aLhfZ99MT9ITF
	 gHDEnzIzDL1/WBac5OxWWNLuGSLO/Bh1QagSuhhu1NAnE1vj2ywJV0nzma4MnkIxn2hhx
	 5gK15NNgkRcdf3Sa//4reBI6HbbOSE40LCo3+4yVb9eOEViZW/+23sB5AOkbUH2eZ7UYp
	 Zu3slEvDgdPddylVA14s2WAocIu5ZpH+5C5xiXvGsPNGFPUpHUyNLxLaTBb8/tepDAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=VKt3r7xq;
	arc=none smtp.remote-ip=95.215.58.12
Received: from mta1.migadu.com (out-12.mta1.migadu.com [95.215.58.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F67606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F67606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=VKt3r7xq
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5rXea88LMQSd6M3OaqGX1Vmyk7bSpvO4oRK6rdtigS4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262527; v=1; x=1794867327;
 b=VKt3r7xqf/S13EV36Iw/+XAB36OHssNTvelorkRg178yhE4gomy/gXZCStV2RfCtZXDz8tj7
 AVCmXZLkTjbsZ5zC2BmWwBuGeNn8+bYoROQemlTezS3dHEkpecKvymvPxxpy7e1jgjzqCv1VjdX
 fE9pUwJj+p+omGNe6VwG2Qg+oL9tkA7b4GSF75xqYEyMuZtFvHEyk635tRcqD5Knrx0qb6jcsRI
 XQcFyr/FkfPz+lJOVNgkcFkZBlV9OPB1GF2gBu+TB+ISekT90sOpeimZS1PtzfKsDaJ76BzfjwI
 O/m9ACLQPPXsNtu7GoRYtqWRnfQ0CvzBJZ5qn/Jgzfr+w==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e9c1d3d8c71a54a;
	Mon, 09 Nov 2026 22:15:25 +0000
X-Mizu-Trace-ID: 4e9c1d3d8c71a54a
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
Subject: [PATCH 1/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Play
Date: Mon,  9 Nov 2026 19:14:30 -0300
Message-ID: <20261109221453.658316-2-val@packett.cool>
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

Add compatibles for the Moto G9 Play smartphone, codename "guamp".
There are several display panel variants, start with the Holitech one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 74f46697a363..37443849d0bb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,guamp-holitech
+          - const: motorola,guamp
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - lenovo,j606f
-- 
2.56.0

