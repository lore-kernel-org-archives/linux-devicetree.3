Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789708;
	b=MVDhtbBK9qWc/buXVTEaaSZCYwNjKdlfgYnFPFosQGxeOhlovFWOiUxHAKNQYEJsv/Hd
	 5o6Bo4abZjZBrsm7DTj0bc6tW3Ri1MYOvqSkjTpJKvS3//kQJM6ziDpOYFOUaLMMh/bJH
	 EDzPZ2mZhZk9amrAN1dWn53kQu0meU9GP7R47kdM5JgDtxW1zFLbD/104Ah+JkbuCo46X
	 5znVfEfyxXZjrHARlYV8jfzkz4jIOit78OZbezAa7Yyt/kplY+EZ5SfaV0FZYZPBXzHZO
	 rV/hfzI5MNZLrKtC4LyoYqMqcZHqiPUABC0zBR2oxA92/8/Zn4gO98chtBhg5AdkiYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
	b=uNcQXns6cscon+nzVJ5OChZQ54hC2pX6d/IqiZkedKjPA9UM0vYrLkEpRNB84ff226cA
	 pEpr/j+M8KBimIe73lejHPjr5y6zNOkJH1xh4QobKTmoIKm2kQUdynwtJLOyDW0z/4CIV
	 tutt9gNKIDP4ja+I/QKSw98WT3x3bc3cOR4mAehUk1y2C9WseIQXo0uE8nlW9ZOINOPeb
	 UASON+zxzavGjC1Tas7nIC89TfrI+wDNTSw1bjjlnPRTgNI7CbihcFZUDSQUweg/einqL
	 ae8rmB+M3LslM5X2FRI4ETrP+RCMlEKzAxFxFmcqJzd8fqv9XZn7zqXC0z1pwiET3OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPBsS79E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qg2qjCSm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4995606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4995606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPBsS79E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qg2qjCSm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Z0D1791206
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=; b=bPBsS79EvMz4ITgt
	ZIE9FSOFkFramLP0e2R0p2Nzd8F8UO2hZjbGFGgTr1PNVQKEZeJVZEUyVgqssqB2
	kvwbvJhN4IzWO+rF0VZTPPUUjwVmkv6oFAbNJZXEoS5BqTQseEqiRum6Uc9YvFIJ
	asWiZKJGLGkumLuTcUUS8qIafHn/sGvCZOm7+IxgHk59rd4ehGDLqE7Yf34j2IwC
	7iKN4boWKj855Whq/gkD4wxbvXMrHU60QCkhXmqx6MyB+uXgi79wIMBo8YQOZr7L
	loi56rLpUeOYoFI7vNYAL7bKS5uZMkAxFDDerHuHAUlJk/NhV2lo0WMkNIGUJkD5
	eZurVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3ax8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0717e54b0so57896095ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789706; x=1796394506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=Qg2qjCSmpdyWkeasQGxhK7wFbvsdElEv8MHT7JUOxPcFyy0CAe+f0YcBcl1c8wqEr4
         t8QGMj4ZLIAKIQ5EahByd6sINERp1FhS/m/eGcGFVoc5kPtp5wHUnXXyQcK50hNSbrPY
         1v2IPEQyxR4IkhnV33mXaUg4J+yMP23vrPALQlV+pK0+eqcTgNI5JmAk0+HGkEnaUB1U
         TKpRSahA0on2YpeUI9bECv2iWidWwNDigBYPwO4zU2D2HIrUnM6zUmCNguM9G6dysiq/
         NoQVAHBkEsGh01z8Myxsp+uo89acEKub0bTDarq2pOlFxK3dkNpkx1a+5MsGczPQS1YL
         Gm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789706; x=1796394506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=eqwkeZj2Q9dWFerVjooE3mQF1HTtOZFKo+T+TRQk+OXj3fspfCZ7jor9ND6ZWTq/C3
         wgsEotYl50mvshgAfkN4D7IUsSq8fjtLtCHRuzAdnooXP4OPehYqIKm4f+H27zHgIo4m
         BxRYLsjM0bJAJrc0wXFauQOpEudG5tcX+Mj8znWQ9nFYk4vab5WeVDDpuW85D6IEU2Tj
         ZAf1sDdt0a+P8wl0iUYSCVmNMvv22pT2RKmkN524s/c92prqh6tFD6aHxIdRgiEYyN1R
         jw7OyaUzVMPqv0yAGrphXXalNTvJkaAoCljNtu2rB58g36bG7KdkpGbNXSocWseg9I+v
         LjkQ==
