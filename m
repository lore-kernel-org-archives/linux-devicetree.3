Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458210;
	b=Ng+eS8qBswWgmylhi/Mh/sBCVd7GkiWpLJTzaDPb5tR5r7kiX9w7e90frGceCLmorEP3
	 mQ8zEmHdTgD/X0F/48wBQAZsIRPFLF2etuE+VOsndmTZcaiXeTiobmC+7FlVw7QJ1uWj+
	 +Q3tnss1kYR9b4YsmSrxWJV8VaRsgVt9qk++J1LTk0dBxDxzePkvpfAG1GkTxi815QhlG
	 /TCHQjCZ4aoAVolHGG54yVK+MwbOqZHmMguAkPgNboweCEypOLsKhMi8/PHNiM/3bGS1c
	 IEdggr0a0k3UrFxnWfdHI63NxwwNd0yl300bTFuf3A/VPxmIGqRSCTjM7Q0jX/gDsnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
	b=oDZ5GkESbataDMFpwpayKyWyTRpjSVjhXPVFwYaEfzMNvXDfRDuE6eadIHNbnzg418D8
	 qIl3PhN6RRtOXGmZbqnKUWgPRiRB8paK0futxR1QN21J9OnAXKcKi12IfWxZDAMBgYaMx
	 ri714Ml1chh8XD8BXcMIHnJkTqNQCQGbxbCaZfZPZ9yr3y5MkRJ2TxXzv54GDMC684Bxk
	 Z7Z2jqwbsju048oDtiDSGDjUYl4JtWZmVaguWGBGA9sJtJHZSAA/Z05viXSMVlBP7BnxY
	 6iO99KWI8D59Yx5Tb99ov6AzQkxcO+hiQKvUs79SwK9X2Kd5siCH45XPrHb8m0QpLTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oifmBZ6C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ctm/KkqP";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B2606F889
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C58B2606F889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oifmBZ6C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctm/KkqP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZTZm3158558
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=; b=oifmBZ6C4d99gSrY
	M/wHrGMM/v9ZElNijdWT1oX0pDAV3minEPzSPZmwFWlwpd68ZhzCNBlBtCbf/k4+
	Rme8SB3eaFCzgBYCAiM6HXeFsl9qh2jSpY6U85bMmdyOmtLgY68l1E7Rxmam3NJm
	H4sVDNifKjlHQ6Hd7+e7eU8lg3xtdTpaH5Uwo8hMTloRpNW2yeirl5A63iWQnTy9
	oDIRtPI3y1rVVqsik1xZQ3ywZlMNCIxQ9bfdduNC3DyBdbXrAlixolNNCXqta55l
	mo2NvLpBozOHFpditxnWlREWUSKnd9xuqsAwXd/zLVnsV7bkNWBEWraNwzYQwCUG
	Rt60lg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pvhq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so391267eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458208; x=1795063008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
        b=ctm/KkqPyntqD9a0A1wD6QOMI5+nWdwl8L7eMG0SSKw9NRyCj7wSryhmaTH0AEpqgA
         C6U5Z6m7CkOLJQUvjwxKBT9M4sOOHAAd2qugCFAxBtQhefjtXSiz7vUX2kjCCx3NKPLZ
         6UNIrP0i7nPa9uXZcZylEgUEuBiAln6xXjGDCNKMze04tbf+GiaXMZyqyQG0w6Afo9OT
         GDB2b1xDWX5rNXXsLtVhGIWg8EBD7zf37o2A/9MfAgNJwg1tbFKxKx8zfZ1qfm46M87k
         bgSB6O+USfCNE1gne1hArFUT6bReZ/bFNXZVo21QFhH7fLHe/Of26qD2yQuYFwCmbroT
         EPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458208; x=1795063008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
        b=mD0iytSuf9bME/Q69rfl4viTuZaeRzbgNhC/FbemhtV5ORv1yiXpei/pSiu7Lt4Uzc
         VDbKj2VxKOBaPC4wPq6sUi68/n4U3JgBorTG50D792kd5L0FDYZlCfVuvQFLPGO8/WCB
         XedRDa1csqUIqm81CLV6ePSZbIbMiavjQM7/0agIiQAlo8umlyXpCnk76Ae61Z8y+JEg
         Dxfku2/WoBI6sR5HA+kZcQLN1aBX33M2FJ8zOeJwt/xFQw0pocse1FIlsiIBP9w/Hmkw
         TwYEuRNRC4oSGXx6cihNupNrRhCCvT22YxAL+zNSFickXzDRmfD/OZXornx+IIlagB8w
         PswA==
