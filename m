Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816C43B49D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752298; cv=none; b=HvkTVG1o/xGN26eFgULzDFC8Y/tqOphEiksoV2wqcSDP3vEUK7rl1N3zOus9cdKhdOyxIOXnEQFEkrtlg9j226vrxrXT1wPWRBKLTV37U3nhQvdjjc+q61PesWUlX6jzNmL5DMxIp6cpYIs3fIZOuWShbsX4EiSpnUbRgOCtHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752298; c=relaxed/simple;
	bh=ej7MF+RkX+ntdWc2Dj/eHFF66Qpw3vFR5EcH0ZPrVOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCnBBn57pYK1DODyDhLKomLRt8vr3LHurtwLVmuSEXoMBiuEmAyQWuwRtBf14mNHdc8Q0DjpIHvvlBVG1wMoZ/EIcpGGsQ0PB+jx5KaxylkZ91eZgaFvYLgq2jiElx0TSAZtFrs4IoP94vu9tDx0CjOdv8SrR7eJ5SXuM9ZUMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aoMxsiJ0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RgW61bM6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aoMxsiJ0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RgW61bM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HO7EY2uSAl2r3/4QPFjAWAR2NbBnS+jBGqUz+JFZA0o=;
	b=aoMxsiJ0Xv0dD0jBnnhZF51lqDtyjerQnocrRkrizU0x/bfIBA2FQGMTILDUICtMq/RllN
	1Eqfvr/D7d2S4TiVLnA6UgOkX6Pjk19+puPpDmo1bqXzVC4e272wIHPrzaZqi/sLn9Srt3
	9oyesT4XGTBu9IbeN4Vt4bCFg874s9s=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-szUjWIOtON6rLSrssAktwg-1; Wed, 22 Jul 2026 16:31:33 -0400
X-MC-Unique: szUjWIOtON6rLSrssAktwg-1
X-Mimecast-MFC-AGG-ID: szUjWIOtON6rLSrssAktwg_1784752292
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-664e15b53d3so21577329d50.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784752292; x=1785357092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HO7EY2uSAl2r3/4QPFjAWAR2NbBnS+jBGqUz+JFZA0o=;
        b=RgW61bM6WzpI/P0EHWbdbzadhFPoSFpQW7pDoqu+OmpZ5giF9NDSs3T+xKgVaD2gPU
         Apk5B7gUCAF5rdSnHjuu+JsL7MbJ5rm4NiVqCPehArwHVGtUCShtk57VDxFkWU9P0lFY
         queMblruUsOZK9NZAOgP5+5n2BJ1e52pj40jb4TscgH9V4DmlqSCFRf1xc29Tbv06T56
         TmP4Em8gSUow1K3yNBjdoS3oNX+CSUE0sB6bb7tBc5TgiU+yRZxJvZ8J6EevWmHISZTS
         2lQEDYzXyLftATIJJ2MYzAy+ixyUxeq5DK8DcfCNwZ+s6Cytpis7hvdydsocZXXG+mgp
         +iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752292; x=1785357092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HO7EY2uSAl2r3/4QPFjAWAR2NbBnS+jBGqUz+JFZA0o=;
        b=GarimnoUeoJQEGE/UGCBTWHogAbcQO/KB33AAeOE9mrdSpBcNC6JDX2tTo0aHAh8A3
         DVIh3QNQvjXpkReW6fZaWaxARJNgBwEVG43tINUXaUHnESxQEWxCbB2FiZYgRqD7yGM3
         Y5KscS4lRWWHdmzhRwjK2Nzi6kKwiJCmlFzVqyGV9qeLqmLGfP1jN46s3SWQllgWXn2d
         h+vzwX69aYHLAIypYhn8ShPO3hyd8v0fXiUDttk1xQZEjPT0SuTRIylUZzFVYxw/1i3V
         s+lTr1jqkpVfdNeTgeMU6WQ2m/HGGyrJuF4/WdxgpEjTtXV8MXIBfbBmn4dmlxyMOuBE
         J/Dw==
X-Gm-Message-State: AOJu0YzraWuNIHKHEc24RU+lXYXLMi3h80Oc1uU5F7a4vY+q8GAduY1g
	LJcBePDVPw1XDrx0OiBVB3fefVyShK3i5La99pqt8F9VGNEJRZWAZAFyqrU5FZ1dNhHMP91mnjA
	nEFNdVIsCHYX4uXKQT6wcM7Q1NW8OXOYRPfZ9nmsOemLGfSILjXMCp4z64h5yIp8=
X-Gm-Gg: AR+sD11ozut/YBg5ZObn3nghVkE1XYFyS196/YIPQfRr8BpJp9vLRZy5+X3DTswIUbh
	cxRLaX+31AFAL8ststWr94n2UiaFviIXp8dfmiOWfUBCZmojmUVr4MSE9algHTYvU9gMNQWZva2
	sR3pBa0CUtZW7yXlC1D6PJd2bUHGCUa4dlIe44G7VcdzF6B3hOPm4WvIDlv7ZlVd3EXRiRNrggB
	IBawpjqYJEj+50P01nmZSBaEkJH7vF2wBoMImZZlmT6wB5nzrtjSIKhRUrTFkEaM/3aZb4cTEaO
	+XzWzVmaOwegWC1kIbMU1vTqptY6H3UboEAiXKm09HJZ4HMJObbjCg==
X-Received: by 2002:a53:d884:0:b0:667:b238:873a with SMTP id 956f58d0204a3-668a4fb48f6mr21503d50.86.1784752292274;
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
X-Received: by 2002:a53:d884:0:b0:667:b238:873a with SMTP id 956f58d0204a3-668a4fb48f6mr21488d50.86.1784752291660;
        Wed, 22 Jul 2026 13:31:31 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:31 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: k3-com260: add eeprom on i2c2
Date: Wed, 22 Jul 2026 16:28:47 -0400
Message-ID: <20260722202848.1817988-2-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c2 on the K3 CoM260 compute module and use it for a 24c02
eeprom. This eeprom stores the product name, a MAC address, and a serial
number.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258d..a6f160dca19de 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -26,6 +26,38 @@ reg_5v_sys: regulator-5v-sys {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
-- 
2.55.0

