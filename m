Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5E33E347
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982165; cv=none; b=ia4cLdClQ8jiT9JScZzUo7qFnqR4D5mm7DoOa9hvk2fsSvf1/P4jocjDCV0FSb3tx4xaX9UM/Id0KQAMjpFSkZmy2ZGnVc4R9Vzvr3KwvHuEasowTKC5s4xQHXAuXELYHKIhBGhj8l1KqueywAOR7QykMFMA0+jnJzIJlRlS4KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982165; c=relaxed/simple;
	bh=j6OqSSx2aAE0ayajb69kfsDwMaEUP9CyLjYK2ZuYh+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVhtcH+KfWXoxQ6wJFNkcenzsu3ykqc8+CTkUd5g8zJ+yYatdaMnKln7XvnMv0LeKZt0pTheAbjgjAiDpxZS6rvnQSOFkMRVxaKE/F74l2QyL5A7QD8Isx9BPEPi5rwRNHJOHEtqMj0EcRug8tu9/sRW03ah13KHeYYyxymjjqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWLVTMJ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWLVTMJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B91E1F00893;
	Mon, 21 Sep 2026 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982163;
	bh=QZ03ioRn3xvdG9RETx8w4IWr+FgvpXEKJ4trwwp7RA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XWLVTMJ8/lgN4n5sDmA70MnLSNhmZE/o38MXlbWhoEWQ4DVKPcw92ndAyV98Wo0PC
	 7W7xYO5gc5bsJW3K2pq4rKUnDIa/eA7j5DY26Dz94qWN7h0uJCGA07asfmul51/WMw
	 jWh2+RE+oDbyGHwU0FYaFwAdFWPSmDC6TXAr87ud0I7XM7dapZfVScalQGUQGwFtqO
	 b0lXo58MK+rNPqGSuxGswRjVGAAugPqClCcK0cSXoTbk1YpimqNMbaGCaS15IoBtud
	 QxjdNxq3q9rcC06N+WRt21ZcmAFzokEMDdylIX5kThxB9TUx84SB2zWaretzYr4Mgy
	 vkxlwNQO009gg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 11:15:54 +0200
Subject: [PATCH 1/2] dt-bindings: display: faraday,tve200: Use a level-high
 interrupt
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-gemini-tve200-fix-v1-1-8be03ac2a8f7@kernel.org>
References: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
In-Reply-To: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The TVE200 vertical interrupt can remain pending after acknowledgment.
Using rising-edge triggering can leave it unserviced when no new edge
is generated, causing vblank and page-flip timeouts on the D-Link DIR-685.

Use level-high triggering in the binding example so a pending interrupt
is delivered again without requiring a new edge.

Fixes: 8b17e80d9e46 ("drm/tve200: Add DT bindings")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/display/faraday,tve200.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.yaml b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
index b09628b69177..43dbe2778d6b 100644
--- a/Documentation/devicetree/bindings/display/faraday,tve200.yaml
+++ b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
@@ -54,7 +54,7 @@ examples:
     display-controller@6a000000 {
       compatible = "faraday,tve200";
       reg = <0x6a000000 0x1000>;
-      interrupts = <13 IRQ_TYPE_EDGE_RISING>;
+      interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
       resets = <&syscon GEMINI_RESET_TVC>;
       clocks = <&syscon GEMINI_CLK_GATE_TVC>,
                <&syscon GEMINI_CLK_TVC>;

-- 
2.55.0

