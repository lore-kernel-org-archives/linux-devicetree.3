Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542555;
	b=uzxo7/cuSEXwj7+KG/jCmqj644e5Gi/W1xeEwBEAPB4ZFY/SspNKovyL0hYgfwgh4aOm
	 XO3f2Rrj4q5V0Zkt8JbvuqIavuVshAUJHPMAdy9mGcEPtNHnDa778b3vVor2dQUU5ANLy
	 8zCqndSCw+vowWp5AWYvMmkzmiN7pk16b95hEDDUyDEJe3GIxkgb2uyE57QzdVYkQEhAk
	 k/z7o/hLWutrsJyODmuRRQwP29Q/ejBvJnTyibBBM4d3riZOls+0ocY3eQ2Vmm+NHVWer
	 XetDtAwWDecxyZ/ylZMozN8bnO3nJiO9RcE+/LKLhiEqiCR8o1Xo8Q2Xp4kw/bYnL2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
	b=ID7/VFXK8ETO9NjMQvvzTj6GZ/+e439GgwP5+XtiD7pR0SmfanAJxtsLskKMq61S9D4R
	 4BXYMd4ynubaqtxh47KDECXjuyssRo+cn46jb2gSaeURU7ledqUBSkov8U2rRulCT7huK
	 nBssKfOsXGH2wHRhA/Z81hkgYdAV9AAxWZWP+rGONoxnxb9vc1xnH4E/D4enKJU3ShBCK
	 8RcBXiQ/hD0FoPViKvDYw/LoMgVNaCH3tKCmiV/wDWsZsBR5gQZmr62sRW1ZaTtbD9P4X
	 NjASSvqGDvS9ix6QC2LYN/INC101klFmzhqlUitvT5i44Fiomi09gkIZ8K8jd+4c1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aBJSctzz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yz9qrsPP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE183606A32E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE183606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aBJSctzz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yz9qrsPP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOGpJog4083291
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=; b=aBJSctzzFJkx4XTq
	QVlCkgmgoNiS4ygeu58LQLgHbiKTABuGbpyTtkPOtJ3cKy0DpQ8dy9Hs3S9IEeWs
	V5zItmodZd1GAexTxjGoyCrY3190eNx8PTXG04hZiBglzo7oeLnzZ2Ma9BWk05yW
	c+3l5Vpp/vLdXqZYibG+US5IcrTdrxEsJhPt0caD2gnUmDQGFAFvk3VDExVl3MB9
	HJAK0Tk6VdKvl/3gvU+rEcJWFmceAa+IwbFvibLYeyFOwtqMFt5zjrwYalgjz9A9
	YCuQC4WTb0My3bkJKkwAO1GHOgpcXRq5GU0bsCGuLzDExeun5B4Ds5qHQ91rl0ra
	EBGWVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effraec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so782720085a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542553; x=1796147353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
        b=Yz9qrsPPOC4wt7Lx9hbfn/pOLROYxHYBPlwffMb+0qX7owGsfSjoKE/z3piOprkMAI
         rl6g1jTMO68wS2vTQ/9T6VQWiypLGUcJvt4O7caz47/b2H0H5D94xGlXjTtT1kJZxfhQ
         rhhKzpCHHyojml+FowqTf1M1seZKyIYhBHGcT3zK2ocbhSIHmBqWeHLVrbNiwM1eBHGR
         fUQ4GIpFvhhbZcOMDeFC82bUGLfzBJQaMXf21bdW3ai+4cLc4HGSwMrFMhImgPXRNsO0
         fqXITMoD69LA66VE17ITvBMuNA/vkhZRhY7lDxJ/VqvMqVmxFbNafCCUhy4OukcNWiEl
         0yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542553; x=1796147353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
        b=tRgO7E+fe9c3QMIpaLowH42JZ8fFLkp+mbXciUJYC+soiWQoruwI4J4oNGXxYIznpU
         WQCNz0jctcS2crdgHczMuen91GzoHVVrKN6euF1xil5lYvmDoKWQToXyXkGME+aRzP1c
         GMeZBrgNDjqLesUCMxJ9W6nogucUj041qOGNRXHmEvn08swbTfDcLU34QxTMv0Vsk58u
         rwCfnLJbHvz0M7qp0O8yL6Uz05SV4XKJ9k59VxOrSWFWmrJ6y3CtZIWIPYJ/K9JolLwd
         S2bTK8AbKGiWjAfMPjGF/UhcFMJ5Qzx6ASyGVXqF+PnR+OrIv/RDD2VqZ7pTHvxWzZak
         yXfw==
