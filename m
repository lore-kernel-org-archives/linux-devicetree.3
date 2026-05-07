Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A93FCB31
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163191; cv=none; b=JxVWTTWgXB+QXbK9avuEC58PDDFxbPfgucyYwmDkRBUSU+Ev8Y41/qTvW0wTmYKrGR8+6Hha38+fjmjWLZd0rQjBK8SKvLMkrNAhZMYndVH4pDmnn0k4LziYWWT/XJrCpFXu48NmT8Fxm8Y5tIyuuUUtidQiGKUkizYn7AfVZPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163191; c=relaxed/simple;
	bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0XNtSx4cc6haRp/nqpYOR0OxMBZKbdarQMIuwiQU1JRVrskNlNfOPlr55XdMY4UVD6XU/TFdDFWm3IFZEOTCIcIKNeRGvZX8ugwtueH4QaNi7cePSFD9kCWEEjH4rSfAKk3c0RtiboIlKBbkOnLAUXQ4euCYhBAu0RquTEXhxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obji58Nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/+Ktn1x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obji58Nu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/+Ktn1x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479N4cw3464902
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 14:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=obji58Nu5Gqj7unu
	WszKTUNm+LSt7bdUl9WT176axS+Cx/oD0+1xmjSpd4pwd3Pn9PZhtjhGOFrV+zvj
	SwaCSHKGJD7NifcMNmOirpG6zovXl5econsK0Sj6aiJJybAp4QN49G7FtSR6tAKk
	M/1nsn9SGrGNSHQfKfr8H5psRxu9SZtTbBVHd1p9MZdqHmHmmSx1MQ2YRDa05Dsg
	/0MliZllnnoW1OMiTz7DD9AKFFf1zU06+iOs6R63eA8dT9goccItGRtxoPTIATeT
	O6DwrBuBSoshspgE/nYtH2R31ypBf6QSpEDWWCEYJ7pgxZcZnJUvFPNMf+naxmKR
	S1uLqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2erk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 14:13:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c797efdaa9cso465569a12.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163189; x=1778767989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=L/+Ktn1xKN2DBlzrq9XHS/H0+FJDLnerp16WzJuBhKeLgSh37zDN8QsaTbA5pbvZIm
         GSuhNeaIi/bvIKxTZ/BqJl8YVOLAw1eVc2aB3S2ASPM8xBV20TfE/TD4MnJ1WXkXs4E8
         uXwPhYcgmYiWStfaKk1GoP3pMyO88Rps+wRsvTltppojvakB6q8kuFW9H6H0OyhnTFkt
         +pkuBcHPZVl7PE4O5N0vowJgvEKHOLTBjama+93WScYNlS0SwJKYd6iaxbKtbWizh+rw
         cLidj/jN+2y94I3S6NQDzlQRT4n+WvtDoPklVly4B3K1N23caJWOFV3WzIeVqZcALK0P
         NKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163189; x=1778767989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=XaUqnV5jUNF/OMOeVvozvsc3BjVu+QEjaD7l20tPYghGFsgZSl0kZVQ81brb2aRPd1
         nWINOTjqsKvzrqMPHPBAYWYc3fFaKFOWjF3jll42x+u+pAz7Sdds9050/iZCMH/agTcG
         sjaUf8is5TE/IAZHf+YJJJlTLcW4oiZgMbUJ8WuwkGVMlk04IyIow87QlwIywxyaPLzg
         NJrVaGOt0uR3S35RJSswaQ2mjnq2aFfhC0eblFp0LiAicTRPKn147XXH8oDRGNQfibp8
         rx/l3zRNDnO3Vp0prRIIDb50J1gUlvA7hyL+P2PnPdIJP8zWflUVqhRizbFxOSQvWnJv
         +Wag==
