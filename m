Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED73769EB
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018945; cv=none; b=c3uweCHrqoPtw/RVqmApAmR/Uvc3OiH7tb2e6l+eiF+iad9vp5L+2h4EmQsGiqjD4kuPP9g1NaXBwV8nvs9HWCwkUKi5qhmyAX7d0JyPvsbrj520chtLgZ0j+BZtto9si46FrhBrbUT9YSEaCRtAwXNEPOsGCVdyi1YzZ6AoBiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018945; c=relaxed/simple;
	bh=5Amsj13Ypf+VNbZXqe2Aip4i68WKcfoJI3MkINWORYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rE4xI1W0CKPaIXzmOMHtslJDO/1AS5gxI5a37OHAphUsoeS7pZJMPp1ZKPVZBxibwGlm/9/9N2bBQ96jb1FwV3ldNRtuHkGbLuv+DJycIhB1DC8cPwyCFExygIB67Zn8lr/MhWKYfmhHsullMgZNHD4nD85rK2pfYvDKj/7Lc/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuoQv8oS; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuoQv8oS"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so79729f8f.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018941; x=1791623741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=KuoQv8oSidVn5GsKfTxOq11yuq8ZhuV1nwJ00BuiMrqVHuHD1G4mWS6cvwiPJZptEO
         qzQTTAd5cFrF9MAjvoKNOZgS/K7TmSUfDhVbHrUnstp6T/Igou1ATf/lwUaEo+3SDbHa
         xcO1wuUr8NvjE/9MubWS0sVij+uXZMQt/WJW0IBfvJjgGZVSJYs2C90rnyGDA9GnDLU6
         o6aQKSZukNOsEP4cMqNUN3NSeu2+blA76zvg1NVhAnIadlgmgEiB3j+D5vDDX4VcdBYX
         5TmZC69xKbWzQlxIpHWhzn2cjifKY3oN1yXXaM23Iy/EOa0ii+XZ58duPNkfFCshk5r+
         sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018941; x=1791623741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=po63H9T+/eFE1jue7BZY0KKXRb48z23pxYWWb0W9ISSAGX+QMcK3RxL6+rN86/MA7F
         P9v52uQT9fYHoS3rVsDStsDIzm2r+cPQ1X7RPcCzfm4roDhpUEkeRmtDcF51d9YVVj2S
         SyOpNFUa/I1AQe+e08fI+ONbDtNuXo+8lw5164nAzOW8rcwr/FaeIlBso3RRTJ9fgc2/
         CA2emKvHw+0iK0+sM1aWndGbdSPpr4vXgYJnVztapxjFxlVsnBkqmfjm1H9XBzj6tW0e
         Y4OSCSafhOiUg7xpiQ3415bRtZK7AM0rtc0LDk+gDQh19vyTi/yzvgSt22MLOmR8s6Qi
         iHJw==
X-Forwarded-Encrypted: i=1; AKwUvBzUs9L8SOLCY7iJhsieJsJQpp2qrh85rwFcAhdoz7BVGDgaspk6piFAWeTZp17Hz8SkBJ1K6RpPEf4+@vger.kernel.org
X-Gm-Message-State: AFq9FYImtaoWJ3KYA9wwUEH0eg+yBtKQ81lz7AJT6H2BurL9ErsMjdkk
	3XgXj+o3TDmI1FqWMuKX3v9DjzLdDh1cGwVYdFG/rRItzGArrc4uMLTz
X-Gm-Gg: AYBFou2AxjozW+oOY3Jgm6cyJtSvgOpPSCpeLtZh+AfcR6QXloT5CZm7uaKAb2XgpsS
	rEc+jLU1tRMoeCfIPCGF7VP9FBNiho8Ym/u/c9jlWdImYUt0kygUSsF+rUMO0+g7IEwdoBFZoNY
	KzNS7RAno2EY9RqUajDzB0RzH0ft1xp+Zqt+lTYTtl2SBuBnG9487Tfh2txJ6QaQOu62WrfblZl
	8Sxdk6526iMMrJQ9fu/mQxAgLmoW2YS8+l/ZDakzzuh8bzbD11d1oUMIgeXAGox7sHXYRNrAQ+r
	uDlImIVL+O7W5r/UsPeJXu3wLL/X0P4SAl1HpVXfepJdYtUEQTU1cBRHXJ1tBooPVD7cTFlPx+A
	Ydi4LxEJZtu2rjqrP7vRHyhBO9bTwmMvTPtmju7a/T2C/aa5/X2acQsNuVrU5+U8BZVczKWlNI6
	cjHJGaNCcnhY7krRUUAN1eFhZ0VRy3dpyKvCg4ecWxjeBm677qiZQHAL3lO/AwjnQx0fSpVvbTY
	r8Mp6jJuH4=
X-Received: by 2002:a05:6000:2c0a:b0:48b:7179:59da with SMTP id ffacd0b85a97d-48b71795ad8mr8328190f8f.1.1791018941391;
        Sat, 03 Oct 2026 02:15:41 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:40 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] arm64: dts: qcom: x1-microsoft-denali: disable WCN7850 hardware rfkill
Date: Sat,  3 Oct 2026 11:15:09 +0200
Message-ID: <20261003091509.4822-4-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCN7850 hardware rfkill input reads as "radio off" on the Surface
Pro 11, which keeps Wi-Fi hard-blocked. Mark it as unusable.

Tested by adding the property to the installed DTB with fdtput, on
next-20260929 with the matching ath12k change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index a71c29762..36592b8ed 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1009,6 +1009,8 @@ wifi@0 {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
 		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		disable-rfkill;
 	};
 };
 
-- 
2.56.0

