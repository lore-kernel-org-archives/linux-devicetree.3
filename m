Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955804;
	b=TWSWFvGQ+R03K+x4bsFLnR+5fQEr3bCy9duPc0270RMs1ipdxyXCpBQzng7uPPFMXf6U
	 jdH8iTOzIT0ma5GjW2o6THAP6XzQShJ+VHgia2nKCgo+9K1LFmMmuqJuXX5ZhKmTTFIsn
	 VaFZZdxxLTJPOMn92YV4xlZdkFueYeLehv++0NxMFMNXfnQRwq3Z2syuMqndiqheQF0sX
	 bv1fboE+kZu7n+WGi9llMTUaVl4c6VS9T5sAHoURVunywFcxl++M06Tvji/2SMcVKx6ex
	 gwoz2Eg4wlnhnp9oZX/viSRO/7al4yI12qTMTeXW69VKusrSy8fSWGpehj+HLkjWOoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
	b=ZsRbxhCDfInkRjOZHS25gZUr2AX+0EjgnB1QwY8TL9UtJC+K1JerHVX+icEDXtMFtp3g
	 G92Imrrx0m9of6ZYCY1P82GlpLc0l5HgG1JktqqxWKZsWiQwQqYkavXohrqabM614rZTj
	 uhgRdTsk5QFNrnZw1hipV6XOlKD5J0js5bK+v13Z0hFHuYC+LR47GRTcOxQUYfQFPFA5Z
	 2QlSTAJqWgYNFCPX5P7vJft/Q31dBaku5ds9pBxu885nrUq6/zkYFw2pcvYs6mhsk1CUO
	 dji+vb89GZBKQzuY3xbDWT30YDb8pP9ho131x1kJXpe7y8aOXINo1fyKfr0OG1qB/7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q0Fs9hwa;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E151606A32D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E151606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q0Fs9hwa
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2275648f8f.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955802; x=1793560602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=Q0Fs9hwak670CqLDxPzzKRJKIZaYW6JUgI1yNvBjffOCRYqcnBbMwQCX2US2gfxfMP
         p4Y7vkImrqLb3aQI5cv4CsAMqChcB1144RY/vvbcLoke3UCCW7Xr5tc8+UNjjxLvZeja
         Neygjqt4Zdd1VbWy9i95C5gnHegqh4RvrQPoFjEpORM11n5rwdiY4K3wz67SG8layh67
         O67+v3EEvgrlSQKuPIKU/XWKh/545aE5vmcEC88tCZQTOc6gLl7jBBwEKAFhzc3ddCgS
         0zq1JzdIFqL0gVWnoMTbI0yl6D9abB71OqOTs/L6XOj7CErnAI3LfWoPmJMl2f+1mMNg
         WuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955802; x=1793560602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=XpiVYiuYH+y6XPLfzL4J+or50gfnkQ+/UDDwBu2PCR+1VHh8WZA8gDPxclLs/kswit
         y+bk74XmvhaAU+UhLnmhHlF21M2Aw0q+VxofXxx21qL6oGuvYGTsjYl+HuQshrE30j4I
         uNksR3QMeP57MkCWkrQjtTpbb/8t29i3dYStwjCpGKe2t+OIN4ez0e+3OhOGpLKhMxJR
         XpNVeF5e30XmGv/hlNvShV1j50RHyhKbxBQr/g+wJfVKqyV97/9qYpquo4QjNv6NgiMF
         TFC7RkpsfLKSbW9MtkDf5JzbVamMRJ8lHsdQPon82DpGuRFEM9igIHf4z99fqHas+gZB
         hgnw==
X-Forwarded-Encrypted: i=1; AKwUvBz6soGyxUBEZ7snieblVYzRssTOl6LesWPxADWgwQGsFFEtk9vHwmH+KNVG3U2+ziA9fx63tgtlcFlE@vger.kernel.org
X-Gm-Message-State: AFq9FYJV/47ZRg6Y53ligu0nwX/4vNuQFgGcVqZ9yVYU7p3QNBmWTrxG
	kyckZbnZfqff4FmQ3XH+CbKvs0mdKHT1F+6gkNFYXByzYVNs5sJgxjrneb5CR2sqkk4=
X-Gm-Gg: AYBFou2s1lUQIg1iPzPdavPFybzXTPtxF1M7OehZQwtyX8gySAGH7YIOgVHii+I3MU2
	hQkDSRCuPFurZ6mWIopbhc+HDahwtLCnewxbyafSxjoSTVhzoLWgYZCbPtYKFAZ/LRxb890nvBm
	DXI540Ha+DtT9gKjFKhhfmb1nRNeVZ2ImzQ0CZVK7KdQivwpmgtcybHrAkZW42u8O8655i4GCiy
	/f5G1YeLIP0gz7N5z2QD96ijZwfV7Amm7EqBCX+24P2rS/6xEUa9oMZyrO7ItLlQqJuU5ZYvTJG
	1fphCrMk8RHZ9yAPzEjtsVqEo3hwJAwN6/cYe4eKMZjDPIePZG7F7Egr+d3Kh+oJmvltFbn1995
	VHN48boUDpwen3aAwOeOiTphc8unj1jr6c+U8goHQOHTfMcOeYZRLXX1NWS1R8kwcd+iMTvH5+r
	ypyyDAGEvu8K0T9JQbpEzBteX1EcvnALTZLnxPU0DvsdG1iuNkkDCntj8oHgIsJrj2R0EHTBwUW
	+MoWIuSvkTCbpYKoul6i5QD4OZxRr9EG8KyKqwetARpa0qmDbo+FWEZMWxfyyrCoJOFGoATTR09
	vwv2PZdVq/h8T7o=
X-Received: by 2002:a05:600c:a08:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a35aeab300mr99622825e9.15.1792955801817;
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Sun, 25 Oct 2026 20:16:36 +0100
Message-ID: <20261025191640.13592-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..b5bb11c20471 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -722,6 +722,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

