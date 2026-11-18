Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985424;
	b=qD886lK4ZGlpB0gHUd66zz3vtjOQE4/e4K6VGf0UwCb+6oGE7IIv4mMOmrx3324AP01L
	 6cSVOPADjXfY7zcHZGISpJvS+8X/w9sxpFNskQPhO7ocSm2y/3ePvHn8Jq202LHeaX4FF
	 qoMHy5XGc3UfvGZEn9RxawPDmw2eV9z2VRmgbsZ95Du+bunYNmg0WLGHR4pjvpKETTuM0
	 w9WqRB1MDa3HlzXX4cKfZGYjjtLXtzUyiWLFNDv1CPfl3tiNrD3Yk1Kg0jkdlM7FNn6GV
	 7VZzIFAwwBTmLMoIVbtBcDmWuudP9PnhOE+uGUqcxDMsUXvSCAvHmNMy9OLEDiQJ2XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
	b=IQ1MZ5hxgszZ+czE8cRh/NX6ivxoaOke98OYa0jSO2Pp8isc5GskRuLH+sukLSz0yFDs
	 Wzcwa03tpQWXbtbj9HyMLS9mRn+S4FjbFlz/z0UswZmDvVeNy4u6dDASyo2sLbeWAScVW
	 fNI44BY7DGQrKVPwC7wiqxnc33vVAusQJeH55PjQi4tsNLJUdgAvG4xsrrPGFYw9u5rAC
	 7fO0rBkmGJaglWms8Di8B+wCAjL1ftUZKdpPygqNtTyReu8mcgUOY6xD4RX398iy2uErY
	 q5LvRBkGTKA+VpnbKouWwIXvE6RqvLCFIZSA5cBwlfmrgKobgTBOERc5yXJ0L90/FVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7D9Lmcm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwiprkZ9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A4606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7A4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7D9Lmcm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwiprkZ9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V26j1959905
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=; b=M7D9LmcmZYgWQPgw
	lzaGvDEMnSK8MyXRuenmvC+N1qSxD8Eblbm4eZUniXHJQdsyfRP1c+PkaIj/pcmh
	BqFOnpYdGpOJLIBUnwHHpeWwETdmasXF/b8dSFOklMkESssztq9107G45pjyAEN5
	a7tvbdTyMct/cckYFjdqkYet1AFVpSD/omTmESm5uGOebLBCpFQQbhxJ6zTUDNIc
	qnC2/p50wj99CGj/aM+8MLyDreBwzXvH0ik6SNyqEC9tQe2kTRwaLYPlXhWreCUO
	H74sQrXAdG03I4bXCX/Xgws0xHQCqSEeLZ5o82AAbygEpmIolPTaehwWoQcDlhaJ
	2O07Eg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hphg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efda3bfec1so3742885ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985423; x=1795590223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
        b=JwiprkZ9V70ylD7A+7ZK6TfcX/zA7PwPAlSVpsCSSAHsnMWaltMl2mxHqjYpAsRLUb
         JOVY5UYPCB/1dNTY4+b//n/EYU636TB4sMjjhFOAVk7hp4rsApyyqpzo2yIfPUqnEtMy
         XxbOLPYH/GPfd1rCW9IUoVft2Lm3D9luf/wgguuvymRVh44fffP3ItHjmXvW+RVul7jo
         WlwVSGSZeIyQY+mtsUWOg7jsfhUuq2aWD1LB6WPiGs8hl6h8b1xcuvsdLeY4XRtynuEU
         I2EZGcLvjsUFGYp7IfrGHaOx4RyYmfN721ayHGgKWbg5kOAlg/6Dp5mLb7gRr3tjhS6c
         m3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985423; x=1795590223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
        b=g+4CGk5EAvMmVanwq9tm8rJaNzsujAZcYASfCXUaBZluVbzz1vvNKYLTDJayZnFeLL
         /ue2s8nzGh55EvShMeNwc3Hvnsh8+oe7VLlXDCcA6e9FS2WBD8nxP/wmvYx0IYRKKUZx
         3bH2W61XlGw/jVbH4z39PFEmQAq/InEku3TCH5fUICD6rWZ0rrTUN5XPcYb3EzapjRZr
         qbE0nyx9hpGxy83qS1yg6SuDn2pCMBFvGR0os+YS20zWKOsQjNdrFKnN7Z/6eiqrKSl8
         qAz+64MRAV0TSW+OdP5VqVX7K/7nnf4VXXejXoSGeYadxkRz1l9Fn7PpoNr2ohnG6dsQ
         Vx6g==
