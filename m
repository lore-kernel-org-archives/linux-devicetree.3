Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749045;
	b=wwpgyj6dNeN7h/g83EJVd7AQqFpKQodpm2Dxi0XMGDvk5Kv0BirId0HaemPzuoWQjvma
	 yjgpExAkYa8IM8yZBZ9zQYamYiaLTk2TrBaP9pmeKLhck3GEeoJVSVxGnGGukIXLs/dxa
	 +epOBuyWtTnVzYv/2QI7uZE5CvcWoahYwxBXDihjK3KnFiOiFr1RJFg4qjalSnWTjikLT
	 oz6c/J3aZ0ol9nW2ZdQqruFORTaWzG7B4RiaoJMZbFlZmTRNB0t1QMuPEYxiDOxuzOHAx
	 IRu+VRs+LQNvP6luqK+8ZqpAJAV/U6VP9GnWN/1DgKHquvSCUa+5+pj1HGKz6NoWnFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jkMs10a5uIaQEsSdOGti1QyQ00q7aHDT7FVYlNLBevk=;
	b=xqSyHe0PrFJfE4W6UaYJmbtQ+1S/H5O9zwTvroacWOVaknmRk5zpsXY2MU/5XmeI2vrS
	 V2rWc6rJpJb5NENxBzYyt28lpDR8eGfyyqUz48spV4fpouBMQ9nAMwmGufi3MZF9NGhFS
	 7M0wLkP+N4FrZYkErKEFgio6qCCt2UcAkrK0vzRVG9kWwfiqViySlg4NRkVP+iuHGOY5H
	 x+vmQs/zEFZkU4UGBTbAd5SDLbXlthFUyPr8PRhldWOi/BmcL9vw4SII4oFq/U5y8rVG6
	 a/EZWQCNsHUdAqrYwjrszJSs/wXz111NOFopb8PldCdQT/SfqpYc/nBShy++f3iiWew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pxJQYZSk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FuXWY3KP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC4606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pxJQYZSk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FuXWY3KP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwmqB3865524
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jkMs10a5uIaQEsSdOGti1QyQ00q7aHDT7FVYlNLBevk=; b=pxJQYZSkNhePlB76
	C8QjOwB6Blo80uW2z0HYVSOfaP8VIFZmS0bOqGLi6XxswnJODWqS++Ko8z8UdE6b
	6RD7pp8jD+Gsz71yDw23xT4ypX9sM47VhNcRy3ztxdvCFcJ1NTN0CVyr7hO/vjaY
	oBolnqAP2CgocBxXmlTSBYwUrXiNO3HMGClttBMYDRqC2AhylAnOAT6jX4s8/p19
	n3qcBeahuDIYEojD8fTfkcpk6agfXuXerPfZMaE/gmSuiyKpTEMPGrhDLCkfNuUn
	Ajii/PvVWG4zmOYV5g8gxA2bqj3l/EZOmJluu1vvptdvcuZF/o5r6fXgPLCQy+TG
	y0o8hA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55rxfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:10:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so4732434a12.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749042; x=1796353842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkMs10a5uIaQEsSdOGti1QyQ00q7aHDT7FVYlNLBevk=;
        b=FuXWY3KPo04JHN5P3IcBw/zO7VMVdpCS6yjfTkjQi+wDRldzDGhMYB8oZsAHTnXobf
         bEZRpKJQI8++NmMZpuNi5HiXeYVT4a86Xd4a3aBGQEYuPX2v+/+hSaN/ajChr/Ey41Zy
         A563EAj2tnj34ygzqeAn8p6iB5xElTU91pYHF3GKe7D3xmgyU0fEe2Qptkd55qT/g/Ry
         x8nPsPhpMJcQ2cDpms1lpkr09qvycdHDe0dKtgJRuabHr8qj7cRcmcm7sPRvOMAOIQwZ
         dX4W9mGM4FSDhfF/vMDM1z39Y/DzBkOZb+Bi4I8AqkGT4NoxaEDWt59At95sqCPF+ZP9
         omyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749042; x=1796353842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkMs10a5uIaQEsSdOGti1QyQ00q7aHDT7FVYlNLBevk=;
        b=RUws2GbCyGJVOt4ddesu67vNGMJa90xuNl/d6oQzNLlZzPii3Ehf0EE3SpbIz6LyGF
         xsv8jvN87RtZwgek+5cr7Ar1W3dZUpRmklS6tuGyK2xpqJmb1nReD4aK2A1VSpYoTOIL
         1bhHwm3iWTtlRtzECgYqCukoj8HKGcnYXQPBTA6qNTm0VZZx2arpIbbIr4zekT+0eMSm
         zUtB/1tUyP2hmXoFGGvBA6oZgjIV+xLIfIpgovzmLA8BAl/lDHOSxqc5jgLqqKV5iXYp
         qx1DkWknrw3L/JKDIK3rXL68zg8sj2qwdNpUSsvkVtP+S9b4+1kQrDC18n/KZZa2sGFd
         d+Ig==
