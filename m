Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A511CAF;
	Wed, 10 Jun 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095970; cv=none; b=i+XP5ftu5ZyQ9gP8T99hXkZLylOLpguDStqArsaRd+bLRWgUTBkdX1CLdRPVWYyZDU3TvEJypH3Yk7GSPMbS5MztnP0prkYeDZBvjz9gwdARv7SExeBAV6GdEuFbzr1tR0i0mKGnUMo6/V6XvOCV9KAFOmp9HJRVzmFqf8B5G28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095970; c=relaxed/simple;
	bh=8Rnujp6tOFyrP2vtocDoi7YjbJ7MnnkgdDC9OzbaNh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NHmmrlmel6x00E7B0TMe4si3NoK9yPftp50VHiktF3n2riEghj1yF1fD8KPfth0+Zivut9wu+6R0mQl6pWjFUPl1KmEWrXT+dLPovIme80DezoJZXMDYFM2jNC+mE+6GhZM4RdGj3vh5eCWLrvnSRu4L+ymUW2Bv3uK0KiBweGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKq5ba9Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKq5ba9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2951F00893;
	Wed, 10 Jun 2026 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781095968;
	bh=kDEObEYKKcX2UhU8hU85dOPs45LnPA2gh1b5QwZvnds=;
	h=From:Date:Subject:To:Cc;
	b=iKq5ba9QYuBCPOBWP8muoAxRX1LFf+EnUniWHdQM9Sfkla2Oh/aR7ETk3NfxXttSd
	 lEWbVm3dPBdZMtPYPC75BdnGV4Hn8rHIoeqFRPI8+p1cJMFydtWFUYQYupN8meAotf
	 BR53Df4DYHrxCL06BKqzibmhn+PM1nv6ko7xkKh4t4VkhjhcDdUmJjo+IDFImGqPwG
	 eTJdTf1VcFgoOQSj7fiH818qZJ+/2epJ85VTalb+/vBO+8dGWB9vGSxw4AfVvFcUwS
	 46w76RSQHhilts0QYwUwynN/5PFjfX2XP6RRYJUT5RFeMz3Ib8VENnm1RcgQnhh56v
	 r++P4W8GPafJw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 14:52:42 +0200
Subject: [PATCH] dt-bindings: nvmem: consumer: Make 'nvmem' an array of
 one-item entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-nvmem_schema_warning_fix-v1-1-4029becf13f9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWdukxUjQqxjTlOkIY9KBdABJC
 He36vJ7i//toJSZFG7VDplWVh6lwJ0qwCFIT4ZjMdS2bmzjrJnHidHImih5xYFS8O+QhaX3T96
 Moza28Xyli0MokSlTmX8H98ffunQvwvlbheP4AHfvnt2CAAAA
X-Change-ID: 20260610-topic-nvmem_schema_warning_fix-1e8d8d39e51c
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781095965; l=1589;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=HYWYUgodGxgmuxOWCkH0yh3eKL0fIp02iUNDWitfgB4=;
 b=raV5ADkI8qmrbE72U13ndLLzaPrZRgTSjRubQ/3QVB6rpa2F59KxDlneNjJCoTPiwaFzDfat2
 VcALPwdFY75APTcLvSdxamDRmDW221+arJKJzsh7772k1q5Otld6O4f
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

'nvmem' unlike 'nvmem-cells', consumes references to just a single
phandle with no arguments (i.e. with 0 cells).

Constrain the schema to enforce that, so that the number of such
single-item entries can then be regulated by IP block-specific YAMLs.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[397, 398]] is too short
        from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[397, 398]] is too short
        from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
---
 Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
index a26633bf52db..45836308c724 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
@@ -16,6 +16,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
       List of phandle to the nvmem providers.
+    items:
+      maxItems: 1
 
   nvmem-cells:
     $ref: /schemas/types.yaml#/definitions/phandle-array

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-topic-nvmem_schema_warning_fix-1e8d8d39e51c

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

