Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181133;
	b=xiagQf4IYIGUQUiJh16eZyWI2h7OMNqqb6VDwgmxfB0/TCMHKw0ZDwWwY6CsRWG48BXx
	 FqRNWKNjqrH94JPjD4wSI1sresql36smAFoaJ1uB7X+Usk9MAWN3E67q15B6dqdlVNkIP
	 wevpIXPCrRFgvUzs0DehI7W/rQh3gKmDbJAdyWWup9kAbPi+K+FEtI2+QU1RGrKMDeaPv
	 GTvekX8Vh072MUtB/OnlkPXGxRJam2atidITO16VpXsmbzTGxY+PouqCwi/lWHJJdcOHE
	 lbSa0keUgOgIFgPwn/oM953k3jzBbA6vvDBxaSQjcCFLcjfXNjBEDneiw5ZtTbGn54g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181133;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wwlPlgPGmdzUnY9DyWcVDvc91PU4r5RUUdi9kkWGnN0=;
	b=qnFv6E/Kv8GdyO4jdVsahie11kGA6s77I1SBPF68/A1ioIdymAugnqAjaOV1qCTDIj9G
	 n7C7h98nfHwPQgfB2QMsypbATJc3jawOmN7fdABCatvGZhj2EtwlIlorsIc6+aPk5wmiC
	 EcdciwJnWoC6BPSn9V9dzbW2kCOD/x+rn9BfDPbxfnFBVqphGQu6jR/W8TGi7n+As+UOZ
	 CnsKTF5d+b9ZVqzYSw9STEhlrT+0BPZ32AWa0jXldjLRKybKBU+l56SabPtL9ZuZGOX2R
	 E3xClOtLJfr+qcw1V9KnttPEAwx8Td4RC3KZiFeQJuDp66dhIRRc0IzoUges23HcowQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koy7EHnX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB4606A31C;
	Wed, 28 Oct 2026 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koy7EHnX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85751F01825;
	Wed, 28 Oct 2026 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181132;
	bh=wwlPlgPGmdzUnY9DyWcVDvc91PU4r5RUUdi9kkWGnN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=koy7EHnXpZjBQMfDksFXDcrAJDmNwN9sWdStt4BoFRIHpqA0UMjJAWAOf06n/245k
	 VAg8oJaion9xMRPdx5sTn7oqUsot8hH8lsnulAOheoj5Y9/yzEc66NHGbjvAji5WWG
	 BIiCPG3NDS4p6Wcw6nbWJ66N5klsJNgtbJjwGWRJ/d5fP/oIH3fN+MGCvj2+LOQMkC
	 k5PUQnZ4ZOfBt4/CsRHHulxeYbPmDsar394PGPQLLKIdOqlENY4z3xtwilmj9evlq6
	 yyGSo8vVE3n7NS13aoXmBqPthojc7RtOzCXPUZxFehV6G72SJEcETpt4hW8HCbTVXN
	 jg15Szgg+onJA==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: display: panel: novatek,nt36672e: Document the reset GPIO polarity
Date: Wed, 28 Oct 2026 11:51:44 +0200
Message-ID: <20261028095151.1682096-2-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028095151.1682096-1-vz@kernel.org>
References: <20261028095151.1682096-1-vz@kernel.org>
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

The reset GPIO of NT36672E panels has been described as active high since
the binding was added, also see the example and the QCM6490 IDP board
device tree, however actually it serves as the active low signal, also
panel-common.yaml expects active low reset GPIOs to be described as such.

Document the active high description of the reset GPIO explicitly as
the exceptional deviation from the actual signal polarity, any new devices
will use it in the same way as the existing ones.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../bindings/display/panel/novatek,nt36672e.yaml         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
index dc4672f3d01d..45743376995b 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
@@ -24,7 +24,14 @@ properties:
   avdd-supply: true
   avee-supply: true
   port: true
-  reset-gpios: true
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the reset pin of the panel. The GPIO must be described
+      as active high (GPIO_ACTIVE_HIGH), the asserted state releases the panel
+      from reset. Note that the RESET_N pin is in fact an active low signal,
+      the inverted description is kept for compatibility with existing device
+      trees, while it deviates from the convention of panel-common.yaml.
   backlight: true
 
 required:
-- 
2.51.0

