Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446476;
	b=jQaJ43K9X06CVvrO2/CZ8cpdRgLKiZt24cYz8VWTuHIYDYEtEBjX6NVFouAOv75DCa6C
	 aRmPsjGCrl4l0nQxf31O+ebXSm01h9n+rp+Mqkoogai9z2tH/phvktPjELrlAbvX/7Yzr
	 7w3644JFCJtJhOJqfSvMREwUy4CkETGcE8ToYIxupToA3lwK9NE+lyIgAudMMGgtfb8cD
	 hJABHiZMOFbbkUfmWerTxI9if/5yc07BKovjBVPp+F2lJqGWfmnHnf9Afy+xKYTG2jIHd
	 m7RDjWp2g/N+qgLsUhJX9eOqdK3D6UCnJZBizGVUN9JbuXG71R6tyGObWaj5bGV5KAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446476;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D7n2/qCgQ97P8irJRGu6nB1i5LmlSzAkmpMLJB2fKMs=;
	b=q0tZ+5ygpxqTvdhajZQypBYkw0w8dIfHW+Mmuofut4/TnEbRj1A2aRZQvyx7sfvqSfAl
	 p/GqUM+uhiLqBq3tOM4282rfIEG0YWn1Xp39n2g3OpWiqHcpywqzpT38nRuFvunpBhsPP
	 X9kRk3R3kSatkfKqrsZSF/dhmU7N8YHIE8DIwd+ZNCjnjOIXEsMEFUGfXxsJKIrVtUgBP
	 xQBbMLOxI20EIPELRbtMn2ew0OKwiVLUYs4avK5yDVrO+QmhGVXC8fO/fsBM4/2/oUcBI
	 S7UFb52bi7C8fjMfVu7vOQNU014lS21J4k/u8DMCxocDz2aal/qFGtBRxl/ejD9wS3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dt0SyDlZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013A606A327;
	Mon, 23 Nov 2026 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dt0SyDlZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795446475;
	b=wLHnKX87RoRWquyCT7fCNgRJ6FzHR/hDG1iyTDkaqQk4Z8LA3xPLQ9BcUAFUU/zmspeG
	 bbqQlVJasRQ7DyzStqGibVHAcBs8hpf1X6rsHbnjhahkHanZjmxQ1zQpr5uSYgKeT6n4V
	 FBy7XkWxN8bdCB7p5z4K1eXsNOm+/B0NWfDdgPWWuqQ2ZcjadZjU1sdZRxmgw4ph+R+hd
	 qmeJJn57/w9qZRvNNrbXDr2saMQ2LKjWOVNsqZS8qt1vU9GeyV7PmFqU170cXx2+b2brr
	 xgl8X+Vk08z/zaOJn71WaglZbwr8oWaozcARFXrRKi6ffVQVcPRtNDp6J69VmIvCYyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795446475;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D7n2/qCgQ97P8irJRGu6nB1i5LmlSzAkmpMLJB2fKMs=;
	b=YE1ktghMfHfUeREEs9+bX9zQcdFn57swNZW9JIVOz0P/ZHvH7r49Gn49g0d01iFGfpgX
	 4R/EowKk6kd7PhjGhWkoJFJiEUk2baikh0QXm9F8KyOnGSOxw9VGbwWW66uIDki729Bfc
	 UELPHh9ZVpp4j9NvO7te7Nmxn+EwsPcURCYfCaOiw0eXyTPJupYrBxM0t4z1w42V9C5Vo
	 +8vGCPdueh+oNEoboXp7vNY+Uq63t0c20leb0bGBe0OIbmcwXCxiAJR8ciF7RBIX2TbPW
	 bPiKIcWveU0NbwgDOZ/qqlFhFjUI6RuWSbAj+3uj2krSdyINrzcfa9iImzVS8F3o/GA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 307071F000C6;
	Mon, 23 Nov 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446475;
	bh=D7n2/qCgQ97P8irJRGu6nB1i5LmlSzAkmpMLJB2fKMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Dt0SyDlZ5gYQUUWRD/obLZHt+TyncayVIhYvKW75Rejr58hnfZyo9B9BsrcZfus9a
	 QvsS9jnrwmeP2RLSHWMlwf1xJa/pgXrcWfBX0v+5jJTNa/Fmba3i4OGBWuhOyJ8iuT
	 ymAWB0z6NqN3VmT1+KJXtFsdl95q1+DfWSWGJqTszDkSTXdyaCh4X5a2m2qwgiz67+
	 UMLBfacdIKQa4d1LP0TJc9os+7rD1NuBit/Wf4vy+NW9YsKTEDPxXv88oYn6fVMn9o
	 1p8md3jCjmYnzayJ9flXjL1d7Fz7Cni6ab927soD7BElSn266GZJqA1jYJJaFe3J0r
	 +pd8/en1GqmBQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AEEF84C51F;
	Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 23 Nov 2026 16:07:26 +0100
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Mekotronics
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-rk3588-mekotronics-r58x-pro-v2-1-2a3430cf5f88@pardini.net>
References: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
In-Reply-To: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=rwVu4BEUHXmVQV5ANdnCfqg9lM0S+d24Qc9S/0M6UCA=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBrBFa3XDcIt+WFnK50QuZukoPzIntotu1ZUjx2v
 yLPh3oaeASJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCawRWtwAKCRA7Xj/jnsft
 6TgrCAChyeJsZMoPikMtXVSXeLalam5+o87nQLM6WlkednG5DyKmDPVwymGVm9E/BuNnrH+IvsT
 NgcycoMjIUTSp73GnCuL7atyz8Fu+m/DUQTnGmb6timH6CAISmEQlyqz/1lbCelLKYx32FEy+zb
 rP3ffrybSksv8xA/fLxoApZvuE5gVBEdJppQecFg8zmg6y2Jd72xJg3M/9y0JMVS8knpIH+pAmY
 XjuRC2xn578EZw4ZttfgeJgSSeV2Lh/yQ5cUYSgV3dgTePJH9M0GztmMtqP7SVvoJhgKsB9z7zC
 nHpSjtNCnzgJeeAd5p8PthqoLnXf+jI+eJNGwSyuBNVNKHAF
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

Mekotronics is a Chinese manufacturer of industrial mini PCs and
single board computers based on Rockchip SoCs.

Link: https://www.mekotronics.com
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f10..ddf06858856d4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1067,6 +1067,8 @@ patternProperties:
     description: Medion AG
   "^megachips,.*":
     description: MegaChips
+  "^mekotronics,.*":
+    description: Mekotronics Co., Ltd.
   "^mele,.*":
     description: Shenzhen MeLE Digital Technology Ltd.
   "^melexis,.*":

-- 
2.47.3


