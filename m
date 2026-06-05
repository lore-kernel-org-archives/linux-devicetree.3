Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FA3254BB
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662014; cv=none; b=dfqHZjQltZ5+413lo+12dfKJes1WxGn5mgSJRgJ5a3rTxW8lM8ZIq5sItrDNy4osv0LYUow1jslTzYJ8fDOZG6aizVKpF2BAtwi3X7PdNwGH5eyb1CwYsWlAXcY4QWcS8Fv7C4MRsKmP8DojB/RA/ES8hoUU4zf1ykc2DTAFPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662014; c=relaxed/simple;
	bh=u9m2WwsAUh5Coh/I3NjhlkfL1KrpsMcmoa+vDwMzK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoVLX4RSFzrwXxOO/IF9wgcledyt2i2akPWuvjkH9XZG06R3ml7dEbTthtGI0MwrNzE1yCmgvdT8nQJzBO+wZ9QnuHcEKVo/2/VpKE0UnCkHnkHs/yxiln3f6wOUYW2angK4tIciLkObg95k6VOonBadhp+PKiK+L14ZV1RqeJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MyvtBQKi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MyvtBQKi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4602e2a0372so1099000f8f.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662010; x=1781266810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=MyvtBQKiQE8Eaj5JM12XrUAHccZbyYfNVKVm9UpChxUNslI2mhqsRJwgpBoUgy6sxr
         APl/ebD7jIqOHgjcpXhogMkHg/ZYFvAr/4PVhp9vFxIhSAXjuqaMP8rTxgaHBeDbNNnZ
         yAAtXx1jhcWOedr8JNGe6l6MMVvv4ev+LjBjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662010; x=1781266810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=CNoBZ2gOQ1gWVk5+z+hZ0rUvzDDeXy5KxnXSSFkwCUuMrGT1mShzoZcaZv/r2USZiQ
         mNeBin2Nja5sIogMN+PEcT2BibYPXDUD5Gh05hR+UKYJSdBXQSuTb0Xhpr9Hfk19X79c
         GOkekwSHuhWIqvfmZDM9vONq0IgLV9vPFe3qWv+GfDBIWaTJO3DmqFczFZjZ8xlrv7Q4
         RkkW7QC67OALhBTlwfcO0GoUtbQHqvOGLy5aKafC6dqThy67xssHJGP6kTOFDrd8pyEx
         5s6roAtAWeGfK32nV7ekOFSBF9AmOTlyPFOQtl3XI9O5qfmTIzUxcXauU1aF/ul8p6a+
         iT0g==
X-Forwarded-Encrypted: i=1; AFNElJ8ypzLeQooGezJHOq+YiW+drT/knHGXdyy7HjrOeUS2GpHO6iwCLPB9dEVBspAEInYy4/eRMX7Jdp/T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4iOpFsY3/iufvq08wE+PzDEhFtTw0WsxCi1AwhZRw1uzu8fRI
	hC2IYhxm2HorlcOXvvvhDmFzfK/pfLiItVTdQbaiuruLYk+mrRp9Qx8zmC/Lw+CsLmY=
X-Gm-Gg: Acq92OFCvz+R7lUupIhPjk5l+oKimj92CHn69KjuEXqorDExk4oyOuYes1Va08hnOjM
	0ehCD7t2VLkcwo7XYIV+28gathrc53LuIeECNceiPQ5JhySsdEllU9aYKkR8XESsqBkoVcjdg8p
	bbFVxNcXgWyEaROPomaYFTnS6nQ555W131yxizn1/C2lgTygsKzAUJVYHh1t3wCzTZr9qxCpAKr
	hqtMcflDKYT4uHlWmBudd+KQ+fPPlUMy+BiJP4C+hGwXwu4BZI3nsaAUySvlCOlOGvaygmuMWAx
	JNOa7oSaYc6oWEpWdBqF2PwLs/5bLCytwRWzyGNbCr821LtkuJgCyJ+49SSHmvn5/VL9k3Ekl42
	CqV9B5e1n+yVz0pQqMRbOvJgzjqLWc0YpD/Z4v1OP6DzVq0xJ8b8+ALqGMRwlk5dxp6BhfcBQdE
	HHlETRE56NdQIVwQwdM2LGbJtY+4WtQwi29FRj52r8tpvjQ7ydd1AbkHjQ5CA2wRcoQqLVh4GvH
	Ar7xEGKzGSrihlgPH2EmLpe8rvWAra18Lr9NMiwBnjYr8uVqGR5rotLOOmbbBPG3h5mRVy5tm+d
	+Uy1scW+RbzXhRjEo7Tsf/cN5ivBjuxgFq4=
X-Received: by 2002:adf:e00b:0:20b0:45e:ec27:b4b0 with SMTP id ffacd0b85a97d-460306435femr4423966f8f.18.1780662009486;
        Fri, 05 Jun 2026 05:20:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 03/14] arm64: dts: st: add CAN1 support on stm32mp25
Date: Fri,  5 Jun 2026 14:18:14 +0200
Message-ID: <20260605121957.78409-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0