X-Forwarded-Encrypted: i=1; AL+hErHjwCLPXTcx4s/IufpVaCHH72hNbB2V5KHlB2rapvEqA/C7QWB59rMJfnf0B8xS/tt9h5ZYkvB8VQPs@vger.kernel.org
X-Gm-Message-State: APuU4Z8v+wVorpvAWlrRlwmEoWat6QXvi2yCbxO0KWEMfagLNaw7gGRs
	rmtZpRBJBh5/SeBBHweISNpfvpaAgC9F5Q3umBHgoyXjfxl65BQl1wFbbVdnCMixLRUCxH4PL+X
	5WowEeb4fGh1hNGCs8vL0oofybIxGoA+d/ww+hlsNp+U9nE3NzLnafP9Oo68WAJWaHN93s0v6
X-Gm-Gg: AZFdTZek2LVyY7G4AHhSjbo/HrAmIxkivt1OkTi6K91yZMCepKYF6ksR6LSz8bdayMd
	um8jrqnLuKiX0O9jpfTurlTekgpm5nUUlQo5A9Y0KXFMHpeuEmXnJAeEbWJxSkOmJ5xBqhdxP3x
	/crOetAMiUapLibRO97IhZKnki7XZ2gRjQeXWPlaCILnlc7CYvRWM8jOXUIE1lUtbV6SPb57EnG
	nyXnK77H6xitlJOjykIy1Oxu/XH2i/xA5ZG+XubRcdB3quRg7Rlkmra9d5UgXO4tVqbyrYpMy8J
	rjEQ2auS5+DSAlhZSRo17G3CaHXNrbvSW6yrLTnfBbGgv7dGfDXjzWQ63vKIuVcWOdz6Se8y4Rl
	jdeUyMitAROieTWGuekKpWjXzR2h9wO8RVsxsIsDSQApM+FSWo4Qm6WmRJuISG3GGiizb1oiAZz
	xXDELB4otICWlz
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr2688288585a.81.1795542552945;
        Tue, 24 Nov 2026 09:49:12 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr2688284585a.81.1795542552469;
        Tue, 24 Nov 2026 09:49:12 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:11 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:52 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
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
Message-Id: <20261124-qcm2290-eud-dts-v3-2-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b05ce19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FHn9pCZiDirsiwHFROYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX0lX6hp8xenA6
 trSc6bEqsTizgbP2C9xO4+ikOQiAUobppYAwCcFw8RMNRnX26lkL/kq6QQui92h565/M8chOd/E
 ME9VtkMCN3F1kfhiSKt5lfHg4rXuNyM4ki4q80CJTBmyuUThnKsRfbE8hs1EtZfuyqwjcqmPeOQ
 A1SSwbe3x/jN6YEd0AN2LYRaDWHDWxwJ7QMzjTNKCYVrTR0k8zgC2MB2hnwHcMtT0eiMMJo8tv4
 nBnkybw50yQC61BwB2LnUzmqBgV/lGUOil19sa+YOoFBkrTdRt46oDVmfnlwkvZre1muDMoa3He
 2G1VrlDigqB6e5DnB9vdMQoQ4OvwQkQsMJ6wMNYC/ZiB6S9QZUuPJJePeDtz3C14y41I5kZ8hYq
 /Ld3YOn8ZqwdUU85HuV/9mrD4X9wcgpdoPnaNvB3jJMrzSfEKuCAlVDvdiVvjMacxkNa74z8qRV
 DeFbAp/yHp+XCtSK3og==
X-Proofpoint-GUID: -If2HFq4oM1QJjqpzMyo96DYT56BV5NQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfXwTDeoxFVcIZQ
 6xhlg8l8ImSb+hvAvwTVi1KrfV8ABup9RID6zHMAUxUQI4jtOZsqx5QdzcjUHcqfqX5lfdGxnQE
 2J1QopGOP4ijsgucHLwZlfuwu6MPY/8=
X-Proofpoint-ORIG-GUID: -If2HFq4oM1QJjqpzMyo96DYT56BV5NQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

Describe the EUD:

- its CSRs at 0x1610000 and the mode manager register at 0x1612000;
- TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
  syscon;
- its interrupt (eud_int[1], GIC SPI 189).

Hook its port to a second endpoint of the dwc3 high-speed port so the
driver finds the role switch, while the board keeps the first endpoint
for its connector.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..ac7a653a6f03 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,30 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,tcsr-reg = <&tcsr_regs 0x25018>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1704,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

