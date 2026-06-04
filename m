Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD80B48AE10
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590156; cv=none; b=rOkJt97PJZuZOdcRSXA3JaiCviRLmX4pbmD77L+NBaM8+TeshrtGQqFY2sK0yirHDnrfCKvvD0f1X2TGOtuaHM3FRZIIz4r+ei05ZBv06SWLXpdgfa5JqduptE8Y6B1ka9iH2uTNz+WptJ0bmnuaubnSKSJbXPmmHL58c5/rAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590156; c=relaxed/simple;
	bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZ9d2l0ugfFmq29yTkA7cp5ffJcLoSxDd52U3g9d6Dg5hAarXam37TKh6gJHilOthIosWlqOY/oqevYn3lB5t9eySIO2yCDfe9WKJNGwzmN7ur9nthI6NgZ3Y52RosnSonQb/6WUwjqpdl+cvx+P3aLh7ghctUGdvEsXAj6WPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/2s9QTB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFqJRNNq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/2s9QTB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFqJRNNq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EB56N598076
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 16:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=; b=h/2s9QTBH1KDJOPb
	s3Pnj45qUf4ulrCdQETtUEalncY2iwnYA7r6x8RVGrp7LoSL0KjOeZwhbQppSRQO
	mn52Tsr3HPlJgtKGQtBLNqpflxwjaM2sqjJaSdr1xxTnqW29mSv6+tafwyrL7mki
	+ouiyWxmvmZMMrKV1ujHto/cdhfyZb2EzfHGM8Lyx1orxR5dRgEBvHEiqHOi2nA+
	ESsimG2j6niz7EuFFjkXafxx7nP5uM6xMItISUY9MLyLR+pqDaaZKdqCqXiMbX+b
	1V60JtXllc7PE/+kdy3pqCrqdzaHsrYavwpGHFSxq25DorPdcZdqel6SxhgWO26H
	GYGCOQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m3eqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 16:22:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd441619aso446203137.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590152; x=1781194952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=FFqJRNNqZ8A1Pnjw3h+6K46JUyutLUQCB7AxGfDRQy+6HWOqLynybOUMo1cjxSRg8X
         rJOpsgjz4X1wY9GHGvfW6+HM/K0yBdZi97zTpXTeqYzG+TakBYLjIVe7rh5Gj6EjQPit
         9RqErhLWCoNs2PJjSum5DX57s2IEz2FLCPX+2GTlnTTdSW4vVL55wmLTtAqp1po9Wq04
         LeV8uDnrP5Z+QBTC83ons/xvQmex3vdS6OFVoYEnaJ8WuxSZ3Dx+6GAHzBetDajodeCz
         FkDTPYwO7pkmzNLVtChqdi5JYNn+/5SoN8MvCfPNMUgGphfzgJRp6KAEDqz0sjbcGSE0
         xWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590152; x=1781194952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=X56If9tp9mSrgpT975vjEcDd8xqWA23zPs7d4CDXUtEGqNB3NrSPNmBfoTqDOPD/SZ
         niwfuPo3kbP1xLFksfafhq56lfEymucf+/JRHdRoKifWJYpyX7wae/3NKDB639uwLiyE
         CiemHY6suXIAreJ/b6QSBOyYcJQ45xVx25LiLPTpcHt0h5pvcI8wVZgU7M/UZFnGB5dW
         5E0ReuByD65rNlEzCzSEawGjjhIw5JESB4lp8JDRDwDbJYEGA/xqOvjaD1GTcWH9YZQd
         Bk1Wbj7bmHcUFXiFM3/sHj97ykMr+Mtc1vWrLs/ArSPvJlYMUUWtzKRKBniuMISU71J2
         8XdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FCyK5aKJmbOgM3QrkR4inVrRRGCH1Hu/joMYkE8QhpmHYuMkBrEwiVO/XVSliZCDz+64jYd5rgNUL@vger.kernel.org
X-Gm-Message-State: AOJu0YwSscqcjJKk/00DZWN1tghPFfU7bj3Q2dRwUin5Xoxh4FEEop8+
	WQsfRYQzhDiezf9kVjAsPJkOnPpYVNBNgC86ykOkoUTbkXMwmwPaoEU17oJdNWfgwL/PQUXJxMA
	wQFPMSKI3bqHXitkd+RtWpsNUtMZnfXXTo2uykcwKz2dfblhhdrKDt146LfsflgE0
