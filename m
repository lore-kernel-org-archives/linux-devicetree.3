Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143952;
	b=onO27rsoeKAx5bpWngY0JN25UqqipbdsQtf6XFGPIghod6eQC1d9di910dLXJbrPWsjO
	 Ee24/Zkpd5G0at8T+y7UcPlhypBU7wQ5xkw50QAG4gXG6lG7QWd7lVCbwpBB+eIKeeIvI
	 OmpJ1g44ICk34XhHTI58zO7JaK15f9+M+VVJ71vkiJ84XAZe61/M0r9oVGi8n7ef1mKHm
	 dZea/r/g01UIPgvIGCayHZ6iJ5sNBZb5IPD6H1CIiPQFIFJD+2D7povESI7pOwSXNtf/E
	 qLAm3UeT5F49/lyHIGnYoGed1KxtObG0j1XR1cZEMasF/7aqA5Rcp3OU0n5doM0qjPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
	b=vq2bhWJnRtfYTyYBTcrnjBOQfDvYFRVkWRNRGuoapMmeS/RBLZdN16AtUWC+Io6LmSXy
	 uNWrv1VE9VSHQkcU3+MCSX2OGwx1UjF9/MOf9fdSU6EOKU1QUArfpVsjekgdMUlRguvmS
	 90QYJrRNwsnnxaBPE9JxUc/LSLW5bpUahYhrrc55Q98MKPVr87CaUlxVMDCTAADHDiAdt
	 x7XxYSvu5Jrpx2v4WhpisNAUw02LlLMP3W9VxwR4Pp6jJ1DJd/rf/2BFMel5h6e0XtGsZ
	 ZcNCwmY8X9EFBRur2cZ7yjQfq74K89+9F6JnhYpAmip7EEzQiXKglfIdCowZ9YlSCXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAu2P4N0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jiXxBruu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C292606A33C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C292606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAu2P4N0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jiXxBruu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Afnmg1199072
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=; b=DAu2P4N02RQhm6JY
	WykbkYkBjwjNzqQPYMTZJw1er8ZwU4u24Ng6aGkUNw6q3Etuhg8RwfJL8cGGvCJF
	TTjFoNjcfAUBBBWy7+a+QnHxCt+69EtElmmxEB4gc09hSwHgpgEJgjwiA184883G
	aoItqCQp6Zu4mUIlAEpi8w4Tz0Owyq867P7n7Kq9o5Nb2bhMjJ46YVJIZTEF2F6b
	2AK+g8w0nvpHy1d5v7lYHtH0LPeBNLNbIVLvn/KCg8FVL9QDw6qCHzWj0cLYgiuG
	ntUuAnCbH+af6AvG1ibUCVP/K0DiYLYQTFPNzWjD+BWB/l8YIp7jt9eleCuFb+sP
	03BchQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732wjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:19:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so133916c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143951; x=1794748751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
        b=jiXxBruu9Y/CeGVYbaF5Il85TojS5XNv6xEKiIxOxQ/3f1ukZeK+l267oWvikNTPW3
         16XfM67mdbjdwXgqa7/J1uixDcaalo48Hs+Jt3V48RGHPwRs5DBzHZ4EaanS2So5xuaM
         HE0hmnbMkzbUFtJAknzDhY3FNw7dDR6mmVRwZC+bn3rDUdR9SCyUSgSHz+FO0KvRNR4K
         9qe26sjWk3iFKLgBkO9yTN75g2kZ6g4/CkuVKHX9qMjbp3vv3AriT+juR7UjqVOaL+57
         Rl8+wMFkuCaLPxCdMzcuS0U+5liuAfDB+6x3gpk3JRkz4Xpci9hzECahdV2VM23wKbJk
         ckEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143951; x=1794748751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgpTIWVKL9fxj/Y8qEh6EoiYPWef4bzE6JMDE0rg0qU=;
        b=Pl6u8zmkBBojuz9B9D1K9C8/g4zUXaLGYcrc1h0qv1o4zSe6tGp55h0RrOC3snRxfM
         TBtQoLamr09jnhK3g5dxU0H1nEe+mLCJWL+pwtUo+WwMNvyfpseJbY1axECS6FklUGt1
         m7FVwytdaRAWU2zOGNGlzqA6Jo2b2vaXm8j9peezejtmNbAL5yEZWeJTLZtpgvxcnCBI
         iaRxoQj6VCznnssIeYXJeIAkM6xo2HB+8o5eTMxbHNymOM9xUtqrFEhS4OYeUybxXUn9
         tZ0O7KD10XzJEKsYdqsdY8d2o8CVgfeI+32Z+rVhzvy1KPZjgU8yobBmY5+sSI271k2a
         /KEQ==
