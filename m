Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884085;
	b=WnhFwiRgNiBNJjZ2OOlPU0NdMgqPR4VrppMY1XalVDKubeewhDn/yPHUiUjWzsHLpaZ9
	 4ImtiJFZ/XrJKz7k8tQU/6JzBChqFSG+COKp1uFn4NkTQS9nZwjshr5uHGfy7u14hAQSh
	 VTD8TutXPYnrRpU/ZRdlB9XqJ/mkbSNM5Ryu2XmQA1ha0/d9xodqAyftE0s2zimyPiwIL
	 J7lSQLcquJ0rYNxUMcqaShAbKA8Lu1mmfidcQazch/7354kdoZCtHtDRGCCCVY5ruznhL
	 fZLMoU0g0whUQGi+qhqHFZ1FRHHRNy+EyVX/OZ3kqVCK8KKXdVIa68SftVxeupi0LrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
	b=49dafdtZxZ2cTPTWM175ADo5tt9HEqGNtCS0cIsBiuP9aWdSn+6KgtAvQ5UrE5y4Bc6b
	 xqVcbjeqAeewvzAjvr8JpkpSFkG+NmJbqnCA7VG719SSyJXOj37uejGaL6/niE24Z77x8
	 92HGy6XZB6c4ITegdZVs5TEUdAH4evMxa4L7f0NZl+970ecySUVq/nGoj/o0R5dAeyvj+
	 vuo0nwvSoWjOyBNetD/Teau03ZyZwuzy5/WqENgxfcckMrYdGSwRqTtiEiK3d2k5MvXWM
	 aQlRGqPzS5roTr+UVwP/2erOWtKOPNTnbDgCb91QBJ4dPSvLZNHCBVKEkJYzxQETlmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E17606EEA0
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E17606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3YSD3194146
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=; b=f2Xx8w7s3yMUKtuF
	IvYhi2RQTzagLYMaqzVa2WnLKnzbYJ+pCUvBQL0UeSziQmcEp+dEWf3WIdDPiumV
	9itzRHLAZNA7wcenN9XD7YcLQMKznGih+FvNUILXUfvXyczJzrOVbnGNC4F7660W
	ugKDI7WSMZIiFcyEtQdbvv6P/FDd/DCLIZMhsNqsGzgg47bqPF7hUx+3DhGeaq2w
	R5AMfiTNc7WaeDafHP86mLPEPUfBwDFoaGHaAoflCelulEtSsFObBk7qMrlc3die
	mqvE6fIgqHyiQcJMx9SD+S+tvnIh8LgaFf0l8LtXxPpwo4BaYVf0aktPeLqTpkx4
	K95S4Q==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrgpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:08:03 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b18d691d54so32961017b3.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884083; x=1794488883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=bB+dvqV2NXnlZvco1aHuMzn57IqQ8KQ7XxASNn+6tLDbeDmzwIfyPz18pYwddOWH6Y
         1gFXfmpxJQalVLejXhVmuNhmeebz3VrQaNSpdwQylOKYHQPigOPkViwq/4rE7Ab64995
         IwjDNxim2seUyYzHZFjs/nhbS9I0QukaA4+AklE9dMvnOXqd8s5f6c26sdQ46crDxzCc
         EtySKfdsDnNGYHr4nmEEpb8isCRzB4Za3cLDrZ6G2OmFpLFlojyWUCIqbWMhag/kM5uZ
         FcFktBXMhsq2M35/9JZMRVSqm7SPqYWVQsgEyEQOk3olaVEW7kradsrJIG0u2DoJ0XHc
         ERTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884083; x=1794488883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=lwFklx3cM5KzftXP0loXNF+XpVKFM/nTHx/exNQT95gQnMWNWuZmaFgZZgRAqnNHQY
         xhvsT5mukSwkY6H/wq5TH7BOfyn6SVC0bjhJ9nMxvOhFB0TTURxQPEAIHIqkL04yH92H
         j8lTrkNKw7f/3kEMKSSRbsgJCEHxGjdS1mTEzhhqjxCuonIMCBtMgvsj+n4Op9Zf5cgX
         jMh1o7/VNl9mHZU/EW96fRSrj8Pgqg5ya6J0JEVyuwwEMREN8b734tMrVTbWwSbHymOx
         JaXou27CqmR87/LjE/Knlz5XlqcsExQx9tgwgpgHzSGz2NvJ+5glJlNygKEDBZ5n/PqZ
         /QMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLqX+iu2Fm/KSh90aoslsOcKVUNo+7A4pjlOP0d9sokvBiRespBsLKxR1Gd7qL0MKydpaOAQn8UjQ/@vger.kernel.org
