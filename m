Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468038;
	b=2HFJ1PN11+2SjdW5/skhKkTwpUOUb/Z9CZpXB5gH1+JXMzNpDFCMkB9K4eFpUPN48VMP
	 X/hDfLbZnjHBUdGoB/3LTMCW/ZOqmw0s4TtG3EjRCZN/Rp+4AUhB7ebFvaUGv2wUcClCA
	 vaw9snhu9dbUPO4AW2oWaPO0rOA0v/DZVbrSfOR2KgIjogHc6pzJaBQihgTMgCAjt3q2R
	 IoL9sWsOEGLxLqiuFLXoY9B3RTUzmHB2PbU1CP9WEQ3yGJulELa9VFwSHdmRjWvkDPjH5
	 zIIDw7LD3yE7Ce+qDAHKSs5GTtcK2VoIEekOZ8d5bYIuUllNXRLDTInx2lY4nJPn97Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
	b=GT7IuFbpMP2I6DHbhVWlWD4z9/R+1Na7LrybR8sIWmsJBI1rp7wDxeGG2e+bg65wAt6R
	 dkoeINmOx/sJDq/gI/52IO0qMWKGw3aIEOuKu6AgP3EIYIaluUmm7A59EIZgJecS7cT7K
	 GDHEPdiMUhQwVUF1cLJYDtjRxbet+ODv8/rkkjQU/C/C6iYiUGKoM8SJNRzVWeMkAZA7m
	 Lq157YuznHlzAlZ3+C1cqrLnNwJlArFfYVJHE5sQ0xWrVwQ7CYX+1BVYLEwrjNg4z3J+T
	 lTNpL/pF25EfvIKWXeWl/Flt+YcvKYHzRgEG81Grcu1WaNpg2uFTH0V8LRB48qlDq0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx8cIear;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcUjBEdX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF4606A88D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCF4606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx8cIear;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NcUjBEdX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4mBkm3893545
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rwNiXWlFQ2u
	5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=; b=nx8cIearCKz2M7jUwCP0l6hGYyq
	nNQR4T7934+K0oNS1sC9kAfxW+5MP6Y/jsIGXdZ39lIsKIEEoG9Vpi3KbVT+PmMP
	xoR++p/dg4Nb130XSwcTiKIJceUdKsOG99f6lASdWzXjpa5IImcf5I8rMnIK+Cf+
	hxUOCBm+OIPGacas9l/+N5x+hPz/WmsZCorYKUFLxH8DKfuGuCio84OX5Qbgf95t
	v0HV2NJNJbCkn0YSIOOc7QtH5KHhGo/8qxLyCaPqWnj1eTopghiwtsAl0oYrw4P+
	vjV/QkXtxi6iqWZM2EzbjlDE845H3JG8JymJ/slwv0RwaJqOVg55T5ksAHQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0fp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0e9b6717aso456243a91.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468036; x=1795072836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
        b=NcUjBEdXBVe5ewmtTcsXvso7a2Z/XG6G/jPHvW0CISXoafjqUJbuA0tWwOKhGMFOFL
         XspCXNnmTbTktngVVSbvGUGgNNcA/01CZQrXM+x5JXzTyx8IYujhAIxJZWKUMN9Kzt+h
         GDTc7wtNEwru712xZZf8MXYwTL+q2kJHqP+eTf3OzxtuDyEdAnlZgvAhQVEhVKWhz3EN
         90+1yZkeJPEqB7CoQfGKKnRilcvyDFX9JNdjnz4oK9QDd6G1nsv+QTKrZVvvjSrRQAo5
         Pj8YaiYfwCmMng3umYwucRDwf0VE6o4YoUbv9RD8TY/1SCepe1A4+cikQrCTtguS/Nxp
         K4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468036; x=1795072836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
        b=Xl2u+aGKKxBcO1UpTZ8rj/hLh7Hs99xPiY3ORBtZR0rFSShu5sB7FMJ1IEf8Ixkli6
         ZV6jAgiloKLMgyRgY2VMHu19ypZYrplVdXLC0t1nsSE0GmFv5huYqKe11tvF2ea3OI/u
         PXok51034GnQ48WHDR/C1ufhDGAEoLn5stBmHc8nHN5ooAT8k8LT7VOiI8S6O1u7fPoF
         gAhdEFb5Md2EzlGbOw3hLHdIYn0Fr69ZT8QV2qTgUqJb7Vfq8Z8aT6SGkPfh+C9LiB+i
         RsyqBa3XOiE17pzvkpn1m8U1J6Sl9JpElXwHL0uZZ0ms8bEqMUfiHC0dozh6OnLheqFT
         dFyQ==