X-Forwarded-Encrypted: i=1; AL+hErEatEChQemOMiTHFGOhJtKbwVzRKQCgZChzT4pCVBR+tj/RfD6+RlA2+E1Ky2LvnnJXMpO4sX14H22y@vger.kernel.org
X-Gm-Message-State: APuU4Z/1lFBMvnK6DtGxC16GrQX3zxtF75NjITiSk40hAlw49HjU57o2
	TT7HqhpS9l8doFcaeC4XTQX2IdmVAwMHS1vh8zfIqS53y3X3AxNYD/S9ZNW8HkQrDIvejOApy+o
	lWnXvMKfJDVuB5nBr4wnMob3UuNGgLxR9ekdkIS7V7jwj+/ZOixWravHcwug8UIpL
X-Gm-Gg: AZFdTZf3nxDxE8O69Ddb5zR49fHSwgN5P8j/oC0X+zLOOwiX7w+JXV4BJyb1eqQwnF3
	2aNuMhvRPqBldwujQYEChOUks75gSjrbDBjaIYaWAswEIq4a/suGdWnxXNgBBCmO++FuWruXQIg
	s+ikO7m+Pu3L15UX1mPkVnbX6a66RsxvuJ9SOZ8IIQDSLPov6K8IzRMw5qCQE788jNgKgq8XUkG
	0Oh0DI+zEyRPkUKInV7/9WqOdISAO0gLghpHolB1qoeU+lR7wJUIZuI/Bz82MR6YJrWtgIQyGu+
	orj5A7rdnnMNcF14S2BqsmU73imd+H/9YA+NzauNjnMhmSWxfdpbkKq8Fl0IOGi6dL/Tx/zMcCt
	6tebsaOocjGpOklV5pe4C75mbyutOdUApxnVjBipaWneo88hjGyHzZ8xqUyK8Eqrix75YVH/ixj
	mYiggtLL5eXm0pXjHZRJU5qXIF3bGylfHZJaA=
X-Received: by 2002:a05:6a20:7f8e:b0:3eb:818f:619a with SMTP id adf61e73a8af0-4014bc4a0d8mr24485614637.33.1795749041766;
        Thu, 26 Nov 2026 19:10:41 -0800 (PST)
