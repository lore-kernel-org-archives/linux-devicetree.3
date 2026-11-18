Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980911;
	b=ZedODbR6IK6HzcwgYUoHTcUE1GAkAdJwAloSj/y3f8WFpHpePFmzRRyBouLf+EZ/H54V
	 oORG8pcJWiTXUB5wq9eb1ieeHaVx5l/zgvpkWV3q/HOAHaL49nQ27GihjIELyRDzPTopj
	 UTCQkSgm2CGtLP2Z3zzW1/FEMzvNjGyxkQpShS1vWtFyTyZyO1E1xNlAjIFZRbOw5Bz5g
	 KjxqJ8DfDhS79XSc7DML+M3bzGfqmEUN8nPDqEYGNFZw0wbdUzzv6GF7nGsJKs6TFzHBF
	 07bzlo5jzaxVyiEj1r2X91TpH0j/aaAYLMWGAL9nixeVTUQp3OUAUCGU9Z/Yv14gofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TsUpyU23STfI7Ygctt4GB9RTSHTZ6HCWLhGsw93EbNE=;
	b=ck3jcopj1LLcA8IZWjB+sa11hd7FBskZR6+c5vCfNKR8QwDqhZjXlcL/gZ8NmLwGo7eL
	 XpSDqnBQH7SsyDjljA2atVT31nF6ygCDks/8NFQvzy85xNCVEFM0bd0j11Qh8j73471mH
	 2Mht2uO6Trm1bnsDiLMCPc9te7KnxewqM7MLDXQZxTC2Acaj49biPbbybJSoPOwPc92mi
	 Xz6ek92lJowiwuBhYsJ5RQNkl7d8Mtyy9LrtcEaKyDsidwg3TWVtHn00xGiiKQ0Z/5rV+
	 0dYE7urlCrjqG4GQLZmE2LSOYW23wWHkwLSG9wAl7aaMUw9mfmFDqPE/Sl9uMfxDw4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOPIpQNZ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6169606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6169606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOPIpQNZ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380b40319bdso1048108eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980910; x=1795585710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsUpyU23STfI7Ygctt4GB9RTSHTZ6HCWLhGsw93EbNE=;
        b=TOPIpQNZHzeOLBcz/mr9c5bEf/nadah2nVecHTVHncWlgP6RlfjQuY3+92O/H32UyB
         ekwUQCDKeD2inGl/YfNfH8ZsGzb3CW3r4tc7Sx6R4ORF83KXtz3njoTmIp559Nzw114K
         pzxi5UavxY5YCqOfnNAOXnu+12kdE2zHQ5iAoZGhyw3eAfBhFVrFGp7ZGZUQ0rQPHARl
         UxAzIfiSsqhcrLiPZfYpHLaCNKdTQVT19YYwN52r7p3Qn4HDpwizC+7llHtj1e5IB4Hf
         9AZxjArmkFI2n8kL9kKzc9TojUhgQau/NZXi2TiLFBi4DEGiItxnYBFBCA0H4i63dEKc
         t1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980910; x=1795585710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TsUpyU23STfI7Ygctt4GB9RTSHTZ6HCWLhGsw93EbNE=;
        b=Axx+qxtMrCdJeeTfeGV62+s1rrZjNZtcWlSObmR03jPw16z9DCeuzW4P/7Tz0kWqsW
         CioIHyTKdqND/cLL8fY24ft1qn6XO6oqOhDWO/y4en/BgLNo9+QD6bJpzvlOTJZVwpRm
         On/HAlwYxIQJNKZfZxAFw8AxP199XkDiBphRleNNFBv1dLyx2Gy3uDqJhQ+z07wMaMlW
         /m1yAqEf7dSYJr4cYCUvHtoJN4mVILaGzdgo/jcTwGig99OtRKh0LSCmY5DFguLW4ncS
         qE/gUrNQLEznDeKsa+GkARrdo1lhoUa6Euch/b6uLXWxEBk4pAGghlqGs7ow2gNDVby6
         URRw==
X-Forwarded-Encrypted: i=1; AL+hErFLqRYXpauCblKvFIY/zr/I2rFQ88Q24diz3Nks/dg0X4UPbOsO9au4r+HL5Is7Pak+7slT3cKDl1xd@vger.kernel.org
X-Gm-Message-State: APuU4Z8/I977Fg8SVrxAexUTdz22ng0jqFDeaPFl6+1VqJjsxbqZj9Vk
	efz0jm2Pe0QqCF+2N8muHqkHJTUVM3BTJUlp9NmBfuUFUZuvK7Oj6Nau
X-Gm-Gg: AZFdTZcKLU51AFupmO0EMSAHhuN6Hb1bSho13LJpC4c4vNMfYG0/lQF6GcOiH6a9fDT
	YNzAMFOv0oH0MlyV/nhJ70cyJ9PEtDsNS3zSUv24xh/VpmzUrnAYF/mcdw1fusMVq19/rmp5u9i
	S/C7VsAQtHa6tVgXOUG0YChSrChRW7qtCHjXiB1ADS0rNfMsFanU/1TWAuOb2SyBg9M3wq4pciE
	rkbSYbN0RgEpU8ZdGgPcsoSFSdFCYM9PJ2SCsfe5gE/pFTGs3S2SEX3bxaE+Nis+kITfot6Q8t0
	SFP4pGOrmsDdzpZWx4UXJ4n8rldFJWJSgZB4a+OFl8KGaQR/QLSkJUnbfMPxi1Qwdc4k7NByUP0
	Hdf80ohoPakTVkYoZRR0Rv+kR4UkVLNara+naAVSfwz9TB+rEG20vTk4Lj+puIK5MRnzWr1cJ7a
	C966t/mi+E5XDYiJQLl9uVoqUavMrW7WmsMpBsMwPwcNNiTiQS6fy77HRlx90Xqck17OY8EZrIc
	zDxGsOZzaGmFln9dR6Ge4lV0r0mCJE23kwtW4YxRs8o/SrOydjDhq3dls5/gQZ6d9nCPMgR5YFN
	0ef8JyAe8YWYmlipaKcIQ48wb8onCvA0Y0DSAPdB1+dJp35fjUmRmwgZ9ro5h3bMndnI5PWVc7p
	uHlOE2bThSn1E+k7iVS8Cn1M3AEFy7+/fSy0gTjMB5i/2ql/Q6wRFcirZhFS4lleBvYWZciVBCk
	pCKA==
X-Received: by 2002:a05:693c:8812:20b0:36a:31b2:8643 with SMTP id 5a478bee46e88-3828162490emr1557800eec.38.1794980909989;
        Tue, 17 Nov 2026 21:48:29 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:29 -0800 (PST)
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
Subject: [PATCH 09/17] ARM: dts: BCM5301X: AC87U: use gmac2
Date: Tue, 17 Nov 2026 21:47:50 -0800
Message-ID: <20261118054758.132233-10-rosenp@gmail.com>
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

The nvram MAC address is assigned to gmac0, but switch port 5 (gmac0) is
disabled and port 7 (gmac1) is the CPU port, so the interface that
carries the traffic never gets it.

Use port 8 as the CPU port instead and move the MAC address to gmac2,
which port 8 connects to. Port 8 is the switch's IMP port and gmac2 is
present on all Northstar SoCs, so this matches the other boards in this
series.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 2fed02ebb1d7..4114c6eda1ac 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -71,7 +71,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -108,10 +108,6 @@ port@5 {
 		};
 
 		port@7 {
-			label = "cpu";
-		};
-
-		port@8 {
 			status = "disabled";
 		};
 	};
-- 
2.56.1