X-Gm-Message-State: APuU4Z9l8M46gMkZsGpAega7MlP7C6i3C1GipnMp3hE5e6q/NoHagYV/
	dF93BDbpA2Md0qdL1S17wN1D8TJQxyKrEFV2sqRPvOwDTX17MAB+4GAkQZygYtA52MPqjhHzzDW
	VG0JWytJ5orPxQg/xjctydirK14wF55SxVZxaFhDKRVgkl8SpldlYX7zjiA6ZdYBj
X-Gm-Gg: AYBFou07foPW91zFHjFKZWH+E0W3h5mdDENkVYJeqy9ZipnhOCtwMKnw+4mCiHeX7Bs
	+T54Bq+5GCk7pF1eA3Z4hrUZ3i5lgSnk6thcirEcrDNI6UJ3f4nQ60iY+q7x4UVYcc70qUZ5a+Q
	TQKI/tKtmte4C+Kd9hj7o23pfZ2OR9Z+9YLDGIfFYXWBc6eUNx4l3xtDS9wCMJDr29wUBKjy4QW
	aL4NG+f4/EW0387VKj7dyKwRhRHrBfltEa9o6z20laxy/cWzmLDMnznyiYvpC8R9kuIKTpnPn5V
	53qTh+OwloDdjm7X3UZtwa2CW+c9PdozVMGe4S09y6D1X+u1afX+Y1Y5j7k3LFUn/AMxJrj2iEe
	Feua36JVRb0BEtSEDabRv1+nqXQlg0YOc9T4rWaA4Kakza6DEGxv0kIbvdHyV5raBCdDvXgnpwZ
	kqoEYx88yK3y4lOveg
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712610d50.68.1793884083007;
        Thu, 05 Nov 2026 05:08:03 -0800 (PST)
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712590d50.68.1793884082464;
        Thu, 05 Nov 2026 05:08:02 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:01 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:15 -0800
Subject: [PATCH 4/5] arm64: dts: qcom: Update IPQ5210 xo_board to use fixed
 factor clock
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-4-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=1379;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5TarJGRML2ryvcb/ClCF+1MotlwLtOVZ//s8pIACGiY=;
 b=3mqRC4X34pzKkW88rrjp6qxCP7hp3Ti8ZBVcdSCHjWbioQuMLytsd7ZQFXH9LJDd254AKeU1X
 UORE1rhCVcsCm8iT4fKvmQPNiXsSy4KDI90CKFvid0gAkha3KqfZvpp
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec7fb4 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oqiXH2A-fwTjus5yMdMA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: IvU28ytOCgLyfZPiWuvGuTHsAqK062tN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX4Fc1g3unANtj
 65BPV9FOPrtzyOh/ivfDkuLA6b8UTnQu8zwVpGzuVBupVCmx0lUPwsmxOeDdn7xvMWpwxqPnFwM
 qk8VT78u9+ppi39IpMlWRY8AAyz6JBk=
X-Proofpoint-GUID: IvU28ytOCgLyfZPiWuvGuTHsAqK062tN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX/4fNQbvS0ebZ
 DmJ+ulBAnwAaBd3CxLq7ac0fUzb7B9wi4mnD4stb4KT4Ky2Fkd+H+aRaLg/4gY+mdg1jNW0zT8C
 1j5fDCrhImokw2v3j8Z98h60m/3S7UEKUf7pgTCRwMEpzZf+ef6RaUeDVI0TPsfSep351SD00ya
 aYiZrZ1jRcIisWAIulKsUbyD++QZrzgI/g4F1RD7N0D545iK2j7Pgc5NYbpKYaGm7+6AdR7MZWR
 QCO1hUWT6hfMbufzZCb4QqFc+8ZrL2gndy8+YN5BBqb48WcCnSOzjPmmPV263CCox1NcuVAw8Lw
 4v8QJrH2w7A4lMad4ri533sWzY5PP7N6CS5i4FHTRMy32gdfqNIn/ut5n0xtnGw2WHWmSTSi4gz
 tKPb/KA4ShaiM32Y2NdfAZoPA4btbAe3xbLy0jZDtVL8aVtMs8z2Iz2idctX9w6eYRhMbDtP50P
 p0uUn+weZq7KeJukujA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

xo_board is fixed to 24 MHz, which is routed from WiFi output clock
48 MHz (also being the reference clock of CMN PLL) divided 2 by analog
block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 61a53361138b..519307c6b61e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 52d851a0dc2b..0c1ede0f73b2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