X-Received: by 2002:a05:6a20:7f8e:b0:3eb:818f:619a with SMTP id adf61e73a8af0-4014bc4a0d8mr24485592637.33.1795749041239;
        Thu, 26 Nov 2026 19:10:41 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm12157354b3a.36.2026.11.26.19.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:10:40 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:10:11 +0800
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add CoreSight nodes for
 APSS debug block
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
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-4-42d47474a67a@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749022; l=27406;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hD15XZA8Hewnjy6anGtFD4FUKHu7t2/mWYKuWjmt2r0=;
 b=nXfSVAqBeyxhbm/Nlm4AFUT+NtvH1S+VQkqYi2nGftEHitA7XUfs2VTzaQB6Q+TZrAf2beR91
 c2RAE+KqxruD0smrQNnNCSwFHq/+hl5gZ+X72aCYw3KGAWmR1gK/Qd/
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfXzanMlETGV5Dd
 6r0QLd4X2AgZRzMde99NM+9BdPKwf9h7IPdCZA6PoYcuTRDOdqxomOeCsgqonlMOe2WXZJYsnOL
 CB21HGKA3dtdczn3MYprC4jSRWloZ+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfX7ulgmuy4ltAo
 nXLNV27ulnAdv05P30skGafxBQvyofDm4hgANr89ZNny+biu3J2gSO0aUTnTkjsIhGV+XNLJWq2
 Iv+jRLoUL+0IWj/TRIcf0UHfxDxltdeN2T1WP3fk+47C5Izk1kQjw1iZ3yw33NW/RjRsj4Z7PeJ
 c01YSTUvgCUEXcS+XLUa6prs7I2KZ5pQ6+XVDMod0iczjbZ9kbZftYOpRq06ccF27DBs0jbq80n
 cJ8ZIX50WeH2ZcKRRFaKTEuhRQL7zeowcSIsQvb3YhJYXpQIvG3ChQjSzxBWeHEblH460Sw6z5l
 1/OpqUce6rp3xnHIg9+i0jSwNmHzNfFg6ghbUlN9DGJ33jIxO+Ds+V63Q96yl6l5uNnjHJXV++y
 19L3kzgVc4iejiEtkpuoGoLyePitZ+QBuS91JxaM2t1CYm3biWthIVlSer2pmAxcRj4UWhR7Xcj
 zucIeFpy8RMV4gvgSvQ==
X-Proofpoint-ORIG-GUID: oTUr3iq-tnxJ17LyHo6ndhKLP6LGTPSy
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08f4b3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ce15j2tNVsKkWIhotFcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: oTUr3iq-tnxJ17LyHo6ndhKLP6LGTPSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270012

The APSS debug block is built with CoreSight devices like ETM,
replicator, funnel and TMC ETF. Add dt nodes for these devices to
enable ETM trace.

The replicator, funnel and TMC ETF nodes in this block are physically
powered by the CPU cluster power rail rather than by a dedicated
always-on rail. Add a power-domains property referencing the
corresponding cluster_pdN domain to each of these nodes, so their
power state is tied to the CPU cluster domain and the runtime PM core
can power the domain on before the devices are accessed and let it be
powered off otherwise.

Mahua is based on glymur but only has 12 CPUs across two clusters
instead of 18 across three, so delete the ETM and cluster2 CoreSight
nodes that have no corresponding CPUs on that platform.

Kalambo is based on Mahua with the first CPU cluster removed, so also
delete the ETM and cluster0 CoreSight nodes there.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  | 1184 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi |   16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi   |   16 +
 3 files changed, 1216 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..9dd23a52fb2b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -397,6 +397,312 @@ eud_in: endpoint {
 		};
 	};
 
