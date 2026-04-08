Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB137E2FC;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677287; cv=none; b=VyvRcposw6wgibAmm/TEbrfSSTgBYA4a25yT38peuwuyG7DZ/xrdWqCb8D1ji9URRFT4/b3dKJiEqzAZvCt130syh+DEB4mJIzsilHU1lmu72T7HyL+Mq7fhVfjT3L2gcIxC2d/rYcHh+6Hv0vgoSpHELMxzlcqfbEAlrIeRwUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677287; c=relaxed/simple;
	bh=owyYkRSPmgKR2r1SO/KyPS1mx+dKql64OAp/MSZ4IH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWNVwTD6Ly48WboIlagsNWaBm/fOJuOMDybDbGATHjjJSwqiqje0Lx3GJ5wnkX0x/5Pv7gvgHY8XprcYr7vTA/M/URmhYfMjsCUj4k0cFYWKCD0YazSFmmo2hvu/jw1mUMc6UK0vFH9cL2yY2/12zYd61A3R4ZrQbc52Bb9GNC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jK9HWAZu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jK9HWAZu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18957C19425;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775677287;
	bh=owyYkRSPmgKR2r1SO/KyPS1mx+dKql64OAp/MSZ4IH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jK9HWAZutxNm4wukmsP+sTyza0TuJ5yg+pVFqkLkKkOu4IgZko47hjcID/z4QSQdh
	 dZNVSe15dEtb0OFLi9nZT/rVcyVouubG3IczkTNKBwCJ3Q7WcuHamzk/DKbajNPePZ
	 7yrZnOOx5W7BynRlOxPxI5LoidEei1lFssPNbwibJ+HubvcDDRAoZoec7kYRemzYCb
	 kO0iw0oYgVxAKEL4cJEyYzPxYnfJ0TWqtaHlO96Ov/fDXtrOt8yx48ynwwolugQTnE
	 Xz58QghmQDCW2KrL8rsezjvw/rRvUFAl2v8ifKsHDd19kjgfi2TvF+ALeHWYohhARH
	 7SU32uulph1nQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0761C10F9972;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 08 Apr 2026 14:41:24 -0500
Subject: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-ayn-qcs8550-v5-1-c90abeb7a152@gmail.com>
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
In-Reply-To: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775677286; l=950;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=gOQhZByrG6tU19fKVlrU7N5RaAgEuR2DnSgZYTk4CCU=;
 b=qHLmbO+XOrMatwGjCrYbwNDhjZtq9AqhQtw4lLAEgY6nT+wuROFu3WyWlFG/61cbnQD/u+mWA
 0DrMcSSWHsQCPvVJTpHvrjCKJB4x3Oqn6h1JLgik+z5UF6GARXC9t0+
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Xilin Wu <wuxilin123@gmail.com>

Add an entry for AYN Technologies (https://www.ayntec.com/)

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7ba5..b891d6d41f198a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -225,6 +225,8 @@ patternProperties:
     description: Axis Communications AB
   "^ayaneo,.*":
     description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
+  "^ayntec,.*":
+    description: AYN Technologies Co., Ltd.
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd
   "^azw,.*":

-- 
2.53.0


