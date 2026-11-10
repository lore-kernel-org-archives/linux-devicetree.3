Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328766;
	b=QS+Exz0w/VQg7qpOgwTmKcFgg2YI5fNxO6EwZD3buVNKbBGGgCUyYvaU/RWxcGThdm5y
	 INrPfx4JjOlEgSbTFJiKmwpE04ht8iF4ZhYYV6mnRSbVhUPyEKqhgZ9AWSUtWDt6NjYlc
	 mKMxqleYFm8XMqb7RYnSDvYiFaR8devxC22bnrMFnZvoXZQAIcDIVAiNDBcyJKFes6903
	 3izMQ7BftItGdQLIIJ7wZlJiI2uHw30IgmReA7feMyCBkc0acqfa8ncDyhdAahiKFhA7q
	 WsHJT+zVPa1rfGqVvHiesvTmoOau69CnyknZR8XT0w5qA7pADVtVYLFP/cPM8jeVERA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
	b=xCHawFoOH15qFW2hIYE1quNhkqZH1sQyIaCuRhN5qoanoNlfk1bFgSBOMvRCUM8liLix
	 XnG4D8DRuRKqi4Q7B2d338H9e22yQaTa4a+fM9zO60QsVIL0M3GxxJPj/UJQDaq5KqVGF
	 3esV8WqNZvLovTnix+9ffAQcj8xrUbA0sEE/F3UNdk/Pirj8WszrnuCcvgLL6AN49OY1Z
	 tf/YmWZA3im/wsq1OfH3QvBpWbXoQW0SSqE1+QOQVfATuTL9eYDQ73BH4H3Wcjd9Su5KM
	 EtKtefj2KLPUQVMRZuRwahJfvDM76b6assnDedgt3kiyuwgm8NkPfzQSU8B7tLM8sxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQISwA6V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F001606BAEF
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F001606BAEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQISwA6V
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Ooq151741
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IK4ypl3sK+d
	cDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=; b=nIt4vP0YqljacaMICeODODdk6UP
	peemM+FXOoDVWJbFORb2bK5O/ALOWl1hlk4IFSdBDDvz15nGWTV5132hySqCeSJL
	QUvRBsC9B1owfFVzqvz1YzVbnDeTbg1vtVcxptY8OcmmssE77N7G1HZu86aAG7dY
	dmGiUQXyyg27JrStCMZ3Rf+TJydE2yF7Q1uEPf6lPBLQq2Kcmg1Cx1a6RIBWzy/2
	vM/dpJkIQEG5cw9V3jqbiUK9n/ddbRutTTm/+Rq6+kOlKgMIf2ZNjj0b5QfDZXGR
	m0DbgtRpdDB4h1EUpykM9dFO7rIttOHJufP4+4Krb8opYxoxlRNgiOF+CGw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8nra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-999ef3a68adso387323241.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328764; x=1794933564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=gQISwA6V7OK6ci7uzsRGqMC4NkB5whca4vasclyqJdp2CHP8XgAh2fgwL7a4hTIdpp
         Gh45QTltC4+bpgW/FhxfuuIWFigJSe6Nxc5bKg40H4w+6SbtPsZrFvnFTORBv1bRbBWN
         1Ej6ypNBhUKgd399X1gUUSzDEhQ5Wv7GTsRCegx4lXEuBusY+OmQ64UZyIZ8YvjT77op
         IORhrH3ZWgrOHvgzkVStOiIXVINTehT3RleQzdJZI7g83DE3LaOG5XfqRvTggHmtkKpN
         SU9ADHysly0Q5Fmik8OupnN7qfsaTinYr+cvftH5uPT3Wox3EoWh1oHW2o8MCBv+gPeM
         Qg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328764; x=1794933564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=Y/uk+34H2L+xgLIkD/nFK4FW6Z/THPl4Q86M8Um0kDHt4ZGGYCGpcbGvfZVO+wxvDZ
         BotiUPadfjtRHc9ZtSIsXqaeNvIP+NA2lOP7l+3ok7ALco0PNw5FFMzfnqy2R7GC+Quy
         APT2kF6GugBViQd8J9vyywdkWMNr+DzdyICwbPsQCUhMGSNk+1yA22hlsn7jzQJSAQ5S
         Ev4A5qRf8TtATlx3QvCKsBYx6N+dEcK5UU6GQMV20giAYNVxvRk1tJ/ymfCWPbI/rvg1
         GArLabJgp3Y8RVUJmEZ3Q520kD7F5wJZC3Yv6SQGEm980FEHlLMZxazIylqk3knwhbjs
         sOlA==
