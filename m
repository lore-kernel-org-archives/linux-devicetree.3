Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841848;
	b=LEQqQAUqXE8xVmOrgEYfIFdplal0ah4+lQkVlzEFo9MPsSbzdhYgN8Lxuny2ShSYFiEL
	 RBi1g/oU/RVq+MGdyQ/MFOJr59QkPHe7H2qipkcRT5b+TO9HkwILz2dnLCOM44TruBYie
	 6hSAa38HUnn6Hjfk+ODch62rXWda+k4o1DfBih9Ck03ivKJoM53DqTR+C8wFFnZXq8P+H
	 JYTAJex/B+HE+/Y96VA5y8Q89a/7Bq9uiguO9HUPPUuZ4+fEimKw76BpPLLlFCV1RP42i
	 hk5M6K/OttGRsUlQ8vaVQClGgx9riZbEHj1VvzirzvectNjfbnhrEKNG2ovXCoJDFwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
	b=jmmdavtd1UIEj4PAA+iqlaPEv8uunbKXEPtiG8kXRsJ4bx9bJZru9OVdtrJWC0GFlDVt
	 dxp4MSgzTiPt9p7sbsEaLl5ckqbhwzccA/J+qtFir1uxgNVMFW6CQR1f7P9WiIRsHN/qD
	 aM+RCeEkaxkrGvpyY03LLQVpM+rN6F2Sj59i7KDzGabzvUzf/q/P6O59kA24ez1tRr8sy
	 dcYUsKOVLTjqGoYwWFkYXYP0S3Gs+bZbs+wAtiWwnt7pjmru7jUBJdMhM0wyTlCO4QSVJ
	 yy/1FT2WiyJeti2J+7pTVGEbFPvNeyS15WP58cIj6+WNIoiBXinje/acr3VWSrQPfLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aU/zSNlB";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A45606A33E
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A45606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aU/zSNlB
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so574927366b.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841846; x=1795446646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=aU/zSNlBarxiJG3HFoMuahCuEfQ+zzg5jL3uVMD/T7px1Q9qIaMuWpd6H76V0CFIqC
         Zqhx2k41sN4GbI1BtizlBJ9Ut+4vB5IEi/nulPCa7aMupowAUeiucrdtvEiF/frfK5K+
         0L3x7Ddvb0/tHTGQi7E657iBmpa+OV5Fb4/MxxTHuCxJCdNtrW1jF5oxohTGAk3hhfQK
         nz7ODdVhI/ybez8geGlgOmZeX4BFWPUPjgXhrfcPgB1GlMJ7WCJQ+TWUI1wKkfeo5/Ab
         oi4k+mrNUnyx2MI8cNA3tM5VwrWnE3RxayFaSR8L4rbDMDw2/nbH9k76Nc1wQRA1a9GZ
         poSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841846; x=1795446646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=GNtPGeyAuHmFgqdPoNYKjCHnC7d45lRDUY2MWGPiPDhDv0T9VHpPd23JkUwY7as5ns
         8E25lccF2tuttOZarFZzNzqu4vvZhNZP4akKO6stnd/lIRO6hxp08YjU4TBWjS9wKqos
         iMTBHELpULCkuHce+zeP/Ugjpvc33BlPgX2dAigwCYaILyGbmZ1hNlOK6UljILTMotbg
         ABeBaKHPqVKg082JWFY3aCib10JPCa6norcz7/W0h1FglEehRazWZguokme6GdvdNb7s
         +fZu9KQ01GjNgikZwVO71F66d9LJzi9+WZbpQI4HATbg63SYr1FNXjNIXkV/l+nOYaXR
         d38A==
X-Forwarded-Encrypted: i=1; AL+hErGOX9dgSytuM0J0e1oKm5HOdQqFueBmGQVwXW7ceXZKvNYvTiQnMlyGFlstLJk19xmxqx2qjcxTaq6r@vger.kernel.org
X-Gm-Message-State: APuU4Z9XJN+JdFOGZAzOL/7qcb9Bd7o/LQ5bZX547j3i382KpqWuMxTG
	JaPJyWBGTMZq+h6BclxXVRx7CcBXHRZo3WcRiX5ocCVQlZNwFcYtV319
X-Gm-Gg: AYBFou1WPHVFCehMOrGOI5Jd87l/CbhAc9bKWlZwsdHSVSUiZukYvV4lC8bbAgLdO95
	koMOBgpQCym+ty537NNi758foL0BLz/krx/HJcL8+GqwvNWhjAVYrgzJ31nYe7wmUAM4CfrY0J7
	lr2G3aS0Y7leBWAfekLR0+SivFTgZLoCCL+7QmwgALsRmqOjdB2FiXVQSJ8gly8DB+FjvR4NZQP
	IyCi0SUec/E8SmHrnFubpvnr4KOjCqXKnDLy55bzX1GqOMXIAYQpOO2+3XZIH2eItFwY3two0FE
	eGLLm5hN29Tu4uKtiVMbg9fhtMH2W4LG0XwgjwvkxOH0BNz73PouJR7apHerObY38h+h9gEPW3a
	/FU3J5vhyizsfarI0h0PtGxDhNvp8i+BkCKWuzwlHoMWWtTm+8+LFpJ7jmxLEhdlL3yYKikhx6p
	3T5bZhxyxZOgkTV63VZFbZz/sB6XlnN6J/+0AWo+LdKdedfjnIqU0uUHn2IXx06cIqxRL616PHo
	gqWDN4hFOqUk5jKBx2mCRBI+KFxeEv5W6UGiN38F9djnN6cjGxkMp1zkCNtwz3RDhtKuv+AE/IL
	8Dc+dxd2isZjUUggagmeGXuEOvAiYTE269Qp5AFRRaU50dzm2DqT0SsrQTeyTCJZx8Ks9Ahfcb9
	tyLnqFEdMrg==
X-Received: by 2002:a17:906:7955:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c50963aeccamr886718566b.18.1794841846300;
        Mon, 16 Nov 2026 07:10:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:45 -0800 (PST)
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
Subject: [PATCH v7 07/12] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Mon, 16 Nov 2026 17:10:12 +0200
Message-ID: <20261116151017.274764-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

