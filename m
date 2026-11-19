Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112046;
	b=hyii9mKMkreaF1RER7dhg0+KXbCUJW4NwC52cvSOQnxH51mFOHvUyXdAdjm9maPD5AO3
	 UUeouQFtjDFuBv7bJfFlLGBBgu4RuxOJ/3M8u4eYbiNk+9ZVijp2v7ZZlQWr+QoT0ms5r
	 1k3639y0CWhOSsYr+TScMf7StWC9foZNhjNoaveKyTNPj8qoJ024mq7Sw7r1T0PAOFjKM
	 Hh2qSwQ2mrpeytI8uLbLwRbsJtqI29Mmv4vXWvgxob40vmUtUYVkJ1B/yWTu6wlGkTquv
	 5wD4IeXf/YSzj9pfaaDCbs716B07bWhfag8nebp3Wzrd2PBJAbuABgwKfLJlYAuhQtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
	b=xpZBAdqNjYmP5FA6vXV6BhgfpErHztij9EeBtwg+jeTIdaFLKg1Qn4/q+NWBRblG+KOV
	 Of44dQDtmKtzqi7DkoXfqrS2C42dx5uE9eCBn3dLHnai4f3hGNRhcqiJLmiEgT6yMjZYX
	 fcMNBO0UBD3W8gXsVQvsY0GSisTaBXyPNcB0pCUzItRCghrnUc4h5ikDJlWy/o19RWHue
	 63JQNaYQTkPlJUVXTjGM/rcHlyx4Qj2ZwGFjhPHFHS9GR1FsagfhZaLD+eJXgPK2ybRRx
	 sTzO20RPfrPe/nTG24PU5vF/sIobbcHnWD9OljO9j2kK8EXsOEgTd0q04WiXI3DY8sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSsRbe1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv8FHy3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFB360A2609
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFB360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSsRbe1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv8FHy3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJHjjYB3021389
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4Cq6/rxxWIe
	TxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=; b=ZUSsRbe1xF8bJtFGnVOB8Is580v
	zFkk47ZK3FOJUgdI01m0GzIUWGEmh2Y4HlIFKGMC3hz5fxchwxqwqKdhYLOFHDzW
	431gxvob3QD+fpMe7hdYehjUc4pWqBXxjfJPS6eIm3+yAq6SZTQ/kUFTiGLIKfFg
	9hYd4NWriO3czTnRdyVHIH+yk0TTFrHUNxz9My24SNeTi14pOWZkVSEHZiavvkRC
	i0ESEQUx1xWG5O5DiPgtRvq/pQ2ZnKA3/LwWh3vMdNijqs5ceNSZCdEVx+EscBnc
	1PAEng8tUb13+smIcM93AQVsxTzFnEohPlrqJKWYk9S4BCz90K/OPd/Mg/w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uuxb78b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:14:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so31090c88.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112040; x=1795716840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
        b=Slv8FHy304SVyrAODQrywx2kXtUQascMkkYBfb/cavSclUuX6wa8Jf3J12lkLssVFK
         XO96mKV1yPRIAf+rJt0IyShMEPg28ibBiIET16tbWpvibcyxDB6jzcKl3kyDsDvjDaF9
         +C9lxyskdEIReVLJw+/cWW7q3VQhdDuxZHUpop/EsxoHXYrv7XecyEDg1jcPGAGPLd7O
         hnNwiBxMoZ+oViEjVEJ06DUd80R3pnH2KPFwSaEZ4Z2EP1HXFynxca4r45EiwPrcfgZv
         BAUpwUYkh/F2s/MerdiV/nSbZoNc6XE1Cap1KRsl+9NR69WZ1mVCo6uK9lCGA+Gft0yd
         Jwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112040; x=1795716840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
        b=VGc8681TiZwhi25HMfcHGRNlH+4KTjK8npjNATddPIEpnzDYZP7WPk1riQ0gTvfcvk
         D2TD0A9GMIp7c0je+HYfRMiTfyE4qA47ZBTNVwVzhCfzBC99DU0V8tPp2TjZgflMTUIu
         e0SLhz6gwfiSOHP4NEDkc9+IICieafk5FtyZdtDtJOJktQJHuk6+eFNugB3Sn1wtt8eZ
         Ym8CzSjpU8W2limLQlzmnJKMQxMP0X8pPSH5TYwmC3K/7fGidKJR7+zxhuxnPf7aHrdK
         M4o38xZNoKbcpld37lGH8QqPqMIAwBYmnVENpsqP8Oz4CnzFtr6bFtHBgkcBYesptkK9
         F1IA==
