Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789697;
	b=hlt8A/qIIV2TluxN0iQXX+buoHMgwmiQob1MW3Ftd6uKl/F4yjcrqVqNssHhSHdQJPBx
	 TqpDfLVwyZY7QnSd8LVHy73WDK6ZjCZQ2ratkJ3Nx84VLubgnDjOlVolRunSpSd7FOcIg
	 IDbvQNl1jb/f1GFd7d28Bjn9F7P8lSRnksFF5P8h6Q50bvI6/q2yIhEJt1HW8IO88gGt8
	 l8PTwxk5VERpmm5ogshY1grLFGtjpzlVL3JuSASPdJ0ggblwpfWe60k4AqWtO3F1KRq99
	 h9VHOIQnTDYlkNASpPdWnDnOGqbXb+t3SjO6lBxpiS6Q+bWbruCm3q2v1h05o0Dfl9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=;
	b=iVoOD3+wP+uowEgERHr0M6BTAqDJ6Z24j0XFowjkoll+TsrZC3jvG55jKTBUFyQ9hKJC
	 dmClrWIkZoC7K+ZfYlV5Nb/hpDb+Vsp/6C5xT2O+eU6PlS9j7tiwDnNMDUqm5uqxq/2XA
	 n4DK8pEm3i8jci8/p1wEKInrLpzvnTKk+ZH+cuf7LbXgmmaUC+EPyvpWQ6Hii3ANEjgom
	 HdbtuOehHvmIApq+XnnCx2UrMpuCa8J7hQswo9ab95qaVzM5YHT1cLDX8wejqcXuKQovt
	 wnPhJxfnf9y+1qynDkjRpSBx8kbdAJJWjja8geCrE7NQd5ncZronfR2+Z+SwTXj4/+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FT6V3ISw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7teC3ko;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886876074688
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886876074688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FT6V3ISw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7teC3ko
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1GlR2376247
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=; b=FT6V3ISwho7TB3xG
	Ot2TUIo3oSf+gwR1jBpMy/ued7gfsJg0I/1JscNk2aMhLM1fRNKAxFbW9YozIFLd
	dz/Yogx7ez8nxyY+heDuCRx/HZrsoT/OEH4kQ0IfH0mTIoVBD2RDTR+Hx6YrYbmX
	X55HYqvAzSUe3Cw1EHOp3bQDWUZnp/vskiAfBgHNzyvtZTfeXrn6nutkzVCJGtaN
	f+3QAntl56q9YtecV5nPzNn5TG0KgfaBOxeHUEKln1pubZ7H1XY/32Yyhn2hDrx9
	0RPvKP2r0QxPg69dRh63xFW8MPIpF+Nk7e46iWtBF31eharAGL2yKPLaSWVl73lC
	3wz0hA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huen0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:28:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0329e57eeso74264965ad.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789695; x=1796394495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=;
        b=X7teC3koynOWcqlCpfBNXRNtb9gFJXGWg6gtdkc+B+3wV25faqC4TmyHGjMHcvkOBR
         7yj89JF3szTxIRtRjZxkbQwW456x/49zqfuN2UH3N6a+4XWekS6La/XnxT3cceJZjRR3
         F+f7qJOzW4i0FQhjNYXVmZqqpEM+0ngiUbRA//xPeifrRtPu6iJRn45sY5wioANR3+8P
         zoKF2dklu2DPTlA+FAszoQViztYgTLYxcF2hWKTftE9OmhCGW/0fpQ3vQOwfosIDrx2o
         SnD4RZ/SVO/k7l/9OrO/1cLGIK05dVSS1yh2eL5zyQCX3KG+0prNRDb4Q98XmUd/fxjo
         FYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789695; x=1796394495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=;
        b=kJSlfTcCvqap4K4gMsrEYHs55FXZSSbwmsTyOabP36s15fMHZykQXGSRkO9UMey6Af
         fJlMba2Dl8EiIyZKZwnCFO6UPXYxARcII679d28R1IZJw4Wstaz6vjTg1taN01sxHby+
         hk9tWUco4tNX1V2AcGMrn9KKtdOBP30v+ZL2KMTJpzUJW4L47Dl6gbzpSe+Uxn8PsBnz
         UubgN5JnCWqk4M2jWvbYohDhpvySy7qXr7P5gPaCfgDQ5ulxJfZVGl4G2nv7z/g3ZCwt
         P5toFytfmcuXh0iN/DLEDxnhkrBVWu5jFzWRqIOZyQgyjzKjN7W20U2aeGy8VEAdbLBV
         J0Fw==
