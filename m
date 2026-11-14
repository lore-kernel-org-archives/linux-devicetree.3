Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655968;
	b=b9zNJMBtxhCRAHuCQ6WgUxjFH64AekL1HtJcmkrCRm61QVtg1FjyUyvboePep2B1lBy4
	 ivK4+6C1qihUCuNcHEBMcl9I2VvbCXohk3lk8AuPfeEspp2kfIbm1zO3sKdfGm8hiK3h3
	 WdIyT46v9cMpCWLg9w3Em8qsur2SIRG2C72rNqKugT4D4iIM4OYp4240TesW81tgPevOE
	 C0piUIhMOM+WgZfWOqCZJl2143tGOLb/kEur1mwinH5qDx/qYP+I5eQsWk8/Sz8RIXp5K
	 uw9dlbYvxYht3OMNsByNWyMcuUUNl0n8yq5KFc+uB/o4/d2HF2uD3kd8+aIRhsJRk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
	b=pOeb60vkOWr2QuZKHCk7YeuNBAYZtmgOVLFTsDHelxe2QNTj3oa8w+Q8YzNyCsjyzsrf
	 2Czq1917L1LZP4zWbagSAlabffIHs9UJp6NZn2ToKHVIS4qJOggU/0qxQHod2h3UTjLY1
	 cDXbZToxwg69/1KQ3ESQRi+srzCRb/t5MZJ8hFcCDGXXtziuLg7Y2GAvXtLKMXLrpMKgi
	 0p1MJraVvVWrkJfnaGR1G861zzqFzYV5bcB+9xPkaIWvUyw1QUW5vlpQbkYNlgYl2ChoJ
	 tgwg5KnO7hUFXgUE5qeXFb49sDVRWOHaGB7tuRQLL4Xj8qLTv0GatFkUPMSYEBt2z2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6DCdMVu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMXNe5KA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C0606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3C0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6DCdMVu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMXNe5KA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wU7E3276586
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=; b=N6DCdMVuKhJqR+KQ
	hRhkHqPOgGzkEe592gkZnkrri0I1fAkmDRhdfsCsydRfefDHUq2zFvcYXqpnBNHT
	QbOUgukGZJYfM/eRcQ7G3Ny2DPnLcGsLsq6H9otfsmAq6+/b1jdgu9cUOh659CP8
	MViEJDsKlve7mPmtw2+Q45ydS6XVvv8klrYJTNP4aeZ07zGq8S6lyQVGw08LMSJA
	Zn1AKZSCjZqiLAXm3BU6wtiHd3jGKYNzK206gZpCdCiknYp2xrkM98o4e8y1tM4c
	aibWVe0QkhWfhveqWvKiiyIaEGScl11CTmhhpoyui82buFOYyjSQkt5nIdT2KTK8
	5zSKjw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgrmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e98bada22so36540006d6.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655967; x=1795260767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
        b=aMXNe5KAL0DQR07u8eBk6KXUBP7NGQUOPkLMCG6uSH1pWiirUHKdGejIC1jL/8QhhJ
         uDY+E4h4CQB11usKW3eA8jbESbwVpzNoe+y+PQ/N8eSA4GPtvpLOfvYuiI47ENIbd0st
         /RZhx0TrQiBCzsze2ypzyqCBKOxCs6+UKPm1swGBV1LvRf4asVvMxwubbAYiL49k9V9y
         SJXPd7mM9Yv+wWCf1o8SkNLKRUbNzYh0wOA0chK4Zvs2Qk0tB9La8fuRIPqot5I67LLF
         WIMJdeP6hLUNEjbVCpDMufon4QfGvuYrTm1i/uG03J8aWkjiMkySlyRvZLsgGwpy4rEk
         0Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655967; x=1795260767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
        b=GkFQIGDmXdQyppgAqbY85cIXjmxNE82O5PH318vL4nnq9wb7byXp3OTgbPQhhD25li
         rLpFk6xyeTMXkILnIPugrygkRr8YYIvkxVrZW0+XaZPTlIe//Pj2IagDEYyDU7eX2y2w
         0Xur9E0QpCURjivlQnFQps/fdsSziazWMDRihso11QWuNpjTFieHNoHlt0rdyRP8Ifzq
         07ACZ9ec10QP97LUU7ayMWpMOnJdZ4NDdZSbPUBxqbfwMAm8v0FzebPm8RLHMg6kpd8D
         RsJnd8jBPbFiFFCXilpMLGwIvjyILWjOwRzyHyWFSzSSWGNg7YOQo3T3lCuRvvxH5UlO
         Bxbg==
