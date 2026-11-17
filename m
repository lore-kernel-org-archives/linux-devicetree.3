Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937329;
	b=IcJ5wuy3ZDQmYV/43/ZQwr+13fN4SUBbbm0t+LFXcSQU6xmv4gzLCRNmb/mWzJn/YbP0
	 fs2mfeu5hsF/Vaj6gTC1wjYyo3JA8goZSxmzWmAP0eD3k1OxD0X1gY9iGtgsnjz/aCYeu
	 24g612ooOf/PAV9jFkTHM8qpjnkqgXn3jCyEQNkm2xOGrBbmUFyrYpc0pS30Q7L/j4FPQ
	 7IVyM+0SKMN9oQd9Y7KLyetkXHDzfTcUd4wr07zUdNSvslPB36DSkB0Fv0Lf1OxDet9xd
	 XVArm1xYDzIciuQom8xLLS63cJEd5EpSnAs1dJ2KUysHdTSAEfkCeEVybZg2tSliZ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
	b=vxgQ+FbwBapomVpwLVG8DXD3eBszAFD4EUo+XaFgyGPPWr2FT/Nq30PyX51v8eSaWzBU
	 Q2+mtExjdD9zZ5zD5IsRm0d7EHVOU6GR/Xh2cgchg0QO5S7ayH3MNYIg1SnSMsn1Phgd4
	 VYf8dmhK/ZhmWZWZEP7NYUw7i9VWZA0K8tOSCF5JJZaiB9UUfCUCGQayfk3GJwYJeid0E
	 sfH9vUOVzzKf0V6jUXVmQCzPwtPk8WJ4J8PXERifiAamzgen7LWvVEsgNRGB5ilO6LN7v
	 Ax30h9YbKRh8q7Ua9KbIZTQqF4tSZjz+uTX1+NmwIzW76f4ZFaiOD6oY+rWDYeGjuZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFGjpIaO;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9307606A885
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9307606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFGjpIaO
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa5103so12171f8f.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937327; x=1795542127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=FFGjpIaO7cL15zX3nPk1NbIb0TtthT2MxbC6mTMT+9988qugXo4KEd/YFISIExRb2E
         vpqav2wDB9C+GbNYUWjPdXvjQ6TpIyso8ViGM199yvmnHNdu1Oc4EcskTxrrSCWf7RP7
         k1pVissPAZZg8IWCXZMGmuQA2OGVMNHixFndfiVAUbNuVmevLRN1e1ocOaL0qqJLfxKC
         N3ZLNnX/B2eniMkl/0NfPpm7ppln03kxUXKcYdHEORsSdKRexnd7oYZe4MgLysYp5Bvn
         Gc4osTTWZiGGCkQIgD3v17KPr35iNs//xj5GOcbbA2q/A6Wgx6oyMOHWZRsB3CKGkm2e
         F2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937327; x=1795542127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=KPRQiLw5SVwBhnWjZ2kj7E4CjBfSNe1sXqxX0HR3VGBYpdZiM7WmYSGulPOFduVSQY
         QAJLL5FrIlOKXcts5jEbpcHkbpIsnvK26OFH5JwHBflxEpH/bzI5mCXsOCN9RoDDqdoG
         sZm4jkR01M9PxxQqPS5V2obyUEzl5j1B4R0o+1mnBX5LWEBwE2zpmmg4+qMl/kkQlkjJ
         wKj4SheAIxhW819+XeN1c+cychfJ3EMbsAeoYvUmmL2jnop0NZSJ9idcsoqtXTR1qj9j
         R8WEKke9ep2cfvCRFjiNws39YCw8cHDxUnoxZQx7PYgoDObYI06CI4FsMcZnQ2FO90ln
         kybw==
X-Forwarded-Encrypted: i=1; AL+hErGgdXv37CSM0UNpeeo783CIiWK/QXBfr9+uhHg9HQx3iVUaQi1ulG+YTmTbbyJqmLDfMULdQj4vQtMy@vger.kernel.org
X-Gm-Message-State: APuU4Z8r2dCrcvsD/I2Bsk4fQHgHIE6nKSltTtZcC0V8DFRcO+8PF+bG
	+GJxYQKsRCFc2Ao2gKmJK6iy9JsbkaJtZ7clwnHntC445dFI9RPqsajd
