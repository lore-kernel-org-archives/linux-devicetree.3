Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A96F42668C
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121982; cv=none; b=VnH5lZqr9X5jf/ILaRg+vZmL8CeOY6zV0GG+hR0Qk9YQzvVgCVmYWgIggGaopTVqDls/Dj+ThoTs7kzk+RgZjwk0ANeQwcQcVQvUVbUwS7q4AbxB1SKP4phw7EQo5wFtLSWrHslNL6uWdb2cgniFqOFAOSU+/X8EpiOEEHpWccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121982; c=relaxed/simple;
	bh=SGOPpDLV0gqqGkCZ/XViYuJN/Hf5A/89ZjmszRVaOS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQ6IQucurMDO5F1xqGeg9KS9CqZENl63hhXyxTI0WnJf6y56WxkF6jhRDS5X7hOOmg66+KBx0igNEEWqS6IOZyoWv/HOCpd9v3kwV9YujgsNUt74THEKni4b4LwrGz1yBiSpjAXGTKXVRm/JbJ7dIGOBhw0QvK4UelLXi79VnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UevedRYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmimsG++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UevedRYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmimsG++"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l15M3687109
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvMir0HSM/4SkaDumxYF7tViaxXS6r3B0JB6L76Vg2I=; b=UevedRYTR3m51NBp
	NfZJ9/4aS/is5FV4kJvCGsIAnYFxteqX8Egzc2TJ1lu6anXBwCFtpIV1AQN5SpSk
	dtkJMAN69L7hyFdPZaSr8BTXiYSEkwXVYXt3qeHaGix9ZfgxcN5huXfpRUMeEzE3
	/FefuDbQWk6MTOXw0qZjmtu92A5klZJLBuZv3v4pVt7vxITDnkuQwKSntGqVaz6W
	f0ohWaK9EzJo0XQi+5gucVWmsxdnndlnuF/MQQ5Fg/rbaHIBae5C74T+Y1ZvIPPo
	t0dEemMLoOH5R8JaYH96pIvZZ7oHOAaAHEOIP4yo2FoMDGfW09glm6mx4wGJGKVa
	9ZY44Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1aeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:19:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a00c45easo116297585a.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121977; x=1789726777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvMir0HSM/4SkaDumxYF7tViaxXS6r3B0JB6L76Vg2I=;
        b=LmimsG++WZnQu5+k9Oh6xWEEUGYSxuQRflvxQ2xOabHzgxio4+SRZOhfruDbyH7dec
         dXed83dtMlj0EAkj+dW33koOSR5Fg/5nSGGQjb5OUipovC3wgLKwnTqI0SheIYh58UPN
         v6lN0pdKVWIa+J0WgN4xceTY+C3HOPmVK3khVdWxTj6lzz39TBBIHedzSxFxxnUXwu3N
         SwFIpCyi436aykS23lbuq8TNGFYU/tG7WSwBcRTpw/pc5Km8nJsbxgIZpu0epVeDPATS
         YN6Xffbfrs8BR0O7chIRy4+dpwRqW/HeaBft7FVXuX5/MLFgB/9V7iRrksN+PdBhGvmi
         SIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121977; x=1789726777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvMir0HSM/4SkaDumxYF7tViaxXS6r3B0JB6L76Vg2I=;
        b=JbkmLQRAeqSbYSI5QWnoGh033qZD2hhEEGdqQPSrY18QoLnpUbTY/CGKanwkUtUZKA
         DXef/+tdMstkfEgDqIYTHjZT+NDIaJgUclqh6rK/L5NRIJTai/BfGX4zPmtktB1fLdHk
         MeJSztJoBHDQcxSfnVXBv/qGdNwN+uOUA0asWGnn0rrxgbG7u1xRGsQcTsVU/cE9VuUX
         U8trVm7Pbvh2gPwwG0bJsR/ZwfkkaZUYkZz6P6wRhhaNrIFmyeCZ/if+2DT0MaV9yprV
         jEzIedJj3EwUqlPtw8FtNdA9IOqFUTQGoCSwssO9CszqD2ESoykvnZVjQS/kXvBUjBPY
         DyJg==
