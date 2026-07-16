Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CB1391832;
	Thu, 16 Jul 2026 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219974; cv=none; b=rrf+EJCMDHrutQ9FaTGw3TffLAeLpH/QSugD6zdvcWxS4e6lbZNLByP7M5AAGxooXUxueKRVp7oLTu59b/2C4ADNV7KWCo6w/K4Vh8n4w4uphRvMXoDtR/LRPlJonwHTdZiPSOoqdlUoqSgdnivLCVjLa2NDpJFDibmHsVP4p+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219974; c=relaxed/simple;
	bh=cvjxNQf7eP63sV7JCZXnH592zwkdg5m+fRnxWiuRdhI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=khbOq89Btvl9w9NKEIJfHBLP9XkIZK9ErbQ/ulAny6LbBkUQfi4GlOqKKmFdKuS+kxc0+/xQvn2xhUfEnkphsXIu8WK6cKUrB7abq2NWcIo+FVEJXYbTbhJ/Fr7OT8zGMfnC4poWCIzqU/GC3eyABzCYl/bw9z4UIPZozCwtcjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=tGl3+RRB; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="tGl3+RRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784219949; bh=4KhL0KmzcFeARmVX8+nTR6jjKXcjGEypB7mMIckaDGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tGl3+RRBkwzBRO88UhZdLJ+igH6zCHOCQL68ARU+DsYnjTmnUNfmC28sfaRaDSCQf
	 HSE6X8/ghUtsfjo0En8E6liPzavyRffrkSK3RSnIWR8r0lUWiv9HVXR+8VSmojtsHu
	 MtxLUoP/btTGoFKJbqLwQ1T7Wl6/nSADOiJOjIfs=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 9B93789D; Fri, 17 Jul 2026 00:38:57 +0800
X-QQ-mid: xmsmtpt1784219939trq21joq2
Message-ID: <tencent_0DA92AE62C08A802ACC4FE9E47A0192C8E05@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb56NOAWwgtaM106BhHiYbXKGj5x0k15zUEYwl2jP3QC05B/DPRlf
	 v8xk/Rds3t6Oixc8Qx9CMph6z9Rcw/+nBHqIaWXycI0j70VMjdgSSZZv655t/pMD7kOrqAqiYju0
	 695HbvwgytCG9CBH0mTj4segZsHX5wY5Jhs2URDUb/dHQRLTQmfLG0KYoglbezKQd4/CBN+SeBAM
	 HWnqcPtj3Y9zHNuLI9lZ36i2pe8B+z7doZBP9RLly8JqNN6VpZBEbINXQW/L4UesOudZCtBKuDQf
	 kTgEmb2T138zH87NxWZC6rzFQ/tBY1cfkhqAI2g0Bwa9yL03CzU7+vd0XkyIqrnb8lxaMjgD3w3K
	 2GN/mUk+g7IxU22hhEK8nWKlDh8Mi7zRm/PJQFaEnFC/0YhwLHSQ9ZSpDRYMiMPkmsd5JPt0i4pR
	 joTiqQE1fQvNd00VFnG0ZIQ2peyYzhQiKsdh0kmZ+XCOANfTKKqY9y1o1y98uYwhshrzYpTRbWqq
	 O8qv13yaRP9hC/rEpHa5mw9g1mAvkoX+GdFLcVW+jGXLb8v3k5T7p8ObQX9iQUQzBVZ/fpVF7zzT
	 M0j/2kkeWSvop11Bih3Vv16SZF2a11x4fpCzmWlMj3JUTAvJqK+lBinD0DFzmUM2lfCBVdKA6pso
	 HmaFIx1xH5jVseoJyJt5Yn51YX14q6cn3GwV2HwjT3la7mk7eFVdjMYS8Qc8pQRwhLfgxxXkNTQR
	 4tVbhnXqd8fDiru0aT7c7bT5/d9F2gZD+hjkkFC39qJ0KMJ867fk8f077vsZhBpQwQ+vIzP9VzGk
	 idEumq9GD5ZxqLGuBI9zqGpbwoVvABjWXzlYP7TbZr2ui7FXbr+dNwliuInQ+sO1GePCqt+X8F+V
	 GAMt5HM4YIH6Pkujba9x8ZJOMUcxpS+jn/LICf7Hm016scKckz6RjoQbT2AAWMYlWnX17VsagOOk
	 vfTXlXjmGPC3JjIPvTs1UPPxyBR7p9vq6UazeQrfo/s/v8u9gtOdZITlQNh5iv1coCzJYjLjp2Yc
	 W5Ze7PTJRGSKv7dwXVLUnUua47+15PJ9VdUmIs8EzWCQZUvpUV2kws5vrMR3g=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Fri, 17 Jul 2026 00:36:31 +0800
X-OQ-MSGID: <20260716163632.418500-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705135014.1004166-1-2254650260@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the EmbedFire LubanCat 4 single board
computer based on the Rockchip RK3588S SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index aa66a15be233..44b005bc709a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -191,6 +191,11 @@ properties:
           - const: embedfire,lubancat-2
           - const: rockchip,rk3568
 
+      - description: EmbedFire LubanCat 4
+        items:
+          - const: embedfire,lubancat-4
+          - const: rockchip,rk3588s
+
       - description: Engicam PX30.Core C.TOUCH 2.0
         items:
           - const: engicam,px30-core-ctouch2
-- 
2.55.0

