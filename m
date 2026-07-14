Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56993064A9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049519; cv=none; b=ZSo94w8O6M79aW7qpw5wZdBjuD2Lah5CjM2hlWRN4lT+PK2vGsb+0z5s+vr9+P3wUb0iY8Lx2sT1/BGKKkBJWVMVgH//Hvvs7gwuk/f9Ob1CnZ4dxa8Gypphei3NSM1svaLfz+6sFpAxaW8bMPozLu72nuR9cb3DGC3QMqWNyc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049519; c=relaxed/simple;
	bh=Z/HoJXdAtZ7QJgARbgQpZ4UcAlYil6V3oBtsMpR4ihE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSfJWcx8GcoTiUH1nvcwM5gRwndtIVR0TNbTeMUkV0DNh6gA/j7CK5FWN9c8/3L4yMpTd2RFZp8Yzef8YuJKjYYJsxNDZOuS4nMYA/SgvCni1j2eKDMC/BTXqWKeZAEdPkShLot4z5ylsRzgbUBqwB/7ULvC6zl7W89BjIqGdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyMiKhuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAPnZh0w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyMiKhuB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAPnZh0w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6qSt1003075
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=; b=SyMiKhuBEFGFFMOG
	LAglW1TGtpv/TspKS7Wg3pvdduKYdbbfmGDlAH7ZKt8tBULqrXsn9uiHVVJkDgoG
	W+B9IpwImW9+7Yn1J0t5CeEhONPr8r5gxb1vOFFGPWRDiXINfSu6IhY+XMvE9OLN
	RMTd9uyxtWqVBfl/ZDUuqhXKNL80/B11nO4AqON2iXz5ghYKsCQcKRqsMKqBnJJ+
	pY0P5grkstTY4pn+v6idCcmd+u2VfipEYrotii3oFGfll7NjymxlsXncsMuVzvZH
	6A+G41QOBNlW1UHBofIp1ZcElq0iuK3oR/CXChgkp88QfmAr2TVMyuwXZmKyQiZk
	+w70Fw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a3514f912so4530864b3a.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049516; x=1784654316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=;
        b=UAPnZh0wT7HoNqtfp24yEguHlQ0XSy4oqaZ/oQnKK13q4GOzIQGiqLADHqjso98TKG
         q0iJIQ1P2xaY/D83GeUUALsg0jZeSXkAdYEblNCeEJhGwH41UPQ7JaCepcmyNP7eUL6V
         mK47B8N2PsNKQUa+h9L/hD5zW52a9c/sp+6ChutGRxMuTHz/Z+0FijEw/E7Bdu2OvcBA
         sZkcA8In3TSKnwVoc6tFxFBc9OLKJQ/YTJPZniGVJCyTQXCsQ6GP1QWHBh0TgtE4i21Y
         6pvooyHHjRa2karcg2PGVtVpqCFUYaHhwzJDX4ELN90OjRUf6a69LMfA41BWrRuGDhvu
         RH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049516; x=1784654316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lgh4YODdsRL2iadze+USZ/JyD5VPsxlZsZRCppKGG/c=;
        b=kttam7W35DS3HcTzRqWD3Gn5CR1MxbHLFuycQz+FQPYw03edwG/H3rswx6ckcagW9q
         Scv6hPV1Ejx36r3XUd+du+UlJrGY3GQz5uchygKwi3NFGoaBgShzbDi7idFQrhN48tAe
         FCI3Fxmr7JbMTOMAc489N8/OrBV9yt53H6+ltw46i39xDa1OVeVqwTdr1M1VQlQlsSLK
         a2GJjzTz2ynu29FijyeBL2c4hZaPGCO+NvrMhecDD8IyO40tvRIrRbWLED4BvQ/maL2g
         n2pfO8rfPWHFJ/ApumrnMxuL2EykFb63yzoZOtD3ZC9sXaGgX0OAPZ4TIsFE1QnOt4qt
         0q8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqm8gL+LmoZFhVo5+xsUpTTI1JWfuPvdo6Nd5OiXd02PDqVzBcB4se0+ZtzGTV9gXbvTEtPv6HnzMsi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wn3TwFQC7+a5Dn0kFQihfeuuYk/5DT/AX+isDyFyM1ozIH9/
	NzT1hSnE1LKk5JHwdOKa/y+bNRHEVfWh4M1hAj+layRaUkKfMPrFN+rvA3WvLQSsUVUhpvPkEpR
	iMVVlKgnyl4cbqqpc0FUEtWnShx6SqHBFMxYpxpKuCrY9d1s7ERQ+9+M8Mw9weRBk