X-Forwarded-Encrypted: i=1; AL+hErGBXyZo05UlX96gpQKXUH4pOHYAqL4J9fDS+vTCY+ysivzmRGielol8fExyCLfcGnAlavMc9nhps7SE@vger.kernel.org
X-Gm-Message-State: APuU4Z9nX7LnBbL4p5hWmIcbWWusZ75Y5fe1TFPuvq/ZJEj9qRhEynTi
	2wIAmZgJI/h64Q6jrr4VR5JvNKhUPNlIwrersTDkSzrlXBHwdeskhx2PkvaP6km/KNcSHHc4Ng3
	r3nX+xXwlLEnaSPbUSjSlsNPCQPWud/XaRs+oqAQKTdUps1lRlheQyEJc4EymVBak
X-Gm-Gg: AYBFou2alRIvqPyK4zSGkD3/SeMJIhljzp/qL/iQ+4o8x7iQ0yKe6hbztx9PvbeSVzQ
	AkZwG8twGeF4Knoy6XR4eVnxr0XL+ti8y1O8fQBZ4mVaC9vVG8aQ/LAJNefos831fgADYJZ8Ms3
	og2c92qg82psT2w9MM1wVcr20QXJMkSsnZGDT18qx99WysoIN7CUrnRbqlHE8/7VuQ3ex9qT4Sz
	leGj+qiJb+mId8vq0l6qdbO2pMg1+2HshvQ2TURVddlm0lxLZN5/XJneg8OuByJNsXY6q8zh+Pt
	d1fdSxZsaLecP0ip9fRqT5xUi+ifhxldeGJEqYaxee/9Pe02oyM0CWl6OTfaTMULaHaGc07s2Ox
	YMeTCrq7EE5mqfqK7z7KJAzuhYkF3yxCdTyYItpIXLoriGdyp05pvu8pHzqSiCx/dxKYF7e9/Kl
	oguw==
X-Received: by 2002:a05:7022:698b:b0:168:3243:c91a with SMTP id a92af1059eb24-1b556865248mr489797c88.13.1795112039487;
        Thu, 19 Nov 2026 10:13:59 -0800 (PST)
X-Received: by 2002:a05:7022:698b:b0:168:3243:c91a with SMTP id a92af1059eb24-1b556865248mr489785c88.13.1795112038983;
        Thu, 19 Nov 2026 10:13:58 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:13:58 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: lemans: Add graph port placeholders for USB Type-C muxing
Date: Thu, 19 Nov 2026 23:43:48 +0530
Message-ID: <20261119181349.2017404-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
References: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EEwCPSdDIKX7t-rnUa22jORo8Y6XWBNf
X-Proofpoint-GUID: EEwCPSdDIKX7t-rnUa22jORo8Y6XWBNf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX7esm937uS90d
 sG3xrne5XilVSqcZ6/I/6lo4crRNqYekHqVSjtqkB7VK0n8uAimVOaDrUk6p9wRC4a+OggUq63f
 pjdwK6YK6c6vpz5Dqrwe5VGWu8D6rbs=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6aff3c68 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TTb3R7EhsZKQJm7uMdcA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX2Bwq+wh3SBgf
 mAp3r/0OwUw7HMc4dYqnrGtFxM+0+eF7sqfLvQzh9mz9Rva8xW6NNKTnDmBAS/qkwq9DRTOVMhg
 81OELaTC/cQeU1F42HaEPvKUDEL4yGx7vpNM9IIs88nTYOI52tAmB8oYnFriA8ElMbiggR7BZZj
 Ke5LM6SE/jy5h7pWXE6ZKPBDVr8oEgjvzFZHxpvRTjFEQZ/261cT6uZGXytS7s/n1pvhgxJ8ivK
 k/QCBKy5qPuIAC/TVzBDOPjDZgGHGsPxUF1pLQ+xlMfz3XnFQVYXuZWS2sU/JKgjYEPig8d7LvR
 V2jjZArUEGbSchZXPTuF1pbv5iWosbRBxVtHiU73+H6sqYMWgnXFl0sBfSNeIUIyIYG/2yxlp0+
 Fh9+1G3HnknKQkvHgCq0WR5tt8yLzXBA0dKdTgpuqbvFLtd0Dlq1tQ1s+qo3mDvZXvgvW80ytLr
 gghpvF7Nn9tv1A10L0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190072

Add an OF graph "ports" node under usb_1 with HS and SS endpoint
placeholders, and enable usb-role-switch, so board files can hook up
a UCSI PD controller to drive Type-C role switching and SS/HS muxing.

Drop the fixed dr_mode = "host" override on usb_1 in the Draco SoM,
since the port's mode will now be determined by the role switch
instead of being pinned to host.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/lemans-draco-som.dtsi |  2 --
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
index 1001b6b81c31..6861cccabb2f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
@@ -384,8 +384,6 @@ &usb_0_qmpphy {
 };
 
 &usb_1 {
-	dr_mode = "host";
-
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..0c24e5438935 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3024,9 +3024,29 @@ usb_1: usb@a800000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
 			dma-coherent;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a400000 {
-- 
2.43.0

