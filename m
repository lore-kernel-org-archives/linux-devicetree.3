Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044E38D3F2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120561; cv=none; b=rWCqdM/GMWM2Lpnb5m/5X7oTTwWv3q3PwXhYgFyTlkMMtqhbxFb5uviJmrVLzsVQDmHPRdrO7ZZjDe0CXdeHCxPRbe2IUKvpLexC8yKTHH0WvwlP7MmPGWIcpW/UcGfJuxafims8N+DyR92usweszW7w0C3XyagzL+jyWg2Xj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120561; c=relaxed/simple;
	bh=l3hdS9oe9Ob+4L9fKQcTwy3SCLCh+xyP2FBqvgiDKM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQh1f7bE3QaV74kL3fBlwR7CykoFviqXj7OO3SVNl7BFTWuMO8lPwIN+eeQ7s6hiTwTp1m/Z6wgvX4I82q35JBeSXwnFXZaYkCmC7mgc6U4osOLGyR7mI6zCT8SV6Z6cKowgwM2urlJE18zcycIyEXffnspyAcYBwWJoWmbXJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tohd4Yxt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iz9hO/ns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tohd4Yxt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iz9hO/ns"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOjcg1225013
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 16:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+Xo/yZ5cGMlbYz002VO3p0ZTjgmFWg9wox9uQ63vQM=; b=Tohd4Yxth6neuGnz
	w31V+xTFArIbZEGGdN4jnsHFKxWrVvquuELTRpTTT3mUSSDGduNAU5zcQ/x4gW6N
	NcDWOo7wiiZYPmMx8Dya0Zuw6lXY1U10o9DoWOiHHqg0j8eDIGxvtGO4VETSc/2K
	6DchYFMTeWokQdfLSnfNpyRgXmo3SOAIrc+wdfrxq9ePYcQgblDlSP5XmYovOIhM
	mK5zAsg+Su+ZqUjPAuvW8O3gaQgnWFrFAtrzeU95zUynA8HzlTogkOLKrglqzDyM
	q9LEXn15m4U9932ScFRX+K/E0US8eKdIgPh7gQTiJyDYmNSZZtjSio5kyQUY0UCg
	iiDDHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgem8r0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 16:35:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so7798023a91.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120557; x=1786725357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+Xo/yZ5cGMlbYz002VO3p0ZTjgmFWg9wox9uQ63vQM=;
        b=Iz9hO/nstuFUwO8+l1bJ14Q7S/1yKvyQTgCBj3T94eSmQL1/aVhSy53Rnlfbafp9Bu
         2la1wxCC5tEiVn28fez19HKRdjWGiBJqn4VARxFHjqLtMH59jO0xxDno5OXni+YpIe3B
         GVjyom3OXcGByaTEopsX7OAp5KPcy+nYB8gorS2a8QPJZBqNV+D8/8fns6dUZ2QsxtZW
         hJyO2e0zEUb1CltJgjOSiB/cm97UQ6HBtgR2/ptdISrEQhWlWa9tcvay7k12hvp0booS
         7jXxt2Zj4nAxqzQJ5yWD3kcHr5WFuc4s4ynJdfoKMjpUblQpPe1QUW5/TeaJ2GGxBjIy
         CqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120557; x=1786725357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+Xo/yZ5cGMlbYz002VO3p0ZTjgmFWg9wox9uQ63vQM=;
        b=jK1ygl1HGxZilrPFM4LuVIEXecOSIhEkM9SBIblngpmSBbGccR9gBjDmYWUpmsom0h
         VC8FYC3+lQbsg3x7448xZiXWpVm+aJlgWBgvy51GaW5NqQD0oIfym0PV2oWRtVC25NpK
         P82r9n87Q8q2x63E+3N3qr0JobJMjzrBnn0iTb7BeA+f3lQkyi0/od/rd4lBt2Y95o51
         GaJ+XcTlD1Kmwpi6WSBrwOdCejiBQFk2cteZMNOWCGlvkPXXLhFpkyPiO774rgv9ufBy
         8TDl1mgODtSzBa9JLl2ilAFXQ2ZC+NMMG3jqtx/u37ncIw0MGZ6yVbopT9j8eUO1XmMm
         UflA==
