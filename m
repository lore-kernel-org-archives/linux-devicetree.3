Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF543DD871
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285275; cv=none; b=W+Jl3URDHR1ZXvLpgnVDhyyWgyjnwf+Iy5C0GlCDNJEnJrL8OhpnQO7Vd7ylgJxikJ8GSKcfs9YSFOf8yVeNJQvRyCbz7GbKjmCmO13LbmhpCW9yLU2C4/aWu95AmPylfh1gZ+NqfqRQAPD+BHoXpxdLbYOvv8VPRvNhyRQfoX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285275; c=relaxed/simple;
	bh=LeILGxNNuCl3rvco85tFddCKh+xq0b8htprcmhQk6dM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPA5slo3Fl1bTZDVqHQOlh26kRb7S6O3uSPjLsAmEa+xDq6hIi89TvqvOC1HSayJp6eqTUasTeepTxS+n1oZA+j47YrNXNAv3pQNhBuNr6H0kgORjEUtpTXZ4M4F9VjlkrWzRzJci1Okv95z/VJvLAMoLhO/6ga3S0NXF61Qomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncV56PEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bULSy98H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncV56PEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bULSy98H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARB5F3929294
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 11:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz/E96rURgpnPo6SCBCEY366VCla2pYAF++Upmd9DCU=; b=ncV56PEX6kTClBYV
	uN3pXCl5Dwl/yovMwAygsy0jZdiudx6QM57MzAwFL1DfbScAczMjOy3HjTtxEitq
	GxCEtzTt+B3JIJvNSjFP4vgDfBRMXAYTBTaGKhqcBWAg6BSSDe+BzSRjclf3lop4
	2gxy1TJwTREQjcLQGbcBlYYhhRQVRM3KibI9XXAlGMGxamt4mXeW4nHwUKsxlNPc
	2oDZLfq9Zbdecfk4iAtZQW93u3+Bqao8seJvtHzv12Sv1q3VqJaQXFpw201pM2jZ
	ZXQ2zu3mxzK+2tN46ptclrVxUh1XouxLfci96z8qIe43sTd3OzgYK0aCh3ydM7vt
	Sav65A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrrrvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 11:14:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df7bc60df6so17737565ad.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791285273; x=1791890073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz/E96rURgpnPo6SCBCEY366VCla2pYAF++Upmd9DCU=;
        b=bULSy98HeTeSYqUp5EXz6UcKAsxBLJuXJpwBtSM4U8H3g1GH5DtAMH3RirB3u2IGr8
         V+7Mi115J42NJe7NO3qPwM8wNRLglS4Cu6dGtXbSHKZE5VTn/xhdhpCH5pvHQY5A6437
         EAqMMtMwV/4NDOyZcxHxrFnNMdDCXMasq2tSvL1dxnCxr+wVSRsik5c4byTHBMqDYDYd
         IVi3KzY9OA7Afw2zxNA59Nve8K0U56kGzLSbYyuhSkv7ts6INfPO5m8zujjh+jv0gktx
         wj3kvc865Or/ti1ElHVHGkx8o2JeFAUWPYu0+L8r73cdDCnmMfEuEN5fJf6QvmFNY/S6
         4Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285273; x=1791890073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz/E96rURgpnPo6SCBCEY366VCla2pYAF++Upmd9DCU=;
        b=1mejgyxkyz+4FCfDeW2tDS9sb3S3XArJu+eGivQg8vKGaBpiASubF2BZRe+NHvmRi/
         x8nxu/hc2kONyo8vtY0ujvqsVTBNjyFceXhl3NwvPsy4/OuzwR9OcFbvFUUSBBfAJXbb
         nadiuYITB3+JUuNI/XiBbagoZ3AL96YBIuqo3HK0ri7rO6J1C4PzMzvS0cE5A4zpmqQh
         wLbJ4LtmaEHJFxSLi2OHP5YJi9MFZXahlcLLySaJJl1BDchivDR43M5sEp4/HlUjAoA7
         rX36GZn8bE/D8UnR/8kib4RHmJaq/JRHW2dy0wxQDwwrOsdNao7opKHiWtta2zEFIHJf
         26hg==