X-Forwarded-Encrypted: i=1; AL+hErFM7uL0t6Yf/a/TWLjGDPN1Muvdk8zdtGvnA4K60tIv5xfvyzprUZFff3KLoS2idorXck1dVKksazP2@vger.kernel.org
X-Gm-Message-State: APuU4Z9SV6GrJb9+OQ0TAfijRC9uOmSshc91x45iKEKNKEY9/rva5U5p
	a7FidlYUJMdp0WxgJnx2PotStiSb2QIDtXz9vVbaaQAxYnjVegJ/LMr8fF+APNPySyEssv0w+KN
	qWGZnAoHgK2MMbrJm9UHO7mveIq4+Nm+zWnNAlBSQTuPTCkRJKe3YuB/N8RMWakKi
X-Gm-Gg: AYBFou1GUHObIVvjJXjQnxq5ETe1B9bF/pNPm03Yd6R3xNqF+/20EDGHQsx6WkZqczU
	EAZJVBplODjuFxET9Sh68IApp40oisQU/dyYfRShbxUDVd2FRkWpsllLsYXrEyOsCQgz1UbO+aY
	mVs6a+opHvTc2a3pYnrZIslZJap60tqYhm8fe6DzSM23tpPcokpB01yKTmAcaIY6HRoD/Hrk2q4
	eiz4CsQjE37DD3d3HlG4PSwsEjMQD1/k+2NiTJjHEq7G1CDtb+fLwcw7O3IUkvNekqduhEzB3gI
	QhQtslkTcLF88/vv6ZQKOsWUoQHZcE5VrghDbM3/rS4R/FRv34FqZ4HaFY8/xEIydDmF9b++WTt
	RD507Px7Yq38g2fv5eKGm36vcJltgBoF9gx42VK0oRKbiHoyp20P3ZqG6CbnoHHVMPCadfFo05d
	RIiA==
X-Received: by 2002:a17:90b:134e:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b182d6a766mr7549737a91.0.1794468036626;
        Wed, 11 Nov 2026 23:20:36 -0800 (PST)
X-Received: by 2002:a17:90b:134e:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b182d6a766mr7549707a91.0.1794468036206;
        Wed, 11 Nov 2026 23:20:36 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:35 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup
Date: Thu, 12 Nov 2026 15:20:09 +0800
Message-ID: <20261112072009.3815276-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: liz1CjQYUzsC0MWljXSBP6BhHSE1gvAE
X-Proofpoint-GUID: liz1CjQYUzsC0MWljXSBP6BhHSE1gvAE
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af568c5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GJxj0BfhqkdqIuq2HFIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfXw02F9/PP6Czb
 370OQ+L71HtKtof8rsvMEEGW5XKGEzTQHHlNs/Z2Ky0XwlF1aMV0q0AZtq9+yAy3Aca6aCo3YyI
 c1aJ+v453wkL4zUHAFDz30Z3U6SSn/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX/gXelkfY/bwl
 vbwAyGH5hSIkkePM728PlJ38FhSxKuCcm/uf4sglb+CwLDMye1vsGSFwaR9PNyknDL/CllgFsFE
 +VlWL9yjKAuzJufZ3tY1nnMX+hR++C9L/kFUT0Hf9dKPDhfNG4RN58SWQUrbZB9X9Qp6Cy+++kd
 PGHrOqenxWDJ2snemL5LaZiZeo8pKNNPulIBTCPo208u4PdTUziGvuXpki5RCgOHBclC8Zi/bU0
 frnL2DxzPBai8C6IN59//CNo5izQKDAjXc0/dm3IirLDfKfha3hVBuaEVthzxeozSX26Cu/9+IG
 JdIHi24AmgoX23A/BrvpXuXKTjaaKwXcYu9EEr3Jmb9MzCGQcRjCZX7HOifyxoXgdb0Nx1ZuxXa
 S679/yNgPOBAusbkFctZtrXKVa9OY9EAOPNuLuNXEc5jUovtWv5CeDdr6wxN4AP1+GVrSBoe0qf
 5ffq7ovDPooE9CCSuBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

The WCN3988 SW_CTRL signal can wake the application processor on the
Shikra CQM, CQS and IQS EVKs.

Mark the WCN power sequencer as a wakeup source so the driver uses the
existing SW_CTRL GPIO as a dedicated wake IRQ.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..c7b894b6126c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -102,6 +102,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 99e974f6ca7e..321bc6423728 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -85,6 +85,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0