X-Forwarded-Encrypted: i=1; AL+hErFdd6FW3pWvIa2a0p1F61wg0gJ5tGVuRb5HcXyqiuaRXxCwh9d5WNIdc9TY8elEFFrtEfncDoWMJR04@vger.kernel.org
X-Gm-Message-State: APuU4Z+DRBV71Q4vU4tnUFQXlfWcZ+/2DuT/j3MgsdFUqYYLmN5Dyyz9
	NHQkmEAzjvw+tgsWCTt0zlcyQ4m+6i2vbpXu1oL/K7oFh9ysRi2HuTrom0H1CAZb/4i8CoiYX7c
	fOqpsixsR3Z+ts7+P30gF78qhUDLCsCrgnb6ED7lIwB+G6JrjWikE8aN0p7x6T2cB
X-Gm-Gg: AZFdTZePdMEJIMpU3t2uGvMMm1DL3Tx+BGMpLUistazhvpFIbdPedEzJmHwbCO3aQbQ
	wU3glfX9Ykog/jsdJP0zyg6y1u6//PWenu7JoHqUxWZUISAPxkHSzyag+CEPk6D+HIs8U35Dgpk
	XkXW2GEhZ9Ssa5C834OiLGcKDKAd2VRRS6GaWo9NcNG8VQUkev0sIoQ6bGpJGoKBTahS3PKbZV9
	JontDiztT7/pN7WdzvFQyMRBjTek35aq2aNPc6SSo0D1R0Oy0+eMwX9WnFVdyiXw148aDm6E/qY
	zGDFnEr3X+Z/ajJNhtXuiSXgxPO7ZqTMoxuwJrIlYwC8/LcZmHDWFIN4fUr0ZYUVwZ6tlk1SYFG
	zU7hL028AR3NNgiaQeWcoAHN/Km0291fXI1ybzV5I5toHzr7Mrz6QAtaLvagawZ68bD002wjbL9
	+352OhfIgkGQ==
X-Received: by 2002:a17:902:f647:b0:2ef:e130:1505 with SMTP id d9443c01a7336-2f03f17d196mr250496615ad.10.1795789695006;
        Fri, 27 Nov 2026 06:28:15 -0800 (PST)
X-Received: by 2002:a17:902:f647:b0:2ef:e130:1505 with SMTP id d9443c01a7336-2f03f17d196mr250495955ad.10.1795789694501;
        Fri, 27 Nov 2026 06:28:14 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:14 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:59 +0530
Subject: [PATCH v28 06/10] power: reset: Add psci-reboot-mode driver
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-6-da05a33b08d8@oss.qualcomm.com>
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
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=7143;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=NVV6ctNmJcocqp+yl63j0cDW83nqUgzMxpE5o8IMcX4=;
 b=r5OxQL6tuFpVBA/ojrnN7LBtq03jexRXu6+2XCqJd72OoQDZ5evVcVcOyfBX2+xQHIdLLE7EB
 nRLL0mU2AIxC3dI2eEu1ndD83dg8uTRDwRuOLWpF+/q8zynEtOVGyB1
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX/kTFY/cFM7W0
 sBWJtDYIXDam8icByUxqjwmj9/IZCng14h6L8pePXSYPWEkKkbc8af8dWi6ifiyAYMbF14Wr+Ac
 6h7rAzBa0lljkwdHnRwaplxXA9XSiyE=
