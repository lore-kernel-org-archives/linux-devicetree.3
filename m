Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A97E3A2E0C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786652; cv=none; b=ctwfYkgAZi3BqwE+FaTGhsOoF0BHv71EM9+KOyQmv5wDK9WC3VyWJm+sp0YsDPjul3ElKdAbt7+eIJFfMagYkoDth0uzFChBxzGlGpZ03RTy8WTm+ER+IB55ZZf+EvKc6itFL3pYLCeAp5R037/F0OHXV2MBNX06cGCCPCnoFxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786652; c=relaxed/simple;
	bh=070Xbb2yH7rviMxEVsDp0aqueE1Kr933aUlYRRWqT0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0pEECZ2/PiAPXmw9cunQcnqFb2ali4Egat3n0X3hT0j69t4Qo23ZKLT7FBumjvHpZmdhySWmektvfP145U3DaFzO+VNqJyXQCKCsMRat/dFECEeRj7jnzi+llrqzalSENmsA1EL8eHxEN/+h5adcKZEz7jjCbZvpMdm8EJiWNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8O3Zt+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqD8A2pS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8O3Zt+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqD8A2pS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpdMb2676215
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XBdCprBquhJT6uJVe5HV6Os2DLU+NPDukg1/CpLMV1I=; b=C8O3Zt+uhCIKom6L
	Dnlt6RMMVI6HUw4Q9tvyfpxUDrQxsH7C3rgbM+HyZ5Bq/0odZlUIQVrYpJQDe25k
	QCP4Fj+VLw5P6lZ4sLMolh570FU+WWcmL2ty0BNu4kNAf9+o4oedEY0vEnzdMyj+
	mVmeJDKkZ5TI91bJ6cFdsUtSIjIPwY+/4Amt/Tx22kShnMh18+9UgfsRCJhuKoZQ
	9kHUoZTQrzUqQ05ol+cvQ3sY3jwzqAlCp3oahPgR9llDLCWtA0dHU0dfz0b7zMNf
	JtvYnnSnUUcloLWvgswnhMKysVj95Yv0flxBcDv+OFj3fRDSrhP8AG5dzxYAxPvF
	rsS47Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vr3kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:24:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babc42244aso154259075ad.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778786650; x=1779391450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBdCprBquhJT6uJVe5HV6Os2DLU+NPDukg1/CpLMV1I=;
        b=hqD8A2pSvLstggTsiQtNdx4UtL9QHxsh32vqtrEkAHDFLZHCmojOSSptsjZ1KX/Vtj
         l9713+xeq5YFyVgxEIpOfRldfHwebBXzsD8PheBUrLDbrGCRb0LV68ywb60LM2x+Wv93
         SOq2KP7NeXerqfxoZTa2RepqgNBZTd6e4ZB2TK+cguhkPnq8Ojd6m5BoTr3oKOhC+XmW
         7+gbULq36ymSdWRouWZPkjBvaalMQGqH05l+qYggrXwfIfZz99CDckNJf6q/gREV9Nuo
         RW/udUWzL52wpgjWKvnKq4yCm27U0wWC4LR2D1WkOMOzsJJ7xW35UeJxyDjAF16PJCDi
         1U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778786650; x=1779391450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XBdCprBquhJT6uJVe5HV6Os2DLU+NPDukg1/CpLMV1I=;
        b=BC/em9HU7iVJLLaj01DcrWcpoA/5JM0qIWWRWMBKKKl9QU9N5rg6cCDT1VZgTdVSL8
         3beson2lgFTeeLq2OBLthsG8iqmFBrvyCAqD3eRjOVtt2jjevjWDUyTjSrVX8NK10FzJ
         Ncdz2e1mU/in7Hp8WQ+SM7bIxa5kTczQSlgtHhOac2UDyN3CQzH7qSP8P91t9csFI7+Q
         hdY9oFQLrWQW7gqQFPf2fzzRyY97kiwzviTXD8CySMZgNMQoxJiMRdz0+mhiUQUo8Zw/
         JyimkwR2ByccE9XBsTJ9wYHIuZcwSRNa2DvSieONw81Hq+4qIC0FsUpzOZOTuGP/b+EF
         JXlg==
X-Forwarded-Encrypted: i=1; AFNElJ/kOIbULMfglHkOZMDt9eNZR3SjKmaSCMSVlF02eQcAUE+H5Aswq5mRLC6Qw+21M3xQ2TyVZEEyDXQG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1cXGB6u+hfCy67TW4VWzUhk65iZ7dlS2+UiHzmSvrsg78wco
	U0/8vKGn+xPbMCLoQUSR5c3HxONV4AGoVCPW5JwFWI3AfhEDjQzHE2nj2ItrX2b4QA5ZWWwZNQj
	PrRwKQElNyaqmHGnCBa2uBRWgvLQrW7aCcXnOx+xjXHbMVqlszZg1X9Mb7PMzXTzK