X-Forwarded-Encrypted: i=1; AL+hErFqjNrI8PlmaNaBXkC3Cj2BC7wavCMb8hsFk8qeK/7u9zVbpKoZitw2OosN51h5Av+Dhzsk9cmLkRYw@vger.kernel.org
X-Gm-Message-State: APuU4Z9VFOhPAgfOrfveX3EGFY5ET5sWpruHCAFqysWlsJgvgyQz0ZUa
	2IYKWH0ua+SUk356HHnl/Hvh9Jk/aNFR0C6e5zM3V2dKkdAnO4+wFh3+WpfZPPmD7mTH1VbrCt5
	0Y/ueUbX9byfFBAqxLpPi5SeYoBb1/bG40sNbHK7jzX5oRAUs8Bp4zf8eJTtz7gl8
X-Gm-Gg: AYBFou0nNCjyOIZ0tR+/jgbX0wt2ZQBI4JIl2h7OiSNLQ4wsden8+UBu37gUYu0BExI
	Yy/NSz2qWdjUbHiWahWIwC0fVtq9Dw905xSx4998Es/HL7V5UTurjxgGxDIwRvuxi6Rf38kk3os
	rsLvuY8QmGl1Sj4+AVKVjzi/q6OthHToZxAqvYruw4/V34RydkHhEzpP2yWakVKjgAGS69/uzmY
	6CypWhWBx5MfRWC81pA/rmMru78iEaP9aLwijlJVpRSILEIe082qTKzsDg8/w5ddCxJC+72RjZG
	E4DJWTgSGEPZxVKtk3OHbeZTQa0jkaxAoWuzU91Wji4j7RhpK2xgD7Lp/fR2nHjZ2BcmiO6Er5k
	R5vkmdtm6rT5cJYmt8UvknLRTcBkM0o3wFElH3ennk8o/6lBQLu0yDA/7/DqNtWRL7mEDglKG5v
	fc5fHl4B/gO3f4kjnFETR8juUBxZ2vHkoiQD2LrCNM
X-Received: by 2002:a05:6214:1301:b0:91f:136b:d44a with SMTP id 6a1803df08f44-91f24166bf4mr85261376d6.33.1794655966656;
        Sat, 14 Nov 2026 03:32:46 -0800 (PST)
X-Received: by 2002:a05:6214:1301:b0:91f:136b:d44a with SMTP id 6a1803df08f44-91f24166bf4mr85260946d6.33.1794655966199;
        Sat, 14 Nov 2026 03:32:46 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:45 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:37 +0800
Subject: [PATCH v7 20/23] arm64: dts: qcom: eliza: Add camera MCLK pinctrl
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-20-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1457;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=rB8pkz2FCaAP+r/pTb8lDqYixAV3o/wVSCv9gP1ibjc=;
 b=bO4rJz1QmC84EY6U3r1bkmZ4PXhLhKxM0HlCwJLVHdnT6+kWWrVPCxX06MNssdNUzjoYI8idQ
 feMeZ8f/G3FDr2iRw3wvf0PMTlcgmsQHkIIzvI8R7g2ylrMX85Hh2zA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af846df cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wPaziBaVlFKsotjdNj0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX6ILt+u5jgPOu
 xkhexavC/RrHk8pgXTdwwgxIhqrLF1TSkONFs6dVtlatvWl/OZbZCD9mM52KFKY4u5aUhlU7U3T
 jn04V6bp1U+JeFQvhf7TIrsKjYJzk04=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX0KWziWYhxjq8
 lxY+hV5whSADM7JkRu83cK/oSADQCT9vscAPK2H+wp5QEYCWH9cdBzzmvYxki7dNwL2O4rB4raJ
 gupG/tJKMuMekEYRoWWmHIf+eZbaQ5rCFKlVSno3hpohRlmaxGLbaYgq1RuyxffmFEXTbwf2frv
 bzjzT3OpOowtbuDCV5H2UgwrTVyZih3+2Z1fcG+863cw6av/ah3TK+IPwv5Jtw3sHZoHhwrkABT
 6JB5EjqT1+hp4fERJEhjr7Vfjs5jTnMtrSF4JWV6iUXBCgqZULzhueSPqFjDlXNR8OUvq5ZcmWn
 ihX18dNkdL4TbvJo74QudeykugjKWyk47XqefUhTDnQEjkLNKalM0PbUu/Fb1kWRzonFQ8cPnQ5
 KKDX2ZaH019V70qwSUu83wpjtzGfYztDIKD3gjb9qbNkHP72qihNQwrGQEeCSUF6APEtgowflOs
 +ihfMgz8AS8w3TKzMrg==
X-Proofpoint-GUID: dyDKDFO89j-5YrliyfcoIGbRXAzVp146
X-Proofpoint-ORIG-GUID: dyDKDFO89j-5YrliyfcoIGbRXAzVp146
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add TLMM pinctrl states for the camera master clocks MCLK0 to MCLK3 on
Eliza so camera sensor nodes can select the MCLK pin functions when
enabled.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 0b759bf5b91e412743c12982b79ab4506b9a50b9..f22a8b031e7c56e4ae7311c34ee6ca48359ce8fe 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4013,6 +4013,34 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio65";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio70";

-- 
2.34.1