X-Forwarded-Encrypted: i=1; AFNElJ8pm1evVxKasM4vXdnByLbzUr4qnvnhREEE7tsyQx1WN8TCniteKzb9jWGS9JYX2ky3LK9vV+5C8uP/@vger.kernel.org
X-Gm-Message-State: AOJu0YzDifUNGrCSuvuKdiw3lH23S5WlnRAFZ0hnfbfnfYyDcQZrVxMs
	PLekLEuaT6f6UWhxBIqzORXgK7H/09Pix0wqYZ7UBuDGVP50cqjY+h2Fril9f3FXiU49y46/o4v
	hvVTP7JngOEr0ZdsjpsDLqGWW2gcfe1LmXHDTbqkwHJRYVrBuzt2GkzhfcQ6X/xUW
X-Gm-Gg: AeBDievF7/ztwmy+y4vDqW16fTrXz5Ymj0895SvwsgB++aRHGIzbxBiLs5e4I/M6NwH
	IYpgallEzYN/lmof9zw2bLtbH3q8Sd5WWR1dXEltCL0uDW1au6WNdIvzpegNZCq1VjX/shUiYXR
	T3qNm9vI9VejqDjzguKa/wPWQp7ixtEgiVoOH7E/chBoku4WtBOqdEB7fVnGce6WXpYvHdNXEhz
	SLh1DeRIu4b+4+QSYRUERJiMiLcgKeIKCFcDD5lVV8bQJASEZb4xq4/yB/rl29dQlEcghCybxGU
	Bra6QpMxQOns/0KJg4XPxH/n/g+34vx32+8v9i3D6Xx6oo2jmybZunBIe36V58JJzMRaW/GdtyE
	Gq0uGRKwSqHSZ2GttcvAP3oTJIDvW4HNcN3Jmlvq1k69/N6poWBzP8Vz9/9aNyrl/EGiXyPeIAR
	dgSq8QE0D+sMtgWJdiUc0=
X-Received: by 2002:a05:6a20:1591:b0:34f:14d6:15f5 with SMTP id adf61e73a8af0-3aa5a934e9cmr9687591637.29.1778163188788;
        Thu, 07 May 2026 07:13:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:1591:b0:34f:14d6:15f5 with SMTP id adf61e73a8af0-3aa5a934e9cmr9687531637.29.1778163188196;
        Thu, 07 May 2026 07:13:08 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:13:07 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:03 +0800
Subject: [PATCH v18 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-7-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163147; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
 b=sdUjel/sDCFE86TLQatL135VVmhF1NPENX06ZBgfvs2tIhWEvaoHw5CuGwyXPqG1yiqTdbiLh
 /Flw6geY9VtD44J9V2RyI33NtrFE1YU/yPggQvfsQsNwzrZmJDejfn/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX1h/BlaoiCO+N
 GdE9PnPeDmXrgpgQ2YEvg+2ZB8thTKHB3/vKnmyUMG81azbdkOxa3Q/weLBbUl/xlcwyVY+FYmc
 1EuW3ZmU8HonpDsHxGt7ZQMBgSt+K23yUPuVE3XPMbCiggi39fj7UtmahYXTLCAqgotJNmzeLPR
 x7YYL3CMgrkU+5i5grpSUeS8Jq4omJHG26XmoGY0ONnvEkU2kY60Kbth2T2gDNZZ4X79eU27hJC
 X8Drg5/y/k/HnWoEbvMfE2v2mCiAdZA78s/EM3IqeUcre2YxOuFeGzxk2WTL8X93655xOiL+s30
 KH1qhufoLS5D5zoDbmwuZCTl9VDG/z4caD04eXJZwpVh4W1BDEkGjPF4aVxGE6KClZFhlihOiL5
 HtoS4hKwnJWJGcNAQPTXGcxRLnkcgNraA9j4XB3KxGWE7FqZ/F+Dj//OgFXatPyAvEaPSd94DHh
 akfYIrimx67dmmSNLUg==
X-Proofpoint-ORIG-GUID: JBoP4pYCyVttWrzs5QkhoLbXBYLkVD7A
X-Proofpoint-GUID: JBoP4pYCyVttWrzs5QkhoLbXBYLkVD7A
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc9df5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..2cc855ec9759 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

