Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220805;
	b=putUb1KbOg14/BegsGiMDFwE9/o0j5mUHKOoXuc130SBBdRY70l9ziPBjw9H71F6igIz
	 z+vN5G8XyRFXamgCwaf5NbJZZgwgm9uWkxsRicnsnPq1wKgHAS9ACVo1D9llJsbEPJn0B
	 3F8xEYuw85F5SYIK6E0WyI5KhxddWWYGv6uAZPsAhkbQ+6UIV5x2hrKLsKQSfjHxXwU8O
	 DqgQCis8s+OmNkQl3TO/eyfkOA81cducjr38ysGKY/xqZzHl2/MrnC3q6jfZdEDZh/Wnw
	 A54IPFZx7OeTx31O+020hXpsu+F8I7xrySj2WbXYVODwZYi9pJhnpX2F491CyUTUtEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
	b=QO5lpiPcgdRX1xnXEnJxE/Y0UsZ0JWsxjLMQtbyVhmbhOTY1MlfezDYI9mh4ileWkUSi
	 VOuc/olGRkkY9H/7CW3nT8VUaYLsEY3L399CKN+NNXX1Msd18tBIshse/Jdv99kOjCrC8
	 7S4d/vh4N6Bs1ngXegqojAG3/o2/kB3ubGGulD93P0yzQxCrNmTGEl+7fwaOZWuRVHwSX
	 tYVHzcah2D4FC5d9Ui4pW3vD66Vq7GbKocznT2DKvLJfOG2KGinAkLkxHDG9I8TL8v1AF
	 LGrpkmQPSbi76pWFjxEYoVz7rr2sF6JajuBRlYr+abk1pg8S+eyYiobF6ZnplciR1QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWFo4c6Q;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B032606A692
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B032606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWFo4c6Q
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so932059b3a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220798; x=1795825598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=QWFo4c6QdxyXvsFVltRbCG4GyDoFOlW/X9UZ6Gpu4hXHwHeo/DdOWTURQvXYhAQlOc
         L9vByg2HKheRNpBcaElNdhBjlIofC94Eg4l9sNABng1Ua7YamEYnnoFzkKMorEfxdJc/
         4GLDy3n4jIlARVBCNwRZlrrZtgMTXSYl0J4Msujb3GfBEl/xxOz0VtjZduplgTY2bHVQ
         bHYkKLP+Hn6HEmkBgLBq+nU/NvxREj2+Ux+LUsRSB5kTVAc2LTCATCsBxvP56jxyx4OT
         47EdewWv3VC+RusvlDgFo3TyM3yqlevEfWSzcZ4Z2tpuBg0sCpFPHvHnJAwvx9c6Du/F
         zaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220798; x=1795825598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=FFBJh5G/QKW3icESnjaoPbyKCCZHZLUaPq4WcwRaE3PJKVKktPyEPs2ri5c51OEPXs
         YSB3XdZvb9b4u7e9ce22A7MD2zFQgRofSX0hMR1pZNi7BSMhGFv+tp8kZPzq0syvBcGX
         uQS5oJI7JeOGFa10sW2LLolLDisNtfgqwgE95m6LA6Cli7vmfMLKYe3GAfFBsmx5ou66
         hCg6/g8UUXb7+HTl9eGUeCtVz7ylaOssaIqKpNHC+7IDDyaRVKw68HzjBiomcttsZIoy
         5sS2sGXcPXXMt6gCDhZDqjuq98nIcG2jHWpsylVuuuIpc95JFjnqPlA+VWHlCkFLS0KA
         KzuQ==
X-Forwarded-Encrypted: i=1; AL+hErFCNFU7QRMKu63opwDARYTpSIzMfJ9LKUK2+t+8AdMSaLpVVOXkb60WzheL2UMjtSDmFW7nj+tdVOG8@vger.kernel.org
X-Gm-Message-State: APuU4Z8OHIYj3zNrMjYSM2TUj9ONALW0ATtZBAVeGZaYPfia0ZA0Le9l
	uMdv74QCFCgXK2o9NExTRz1v8+ET0VKGpD+uLVhHKeRYBN5n08VxVXqN
X-Gm-Gg: AYBFou1mkwilOuskcdzMQeUo+9K1KX3yTsV8fQiQrtkV3o+HY9+4Zg2AKwvkO3OnK9a
	/8ZQzQAUUSWYFVoqkfm2H9K02yHJhYqnltIj4lIEvSWI6sYZZfnweGKz0h1Wg9zW/KTef1rvCmj
	smhcXUSpuB9nwW46xKhBqnFpwpEiQPL3q9mnbrN1Wz5pZWt+oDrTlInyM9lUQgGk+HEidNN1N09
	g8na500A6Ju9NrqCHbFN8frQwNwxzi96j1YWyYkWnHi/m5D6Ck/2ePhWYu5is90+EeGiOvHDAfC
	AsxKtRKS73ZkcRvnXC6qsajTDF8/IjHzYwKTmxFFGJeOpFM4R1GC2eHUNbbjNgZeizGNTYbuZGL
	QzwzrZZGY8N2vnE1tMPcyCtmGBTXdKmaKKYaNJAS39Om4aQH9y3/v3u0xBrHIZtyf3u+Szi4Ilh
	ZtTtEl92/GDk9WyI+6afAk20NvQOirwdvHizqIS09ASvYuJmYLOMd4SM+a7wd8eZBSe1rcQEjij
	WajQG73flPv1QuRvO1zYM6txZN2oWpdovWia2ghBUx8eflsgZUxcOd68d4+lLaX8m2evbCIeYeq
	cet13627FZ77ULyisHeTFYMadD13no2LiyKtF0lvDnVZOdDB1W1nJ7jgKNMFMqVpcukPcDEwLkk
	ys8HqWJYbkh6VeSUBPwsbq6X6wWbKGxEdwFHGmdhrHdjh0SFhMFVTcW9lFmQj0yGWg6l75H1TeH
	0zOQ==
X-Received: by 2002:a05:6a20:748f:b0:3e2:1218:3ea8 with SMTP id adf61e73a8af0-4014b564283mr5703588637.14.1795220798428;
        Fri, 20 Nov 2026 16:26:38 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:37 -0800 (PST)
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
Subject: [PATCH v3 08/22] ARM: dts: BCM5301X: phicomm-k3: specify switch
Date: Fri, 20 Nov 2026 16:25:48 -0800
Message-ID: <20261121002603.25254-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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
K3, which has three LAN ports and a WAN port on switch ports 0-3. Port 4
is unused, so disable it. Also allows setting the WAN MAC address
properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 5b9250976f13..018faf90fd4d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -52,6 +52,43 @@ &gmac2 {
 	nvmem-cell-names = "mac-address";
 };
 
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
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@4 {
+			status = "disabled";
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
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1

