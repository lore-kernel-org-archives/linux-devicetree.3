Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E96F1C2AA;
	Wed,  8 Apr 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654900; cv=none; b=TUxc0baOpKPN+1i+mQx9tOtUyU8wODD7RPYf82LktaHtBg9/FTWa30y8Fvu+mMM6JqmcC3VKakLw7c5cvtW1q6BC7/XW+Z7Cmgp5cDaizHY+sF6rR9WlhyoghgwhrCjjhSQB4jfL1mV8eLbzxggNzs+bEQ3ippAxvDbG0uAZhPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654900; c=relaxed/simple;
	bh=JwXXXp54rwsALnJ9Ty8lxhGNiW5WL/Y7Gxo+USfwKKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=akDsEUl8zRwCD36KjBUQKdDs2LKcNc1dJwSV+lu0rdt6dkSFm4ak0dgquE3Zu8I43UATqLul0zYSIGT9rpZyGlt7I9+DDw4ctnRM2o0PaLv/IAYg0fDcXGp2WSdcC64x8fQu0Pg5FPH12WFvnn2R6wVaS1r76iTvYbJE3TvYoPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaZWWnAD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaZWWnAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B043AC19421;
	Wed,  8 Apr 2026 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775654899;
	bh=JwXXXp54rwsALnJ9Ty8lxhGNiW5WL/Y7Gxo+USfwKKQ=;
	h=From:Date:Subject:To:Cc:From;
	b=OaZWWnAD04utqvTfyp9Bnv60gb5m81q5qXmPW+lBlQTuRQhF+fvQjgUpFlyzhxPNV
	 esUSdBw0tfs/bJkznbAe8R+31rtqfDFwbT3sN7ueOpBTwy5KjHrFujiPpR0mWB1TIu
	 7LHda5NKzVTtFbUx456dPG6xtCPWVK73uSXAEm4SRHlJJmD3P0LyQT+pmA8QRqBDux
	 l2f3dltb5GCEdXqGUrnvuuz3ceftY1amSEAskvG4oEhK5WzmjCY4mWAqv0bjWUJB04
	 WBWgQuHPCnPLSU+Aokf5rdJfSpnf2UaAPEbXKC5g4jHDMcBgp07eAw+fWQqB6hfA1P
	 +aanxGe0RbWrA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 08 Apr 2026 15:28:13 +0200
Subject: [PATCH] dt-bindings: sram: Allow multiple-word prefixes to sram
 subnode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sram_dtbindings_misc-v1-1-00556167e136@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBAG0KvErBPsF+kqEVI61bfIwokIorsnL
 d/mPSQcwUJd9lDkC4I9JBR5Rm4dw8IKPplKXba61kad+wGnJI6b9eeE4BEWsRvEqYaNqeq5rXx
 TUAqOyDPuP++H9/0AjdqRW2wAAAA=
X-Change-ID: 20260408-topic-sram_dtbindings_misc-5e8834f63d51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775654897; l=1053;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=K5Hz693enM3mAyN9nVRfpEM51nRuVikh140KdMfU9PQ=;
 b=S8FgwRm2m3SI/t7ei7Y7gCTbua5lv6jIJ+JtG2ru95gdGqbAm5E309ufLJS7/znY64LrjT+5Y
 1IjF1ohTccqDFWBmxM010RmKoPYXtbndhbtFROcxl/I1EP90UzbDviA
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, foo-sram is allowed, but foo-bar-sram is not.

Allow it so that more complex names aren't unnecessarily simplified.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..b65c2ff846f1 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -65,7 +65,7 @@ properties:
     type: boolean
 
 patternProperties:
-  "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
+  "^([a-z0-9]*-|)+sram(-section)?@[a-f0-9]+$":
     type: object
     description:
       Each child of the sram node specifies a region of reserved memory.

---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-topic-sram_dtbindings_misc-5e8834f63d51

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

