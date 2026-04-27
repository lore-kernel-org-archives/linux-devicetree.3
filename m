Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763853E5EFE
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311437; cv=none; b=ozKzlC//oE4JbGDkiYQFZnqU7Z8b+LqI9BX+MbbWi3XZO5zrO0hGNNiBfxMwm1zTyqR6coXu3fJc1lmtF6Rr937FgDZjT9c6Bkl4j7uu2TB2E7jW0SJvwdl5JZvrN4yjhEz7QifChQfoMNC03nbSxK0J+txwJjpRVJRbXu2igL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311437; c=relaxed/simple;
	bh=5QIzxz7gWGxheo3NhPJy7cnaOZvXTFo2HH4ZUk+68mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYL2bCsyfHYpGbo8+vv5tUrx/JqRNWF9we+QrcpE6W0go/klMcWzmkhwf1JYALldZpYdYV7HrgikVYB72G+PeuwQzYOg4bH+qM+Qp+/EnOwvmLFBIA0FCY6oTnA4y1ds9IDaXum8bKgYnei1pP4F7P7rhd3FItrYvSH/IYz+OT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa1kiRR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdJSIzPc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa1kiRR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdJSIzPc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtqM6241654
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=; b=pa1kiRR99pQd0rw/
	3Io4uUb5Ect4M7AQha7O+U9rTWTepqY+VdZPBtStrlH8sbijExxwtHilnTjbion3
	y/RhL1XNQJYxFOnOqA3AQFwgx+ts5LWckyghw/wvDcu5TJuYftDfbsZs2cNBsa4h
	GN9s0xbyjUc8n3onvZqYi9uJQbkA79yS0e5xHCauGBO4CZNPQKM/T8HNqycel9nT
	CHa+zHfJgmLp6gGhfEXfdo9NxZioFXUz6WZvzCGsrhys9sgyIqPDrgZ6qEUx3Zvl
	enYQjfLRNHStjulukiCgLJS++Le/1r7kW+dvriqHmb6gy3UD+CS+5YxCI0jQZMYk
	5Oal8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946rurk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:37:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so12293997a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311435; x=1777916235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=;
        b=SdJSIzPcWGUpXVh01d41iUW2a23KEeHnAQvLwc2Ifp0MSLgMcR8g7NJF2x3pbgN+/j
         7zGp2xRCy2UhYA/jZ9SyOBEcWPjsA468u1D5RG5KIjhz6zkv5hsgvSFz9yzK0rbfl16h
         rCxIQyPXsnXLn4vK5OOhsC0+RoPG8H/aeMDOQU6XoUNgwp+BfiBtnbkFIrhEjfbhI4aG
         SYMDBQw0ge2Z5kneozAueZ4eFWFNrhSp1mYmQwlQkliG6xzKqmQJerPA3wKba5FKr87r
         /82DquaLIpt3w8ROk6lbU4yCVVD/F7+X3LoKbyK+sz7DBoK9HnZ/heOCLNteU+k7m+Y7
         rE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311435; x=1777916235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=;
        b=SvI/SNIldH3sH3lajnzvmoASQR7aj/qbUgTWewrHtFq6moDooW6hqF6sEKAJS9VKuw
         nj3kuFiD0ZcghXnYe0vkxeOP5AbWlKdjCIP9wy5V34BDPG8c4r30kcQyuy4pJBm9CXYN
         pbg5IhB+uZ6/FbS1mNnxcfGQMkIRRfgfLoGDo8UaNM+n5lPbXqlHTL7gjRwQBaek445i
         n6eJQ5qqJzc24tIzv5vnHe5TcYopXi+VHtS7WFQ4JIidQ1QWzHvY6sCx4Xxu4lIO6T4t
         JVdbSEq7Ggb7mN66vGJRzVLxt+ZqbhxD21WLCT7oD0Ge5bbnx1Y/H7RNwAe/IoWPqfYO
         Sajw==
