Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980908;
	b=3qG8/0yLkQzwTjodTjlJAFGhSCeA/K1hCNDrX5cefhfDlpqlp6jJb+TORbBUPgrvC5v0
	 LN6FyTLgg0T5cRq6WDgRegbf2Q+AzZ4lsNa3IA9KC+1u5SaDm568pSgkqHmDE1eBAdo5G
	 ftk/qIlREvQ9RDHoBcDa+8iL/hT7vcwmH7tqgzi1gnMbSdH8QOuJTVTZoozP/tM04o7bX
	 pYaZOT/xEzY1TG0lMlvaWr07pYE7ujU0rYvh0adKBYcseGvGEUGtyOoNcGLaC9qd5tj6h
	 JlEmyDy+5Zn7c36M7trW7l9dZLzMcvAhJUaEd+g5SNSc3DQ9G8ei9z4ahY9CT/FwRow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
	b=JM/PLeRlgUau847mli2EDC2LoEyhIBeuBPTB/zOllWe3R6Qhgc2XYUR1jq8rk9fVC8hL
	 IgYWCWq/syc/Nkd6SEmkKjhYYCJrsIeqDIMXIdj9jML0dENDmvc3aHny4rwl9r7NGTjvd
	 1pDnYT0I98oA0L4ZWs8YzuKOH2UwkMoCak2U/NexiRbBt16x9gmAHo2Hjz6rPBjrF/PrH
	 9520onSvtj7dzq+5AnwqxwlYDt7kGvO9a85aoQ4eEXvwHqgJZHQIontkXPH4ow+p5AdQg
	 nHomD7oLnDbswpS0ZbgepTYi1/NkJugOnif04t2vpx1sy7vklRxNws6XD8+1DOrHM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6aHUlsl;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D9606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6aHUlsl
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382c3c9671fso516749eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980907; x=1795585707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=H6aHUlslNz/LcqS9IAsiFjBsaJ3Jh9YPrT97RsO5i1BMC50yuk+SNa+7vSxA32YXJV
         QD0k051OLKhBuX65jiHxXQTYTMEMqGNm6FDulV6QW88VxUJfji6xpGAPU5lmLvbBXeBu
         PNuTtXj6atw5CBqtQVuFhSgatMdyTSN57gLSvEU29Q+xaYPF4/VdoA++WIrGIcCYdbQe
         JjNivEL8z5WFpyT2ynuKySidFJucXn5qUcLbIfhGxF7J/17WW6snXBHobw3/X6abs/0q
         yB6XjAksZ8lJFqW24cxBOCcdj8ippay7q3ctm7OSkWxpow4Y9vWZqEPJymjECLE71T+m
         KKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980907; x=1795585707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=uoiFe2C0Ql/1c22aLTFFfTjpWZtr5PpxczT/+8IBW1XpOVz6KUWPBtQsFPLvazSOXq
         zcB0L2vUAEBH1Hnn3ann3P30Kgz6y7XJ4UdpgomodItu6dgjb6mSavcBNY0QMJ9FQ0lo
         Ztyn6/q+wJJdJICiyHvWWJOi/+pcuGyPGDXliNtBCNB043RbQ3rz4pfjw1qnGU8slAmF
         nliVKeAbbhn8DnJcoRh6nOH3SZ6/MvMVeSaADNaikXkNJjRNv7MMCSruGisQ89zxKmQJ
         oyYxvVUbqlSoZv3s/qv1Ij88w1CouFRi3UXMo1c2odqD22QKpFPK9XHmP9JYi3hC05sR
         hnAg==
X-Forwarded-Encrypted: i=1; AL+hErF9vSL8kcnDc9gW9S/aRnfp5qmT85squvjQrC7u0675JoaILvJuTdunkws40Y5/e0uzGrIuVK9cW91S@vger.kernel.org
X-Gm-Message-State: APuU4Z/OiRVkiwAW4OtsDj7G8xoQJfiSac/eLmc5grFIIwGkn4Y82Hmc
	vRxGhpMQKXHXK1lGl1gR1Ad5YAe2MgubzVC7r+GscyehEsraKykvcQ0M
X-Gm-Gg: AZFdTZcZMpc2Y/raM8kDSc9MAuzfp7ULHBCr15tr9CMEG8VnD8H5IJKIJaK0NycBAAE
	vyQXL0nWv20fHqfMw19uy2DVtgf5T15QKPtKNf/37Ftvn0CsJhPqz1n+dBO947pGTcRjRwHtz4I
	6cIwvhu7BtQOWpuzBkwj5lBmqxRco85O4NtYctUF+8Z0mJNBh+CylM9lGFU4NtsZYQ8AlxCA1aR
	iFNAbznIumCthfrqillwk7I3yafn5oAm+/pb1t3BkeRZeXoOPRl18P12sl3ahMcSwtHNYQHjDCA
	24Hzgz9KY6FQeBQmDiJjYXbRxUJsaIot9bZ0rpiIe3CwMtemTtK9vLeaWVfpVwSJiMr6ZBlAM+0
	nwr/SO9WM4M2e93Ph7TijuSsewfepirHY8IvKNgWi/dO9mKUNymrjvmU7gP3Ndd6ikV9yKI7JNe
	9pBGsDtSP949prCBgRnSGAmCYXqRnFbFXZ+iylQJXJ5dC0XXN5x6vn1XfMbBnKpjo+y87wRvj8r
	LlBGT9EYsoLweJAOIktcafJaemHy4Q+lAH3hoyJfNbZiRkl33xtpS00pcDTlDtQun1SdmjrijNG
	d6MKUghtxOdRLk1I/+RRFh2acP/UcOOrAdCyWuES7HiQELlttzK+HCtpKuhI4YOwDv6Cx4cVF+H
	XpR9nH2+lAnwTbYfMwMtWMhhRpNJMQNuQyvW1H/w5S6WpU6D85vfZSsadSW8kfYTAxCXLZNc2t5
	NlJw==
X-Received: by 2002:a05:7300:1c9c:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-3827f9911d9mr1687099eec.6.1794980907375;
        Tue, 17 Nov 2026 21:48:27 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:26 -0800 (PST)
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
Subject: [PATCH 07/17] ARM: dts: BCM5301X: phicomm-k3: add nvram node
Date: Tue, 17 Nov 2026 21:47:48 -0800
Message-ID: <20261118054758.132233-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

