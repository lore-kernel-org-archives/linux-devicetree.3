Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469250;
	b=ChNln/kMpjRWKfSCsDFgFMaaawuazM/0/AjprcaKUKE92GLck/W1MKe36QydTRE16BVe
	 qXx87aQ1yxzRGaeb5H73oFPB4NYJyLh18bvb9Fw534h/NY6O/uQ9PR3W37Jtbm2MKXHpp
	 LwaNo8ZxRUS/atoCKq7D4s9ekgjPcbcnj7ovD4AnsUYjVUcklcpTkyF7iVOVHo5jjVSqR
	 /W/7NGFgPHqqI03t7cIJZg/cOGFawKOQhC5GVR3dgLkwux28xOvX4cVtnYE7X9WN42R+l
	 0Sak9hsbdB44nfKqwj6j7r4N8Afw7/F3kvVtVm4kQcMrz/64/hAplpxE6u5W138vFhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R1n5zSDWOw48FitIOcKvZt+VZRB4EBJp/2COvX/Ix5c=;
	b=j0Yrxmw1dH2y7zKTSE4VPPIcNZl1tgR51ad8qI7K8wEKJFyyZ+PDUgXEKDwiMf2dMzKr
	 bD8C5eReg1PqsHhpc5izW0qjaxHzHRd7FkttrK7LRXA73BRe1kvz0vVsESKs2KOta5UBN
	 Rjppz18WxkG4LxyW7w69/hlB9LXID2P4mwIR78SWI2mxmYp01vLirTShHuvyU0xnD3FHm
	 S9wF3wdZSF5jUU+ZdKpPjkBsRVgTHbBvVPkwQhbNb+/ExX0ymWz/gZmdJzHpth5MvNPi/
	 LbQHhXxwa8nWTuDjFJKSuERBCKi+BiJbCCioETTkj0ZgPH4aax1WjO8tMiZnU9rISnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H7a2oA2L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3zjw2wM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17A606A32E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C17A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H7a2oA2L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3zjw2wM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2a0lx597692
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R1n5zSDWOw48FitIOcKvZt
	+VZRB4EBJp/2COvX/Ix5c=; b=H7a2oA2Lu1HJsu0WffvUOPm/Rrqq2GDYE8cK+y
	WWUiOSuWVCRHH6vez2yllWLqmIQ9bNmQmCVNgjbsMIQwVq5qfFml+RiK1h2C+kjd
	eQ5OdB7F0pCDsW6FGXI4p5ugu7eogieLtfhs54d9sDAf58zXcZyaUedzfmpo9M02
	2VU3VsQ1KeEgdCZSbrbltX8UFru4+ciIAJCE3LaSEM3zwfRQ/kNEFMGMbOjG1YjX
	z9TdCN5q4K/+Emazew4AlL/Zx8xQFB1T3NpdSqjPFdTLlltkOdqN/G4t4lRNJtqx
	e61U+nbIsGoys6q1HKN0Dglj4AY2ZttocmN8Hpp9Enwog9BQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153nr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:40:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so1370645c88.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794469248; x=1795074048; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R1n5zSDWOw48FitIOcKvZt+VZRB4EBJp/2COvX/Ix5c=;
        b=A3zjw2wMAMp/SHQIWomVFnVkasLn6pvpWsVt7UZ8EEIx4vWs0QyP6xbN6Jc6T9MHal
         mgw2kTbpk88D452qK/XFAcLNo7mbgtbUkYWzTIcrGgvsbwu5jLuL9kYlmpqt4f9L+KPK
         Ur/0rRKcTTeJ0A3MqGZ12lOqRAcDidsKkfBfQcbJ8DdXxVEjQVLRa1C/Dw5hY5FpQu21
         JLmJe2AO8qjdJ4tHb0RWbs5LrLODloI8AxUd5vSw6KaTEQ8SSzQ2q6lSs866HVihTP/y
         YCrmDoYn40YnafbwZRF73HhvNyQ5J8Icz2sfKIdVrgpBOGb/3EMxFeJpJ+RzxnVDEZ8o
         boxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469248; x=1795074048;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R1n5zSDWOw48FitIOcKvZt+VZRB4EBJp/2COvX/Ix5c=;
        b=eS4g6ISQi7RuFUrlW1JdkdI4oMddRS0zlnqhPhXIAtRxJGFJvf3Tfq0EpQR+65NuU4
         HK3iuC2BJttA5CNTLP18X/jJGIJUcFEQoQg6g1YqJ3Ilew73lFopGGXE6kycWLIHkc35
         /C5tenw4kqRnInxYzyZc5jqXTpsf0tGmMzgH8CcJunHBJebDmvc+rFVazOJTs6F2tiPv
         NPSiW6PrZ+gQEpeUr2o56+Z5bhjBYdOIt9ZP8OXK18XX3S3S54PAG3L91HirsN9GKmzZ
         2lpqUFIRYGA5SlLCml9aC1xMmMUrH0viyjMKHzDQ2ytlktXVR1nnyhK6Y4Sq3VtKYY0J
         VaHg==
