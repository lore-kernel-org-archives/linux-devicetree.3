Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591746;
	b=CWwWj4p9s26Qqz8XQPfUtG4+v2z3MJ9OyszyVZl5QCS0vjsTfE2kJtg6I0lrBKayNKli
	 maHENTHxlyUzv37rJbP6nT3IiZ1qxtm3x7AQiFPqXyAsLbn05wnNEMe4e6oeiAf7vV4qI
	 Icxzl7j8LmL40IjZrcQaNTTIAE+KP1K0EI872Po0P31xqjiP3oguRyGkGDqWLZ/u+WWMq
	 Ju2V3jbzcfrGmG6tbfmLwWC7YujRZkI6VsYwRd3axsvu3/N3vGKrsaeZqeLz2MCrwwomf
	 HxBU2QLSZtXxru3WR4Pob+vB+y32KScAK+W2uweO66ZgxDDHN4oqC7XTuoySESN17uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591746;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=F7VxJmFqGTp33yoG+o0b1Kx0jJI+VDEoKLSuuc+8FwA=;
	b=iaVIGW6HbjsCqk51xYCgQGcB/mzyoQMV6ZsweyVNRepN4EO2j3BM6jJwtHXySb6bfoF+
	 DHGx5Hh9zHv4eiaseLD12dG56dDrqfwAdtffMo5u6TAzYKJjDXJryREEw/Z8fH/ZHpUTi
	 xER01+UB3qIGeBeQ25hw1rlGKBs4rwleoZ6JqYgAHxWYpt2dwXylPmyRXK+oHiF9Ne/+c
	 6SsmrpHxzERI+EcVId2tj+PCCY+UZkUmmnMwtyiOJUzFph8vgYcDhO5QE0xub2puPDpXL
	 Mlnu5kBm7XVnoOljRS1+Ff61gJyMI/7bwM7xC/1LdF19sB1hm8wQ2c6lmx/vt/9enug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=Bkn28aVO;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910A606A691;
	Wed, 25 Nov 2026 07:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3910A606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=Bkn28aVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=F7VxJmFqGTp33yoG+o0b1Kx0jJI+VDEoKLSuuc+8FwA=; b=Bkn28aVOBUzqECTN9eQxwbWbv6
	vt78iChlgSJJi6s+wbvObGJ9q8zMhqBrVknwaJoNTI9ObjLA7H3K55eWw8mbUhpIoOzAjq+Ypjfi2
	M5LT9nXrW0vV+/ZAMOxdenFxyBh+TAw/1dxq9O7uBOvBi+w1B/fTN4r8HwynpUX5oQDZDUFugoRWg
	yUy5rJa8v7SzRzhewoMOEG8DCefaDohjOgH29/ZcanzeEaIJCoAlo0FbaU/jHVBROQIRBXKK1GXOj
	xXavUbLgqepYM0owzsnH5fcUJEXMW5nJ5lrqJnUhSWBp0nL9dRVaNT43VGYBiNyqQVAprRe/n4x7s
	Yxqhe7Bg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R5-000FiU-1x;
	Wed, 25 Nov 2026 08:28:59 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R5-0007YA-2D;
	Wed, 25 Nov 2026 08:28:59 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v3 7/7] arm64: dts: fsl-lx2160a: Add vcc-supply for SPI-NOR flashes
Date: Wed, 25 Nov 2026 08:28:50 +0100
Message-ID: <20261125072851.3379079-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
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
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)

Both NOR flashes are powered by 1V8 power rail.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index c0c5b8e22d61f..e5951160222ec 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -29,6 +29,14 @@ aliases {
 		ethernet17 = &dpmac18;
 	};
 
+	reg_vcc1v8: regulator-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
@@ -65,6 +73,7 @@ flash0: flash@0 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -79,6 +88,7 @@ flash1: flash@1 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
 
-- 
2.55.0

