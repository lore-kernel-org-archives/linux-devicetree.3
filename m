Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ADB435AB6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442237; cv=none; b=jCJ8/3oAeBQMzpU7+D4qUuUUVfISfvLuEFmPyOGCZ6BWC1QI+UrxoezzPqP6pPz16192voJQPlRQIdKsp2A66nJVKKAzg6LC7+N8eV5ykFdQXysPgiDnrr2wDmAU2suIIkLyjpmABlSzmGVTcJdc7CVHN1AX8/08dsK8b7rhReU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442237; c=relaxed/simple;
	bh=tMrC93Dus9S0lREYudXPFHHq5mzvSj1dmlTSG+Z5F8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Er9YBglOdK2tLrGhA4HYAeuIqPilfOQSbxCctErvIbnl16VKKg7toJFf3N4G8b7fDLTa3XM10niy4RL3LDZpOWbyw+uENtZfhh6gOZOx9y0TtW+fAlXVTwcJxbDAhRsG2SfyUtSUhYxmu5OF6sh7xebdPWDY3TQGQxP3pz6e4oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQr66EDd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNYnwRJf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQr66EDd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNYnwRJf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTFVn029936
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iLIe2sqk6h4
	NRKgLyw23Q6cPgYJKlFV5hVohkgx8Spw=; b=FQr66EDdfiLuR5zSQF5BLpM0tdz
	Qxv1Knn3ZSLlycnsji4GJR9rkipQL8ndppatOQjeJvpkGisIveE+HKWwP5dISV8f
	pAAzX41ip1DlU2pDKAe0+oqiK3UTDfvFflvskCgAAoPJIhRwCummsxXPxamgZVdR
	dAdhcwmdEKqeZqa54e/nenM97a/xuCNM/Th71b8x0upvT96euo6oXq1+rUvTTN0H
	/lScgyUL8WBCFbWQUdLvuIE36eyfnNQ3cVBiMRzZDAaMmfZBO78i6ZN4biibhxfI
	vEHb9o4VNtRol80zWAltxliSHqVHRt7MP5UEVkcnzrts09U4UShxqLQFT0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7bgb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:37:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so102661061cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442235; x=1784047035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLIe2sqk6h4NRKgLyw23Q6cPgYJKlFV5hVohkgx8Spw=;
        b=DNYnwRJfJl9I0RuS6ynMtpaUPl5gmg6feZ61dQ4+oBOxyXPXkZ25qvKpQTGCqmP4Ib
         w3X3PLR3Fe/xPCBEjnYHJK5fNR2A/nN6+l/vtLXJfXkDTA9Gg8hs/daT6+Xve3uYARiR
         4A3s0CTcFbRRgnAtzF6bP7F6byYx1j84Mg6znRQUblAYMQFC1r+VKq+I7dc7JvhBQ1PI
         n1EPFqMY0bMhTtOxLtyuyWJpe3ELb0lwWrRkbWTRS2GKnsrbl1+WJZKnYTzUuwQlKwn8
         pk8t8wIDWWp5vve3rylgoBflnLJRQgj0gh/4LC7xl3L2lFhNL1W3KSMXK2gByzHemcFL
         d+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442235; x=1784047035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLIe2sqk6h4NRKgLyw23Q6cPgYJKlFV5hVohkgx8Spw=;
        b=LdSNV6WCwARuOu5VDHKrpRnvydCBm36/rfWT/bB3Z+6+V5F6GlbzpAfb6jSo+u1VHa
         bYx80N1W+bpOwhKxmGUzhrV8XH0l6vs9NmWzjogKhlV6UbhVJP8tmeb7rV2wCdJIRNS7
         1GncboDUuEvJ/9RaQ3pyxsQPVxs8nyiEEHEuYWD9oMCjz1vxOZg9b0rhIHMIMLwSq42N
         9nEhA8DGjWPiHp++KuID+GABSJ7aCaSXrp1ABFMbmdhN5S66nXxxIQzdCYBuSUzJlJOc
         x+kaFgn2GERmRNTmKfQp/ct0W0dyvA06kKjEzYTWoeANLLalw98ZZhoV3galtlbT1NH4
         N9qQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1s2d0F1yu8m+wmV907eMtPEglhGxdAFl1DphqL9Wmfaz7N3u8X1kwmao6aQMLXxV8JNfQJKyhmC2T@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ceJb82bYUd7sn4IdERpw9HNPnuN+OdoFBmsHoFGgo8sXWqWC
	gH2ouu+H5uh+IcTumEL0P23OjUPfRxt5ooRDTrX8niSzOqHmX8DtWyIH4hqlHTWUHf5RoFinzMj
	MUq2B8hmBc5OQOB3QsELerzHUYEgw/k70vExSu9kUJgj82ASK8DPEzvswb2VWnitl