X-Forwarded-Encrypted: i=1; AL+hErHV3F9+DqoxG96c85AKe+C0KT8QDNhNOJu9JyViRn/4wmqt9NTFFmXHD7E9mwKO3ypSRGZ7ILmQuL5C@vger.kernel.org
X-Gm-Message-State: APuU4Z8x9BkU/iXuCFLAVGspOcf5mB5JHYNKSbxBg/S2P+6cL0BTxnc6
	4Fb/lckK7iPxJfnna8k5sQJkQxiVmPAvtFdRLdIznLZlbDsz4PuIop3nvaFe9igCreHPKkkEHyy
	/VyTGezDKSd0O6SAxamregC4u+QHYRPR7zJid/6KIbyv2qGjEbZpmcfFdDIllSL2xFwFZEOcd
X-Gm-Gg: AYBFou3sNoymIm8yGMEPRL8WBHfqmZ7Azs2waXKewP3e4DK1GzVGgqt9W8LTh84y+x2
	AJnlPz1EwFlOk76PWZskTmhHTVa+gYpaZrax4gpNURfZvgrxgQ2yA6ZT3g4PJtzp+RSw2FxZpvT
	8onAXjDSniRBTQ55lf9C9isZnLFKeGnoT9BPHlQhpZtBLBpI2qAwGcY2YGh0yLIjCSTe5YYtT+Q
	nOYq2dA4BY3iBCnam8Lu19vW8D2CN1y1l2I0WSShJhwcP2ozgSSxabKW32KzernvtGpjI5m/2pY
	zCieEq9BEGMOisKYf46uSMfqJ+lvnzH+SQoqXhISobYmILqZTwAXQF7HcmFkfAn3lDUnNhpSf1U
	/PdaLqoEXRFJNmkLKI9cWWIxZBceVIuk13Eg9bvcAJZ4/AMkYm4UJ/SwLx9ca3Z/Yx/B7eyTTeG
	Fybf4YAm4s
X-Received: by 2002:a05:701b:2616:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b3c03117c2mr4210765c88.18.1794469247870;
        Wed, 11 Nov 2026 23:40:47 -0800 (PST)
X-Received: by 2002:a05:701b:2616:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b3c03117c2mr4210741c88.18.1794469247235;
        Wed, 11 Nov 2026 23:40:47 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm21348423c88.0.2026.11.11.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:40:46 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:10:35 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 Disable ASPM for TC9563 switch
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261112-ik_disable_aspm-v1-1-f43d8ca7703b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHJt9WoC/x3MSwqAMAwA0atI1hZMKl14FRFpNWrwSwMiSO9uc
 fkWMy8oR2GFpngh8i0q55GBZQHD4o+ZjYzZQBU5RCQjaz+K+rBx7/XaTU0u1GiRLFnI1RV5kuc
 /tl1KH9hAwithAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469243; l=3999;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=06awwlxiuQnDNoVlL7hQsLwDPAW7+UoPVXyUUVQRm80=;
 b=5ovEwLPEy43B6vv4/++G8pTp2yeTrcsfS7Lj9wdqOFOqgCNWJeHFRplfEaTEjH9ow3XRuZivr
 qtMET11ExXtCgcVJqi+GBoc5elw1LzeH6gvqjCTW8UoXokxv0lmszVe
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMCBTYWx0ZWRfXwiLfe2cm+c9Y
 GY+5Yv40kboc6gbri02pZgMsfbpoWfY4RJRbmPfS3qE6BzS9kehbtlVwcZMfcyrgZVh/ZoA04vK
 npmsn9VKtFSwLL0vuiDWkFFyFXyFnaM=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af56d81 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CzsnHOTDfeirxBP3itQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: onm0rAgCZPtGCdZBgQQjmwoQeE7MCTOI
