Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729488;
	b=RixXypXu8kZoWQHikZH0Bf8aifSK9HmU0t6E9c9HCmySBq7yhWX4lO0fnCU/1WmgYZRy
	 LUZcNIlEQedK7Q84Lhg34l6jb/11MXfUwJlIomk4TEbSLLcjSeaO0+CAYKWdzGjD3QN9y
	 PjPtXLbDxZSeEZ5Bx/r98SdqWCZw37L98Sl4ySVseTTzd3PwTyr2ZSzOD3RN/NHkNhQGM
	 jYW94yFNw1cyxoLak6X64/biIMQ/qVfL9/CZLTR1aRCxjh3DlG8vPEb+OmfPVuySVTpQo
	 EjtekEB4zRKjw2WXx7I5F4NoQhDWrT5dKwIUf07812HANwdASwO6fsBGUHnom4Ndyxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
	b=RcqqLOdpMz9Q9lavZqURm8nd0jLhy4QvjOb8TOTT4c214olGIEHZbXO0bmsrG8ncTHMG
	 nCPZ/ueiWusFwvQN6DFerIgGKxDhU9eJ6vn/Pk/rt0ZzT5L829vJPwBw/kZLOlUA6SgAf
	 5OLy5vD83YexaD36QTwqH6WV60ocdljD4uaqkFUGBKUuyhwrMJT3iS/9MvcJLs0wzBVT1
	 yRyxzPlcwUOjJc8ARZD2BpWYVkVlirq8R9u3cbBzfVmmajHVz0y+nWDg0le0ZUqrBDA5c
	 yFCA2EmNiU/5rOKPE9xwDBMelsx+KM6NTvrwH1sCDms4InqFB0kZnRpqz1Rk55t6dkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OH0wo1sW;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233AE60A2600
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233AE60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OH0wo1sW
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4382068f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729487; x=1796334287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=OH0wo1sWbdy84nQOkig+XAitRe4WjdXHs9CQYXKGqAwSHt/oWOqXyL0L3Um1rirdQ6
         ffwK7oK93MPY5ITAT98GFbSsgQV6pGQTjFVdTDl8w6BIHftCYxcZomec4tZP8/D5ocyR
         hTvTJvk3nHMdePQlfnxGgGbn5L9Ku/5H3TIu9pCFqFjByBQoadpduJrTD7Isy3+OEa1q
         1C1QN66I4a6pYqO0t1HalPH4OrVv/YWgmBUItFNkAb0zg9EN3Q3AUuQSLfrVVyVorTJE
         Z+rRZuim6qClhgxsj0xMEFEl9uWplwzHkZTuZOIJduYBwFW5qRI6YAsTjdnAlXk33Vns
         Zy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729487; x=1796334287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=Etxrk4MgLzUoeIYB0Nl29jmsqQIUFHs2RV4N9XRZvS4cZ61EjXHOK554B28D7LiGEA
         WYlmtg9VQIga1Fq21mtDW/U7+fbo4mPNBzKePKFTYy2ERMnjZ/EhXL66bRGflPiVpF23
         W26LriQVRWnENpfgr2Z7W26emSNhy87d4e1kG88qUUzG++4hUijw500h0AcjxhM4lEzn
         iM551RE+ly3nHOnSZRVu42vDGrbYd8zCShlILL7G9vEfxRacP38hRnJ1Sw5s20XXAq2G
         +koQstV9PrtdDFaQpbobPMZikUiycsyMB1U/p10jEN4dlhZPgx3DfOP192ArIhixmHMg
         D6vw==
X-Forwarded-Encrypted: i=1; AL+hErFP+EYgnSaSU17hlIlWgU07WdXXf+vZiorLiNMs1HKfhqh+R8Os+4RvadqqbAHNP3D91Lmqf2g3d7XV@vger.kernel.org
X-Gm-Message-State: APuU4Z/8HY2KofzkZPgW/CILVHc+KelFuvU9jRRw941Bm6Y/qzqTP438
	8srQg88b/F3ZwX86j+0OVBJkZaGRgpbuUz8mS2sUA2Qm/b5pKsKZ0Qqx
X-Gm-Gg: AZFdTZfIxAtvr9zS6IE0NrUm1Ou9RrZxjc75HgTwoyAoM/34JlzEgb4z7+kQeFUhP4B
	PpS8eEHXcDPlOf6Ccblxe5VBSLsfZ/cjBuAvWKK6vNDJYIPOXtP6qIho7jBRVrg4CwJRESCZMBt
	Nlrr4SYYRly8Tlcg3mfGC0t5Xxikjpw+8fc7wcl/HijkagWEXsWCqzY6A/H7+aZyB0Z3cMT7dWQ
	tzwbaVSnxjJHHMnKhpzx+0B4k9H6/rlj1TYdb+v05sk+hEz4zWKASAKi04nUpVTD57g18/PZItO
	Iulv+dFFvY61U6nhst+gdxLv0Yb445NSN4rz4KzoUX0xQJ5AvR8YQCT/gPvQAukqbGjpuBEyMSq
	jxofr1mI6VaUkPO1U4CubM+oYDw473+V0ehHE6T0XM5pLuWD1x5C6Q/E2UplEQxLAbW8Juuvr0N
	tCwo+ZMyZqQ+fB5bwhU3osuL1Wr2U2nT8HJBvXtfDUW/SDHL1QMbalV+9oqwQPz1Mt6Ovgr/3e7
	8FWLZrOH4zAn4P0UDEAMj+XcEDa9G16dboqdXVGf2kHxZtlfD/8QUDJ1u28qEZDG67y6mvF2RBK
	i9JUn9iwQaGVtnKly3bsMKM3TQToYxvz3clABxYS9nvadgSzYoPj824h67je2a7QK3jQqJZoOQh
	sN/TiOt6IbyhecI/3Q8VxWWJukI7lOAPgF6KtWcBuosJwkSktuVnJEMGaPRICXxiS1C7s55fzH8
	2gNXapNhXF0SzXuKZbY1vq2b/lkkWKn+sjh2e3uyQnGb+rbY1EnvZgN6sZZ6QGtEFurcgNmHrYo
	Vdeb55ZEoBc/H4xDGWlF3nsFqFHYvqumYVhxpL4hw==
X-Received: by 2002:adf:e189:0:b0:4b7:6a63:89b2 with SMTP id ffacd0b85a97d-4b76a638a20mr20363316f8f.20.1795729486620;
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
Date: Thu, 26 Nov 2026 22:44:27 +0100
Message-ID: <20261126214433.3562326-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

TCON TOP selects whether the LCD pins are driven by TCON LCD or TCON TV.
The driver never programs that and relies on the reset value, which
selects TCON LCD. Since the reset is only deasserted, a different value
set by the bootloader would survive and LCD output wouldn't reach the
pins.

Select TCON LCD explicitly, like the vendor driver does. Nothing in the
driver uses TCON TV for the LCD pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 5ea55a2844a7..c7d03c37fd6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -226,6 +226,8 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		goto err_assert_reset;
 	}
 
+	/* Route LCD TCONs, not TV TCONs, to the LCD pins */
+	writel(0, regs + TCON_TOP_TCON_TV_SETUP_REG);
 	writel(0, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
-- 
2.43.0