X-Forwarded-Encrypted: i=1; AHgh+RrA58C2l+P/kOBVfyPnYybzK0RYgzK1KDCyXb1QHIuc9G3BX1WHUW9AB1Tcfiiu4zehIRbMrGdqhTEK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp6I7SQl7GBMmp1Pu6TiZgCx8XH3Z9zVbd4/w7v4vKzW0/Xa9M
	KUjllg11b3AO1Gq5qU8ufvYcTRpDY5INM63/1GWPnqnf9+uge/lBXe9Uhzb1/rA66BRVELTq9kB
	Uey54uRv2q3YcQx+twrJyK2ZNf4GYjKzWFJ0HqOhMYHhtj2LLfuv9lRSdzRZVfkTQ
X-Gm-Gg: AR+sD10+qiUwtRzsLxoXmYZKCFqng3IMu6O99SHO6OydncUr7xLQKQMfqhiXYOXGyaU
	RA8wrqG4Fgp6gx2jbhqEttp0xlOJMHvkTvweG8sLyC8W7AZ7h2ACA8i6267G/U25r7TE7Z2Xd1T
	kFg2VITcVR7E+LNQExkVoktB7lHOuiCh0mV3NeJP87GcRCkZEimgY2flaFUohhnWIRAMg332YF4
	GJJ3ai06mBUIzuMg7SO0hFmiRzeqafzM+7CmdT4B3gszJZQ0govMXcq5mjq8WBBB4BXWEGZUuUT
	UEm40+OIy5ZorL6eXc6qex9sFtQfRyIn3xQNXWHpLB9wQeD3JQT/Spv2vhL32P/kDI/kz3p2P1T
	P1toZ0ciZcC9i53Whfuxdlq/z7CEj19gCSNCHNM5saH1MF3JLPRWN1ZXAE+sYCSBpNjB1McPe2O
	9NLb2Eg8EUBPA=
X-Received: by 2002:a05:6a20:4322:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cbc01b4a9bmr5152108637.13.1786120556902;
        Fri, 07 Aug 2026 09:35:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:4322:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cbc01b4a9bmr5152063637.13.1786120556447;
        Fri, 07 Aug 2026 09:35:56 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm8918689eec.21.2026.08.07.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:35:56 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 22:05:33 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5332-rdp-common: Enable quad
 SPI mode for SPI-NAND
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-quad_dts-v2-3-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
In-Reply-To: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: oAwsaiUV-puHJI43KHn8UY9TG2vuR3iO
X-Proofpoint-GUID: oAwsaiUV-puHJI43KHn8UY9TG2vuR3iO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX+h+nM3rUIini
 9SVf/SIT711AwugJyd1A5fBbuuOhbKlvop8jiq4PenxYwFkF4uNRefOwX6vAgZIVLtP3u0V0SBl
 9COR1HMHVLvUOlAvS3SfnPluOGTETxk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX1g7FVzHPjHBa
 gMKVWBLzS14M/NkIoE3NcnIUQKXpx3HYsS6k/csHPVvnpcCqG7a1Lj8pRLisDa6Bilhp73kV7EM
 94H+0ks4jdPjnDtfSILVKWQvlrSAc5B8XMbM8I1d2GgsQrMVewTOiO1X0Q26WfoqMT8FLIR1jHy
 smjjN9up3h1wXQ8oQTKzJzLtwEGnPwfwmIWCnS1H3lKRS3Z57XNmcYYen1PFfR0rEvC3FoP5Hrp
 ixwGlmjmSLC/0MO5s+VLkEBiMjETViZYiJx4qitl+3a3tpa44qU7uCYIt+Uo7vj/rdftgRjSGy6
 fxIq+ma8I0e2AU9T03f+9HBvkuepyqUaK19EmKAl0offvOS00U1RgPxGJemqGsZEQiv9dvAA0FT
 KlrJKHNaoNRgbYrG1tsqopJCPRt4UuAELU6kgHOUrQogyl98N7IXxTL529/50X7jirf+FP3j8ny
 Ub4m0HGKjqAg7B4b9vw==
X-Authority-Analysis: v=2.4 cv=X9Ni7mTe c=1 sm=1 tr=0 ts=6a76096d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070129

The SPI-NAND device on the IPQ5332 RDP supports 4-bit data transfers, but
the device tree does not describe the bus width, so transfers use the
default single-bit mode.

Set spi-rx-bus-width and spi-tx-bus-width to 4 to enable quad read and
write transfers and improve SPI-NAND throughput.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 3bbf748f2e5c..6f5b193a204b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -141,5 +141,7 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };

-- 
2.34.1

