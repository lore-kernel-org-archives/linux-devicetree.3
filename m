Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789719;
	b=u7HuAu1ov5hIOLbMKDWyxbjau1aXlWHzv9FUlBi7yaL+Rd7towJ1e93nP+spCdfwxQcF
	 KITcYeUqsOfMBT96/aSuO+gIoQtN8+excyhVnN6Xl/OoyOu9skgvb2zcdtTOtpk5z7Ufe
	 25kLaHRgNmAZeOasik7TZGOLo5/GKFkKJDq8RybPcmvx4FdZlVATlYjKKFJPjqCloibtW
	 7cVv3pCHys4Co8knrcXnhfuiDHtDVeGTkUfDmQcnIMZREPaZzur163C6nI0kpZEbSSR6r
	 qDozhJhYr4KI+dD0VSX2VgQW27cUaM9Pg/rOoUIi1e0RAkA1UYnXYzurmKImN+jk/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
	b=sU6SG329aPQ3gPNbuWbEUzQ8tgXucFUmXJMEckmvKvlqVbvZftwI7x4ZyeZcptTNocJo
	 qjLB+iKAIyJSjfIojefyfMf+oNL+chIlj+efJ/41VYpE1Bx5jZ9u6TjiLSt5A1KUItf8w
	 dgmj/0HPsAzXXkz4YGCLdU6doR9CSxvmKMTKlrMei14XNJorz7oUD0foAcV8Svq6KnXPx
	 IRC4V8bhHXKiHL6e1lHrEecpg86J0oNV+RiZYdz6sHBlPpkxFlVxYRc6A+mNIumKL4dnm
	 vNV6+U1GT0hUsmw+8ZY2MuPb+TlvlwymtDaw1/agClRbcrWyhjAlh0ctIq0Kmyu+6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lulB0Jm0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwBu47WJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4061606A688
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4061606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lulB0Jm0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwBu47WJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1HwB2376265
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=; b=lulB0Jm0sBwZApTa
	ocZKVKaV6qr++oOxS1yVEAozW9+QnCdQD23D71LUCQ1l7S1ngXwE/hoq3j4SvpYT
	YCDCz6sRjA00Rlv/qS8ZQiOx7hR3XsRLDnZXi6lnlfYhRyUJfISPlRCjeOY01fOK
	czf+KIT/23+9vdGumgBa6euC4Nj1nH+3z0emeoabTYvJ70mnSe4ZQOlCVv2ptzNO
	FJSiAHlFSG2ufWZPemjmOO31DX35BZ/mlcXaC83FT73qUdYZGyHs9YUod/HmECOR
	Hb4B8gxrYAiU5PNsnd8JDIpVqrQ6VcvLIVLrqekDkp74M8vtZ8ZbnbrVxmaHB5IY
	6avXWA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hueqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f08196b148so53847895ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789717; x=1796394517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
        b=fwBu47WJFvUcKBrOrL2s8N4qowkFgCFyH7wfI+qaBgrk5RuJ5YEioVq1sijv5d4+Np
         D0SltEeQJ0XUgt82HIk9ovw7wf00kGUx4rhqSbbO1VnfS+RMjayGQaMhZyamx9VSGXnY
         os3sU2QmL1akDehFF+O9y3enFrvVffG5ghczFCoXW3+dWluk1p+ED7KOaQm1G4K1c/2Q
         LEjUHnnCHAJsHdIlug954ZBcYwtkPXAUiQLdN6NWSmp10md67kINraOVOdVJWW0qNRLc
         rMKKyeAf1Nk08E9CUyPKC6xKidPyeFYO/LQyANkpUjJm9jABbyrPg48GqRHyPhEobs5y
         W8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789717; x=1796394517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
        b=mKuMnX4Ld8c6c0XKbH7QSqvN8X1bCSxlgQuppmSphOc5tx87Yq8qxtY6q3QZP5AxGs
         PjcJQkaz2AkRAqiRR0aK9ZEWgWEXd6rZRUt+B8DTsaFAxV2PvtzOkEd1KU07NiSyQ7bj
         IY8WljzEj01bVRN6typJZxDjV8YEYTufQpTyvVW/iWzxxCkhZqIGpedsyIzY452r9Jr4
         i236uZ4V+stVxnfXsdnF9saKEysahe4dXJneAcTfAgAIwLCoOHDZp/viMEsn2N7HoMDF
         47D6GMxP7T35Gxe3qGL71RQHKBPPoE5jFAY8vG3Yc9799sm9BkHys0mflTK0YuoFGo13
         CWdw==
