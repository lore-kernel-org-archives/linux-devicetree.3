Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93333FE00;
	Tue, 21 Apr 2026 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.232.1.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786844; cv=none; b=Hixvst6q/3brWowlSOv3vX/dWOYp2RP1u7Jm3sVxYyiMaIrBthQy4ukCd0Akz+ANrGjJr6MA5yyWPMxrlBzMEpyG2NkY9MUyyZbQ3Evng55cbS3TWfdMHeOnU/8uI6MnrAePXg4k2fkLMh0WZnCIfCAYPAYvMtcXotNsiQnciYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786844; c=relaxed/simple;
	bh=EAhdoC/FIZEpJq8+1HjZjV9birQwkpXhbloEArshe+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MYpMZdnDl7VeAyYVOKZVyIArAD6h4lnllGfhvVX3SGzCL5qZeU5Ezz9gOSdJVIxUDA9Oo4kFqbkaGrbaIdkXxxAELZnFkvqgdCHcB6/d8CAppwYTCLHt7UHVhXS91s33I97sVW9Ob2G1uMuVssbu3YqWmD92HPDM5v/QEp833no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at; spf=pass smtp.mailfrom=student.uibk.ac.at; dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b=I/laOcqg; arc=none smtp.client-ip=138.232.1.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b="I/laOcqg"
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63LFrUM02501267
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 21 Apr 2026 17:53:36 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63LFrUM02501267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776786816;
	bh=WIlhNTzKsCB00RviRSN9okriwm8fA8WhY7qfbKDRh8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I/laOcqgkWslLprovQANgZEaEi8tzj4Ns/6LGF5Agg/4dZUkJXhPMe46UW0s2b7pD
	 Us2VRAwvVSRI+TeEG9m3O5yNibnlJtwe0i8o/4c5QElE85X61EJ+tGKtN/U4McKDSP
	 q+yD6tJhoUP8YCbDwV3wElwbITR7I+qC5qCUCo+Y=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for Amediatech X98Q
Date: Tue, 21 Apr 2026 17:53:27 +0200
Message-ID: <20260421155328.26359-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -12.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,UIBK_PHI_SUBJ,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Add the board binding for the Amediatech X98Q TV box

Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a885278bc4e2..c0167fbc310a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -248,6 +248,13 @@ properties:
           - const: amlogic,s805x2
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905W2 SoC
+        items:
+          - enum:
+              - amediatech,x98q
+          - const: amlogic,s905w2
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic Meson S4 S905Y4 SoC
         items:
           - enum:
-- 
2.53.0