X-Gm-Gg: AZFdTZduxAvCTWTgD8LJKv+LJtH1vmqIHLRnZ7E/Gtww8PMLA0LrDicN42P/aKenXD6
	gTCHsJtb2FIiRrP4N+dnTZcoIi8pBKmM3bOgIhXgMxDn/pJ3UW2LpCCkh3nzQhbYEGg4M9g3C1Y
	iTJKbkMADrdspOnLR5/EdMiNxmRlAf5gRj5Hxc2ZPvc65KtXmyxFlkvFh/+gMpY3SSaL/e1xAsZ
	Sr5jHRr98jjpxFEyDpWoj1IjqHeg9YGXZJwivdZUoUdl6wlaw4VrEMQZMmUKh9sS35EkO+5Cs5c
	diMFSAHXQWHYf49wYkzFuqWTwdpJFG2t6M2VwvudODJOYER6RsJoBYaPiBWr+pHNX5B0Q+qHcdJ
	NCEAY2y4mwF5qMdops44sA3M7jCd8isl2zMZ6XYMHPeed1hbwwZ8Yknki5MSI6X+cozyP941jjp
	unPviqMfvsdZeZS433ysYAupCnaioUA/J8S1NOdhnxKWVliKLTY3fu/yAhXDspi6QkMLJ/lkBMj
	K+Ib7naTk5IwocIUAsr4J1+aC+DmN+W7Re3BcxP20r3W05qVYqrlzmJGp+agUNnelpg3UgVm3y6
	7qlhvk09b6JwkvSuAtSFDepL0xwBF4G6YpnjolpT8++Tlzp9Pgib4lSIuw==
X-Received: by 2002:a5d:64ed:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4a638ae26abmr362462f8f.12.1794937327122;
        Tue, 17 Nov 2026 09:42:07 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:06 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
Date: Tue, 17 Nov 2026 17:41:55 +0000
Message-ID: <20261117174154.549590-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117174154.549590-4-ivitro@gmail.com>
References: <20261117174154.549590-4-ivitro@gmail.com>
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

From: Vitor Soares <vitor.soares@toradex.com>

The binding requires all nine WCN7850 power inputs. This matches designs
where the chip is placed on the board and its rails come from the
WCN7850 PMU described in DT.

WCN7850 is also used in modules, such as the Silex SX-PCEBE, where the
PMU and its rails are on the module and powered from the slot. None of
these supplies are connected to the host, so there is nothing to
describe. The DT node is still needed to set qcom,calibration-variant.

When the binding was introduced, it was agreed that the supplies can
be made optional for cases such as M.2 boards once the need arises [1].

Make the supplies optional. Keep requiring all of them once any is
present, so designs using the PMU are validated as before.

Link: https://lore.kernel.org/all/87ikyenx5c.fsf@kernel.org/ [1]
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index cf3e1fd99c12..27f443bbc401 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -63,15 +63,30 @@ properties:
 required:
   - compatible
   - reg
-  - vddaon-supply
-  - vddwlcx-supply
-  - vddwlmx-supply
-  - vddrfacmn-supply
-  - vddrfa0p8-supply
-  - vddrfa1p2-supply
-  - vddrfa1p8-supply
-  - vddpcie0p9-supply
-  - vddpcie1p8-supply
+
+allOf:
+  - if:
+      anyOf:
+        - required: [vddaon-supply]
+        - required: [vddwlcx-supply]
+        - required: [vddwlmx-supply]
+        - required: [vddrfacmn-supply]
+        - required: [vddrfa0p8-supply]
+        - required: [vddrfa1p2-supply]
+        - required: [vddrfa1p8-supply]
+        - required: [vddpcie0p9-supply]
+        - required: [vddpcie1p8-supply]
+    then:
+      required:
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfacmn-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
 
 additionalProperties: false
 
-- 
2.53.0

