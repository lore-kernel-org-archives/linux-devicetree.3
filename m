Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078526;
	b=iZuvwXKDSeZ/ogkhaLKRRTezP5yQSS10XJtRPCK+F7ZZt1N930bW8VAq0bnenqUS+uGC
	 7s4nh4tASmdj+NUr7mJOEg+YF7knszhocX4US7dPolROIfciU/c//pmdfhGfxGk8gNPkq
	 fGF0bEdZIJBIkzk/sdd5OHbSlZVAcCccVyKeNTiECvhDhhY1VqISVOhL92c3dvuRtxdoZ
	 w1ueLKxxQq5NS0VJUQbiUdWpxfq9rN8oCgNO/CR5JpkSjcIZjjYOAnfIBnExSAGLGiQOo
	 iY6SHk3985BLnGP/Js8Bf8U8rZU0x0bTNvtixG0Wcmsj9HVMi4foeCr0KNmdSEp4ZWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
	b=CjduR0vpsIQTc8+6cjX8i3FQt+j4V3YlTSMg0XPM3R4DDwtS9zY/W70+m0SSwRP5lfmc
	 IrItgS0rqIekvvIATc6lJeZ8oPwR5Ft2nHdYQ4uK7LU5nMBlP9Xoy5QunvVJM44+BuljJ
	 jVZbBUkj5WWqIsoYUDhmsjF/P8Nez8vgiUTtqU+VXgfxrnSW1znrhqFpVR6CQ9z2+C9Wg
	 T5hy3oohVMpIjc97oG+a0lQyE5ayIsh+IlpiP8A893eVQAjAEJd1R8Nqlh35KKEiZ47I4
	 5lL4oEYyy/tqp0cx0p0/xqoag0jAlydEsXNwvnPlwzErQa2Hvwd6HT/eEci8R8z4GuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvmFyh7k;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB318606A331
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB318606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvmFyh7k
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53669f7b518so20847361cf.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078525; x=1795683325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=tvmFyh7kCt2EX3G86HZ6JxWbhcNhXN2oCdmYK4U8h/xZjwrAnBOJ0P2JWW7nPC9S43
         Ynor2q+huMVTOm6c4iuyxYEzv15wRP+Y1ulmIajKuquxBpsWVjN3tErF997adcatLgy7
         gApwANv4DasDNbT2+YoMceOnTho5fpM1PS7q4UVMVF/NDKoehaC9CDxjaZLLdaF1A5YU
         I1kTiqUZd5NgV2MOptsL/6CSqItaK/0DqVPT9f/h4HW7NqzydoQwAEfHlETrVcSTDsYY
         KN0E1fH6fF+Ejfw0WEALGCvY3eAuIlMChoss7LHmJxCGAt6SO1NE2g6pUdohZf81dWq6
         FV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078525; x=1795683325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=cCx89XQgA1QH5TJrMdUViLmHU05jAM2sHYJNPCd/lD3CnnglBzaMuYZ97nsTRBlaEg
         xlCXokYvUXkgN0fEFMrDRtGqfSAKxtv/N+xpjOMkhHnXOp1D+S7i8QWO3ozOScGJhOQm
         i90XuDDb6oVtYZi/GFlrCjkfNd7SYelojcTF0De7OZ9JFkUUDFzlmegwSqHOzK5srzqW
         Ysc4grsx4aaQPzmmYjVKuGsMMQlnmb0uUMfngLhs8z3yYBkP0TntvOAWore+tDqLmXYY
         90X1BPiKJC3gsmJ0HBZyYGSV3UfQnf+4DnMjIkRMechkJ9Fa+pFTC9IWcXBY/lOIMM7t
         r/rg==
X-Forwarded-Encrypted: i=1; AL+hErHE+91Ue6wToJ3+lw4huKTkSAeNApe5nyCgEcJJsuH62dhjffh8Ip7Np0lkICzIlbps/YA/qEQz/yNN@vger.kernel.org
X-Gm-Message-State: APuU4Z8YPXAyxQK7MWmxy+OwG7eNbu2GIwU2hY2gFFMjzB+QMI5wnK+K
	xglbBHvPaUaO64WfNKRIv2VIVTmgBVu8RbMAS/FEOLmZ2dg7RQ7mshJO
X-Gm-Gg: AYBFou1pnm3cNeGq2tHuAWGAVwWLE/jM9b64g2ZFcUm9Sr/1pAEFK/kMWaKM6+uhDBg
	a/Eaw2X+OWJjQ99M8lmvUmi39QTE3BLdjAzR0QsD/ian4Vl1SjvmCORHdq2xozzVqb9yTHf/4Q0
	8Tt/1T4KVNpgX3F4M6aSQgRWWlJXZH4uu74j7HVj9BB8ENiaz+s9FV2tGE3i3/WlERIxFSfTSb8
	AQcAG8+4wfaK5xeOcgcpyNppdHj2Cxsv4bQr/j3+pfpRoyd2W2HAJqG6dlJezXsw+77iCGzvDxP
	RGXbIJsWyyBEhGNBLk21EeNSN8vb/sXM9VRpIYuOKzkvzsQ345FGbQPA/RXvfitl3RRtZZf+VVs
	ZBL37tukwO+z8cagFbRnDopUTWhbcOJSv8mPWb/2nD4Anbu0RjRcmVfYlFnnRQgQfge56WKECr/
	CzBxvG72MG5dsIN43kiK/Pc61NTOF/ITF18hVjh3HgszVB3VWGB0o51r/2UWWi1jA+OxS374YYG
	m0vy450dv7C+j7Yoj4ZoXtZXYazAMdX/pYeYbxJeCxEbempQzC3nhP70OuJYfpAg0yIv+AziT0Y
	OttQGo/zcK7xIrdE8U9V6GCoz7ES8pDeoYPM+W6KM+P2hh+y7+lUk564i1m6gtddhymeNpLZEJh
	SkfBrLq2fMQP9m5lEPS3T6earQFNh4SxH6kTyufu2g1IVgYbd4L0H6m9bsPRNFN/T/NSGvJhwZT
	BGgA==
X-Received: by 2002:a05:622a:488a:b0:536:7e72:2084 with SMTP id d75a77b69052e-55d5a74cf49mr81289771cf.50.1795078524674;
        Thu, 19 Nov 2026 00:55:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:24 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 07/22] ARM: dts: BCM5301X: phicomm-k3: add nvram node
Date: Thu, 19 Nov 2026 00:54:37 -0800
Message-ID: <20261119085452.75708-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

Add it and set the MAC address for gmac2, to avoid having to handle it in
userspace.

The nvram size was taken from a boot log posted online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index bb1bc4e61bc2..5b9250976f13 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -28,6 +28,15 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x100000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
 };
 
 &uart1 {
@@ -38,6 +47,11 @@ &usb3_phy {
 	status = "okay";
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1