X-Forwarded-Encrypted: i=1; AL+hErHvu9qruFOVSH4VB5ji2TBkmRCuR7tHD3w8zmS7M4JQSCgR66YYOtvkaJ+TuoJMs6jWuS18izmIc/vh@vger.kernel.org
X-Gm-Message-State: APuU4Z9RFWKGmyh+AXEXc0cJvEKFjPHNHLUDi87UdIkXz3nmaZg1f/PM
	bhYNU0WKmSxEQyhtVgu2DUQgnnFq6HgnkkX766C/3VlF4HwJqoiCPtAVhr/5P+iaSEBy1D0iesZ
	oKwj/Q16A4+XIB3M0iSFTMI3tmQHAm4vAej92Szvap4rfbtABenPIpTPGYYhxcEwY
X-Gm-Gg: AYBFou0Bk+slZ+m4ChHXmBzhO0LOC5RUvLCk2XPIC+FvmvfddxP29f8+M9kvCyBxHVQ
	2qMqaboCG4yomfLQ6L21JXgwMPwoVUKJpO+EmtvLF0EAbmUo+Fs0Pz+Prbk8GaaYSeyzgRnQMl0
	l6MkvDzfcyM7BnD7SKooIEGmbPs19z6I+Rzy9QmVR1NUojfSuuxDLN5x3zb+A/gJ8iXb6tlh7nC
	j7t/ME1yy0905G/UWPpmf3+Lw67Pzqkh9SqhFjlkzazbK0YtTQaUzbhDP/cDWL6+I2ycczbf7nI
	jB5b9NeWFdVoxOP2dOkjyjkNBYZHuAWSHQWNVnhs1cYeBJXXqhmXjP6faN715cRfmi49oycy2Gm
	CSZ8julXPOrjM6tBEjhew0peFNr9c3f2Nea7oE+fPsXem/ByXF4IbIQNAJ77UPX8e0iwqhcbLde
	V9UVT9L/Y735OePSh5ma6+zpRPY2Nmqkdx7b3IGbtdgWdfHQoFtgRWqzp2vZFx1Bx6oaPyl96xl
	BgtT4w=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr1845794eec.25.1794458208152;
        Wed, 11 Nov 2026 20:36:48 -0800 (PST)
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr1845763eec.25.1794458207594;
        Wed, 11 Nov 2026 20:36:47 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:47 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:24 +0530
Subject: [PATCH v9 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
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
Message-Id: <20261112-08-dts-v9-5-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX/8B3KIJasyol
 pMW+3sLltEv6ONt1/j56MYxEI9MYHBZdAYYFZFPrlN4Df2OjQlAykQepjxEsnxqxiB3UPQgJKav
 nGazKb0+sOyUs7vXw2+/kXYUnrbVyCk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX7pxJvAV6pU8/
 eLlom7zadI8+TZ41RBs5k9L1qbkswvUcO4oGiJfbx5VSbq7YJJUjBH+zoYlrxjz+lSOpa4D+zC2
 /EPNyuaLHYIEtUHsQKtaWr/QpDVlVRmhwFmpaReO5ztaCDghGwnRp5YS9HG3pWT1r/5a/gwH5pe
 ilEYdAz/MkoQvbV380fgAwxnuA/TYapGh30g8Fgp9STDlfbs/6tlBew6iwXLqJ3h2kbwKoLC+sI
 1FvHFzQhwiKH1sseozhLwWo+Mh8WGo6Z3HhZiZD3HdD91equ1OAz2xn8qKDtcR3T+7SPdb6F5ed
 pUMrs2CU/cmtVEZoXCbotxaVmDsEqiHf8Yz5ni0rzI2cneEIbvxCDV5HkayZVzw86f5ZGQxDbMb
 xrQcQdSyIOL799AdUUQK+KDJ6zaaHMzW+xlznLX1u3T5ziaqqXxhR0tixRgN4+UnRZsSaVswrnj
 M6rwZ+irh9Mpz16cKXw==
X-Proofpoint-GUID: lsyzdYQ3e-D4WKvxy7PwDufpKTX8EWV0
X-Proofpoint-ORIG-GUID: lsyzdYQ3e-D4WKvxy7PwDufpKTX8EWV0
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af54261 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NgvM7Uoa01S4sPDBfAEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 504364ca031c..f3d688fded80 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -49,6 +49,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -60,6 +61,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -71,6 +73,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -82,6 +85,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -93,6 +97,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

