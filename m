Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545756;
	b=Yhnmnrnp6fZUI1o/k0axFjHfnOxzBX3DNd0CWGWsAnkAab+8f/qgRTmS4H1I+eL9vbBQ
	 3XwCwraGd8qqzcIreG3BBNKs3Lz184gZzF5k6OxW0mDiqWPK2PjZQ/zjb2ZB984gpwjtC
	 i5rpo65bJGxjCP1wOGXUeq6UQ3kJq36+xhT8+VvtKoRJMtWrj0lPCjf+d+AeL7s6Ql8fT
	 JTbV01Kaf1qqpkELMrq7FV0bjVXIpZLCGC676Tzyd6JBMPB+mIE+wdVx3KpTmv7TuBL0z
	 +7uMtEh4nQ9nn3vYEU7gAQeNDHL5z4ssC42nqycUfZl4OwdmCxCmn2MEW8UXORWnspw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
	b=ZZZ7nlwrIwT4GOABlbzP4qVcmHyUkg3ZXHcIrtedVtOMnYSf+nxe50NsdQbN0nm5d3+4
	 xBUy7sC/VDKDDxNWb1Zusw/IoAE/x2wGvwEZuUrcgqdZfonjuj3pKR/iIFH4n86mJ64Po
	 JKYZtH6p6znrEVdzMnCvXUHotFiDgIeDluB9apMVfzK6YqBflehNyOrPSxaBjVd01f6E9
	 y/NUAY73NmvfG/gcMGpQG+ai5cJPVlyGxumAm2gI7TzYx6pByxqYV/+ioIPuasdyVLNHu
	 spBucdqbITxTX/iBfLly4nYP8VJLn0NnF9kJeQUD6kywf/own69WAPzBen4V6866UDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pg5NrZPO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQKRdPTi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FD3606A33F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FD3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pg5NrZPO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQKRdPTi
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD3tOhe2429844
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=; b=Pg5NrZPOBthbtwqS
	xB90pYx4t3dhHxty8ZW7kyN7wtCVBVOioiHBypjrLM1M/eWjCs8/nXeKOrU00y7P
	+PFT9PWaTXNcCal6itSc/um3EJ3fK7f+Fpp8mHamleuqEjc8cxJEPGWwyrrb7MIf
	6o9X+U0IYZMx5RXrUkW9GJv0Nm6tnKcmuFE94EK2Rt52KyRqmqJ7c6Gd4bNGr+5Q
	6O94jpwJszTrSjXkc1q+yNgPlD8wkbp6GCmWT6T8/fiTHBKcLW0uCD/J2mQhBFx7
	aO0IYgROJBrNWBm7Ey18cZd02ODmC5lP39iLGsYA08nxXaI43e+SyyyTAjKAgCWU
	NZgn1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mr5q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so411645a91.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 20:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545755; x=1795150555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
        b=ZQKRdPTisf3yF4+vRpx6QkqV/XFYeMwge0OjWthO0Vknba+xvnut+cr/JY0ERZLof1
         dOCVkHccAE29XiXG6x4UHRFpa/pzvzDkFkHDULvX62KDdyJJ6z+mSKqNgAHCCLEsJknp
         Ge5CvfpmJcig6asX+ML82ZnWQAaA5+BKpPUnIpMj2kRRU4DuoWjm7aPrnlYNL2ZIgy/C
         PI6B7s2Hu+oQOyBBU32+v93xff44qWWZM/8H6DmztHr9h9jIHuPJ+iuWx+tOeee71tDM
         2l3dATWipoCtl/Q4DUOaUKmkwQldwE46DGH+ktLVrA6ugi3v6v4QeYEK+E9A7Nln9y52
         /55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545755; x=1795150555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
        b=Et6NCKyH9lSHItYo9QJFN9b28dmwdYMRUWdD0N1bL+0fbrdoQqsOwDQA5vea5V+ATl
         6IJ+3ilAVCA96Yj1UTN9PHDrF39kMSbYncc66lU11vjj2LjhYYcCFs26ZHN2j5EXln+Y
         E/lcX7s00T4MFotZ4pZ+ApErV1YUZEnS3NFhAF7DEnfdd+ONFEPtntdNaZWmte/snVtu
         FXgTBKho1lI/P5YcAuyYDGUSomgRc69KC4s5WYZF3ni95qUOyDhsKEbD0D66UZbYr5Rd
         awNOUbUGPidhVJu3R1dFwDhEU9Meh5qW0mow/LSDMPvPFqoPGAPnD5kUj1DhCbb9o5sK
         4/1A==
X-Gm-Message-State: APuU4Z/xF8jICV5UhtxLV3nfa5qZFhAvN1Cin2z1fheaXc0HzYy4mlAO
	UfPBC5HaHzZpAcOWGP8QmByYA9Kne+HyNBrexw39PWq6hudaPP3mXKXyV/t34FvkSpCy3A8o5iS
	IXMaYjoiFSNbFjLaO6CRexFsIh5ozQUVm6BaD3cjZefc9ZHbQ22He99iUM3q+FAIH
