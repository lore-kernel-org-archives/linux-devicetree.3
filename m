Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980907;
	b=OMcgm+HEzmpHxciBi6sis0UQjMQGOGS33mTbH9eoh862/zl4psUQwUdmT/CO87G+hrM/
	 VBTkhaLRZcVBELemNsaAqU1WCK38+jP+75Q6QnCyLACHbXoztCxzH/d5OpDCgAZFtImDn
	 03fsH0YOeKyUDrJoGYviwJT34R3hxhF/cg7rVvIOsqD90UUCPVt8HJfHsndCwTLR+8itl
	 6doBbonIESki9YYYpQA2QbWb9uf72HCZJi8c75jnPvdiw1IGsy7BH9NmgTedP6vkwG95D
	 NhIDmr28vQEjBaq2+wAdCST10J93iEQjzDRp4S1KPsT84/x2pY0o5Ww7vSkwWX3EbDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
	b=f7QLTJ79LiHTspcd4I6xkXnZdYKIYojNWNwc8Z3GRtJ+xDfKizSUJ0CO3CnoQFqrd3e5
	 SQSL0YNwQRHhoj1kpVz7m40ry2UG4XXS0P+FLinIGZzc3N3MdDCYhWdKLQG8Xy9uX61w1
	 GfdHxcmgz0i6lUIEI6oPDAnBImlN7pvIPqvAlb7NDN8XdjaWHHnJnU/IqflDjcVsXV/tI
	 c9UST9a+fFr8knxJSAT7eVoqwkRgSi+mYeoHkPqxxtUtcB6lC4RVVfVHSRkW7J0EUNmU1
	 oDYkVvh1dcCW8KjsgHudliMu9ubsa0IfpGx1zP23cGQbRMPosiSSRBoSZiPkG7whldQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bx8nVNLW;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C49606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bx8nVNLW
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so1206706eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980906; x=1795585706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=bx8nVNLWwpvDvID+GxqN9OimbJxLsqlHEGM9K2rivGga6z9IS8I+6m0bHNr7vPDg7u
         kBbg6oW5UaL11qKwToWIn18tt7TeC/gSI3z0pT4ju8eHfW0CMs6aOcb2++iXXBFGjSrx
         L+kXBwfHYowHXnHjCC6kLLWdoGOAfncEPiwOAkH+UeOJSm4pNP1ZNUfaN6NL4EDIyGqT
         x5JpYNm98effY8jWmRiu31Qeybl6HkYF9/Wer+UyG3jukoKkzadnSH4N81aY6EFpJX1m
         FBP/dASKmtqsP3wADO0bmJjmiPUk2TfOjSlJQgglYDlS/c9QeGvkVhO6L9l5wRLlLkOC
         GCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980906; x=1795585706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=CG66QcBZD61h31q2EBL3vrIToe0LP76Qm6zcRfc0qauzD61SCL0qBkI+DpPZ10dnln
         BRCOxzW9nxzbbVXusOHn/4oK0lMYaLyCYcgVh2/KqajPykzNqbp5t0Olt1GcoOrzqvm4
         g4M8ENBG4EQVV9MsjxIK5mHe/jAkReU/6cOQPVBxgp08Qjp6v7EPPRrc84BT7zgO8QnW
         rudzPZdc1Qhpdyzhnx7Kin/n/WE3jyDs+GCkRUnujW+aKQj54qZcVEHXf/R8eLxsAzUF
         J4b9EArgD4SE7SYMT2SOg0oKmkpyepJjfTfKblsOJsYIs8D5gARWn7HoKlxkrGjkxAzq
         u2vQ==
X-Forwarded-Encrypted: i=1; AL+hErHa7UleMJ15i+RCMqdv7N7XwKmr4eAYUIouPNSxLkCe3wYvHPE+0PbB1T92FFkuqUbkmLwZMdF1HZj3@vger.kernel.org
X-Gm-Message-State: APuU4Z+EhbST3p79pUNI0PpyA56siJb+xzYlQ4PlpRC9tt3KoHcx49Af
	jtXY7nbG3jj4SbbuwgTIYQt2OdYRRxNKlXvgJJy3catdr3DdP7uc2IyP
X-Gm-Gg: AZFdTZfLD/KuwKkAt0WS3g6qZYPprGbUjUljNh7XVf+0QhK0KDQTBE7ip+YZcUeI/Q3
	shKMYTCx5Zy/BMH2yeaykGBGaWarLefMYo1vitQv8EXiQDUIfGgVnjWhMsMxQNg6S3Lv4gCsTiI
	5ND78pEejw5eYkRDvEFDHIuty97AgtHx+aumvKHowmrUg3+LMVMRYjwen/I87Jmb8TbYogUESF6
	jOP3yJMSUeUlW8Z1vlPMsLvr8Rxi3OOGE5qrxtwbMAFV3hpR5ISmxteTqQmJuL+nuGe7Vjpar6n
	/YsPMaHk8cpVuU9fWOcxgtKbQh8L0MYic6Unb7+QMPJ1F71gyjAfpxfWj5G+UucClUSqXCveVDR
	n1402OXGVA8mlT9F452qSQTM29OCNC8Sjiy9V5jGHK32LkJRCPaTMc/JiiUCyuGD9Sc32RH3RzO
	mkAx0+KLQcZZa1ZFVf3gvCkWahWmFkLiPvdPvQZcJ+2NlU7yvA62hCwaXq1QnGAq6Ws7Nwq1ujP
	4qutTnzA145LI7uKB6WPFK3MI7fqVL1O+Pb30oRASjuo7hGSmqTJc+a37NRHjN3n8PuURvxkElP
	5KwkSP2i2zNuZcfw8gQXrAL/N3RtqX91bVGJ1jc3qgmoFPhLxq7/UxA7tZs5+/WrhxBgGQOzNUf
	2nby7ZuRV7pnwqoe271AptyehazC0PteK2CoIti348uqwTHyU5NYjVjdBkG2WMgPjl7V/12OtvK
	QBKQ==
X-Received: by 2002:a05:693c:8344:b0:370:121a:b2f with SMTP id 5a478bee46e88-3827f98b7a1mr1675613eec.11.1794980906022;
        Tue, 17 Nov 2026 21:48:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:25 -0800 (PST)
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
Subject: [PATCH 06/17] ARM: dts: BCM5301X: EA6300: specify switch
Date: Tue, 17 Nov 2026 21:47:47 -0800
Message-ID: <20261118054758.132233-7-rosenp@gmail.com>
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

bcm-ns.dtsi specifies a default layout that is not correct for the
EA6300. Also allows setting the WAN MAC address properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index f8dd08cc7cca..bca4c440a499 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -59,3 +59,40 @@ &gmac2 {
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

