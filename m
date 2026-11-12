Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458350;
	b=xzPtwulblKBiXNSYO7lGPNLl2ue8CrzL973fqHFUCBTQsIMzkr3XRdcjeQRZuWvOp+CA
	 1Q+nUCEdu+0ZGqYmVHaSD42oyXz7a78WnJW6VX6UJNp3WVs+e/5Vf3PlG+vy0hsR1E8I9
	 dQN7xhC1wRvQsbxo2XwJ8sIrsMlOoaRBYYxzZ6BhQgJs5Rw9CJnab4OYg27u9JMyqOZcM
	 hrLTR2qk8zMdhXhHcX5f3qMRawvb342RfLMX6hluiWrUoZktldSHUkdg2JZTGkijgEzkw
	 LsyW1QNLzzWPpR2kSbk0mcclDoyJEKxdoepSgyYgAhPDHmroGB21GGqvWl9TrlPV4lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
	b=LhieiqcKzf0H+kQHerMDpYEJsjY0AgRXqYPOJ92sLqTxKheYK2t4swGHW8KCgEymGkEK
	 sVkv/lHqZpZCs76G+SJSN2tJrmEyduYAM9r4ODubBsNkQz2XIr/Eh9JJWcg+c9dlij5TC
	 mEY7QGYPWMokZoufeo6QGSGw6WVgmnPG3VulkBkyzOk1VH4IHBPZ9EuItQCynXk+OfUST
	 bKT5uuiIQPimvjBOKSPp/pYrpzNThznOYfgVb3sZklgjNHi3ZIcA/sCq7MNM98tCHIE/I
	 tKDgXW3XJuK5EtV1DbsAyltwk3BBbyytq1/u6l0Qk+I0BcvCDw2j7x1sjIDoycL5KMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="adPsLIT/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmAm4ldb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E96606A899
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E96606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=adPsLIT/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmAm4ldb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zkgd904025
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=; b=adPsLIT/MAXwmu1J
	olny8ow7jibz0mkNKaAgA3O8VsDsmQikr1TqyznhfXBTP/S62kyah8qimv0siZe1
	prXx/haXS2sI+Py4bGR769gpQkcHbGCIpjG96pf7bAoFyISzXshQPV+e+5SC2mni
	2jpJQhXkvuHl48awGiTmQ+GLnADNShIXm/10P34iAfwMYBBWxBFWGZY10i2zT6KS
	wNbUNtjS2FpZbBYCdvPtdJyocGhWonPdjtZbthIVcWWdduKH3sDVoSP8fdT/CCuj
	nGnnNHK/fMILj7r1T/NUVelF6T6463mCIcQN+ZMWiRpO7Vaf11feFFPgXpzzDq9m
	yRGytg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uayet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7249660eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458348; x=1795063148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
        b=jmAm4ldbffcqns41F1P7cIGkfYuXgrHsYzcfaFQRBX8rD92yCMV7S4roZAW+k9zgzx
         NpZ7vy1OR5qZTM8RQ3cEbDzGCQdaGzlwOVU1wGerr2REP5D7/iJI5uSpIKprn6nMVBIp
         /0lrS9KhVh5iNf9iMIrkVj/JjWH8xCosBIuSbTUdn11vB4Oq5BTlXiBLvT/RuFoxcB76
         EB2iCv2399tn8qmSq+pkvvoTxQpv612ofDW6CgjdpN4g+ptAaZSZVivNuCfioL19GILd
         6L6jif7LN1groCJ8OZgof8spZz0xVEdK1ZtZrfe+RvLXS3sLFIn2HqsBdexTUS6OiKy/
         WWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458348; x=1795063148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZdZnp4MgK6tgvoUETRIQp29Txx/S536+/CF36TLCxc=;
        b=LaZRaIi3Q8OmWvz6p6NMVjkh1dxzr9DpkbyN/jXU8uOQXHj8JIXVH/fBAgn7p7pOmb
         oFeG0h4dHFmfDav7N1G0VYnnp1FUnkhZWkwlnkOY5Nyiy3k1bIavylbbzYU0gyw56kId
         Hw+J3Fqcs03vprSEwasMt0j2ot5abr+EnoDQ2ylXwwCvn5yDECfkA3KSGcHj0iEvIp9O
         JAgMaFXWTTWVw8y/b9m6VcHVGZSgi40b3qCpfzGHxw27CJ6K7mel5OAORRTz7X/zgkb1
         6yh3gAe3MM+uSMW8Yq/aopgbnWUTmj5iUF5mgthryPmRyDixQKKy/KZVFu2bSYs/eAFV
         7waA==
