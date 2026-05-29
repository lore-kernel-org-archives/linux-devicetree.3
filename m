Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CFD3F5BD4
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070180; cv=none; b=IPQqshAFMKyaqTHRCxfXE6lhZ+t8AGo6TEGuZX1YXr98PPkpH0thRfWgIhUrYTnCNw7ZRGbhZj1qBBPU6u6xeGXW6hndwjgl+5oeqbjBqcSdEHrzdrKkLvOUfqTS5JB+8uOqlLWxJx+ZfNY2JmY5icLXRBbYcYLTygXlUpTJeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070180; c=relaxed/simple;
	bh=Fs48g0nH+1gF3T0e42VFBE+ZBOay6LJvZnSTg+IQIdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=liSy7eCVBH1XC9JD6xmDxQJzO9GwOm25mGItfisBOnzwuGCUIiODZXDkezMe8lVNS8So9QLVjgxNGB+xSgpOq2sDEgwHrweEqREzjDMUCNWwQYk1GbXaEzG5vJdaxfhfGgHtUohDJ8N+3uoTWTuVgF6L3uMA0zLW3uzb/WspwY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/C7S9I7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/C7S9I7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so69714325e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070178; x=1780674978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXtmoRa4P06Ph2LHtyp4xqyCcrT4FMd0i5231H6kh7A=;
        b=C/C7S9I7kAh+kauxBIGin+XjLBhbu764VZksyY0y5HuiT4qKv/AcH1o8Ps4XR/eKat
         XwQNPHQa3xNJgeotcjVPc+d8XqAuuxvYRwZHWduwl01emR9cdj3B3Yd9reAwToXT1l1F
         ofN6EK4mv6Y/LaO6kiGMhfzAjwJ9ayh8aTOGPCSRV2cJ4H2QSPoRPinpkTpR0449y23V
         KctnozOWS6TyV07tor0vdb6xAacdSVR2wZtTiHim6R9UYJv4vd2DaEWIY8mkDS21Lmh0
         +mdbN2d1KGGQ2QApmcBi/lDq1YwlSqWN3ZK12MyNzfVY+WDAtq38F4sFXoDHFD3VfXAD
         jGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070178; x=1780674978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DXtmoRa4P06Ph2LHtyp4xqyCcrT4FMd0i5231H6kh7A=;
        b=amEljBWqCRvUyjNopdznlc54xbIY8kKfpoRfSP9kSsQ7eBwFNpnhy4As95Cm04jx4n
         taPGzL/DyqcgZ4QnNxTf/6ICyd1nOK+bqHe2DUZPGBLYKy8j7eNneI6j1V91+JmpPwsC
         NoIeKk7HCjdnXSxyBu/pVFOuJwm/O65UqPr7aHdIe/ohghbCrL7eOWAFdHrWLMrm9GYK
         3F3fb/RS3AclN8nlnhfHoADBjvWh3JijzomgoZwVn3dctO4SSr94FOWndFSA886GpcCW
         C7XnhrcaRnFsjRX6humMn3jtrGRuhywIRjzHSRwmILHH3y/qSzKeWOQ5mrfQeojXCff/
         38RA==
X-Forwarded-Encrypted: i=1; AFNElJ9OSnblzuy8bZ34jaeH0S8A91XLQhouJtg5pRTCBTU85QYkzxrdTA96NOPZ2xwLxbD4Kh6s5cPhoMuh@vger.kernel.org
X-Gm-Message-State: AOJu0YxcRYJ+GFBIUOHfz1gUDrmeg3L5RULK394A4a1a+QV5WVg9MMEj
	wKfu46cwEWkp8Aa47LsXvcdf0+lkSdlozB93FJO9+99yz/SLkoJUtgeN
X-Gm-Gg: Acq92OF29SKfR9oJGY2jEvFtxpAo66+5Arct2ZKchEVz6dzLg5DD5JOm0V9F6QJQcdI
	3DwWBJOW8XHqoUUGeO22JdIzfNiEnm2JdDgqQPJd9PMoYjtQ4raFhDlKniCtwF1RloJFT/jy7RB
	sKAIAA+RMfzDN1hcVid/KhRVjELMIVxX6l3rotU40D5BOn+6UCyM3+l0XnS1zUDCZgvYbjKSioy
	PexyI7eCc4vfmBpEcJ/Df+iOBXc3uxcmLS9jyBm44HcHCB5Q5D//7oLp/pcQT68RRi7BmTRfXpN
	paf75Yn69NHAbTlRdiidt+7Ln4vFK8WIqexa3mniZVUnN823HqvW0yyIO7tJDukpaeC8UQm5H9l
	rdCN3g7b9qzYOzlWLS/v+k7OdRyRs7vbvFwc8Xw0/rAm2px9R2V7/zT4OR0prMBRuhtvctc+zxj
	Qilc345PzC/JBnBfWnF6MJlN3D9lCXUfqATMp95DMgm7xdt1S7GV6iEQyICpEa/EMfNkzH3B4bE
	DScW5AcoGIf1fdcex3ej4WhXq8S9iGFrkjODzvi
X-Received: by 2002:a05:600c:1382:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490a29e4449mr1171935e9.11.1780070177866;
        Fri, 29 May 2026 08:56:17 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:56:17 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: rk3568-rock-3b: Enable NPU
Date: Fri, 29 May 2026 17:58:24 +0200
Message-Id: <20260529155824.3099831-5-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529155824.3099831-1-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

Enable the RKNN core 0 and its IOMMU on the Radxa ROCK 3B by
overriding their status. The Rocket accel driver binds via the
rockchip,rk3568-rknn-core compatible.

The NPU is powered from vdd_npu (regulator already defined for OPP
table). The IOMMU node is also enabled so the rocket driver can manage
its own paging domain for user-mode submissions.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfa..d54229123 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -779,3 +779,12 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
-- 
2.39.5

