Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425830;
	b=h2a2JiHktDYbVqDISTRllpuXGL5atfJcnCyOy2vwjhyCDHeuzwSwU6/y6ABIg5NKFYUb
	 JbAqp+PLk9O3Xkd7FHWvLfflOMKWqrWEo/1fFJGp/pgAhBwrcP6fLLoVfRhzspPWrLYrB
	 YTRCfnAPxoPM7pIFOS/GDMOJucOnD1KT732pNdEZcMSnYH1BSmSl8W5t7u27kE6xd6prw
	 8EzXQkKxHqmw5VRc/TztENy43bf+qgoFWS/2QM/XrxMiCazAkBrPvtbIiT2kvWhGPhJvg
	 cgnKMmru1ZrUdxiDa3RCFQV+eKWuKf8iXimPfLGIp/WE+d+waIp38S+pMdtRvLZWj/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
	b=GMTk8AJTZQjXDIepYa4qiK/gw6OUlxv08dL5reI8OwIG5p4h5twkn5x0My+Y7HlfYn5j
	 HWb0oNR80bOi0Uft86sAPQ2tI9i4E2n6P2W9b8uYhOsOE1Bx1jWAjhjoDJ9k2Snvf2WEt
	 wGStvoKBE10x8qLE6ydfiXUFLIOB4fNEwaiPv2zshGfqqun4b07PZX5SX3RV9Lumn901l
	 3gxDRYVipheuFDhR85hAZn8xOz3kuM+xa0Wi0cnmKbwztjtO3xeDLgTrS3Y+eySv9kRTf
	 3/3ooqexyOsNsE1VgWMV6XabhJkXWGZRpXD6A6EDeDRFRfyB8vLkHRh0h8LmvOz+Qyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68AD606A681
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68AD606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1851611f8f.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425828; x=1796030628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=BXpTUxX2De0BQxbcL/ZbS9dBhDjsFhMj+8T9ThbS0Mzo42yWqmILbmSxz/iv29e9Hg
         GgpzECqIc7dFPXNyXmJYYPrpwNXyMwFpwgPY5GwqPKiYaSOR2ZHDdsZwNYX5/1syY1R5
         KKbv1nLdvakMAsNWbwhLQYFk3ykSuHhmNjhHY+cjm54NsUzUXZcgjNma/AlF4AE0lb8v
         DCTe3qnSM/jAYevI9JtGLW+tsJMEt63w4M6yLKUGCBjzjLbFggHop1bcd30kMCu9berl
         axxdrSE3dsEByZBJdplS52mRYVxBRbNSnXTi8lxPtPjFZChdPm1EwoydwWq519y+HdeQ
         9l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425828; x=1796030628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=fNP3HtOmgBovfIRIEJ3PdjSi94uNhesdf92fSIUv/08JeYOZ8YNGHjUD3eTOKwldVj
         SW4JgQ8ayxw41Izqh27NNEhgRy2KthT4b1vsUSXlGSibNV4+awYeujyNjqmxe2UfsTl6
         vFudifd8grZqNUDCGoqS7sAy2Dh2szr8awqmutT3R9Wxf919aTyi4zwc11W4oP+4zp6E
         UuXn+vkbzRJt9Oca4ujFrms1GGl87NfNpGqsIoWPPQPxq3LxJAyPkRR03nwE3bPSd6Dq
         HvcPfzGdRjWiMa8pLz+S2WpAHNBlEkt/MFR9dETVV6OUAaU6asCuAVMA20UqzZh953ta
         wTTw==
X-Forwarded-Encrypted: i=1; AL+hErE5/GzuVL62PYZvgQ/t1ouAqUcrEv0hlt3VGe8fq/o4uG0wLvqYvNheCsA4opa3GQeLyuNHCKezt4AC@vger.kernel.org
X-Gm-Message-State: APuU4Z/wBLd50Q300fwtzHlRtlkNrahEW1F4E8ggtygk71uphlqIp9Wm
	FChFFo+tdbQsPW12wDdNaXHUDu3njAM4DipIj/QcPJGZuPj485lXZnQw
X-Gm-Gg: AZFdTZdr0TxXFHUOiDhoNJJMtj0r3sm6HIDWcWyImybzYCXlqXNvcHUeQcFv2qYLnbc
	EOuChXgxOd54mqd2pdkOqF14u7b0H5vAYHUYPthuUF9A0z8FLeqvKS3GL4kY1cm0r8LJAH2beeK
	hb3d2K+QoVoFCFJSN9xSZIKDR+bforl+QnZWEHKIG1FQlKTnsPbPRziH98jbP2G4TOa942mOd8m
	8qerFRGsmZiq9c74ybqv9nFjTZKcl21W7BjJ3CAKHP0qvtsoFFwx0rCtWUVQdpU0/Oz96SdWjXX
	147dfqdhnINdWckesu9qpPz/9VWFdX619f1JmdXCGrnEvQbwTVhroOtLcCoDaHdPtISQdwdsfdf
	feKP4AODzhgqHphB7AXN8ShHcuBxJbMjeUj/ThBcwaXRGLpOB6mrUu/106c+JxZ6hPEetovfVVi
	zAz9KSheWOjiTOVmAfEq37UHaTKoRAKYbJLrkqwv13uSQwK/Te6y4kt+Kj/ifs+0eEMmaP0pl36
	fVuPhsS+hbsz5kugUTRaee+K1UO7G77Tlt2F8spDTifdBa22i6KZvRKWypdOtPZ18168yPyQf4N
	sWsy6MCGCY9O0tZgHrcH5Ivxt1g7z7aMdmreTcRFmDaWd4K16AnaHbWdSJVLVYI2VhvpO+d1ta4
	bvEXrPnxQuPnQXX/pfxfchpl+5sDaSivsxQ==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id ffacd0b85a97d-4b4510c5231mr2688118f8f.27.1795425827893;
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Mon, 23 Nov 2026 10:22:39 +0100
Message-ID: <20261123092244.1792040-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..f62e3ed82257 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
+      - items:
+          - const: samsung,exynos7885-dwusb3
+          - const: samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.56.1

