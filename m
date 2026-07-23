Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B43B494A08
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810208; cv=none; b=TmVdZS0pE1Q4aMxrDItaAIRDCF+5R+OC/dWMAZhe2kEg/GRvouRvkUXYZc+CwGlwP6pWaIDVAdzi5m0yYCfcOu5Vfb9LQXFGTwV8aHasimcRFFBB0Pgn4eSWFXmVe27jAdiSyMpSxVsCccMs9FLJtxe2RhMGl3mxjeDSDxTs+j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810208; c=relaxed/simple;
	bh=QNVB8O7hVWJg702gCWNCTaBEjYG5HzIl+/6J+f6oXHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWx2uYUiZbr/Y+Xun5oGYpU68A6KmzZ1PUKy3CyyMZ9f+Q+XCgY+3dHYkkhSMq+A2pxPenPWHmEE9lYU1dLUrY52j7mGjfkpyp0OMhzeyH+/gwAfERFu21yE1pT36m/buY4WWc3qaXDsdYQ9HYf+0+PTxhCwpUbhzqybrvQuYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQp/uWH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9LWWBND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQp/uWH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9LWWBND"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXla3648575
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r4PK/2k1a6tHryB1sthUTAfUlknsFtu8WXkM20bAkdA=; b=WQp/uWH/K9NyABx0
	1fZHyes2MAX/o/g2YgQ1WwVJo9BswxbiwGCHsKy/IEcQqE4Ph7vdmQ8RC5tZoqsi
	FAcXhKkAxi85ed3QY0i7YaiuayObNYJFmfakoh7i17q0BMC8/UJ16TVTYl+5Yw57
	gWpj1zT5prPv4GkEp1qEEfKa06zkFfeI1hYmEX0wNKcm3swU0n8CsiUU/7pufetl
	HZwPqYNnRMLE5GAoI9LBcA+8kbVUcTpx0htDKaew2y238oz0oHi5k6Kz5surQEVX
	Jb6KZSgFE6YjekcjiVKGJkEW4e37PN+3v7hbjT0kAL/vzZ8idHdPSGQsM+9QxhGw
	SqIpkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7k18x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso17254955ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810206; x=1785415006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4PK/2k1a6tHryB1sthUTAfUlknsFtu8WXkM20bAkdA=;
        b=e9LWWBNDwZJ/iw0sAH2iWSHh27Gi25tsIvoaiL6qP0VewJVioqEYXUHtwQkF4fziz4
         d8nm0cd49grlHk+b3qE/J5yBJU6DxBoCAUio5z4h/cwYgFoZTMKUmiTRHGPCUjZfJKc4
         ujqpKOdzNVqarfqFJz6uLdkrwiuYS5LZ4fsaZ5kTGBO5wdqfCeZVxu6qB3YMODkGbWOb
         KMa4FuPW2aKHbsn2KcLnSYuj1JPpcrGdqROP8bHsMmgRDI+tJF5Nfs1qrQqVRxHWVju5
         o3CF3Se3czXsnLlg62+BdHNrC9gZSIE04G7Wa145jxI1lLAT+Tx/dEobf43N0NxgAWI/
         rhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810206; x=1785415006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4PK/2k1a6tHryB1sthUTAfUlknsFtu8WXkM20bAkdA=;
        b=dgbCwxattRHCiB5ylpAs1RB9AtoRbrN9mWNcAG5ki6XWhERXSxxEVVbXuYLfDfTAPH
         z6K8sAy0s52HNunc1gW7bCNH3BTseSjXX7K5W1IdQPp0+P0+uRslQwgplmFlZzTsvRgh
         8OW3GfpckiY6GjcUsB1vH9Vk5PT6LDZGKvB3ie4OYKKh/kE+nxZBbyUsz9RPsrLLgTvR
         +kTloUY3kn4hWpAZZlHJuv7Fmd0qsRHfudMP9ZDBHm8SFO5WyCV3aPKKH6iREw4AproN
         VHqc8bmyODuK9hvTiyNnntn1VzDiDS+WVwP5HdbTfjFzjLD7QXYuC5iVY3TMf5p7jo9r
         MucQ==
