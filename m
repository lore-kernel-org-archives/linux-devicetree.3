Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED6F4582C6
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521294; cv=none; b=L8XiFfx13+KAQc0oMjF6FyGVO+p/fWRVnOOLE+Erv4FM1z9eg1IhhHn4Wj/Bs2mz6soI3QUemvV2uS2Z7uDZC7+c1p1eu/UXklal2xKc+hUDEUGuMn+zwKbFHT+eAWlylgpEOk853MTnOnIaBXEbIAFznx7hDactSfkOkwWD2bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521294; c=relaxed/simple;
	bh=7rGr9Lk4a8kc8yHCwT05C1yb75lNwS6zTLE2+H5+5Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H1xe8DAo0JYk8w+ai24sPiR6/YZvE3xIyggweQ7oEVBg1rCJADVgRG7918dxJ7P5Asuk1SqqauuUREm0a8zvrLMijdAaKumhuNV7AmzwflarBYmwXpvgclGkeGf/bpkh6ETsvSsKa/qY6gxy95JWgBhAYTMjKuhMDRvgp7cTywQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+pwL7Ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSOOXFZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+pwL7Ta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSOOXFZc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOB4N1399391
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BgIr4WFqU01SLXWEicORXM3CM4Qbeh3bK3toWPvQLw4=; b=D+pwL7TaCDaBEMds
	rzMv+QEElX1vL/zQlL8ZQIRWugFizdSgP0CUJcrwEHQQTEMVkE52KY8B+D/4ll6/
	e++60jeuN9XZ1a5ov/f78XfYkeFwb/75GzPiNEDWh6+lX3bgnBJFxDslyIuakXmr
	+2l3CrKm5To6Ru8mLhF1FZdTj/XqM/SZpZUsmabuqpIx5k3dVgHtOyC1Vnb6zWe1
	FcjtWH9rdU6KAcuKBbQb9BOEge2LrSjRP5M0tgQgBT8s5yZHLFDsYxGQ8O690uAs
	Xm4dH75czAcrWHP+0lERCmPROLqhEpvNc2eWD0abqnVwsSiEO4rP4/9ocfcnVEz1
	2DwwzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1x9rnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:08:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so1984210a91.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785521292; x=1786126092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgIr4WFqU01SLXWEicORXM3CM4Qbeh3bK3toWPvQLw4=;
        b=QSOOXFZcUgtPWR7uaz+VgO/53k/f+ye9v+WM6vsCNTcM7wzEzXqG6B9hVlORM8Fs+p
         qslFr09z5Da7qj/EAWj6kDpXr/Jl94pSQupJjxJdGjlPiBuqkOWOTGmOujQPxPGBXV/w
         EdFzOIDScaGd8dLC5KXCrMB41tBj76YXCSe/uFgingj3EVX5+gIFYoM0zH42BzI09Q3J
         U2yMeTjnKTnvfUMLvJvdAYGZJLef9QxNRPipoV6LZN5cTFgIDoEXDNusdHnNHUqENARs
         DpB8LiZpBXuNrjww4hAx81PkWVgQI0gGM64HNWMLjWnk6+vOd+BufJ+KfNo/qF5OgReF
         o+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521292; x=1786126092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgIr4WFqU01SLXWEicORXM3CM4Qbeh3bK3toWPvQLw4=;
        b=WFEa3nIVtoJCVPCbXzVhjPaYlr7SwCQHBJfjCH30sk5bnDGkpWz0FeMHSEpvtknQj+
         c6ozz72ytAW9YPcgCbPe017E5d5K9CSsGCkBm2cuLCGMW2mitnHe8nCRygqIjgT8KPwy
         Dnm+G/VSuy+KcV0OJHgtYH9/x8SlI+8B3tnXszs3hItmXpV+YDXmx8xvTI5J7NDcP/V8
         vSAFE6oNEaTU+Oif0onNY771lqna46WeNgUrlD9qYn1geIVX6Bk9zoWGY2xAIaw/LGEi
         WXLY/lhhqgSQApoFRJIj4ACViHC+WwfKbcq3g4HuE7LT8n81fY7OeVSErnRo7tI+rZWV
         90TA==
X-Forwarded-Encrypted: i=1; AHgh+Rqyo7fZXJ61uv8BpcwEWfJAU7cocEHoiG0l/jXA4fl7UpsqRo3QtKPnRU/G+m+YB8ZH4Fhi+sPy0rNr@vger.kernel.org
X-Gm-Message-State: AOJu0YwNmNed12s1BuceZMNqA4JKguOdf6t2n4abruas9fAptouxaqdK
	6ClvpPljlP4LTUf+FK1CxrXY8J5JLHpRvbeVhiTL4OlEwHYBRKXJJ0prVgStYNtLDi3tcFnMUep
	29LzwLOEFEkpFXwwgKZoW4eUhueHdKUTYmSXtB7NhVb/4D1rBr+08WBoCTosArxPP