X-Gm-Gg: AYBFou1qU0V95SjT/zM47zXS3APUlQaquGkiBciWTNt6LXThlPQwmr1XHad51MT8vEg
	uqBg+q3trZ4K8SiCV/PSxjh+Nxw6q8GovDYY0kVKr/k6M3/idZn00TYyWUKu+EA/975h07j2+1S
	HnIzh6Gf9tCxtB+yEhXAf9o3XEJtgPMGuj7S19J0kIMbtXaRLYybruyD4QiBljxp8REEX55bGL7
	O8GOTFutPFg2H3xzFOo9Va7Lm3/ca8fuWEddLFQZ6FkXMxOOtjUXGoYBRXprsKO1ROpog1ksKGQ
	Wzp5t+O9rYLaGxOlilyBo269Rc76Ck3JNFjj4GLArXAfBzi/zZV2TdbgaQasTvUbbeT35iS05fQ
	xuRFYIEyqkUnq2AAIUGTWJISnhYq6AF6VQjMY/EGLDk6No0ZY7fd/GVQYJJ5PwmRlc165K/jmCx
	FH
X-Received: by 2002:a17:90b:1650:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b1b0a4fe2emr1091211a91.36.1794545754948;
        Thu, 12 Nov 2026 20:55:54 -0800 (PST)
X-Received: by 2002:a17:90b:1650:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b1b0a4fe2emr1091192a91.36.1794545754499;
        Thu, 12 Nov 2026 20:55:54 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:53 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:27 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only
 power collapse state
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
Message-Id: <20261113-s2idle_state-v2-3-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=1804;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=rmjlNp7nzxS52DoDEeFUOHUSdU6WMCg82sqCrOEZzak=;
 b=99iaGDZdsjb3GWnJn0sBCepEljAZvIMI4mra1BI3ze7MPtyBgN92lgx7tfmEL3USukl6zESNl
 vaejUR9FkQ7BdMKu8h44J8RpH4F6m1DxRsfFH8jZvgdVRcpHd87abPo
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: 2opfvt-IUWeLQlqqkgQFm_s59uNlCTjy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX9eS9iTm3kc/k
 bwpydF+LCuR9OMHBNmF5m5I4q7/BmvFGhHKBoaVZwy2ZEopBcbVFjPYLRGXRbiLq475tQ7lSkvX
 8G98/0UD+mhZCOG6Q1dTU6CA7wUE3O6LgU2q3QUqH3k3kq1AvaCCYbKXN05y0s8jrDyYt4qivLk
 Fbq/oG4PwEciyzkXSnaUXIUNyA90BJBAIgDL34oEmTk1QppmM4WrbpHfOAwWWEHJd1YD9Bz+4YC
 U3vLro77ZwO8stg72gIxxDKmeFTBsR8+0E/GI/216xSAGqrQNA6p0JSwnn5VSvWtgfxf8zjUAWc
 Rwmu6TfqTgjl3LH2K+WYsfi+OjBWKM3AP5dHT39p7fSsN3dCplBwPBwBupu4xDPFfF1mBxq6Ah8
 T0SAaYwG9t8k6yDuMlOS8mFSHUtHTYK8ErVB0517H4Fg/1PZ1ctuRvwizCZDedXz5tqZpQbpReV
 6RNvhb7w3UmUhg6wX8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfXwlvIZk+tiiD/
 UqQNyJLEzMcFqEshy5tosWy0ArFvfy+SZsYTHx6SputKcN8GuRKVPewnxaO+j5MdtBF8SokJEyi
 Dab9ARrwIOxRiGL+BDedmICV3ycWijI=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6985b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=JkMn96IHD8b9Uh7FENwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: 2opfvt-IUWeLQlqqkgQFm_s59uNlCTjy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

To achieve SoC low power mode like chip rail power collapse (CxPC),
the Monaco EVK board with four PMICs requires coordinated power-down of
CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
collapse state is reserved for system-wide suspend (s2idle).

Only the Monaco EVK with four PMICs supports this deepest state. The
Monaco AC EVK described by monaco-ac-evk.dts has two PMICs and does not
support powering down SAIL. Define the state in monaco-evk.dts instead
of the shared monaco.dtsi so it is only available on the supported
board.

Add the system_suspend domain idle state, mark it with system-state,
and reference it from the system power domain.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..5e6206bcc97f 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
 		};
 	};
 
+	cpus {
+		domain-idle-states {
+			system_suspend: domain-suspend {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4200c344>;
+				entry-latency-us = <706562>;
+				exit-latency-us = <706562>;
+				min-residency-us = <1414124>;
+				system-state;
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -772,6 +785,10 @@ tpm@0 {
 	};
 };
 
+&system_pd {
+	domain-idle-states = <&system_sleep>, <&system_suspend>;
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {

-- 
2.43.0

