Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253247126B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016647; cv=none; b=fYvX08G7I0beJp0cZ42jU0jBzkCR8Lm+FNo+7L1F4EAROcBwvFh9B7nmqbQ5JGTYff6k2xj3oBT92xmZfiaHZy8bEBNnlqmDZ7XkBTLsUmJLBRBeitOtPoltBhY8Nzij4Q/yAX0NODN5NaY79aSm/68kn4DxFRkJrabL3mvRPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016647; c=relaxed/simple;
	bh=BsfY/RscSrIjGVNJpro8koyU58IFtSj27D+QRreyTuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sQA1oAamp5LelVgbLlNfq9q0tOTrdZJISPzw8XiJBX5aOYQ5jOQxUUi1A7ReQO0Jt95A1SiBYOd316xhIdmpmaTuTA8Idcc/ZX8IaODH4Cu3VfbkR+bydfJCedhjnNf09VuNSoWrDeFfpeRgZIWCUjnxLyKngRXcQRfMAZZQ4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8I2/bok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/UOvKEO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8I2/bok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/UOvKEO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndX81580595
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 11:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=; b=X8I2/bokvg579Grg
	p6iuuu3t9iiXVg7qF/WMUz3MvGU4h7/kgvBGacekChzws2uwQu/EuzQ9VLy6G8UG
	fUvfcT67dtVpfKfM1NP5FvPf2cU4KBZOE/0uEBqluL0z+3gGiKpUz+/28qJBE7dl
	q5iLcsnFS+o1+fUhGvKHhvXveG32kJ0LSvx8GmV0OPK0sg1o9Nfl+ZU2xqdIgc31
	i4+V/tskd1n5JH8aACgNTBEtlY0lCS85c4U228t3G32cavEc/Rxg1RWyxHPE2+j6
	bXsGCFASl49rVwk+4yNxBoDT0Fd2gZqbwstf3h/fk/n51OZVUS5ZjbVe/ojZ9aMU
	/DwfgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjhexd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:44:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848860def2cso2493286b3a.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016644; x=1786621444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=X/UOvKEOVUrWpaCcXpJGIRnoDMQwjpmnQaX11XeMeWJN3TVHWSei7p47ECey9FZRf/
         0ZAsnR7nDZ4WEZIuUTNF91GujuRqwrOTBZsEQEBTc4JZHaRJe0+4xNnIvOpKzYr/PHIE
         Eu6+LjcyKTUEmQgcr9HO3nONJ/BdMjva6uoCLdOiDka5JOy7omtHn0iR4vz+FCZyuHBB
         iRFfpEojZgvSWUqOm211QmsgP2o7tttN+pA0WTGTlI/6VvoC+j/ywk0uVYFhS/l6sirJ
         yGkX5iSfDtBfBuxpvKoACPjZ1wkeRi2lEiYzy8O0eTgKKxrWdn7rxiVbeAMVu6MgNXjC
         4u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016644; x=1786621444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=gj2DnjSAPuFdpmRjJw5DmyAC8nys+uBg5lBBioSw/FjFCVfOg9i8ZSf+DV0LoS68Yt
         7BZ27oqaVPzXXXq3SKmrdt3v/HQ9YxxAW5JyQQWSNkrjAzvfjU1ACM865l2SMU6itDQU
         VEDy+eZQ2NvqRENNsKN6ujTH/TkbqTu/vKekV6RW2NDWVi/6VCxXy9isM5DNImqkMNTk
         5vCT4Cd69uTet+95KxbHEvgyEuGdrd6C8QKiuFF4o1j8AEgBkEKBSaR28R7hBUBqJWer
         efchRTtY6SYpE3TTLq2YP1FhufHpcxGAcqGMzE6tY3BbojozDlxUQ+PqmIdf9G0L58x1
         RcZg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt/HNfCRsRLOG189IH7nxqXLr37Bx69EVY0zfVIR5tCYHkh1xH0aHsONFdKnhTdicfL8xs6X+jTLXN@vger.kernel.org
