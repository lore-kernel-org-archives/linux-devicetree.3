Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80F4EBADE
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787605; cv=none; b=pAgxHwe8L5iV2nHINVnpDw1s7Mw9yw2KoIlqozrYSAc+Y+gqZfE53BvplSrbqFqO54PFbelZJPF6uwAyP9/7td7IOeoOgSDDJz6dqlC/ppJl1DGEHKcCcPGrT3AvwXzJRPZz3WaKeZf70QWMZ/W033iAnri/LgUoey1lNizki3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787605; c=relaxed/simple;
	bh=xb8hi4uuW3KBK62XY1yYI5XdCz67rzTPXQ/r+H7c1GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAb/WsHthZHbmUaCYt+UTbHWiQ3Bn05aWf58TAda3Esuvdcp/glclXHwVPBAF37Ci0Q+ohMx/qGtsULcBBrYk6mLegwjp+2Jswz7cK54VbOz6p8E8v9bFRHCpB6qeDBmla6wiKQlGCIYmFtoICU0NPX31f0NNifUYlaacEymCNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=UgrvRRAT; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="UgrvRRAT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c28eef361f0so173485366b.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787597; x=1789392397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=;
        b=UgrvRRATI/dMOrr9BHAIcGsFGYw38dnHEJoJEDjj/kP2pgZlxqL/8kDZfnW+jUPe5U
         FkA6ENYCxXD+NcgA1NbbU+zDAH7+Gk92w2+P+8JnMpYd2ASsDRZW7cnp/CHR5H+iUGxr
         CeFXkI9InwuPFG/OcxZgrnK8C14uDC/pD/ZQ1HThJv4K0vvTysNS7CS9Tv3TOeNVvTio
         99Ph0nuADUTIVaPamcBCMEDhC09gHuj/4k+hu/KgEVmKJobLsNqCA9/fwBeNK7rzsrY/
         q3Jgx4KQf67bUdn6F2NrfEAbIdkAbNW2tKvOLNBV4/JwtncNvuuqEHWPn6E2LNwBTD+K
         aGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787597; x=1789392397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4soDR+0gZiqt37Lbe4DFFhbgclQyHpPTsvSalKhA+JQ=;
        b=VxNLA/YhOvdWQbd470iRkpXisJu42+blYocNcI/WBM+CvlLI1EDbgqGPCwlu8EbyXN
         cePLA4cccU2EFCsgAwO159L4ScQsZ54MhSdwwJQ/nh2TmprokzRElhILXPsYawjxBNCd
         56EZOGAAVzVD1G+tgoVDGY1kWGQQSKIDhMzi3o8zlxequIme0dHnJujhWCfzpeLQfuuu
         bAdbD8E1PLhBx6811SNBPPcvJ8mjDGO+SzkiAd+2MgrLmwmd9LIIqFoA1XTgxGp8TbJf
         7hzIe9efK5d1VOz41NDeGoAAcrbuwtHWziMuy4Qi5UN5tgzn2FaKWccWyKAlX0UwcRL/
         jBoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1ni8dWKpZ4JPiOvVQYDnVQa2Gm5tNQvunHfn+DJyXabQjWjAI5N0XS/pl4WBLhBHaNhdeu5bft0Y/@vger.kernel.org
X-Gm-Message-State: AFuF++kSCIyaH0ISXZSebSNtPNL1YTsQncIen8HElHvffcyiOXh3GjKk
	OHEJOOT78JZVWRzeW4UEt7I/Ony/+zt2bTIVrEuUCUPbsaThCJ5Ky3nIQ++52rF8nB4=
X-Gm-Gg: AYBFou3fRJBFoXcnjHy6XBgUAkeHarygpneixR1AsN7Kk6HwlMLDmT5bBvS1mEr8V/Y
	waknCA3EA6ruQTjEOPTSA4UxtgHEpgK93mJoTthGSrL6It/SriEMVn6EeRDAM6Fk3fD6D/ZDQBH
	d89Lwlnn3lGcsi/mT1RNl9c+xOeQZ//4Od6yiIwKEcW2oc3jNJwNoOFh7vrXL5bbWoPhXXienfu
	DOzXGmugAYrFNFlbV+Q+yOI7uFiPD1ArCuGrIigjaGNqhVxBxOsotRjcjiIJawv762BBpouwy0m
	96bFQqhXv68FEHK8lEAxEMV/cGGDXDRFobZL18IJu0X25yf0oMRS6powZ3d1Tqpnc/7UyUsplkq
	7CnWtFNyw8tMCdbCExEFlBV8DKokNKJRyWpgRQLcDZwj/nACtwA6D4HJfv8O9B93XGdpEd938WL
	QHmYvSPmZj+KTB1OqGIIsns99cgmX83cQsuQsB/MqyIpKJfiwTqvIoo3czEg4mFoykWzs+NBkq2
	gdrY0U8Fk3z3LpD3ZV5/3+fHcWWl4Ly/dffRZzTZTm9PGDk/LpRMU5voWvVFasa/3F7irO7x66A
	Dtae9MBfwEhsNz95j90As/NYdIhPr1gXNYhxbw==
X-Received: by 2002:a17:907:3f8b:b0:c28:e01d:1d10 with SMTP id a640c23a62f3a-c28e01d2ae8mr393259566b.49.1788787597442;
        Mon, 07 Sep 2026 06:26:37 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:36 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
Date: Mon,  7 Sep 2026 15:25:33 +0200
Message-ID: <20260907132617.1198548-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the QSPI controller and describe the onboard SPI NOR flash.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

 .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 4012ea7d07bb..985ca31e74e7 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -463,6 +463,21 @@ phy27: phy@27 {
 	};
 };
 
+&qspi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+	};
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0