X-Forwarded-Encrypted: i=1; AKwUvByeR1hmnEDSWMgQjPyKpWXFUaeoD3+YyB41xAeGEx74oVEvzXQIej2HHZG9CLuuCbAsnCOt0qzm4el+@vger.kernel.org
X-Gm-Message-State: AFuF++lQp+1UbZECZiWdVwUEznRVkMWaFILUiIfZYHcFKRHYw8Rw+zbg
	T23t0QXfgDldOQNsmz52yBpMH3iXeqkYfoZl1c3Y/wepvO4Lqh9oC/I7hlV8Bhav8W+XAKAcCp9
	TfGzKh7QG51YAf1uKWilO+CbC+dxLJAGE3Mi0P/ZhOjrvuN5mxGKq+X3U3EmxD2kM
X-Gm-Gg: AYBFou3ZCj4VyYtLZl3JCT/e07aTbgJxy5cCDrVsz1z9n5genJcXyRNYcH7huuVTzu3
	HCyhK35b4Kj2VmIQg50xk7oMaTCdJeB+TMoyQNOjGzmM3dcthBwZJM+JCf2AO5K3/01huM4OuBC
	MJEExArlsRbtTmsxtdOdyuWrp9iWqXeQdLkTKg6yhWUJGvCdVgLWwJfFzfQ142zSEcRCYyAhorM
	AGn69Pe8Eyru5gZoJ3kNL9svG43wfrSqwqdcb8XLceCgVXEWgFrAMIEP4hYhGwZ3KL8GIpqNWoF
	my1qUECLE+UGz0QFsuE9+eCOmtLZ+KTrLSJs5VmLHmzteJtmlAlUhOmYS8aYf9eE7alfnl4xEIq
	9jTHhkjU5byY8JMB4mfT+mMU=
X-Received: by 2002:a05:620a:1a24:b0:939:40d1:2d6d with SMTP id af79cd13be357-939ea27718bmr402639785a.37.1789121977082;
        Fri, 11 Sep 2026 03:19:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:939:40d1:2d6d with SMTP id af79cd13be357-939ea27718bmr402636085a.37.1789121976660;
        Fri, 11 Sep 2026 03:19:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:10 +0200
Subject: [PATCH 02/10] arm64: dts: exynos: axis: Re-order properties to
 match coding style
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-2-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SGOPpDLV0gqqGkCZ/XViYuJN/Hf5A/89ZjmszRVaOS8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WoW8AvN3mfb6v2sGGOz6k+bsyijF5GZzKPn
 DrtdDWiXYeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqAAKCRDBN2bmhouD
 1/9gD/48S2bYyx3rvAW9sH9Km4rmU3/qOggmjCVor1qk2G7B2A7+pg0Lp9582LQ7IeWkfMgyECm
 XEnTfDHIM5cAswj2SKh8UiniNSH/2TJoOVWVJbFhXWOQZS+AyYIichZ6GjBsdHvWXVsTxVhrdWC
 2c3PRujmTskmUfu3APj9QPtwixFeJEFluZUNkYc3L4zpQtOrkmwa4LRotvTE7a7hbCKJiNeKZf8
 MlFWbj5lYC0r1ROTwHUp/Um6n36eTeZedhllOyslchrRAjxgrO0vqPmKtpQYXvsIH5gz9GIYtj1
 3b6RSwy2cMdAbRIB0sqBbat65J8rO/dtHbHSObXgWSb3rPAxkH1uQbUvnpi+PMBhk/+gKaNfQPA
 w4jJ4m7VNsHKO5ynmLwfVYQK0PrekiLjAHMD63ySSZq0f0G9A7vUMMaaE/rwT1p0bXo3u1wkaXv
 al6vIb3fT/Hc01N2bbZWk2W/IY7vdRstHbNl9AgyGoj4TA0PdBTVx2Li/ZLqmMxPAk7WPHsvIt3
 n4/2y06Mh+TCPMQhgNZbbmluKpG4oKTXMR3whDbwWpqg7nwIqcRbfXQWGFZG+UdVeLT4LV/ZXeC
 kB20Hc6og1AvmKrLQgVophZV/cKCeGkbXUT0IdMh8qmGiPWuuVH5wP2/6U/+mG7Suurdw9wF4r5
 BSbiFjALniUbK6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: KOwdxvHxHjOD-4_5gLp0wezGIWU0Te17
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX+Tr67DFnRlCr
 wTE1hzMShWzKdvTIW37GSQY9AZvkeV50cx6mLe+YYDmdwtcE1qYmS/nWIgiXRaO37/GJlRrMDzK
 i0DKeoWSysIWxLorSpZu9ZWhaETyr5M=
