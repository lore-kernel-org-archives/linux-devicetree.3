Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31143A453C;
	Thu,  9 Apr 2026 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729075; cv=none; b=PEa+KJpc8Vv5o8BOrQmEcMdppHUTLE0V/LSgKDTiFEFe3KBoScB9l87UOOqddtDC7Ho5XTBotoXhtk+ujswAIdlcdm3+DtDPeS8ozNN07Ajy3wXf03rMViaGRwYWbXevm2o0jzUT6PrA+siZQzRjSdR3OCSYA2g3+nrqvtQ9DLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729075; c=relaxed/simple;
	bh=H1jTkF6AqLWxLX6OGJIOwylJ+ibHvgzXt8ULq35uI2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=buTgDkHtz4Xf3X/rY3Z8hUziC5K8JcK6n6G3RpFpqOVqqsDop80lk/6l6DhizfWz7mU9PBri4wVHm1+wTRRs3hAcDMc4yzXSFuBUoaY5ub3lpVEWtH/sb59nCeCmEFeQRVOVymZ6OJMwhV7P6tWwvhnM0FjRzr3ilAYblAr+17I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qO+T28nd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qO+T28nd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F76C4CEF7;
	Thu,  9 Apr 2026 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775729075;
	bh=H1jTkF6AqLWxLX6OGJIOwylJ+ibHvgzXt8ULq35uI2c=;
	h=From:Date:Subject:To:Cc:From;
	b=qO+T28ndbKpLTmnJry8MiqfOo/c88PwwYltlsyYACJCyC6tPGk/+kZT1JG1v0m1y2
	 nVbPxuRYRAnYNlCgK06i4dnpXNnhPZxdwjPoMxwiTk1hI2yKCrY/4Qeva9F6eB3x7v
	 k9ZNrlpWuXcVFwzHfuqZLNcxrsCyZwHflnpTeDZegmyziDlyevNhMueBE3aCQKLXaY
	 yp101B3JQfLvsC/rSrF4U5bPVdL5kp0BuSmyfR87NbbZsbKa9WZrtZNVJ3IXJTjHIf
	 L1ectBatKnbjkTFhgz3ifpd4FfjBwN+tz74IrD558O2hilCRM27KpnZ+8P4nZBqC7p
	 ded6+1lVBhKXQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 09 Apr 2026 12:04:30 +0200
Subject: [PATCH v2] dt-bindings: sram: Allow multiple-word prefixes to sram
 subnode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-topic-sram_dtbindings_misc-v2-1-59dc6b0dec45@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0JmbUkLtBJX3sMQgm2BSWyLHSQa0
 rtbOYGbn7y/eG8HshEtwaXYIdoNCYPPUJ0K0PPgJ8vQZIaKV4o3vGVrWFAzioPrzXpHb9BP1Ds
 kzaRt27oZVW2kgCxYoh3xfchvXeYZaQ3xc7Q28Xv/0m6CCca5lEqosxW1ugai8vkaHjo4V+aBL
 qX0BbXIkETLAAAA
X-Change-ID: 20260408-topic-sram_dtbindings_misc-5e8834f63d51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775729073; l=1282;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Yft8n3KWSGOt8NjQMUHslZr+H40p6V6LaHI7FwOKnBM=;
 b=D5yMZoGyTwlfTSIFmXSocQmY7KAihLS+Ie28eVXRwQ1c1sB5CjhZaAeRyVJO1m9POSmqatIBX
 GclZzFVsiJKCWBUtOaKiWIlsdoAJfOCui4EOuub2raCVT0+CBr8fGJm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, foo-sram is allowed, but foo-bar-sram is not.

Allow it so that more complex names aren't unnecessarily simplified.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Update the regex to disallow names starting with just a hyphen
- Rewrite (foo|)+ into (foo)*
- Link to v1: https://lore.kernel.org/r/20260408-topic-sram_dtbindings_misc-v1-1-00556167e136@oss.qualcomm.com
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..d9a1da12dc66 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -65,7 +65,7 @@ properties:
     type: boolean
 
 patternProperties:
-  "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
+  "^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$":
     type: object
     description:
       Each child of the sram node specifies a region of reserved memory.

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260408-topic-sram_dtbindings_misc-5e8834f63d51

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