X-Gm-Gg: Acq92OEO/18EdxcGVoeRNhz+TfC2p6ae9//LkAm6qpys36TMsZaLQB6m+JFHItMBkx5
	Jrb5z/zh8IxF0d7QQQLqo4jY4maWrbR4JP4dJAK+5dYEY5o4w61W8asq6pixU566b+S0rEd/QcR
	YxPXljXtdgdnfIt7mMuJJ03exSTMk7vJQD6GGyrI1AlA8Dwap+q6PRZTi01FhFRuUPMHNODj2+M
	wIbomHIjwxm+Lk9hutK2Sjon5hYsEzqDUBoZRK22aV44sPdhy9QQ65vF4IFbcojK646dtsSlOg9
	kb7jEhAftvxKOqRHid1zB3nc6KVEGWy+6aTwmAP34klcdtAXlk5p8wNHMQWQV0yCMOghrEmnjjC
	ZSyznGCskuDqGsu2dfENXyZ6xV02AkurNielfJO7hCOqW2l3S+4qraSwCF1dBVlZMgvecMx6/VQ
	nS7Oikluv7p7AJHDptrKskz0qifVgaB2Ozlp+bUxMSiTZ01Q==
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5261859137.6.1780590151656;
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5261811137.6.1780590151171;
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm17591591fa.29.2026.06.04.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:22:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 19:22:23 +0300
Subject: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqIaZBK6EmOt15zGsa7CbGu/21Vfd8Op5b+pOY7
 lguo+qKNTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiGmQQAKCRCLPIo+Aiko
 1TcMB/wMY2JZA6XcGclZFriqAELGFsj0qR+EpLlX4rJwIi2GQIs7nGYmJPmIJcCCHQ0GHDcaYiD
 GaCpQRA60Ayvm7gfASpec456uvD+ujDD3mAdR8CKJwHwoDf582I+Q0Gqu9QmlKeZOi/8W9FQ/Tq
 vhLFq0rFXj05Rv0QxC5750kS8ug7YJPFWvDmiFC/oNsKScZGW00E4Xc9V6X3ygIIwt7h2SGCfWE
 LCOLrFq3OAmYEgsSyQqzcOSGXT8tTUo8n4dn64LeeUWQUSNmbo87g4IreUZR90rnWmkjglNsfzX
 RyRJGkkoglNtBb47m+jMZEJ9R97Gh5E52s7YNZy7qCahce7o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a21a648 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE2MCBTYWx0ZWRfX0SdzK5Eh7In0
 IyBFtnv06bwsGzUN4Lkc1zXyyjYHY+zfXF9dCex/I2ExPYXL+5Q2t86fSeu8JrAzWmijyUxWtN1
 aa9BgZVy5aJ0Nytb/7cUNYH5LMUy6B8hs5mskrxiJFZc12VNQDy0mX792b0EBzf6Nf9CACuCb/7
 E5Xe8BCno168Nwr/9N2SWHLI3iDmfe8jvi8axwguwU1uOET1NjXIcJkUkXDNibLyxvwiZC8RzBb
 x4SoFyyfwss2XrJiM39h+u9EvBIHOeCSUZ16AVsfQlszGPwwQO0D2KWfYSgzJoyfLL14iYrmvzg
 ABgcOJvUkyOMJlbVMlsvtzktRhJtUy7sSg2F2MSdLOVFWP80r7JJYFL0z6bs+QkSemA7HscQTAI
 gdMfDX2rb39Flu0fztMjpsqoWq3Ppq520Qkf3uwR0fKb4gz6fMfcMe8YWFJz859JgoLV3D6PY0X
 ZzKFxW964UZzjh7Lp3g==
X-Proofpoint-GUID: BYa1jqiZc9apVWCaVSvRqKuOsMIFRRg9
X-Proofpoint-ORIG-GUID: BYa1jqiZc9apVWCaVSvRqKuOsMIFRRg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040160

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
MMCX voltage levels.

Add MMCX domain to the Iris device node.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..6150380795b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3