X-Gm-Gg: Acq92OHiPR4ARFK51oNfbFdAHdIEr29zVYVxclk9ERmIReyonKjY6z23US02hn4DJDq
	LNdSkKMjYGb2fRAsBz+ZRpKL7GOgPuHH8Qkd3fMqyp9qWZtC/V7YnxCP5BQa/DR8vuAFK5m1dlT
	+94YtCLpQUpAWjwTuH12zrDQqKuZ1+vx93KQjmEaNRu63XDK0DfjPhEYH5PYcXwIEVJbtdfYSCC
	XAWQDg17jtXSTU9SRg+krxCjDFwe6r3TP1HJf6uIOzxd4ieyF3asZXt5RN6fn1PGxVBECxHR97d
	xaO7JfHFR1PCNB3cmUYoKMZ5LBqmoNeG4GfFigtTjCDSpGQbT531DOxyXntpr/xhfa5DD77BuP/
	WISKO7VxRek1dbPMQEAXPp/M43lhVwAABoIb8vGpwqnHqbF75vQhULrk3Bopc5DAH/w==
X-Received: by 2002:a17:902:a618:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2bd7e9399f5mr6818455ad.35.1778786650128;
        Thu, 14 May 2026 12:24:10 -0700 (PDT)
X-Received: by 2002:a17:902:a618:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2bd7e9399f5mr6818225ad.35.1778786649681;
        Thu, 14 May 2026 12:24:09 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f291sm35506535ad.15.2026.05.14.12.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:24:09 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 00:53:38 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06215a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fM5HeO57NUmuB1IZ8XwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE5MyBTYWx0ZWRfX7qtFWLUsZXM2
 nMkjs2LvvWfHNZPiXU9+WljN1nfpZ3Ui0IQknxbAS15K8Re8Y0iDm3vSqSp5bSkH16YEPfgmAWH
 mfGaXhUul/5j1MtFJXxkfxq/zUGgiaCnPvglIOSkp/9KO9ah3kauewq+D9Ey1/wEFn/tSwGdTyp
 /5UpGpFm6RZQrSqy1nChKYKSp/PUIjGHax9VZRQQxu1hsoZBClES65GwFD2arHLOW17Knm4z7fq
 MCrg/D+JvhtOZ2hGgEYDQcfYXcopNBSah4NmDaNLsWfBOV0DJcqI1N4TWZbJhAkoV7Pc5wgA6jP
 YGjcd4M3B+pC2rxOXG1JMan+MuZymt5KAG8jZ3MjZHLkmI7UZOkYL9X/cu4zNyIvXJ1s1Pb/Qe4
 zhTy16VAfDyGH8Jht+UPVuyQkMErloOmVqUhyp580I+sfWluubCjphjyW50F6yFbn7LO34zhkBx
 dtfNTX5ptoOgf2tfp0A==
X-Proofpoint-ORIG-GUID: 1OjZ0MznztL12lujFXWitd4LiEFQvwl9
X-Proofpoint-GUID: 1OjZ0MznztL12lujFXWitd4LiEFQvwl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140193

Add qcrypto and cryptobam support for shikra target.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 262c488add1e..dbac0e901d6e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -541,6 +541,41 @@ config_noc: interconnect@1900000 {
 			#interconnect-cells = <2>;
 		};
 
+		cryptobam: dma-controller@1b04000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01b04000 0x0 0x24000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x84 0x0011>,
+				 <&apps_smmu 0x86 0x0011>,
+				 <&apps_smmu 0x92 0x0>,
+				 <&apps_smmu 0x94 0x0011>,
+				 <&apps_smmu 0x96 0x0011>,
+				 <&apps_smmu 0x98 0x0001>,
+				 <&apps_smmu 0x9F 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <16>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x84 0x0011>,
+				 <&apps_smmu 0x86 0x0011>,
+				 <&apps_smmu 0x92 0x0>,
+				 <&apps_smmu 0x94 0x0011>,
+				 <&apps_smmu 0x96 0x0011>,
+				 <&apps_smmu 0x98 0x0001>,
+				 <&apps_smmu 0x9F 0x0>;
+			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
+					 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "memory";
+		};
+
 		qfprom: efuse@1b44000 {
 			compatible = "qcom,shikra-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b44000 0x0 0x3000>;

-- 
2.34.1