X-Gm-Message-State: AOJu0YxhCmc3jBCy0HzSvsvpGqwHLNwuMZXoi7KsmL7/prEf+tvg4Cxt
	KxrhQ+Og8dmP8Sf7JOgNAYT0EDMoC932plztOmfs98Bzwrjw+/2OdJjpLOd2KZyvGY2enK+rThw
	/ljwpKmeVWZ/FdOOIorxDFDp618uKHZDw43qCC8gaYH4e3aV6H37yWpOba236+QfQ4li/TlI4
X-Gm-Gg: AR+sD11tUUarHCzd6cra//hTZCfIpQW5E1lKYE6oK+JA02vsc1MDOlSvnw9wNw2SwNE
	yvZ+Tfev9BV8n1Yr3jRW3/3/IM6F1xYIFbQZFwgEHL2Vcw6XcwfCuinW3C2qtbaZs/UEWVyfsbJ
	1UihWVc2h0muy+lDKnooVUrmKlzc4WRXBU6LmdiSvsYCj2n3qdxfVjKjV2iNqe0SKhPN0YYwtYM
	hOorID+wqmViu5C1hncoo1vdbm/pggMbY0iKv0oQrswrefEdegk6BZKAHpEiOX8LGAdn9M1zvOi
	al76AInR4OW7PuqoULyMf3T0qTXMgAaCa+Gi//CAWVtY7XQRE17g1EVFOuYFr00q6pe7xT5wf52
	kdPwXgUmro2CicvYQtvzX9n75mJbKyjI=
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15131056b3a.19.1786016643806;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15130998b3a.19.1786016643390;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:28 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-3-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BsfY/RscSrIjGVNJpro8koyU58IFtSj27D+QRreyTuE=;
 b=5iO8ro9F0y5HaNuqHqy2tlRv6TBHqL2SHdP2suiPVV+hF8RhV/0nGXdaOKPtwXGRmfsPDDos9
 UzjC301rQpYBgNf/2I7PodACkZnHELG4/yUPGlSJmdb+3CNA3S897gg
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a747384 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TZ3k_4O7xU26X20dZuJbPPyIvAJCbX9m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX/Xa5aQdfd93+
 DJdUrv/EtH1PC0vfsreaAyhNRMG30J1c3dHZREr4aUo8trwrJPlL27PUlVq3izwHsIXeB0anxLG
 mHav4Wjew+zCgM69BpfzbYvk/EWKORY=
X-Proofpoint-GUID: TZ3k_4O7xU26X20dZuJbPPyIvAJCbX9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfXycSCk/r5o3b3
 qCRjVZV67sF/+NaM1UwNX8nBGZj5ntewjf3ksVc8qfHTzfoNnPYoohpC7J+xdD0L5M+6IUq80qx
 MBgXjm895DcvfGOXVApW0iT/M7HhBoB5qPgfbrNHJpar35WzKRXpRQS2tQjbEA9mU5d0bieBiMa
 2J+ABwyT1RhMLNwVyzETH66uX088bwYiGErWzMcJQKBRu7hQfMFwQqVYtNfXo1TGvf0wbUpPhr5
 xOiBaBEnstpGiTywfdZ6dgkQ8WWYqPzhUIJsK99a8IEfFbRrkiHDkChqzV5arOAc9wkrD7RHA+F
 gDFT1UYjz8o8rwEPzcnzOchd+Ey4Z+zy9JQmOY9Sq4QeSCNGWt6BOu91E91GMDF8ZQlOdhF5ni4
 225h1mMMp7G6wjC8S0L1B/1DWxyqcd9MYdbCxGXHiwJjDJGan866PWKeRuLgvSjlxNf1Lps8BnD
 z6ka6QL9Cjhbjv26SdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ce5887b9b1d4a186fe967779b9615ab4e4727ff8..661eca4ba85eb83f776278a6750cb969a409c974 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -827,6 +827,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

