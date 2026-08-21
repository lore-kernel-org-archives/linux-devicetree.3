Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BD276041;
	Fri, 21 Aug 2026 03:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283068; cv=none; b=CDRFxiHrY7X8kriPqAtLRKKMNRQ4bCeKIpUae1y40Qp+Hn2o9RzsjzAPMUDFeGurgEMGy+jqIe5S4jeHwFYcldhEGavQ78ikzprb8ywhd5v6EJE0dbXmPxmnKhksq6r4HkaiL/fB0NWlcQ9KAH5ZzU6x8Hxyo9+qwHEtPlIRlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283068; c=relaxed/simple;
	bh=Et29W0ugWdExs3+LJNmC3cJWsLTnTUSlg3as7PH9H+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AR2lsxfpGkglrL+19c4S4BrkghLjREuFKswKQAik99Vgsrjv+Y254u1/mf7W8IiTSGL4Runs6G9fVB2fa8vG4NHBW7altf9EJU8XRJWRYvUAlf+LseMBHC9yeDcMh0rIJVwtgXRng4jjNYHXoJ3OfP4KfPzIfhUhhk13ZieJoVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tyWUmacN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tyWUmacN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60B84C2BCFF;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787283067;
	bh=Et29W0ugWdExs3+LJNmC3cJWsLTnTUSlg3as7PH9H+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tyWUmacNubJcPD4sCO86DtT4vEOyO4mxNdvnnyuZlmHLq5XLAhN57kpzMzBIJv27d
	 Yt1BvSnz4i6rPqRAwNBs/3EeW0Z8PzijZ8AIfjWDWJioG0NNDCzp0rXfhkzIQGO7YB
	 b9NZ/lf0H8xFQdeYYtZfAst9gVmrvzmVc+ZgsT9HyAKa9EZdv9uqXgRc6K9mPUDj6d
	 J8VbPr7dfZEv+KsV21sPTZ5dL49Ka1aUp8rZCsob45qijgKDP4R33Clb5ak2FGq/ax
	 WxiImd4f2u8BXXcg9EqiC6/azeEe4RDX5Pjq4i9Dh30XF19SI9/MiiHTpHr9YTYlFY
	 a8q+pLvxpo+6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DD0C5DF87;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 20 Aug 2026 22:30:46 -0500
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add Retroid Pocket
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rp-qcs8550-v2-1-d4ce78fe9385@gmail.com>
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
In-Reply-To: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787283066; l=915;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=pgxhUlLLIL0s7PQ+Oz8ayGXR7ERpF2skLnamCW8kj9g=;
 b=r/S4fNWlha1+SegojvuMspUR9N7Fc90mkHTBBG8GQ74tE5uHRC6yeZI/Iy8s3vmddwgHsLLFn
 PNpKpLBGJAFB32gLpF9LQvsFDlLAU9BlRjOtfvhN/BtY5klUqHAdZWE
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add an entry for Retroid Pocket (https://www.goretroid.com/)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 8e6307897d051..2c2502feff612 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1421,6 +1421,8 @@ patternProperties:
     description: Renesas Electronics Corporation
   "^rervision,.*":
     description: Shenzhen Rervision Technology Co., Ltd.
+  "^retroidpocket,.*":
+    description: Retroid Pocket
   "^retronix,.*":
     description: Retronix Technology Inc.
   "^revotics,.*":

-- 
2.54.0