X-Gm-Gg: AR+sD131O8cQFNVcpRgf1jmvIwC/qh52/wuJx20DRHxx+TAb2+x5PxbihrzuiB9/JNY
	ctcCbs0QuQBNSblVh9rn75K22mIvCNc1FYjiRFbfa7SXojXR9bbwrtcukJJE30ZgqX5Ce8BWWhJ
	nNs1rnua2OroKEgqIBz4wRs2h12u0ItDh9Q5UgkW5qV65RdghMPwnLvFhr20TEDZjBUrxZEMWvO
	TyWKC8HS/C00r5fLRKfbtodvl3X9h+lk2CAKBUFbAofrDsjdMQuYpABePRaOXlleqSAoupeyWft
	0St+K5EIInYrVBqyMNVkrHNIQdGF9L5rFsLCdES8mDCgBSiDVlewgXDJjxDHokk8+DDfnAgAQGe
	PGItI38I6iGnqbwcADYY=
X-Received: by 2002:a17:90b:55c8:b0:38f:5828:a40c with SMTP id 98e67ed59e1d1-38fbc442bffmr730591a91.10.1785521291609;
        Fri, 31 Jul 2026 11:08:11 -0700 (PDT)
X-Received: by 2002:a17:90b:55c8:b0:38f:5828:a40c with SMTP id 98e67ed59e1d1-38fbc442bffmr730551a91.10.1785521291076;
        Fri, 31 Jul 2026 11:08:11 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fe9fsm7069923eec.25.2026.07.31.11.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:08:10 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:36:18 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: pmk8850: Add ADC5 Gen4 peripheral
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-pmic5_gen4_adc-v1-5-9c49b2eea6f9@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785521244; l=1676;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=7rGr9Lk4a8kc8yHCwT05C1yb75lNwS6zTLE2+H5+5Ek=;
 b=q652m4YC2W/ugSBpT2zX2LD9MjSZyVz5gV5DtmUBN2JVkK2zSRAMF96a8rMfOvUnysPnbsgzP
 s6Ug8XOIWljAj2QV2FamohDQCpNmVjnaIsq+fSf1QMGnpx9t2yaRQja
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfX2iFLy+pqjjam
 CneFHOkR41cjpV+L8uAmHvi2mhL43KPGT+CoEMpfvvK/QvCemlVsYTZafC3YfCqnlEzynlOzWY+
 GoEgxDmTrymkus/NOvoWEPcl1ZoHMJE=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6ce48c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y4cMHR5xCVxg3lrWXxMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfX+w6JThkVvh51
 4VoYzKtR2dVYynuuS4f3CLPHvZDpueDVyIsxGaHRWRMgXcOpITG59GsaJx1OLWYQHXecpzApqv+
 gnEoyNt0lXcAVwiN/HhtlDITBCg/MMbXqIja267yjx7lia6llLobUtu4x3LgVb9HBSiCnS14N0e
 hU8oX9ri+n+Jhs4rUPkDxWtB70wlD83BUkyXewKIJsbP6xVDvM/FJp47dfC612BOXSTeBdRZR2h
 KiWMgk6590WMD6PbNmV3vJWYRupgZXiUuz4XvKYGktg8ctV/nwdEPtfpfe3lqgGfF/IVMsEDTt3
 pnFDLDsG1ttoZc0JbZw9hJj0tzz5Zwt2dDnonyEXHzA7g4YsdSR0J0tei4R43u7HWsrll5F4HH6
 EI6G52oAwEFscAmTkve1Ho+l9wCdpXGoP2C/Zo1XrKQ6AS2hY61mbfaTWD42xk8cOQnvXiWWyNV
 mhfKv5V5Lj/tgjA3LsQ==
X-Proofpoint-ORIG-GUID: 32mmAIqEtz9ZEsQaDWo9WwRgH5NF_LH9
X-Proofpoint-GUID: 32mmAIqEtz9ZEsQaDWo9WwRgH5NF_LH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310139

PMK8850 has an ADC5 Gen4 peripheral that acts as the master ADC for
the platform, communicating with ADC peripherals on other PMICs on the
system. Add the ADC peripheral node with PMK8850 die_temp and
xo_therm channel nodes under it initially.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index c7ba72fd48bc..44d1d1957f8a 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen4.h"
 
 &spmi_bus0 {
 	pmic@0 {
@@ -45,6 +46,30 @@ pmk8850_gpios: gpio@b800 {
 			#interrupt-cells = <2>;
 		};
 
+		pmk8850_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen4";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN4_DIE_TEMP(0, 0)>;
+				label = "pmk8850_die_temp";
+			};
+
+			channel@44 {
+				reg = <ADC5_GEN4_AMUX1_THM_100K_PU(0, 0)>;
+				label = "pmk8850_therm_0";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
+		};
+
 		pmk8850_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>,

-- 
2.43.0

