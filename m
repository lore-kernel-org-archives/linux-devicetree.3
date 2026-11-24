Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505382;
	b=Jkz+BNRXp0XTG9jfLeWlDRRpPRhYXH1pAAFTVtdc9fWQqKnlg0MVAblYrKwtTo3JlxAf
	 NvUlXdT6fUFpNcMbdY21FnmJxsO51TwkZHTbSa4KvCP75LamJmiX8kj4SM5B+n+EDIyVR
	 2mgd2qXdPBVp95AFRk9lDT7yB688ItE784Y+W0oB3gbjfATumBH3VxwoG1/10rOSqOzp3
	 31LU5h87oJXt8y/Bv4eleA47HOK+LWpJQFl6A6nxaRJmaUoQeCyacRk6/JdqRFDZfPdoj
	 30ZPeDDTw8+Gq3fZXB+7KRXaw8uv6QURTRNB4l5v8j9U56LiO1XrKQKEB7JGF3WResQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
	b=xNwp38W0/0SrSlZ2WSqy5k9VcLWxUSQxvGxk3yqtyWxS+o9SJZpA/s897X8dSi376QPm
	 W/40s2/ZABLOhHVn70ePh4xJuw+eWESfHKV26LCsMwpnuMQqEuQLr8RDEAWstnAW2Q8F9
	 KotGV0HvI67zye7P/UGpM5WfG3BmqT4kRFaUPr1HbunBMrPAnEUO6JRDbt1TCCt1Xzy14
	 hONHXp2+kfuq8DQEVpHvKlLOnfCQA43n0WFKZpa5VeVcTe1byea9o4oOWiPWFGHHirXKS
	 6tBQo3zU4dcmSg5Mwj5dqiL/+eh5+ymgEC4bFCUaOvyPow998eoOICnEN+p6kafB2JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq1oP962;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE73606A32D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE73606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq1oP962
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04e3bf46dso29282745ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505381; x=1796110181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=rq1oP962qlaJLZXcCqedaZtAYzK5COV2KcwuKR6KrCes8aShaceZV0w0djk0nUTrMU
         0sJMf3lH8qAsOEkzyiBfKICVEBuJIpLF1JM0kCHbxy5b9NqNy32AGVtFT//zAZAKc22u
         8CL3NnIfthfDYqNVskTGMsUAQwL4tt9Sb/O+s3y5CIVJco0UPaKqvrQ8/IKbUJmEjSD0
         REoUcLYfJFpa/tAcxMEt8M5e4+eEh06QkC09JSobaAnMfZSKo4ChwigQa3SelnyhQna4
         0gw08L2Re3foS7TsfaeY3zevnazSMu3RHhDgXvMTvbw/fF2nstvPuG0T5LpyZOMSCMpJ
         tDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505381; x=1796110181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=Gz+VBr6VcfGkYqVJDUkJDrm1NX2qi3W2KOI7HQ5Teyn6oGaiEqKpr0a717S/Y1NUoJ
         Lf4JipRoIqin+v5sGLzupof0XwqTjt6OaQ6bvb1tvzZezNyhG2iuJb8SwwlgEWCnBTBA
         adi7D3HUAP01eAtVGHK8yVkLjQdUTflfgbxwNNwPSWfK9j3D46TpyMyjraYfb5VnqSbt
         yvSPGsyVzGR/Th8bdnMXSjozjtLKWHU3iL7YMHuzmo9/+P/hi558q/UItq9qIznsP6uf
         nf2C0ZOUQGEsEYRNE38/NUIkD3X2TlKslpgi0MD7YfPeNta/Y8jzzYRZGDR+IRi86K1a
         tEww==
X-Gm-Message-State: APuU4Z92oEgZaKVhba2g6yAg68OCY8pjbLTKU2458VV+l12RjqVq1l2h
	qT1h2pVS4/ZU5KwPfxbvot2V2XxXYBu6A7saH3AxAWCm0tPA1CBJMNb+
X-Gm-Gg: AZFdTZc94TaGd9r59fkksvg7ySrMMD/5IGyV3foCVHw3OXrgESpZWdlxGoHmMgv6/sX
	uAhSQmFKDl7FV93q4QXDMJ00N27UtmpkhWY8XkMDmadrcHON5/nkc1wE9N03eoDOFxFimJQukP+
	/6pSGByeG+6/4CsRMrfKa5woSlvSX+c2ocOvhEsxbnSbKUFsmq7Ii6V6MhPVN5GPQ0fO0GmiVna
	MWRTGy1MVBvF3WLxuUqhqzY/Xo3A8Y0J+80HObenuV0UTCoS4FMek8igVno0LphbhNFno/cHkqf
	PfvFdIdBMR6WG+qnJqybpSjpr9o0GOMkJfuR04diyyoaqIOpUyQvArN2KW6/Z84vTwHUp4oQuLA
	Er/PtjEiy7ml++pWuHn2rs5z3Ng3iHG4rd2x6Oj3O2avAHa5TNFcXqssviMpsPoIqG5N7ESRIlv
	P9HsmuSbxl1KjYqWiX4rqDJBSnzwMGvuin2bpXZ9tWQ2w4dcVY67ARKBKHgqA+5v/6qFrZzMQRl
	J57smnAMnLrh/8MgE756WpbZ7zmd0o1r+YIKyoqto/kwRzRQatRk3p4Vq4wxXzaiR18rPSr5uCL
	aDIS8QdZQTlJJC1mkpe5GduvmDg=
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr12961867a91.39.1795505381135;
        Mon, 23 Nov 2026 23:29:41 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b457a58d04sm8262361a91.0.2026.11.23.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Tue, 24 Nov 2026 15:29:23 +0800
Message-ID: <20261124072924.556678-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
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

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 88ddc8e793f6..2f9fca6bd110 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,10 @@ &emmc {
 	status = "okay";
 };
 
+&efuse0 {
+	status = "okay";
+};
+
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 320c4d1d08e6..9577aae08f7f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -408,6 +408,18 @@ sd: mmc@703000b000 {
 			status = "disabled";
 		};
 
+		efuse0: efuse@7040000000 {
+			compatible = "sophgo,sg2044-efuse";
+			reg = <0x70 0x40000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clk CLK_GATE_EFUSE>,
+				 <&clk CLK_GATE_APB_EFUSE>;
+			clock-names = "core", "apb";
+			resets = <&rst RST_EFUSE0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
-- 
2.56.1