X-Forwarded-Encrypted: i=1; AKwUvBz+dmNTzcK7X69qBFlB5QDmHUO64xMtZo9lBKcbUAbp0Fw2EX1DnGdYOgtFUng6MsLTvgsbV05zwl+y@vger.kernel.org
X-Gm-Message-State: AFq9FYJvQBk45rT+gXDrhz5MmVX+V3PnVL6Rm1CTPZDNi8hbtLqPCftT
	zHK9exKRp25pX4OqyNW1G5Cr5NPcqHmXmOskcGvtXTsicYX3f1SvQ58c3+LbTWd5z8u+Sk3SkO1
	Ge279jzMFk9WrCjK5TZv119bnxjOHZzaPxNS67T8RQKFmiYFSm3U4g2hint2aQZhQ
X-Gm-Gg: AYBFou0QEsjnv3253iDo4q5A3hSBm7MBztY1JJzfFC2+jKNLVmhLrnpET4cRJLFxdLd
	vncQaTgpp9idlCml5d/SOnVxNYS+eqPsxVZLIzo4l2WHngzeJp7k5pUEOu1pdcM5uS8zoOM9kLp
	YKpDOtABlm0U8IoA9u7rMQDj3T+BBEG5G5pQKDL8/DT+OmsQAW7+Y1eMGgux2IRFAlI0TbZt6lb
	cyEJyLIYuuGWC/MKdBa6W75+ww+GFIQNPQv4tV1lKwt7NfAJVwOkzmFGj1n1tf8H3z0N5zeYexp
	6QGQIbja54/Ic0ho8O2RlkBOrBH9iKuAW3E/LpqrnXAsUS+ZS6Ginq9a+kmuQz0q9rhTIW/9Zed
	2qBrlByrHDjsAkCCFj/TmLHuTnM/rEF0FBg==
X-Received: by 2002:a17:90b:2804:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a8719cf12dmr763506a91.0.1791285272873;
        Tue, 06 Oct 2026 04:14:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a8719cf12dmr763486a91.0.1791285272195;
        Tue, 06 Oct 2026 04:14:32 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4306838a91.13.2026.10.06.04.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:14:31 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:44:04 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-shikra_qce_fix-v1-2-8ac54d81edb4@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
In-Reply-To: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4d819 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Oj_9Y9B9b6gWBUhzqToA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: mYvTz-T2KvA1nvoAFDzsgtJAz3k24avW
X-Proofpoint-ORIG-GUID: mYvTz-T2KvA1nvoAFDzsgtJAz3k24avW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfXxoxbtH31W6cH
 aU02c8EKn7ShcbjM2I8uAClLuWJyB1nbyvBHYuU+IVChV6xdn8QvdETr2n/GVw/TtFTT3XC7itD
 nMqguBbgYpfEtR3Q8BAE5SGlZAyTLkxvqzTvz5apDLeHePOn8RWFhagzM96Nl4Yj8r8XEUa9SEz
 rG5T9rY6n7t3XD8epznAxor2ReOtLvGOQTaywuWNEcHcqunqSZ1aviktATGZtTpNpne4Y8fXxaj
 WR5qS00P2bJyj5tcJUJpT2pVulvCU+lLq702xNoGMCmw6+/YbvXDwJR+/c2j4CVimQIgz5jA3kD
 HYUVNApE5qPp0UVDpLzAhxJy3nq9an3041wrsEkuu2KP1oTuaXY30bvv7/jHy7AL5AC3cMLiDde
 oLfv+X7qvvas4mz9UKfy77czA9JXlSqmbSH48JlrGW6ANyfmqsV3+3oR66KSAtzzBM9hCvwyrvs
 MTKhIdF2fzIdNXKll2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX3zgwd5T6IPMV
 F+p2dod0WWdZw1T1BSz/Mcx3fPh9ZVKoQsu5MBwdYSw/LvNRsc+7EyaGl6eYRDgcVv84Kdxdl/Q
 +c3DJ+/CmgEGfIfOJU+R3oQgKjBmOLY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060044

Shikra is derived from Agatti and uses the same QCE integration.
Update the QCE node to match the underlying hardware implementation by
adjusting the fallback compatible and related properties, including
clocks and clock-names.

Since cryptobam is marked qcom,controlled-remotely, its clocks are
managed remotely and hence don't specify explicitly.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 205e70ce0748..b20e4ce13d08 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1266,7 +1266,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1277,9 +1277,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

