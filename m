Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740083ACA4B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416155; cv=none; b=MVUgZXwxkTbRPfAWxdx+AdSix3Eyg/A5kBMg6QwzlWZw311JowLtn4RCzOoT/JL6zMl073hojAzhx2A/mgXgQeqbMwIqQnrsKUs53YT6hNdICYEGQrjsAVFeci8qaNZep1rX6tqnSBd9NAZ7qGaIb0/Iroh9zpfiMlu3R8iX3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416155; c=relaxed/simple;
	bh=cN8N0s3wfZnVtSXWfIvesMbsj8jLnjCIewkTaaMq05s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BA2rnpLJfSeUrE6klq4QwSN6jbSi13KROLKkip4Nl4oCzsa+m9mTkCY9evqBaSEm6zP4JbuwKVheFaVJOeXmXd8HZtNghrB6Tq7vCjOQsOhMJ+q4jyDsZkG4WNVmEQY/wAv0qwQTMR60zRG5w2oHJ6v+qbMVyZqD0q4ikXJZduI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPqZh1pT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNazCfPH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPqZh1pT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNazCfPH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678ECKN3231442
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SboQGwIa+lEBpfNS3S5MUaCRQ3VKMM2yisHZ8K5+Gs0=; b=UPqZh1pT6PdZ2/yA
	bcSkEWzt9aJPuyTuqeO2gXcBRefeGMgAn50iUVlRfvDyB4cE5YqqgddRGGxZ6CoQ
	u80tt5DuN35ylHgPU8WQLVqfQ1K5GrpNveT7AnWCx5Azp871nGh08VMZg4uYV04t
	BSzE4esIQIt1uEcC2pt0re8pwrVfTdRlEwXSqQv2/ZNkz3SmzngLOdW0VY6UMDpS
	94FA2M304g/6o23ubKA6L6qNQWZfcaaOrgkIe5orLPvf8wBcx4G89a3xnbnrETIz
	Z09w4WYBMwT0Pv0us8pw1xMY+kX7vPUuGfBX9tvdAghQA2MfcGNGQXP4gHwnoP+w
	DvNA6Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79pv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:22:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so3219259a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416152; x=1784020952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SboQGwIa+lEBpfNS3S5MUaCRQ3VKMM2yisHZ8K5+Gs0=;
        b=DNazCfPHvtxm/kev6lQg6tuuGr+zeS8JD77Rx4mjTlfKqPSt25N3DM5l5o8q3CDh/Y
         qcGxIzh3b5mbrZ874SHzptkQs+NHc35+9XplgH3619A7ARychMbuIHruh0lkXJIbiozM
         SH49BUxZAi5S06T5Ay63cZISCFAdbx5EIBwXoMf1Cey2TXfDRvS9527tkPMWAuw1qzdC
         JE1ZioRdjDVt9D/K3jGsa2WSXFKvWXdaJsSeLbBleHxJQWbGNJ4HQ7xp7+MPoDJ7WbEC
         jfZH/AARvP2h7CrqTpfRgCSBL36ljNDMZdhyaQsyqSMANOK6upxWrLi2ktqYFhrYU+Q8
         KpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416152; x=1784020952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SboQGwIa+lEBpfNS3S5MUaCRQ3VKMM2yisHZ8K5+Gs0=;
        b=s4QEcaG086dz2mnUw/6b4HbnLYhtf2+A0K25z8bLQoK0r7j5vpgm3CwDips+85kxRm
         GFSFq7qczijFQYKI2DpqGDtQDvYZg0Lr+Qzi7L2/ae2UCGEdDy3dp9kkV2JMQ13S3Tgd
         yBML8kHz0+kI08iPE0hbMlba9JJ8ToLQK/D/64RcL1fV/EKral8+L0vfLaHxZzatsu5r
         l+GPpHOtgnNJZ7Ev5hnSquj6eNpcC4YXDZsJc4hjRpWUvn7tUmUc1UCBiR4HbjZF2QeY
         wi6uLErjpLnn/hIM4sz9ql55OaWax9bn+Dc8+o8Gzaruwbwv6tATMd8hYrO2n5iwl4/R
         bTjA==
X-Forwarded-Encrypted: i=1; AHgh+RqIfmZ1zu/nnimAa/PGPVK2k07AWO5h8shptAmk1+NeIcgdQM5ImHupjrJedxJ5FPV6Py9DwvImASVN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ZFPT+IkPt8wqnLQPDiE/SgQZdcFWRYfv3k1oNrEOyw2VxYHt
	fqshzTOSSslwbDwZhBvyScAotRm/fIo0TtsOJjeyV3KpIG1/qEdhGbNcLZylb0nyCbuN1w0SnUB
	GSY6+kSFydeXchrKZ6VymRQMav5R7sIAGwyyv7+04DDRJz2k2FWi9oh6EEOT0BU90
