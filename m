Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB421D5B0
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 23:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774741215; cv=none; b=pW9m0KRb6RYqN/6oz5H/k12Fb3t/giuzTgmmr3FMt7J+oif7G6T4ZxrRq0QxxNudH9mo5V+zDYsAGyFx6AnSsn8roA27DcisKZQiKdb2nhRMDuLoP30qsGjkBPqS3FKCrkH3WdLywYbywR4pla1g7qpO4XdR+M9Ksy8tPiXzyTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774741215; c=relaxed/simple;
	bh=iBfmwIN/aW/lfWocegSWcnPg3oUdouAqfTYTm8tAdhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QxSRS2Ng50hwE3RAHKBYTux+OcS8D3+Pz6AJr0EfKig31vT/JRFekrZioBTlKn1E5vl+LTQPgWxqIb83Z60/PcNQMghkzjtfdFqgLs2LhpYvGEJQcwDJDVWI865JL6o+TN3iozVfOVoJElFcNSd/aWvvshUxI5lERayHky8VNpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKmSeC15; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKmSeC15"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64d5a7926cfso3881545d50.2
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 16:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774741213; x=1775346013; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6KQA/Fx9D9/4JQMN8XwpW8Ndz5zn5yIIrnM3uQJKv4=;
        b=VKmSeC15YcUkZPtdFDKGa1IohUZp4ef1FNQ1SmwFRuArBLjQndphxwapzFwjfGrU4u
         S/b4MTpA4L88Mxtrk6ambqW+6xzx8Hq3Su+H3Cc/zWo6EeJslr+5z5+THP9KRJg2e5bP
         fAlVwJguVo+WWUOpYCtHe2+g0+MKDXyqgVSVGq6wvKAI8DS0sfKVJqQEoA3k0THW5hVp
         e0YpcYMnMWEtQ99v01xDgvZ8gCL86JNNWTkhmgZEgAFf3KtzLkywSH8GN2avxMLErkzV
         pq1SZN/6JxqNADSDQWfAZZnmTesQLd0LnrNRr5yNwaJ7wiEyIV+CrJXQ4kGQ8wuoF84T
         f0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774741213; x=1775346013;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6KQA/Fx9D9/4JQMN8XwpW8Ndz5zn5yIIrnM3uQJKv4=;
        b=cKC54EKR+6bV0WEMfAmIxamw2yM+HbHCu/vKDDV2tg9D3RAJtu645ley48ZJ8hpsAi
         aDurpBt/LLgTpC3u9gwvoYdWfT+nIV9CBHR9iGETCGF1qVpLjHIeZywzSLfcJopmhYLh
         iN4OjEJ+WF86gpPYRdc7P6X8gkea2WeYe8/XmLNplWJTgso1zYRr7AI7ei7Aj0rQLudM
         /zRoeBArHVuMkU5Ze2L8Jx9UCNZMl1yeAmfd4TWDyAcaRFwJwREqsfdrUSeIGhu9Je53
         gA4pZawSQa2SygoTlu4hBCiTY2b1Kc4oSsMIHF8/egQDSRBsiOaD5XimdCyyES677dQK
         izmg==
X-Forwarded-Encrypted: i=1; AJvYcCVsXD4yDfH4/4yihS2IWu+80cCi5XGOQ060MkugMO5Sn19REJ9AliXtlMTB9mbM5kap3barKRlvaaBB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1e4hOIqHgvLFdZFvQXNhFf4TsRkmVyJ+M91IX9gruJfIO/fF
	ZAvyKl2gUPMRwbVF88GE+famZ0lEreNxcOD0am2i8YAVCEL/6ZxNJDGs
X-Gm-Gg: ATEYQzwhCQ7RYDScjNOrH60bbX6yvcwt0r04GZe84WBjoYOmN0BMe67NkbqrJJNMkM2
	sOJHiF6UWdXy5aCe0eIupockzPaNBqV9B/bR+fuWgHYei7mNpWXtdbBRZfKVeXy1Z/FGOIrQviF
	OWw5wq0v7eOK0vEO64OLtoG5V7VkdZXiIThfSNGclhcGpbADCpZz7hR0fUIPrjywETALo3poOuJ
	fwaEtFE5ZSEEAM83hKAoTl/2i46T8ch1p8Zqh+MbAIlPkdoB/CyxdHzRxA7kaFJS4ArozYNrHuB
	1QBD//7iCmKpYivnb+2iJk3J8cbkGXVwX27Q1WcH1q8Lj4h6CPzL2qTYM9K02zCPiTM0v2dVpIb
	GXZjjnS60vrnMPDGsvU9T0BAIG5jr3DQsOFXv7+z/wXBhBpZn5fRXbe1ElRV4aPqZA2utkqSb76
	Tjsm1YeT3RrFHbhfUA
X-Received: by 2002:a05:690c:387:b0:798:3be8:b68a with SMTP id 00721157ae682-79bde0b7b15mr78629767b3.56.1774741213414;
        Sat, 28 Mar 2026 16:40:13 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-79cba66cf09sm15559127b3.43.2026.03.28.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 16:40:12 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 28 Mar 2026 18:39:59 -0500
Subject: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando IPMI
 Card
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQrDIBAFfyXsuYKaRqW/UnLQdU0lRFtN2kLIv
 1ea4wy8eTtUKpEq3LodCr1jjTk1EJcO8GHTRCz6xiC5VLyXhtm6VTbnZbHJZ5Zo/eQyxzSxAbk
 S0lrlDEKbPwuF+P2n7+PJhV5be1hPCc5WYthScb11WrkroaHgsTdGo3dB99xbScNgjAgorDBac
 xiP4wfEBxgrtgAAAA==
X-Change-ID: 20260328-asus-kommando-networking-5c0612aa6b8c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2

Adds the DT nodes needed for ethernet support for Asus Kommando, with
phy mode set to rgmii-id.

When this DT was originally added, the phy mode was set to rgmii (which
was incorrect). It was suggested to remove networking support from the
DT till the Aspeed networking driver was patched so that the correct phy
mode could be used.

The discussion in [1] mentions that u-boot was inserting clk delays that
weren't needed, which resulted in needing to set the phy mode in linux
to rgmii incorrectly. The solution suggested there was to patch u-boot to
no longer insert these clk delays and use rgmii-id as the phy mode for
any future DTs added to linux.

This DT was tested with a u-boot DT modified to insert clk delays of 0
(instead of patching u-boot itself). [2] adds a u-boot DT for this
device (without networking) and describes how to patch it to add
networking support. If this patched DT is used, then networking works
with rgmii-id phy mode in both u-boot and linux.

[1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/
[2] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com/

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
This patch is based off aspeed/arm/dt from bmc tree
---
 .../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c336236c3b9d01b7de1bba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
@@ -107,6 +107,24 @@ &gpio1 {
 	/*18E0 32*/ "","","","","","","","";
 };
 
+&mac2 {
+	status = "okay";
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&mdio2 {
+	status = "okay";
+
+	ethphy2: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
 &vhub {
 	status = "okay";
 };

---
base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
change-id: 20260328-asus-kommando-networking-5c0612aa6b8c

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>