+	etm0: etm-0 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu0>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm0_out: endpoint {
+					remote-endpoint = <&ncc0_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm1: etm-1 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu1>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&ncc0_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm2: etm-2 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu2>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm2_out: endpoint {
+					remote-endpoint = <&ncc0_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm3: etm-3 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu3>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm3_out: endpoint {
+					remote-endpoint = <&ncc0_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm4: etm-4 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu4>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm4_out: endpoint {
+					remote-endpoint = <&ncc0_4_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm5: etm-5 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu5>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm5_out: endpoint {
+					remote-endpoint = <&ncc0_5_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-6 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu6>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm6_out: endpoint {
+					remote-endpoint = <&ncc1_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-7 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu7>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm7_out: endpoint {
+					remote-endpoint = <&ncc1_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-8 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu8>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm8_out: endpoint {
+					remote-endpoint = <&ncc1_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-9 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu9>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm9_out: endpoint {
+					remote-endpoint = <&ncc1_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-10 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu10>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm10_out: endpoint {
+					remote-endpoint = <&ncc1_4_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-11 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu11>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm11_out: endpoint {
+					remote-endpoint = <&ncc1_5_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm12: etm-12 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu12>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm12_out: endpoint {
+					remote-endpoint = <&ncc2_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm13: etm-13 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu13>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm13_out: endpoint {
+					remote-endpoint = <&ncc2_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm14: etm-14 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu14>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm14_out: endpoint {
+					remote-endpoint = <&ncc2_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm15: etm-15 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu15>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm15_out: endpoint {
+					remote-endpoint = <&ncc2_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm16: etm-16 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu16>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm16_out: endpoint {
+					remote-endpoint = <&ncc2_4_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm17: etm-17 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu17>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm17_out: endpoint {
+					remote-endpoint = <&ncc2_5_rep_in>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-glymur", "qcom,scm";
@@ -7456,6 +7762,14 @@ tn_ag_in53: endpoint {
 					};
 				};
 
+				port@36 {
+					reg = <0x36>;
+
+					tn_ag_in54: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
+
 				port@3f {
 					reg = <0x3f>;
 
@@ -7837,6 +8151,51 @@ pcie_rscc_tpda_out: endpoint {
 			};
 		};
 
+		funnel@12080000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x12080000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				apss_funnel_port0: port@0 {
+					reg = <0>;
+
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_etf_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_etf_out>;
+					};
+				};
+
+				apss_funnel_port2: port@2 {
+					reg = <2>;
+
+					apss_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in54>;
+					};
+				};
+			};
+		};
+
 		tpdm@11c03000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x11c03000 0x0 0x1000>;
@@ -8514,6 +8873,831 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		cluster0_funnel_l2: funnel@1d021000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d021000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_etf_in>;
+					};
+				};
+			};
+		};
+
+		cluster0_etf: tmc@1d029000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1d029000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_etf_in: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		cluster0_funnel_l1: funnel@1d081000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d081000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc0_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc0_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc0_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc0_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc0_3_rep_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					ncc0_1_funnel_in4: endpoint {
+						remote-endpoint = <&ncc0_4_rep_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					ncc0_1_funnel_in5: endpoint {
+						remote-endpoint = <&ncc0_5_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster0_rep_0_0: replicator@1d090000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d090000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_0_rep_in: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_0_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		cluster0_rep_0_1: replicator@1d0a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_1_rep_in: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		cluster0_rep_0_2: replicator@1d0b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_2_rep_in: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster0_rep_0_3: replicator@1d0c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_3_rep_in: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_3_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		cluster0_rep_0_4: replicator@1d0d0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_4_rep_in: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_4_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		cluster0_rep_0_5: replicator@1d0e0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_5_rep_in: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_5_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		funnel@1d121000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d121000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1d129000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1d129000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_etf_in: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@1d181000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d181000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc1_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc1_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc1_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc1_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc1_3_rep_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					ncc1_1_funnel_in4: endpoint {
+						remote-endpoint = <&ncc1_4_rep_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					ncc1_1_funnel_in5: endpoint {
+						remote-endpoint = <&ncc1_5_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d190000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d190000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_0_rep_in: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_0_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1d1a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d1a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_1_rep_in: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@1d1b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d1b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_2_rep_in: endpoint {
+						remote-endpoint = <&etm8_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d1c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d1c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_3_rep_in: endpoint {
+						remote-endpoint = <&etm9_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_3_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		replicator@1d1d0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d1d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_4_rep_in: endpoint {
+						remote-endpoint = <&etm10_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_4_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		replicator@1d1e0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d1e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_5_rep_in: endpoint {
+						remote-endpoint = <&etm11_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_5_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l2: funnel@1d221000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d221000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_etf_in>;
+					};
+				};
+			};
+		};
+
+		cluster2_etf: tmc@1d229000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1d229000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				port {
+					ncc2_etf_in: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l1: funnel@1d281000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d281000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc2_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc2_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc2_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc2_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc2_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc2_3_rep_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					ncc2_1_funnel_in4: endpoint {
+						remote-endpoint = <&ncc2_4_rep_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					ncc2_1_funnel_in5: endpoint {
+						remote-endpoint = <&ncc2_5_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_0: replicator@1d290000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d290000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				port {
+					ncc2_0_rep_in: endpoint {
+						remote-endpoint = <&etm12_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_0_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_1: replicator@1d2a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d2a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				port {
+					ncc2_1_rep_in: endpoint {
+						remote-endpoint = <&etm13_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_2: replicator@1d2b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d2b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				port {
+					ncc2_2_rep_in: endpoint {
+						remote-endpoint = <&etm14_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_3: replicator@1d2c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d2c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				port {
+					ncc2_3_rep_in: endpoint {
+						remote-endpoint = <&etm15_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_3_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_4: replicator@1d2d0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d2d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				port {
+					ncc2_4_rep_in: endpoint {
+						remote-endpoint = <&etm16_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_4_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_5: replicator@1d2e0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d2e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster2_pd>;
+
+			in-ports {
+				port {
+					ncc2_5_rep_in: endpoint {
+						remote-endpoint = <&etm17_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_5_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in5>;
+					};
+				};
+			};
+		};
+
 		nsi_noc: interconnect@1d600000 {
 			compatible = "qcom,glymur-nsinoc";
 			reg = <0x0 0x1d600000 0x0 0x14080>;
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
index 868b924c4734..41218577777b 100644
--- a/arch/arm64/boot/dts/qcom/kalambo.dtsi
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -5,7 +5,17 @@
 
 #include "mahua.dtsi"
 
+/delete-node/ &apss_funnel_port0;
+/delete-node/ &cluster0_etf;
+/delete-node/ &cluster0_funnel_l1;
+/delete-node/ &cluster0_funnel_l2;
 /delete-node/ &cluster0_pd;
+/delete-node/ &cluster0_rep_0_0;
+/delete-node/ &cluster0_rep_0_1;
+/delete-node/ &cluster0_rep_0_2;
+/delete-node/ &cluster0_rep_0_3;
+/delete-node/ &cluster0_rep_0_4;
+/delete-node/ &cluster0_rep_0_5;
 /delete-node/ &cpu_map;
 /delete-node/ &cpu0;
 /delete-node/ &cpu1;
@@ -20,6 +30,12 @@
 /delete-node/ &cpu_pd4;
 /delete-node/ &cpu_pd5;
 /delete-node/ &cpu_scp_lpri1;
+/delete-node/ &etm0;
+/delete-node/ &etm1;
+/delete-node/ &etm2;
+/delete-node/ &etm3;
+/delete-node/ &etm4;
+/delete-node/ &etm5;
 
 &bwmon_cluster0 {
 	status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e7141f8c9e0d..d2ac3e632ec0 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -9,8 +9,18 @@
  */
 #include "glymur-cob.dtsi"
 
+/delete-node/ &apss_funnel_port2;
 /delete-node/ &bwmon_cluster2;
+/delete-node/ &cluster2_etf;
+/delete-node/ &cluster2_funnel_l1;
+/delete-node/ &cluster2_funnel_l2;
 /delete-node/ &cluster2_pd;
+/delete-node/ &cluster2_rep_2_0;
+/delete-node/ &cluster2_rep_2_1;
+/delete-node/ &cluster2_rep_2_2;
+/delete-node/ &cluster2_rep_2_3;
+/delete-node/ &cluster2_rep_2_4;
+/delete-node/ &cluster2_rep_2_5;
 /delete-node/ &cpu_map_cluster2;
 /delete-node/ &cpu12;
 /delete-node/ &cpu13;
@@ -25,6 +35,12 @@
 /delete-node/ &cpu_pd16;
 /delete-node/ &cpu_pd17;
 /delete-node/ &cti_wpss;
+/delete-node/ &etm12;
+/delete-node/ &etm13;
+/delete-node/ &etm14;
+/delete-node/ &etm15;
+/delete-node/ &etm16;
+/delete-node/ &etm17;
 /delete-node/ &pcie3_phy;
 /delete-node/ &pcie3a;
 /delete-node/ &thermal_aoss_6;

-- 
2.34.1