X-Proofpoint-ORIG-GUID: onm0rAgCZPtGCdZBgQQjmwoQeE7MCTOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMCBTYWx0ZWRfX7TRSRL6OUyGY
 LZuUg7iGpzaOgryYT0FBB48SY/vI3Hdpw/m1Gc3AOi3X9rm4wZvQqrVaDmSCc5L6DkmcpXRRrq6
 uN3m6JOflSnTxXmwVaQQ3ZWP1sM2tbWVZ3Nc9DEuvEwTHMsp1WuWlgeXOTeeIdHaVi5QcxD7paj
 tSFffAKx3YdWxOQKeIQoBOkKqDdLoZpCftG9uRu2rdkrmQmPdr19cFT2YoP6s5j1b08x+5YzyRR
 GZ96NMnFYBBz8ksOYLHE+ywZ3DRGtD+haLofA1GVvygNdADHReR7nR9vL67dIhyxX2oud/RlhjZ
 5a3WfCLw3Yfn9cLrSgYuUbGrEN84QzKHND3gW+zkBtlJyGAFWWuiEJ7QapflvG+aP6lYewoHWu0
 katV4o9PjJoizO2lbuWNDIhampZyogTcQBxF+65ENCqz4Y54qmu9418qO4ov/2homEmymjIFM7q
 F/6iwmDY1sYzYrL71JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120030

In QCS6490 RB3gen2 Industrial Mezzanine platform, we have single TC9563
switch on PCIe0 and two TC9563 switches connected in cascade on PCIe1.
When ASPM L0s and L1 (excluding L1 sub-states) are enabled on this PCIe
hierarchy, data traffic may require coordinated recovery across more
than one link and switch. A failure or delay in one link’s transition
could therefore make the end-to-end path temporarily unavailable
resulting in software reporting a link-down or failed return to L0.

To avoid the same, disable ASPM L0s and L1 for this platform via DT for
every individual PCIe link.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 39 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  4 +--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index e8780646ab19..b8d56a216e40 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -104,6 +104,9 @@ pcie@0,0 {
 		pinctrl-0 = <&pcie0_tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		aspm-no-l0s;
+		aspm-no-l1;
+
 		pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -112,6 +115,9 @@ pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@2,0 {
@@ -122,6 +128,9 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@3,0 {
@@ -132,6 +141,9 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
+			aspm-no-l0s;
+			aspm-no-l1;
+
 			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 			};
@@ -163,6 +175,11 @@ &pcie1 {
 		    <0x901 &apps_smmu 0x1c99 0x0 0x1>;
 };
 
+&pcie1_port0 {
+	aspm-no-l0s;
+	aspm-no-l1;
+};
+
 &pcie1_switch0_dsp1 {
 	#address-cells = <3>;
 	#size-cells = <2>;
@@ -191,6 +208,9 @@ pcie@0,0 {
 		pinctrl-0 = <&pcie1_tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		aspm-no-l0s;
+		aspm-no-l1;
+
 		pcie@1,0 {
 			reg = <0x40800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -199,6 +219,9 @@ pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@2,0 {
@@ -209,6 +232,9 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@3,0 {
@@ -219,6 +245,9 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
+			aspm-no-l0s;
+			aspm-no-l1;
+
 			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 			};
@@ -230,6 +259,16 @@ dev@0,1 {
 	};
 };
 
+&pcie1_switch0_dsp2 {
+	aspm-no-l0s;
+	aspm-no-l1;
+};
+
+&pcie1_switch0_dsp3 {
+	aspm-no-l0s;
+	aspm-no-l1;
+};
+
 &tlmm {
 	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		pins = "gpio78";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..afdcb03b070f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -901,7 +901,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			bus-range = <0x3 0xff>;
 		};
 
-		pcie@2,0 {
+		pcie1_switch0_dsp2: pcie@2,0 {
 			reg = <0x21000 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -946,7 +946,7 @@ gl3590_3_0: hub@2 {
 			};
 		};
 
-		pcie@3,0 {
+		pcie1_switch0_dsp3: pcie@3,0 {
 			reg = <0x21800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261112-ik_disable_aspm-426b41312323

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