X-Proofpoint-GUID: KOwdxvHxHjOD-4_5gLp0wezGIWU0Te17
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d5b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VbjUSUq1SxbRpkAW0NMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXzOCCBCZ4ClXb
 Avq5JHMIIYQlHqCRvZ/mGVrzggRNi7ZICGTUDh3vQSNdNtzSvsPE1p80A+pNNwVsbevEIvofCzI
 +jvB6Y6fikZRECOkXntSni9HkHwobWm1YGzNsMN32PtqyiEzV3Bxfc8X7MNRNPHB97CQFAyd5EY
 rp722f2CQyXxO5ZI/UbBP+BRb6nzE5F6meEEFrjWwKvo5PvkESNNx4AX3/QJAMwSAeCprijUKve
 4eSitXTtzOX7gGiFnCxD9WMppwBMc+DgDK18186HbT6IWjBl1+hQmNn6OO2BS5XlZjPYtVD0UbR
 tD2DkgT6P2Ph9lpg05ba351ch9YqvIVFyeUvWzZc2UOKJgH2EboUpW0OhjiLYhYHPw4MP6K1/G8
 6ME8vtiKBpgM7ipkl2G+/GUj59PZdo6usYHKOC8GfExaCFtS88ycWerbYRO2PCOPJADp3bPkWAM
 xlTbHyXexifOVzKrw2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  artpec8.dtsi:69: [property-order] property 'local-timer-stop' out of canonical order (should sort before 'arm,psci-suspend-param')
  artpec8.dtsi:232: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi | 4 ++--
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
index 853b2fafc8d1..9cfaf4935dd4 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
@@ -81,11 +81,11 @@ idle-states {
 
 			cpu_sleep: cpu-sleep {
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
 				local-timer-stop;
 				entry-latency-us = <300>;
 				exit-latency-us = <1200>;
 				min-residency-us = <2000>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 		};
 	};
@@ -229,8 +229,8 @@ serial_0: serial@16cc0000 {
 				 <&cmu_fsys CLK_GOUT_FSYS_UART0_SCLK_UART>;
 			clock-names = "uart", "clk_uart_baud0";
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&serial0_bus>;
+			pinctrl-names = "default";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
index 310cafa14f5c..a92af2ed13f9 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
@@ -98,11 +98,11 @@ idle-states {
 
 			cpu_sleep: cpu-sleep {
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
 				local-timer-stop;
 				entry-latency-us = <300>;
 				exit-latency-us = <1200>;
 				min-residency-us = <2000>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 		};
 	};
@@ -261,8 +261,8 @@ serial_0: serial@14c70000 {
 				 <&cmu_fsys1 CLK_GOUT_FSYS1_UART0_SCLK_UART>;
 			clock-names = "uart", "clk_uart_baud0";
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&serial0_bus>;
+			pinctrl-names = "default";
 			samsung,uart-fifosize = <64>;
 		};
 	};

-- 
2.53.0