X-Gm-Message-State: APuU4Z8YUyjYOk0wNHz+zXLfxGTm7VP9TI52po8wo9RdX1lANYGJ/1vV
	GKhDcOab7Fmrl7AdB6ylhhqmFSSlLa0muaTkdnekyG+k5GFAdhH9IB4wWIlHZNPlWEc3i/an+JZ
	7ZPZcjq2eQnKzvduSDkTKJCITsLYReb7/Zjfp3ipLGkT0eO7as5ZeIRW43V2ab4AY
X-Gm-Gg: AYBFou07HPGOCqFPydzaedKejeac7SvGG+E6x48a/TooM7MPkr2PiyfOAfsWUfPyAQK
	kwitZK9C15kchGGoOnW+/yPub3CEtKRKTTvL0BAtzjKUFiFcMDttlW5SLi8xdF+2VPPNro7UIo/
	BDqc52yROnXhRKlECAHzXd6x1oNd35VBA//R0HwKp7/w1AYBTo6uZa9iYMfjMcRc+rwuRCOiS9J
	jczVreaL3WUn1pAXipr8py+NkqfxD4+N6Cq9C18EKPnmENlv4Q1tV/31H+61EkIHfNUDIom0H1q
	fZAhij5jGt64Hp0QHRIRmIt4URl5FHBoKE6w5e1Kl8TZ4/Bjr2nH/h9UNpWfywJUMpwA6cGHq1t
	oizAlLWu/ArE+DDR7OIs/ckL8hLXYNUidIiBM3qxyIghSC2aqU2lA1e79dqxLQFRr1AuHFKlKbQ
	8WXjSVRXuiw+Sn8lzwzfAZ03KBWbJPYitcUcymz26CH+doWk52a8jKOegWiqnpY+2CbEuuPZvdr
	V/0p2ofyXJo
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184228eec.28.1794458347961;
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184211eec.28.1794458347452;
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm42344790eec.23.2026.11.11.20.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:39:07 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:08:56 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261112-imem_restart_reason-v4-1-3c7177529526@oss.qualcomm.com>
References: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
In-Reply-To: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX4YtyKkxxkw94
 YEftMzMMcYvwxbMv1pJKUSFOiWI8zEdfpQ50M6jPCdDiusAG21zAnZoKbxz+WfvQtWGkFuH7olT
 sM8kG61W7uDEI1ZYAKG1O53X37nkojk=
X-Proofpoint-GUID: k2hjCU9U1MB91Eyo4KiYfIULnD5Km60G
X-Proofpoint-ORIG-GUID: k2hjCU9U1MB91Eyo4KiYfIULnD5Km60G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX/FvFi8ffF/cX
 +94Ok0/INMwFTC7MZJLtccmiFWA5VLW4d2PSoBcMYEUKV7Nucw0nqSKhVqa2EkDzR2Jk5Sn7Skp
 /caL3Ymp9dFHOyUJMMOImLcCAG77J9BpwBOEsVzQ+eiXEM8AezVpZNg13/6vswZNLfl3bjtxIu1
 w/VNv/ElBtYnsHiYFm4VhC0SWLKbO+QgHOERsF3XlpOKKt4Ixe22Q298N/SXyuNuXjv4TQs9zOz
 zKbXs0Iaz1xPAZLC8a4KcMzIKoQ89YD5CCFa0BfBd1wGRNYR30rEeTKpc+f6njmBijh1rXKmlMe
 fhksGi6+tn6wrfek6yjdFFXaaUzhzc9n9tq95Nd7VkkCNvXYF8O16nxaTqJ/gzWe9H/2QYzSoim
 rKy811NbG5n0QJculP7y52ljEaOq8jAlB/cttccwfb2WTCjYNKW/r/gR693S5c6oHBtEFWLZXdj
 jVKMTEXaP5Xyw1jSqjQ==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af542ec cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index abb7a8391b46..b50fcd6e91b7 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,21 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb3: usb@8a00000 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,snps-dwc3";
 			reg = <0x08a00000 0xfc100>;
@@ -841,6 +856,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