X-Forwarded-Encrypted: i=1; AL+hErFIrCWJoJFDDboBBJ8mioRiiHdHGUBoHkcfT65S7dZ4HX/O9HBVDQR8r4H3a9mWsmIldunVa9yN3byc@vger.kernel.org
X-Gm-Message-State: APuU4Z9uuWMcLiN/L5kg/8Yb7K5vzRoRda7vzg18FKUvWYVjkaevK2bc
	dfevGlI40HoZiU3J2dzzs92kTOQUN25U1aqvzhw3//9rZXCihJiN0ErA/lhCGHkW4jgtLneRZR3
	geGD71N1w2HwGu/RH6C0iBaj44Wp6h31TMpmIaw/nzVTyaY3K7GoBWoBF3NFw19tr
X-Gm-Gg: AZFdTZez1iHT0ph1yx//zn34JEub2udlgX2FHTPtfmMZ7uGUuAp3hqgFIP0Mjbt1Fpi
	EnG6SxX6f94Au1eMVR27mUrI8p4bFsXthUEyCbA4laDIZVKZVrNZbLn3WzfBx+Bpym/JATvfzXR
	HyK8B2BpqqPpzx4OOadH2YrwQ9UrMAyaj2qXUYu9m3fb+Vr6Kpc+n31X7knonSoQrRhqa/LIiE4
	HU7CmzfKP1AD0E8GBzE20B1bkZDi9jZqataFYfaQAqqDnIenS9QUBmdDsHvLWPIxSO5Wy85eoG6
	SSPs+fr/ar6aOBTNEQCp+kCMSrBwOnOQ6Iz1k0Cl0I4v4zWuf4VZIcROFPzwFXt1w1yN5Cgrt7j
	/nfHqh6UMALaZTO+Bm72s8xXWvMGg+tn4GOhKVByb9XuZzIiB9q/m/OpgclH0cSvYQYUkKtEij+
	ehRqd7Wki15g==
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170116305ad.50.1795789706133;
        Fri, 27 Nov 2026 06:28:26 -0800 (PST)
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170115435ad.50.1795789705484;
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:00 +0530
Subject: [PATCH v28 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-7-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2209;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0YQGDiz1F/FLEBDHTFy0NPa6QbvpSRgMVp0jR7EbIWg=;
 b=hH1f/4RdTgXXzUD3HLooxCXl7oj1YeLziyFQ1gZrW49x1biAd1StmoVIoK3SxAEPlFz4X4Fht
 FHtkMV+tGSPBpLein2a+YAXPEHX4HXgHfK3UpVGEududkLK7ut2VfC7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09938a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: E4XYdy4UUZG3DjvkWTpNp0sQiHo-bshG
X-Proofpoint-ORIG-GUID: E4XYdy4UUZG3DjvkWTpNp0sQiHo-bshG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX1q5ZjpO8VCZ8
 UmaGZLdEQFYGF7eS45HOEITk6kMKc0AfEC03UZT6S4LIZaepBvVjj/+Ty3JDFT9jU3szBe1KxlH
 A+QAQEbEEuG75+ayXq5QuGqJziZ1J2vBrPAz54uGHL92rTnLU/hq7STV3OUMSn19lhraT160Vlo
 h9xmdyl1XdH8IhSGpjYjmGqqBX8ONQQMT7wo8AxcB9OL+4dbracAOSc/0EXm5l+tapA6uxw/VzP
 kfwQpYAAXkO2a/fO0iOsOtEbJY+zZj9Rlwb7vNTxQ7gHT7UGvf4Gl98gdPvstudR5oOmwsxba69
 6VnAhS9YOEPSYJI3XCMA+9I0NWwbghO11fV9zkflMid5MI6NJwGQ+7FL5aECbrvT/pI4EjAQapF
 ekM2hKzU1/ewJEZbqzYsrvVXKV3+VcFXUhVXkgY+hEYblbriJuPtpwXEr4zSbuVS/TrKGvHi7c+
 vsdXfOedMrzta8/hmhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX6qgqKhd7q6nz
 k98I/z9L7w+PLLHn5lpT2le+q9DJocMygl7DlSk3fP02iZA+uGmhlzxQApHSg3GObRJVxHMp3nW
 ++ZQJT0uxnbWCAo9l/gx5mjLN7bSoag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60..f1c27f9769fba 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -876,7 +876,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index cb90a83351c30..501e3c0d14028 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -791,6 +791,13 @@ &qup_uart7_tx {
 	bias-disable;
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
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..3c05ead3a7ebb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1136,6 +1136,13 @@ &qup_spi3_data_clk {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

