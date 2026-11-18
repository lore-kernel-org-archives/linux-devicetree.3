Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980913;
	b=t15nGpBsdJJDayKOtPH6lPB1y+evkDdKSpXmn8wPBaURFhbo0c/FOHOUioPrC/mgwtMQ
	 LiMDAuhMGN2Qh8XU7vgp/22UPWVeHTcsNruiddC9QSKwaT1Q1HKKZq3ea8673UFYUhgLB
	 4R1dpM+kf4k21hI2Lsu8NfbUoLfua/EdlsErW8yCAuUxX/gAPpm4t+4TGlGUT5WvxOSgU
	 8uEZjn96OzsG/yv1oWY63uDH6h05tPa4bEOfd0YYsq90RR6E2BbTOKON0uUtNCp7HZgLh
	 ohXSedqUSSK3vUTAbBovqWqQtVRwrvI94piFFZwbd+Ww/Ul+lYf6DFZEsvu+g5j601A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
	b=jhU71aCPI9o7vhaFnxVZYo9QxXvxYRDRTn/WyhFlKKrTs0sQmF2JKDteokoYyIMcMrry
	 1/XY2qRL6ltm+O53/K4bsAZPXJtp3RsDYOuUSQ4txMwest2flyr6vk35I8D02lIlPEi0D
	 GjKMVlr0wu4HIkfY1IBAqc3CCFGHTzcJ8WJ03uM+BK19eGStumTcpwHZ4FRDxx0EAVzxe
	 Q+Am8krV4eijvH9Ubz/rRilt4JlrH9NlVaiHoyTjPnvOwAxg8VP1A4s+YUy6Y5GwLtD9J
	 B7IWOjGPQI39l2aMV50xujFFg6V7UZXfmzm00K2Q2qxbZSGUvd2+Ol9Cr6gzjkF2yFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpgCrQmu;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F44C606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F44C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpgCrQmu
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so1725635eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980912; x=1795585712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=UpgCrQmudE09xOzc2DToXEdjfWLKCjxdOoZaQITEqMcALrAb2DI7EfMUhTH72EvQeH
         TUhKQNuYFNcf/EtKvSxtOaD5gLHikpdQ8lXYcvidZnjD5ayl7p5XW2yWl3ufyr1F4doc
         pHcgIR5EY5wlfV22St/3+MpcsjaTgIeutMenfDNTk5HjrzW/eEBHH9waOGKUF4MZlacc
         BMmn67g5puVKKtO9DQdZzX3eYpVN7JKsBnpZ2F6e7B3roDdIqdvW9251PU+AvxY6Bn0q
         1cI3dry2yyRTEGvt+wNoF9YiEqM3aGwYbhV/Lq3pJwFeuzs9iDCi09wFOHoqfwanuU+V
         l/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980912; x=1795585712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=AdqY3MiG6w5rY1UEncKa1DSpjQWGKfjoiIn69KYdf2F3YH3Lh0nJ0UI8fYERXiEvNt
         uZF0Kl3iqQBcOF31asOUGXrorEB24cuGBWp+smLEsO+aOreM7lAnJnAH7eweZqS8Vb0t
         nV/5OyOrMFGNhaCFhfE/ssVxl6IJhP26V0zHIoxmZPWgcL2Ny9ax/irrB4Rx6GntqM/V
         CIr03u4eQMNdvcUwftOj65cG0kwRETs2XOIa8f/83SWzf1+/ZZIDUY7hMGtAOpCpE3oR
         1+RfYqoeq186pkMbqXWRxbt0TrVLO4aFiaBqEedDA7RVt0KmcdvE9pwFCNnxOmay03C7
         IzmQ==
X-Forwarded-Encrypted: i=1; AL+hErEbrezq0VGsbA/o2f1TrNftAZBDl3lwI05feFUrsojRIXey1V/GtlSws/z3JznhK06xsVV+k7FN+FrT@vger.kernel.org
X-Gm-Message-State: APuU4Z+QARP1X4BHWVJYPhpsy/NOepHudiQsWrux8EZBTfue/1/tC+Al
	yuaXuKjjdqajhcMidOpeWJjvll+bkBMdE9QDVifASVUIlFfrhFWzxMrC
X-Gm-Gg: AZFdTZdawKWmWgMAmqSZZGRUeFXnXkPyAc+Lk2f+EBqesmVuB2w/017AwqP1JD+WBUB
	Mi3A7tX2+daiFX0PNwbD0gldZu5wW3IkxwzGf9kUBYruBO5LAX+jIBx0AvAzHFfShIijdFs31Bj
	zMbisOlWFwSoO+S3AVYOpBIiWn7rKUJHDv9Y8xMZKo7/j6lCawXi23Pw9Y1muspp3c1gBsLqUUR
	CaCZw75AWgbABy/s3LJ44PvPvgvi8BFoeTjT8iLey1gRXNxoL9DIlGVeutm0gppaIZCZ6ni7gaK
	rQhkaVIFcXqJeZnFXi4nh1MvMVb+XmKnpRE9VhyMlhcT8JAwQmdd2tyW2wK/XDsSntSN2q6kwOd
	3AqUtat2GdSU7O4E/PdvkxE9Vl9uWMZ1lFQOYqEEm4nR19vefe2AORtcaO1AqtJeVDsit+vn3qt
	DGaNzp4HMTX432nC0oVAJ8J6fSCd25+DHRKdDhtBmixNngg96n6t22px4tq1SVV7xTfWY8xvY9A
	JyRwDucSmsGuMUy2jtho3CYOD0oq0cn29h8StTtyrqmy4QXmUourkjlVZa4WZ+dtbyj1+/pmNvH
	PIAjCX5LBG5ByGzDJFuq8VPoV9axT1oB5L0TPHn2mkKVV+PiD8RGexkBivXXWsdzcNcNphdIla5
	MTpKofxdTHPyJmoooTlHSEW2do4UTaWyO+cJEGOi9ptX04wFgwbJLBVOppd0/QEadAVuN2pVufE
	PXtA==
X-Received: by 2002:a05:7301:4682:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-382803787b6mr1672364eec.24.1794980912552;
        Tue, 17 Nov 2026 21:48:32 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:32 -0800 (PST)
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
Subject: [PATCH 11/17] ARM: dts: BCM5301X: DIR-885L: use gmac2
Date: Tue, 17 Nov 2026 21:47:52 -0800
Message-ID: <20261118054758.132233-12-rosenp@gmail.com>
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

Commit 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused
switch CPU ports") left port 8 as the only CPU port, and port 8 connects
to gmac2. The MAC address from nvram is still assigned to gmac0, which no
enabled CPU port uses. It is also the et2macaddr cell, which belongs to
gmac2 by name.

Assign it to gmac2 instead.

Fixes: 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused switch CPU ports")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..b64ba9afa736 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -121,7 +121,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
-- 
2.56.1

