Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078546;
	b=inbSaM/7v9il0IgK/omIzm7im+ZXcO2MJ4212zWOcQA7opH+QGGiBIsGKZdluw1SdPWs
	 yNvKb+gweieyo52vYfDGB/X+DMqPbrY+C/XZH66qeIDLH2AwdSBnZ+JX8FU9LwzYEcSj0
	 v4bOMQkJapsp8uPCcm/bXiUKOIeoPTKIABVAIh5efz6sCi24iksjfEIsYd4k2u2NVgocP
	 JjUJWRyCMKbGKkqIxBQRJVXi8O+3TDhvQdgYHXX0Af1Q/Y0S5P3EgPA8ZU2vlkLXF7Reb
	 xC75xO6MWMXN+DCpnMxCi5r5pz9+C6R4E3QJ0YWWfGG6syIMajOqik4PcNElLSf2UwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
	b=n78hfvwe5Ps5zY2K/6GtYjJvCO0EWZBhOWMG/uGAxJME2nT/Slpi56dstknZ2MFZU/E5
	 6E+kOQd79lOEnGDcxZfk5H5gbxqecoNpow3HyyjAWTIF3+ioMbTK7DWtTDiiTgggk0b6r
	 W3GCpEpbC5WqZTJwD0eYBmKzcPbeu0wW84/wjuSXzRgFi9bDTBi3LApnwdoYj7FF6wZe9
	 YGR22hvWYlwpIcv4FICw9VmXgVGeK6OKlT1UHG3gaRI8Rms2Upm36FjIBY0+tj+VE4G0d
	 NL3intM8jnskpccnaxa/kHy/1yxMT9+69bZXRw26btNSlpGCrZJ9AMr9ndIf5kNJIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r76UY2f4;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE93606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE93606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r76UY2f4
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363316fa0cso27538411cf.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078545; x=1795683345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=r76UY2f47a9O7vuCT99ejCOP3AuERAV+MEQ4AGBtUSQaqRRq4uXJzJb8T3nRSy1nLy
         EMhvnSccztiS/PEqIWWciW8edhQXt3RZapCaAFQczkqvD0Mu3LRpr32FleV9caV8duR6
         bRujPor7Zo401YrAtdERzAM4v85lQGVU/u3Bz3x86Pbzqs7F3bU7liNJPtFL8ti3SqyX
         iFng8ZyJ9ycUoPKKsBXmTH1I3fgwLBiDVYfmTu37uPZTG3yt00tSSz3ibPKm7PIZbeIK
         vWfv385ujBnhk1Q7b0THw4LOAPPgbeHt/eglen/67ZedDFuutg7KMRu20Ka/MRIrx4jB
         1xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078545; x=1795683345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=tZ0PaYtuKNlezR+iXpIhbYG5EQmHZ1sokJcZQQmtnXIdj/Vjh81WFurmZLbZu+J0K7
         ta8vgKviDWuLmmVzZScFx7FUvMW1P9G2ErGPoeaOAcbJyzliC4FnOSeKRSckZ1pKyPo8
         K0VVBRt77wju9jBAf3Fm0QPMok8nEvZCjs/BhVUS1Jvxev91xf1GDlBwpBeRVrAsJD4u
         XGlTMej8nOHYUGbsozbYc2TKpWTomFw0U9DesazH1alSAIJ1V9VFWaJb8KVPxeKO9Zqo
         oQE2YIc0h+n3ezDMv3pvoioj4fEXO0/KtqZSqUOKulTUz7uT4vrZt6SLKToyS55rVMCp
         DdCg==
X-Forwarded-Encrypted: i=1; AL+hErGW5Upl5HNsSeCSkMam8sE6pkKeDD+5APO3VlXD6ctrAzn6VNvVdb8Uh7m4Uf4kzQW9NBUxjPCAa5JE@vger.kernel.org
X-Gm-Message-State: APuU4Z9MhwgQf9SbnBkKfzHMuX6GffvywgLoMatYJrjSWK7sX2CvKs7C
	9F3JHATPDd/iIkVp3L/JCRzyTsqGCILQJ7sKD2gP/CxOTM8zSSSr80dl
X-Gm-Gg: AYBFou24vwZ4MkX0FoEP8vXRNTXqEyBszgqzQsjq8uTJm3cB5NPhm9Cz5xkk69g2+yy
	UolvPgvFdjJ/UoB9O7fEU0BGC846Elky0Xg7J/XBVfaDH31A5a0XZ5WXxEKg82dpyyWju7nJYHA
	cpa1kI5Wr6vr7x4VzJ1RzVVFhe9TPcpKIpfprxOOPfKEal8wUinNX2tI3szWe0qeUifDcHzQBVy
	x8xDPjuEbTyqGYqQNd2NJEzhh0lLdd2tX1utgSP3K3Vmm4xuWQ07emrB0fS520Hpei3VuoB0vgT
	a3cPycs40b/qyqN+w+4NeGzaJHckT15y4ZXqOIZorM+kmKmQsMrS/t8yw4ffXqedjm9HTI+l1ET
	nBhYIzHBI4Bty3WVcmKe28wXqbe2pxC6ZLLcYz7VW/1WWW4zK58rO6pDb4ikqKp0J3A5Sy3UeLR
	F5V4GAHjeXSfrVRI2s+AuCcgsqAG/INCMp1lpxeRF6Rp4lUJ7ug502eFjxTMuy9cJxGJU1IAOYs
	UlBQVuX98GykCOiDAmPoSamLhHo4WErgL4bkWx+CN/7G3DV3hMBpxvrRL/MJ2gFXrZngQ7evhK2
	qzZgihJyKWnwPZOjCappk4KEgLwjTnXFPk+Lrk7XPrk4hbnBkPgV5Mw3b3nkySdlSLQSFoWR7sR
	eu9SeAToOgSq7/KvKTMsbrCd5EolhLpq9a0OX4q28nuOP6yV/2+uRowORYKckFiXMCL17JgH3fv
	Xbyos/1BaAwcbmC57Z05Kq2Rs=
X-Received: by 2002:a05:622a:307:b0:55d:3764:8793 with SMTP id d75a77b69052e-55d5a5b773emr85562801cf.47.1795078544893;
        Thu, 19 Nov 2026 00:55:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:43 -0800 (PST)
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
Subject: [PATCH v2 16/22] ARM: dts: BCM5301X: WZR-1750DHP: specify switch
Date: Thu, 19 Nov 2026 00:54:46 -0800
Message-ID: <20261119085452.75708-17-rosenp@gmail.com>
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

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 95ef6ca7210b..459ed246030b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -149,3 +149,41 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
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
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