X-Forwarded-Encrypted: i=1; AL+hErFUpAK5tN65W+ezVQb1n2eHJHrxZl/t/3F+mZp/5dEKQ9PnHo/mNenEfGtc4eoJ+RyAOxheV6Knb4e/@vger.kernel.org
X-Gm-Message-State: APuU4Z/LttfDFvH2R5cOyI1o2epOgdYAYpzyK/cohqqOlIGtrqSwAzzm
	NLK+YYsrr7iD+O1M/8JpZ6NoBH/cgW9P1VFh0BRNPFjY1/hVqlupm1bE6WLVc0LMYQ+BLNznzvn
	MpC7983IyayekmqLE+mPCECA1U8tBYZppwFhxbFtoAR2vz25oFev3YOOSE5Ltujj/
X-Gm-Gg: AZFdTZdSb/kRCfji+Ch2jxXQzej9QH3lgPhRDh9MckGDs/WZ/G6A72p2TQGwoNu3pcS
	++rmYGzaMJMsgwofW/GqQ8N93VgRtnGUKv43GNkQhQRP7rK18E3CSoybV9di8E1C5fFUN0TKtFM
	ALN6LKpU3hvXRqWuRP6FtpVMKAzMIvfC9RsLI/IrIKSbWqUvMaR2gQfahTDQX/MoNjvA1Bezi2e
	gtBlCs3jMj2ezvogkyrK8QzQ4Og1kmMEjJ7gwkjM4/MBuSJF3X6ZzEyI6BA0Exloyv8tejkD6ET
	Oc1QnY7ULYdtMlYGgmoGkCo/VhwEXzu9LsO3VzFSD82vXfO+2fPgGKABUnMWziDeOuUHlGGl+iD
	RIXPmTBrqy9pymYcy3cHibKYxpcBzXOhvRduZHoR5Kr+JVy1Rfb5NYgdXq7AzqOn++/3++ICg/s
	UQ8VBzguH+iA==
X-Received: by 2002:a17:902:e845:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2f03ef58f10mr266789865ad.5.1795789717269;
        Fri, 27 Nov 2026 06:28:37 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2f03ef58f10mr266789325ad.5.1795789716664;
        Fri, 27 Nov 2026 06:28:36 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:36 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:01 +0530
Subject: [PATCH v28 08/10] arm64: dts: qcom: Add psci reboot-modes for
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-8-da05a33b08d8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2237;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=9Y63x7L/VrfGqCVKiXMQ6AYnOAt/WI1fwM2YMUVkWxE=;
 b=FG4TKnzLBLe9HV5AzTlr7b2MHYUXVG43f5q7Y7s9PtvUaXhNbwL2HMGwz2MozLLgIADtTWyWV
 pMafjfO+iWwDjSO+dR8pRdxRD1N3/ZyzPh0AecuOnr0+xXelclU9osK
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX95HZ5n3LGgU2
 pS5WloFZcJI4/PtfQoTTa3icwHandg1ufqsQhFn3uvlytGzwMqV3M/IY2vwOcceMdra1hyOPqFU
 fTywuJ13Om3uGb2XlZToLH8pJABFqAw=
X-Proofpoint-GUID: o6PF9ZkhlPlMPLpZ5oDBwlfShmGefcSO
X-Proofpoint-ORIG-GUID: o6PF9ZkhlPlMPLpZ5oDBwlfShmGefcSO
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b099396 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX6ZnurWGLQN01
 Bk6VfLitczxnMZE7WkUYlA6S49NaxYp/XanefKPtS3i6s98qh53rnUeI0N/fUgX5ARrC9YdZD0M
 HARFIqeNMTYffNF3h4RELKfFuX0ES9n3niEClbvcj1vVnSXze/RrqgPR9d2bXD4GZciivRCQbPo
 4OrmUuIN2lKN2lVS39oG0cbn944UNYkIarNRh+PjSEZmj1sc7d5pPHqVJHRdrcNCtFM3i/6FckU
 A2d2j8g+AGYn7+kEno5ZrAK+/WUHGxTCKJrgbm9pNBo5ThHKdlklTyRZzjCUKvygK6ETMXOEfK3
 VzHGgE7SrGaEN9LvGzQU/ufKwzrrdpRa3u/+BZ/Bk2RDo4PjgZgzx3wlybqygilH3o9WAbBMwqA
 qkaEcLSeSP+b9xicY60tQX2WU6lx6j6r5EYHqADsUQwpJU4EELS4gf0o2Pp1kc+7Smttq5k7Nav
 0NoXNK6n37N8kvBqbIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 603a3fa18994a..69617c4e43df4 100644
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
index 22f764b8d721d..a530a363a9bf1 100644
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
index e298747c06bc4..a3f0eb587ba62 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -296,7 +296,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

