Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264558;
	b=XwhPiy0yFIzRq7Q0I7f3dpobV4/1laiH6ulFMVXFAAYelPfhcHky1Kg0JphM1m79PHaB
	 luSwJkXP3flNpTiyvXkv36v/8QPkB+znl12Urqf5JeaB/DJm2sPbsn3VOCVOQEJ1ffAlO
	 gzwn2UpbM98LSbnXQP116Kecfwy8UEvZsUm9A7zzpLCWa73Rnj6J/Dufwd/5GVj8ScAmd
	 rgeVeJhRxUH4bgT1i7WiA0Vc/YGqwL6AJ5Wt24vOEAjOq3AE9aRi98iMts50ZM86oGkJi
	 bpjcj84uUehVYrNPjx30D9JkmcX74XVU948kIB209ORY0baXjoQc0jcUncbP2Nq6vZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
	b=ZBIEfvOkijt3JyQeJc1kTdMHXzeQaNRsYUJZRJsYCMmEwD8FZl14VesEdx5z1V3USV2Y
	 2ctS0uDBpsm9NcY+yAiap9tF/E3OF4uH9UCKBjEfd2EuGp7fSY9s2kaFneA/5sTZUqCxg
	 sHkX93uJ3TZX8FJyMu/4KL2uMnBVdRJ1HcxkPJOs76aOiklxjc/1iWTKJdOuhYHZMAyqJ
	 x80+LBroGNcGOgtW/CRJdDqRgtUHtniNhFdOXI3WuXKQeIMZbpff2jwdElAIi2XeApYuZ
	 V6JDS9V8oW7I5SYPcteQbB+FwIauJbVJITkZZ5CYz/OMEuY7asWzaTXE4QeGA0oayng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKqGF1Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ic7hLohu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9760A2604
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B9760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKqGF1Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ic7hLohu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDox2912456
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=; b=NKqGF1VvtwIDpwwr
	inzRuKWlzCHrLd3cZGadTm7aUbKkNOGuRoldTpmGOi7tTNYVDgUzDiXw5sSEv6ou
	RqJiH86IVenMFITE6Igdbzdgx4bZA2VSxNvgkfgm3xIt1f0IgKOVmZr53X8WI+4i
	zyVhx/RLgBhy8BL1zgiVPdpkuhAhYY29GMpWfmBZ9+vP+Dj06wg8FLlZ4MoumLBF
	XpVpWBzDJHSV/Zw2Dfo4GdYXouNxrTnlygj4YY4OETu7sh+lRlxsN0Cz5xhWWfKj
	JXmFhftlshy7o0dGiUODO3ycB32Qzj101OVfBAZ7XokoynyrQ4qkE8i7lyrqdmtL
	mHRQkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2b62d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:02:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so361444a91.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264556; x=1793869356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=ic7hLohu00gy4YEutOZjDefzc+eP37xTvgZCA+HRnRJ0l1boTcPZ49wCed863Ci3pq
         htuqpDS1n435NX3W3bfvuwJwtE8mB0XEoOgNRXsOx1FXe7dyilcNS7bQHo37IMAnGlx4
         ZRFuli5Xy4GiyUYbOQdD11T0cNNDe/7cxMeSZAFtNHjo/EPAFVTAymPeJe/70mYzru+s
         vhIkqRy+ex/nZLPJKUokqLjhLPYFKoyT5EV+Mif5AVdSg3/8z67eq/K6QynDbyrFgW42
         bsEcvrUGDTvsNBPKH06sMRKO94JuxsSJKuJnolqPCpdlY/Ptz1dpsTjwnhWlrGcCww5p
         JqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264556; x=1793869356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=qf/pGn/KNaIRVKlJ51n19nYb9LR3jSo/UcwOEn8zHOT1DyQ1ZYt8rXZPC1cmmBh9x5
         ZGRXiH6IrRmes+ZoTy5+JLEu2HFmNr0q5Y9lzD9Ixe5P5Gzjooe1N5H0iZcOPJkoMoei
         V0ub7sDLjxzT/JLBfIc0CbOlzHGeRH33UCTvXDjgbDEZDMKplleE/sZOAMy6atK7NpzM
         tqD8w7tx4k1R/Kzg2haEi7H7jdVOWlCIPjKTqeYPRdlsNo4GABfl2NvRsfRa95lcrHOn
         E9BTPWXawJ7STr/jd3XxQb8jjf1tmOo0jBkGz5F5Py51nYlAs0WyQuFFPL3+KlNjGzrn
         Yj9A==