X-Forwarded-Encrypted: i=1; AL+hErG3y3ckd8uj2jT2ciuZYz546rG4p98YplPw+FC2n9+CNCmwhfJABwVsdin0O+z5rR1EblG61x+nt5Oz@vger.kernel.org
X-Gm-Message-State: APuU4Z9CNJmbjhudPAiCh94J2o5rECCELIOaE3rwj9dVZh8BkCmMnUFf
	SIOgrDPQAKaBW6lZe6gAOEwmN+CVarUtKQvjdiplRovFewdYb2vJRY1WhtkelLoo1KXg6YQt4kH
	69fX9bIt4rJAwMWEjr+fxvmsk4Nnf+xP64VnllqmVKnsWhv6MD0ORVp0TGwgQeo+K
X-Gm-Gg: AYBFou0l6l9R9lvAEC7PZmVWRAZ4PzAMUjog6XfA3AKS1jsGVJw3rpI7j91K9SidWyD
	jnr3u58yUfxFo+aSE2DW6zIa3CXYOa0msl1WzLdwWtD7iK/pMmopoYGN1kvHmXAngJ/WsQGu5lL
	36nc6010oKcx0DmBmy+8ERAZQfhRCK0qGiHeoDg+Zy+EtuQ98X63zWlExX4VqZ9f0y70wmkn8bp
	X/fHoHXPSAHu6MlSystOgPm3rz9CrQQt/FJpH2hiWw6sUkgSzV9UAEZ4DFwJjL9pPZvPWoenfzu
	nqreyN5fQn/nN3vKmpbjyN2di0JSD7onA3haQz0dqu0Dlgi/PVH3FmhoffrEsio/vbHzN4k8gmy
	F0r3K/YnY89l/zEV4rJLH1Tn5xVefpDelQO3doWXWl0KLSrVHEJyraluvbcXlnImBYCtYT7MMhg
	==
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006553137.7.1794328764503;
        Tue, 10 Nov 2026 08:39:24 -0800 (PST)
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006534137.7.1794328763889;
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Tue, 10 Nov 2026 18:39:06 +0200
Message-Id: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af348bd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: K1q2V9rrw733XZue_FOSOu44CsBeugrd
X-Proofpoint-GUID: K1q2V9rrw733XZue_FOSOu44CsBeugrd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXyOhz/JEDO6sj
 WGBfouyukNjnpr6Zo9EyJH05FV5ATb7pdU9nhuZsvTKxJbylw9M2pnSgCPNV2LNozBdQ2tNUzNP
 YlWch+pcKuFMsOK6WE/0OyAiYo0npaE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX9iq4PZv0R2GF
 foOOxVKLz7q8Nnapj8BMQTDQRx2R41NizGTHqPfO1tkHORLwUz0s3RqHzFpeqSZDcYB4INMRLXw
 EDS2ki6PdjNKsrrVsoTFms3GAi7o2LQs9v/rs0rqqhH1Hz5z7QFeAOiIXudEC2EpTnGHeNqEZ+Y
 KH6oA9Kd6t+XC5cRCEzlaRZya5lrmzegsHFEkDmCi8zlovG0cxpIzkh+JNjX6H5W408lBvGUJgH
 poNmfguYNciRCuiSb3jLjcnHYatvqBdfII0nT5jU5xDWUGIqBckBkOBP+VQ6TQtFUJpaXieIEPN
 CkoI4oxtTGQ68Z3VxsVsDnIdxrkZygfVuBWWMZaAVj7Fh21D/2l+KBMrKh1P/XhrYDSauNKgpBM
 S8P0XKqZRnb7lPDQn0voBfaO2uQrHL6WSpVkopxQbMEyWP2XiJroAPP8OdNowA8PJL9S9VaIPY1
 0HI9abET9Bmrmi9RLzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..7e8447df40188 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "titan_top", "mx", "mmcx";
+
+			clocks = <&camcc CAM_CC_JPEG_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+
+			clock-names = "core",
+				      "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <262560>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <524760>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <978600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