X-Gm-Gg: AfdE7cm/BrVnz6b6qcGDlURSoQp5GJreu3L+PWr5KqjPVIDfWjPHRF96XP0iYbZ8vVA
	aiRMJoL5A3tXgFdwmnynetpjXJySyDkqmqSI2xT599iOqwXHu14KqskdzgmuwTYeKGJa+xEIVGb
	hSqWmC/otif8dDbnXEQcZZ/AzBJ7QpHu15ghLs1wb3aCgv8XHZtNcDDECKqlyCuDdnzIQA1eDun
	QQtt/NM0EkUi1GYl16AmvOIFd7vkxqzFxhgjEzpepUvqDowygT1nThXC+y4QOkmcAywPEz+7aN9
	zTLzRL2CQ00hdUVzmMuNnxvs6MUMSh4OkQn2/Llw31JciQiVh6K1idithgWWTbRP9SL0/CaAjj/
	jw8kYHqvHENJ961PghnFI79d92ybUQUrlHjsApYSVQtd7fjY=
X-Received: by 2002:a05:6a00:a0a:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-84a51658d90mr4261333b3a.68.1784049515428;
        Tue, 14 Jul 2026 10:18:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0a:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-84a51658d90mr4261285b3a.68.1784049514895;
        Tue, 14 Jul 2026 10:18:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:39 +0530
Subject: [PATCH v23 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-11-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z/HoJXdAtZ7QJgARbgQpZ4UcAlYil6V3oBtsMpR4ihE=;
 b=NaGRjqx/cA+/1xxaf4JRY1stuUiBVDE4/O5+Y6k9ajUNbjjxsYWFrascqLHoEHnRcwwMr0haC
 V0njs5oGlkgBrHPIGEO6WpR56MRLhWFK/13OcpxwoIQxt5U9fMLpEoP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX/gTkMOaDFnfK
 s16BpgLnQEmQxk/+3i9oy3HdkVGe49Gk5ub9EiUhBsXIJsQQWGeHhZ+y0Ls3D5PYStloVjqpYhK
 rS/QZc8n1px+BMg0h00MmdFTug3ORys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXwOCRxn8EpYTa
 G1kti/E48yW5+5jEOgL6Q1vwslvDCiUIP+jhtuaaSosBJNrE8Xj5+t9iAn0u8npZ9dwxhMw+Kfa
 PUTGn3pcEKDSQoVrdfS4K2+RC2xn2Ym1pxqKycZSm58gBvCD2EqnEWiwcatmJ1rnAmMBYsNew2X
 hSvMG4cjSodJNYvkoUNcG1mTHxYogXj05SoIdaXX3kEIAnhuBqmuybYYGbOh+WnMQTavFbwDQ/r
 /cafAAuVwUg94cjOwD9Js2ewA0DuPC0lJpIDTai7RsQJ5LLePJNGqX9Tipf3mKqr6qvD915CkKX
 zlNccWJ+k5UuXVfcRbE+OOmQywZ4nnLag2/gN8LAOKmy59vIe7m39IGpb++xdKUnoFa6l509Ozy
 x/dSwgCQVEU8vFP8J0/sashQf85Hslb1Qm1Ntn8x5s3lNFKNJuRgaz54NFr2bP/qC53C+8BYpjo
 ptOKosdhDDi/DTa6dVQ==
X-Proofpoint-ORIG-GUID: at9Xa4vZVNC_pbOx2R66-pNtqMrK6Srf
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f6c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: at9Xa4vZVNC_pbOx2R66-pNtqMrK6Srf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0c53640c42a6..3baad102270d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index cefb8ff00806..cc96442403e8 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..55a3fac0c4c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -549,7 +549,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

