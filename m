Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740584;
	b=0zTRNKkHbnMY3c2BNbaschVD734Q21cftd84yiPSsrd+i22t/D6Zr8F8aSBilYR7SvAF
	 NOiFmltsIo19z1Ou77WG6mvUJx2cVMS09Bpg/kTg/mr/j63WAj3hFNzUz5uyJN9entLkK
	 VgTH8JeSKr0+Fj4dFyMAphSDpXgxJ5yNPdp0UffAnGgTGiqhtMVkcT/5nUJK3sRnUEblW
	 Hp+iiRfmgYlzotYAHFodjIhUa+YLftmlc5/1dUt5F6q/Xic+bnp/9U6G81Gm1Cv/eRM+B
	 CZEu+yc+EjGBzdp+6wmSEoa71elonTzs1o1qovCHy1TwCjypt7xdsRhRufAvPIUfeTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eLVHH3gc9lK1BMaQAW0mg0NLpVegVjKZ8M484qroJKI=;
	b=FehXIlHpLlTjJguhgdNXqxRZsKWUZtI0ApNIPDsss0AnlO7UAeEy3NPDW9aO5LgGphcL
	 kg/68DGaHhAxBBIajif5u9tAfeMgdc3HUBNEtZlSkCEYsepY0KF3at16tN0vIXW30VldG
	 bwdFPn/yBYsfic4lxjHrv+y/GOreAgoNRnQ+VrddCAnQziGWax4EGhmeTPeSLRLgChAZG
	 Mt0RhxUtXn3pQK3KFKfxDuftZpXcFHcGEUpNY6efLGm3xoW2PiuVBPtQQVDJ48f/wiQGv
	 hHFjk+WDu+ld5mRvsFZPFJ5G/8xXFBkeJxGSsoArr56SObbMtl0H/M4LiB+5qPumRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpJqVp1Z;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B2F606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B2F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpJqVp1Z
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e977109392so2974745ad.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740584; x=1793345384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLVHH3gc9lK1BMaQAW0mg0NLpVegVjKZ8M484qroJKI=;
        b=mpJqVp1ZBE+Kr+pD0Uhs3ZTNIxFIIsiBshAGAGzVbiwoIQQLziZNRV3J6ziyOSVCX7
         ed/BmgZI9xfHbZc4F4lKJJnlmJMDOy+eqrrc7kOAwRWMf0hlvfvoOqhGjlVOqXF5Q0iK
         5YfwcRmBqj7sbD+U6PA2zk3xyt9lULgqYwpstBsZqZ7H9pghMZeCkLIBpVvivOaxOwg0
         XHChKjo4xpSpsGb08zo8VJoXqLu573AzzA1J0qiHlFW89q4PFSfTtW94arGHZs62QFOc
         P76ZQjPAsy77L/JIguXeRNPmQsx22hQ1g5caL03mRRgB9Dx6BOGYUfZR+RfSoIPxOUsr
         grmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740584; x=1793345384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eLVHH3gc9lK1BMaQAW0mg0NLpVegVjKZ8M484qroJKI=;
        b=O1TQlHD0DObTS/y4xzNKZ9ZNXYdAUtDV88I+KPoKVwkKI63Q9WnNxgva4ToZq/wkQp
         OnolV9ki2ULcaUpVEOcg54j4HCaRs6y3zlk8uxRJhl75Vvli5/20zKbGwpY4VOcqDfib
         TZ6P4eWDovE1NZ3JOEMSTkD+3NqazmiqcNetIti2Qlhi+6/hpSxmwdwtcCK4F+Gk4FoV
         hnWlkTbj9yMdngGX623+9A1WhpKOBqi8o3xtwb4bzCfQPiL2g/UFnpwKeO8sTrwniRak
         cyK+9j8GyRTuFt0OSo/Gzn8T7SMwTctGyCrRlY3VDJ/yMepT0yHiUvFmr89RaxbiALxt
         bk+w==
X-Forwarded-Encrypted: i=1; AKwUvBwZGc0o9zXnE5ufMeZaLhb5JOW77uOLt4ODGFYFIE06US+qQUOlEWpj/DQW41UkcP5nYbV49yDzuAPR@vger.kernel.org
X-Gm-Message-State: AFq9FYKYnELgdAC0cAn6KlwTarbtxAqbfNm/b3OoXvSmAmbObYG05qMi
	kLHvIqtyXC0cgNNGbQllR15XA3UOaTDEgtJiONBQs1yfznE+6dq5T2nW
X-Gm-Gg: AYBFou0Y5zQmotQ4lcQ+fxKjUIQgWwyeQ8S6C1ByYFZhuct7JDA5uJOvEr7OAa08M/a
	nfAgvfDHT3xnWJkEWSZBELjU6mwcW4VOQYoFLolSfYE76L7k19/6Wc8MFbEko16RWYd8eA791QC
	ToYR2mI6RvDXD27jyaA52lwusMv0OZ9B4BCj2Slcsy8O6wA7/20VMtVLawFK6YqrKVRRT+QUeVH
	u14WM56DZxGAXzLmDFIMvrJggpvKiRjJjfnwYDB1+yI9Rw+wMrF+HWfsGWVsQATiWJSknsy5G8x
	vSfhj23vjoPGrDOqyg/iVxh89UHsVxNDvVX8sSAu+HWpEWLV+rn34RNccMmhLioHDXy60tmlk45
	q43frZfGGZ8gkaDhlPlWQyt5zECtOalPXag3IUnCB/qFsBCwnc7804AQk+TJ2hRu2UpJfxeuWna
	nX3Cq/alup4orx6ZPsidbkuI3GPKcbNJ5QX2ncJNUOGiZMxwefhdN7/kM5NOr8Ith7wARXn2QKr
	R+pRp8Xt7LsnaP2qZkQTsjicT9DulkllKtGjJcnKpo2XR+7gWBKL9P+Pf4g/aEWEH0BFN+uFA==
X-Received: by 2002:a17:902:ef43:b0:2e5:38bf:cb43 with SMTP id d9443c01a7336-2ea7ca06645mr15833995ad.2.1792740583614;
        Fri, 23 Oct 2026 00:29:43 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:43 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Fri, 23 Oct 2026 15:28:30 +0800
Message-ID: <20261023072832.2642647-4-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
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

The sm8250-hdk has 2 PCIe ports which are not enabled in the dts.
The pcie0 is for the on-board ath11k WiFi/BT module;
while the pcie2 is for the M.2 connector.

Add the 3V3 regulator node for pcie2.
Enable the 2 pcie controllers and phys.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 7a2903941..bd9b90fbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -57,6 +57,13 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	vreg_s6c_0p88: smpc6-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s6c_0p88";
@@ -722,3 +729,24 @@ pm8150b_typec_sbu_out: endpoint {
 &usb_1_qmpphy_dp_in {
 	remote-endpoint = <&mdss_dp_out>;
 };
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+	vddpe-3v3-supply = <&vreg_3p3>;
+};
+
+&pcie2_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
-- 
2.47.3

