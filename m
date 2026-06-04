Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C3348165E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581188; cv=none; b=f7oGL/TV5142Bg6toD+FkLOXhhhvIcVl7TFxmNjDqLjlpK/NBy3wGCxdLKrwbcKkDrFievpeAFKuJvqs7ZR/kVwSibLVi/25DlPvpyzs5EKqQYUsthQmNW5QVY326QmZ1XdPB/cp+o3c+J5Q9Nk9bY7QxjJv/qF6JiZ3sclvLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581188; c=relaxed/simple;
	bh=ilepAD978lUz3gU2spyy41VvdLx7IfB2hzbepfux7ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nXKKZcx0DbJUZ0W9XfYedlklbWKfDGMHT4GO1Vz3z6w6Ke48NStKIxXNoJZlHhvq3Nh4PjIpVjMLt9gImS2AfaJe2EjmU1LAPPQPfjvLBFNxPmLr5OqhoaUdsr5ulYWsMKVE4RjDUTBca2tgydhiMiiGNvxoQgMGWB40DVG75wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nlv5hFyW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nlv5hFyW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso9105615e9.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581184; x=1781185984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AgZYnyS4i6ey0fjJps0/Fygo8+mCWzQwi4kSxOwSD0=;
        b=Nlv5hFyWGQCftqvVeGhbyLlxyP7mXXpx/MNWjcE1ODkIsSTHSXtgLPkkxEKLQB9jU/
         4HxT/EUsnrPR5uXUOV7Ppon7TTbBDHc66aQVdQssx+faWNRXUKQSLcM/ifPDPsXuxJue
         dk2ul6pi3iwFG2eDXdknh7gV7J7TuVQPucDVtv2YelOf+fhtjv0dquM+eoIVLMf5oIti
         FwJl2yGs3qe60JuqWO00wpcDDrIzQaxUYmIj0dzxjPrvraBeIbozHbwqN027Ww2FYmjo
         UmTyBp2hx48bRLdGAaIxMbx6+SbHUAUboiUntxwFRSF1IOqu/EGtpOM/jzJOoYFpvW7y
         6kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581184; x=1781185984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AgZYnyS4i6ey0fjJps0/Fygo8+mCWzQwi4kSxOwSD0=;
        b=A5HrMALi1wsMvxVf3wtR3UNtx56FZsc3Ct1b697JmqmhvROkA5pB7Iwm7E5hyqo9Kw
         E3IrZWkN7f09VfkXaKVDrIaMPJoElqQefT+Ho4aaUfLyoJq/t/ewvKzyNH9Mq3s0Wzfg
         GUDxqmggxIP3FXQHpEbGek/3MTa1ySK1roWeeU9ozxgR86p/1FEhkeVjxXoqpSX2cWva
         fwMqd1jhVUaDe2D21CyJIeb+uDQgfaNyFfnGwXCatTudEOxrsKaSzbaiwn1NDlm1MKl6
         2bpUuQtwfmH0iiAECPyx13rh8zw2/DLzVUaHqwfhbBhP5Zf/2ZmkvN7xY3IAjOfcSQ7D
         vfyg==
X-Forwarded-Encrypted: i=1; AFNElJ+W4Fjz+x2Ee4FVsVHffkuH+yN+GyLD1Pwe3pJHXPJhBhQJc1vRXN0P0s1soECoMvhVvSRBa9Ad7Zjo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqyw3mqJazilY5Pc5dMkjB0b3yB7B4ld0FFoPQYuu534LqiijL
	JgSory1KiDQfDN+Rcw6383FS2FEq8CPCGFcQ71FBGr60rRyLuEwDyvvZ
X-Gm-Gg: Acq92OEHD05C3HFDFD1jXFGRDNg+n4ajUgbGp/+yauSEBd/sYFSgR+mj0opei7CyOKF
	IzBW0LZv2EiZI1ztmnmnroPekTad4a+MuGKWJLdxw9BgOJvUCH0FYlCLI7zIWYJaK4uO/uoxIRV
	V5791+59vpZMvtAQAzoPiw66k/RdjbGBf2etDIzW7DPwi560scNUgUhAB9rNsb0HH3a5Jzh6cBG
	JnW3t4GU0u7BF0XRiSja66JjcKD/m2FJnEu1vmxCMn258BgwsScUN/ktEnq1NxUiDqm9KoGYzJo
	UjRcymnkdO0nhU+6275WHfdNaGo0kQWNVabOb4UCnYxY3hzU32SgY3/mqCk366iO2sQIXhsHhMO
	9+Oz+iIL+/oso7DbZkFdATLtaTb2J7t6FbD7/Oh6w2vELfXGiHhwSTV7gOMjiITVJ/aWrfTi7Kp
	SpMP53UHDjVoEal9l+2bz8iPTJ8yOimF9SURFns+WK7dqoZPTHtM+63enAoYDWyuU=
X-Received: by 2002:a05:600c:5288:b0:490:b473:8f78 with SMTP id 5b1f17b1804b1-490b5ec3ae6mr133508845e9.17.1780581184471;
        Thu, 04 Jun 2026 06:53:04 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:04 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 9/9] arm64: dts: rockchip: rk3568-rock-3b: Enable the NPU
Date: Thu,  4 Jun 2026 13:52:55 +0000
Message-Id: <20260604135255.62682-10-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the NPU and its IOMMU on ROCK 3B.

vdd_npu is marked always-on so the rail is up before genpd de-idles the
NPU NoC at power-on: the PMU de-idle handshake needs the rail powered.
The PVTPLL compute clock is brought up later by the driver.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 69001e453732e..7ac780ed313d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -330,8 +330,10 @@ regulator-state-mem {
 
 			vdd_npu: DCDC_REG4 {
 				regulator-name = "vdd_npu";
+				regulator-always-on;
+				regulator-boot-on;
 				regulator-initial-mode = <0x2>;
-				regulator-min-microvolt = <500000>;
+				regulator-min-microvolt = <825000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-ramp-delay = <6001>;
 
@@ -787,3 +789,13 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
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
+
-- 
2.39.5