X-Forwarded-Encrypted: i=1; AKwUvBz8+VXKktELSDDi3l+4oLXR62XILE7aEs5IOGrsEmYoo+N5XBcJ1O4P5WsmBcHBNUiqmvA03tf9fkc8@vger.kernel.org
X-Gm-Message-State: AFq9FYIaJWvUqUzeXohbJctGH0VpjJVqwZUjCZcFBvBm1okx6XGQG+wI
	dCyyjgT9PymTJ+1jrY947SlS6eh1N32iaGtAJWGGQrlyNoioIxIpUIDfJYrIWjmlfpBtsEIQ9ku
	UPDxGIEc/3EZ5PW/jAIxwUW6bVfC43VWKOzqIVzHSk4NQTG5Kx63qwvBuGi6hTo0s
X-Gm-Gg: AYBFou2gAsCENdQ9P+mj955zmzJJWXXQIJ22wxPEY7JOrG436tduh6p2XOUJEAQp1HV
	1VofobygOrmIY5akhM7M7SyndRfk8MswznCMGkJwNlRBbsIkQK9HIcmMCczczZVptDk9YrIB8Xi
	c2QZHM4Uiq9sPhhylMeRotDMAPKXgx5oY3O7GzzPpIMtJIqLw6cRLqCDDp8kdtURh28ZtEnNRtU
	a1o9aNSDB9ZEbqi5PUIomWmRSSRD+PiuHtqbYD83DpZYwLtEIXgZQkvBHAG6EWiO3fm+HpbMrXN
	2Gt0kKD1CHDGyPWfb/plzFRHAI2t5zAaj63oiNwnRS8DdDjzfazcu+wTkvTp8D2jEpZchvh6wvN
	KBJz12kHVU7jVC8NS+IHCnywiBMlr8SdvikdV032DgotB1pgfi9Ez2DVqncwbjfeFhX5OwJpZLJ
	4mL+AXhoQk
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3666984a91.10.1793264556376;
        Thu, 29 Oct 2026 02:02:36 -0700 (PDT)
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3666958a91.10.1793264555885;
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:02 +0530
Subject: [PATCH v27 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gUHmNfAuWSYEWCrqca1lth83sZOdzcZT7fFtab0nqZg=;
 b=tZ6kTFHVewvVVG6bopBgc2U27Y/TWood54vwPyEmvAH/mC5OZWsNPa1HWUamZvs/3iiJ8lujn
 d84JnSP8NaKAUic89Xwjwa9PH4byCgb0SIYM6OYeBNad6fJoaTHUdow
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae30bad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: T7JoZSUYaAvXrFTn8Hxz1OiXPQ8UW2_w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9Sf818WgMchz
 cksb5VECWxEKIVCf/T8RvwBVKc//6Ppz6SMYK2rFpXguzPeQI1LJZ6lExoYyVUwjCG2Il7m3Z2v
 d8U6MuAfO6Ax9anU273isYPBpRNKYbs=
X-Proofpoint-GUID: T7JoZSUYaAvXrFTn8Hxz1OiXPQ8UW2_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX/DA4ybwNyp9I
 jcUiABBh0zYzvl+7VANTw27T/jDQJn5gBb2JPERXde8unu/pxdPkizU6bzLZW1SMy3g5PnUrdcr
 cgrhbm2cQ7ugEPbk+k5EuIhYTziWROoJEw0ioDlJ91V2y0xJsWXFZx9E+TcJ/bXOiHGskwoyhJP
 +p9u2nKTPx8qinMWhy1FtAqdZt3QAj9D8dt/ivW2tUhtem85LqEdnj5+KT1ggPyRpd/X5LM7i8M
 k+MEulybHVFSSL+r+qWDnzHpBJQaR4eczsgrvzg71RGhoR8t81Djxe06u5r69dUKfzC/XQZB+Et
 Ph4FmQ1VMWjQl9QHk5rhEUYLI5Lfly0LI0TJNacro1XfuAcCkq4kR+1yEGy7quOaNxXoxjgWAdN
 lcyB2xtpWfsBgVrF5SNXHz0FGSyW0K2j1M9CRNZpfSJXsf5XI4Bov0WirQdV3EMhfUSi/N9mpa/
 +goZRRCe/qyqp8NiQ5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

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
index 23cf20f9a178..4d5fa2ee1f88 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -912,6 +912,13 @@ usb2_id: usb2-id-state {
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
index 22f764b8d721..a530a363a9bf 100644
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
index 1fdb72fa5518..6564eec6bbed 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