X-Gm-Gg: AfdE7clPm5dCIpVJJFr04LGzzvCcuC9kFM2k304x05Xgan7+vULIU18S/vK1XbyR3el
	swKNisy91S4s4NrSrLdtzeIfDbzMnBANa/jSRGXtopMrJv5bG6DqVr3RrnrjIAfilxbK8HhrbD7
	YrLP4U3A4ax1geSAARt+Mjnqn4C7cFSKI306To42wPS0VdeqcG7fFnh83aqquQY0j1t/JlkSh1v
	73L3tIfE7wahdw+32jKacLas2pDu3CcLPCAPaFpsC2BxJDBJ7XtKVsOJwFpm/9lb3rmm5mK8uu7
	PBxwwa+5GwRmKm650bGcNdtCWbuwPH22LIQ8sSBycBnJjOAL8mhJz7njy91IF9pBWKP1vmSoW0M
	Yidu0QCeMQ5DvTtrYqr4PUGgV
X-Received: by 2002:ac8:5951:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51c7487bf1fmr64851001cf.47.1783442234572;
        Tue, 07 Jul 2026 09:37:14 -0700 (PDT)
X-Received: by 2002:ac8:5951:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51c7487bf1fmr64850491cf.47.1783442234012;
        Tue, 07 Jul 2026 09:37:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for 40-pin JHAT connector
Date: Tue,  7 Jul 2026 17:37:01 +0100
Message-ID: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nMH92egGDwvIT0oC4DmNHJYCuM2ZulaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX4/e3GcFTcTY/
 mZnxCvlgW8c7ROdjZttEFaRO9EMwJcQJm+C5jmLMPATFZk+HHqM/wZXLCwRM2KuOz6AxAYjC4w4
 ZTInhGli/UUbtLAJ1mv9gNW1JU76lGftrp/segw3QbX0BQqouzkz8buvetCDRKlvp87IptpfJWo
 XG+P71VPs64iX+CfD2/nzw5lrcvDcfuMFCFu3Bi8basT41hUUZXHjBE4nSgrtuvBO8+Gk5zjCMf
 dkbWJYveDiTp3O2nLcm+Qn0sV5aC8gwEntOPpk1wxbNwr1TDgFnLzAkmAIzUwUzuqqQlPZZJfbM
 nku3RphGvDi5lH1OW1lgFdzMEpH9yZvViUufJhK0g+QgZnBiSkMWYXimRYDOs+9Sxe/uBak5Muo
 +XFhUeyDWhlaqlSouRWjHwxdImcEYqGOge7U0YFuGHO6yB1HtdBvSCFzZ7qB7Ii+8W0V+KWpjKC
 95iI0FHr6sTZ5lUC0/Q==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4d2b3b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dj7Vvq_9f8a1xWt5ZFsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX2011KMHW8nga
 CBrJ8n0zfNKmrJt+v3WmN7pDQJUmNiOB7B40dCUk5AZnf+gYmLNKv3j51VwY+NScY0BRo2FKHo9
 8Y2cU3SdibCWVzA4rHsAIy9rjggdlug=
X-Proofpoint-GUID: nMH92egGDwvIT0oC4DmNHJYCuM2ZulaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162

Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
connector and add the corresponding i2c0 and spi0 aliases for them.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 8b3ed73feb6e..4b1975dff885 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -19,9 +19,11 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
 		serial1 = &uart10;
+		spi0 = &spi3;
 	};
 
 	chosen {
@@ -257,6 +259,11 @@ queue3 {
 	};
 };
 
+/* JHAT 40-pin I2C0 */
+&i2c0 {
+	status = "okay";
+};
+
 &i2c12 {
 	clock-frequency = <400000>;
 
@@ -425,6 +432,11 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+/* JHAT 40-pin SPI */
+&spi3 {
+	status = "okay";
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
-- 
2.53.0