X-Proofpoint-GUID: imAoC355tTMBhFUhAtvqEtQsTpMt1AlH
X-Proofpoint-ORIG-GUID: imAoC355tTMBhFUhAtvqEtQsTpMt1AlH
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09937f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=OTBdipT0aglEIzt2I9sA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX422sAScG8+QE
 b52rUS2NtTCPhULZ+M6z84vHhaEouJQHaMNg1a4Vy7d2ckL2DoGk9Cwu7Ueye6IbSjSNW3WFOjg
 luOub3jT1Yp+giygsSaOtce3ehN5AGeVmMc5gs5WnsI7kdZpu3ywK66ISZ4KOyRn2kh66HUB6Wg
 bl8QvF/pwJE/+1n7FfiHC8uUT0788iplCY/Dh3zxkhaVgkiE2KCnTofJxqENpyPjZdL8oSpPySK
 1JMqQHd5wEAZD0FfhdjEpnDEDKcM0Xl4VNz8excg4cDNU/8AJXcEtcIfuR2zBXV4eN4GE7x5zN7
 zpd85pC9IQ8KIJPS8/rGiNTDiHpwTH1jun4IiNVRxsK+xumIwVzw75gETDS124tM4VEJX3CL+3f
 96Y/6L5G6daJ2hiOYert710WsIkLDhYFp9LE0a5iljhYPtCmL29uN344Lz8e3KrR5X0QF9HNLtc
 wjrt/u8zTtBVOuFi8hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add psci-reboot-mode as an auxiliary device created by the psci-devices
driver. Define two types of PSCI resets, predefined-resets and
vendor-specific resets. Predefined-resets are defined by psci driver
and vendor-specific resets are defined by SoC vendors, under the
psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                              |   1 +
 drivers/firmware/arm/psci/psci-devices.c |   4 ++
 drivers/power/reset/Kconfig              |  11 ++++
 drivers/power/reset/Makefile             |   1 +
 drivers/power/reset/psci-reboot-mode.c   | 101 +++++++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68811a0b7916b..3c09d2240a288 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22534,6 +22534,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/arm/psci/
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/firmware/arm/psci/psci-devices.c b/drivers/firmware/arm/psci/psci-devices.c
index d23befc490ed5..04f24b8d99431 100644
--- a/drivers/firmware/arm/psci/psci-devices.c
+++ b/drivers/firmware/arm/psci/psci-devices.c
@@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devices[] = {
 	{
 		.name = "psci-cpuidle-domain",
 	},
+	{
+		.name = "psci-reboot-mode",
+		.of_node_name = "reboot-mode",
+	},
 };
 
 static void arm_psci_auxiliary_device_release(struct device *dev)
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28f..f165a41d40ed3 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on ARM_PSCI_DEVICES
+	select AUXILIARY_BUS
+	select REBOOT_MODE
+	help
+	  Say y here to enable the PSCI reboot mode driver. The driver
+	  registers with the reboot-mode framework to configure PSCI
+	  reset commands, which are executed by the PSCI driver during
+	  psci_sys_reset().
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78ef..45d8aaaffaa16 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000..bbf5477e46cc1
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/*
+ * Predefined modes use two arguments. arg1/magic[0] is always zero and
+ * arg2/magic[1] is one of the values defined by enum psci_standard_resets.
+ */
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/*
+	 * For a 3-cell magic, arg2 is the high 32 bits and arg3 is the low 32 bits.
+	 * For a 2-cell magic, arg2 is the low 32 bits.
+	 */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  const u32 *magic, u32 count)
+{
+	if (count < 2 || count > 3)
+		return -EINVAL;
+
+	/* Unexpected value at magic[1]/arg2 on a 32-bit system. */
+	if (!IS_ENABLED(CONFIG_64BIT) && count == 3 && magic[1])
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0],
+				  psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct auxiliary_device *auxdev,
+				  const struct auxiliary_device_id *id)
+{
+	struct reboot_mode_driver *reboot;
+	struct device *dev = &auxdev->dev;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc_obj(dev, *reboot);
+	if (!reboot)
+		return -ENOMEM;
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported. */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+
+	ret = reboot_mode_driver_init(reboot, dev, NULL,
+				      psci_reboot_mode_write, psci_resets,
+				      count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(dev, reboot);
+}
+
+static const struct auxiliary_device_id psci_reboot_mode_id_table[] = {
+	{ .name = "arm-psci.psci-reboot-mode" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_reboot_mode_id_table);
+
+static struct auxiliary_driver psci_reboot_mode_driver = {
+	.probe = psci_reboot_mode_probe,
+	.id_table = psci_reboot_mode_id_table,
+};
+
+static int __init psci_reboot_mode_init(void)
+{
+	return __auxiliary_driver_register(&psci_reboot_mode_driver, THIS_MODULE,
+					   "psci-reboot-mode");
+}
+subsys_initcall(psci_reboot_mode_init);

-- 
2.34.1

