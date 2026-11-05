Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887563;
	b=n/Z8wi7CLvOHhQpENG8q91gSsLEgR2m0vs8NS8MntwO2WRzXP9JZ41CtcL4yfLI40i3m
	 dwk7mHQNn/w85h1rRRa7jbP4ZiM9pWB1BwESWGnP0X+QlKdqg4ziBdRLPkX4LKzDRC39v
	 8QGYH+MR8YP6c176FX+wm4ZZNKoakHh5TN1jVGz8Xzci9wRFFXNP/dE5zyZ8YWdtWeq1E
	 GYaCmTfZ7rp2PO903ViGF4QQu+5B/4Xm3yov4TRP6wTvZGM8pWFoMgVkUSvdCJmOqqcJj
	 46RLm/POJ9cGrCX5kkD7NVGSTsqCcj1KpxKjlxV6obrjybaVBB1YbSs90Oc8sh/5R5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
	b=tMt8p90aoqhU+Dxc6DKhQDi0oZGbbnFNYnO5cCeUaYIsa3Szy2dT7ddVjMpo/rnwuEq5
	 e6JIuHjiFR45qxRXqcd6CIpA/csVCDvEWMOx4/KVwh9ZIIhY4v/7wOJrbX4aoq0HHhJaV
	 G6zIaPBEuPbhR1hoEc9Mk4BBS6SfLdk75lPJbSzWvZAals3uLtXqdCwwhRX3PESzn9q4/
	 ncTV3C2TKwLokFEFJNovvwDV1734o7JOFQrpRNsHloEii1paoOOmG31jcCzAdqQ+7Domr
	 GSDOYW/I2qGRAhl/cl9TNRPu/2ozER6T6yG70I0OnUsUnVKa8NvdAdsUFYMvVMXKl2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdmYwzJE;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47611606D812
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47611606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdmYwzJE
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4910b863b84so467931f8f.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887561; x=1794492361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=HdmYwzJEZlhLuP8KzIubtCCI+KKp1Ul7qZkS1Ew10px1p64T2MjShRp2ubhsZ4vM84
         4/QGyq/LcQpeRjpjUkDiMXG0+gs/AIA4TcXoYR+yL9vxPACuMcyPgD7TZNs+zgHoMQTA
         1AHUfyvf2gOLAUh0Txcp+YsQVYGEpDTCWRvW0Uk7CxHzi4aKFrhKNhVhlBXdBTny/+rb
         lizMIpTer7pC3rPiozNGWaH42w6Onk/ukS9g40+5CCTo50X3Q20d36/YF/j5J+NcBnPy
         RmqsciNJvdFM66cAFBuTUGXXMauRQ7IZ5+0sNuavmPpvS6LT4Fo8XFXi1p5oDOwqQMPh
         D+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887561; x=1794492361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=PcApgaKYjAeJ26Jz5luEIA/5osEBE7y43AtexeshcubgmebwdNLohwluCtv6YYwXpt
         /YiUg2ioBh/q72lhxtL90qlucDmFyXWvc5gC9pJ8no9Edu0KhdTPo58Pju3bhSlR7oZz
         Hwz3JEJJHy3cQp0bfNs55dvUo3vdws9x7Zkl0ZxsJ9ebRk21R+aXRHVOw40W49hdalzA
         EgrpRP1k+n9tEGG61ZjY2dmSdi6+VOuRsWi9n96lEofl/gTPj5bA4yIrzJSyxgI22SFM
         olC9Fa5nAy7nlrM2PTazy4KIsg3EG/4XW5dmaSSKX8PutYuzhQZkDghV6s8cVvkbzoT9
         RkUg==
X-Forwarded-Encrypted: i=1; AKwUvBwYsPXvcMo2onq5hDlYcLh8v+y/GHYSdjMw8qAACQfHdjCDHa5fDOJ/TFTW3ypgvbJDXQ6efFsYt01t@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZIm5CAOpGr6IR/hjZW6jolU9h+ZyDJtXRuLwcAEutrtcNJOUY
	zLRDSo8/6f9I8ophZb2prPppNV+yxROQRY9najKsIHi32Dq0JKgdyL5R
X-Gm-Gg: AYBFou3wKRrgdleLM91O8VypIOMkEDSQa8joM5sUTYnFkgBnC9VOUsEzWTj1FvD/OwH
	HT2bwIJxQtoMrmchsjK8jxAzM1guWMWn5/sxAf7LOlDMk3DCO7WMbQSHnmvKVXHtGy8X9r7k1AZ
	JkMj/w/4x4jvsOC2OAVOFOOKLTurgO8O2KkGDf70guyoW9un6w9/ZpldTpPfv6cXgsoxrfVDxXq
	Xn77Q4587XFEIcekfK5x4ZzxlAD9JpK2/V5N52NbVugF9JYbzyN1j4o1QWPUGlI+QedqKAHWNXc
	ZXdmuekk1+4mh2AIYFIMMgY1FvNiDXK0xfif5J2P75DaNc7RpQb2MX29whR7ulB74S7knGOimle
	rKDB5Le9nhvyf4nuGd8BD8GnOxWJ6qXvMcjlOA+TWcSACCfx5suK0JTGoF9/XQX9gKiPEHmst39
	6NUjiowSYJlc9b+FLdqxG2fBA0Euf3BbLh2nq8RENHPNqQaiDyIFbUu/tPwkLIdATIfxZFbDton
	iTo1N3ga5/PbglqCpYJSWbq67VvBvyiOzN0IM6ep0OIfPHeraVPtMvKQNsuj0mqCyLV3kZzDtRV
	VWSTTIYBtDyB+41EXF2oJmvYJcJnY6iguTzC4V4mniy+AbsfeQ==
X-Received: by 2002:a05:6000:46cc:b0:491:1468:a504 with SMTP id ffacd0b85a97d-49117491f15mr3215686f8f.21.1793887561432;
        Thu, 05 Nov 2026 06:06:01 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:05:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/10] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Thu,  5 Nov 2026 16:05:05 +0200
Message-ID: <20261105140510.165165-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