X-Forwarded-Encrypted: i=1; AL+hErH+K0U1u1+Y5DNBjdxuA2q4CmZwHulKolozae7p+rW0xFvRrYieqJOSdDCAJSDiGel/6nCy6dornsz0@vger.kernel.org
X-Gm-Message-State: APuU4Z8c9wfo+mKOT/oepBn3KXgPxriXuYDERPb2F8U04Amuw2pMIE5l
	xzRR1OG4YyiPdAsu5QuppomAov3gtWg6d+InjR1JLn99Wu+HH9185Z9BP/3mQoaABRof7ldsFhv
	LDGyRf0pqKL2f6bAv6VK8P8QbeFIgGl3tzHMG/J6BhrAjU5HvF9s7LSzWCWWWPqZB
X-Gm-Gg: AYBFou1b3PiIkCEIuE2Sy/uSF90AZQpmL9FrQ5Tk8yLd3F91vpm64RiPSyC8GZlvWRV
	dMkVhxdks7+uEauYWHXr/WwDFBzfdeeBPIvDbR5t58cNGvHFKzorSOR8NdwPtswZjDVu/iwMfia
	EZrKTh2j8XpfpiIvUn+eBSD9gHuMJlYtyvt7BRUdXn3+0JCVNUCtQ5+A7vpLAuiOd/rik7mSaV0
	PN6Xmd59WbBbFIeHgULPmyYfnT5xVWocRrJY/TXcGy1xhIMEx5yjLjTtUMRBe/b49E+9G+3ePtp
	7ebcJhDjEwNpgdIOzmpapw2s6P5ToSNgEGnjYuna6Y6l0pBl8fRbTSVmIcbhiXZDAYfB0aRuUZl
	h+ZxA4UV9LbLz/EJ4RPaZjfXoLqPK1EbaLNhVSejn5YdT1jMnURhDY7HHf5MLyYU4g23Dik5m1T
	tnsKg=
X-Received: by 2002:a05:701b:4252:10b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b39fec24cfmr2288472c88.14.1794143950661;
        Sun, 08 Nov 2026 05:19:10 -0800 (PST)
X-Received: by 2002:a05:701b:4252:10b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b39fec24cfmr2288427c88.14.1794143950085;
        Sun, 08 Nov 2026 05:19:10 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:09 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:27 +0530
Subject: [PATCH v2 06/10] arm64: dts: qcom: lemans: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX3GB6xELNc6B7
 mOdEMjM2eViDr7BFlkXk5z+KGe9rkJ0Hf1dNKKrbjjhk05Eplirk6S+S5/hM6hk95Y1rdPgztIc
 etsQQII5/SRv0IAG4hAKxZIogIlegGbIf2ITz2lyJdnW72qtcCwTzC/1MKTm+KBgRMHJH53k08G
 rnC+au2yFBlq4onEQOthIIrD1SgC2QK1kis04+8Jnnk8CNjYS9/3OwsXAzK9oV3MQFeLRuQXFm+
 cBHwcxShdgm/YUlRXzzKho+koW5bjZG65PsXSp+rClq+pSnILj1QejBF7fxk/V6e/wVX+Og16DQ
 FsJ980OlIUFkMEEi66uoqgWmSbtuJFDILCsx98dxceBpYL+Qp4ikEAqrWNyJiPmTuepsLTJvcH6
 0ujogbgltgdQLW+HrTyDMkiVq1uU3WZ78i077WoTC9nxJ0he4s6DPE3cz1LSnamfp09mxq1cSYD
 z2w7ffRJ15rjG1kjZCw==
X-Proofpoint-ORIG-GUID: 9U4rO26nxuANEvl0X59N-9l1shNdi7m5
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af076cf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cV2z5tzyjUHL2YBgtoMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXyEED5qOF6wGW
 +fbd9sL/nrMyUxccmGDRNnFLWRcB8S1ss57cxiMic3F8NldaJsU5M4E8fyJqIN+gJauWdatobOC
 Po5SM2t+UMmEy1AQgL/qLSoKcpTmC30=
X-Proofpoint-GUID: 9U4rO26nxuANEvl0X59N-9l1shNdi7m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..4c76c820cacb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3022,6 +3022,18 @@ pcie1_phy: phy@1c14000 {
 			status = "disabled";
 		};
 
+		ptp@1c80000 {
+			compatible = "qcom,sa8775p-tscss";
+			reg = <0x0 0x01c80000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			assigned-clock-rates = <15625000>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;

-- 
2.34.1