X-Forwarded-Encrypted: i=1; AHgh+RqH010ZgpfVngjAiMfb8yu6iboRYh304aANyq5njnswhZdagljkkcvR+oufri1uFLpiYVonBEjSF92k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IhwQ9UCorOXNJ2ozQ2Z8u9DLdifyIE8nege1CZr2+8peACak
	X2v717nPFdlshDCmnaFETtzRX0/IONxqDZp/aVENnz3kriBguyauA0DwNbM3Rspu2oVusd1EXOK
	z0H3sfwBlwL4K1NJ4eEsN/HgvCNdIdmYnMte1ERycoGw5uYWiKSNF4veh4VGLFMZ0
X-Gm-Gg: AR+sD13/6OL2qLDRBU2KFEAXn39woL1vegQBOpOYzfmmSOzvIT1RCJy2jbWge1P+4T9
	70UOFKfsxMvBOhr0xdkyO2XkhZ9d6gTpsSiCUaN0aaJYQ14go2ULMixCigNERIxT/yzGtmP8Fiu
	z0hti8EWUHIzHXgrB/X6F96FbGZa5z0pp/Mf86I3EE2yzpegQe6gxfzskdjCdb4hYmnq+Dk4era
	5XyK30OEIrzTZvEk3D2x2aQ3qQoRtDN9Jwy19L1y7YHtivrOxHr4In8sSY5Amy2tL8TkVxkFCC7
	zD4ebckF6qmr9VExopC+kKWh9NdORKMo6TrYMphoP8CLxM/nDahEoRsqTtPETnXyu1V2YaxjPLu
	MOxax756pwf637pUazc0Sk99Xnpl5dg==
X-Received: by 2002:a17:903:2c08:b0:2ca:d31e:ac50 with SMTP id d9443c01a7336-2cfa71d95c0mr38934405ad.17.1784810205773;
        Thu, 23 Jul 2026 05:36:45 -0700 (PDT)
X-Received: by 2002:a17:903:2c08:b0:2ca:d31e:ac50 with SMTP id d9443c01a7336-2cfa71d95c0mr38934045ad.17.1784810205393;
        Thu, 23 Jul 2026 05:36:45 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm33851225ad.23.2026.07.23.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:36:45 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:01:08 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: xRAATYjZVJGIzaYtpZ8Gbc3YJnPkSG0s
X-Proofpoint-ORIG-GUID: xRAATYjZVJGIzaYtpZ8Gbc3YJnPkSG0s
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a620ade cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cMMLQAvtHmgBvpjJQrcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX+J80irqDCvn4
 DMRfTBKg6e7M+k7Cg2HwRYyLgci4cErEv6yTIxQ63B8YX2MpugwTEmVFoP/9Sn0u77JRRRWegqR
 5i1hln4wqweedkNBLoKClF1+JKgH+UE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfXw0cn6HlEPRV6
 yO+hTydO8ZDS7aOzTvMzeSNTbOEKy+eCkNPqDJyFNbr19dzO6gzL5Q7LMXFVkMpAB07qAou58EO
 +qsKFfY6PAv8btCZhvIfmha30IND/b/L94lqT1IyM5GicQz8ht7RYBU8mlUW3gN1V+rJ05UWTvv
 tSNS06+BRDFnSctkm+XM0MeRS0XQKanJUVEXTOJioIcL4T6qDNAMA+FCTmrjXwyPvfhIqcW/1Ft
 8ex3fQ+wcOJY5R+ZoSPHEmJUKD152NhTrzBFFZkLKagc2BYKt+dCKFUNTinppLDlwXf8ArwjzZx
 P9w3fBTp5uHZ8K9XuA2sMEz1SIncrWm3xHIz+JHQiXeua1X4PfOIwDuDVqnSz1mLueaaStHHUGE
 uP3gdATxDYB0+eIVFyb3wqo/yHc3PD8hhkSB+mPaFohoNV/MkPDwC++nT9TIKfQsgOEC43uy2l7
 /M3raod99bT9CgMKhMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230124

Add the PCI class compatible to pcie0_port so child nodes below the PCI
bridge can be matched against the enumerated PCI topology.

This is needed by the M.2 E-key graph description used by the RB3 Gen 2
Industrial mezzanine Bluetooth UART overlay.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..12594967d2c2 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2296,6 +2296,7 @@ pcie0: pcie@1c00000 {
 			status = "disabled";
 
 			pcie0_port: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

