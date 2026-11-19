Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078532;
	b=O0f4gZoxBgqzJeL+Xv8/rqeR3ujusrS5IsxEFdd5EuYgBz6Cvgcw+ek5q8I/n9G2Rea7
	 IT2n1TzvNh8HLhjGPhqjLWIkesg9KLvudSvexOnNh4Na82JDAVb0aqH2mXcf1gaXnsenr
	 vCDdSKt8MoGasKxnDg9fGS55XiTUYpQth2z669IYCx7+so3y2AXtSSjbzQXnVLBwtYV/A
	 bmnkAl5CMdhiOCjlqW+ljNQSNi1OBBJ3g6CyRl/7wTCVmhCcBlytFye3EFVrKnuyO9swC
	 8h57NZ04c+f2Kf+Xm3CgFc+uqbaPmI5CjcK895fpShOmsyRfRlW7znpR91fTV7ok9/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
	b=z/IDRSoH6b3kBpttniNVoUGsKIchpqq2bWv7taPq3tj93RiT1iuJBTLqfJ4HVLTrNL4q
	 OkNaeb8x/gf/jvPYbT5gUSRZTc5OPf8m37HWO9eLMPcTnnTcczciaARP/PRiKAPfhs+Zn
	 rcAclIoULKgJROiR1n9MPzILAxnFbaIneTVL9io88LSCE3Szgl+MMvsKaygvG3VBNlyM1
	 DCVciUTOCAOUqCB9DvQDEkaL52sUF5j08XdFABD6dF/Iep9i7xN2hXbgn73wCmjho/kjR
	 8DI27otR6c9U9G87U1QTVH8I1uzTcIxhoAOZgQuimIMrWMpyBlHm/34K0S1SPi7Saeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmdA8wol;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91F606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F91F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmdA8wol
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55d360ca878so16017041cf.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078531; x=1795683331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=nmdA8wol431eGhsO3TSG8jO2yAJeUJukyZGXOn2yYhHdr54rDidL1+Zi2R5s1j78qC
         UV+hykH5RA3Q59RTXKGgDOrpaMXbghu3bSwQS4LWdYush+5cbKv/JV0V9Ju1FrVuss6E
         1r0ZAuAUs8DP2ezvVs6MpyKIAALHl9JvDOirmTk4XlNYDvsISisrfe71ahA/mni6IkyY
         D2x8K5in2GSnUdSbH8UtQA4yZpQaaLwRWfbGDVfwGf1zAJgy5LJ83Y8SDEGdWJeEdpSu
         ckqHqaxufFBrwZAU1x22eachTcFmqiF8BiqzBeAPoKT5eibYtsVAvAZhuo5gRsAFbSCo
         x9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078531; x=1795683331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=Gahe4BhzbY7k7nZIiDGPVX5IFOS1+tnLRPCtdw9SAabvLlynC5qsWWshKwu6uyv1T3
         VW2Mt2iJOltuysglPSDXJSRjIvbjZ2OgXpYXLjegF9JSFyWvtkg0YZ7QLnN2porMIMDD
         MZQPVkTKYclsFwg8RRpae6vs7JrOtwcFaZuCiVbQ8DnsFfnz0mX5TLy6zTG+sjECCDD9
         5FDV59fKcrdzvIBFpAT1K8dTutIateYfNQ6W4/v+Jq6vMP6uqSI+IoO9nPCLAobLKbnz
         6ZryYX9Hj7La2z7xAykFG15KOA4Jzqvn3ljvhxRu6ONQFqNMdZh1UgAr4YTFQKnka5FM
         7CmA==
X-Forwarded-Encrypted: i=1; AL+hErEBIZpfbfH2orOVZgn93m4Hf9WS59UWsV9iQ55kx6AE2zSGIXqUNZw7Nbkz5kliLkPn0UEilnFysVTW@vger.kernel.org
X-Gm-Message-State: APuU4Z+gAX4EziGX+LBGPLdrI+Pp+LHSgo0c/7frCogeL7mMKQiomqN7
	8r0CD/L961GoB3KsSA+H4uozO3pjA3PnsbEEbc4bRh4j37+O0HlZL3R6
X-Gm-Gg: AYBFou3LdrkUcC5f/T4mVCHHYytasu+7euA8+l8ft9pUQjZDfA4fdZsTazIoFWucOMP
	8sE9q7DycUNzW81U6RzzWBdClc9/XoW6ZL5YMPrgdWgJeqLPVicTl2CKYTZsFd9Xbromz1OJ/AQ
	lNsHF45waunBn5luIggmMUQoiMbb4FNisIFM7JPl6yFtPqMFhf9rS9FCauR2NyZNFrMHzL7Kmft
	HNMoK9pwd0nY1vPJytfNJcXJhIjh3B7LlWzflHzgoq90g//g6mCUUqizYpKtO9m5IX+Pt5F+JCw
	HY3TIEw1g6+GlCl5YgTWKu5wdsuhlXxavoo+YfTTD7fLGf3GGVi6vLeNrrt5kIZ1lU1IdFDz/QQ
	Zr5ImD7dD2jLUHjI4gE3x3jeXp5nf0RC88abFC2FzxBZpmo7xomzeI6WAVxbOjMZDN5/tZ9NSyt
	iqTeNT6CdmVgs7n3+Fnbtg7j296myCgAdlYj2etVP6pfDryxDr7JanYcXWwpwpNniyypfVRkEMU
	1OxY01lPJtSHddw5Fj54O2pn5vaWylHQol8BjwvfTWvKrJ0JCdnlW2XDTDjJMbPDbhXMtf1ih1u
	5YwksfCwH2dFvvMjPWt61mcdoDYLGKue/Rj2nJ461yODdKsk85zO1u/C8hO/v3E1gCoXFg6UWnm
	3O/4Aic5gux85zuDSnKxsBwnOWsnu79T9DwRr5Vu9+3FGG2h4AbI7BHxHz8jr5OYaDtJ0nmPply
	yXZA==
X-Received: by 2002:a05:622a:60c:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55d5a6df535mr86532551cf.68.1795078531303;
        Thu, 19 Nov 2026 00:55:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:30 -0800 (PST)
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
Subject: [PATCH v2 10/22] ARM: dts: BCM5301X: R6300 v2: specify switch
Date: Thu, 19 Nov 2026 00:54:40 -0800
Message-ID: <20261119085452.75708-11-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 1b99fe442dda..2d7bbc4ded60 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -104,3 +104,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