X-Forwarded-Encrypted: i=1; AFNElJ8Oz8z4gFlUfn5WWk4fwq637dldV+6YfxNZkf5h8pONVP0dDhK3G07rc0v2lhf0bBJn0G25qjiMpPg4@vger.kernel.org
X-Gm-Message-State: AOJu0YykDgQPAXI4ahJm08kFFNM7xINWzYy7KLhhtFjEB4v8hWceS/wm
	sxfdBYXTgvDQWaTp2RhTgk4MyD83Bg4/fue6rZ8nSJTq6DegVLw0PuMntqvReG3Q5qreOICLYfV
	1PBGQELzC+NrOfc86Or5OIyNFMdalCTov3mMXBclA1RVSByCF9bGRwApgga0CgSjx
X-Gm-Gg: AeBDietPDC7iClOfbiD4gC30Cfi1PWHfY+SsL6AXYU2XhAltncwuKXGo4mmW/eAvZr3
	TfeC6VYVA3nkkRqiV5JcZDcQh+7K02m0oPKZ+00tXzxAHEW0yZ5KHER4Ot23DXm/e/b9ADF2TU9
	q4ejAAql7jBdZdp9ymgQuz/VNwCtqFzmBs6YdB8NexAXZZE8Xs7fPCQG4gVsxmp6yC6jtms9xpm
	q7DrMjhkaGlc4TgPFf9SH0VDfWLJoeEvNyGHItHgYDdTG56G6jX3Gzgrq4fw1p6V9ogZkYgFno7
	oqSxezEavMswHZ+iFiRtUfpjVMoTEY8QNc3ZidVPEj4XpQXNqm6d76kS47f9O0eSvULaXf5kQBw
	f2UxD1otl9GLvfN3Y4xfHiN6nnI1uQcMSnFLUAtjfNYf9JmVkj2DXO9k6Q4neeO+WdHxs
X-Received: by 2002:a17:90b:2747:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-36490caeaa9mr35341a91.21.1777311434386;
        Mon, 27 Apr 2026 10:37:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2747:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-36490caeaa9mr35301a91.21.1777311433790;
        Mon, 27 Apr 2026 10:37:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:52 +0530
Subject: [PATCH v21 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-12-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2171;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5QIzxz7gWGxheo3NhPJy7cnaOZvXTFo2HH4ZUk+68mM=;
 b=325D48bjWTKLlbPLVqjl4k3qXSzuj715BcxjqaXLOtBtLhOIIX41XNRMTpsTte806BXO9r4FM
 h4AC48/o5MuBi+c5QrFZhPxIMh+5eaRSzd3aPipb6c/EUTlGKfAshkt
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef9ecb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: V_3Uq-o6BLWlFp-ULepZEM6cQpMB4bS8
X-Proofpoint-ORIG-GUID: V_3Uq-o6BLWlFp-ULepZEM6cQpMB4bS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX8ZLKvNdTuyi5
 KFNktI1beP8s14RA6B4GR9Qy0MyVEBxallO7WLaw7mj4S1O0Zh6UkjzR+4p7FCw4WHjR3eHIABh
 3vPnHlJ6elZoeiG8FedRWlYiTt/V7T1hFMYdFSuy7gA25xH9Bzd9sdpUW1s7um4jYa36GQWYmYv
 qJlpZByKs9qBkMLDBs8TZwRUaXD1Jpp1U+hycuApflaT4FMu0Z81IYcMeJCeGInqFcs3zn1310R
 y/ixho0srn488TFWdDl8bF7f3lH3pyE7cjbVlm5CMozdXR7DBuGmEVUVCybF3An1yp/pAZKITIA
 s67XcC6Y8ux4bAiUEf4S50sdHCkgxJtoLX+0xYMyffsMeEm9DLcUf4wlSOuuRzizkwt9qxMfS4p
 ZOhJhAdLNkBV1jaGTvcUP2qm6LnS1OBGjL+0MMJjxTMhAXIo7fnYfDgXTK9Zrb1BldpVXFBBpzC
 eW5HzG1K41+ZTGWnrBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..df668dbf2bc60175c36cabfa310aff625647899e 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e6953acc7fa06d22a1f83ab24edb0..da675f7a8f2d83f3598a6a7ad71a99206213d03c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -674,7 +674,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d821ca88a38ac59a78625707850bb5d..3ab5ae3124ed5314f04202b6b247fbbbef665053 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1