X-Forwarded-Encrypted: i=1; AL+hErGfNVjMunzQ9yNSYrDAMBDqaBWl8i2idA/5wpEmjBJIPH0n4ZEDKYRHJA6h58/onsGoUlGJTdNf2QAJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8I6sJuWeLSttgQ1ZZ+F38GgZSE1YUd14aBian+ilNZtyw60qKF
	0kBDNGZgq93yKfiPQpiwWt3mueTA3T3skZ0UFHv1mzCpZHwu055JykxyRCaPUoIQZqhL6gYHIf8
	5uB/KJu6Xr7zAJUTU3J3NLPYDqvr09sh3itEqRuEXVKUf4EEIfJ4s2wODtdIZ6DJF
X-Gm-Gg: AZFdTZcjcqM8Fb+4BXT4ZupX1ndDFfMXN7YguFc5Xl03JWlu9NIjoqiZsqHx6sTHqNj
	SO+UtZKWOtCQ0kh8GMpPMiO7aKv/Tv5SWmHw+hwrjAyiPgvnhLCxanz9XONAx7fpW/D6CwIqAdV
	lICBUpUMaUviaFmSmJPn3SafqGQ/07oL59C0i4drFVlO+M1lhoxaFdtKDeWV8ML8XEt14YMEFsb
	sh25h0Z68BGILouQvcXAc7xHPpO8rAOLgC9Dl/sQQ6Fp/BwzgP/B4ou0UOsOOjs1sLYw9oLjbBW
	uvxAE4wDXwIMJDavw+QO2EPy/5fxaFmtXZVuCdX8H6zn3cNFWQfDlV98xbyj5cOF/wpJ5/rLG5+
	nYqmgo7tSPDYK032Bb0CBkBb9x6V0dLLMZqrorVcGyBPP35MCg41MyU6+ce7E6FSOjFCofLFYgi
	JRVOxBWJ71oyGlLsNXAUmPyLbizdEsUErCYjx/
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr18650075ad.57.1794985422763;
        Tue, 17 Nov 2026 23:03:42 -0800 (PST)
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr18649625ad.57.1794985422281;
        Tue, 17 Nov 2026 23:03:42 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:41 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:45 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
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
Message-Id: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1327;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kgQ1nupiTU7cGt0s1oNpt68ivh8BGxPL454N4D/a2j8=;
 b=MECHIIWyATcE6g80NzNvI7r1HOMEw61S0t5yum1KZifdukAn1WfInFoS1KuYRsIcmALEzyeoy
 oZVMbLnouF0CFNvN39+PTO+kD7BshxRVR6NE/9btCbih8wPdaKSeL+Q
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd4dcf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kLiTxru8Czh8OvV4UKwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: X0IeTC8TYzua1Rd2UMyKF2WEVhXeoICl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXxOpb9/FAMwLK
 k9bB/5kG1HNo9IEh2vcbdRnBnwSByDGXv2lQ8N9MfmZbgZ4cqsfc1gFIOnkdO+Bht/zl/TrAw+5
 LbidBSeH2NCKzym+HvtyAt2wl9xl2uJF0uXrRBU31mJ9hSqvJnMiJ081+pK9JZzDRyd6jw8gWGw
 kWmRZw8+40MlFnovGXs/M83ZYoXuh1sTOy+2AhrZy2Q/fJ1DdZFFIJX5GGgIxKN+M3TjJi4nFSY
 iv5YL3Vpna7xuTeD/b0iu592lO1gdmAAYB17kuqQqMYWk70MNe+oGyYdPHCM7e7ugdbmRO09aUy
 8l9DC+RcRsSkWVDbIiMpQvcS51f4YZ2ifDEZ+hvlM7LRmWCxen92MquKBCq1PAI+9F6HwKdY+5C
 t08zkgcsqF32AqVLRnbxFNIjS11DsRPGDU5GepCfU8atv3gxqn7vj+tE2hEuLWdnyscI3X3if+D
 UJ1yexLX6fR6RYZCqEg==
X-Proofpoint-GUID: X0IeTC8TYzua1Rd2UMyKF2WEVhXeoICl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX15vRs+x+spof
 Q1kX5jy1I22bXxVjGfpx0yqjTmxAd8HcslVNS2tGF0XFucbM8zu8qOS+VKGKueZQzbZw9yno/4x
 gr8NR8D2cQtnBW9FeE/hzT5TLFkClbw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The Component ID returned by the hardware is 0x00000000
instead of a valid AMBA Component ID, so the AMBA probe fails and the
device is left stuck in deferred probe indefinitely.

Add the "arm,primecell-periphid" property so the AMBA bus uses the
specified peripheral ID instead of reading it from the device, which
allows the traceNoC to probe on this hardware.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb..a9507ec56b61 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5179,6 +5179,8 @@ tn@109ab000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
+			arm,primecell-periphid = <0x000f0c00>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