X-Gm-Gg: AfdE7cnWYV/miwfs8cuq1CapAV5hM8MW9wA49OJHFhj15IDY+QxVN1Arn9NA+Vs6Ct5
	H6Tlp95nepIT4yCKLM/lwRib+IVz7q0skO70KImrob4i66lFeAvbDaFZ3d9eWGxzrLEIIracKDr
	YczbcW9gVxnz5fAG0E7jwqjlAqmM4Wwd34ESLoE1qL88PpYnfqm/mFgTeFMwj9KsFa+sPw4CnFw
	1G5MMc43rskt7KHhRPa8vvYqeIIWXa0+y0v6FWTdMXlu2yAxCUlPs2LJpe2hv73GtsCsyiKvkxp
	w1YCA2UISEj+un1npqq+zHox+vMkuyfcv5Ic2KJWK6y0zsO+f8BQYHWMv4WfIgcIJjPHSa0KkNE
	r4WrmqcgLFdq3VhQxQ4WV14Z+htUtEqvJ+n2LW9M=
X-Received: by 2002:a05:6a21:6e83:b0:3bf:c2ce:972b with SMTP id adf61e73a8af0-3c08ef2d3dcmr5131316637.50.1783416152517;
        Tue, 07 Jul 2026 02:22:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e83:b0:3bf:c2ce:972b with SMTP id adf61e73a8af0-3c08ef2d3dcmr5131279637.50.1783416152075;
        Tue, 07 Jul 2026 02:22:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:31 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:39 +0530
Subject: [PATCH v4 7/7] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-7-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=1403;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=cN8N0s3wfZnVtSXWfIvesMbsj8jLnjCIewkTaaMq05s=;
 b=CAr+DY7WXcRiVJyl742yxP2g/IsJG0A+rWDtHuvOTccclKXR5LAWqz4OHNmkiu3U/A/wBFQnE
 RRHVIohVjaXDeIzej5mfLG4mF0KnUyMBYgI2C8iMnubefUTyLGeAm2b
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: xWS-yjiSedCOnWQDlQiuALZkcy9YK6Jc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX3EGnMPHWEmv9
 kL/vBtXjBaNTKWxD17reHvu3TYF88vuAA+z2Cm22i94Oo0UWv++aR2goSAdnfw/AmclZ2ZmnSPJ
 R6r/Q1q6HOg63QcfTgd0D+1KC2NXopGE1PnUlME6zKAMzO19gH3ATAOBamjTKqZ1m3lL+6tU1lS
 03xmFVyVHXVI9bQY0irxoORtPsqkS0U2etWYeaV0/cPopwhLl7lGg1x8qegzX1i/Y4+5OybaOsJ
 0pLbHL+j9+74ZDdrCMocr/O0HzK4mZEb7/r4Dl4juCfj22iPiMs5iFlQtgwFArIah2TR9WvjbTY
 sbdXakPy+jkbbAz6XEppM0W94qUT8yd4XmCDkdyoxflbQPSg3j62XlcXMWbFh5CXz3o1avkjySn
 ypyFm+3JHHOnMP8/E0sqSmNupyJWLiwlvr7754TzH2Jl0E5W7XVtJCG6s/AB3zMjDvDmP/DD51i
 9ElWssSpu5tixHJDXVQ==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cc559 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=x31kQvTfQKClviX5dXsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXyq+mhIcncu5U
 /yiZABypbHPxuj5xQxLdQJQtmJ33U2xA8gK2Sm6FAM7mPSiflN48jKZu29CpsWdnuV5hLydmB+K
 oyhdVUWz4JwhPcBiQBOJ9HKuZy70Acw=
X-Proofpoint-GUID: xWS-yjiSedCOnWQDlQiuALZkcy9YK6Jc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090

Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
in deepest idle state.

Update entry/exit-latency-us to follow DSDT for cluster_cl5 idle state.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 054f9c4ad192..933d81fe7841 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -299,10 +299,18 @@ cluster_cl4: cluster-sleep-0 {
 			cluster_cl5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x01000054>;
-				entry-latency-us = <2200>;
-				exit-latency-us = <4000>;
+				entry-latency-us = <2000>;
+				exit-latency-us = <2000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2500>;
+				exit-latency-us = <2500>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -461,7 +469,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

-- 
2.43.0

