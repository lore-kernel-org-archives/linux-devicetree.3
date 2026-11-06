Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956916;
	b=ItHPb6NClgpVAMCp0iuxwl9O830RB+87LAzVTzNIEk67ZL+f6QyI7XPiBOC0ucFyk+q8
	 wVr8DmKEKQXwy4I+3R5owyXyyjGwnQbB9oKgDBsYuJCMW7F8QrDE9x7s2BM7hg1AgA2rw
	 gWA6fWBvqvvSHxhz6YHM/+2x2NG6Bu2BMbRH3kn7pjezA8VRm+keGlwlEtVeDOZ/851fy
	 nJsmoXGtHfsI8AKQu8c3UG71Ja7qCpEbzVH9yN1DuNuERsW+nIsMe+0P4OtFZs7nkjkyp
	 iaWk+4z3DK4BQ2AS+2v/6Ug+ya9zHfTjD8onvlv0DdtZV4v/k4TwU21qQKIQXVd2PPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
	b=G3A9iN2akx5Zd01NWzJRyMMuD5GobBlWGVR3NYh7r8zZY3UXk4WezVCqyZ/R/ItJA21u
	 tpvxGd2YRjVTY6+XgH0gkONLssnHTiyHeDK7aZ60AeBtkW6fn7GOZl83qliM/vT7VS7gC
	 04ZOYOuiiYRFtDm/uya+NgyIEi6UkUfyjfOZcy4QWvx/Wam8c+/Rw2YiEnN9zJX0cuci+
	 8Gu8RtnEa94jnGbB47DJ2DyguFqYd7IKGcqhOK++wCDYmRLbpJWW27WkkJ+li1ceC6Ptu
	 Qmw6iZeFpsmTC7GbIwGlRZQ31tTJt4BQecu9421Mbi8PRhCat/BqdTCC86y5WUHSSnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKTG1eyn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGNkyDNm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A491606D80A
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A491606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKTG1eyn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGNkyDNm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RTa42730737
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=; b=OKTG1eyn9ccy50l5
	I4RqtoTGWg0KsGtlON5NVsdmdZk24SeVUdA/tfqhZqhpFGw96srG0rGG8LZuxtH4
	co2Sn22T9qRn3k+OGX20E7rpIJ4TEtGeo/SjSeAVgQyySHZqfX1+MiEhidUi45wi
	7q586wxzf0N9v/awvQ0/mnwwMKGb0PXwAk6CvabaGkO58ye78fP4WqbSAeFPVBfm
	6FUppPRCjA/VAR0e/xPYL9vjgOWosMxG2OsvCQuebrCjTuGnQkKj2zl6rxxj3Tgm
	S+dT6vsWYc+jTqwhyRP73QwnJOvjaN8lfvB8iOXZDWtt0kyOgTB5+SEi8QIUu+I2
	WBBvAw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9j22w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso549914eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956915; x=1794561715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
        b=GGNkyDNme1DX6Lf/UOG7FHMSbMmkj7UlGeXCksbz+0PL43EPMaRdlvCdp1sIn1NzLz
         R2Ajpfx4yuNP8zwmEcmp0g169c84JfOzx8R9dP8w7wX4a07rRbcrG9CPnww9w3xOt5XY
         Nzw68+UmnNgIkpZ/0G/ilL2Bs4DK4TXhWmtDE8shn+WjAF+i9GcHe8FV0fM7L4w+2a1C
         RqhNWolMJccT5FxWNPSoOi2C9W1P1stEtwyBbuzvUn0lkxvi4VqhNBlMTI7+LlHuAR6l
         hop4wTKZbb6VNBfa3XNHVnJwWRXLLjQmTGMsCuEl444xCLesWjr40axUn23mktpivN+c
         /9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956915; x=1794561715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
        b=cIA3RIc5F3xeQkRnBRwMfQM3xCkF0X5K+KuooxLsawzrXar6VbMgPrudxjdUI2vztH
         fmXy3Xa2gGGAB7x5gR+ME1l1ghPU+pgO9pTKPmsiCKZo60YYcRW7qFHDmmiDEm3hXky8
         4uyATaK2cFUt4y8cI6Mq8pAf/z0l/g88xq0F9b7X7IMFxd1X2vGJo6xUepS5oBlCJxOe
         pWrp2c+jDeK7nNcqIN6h2KalaIiRtwxuwydEk8adVIpKmDOTPeE//PfS4zANyYSwlswQ
         iECMTrDh1PTjTtacxxYQNWOF4UnrRQjQ664fPmAmOmFmpWlUT18rfv/wRjWpPsziYtTi
         CeTA==
X-Forwarded-Encrypted: i=1; AL+hErHE0VMg2IDEJl2CFmFD9Kl3PlPReTLcmBe/u7JtLLungbPKMZ+fR6eMk84EY2G2Qt5sYiG0OEM9Fh21@vger.kernel.org
X-Gm-Message-State: APuU4Z9gfTki0Q3E5qgOAby0ucBe53RPMAZvhuZylFY2FnzqOgeT8BIH
	aE6ryY2E6kphQEJQpwyiykbewZ7JHEhIwVS4GJeRZqUDdf0+7qmMQH21KszMtgRs77waY2cy9w6
	o4VcbZKLBzNmXMBJ2VxsI4qGS3jOAz8CaCF02EzMqAi+dj/VCT0NVsbDKvUD4cS/a
X-Gm-Gg: AYBFou2tS+2+H8VtiD7Gkqr9YN6t1Z91YdQuUbQQCG6p8tfVoCEUuRKSblM8qYzolf7
	ZqMJxYQdsGwQx7AhbXeM9svSW4ozPRtO6LIq0fEL7+0R8I1uQaFcB1nLLEB3fy92fhzY2+tDeWm
	9Kyje9Q1gcqpwaeRLjSMoPVdBDr1poUHCCDgteXw5jIDaTtagPKKE68CH8Uwwq6hhSpRu9I1Gtm
	D6y4Dh6ChGoGZwWYmudEfFhkaSGgfdDBF5o5/9C91Ryi6sMw82HRZxBj4EBs9JSmJ0sXKI8ByUq
	V4NnENW84cGxhJQk5r0yF9VuaQHdKiGZLvV6tRK8QSUQnCu5nSEpSm0I8THHpYas1AlNaFipbUu
	Js5UVW/2kKSMCNnINH8KttrbmLWBofkyTLO12nIE7Av6bx/KhiJwzfg9OznXS3hM22FRmdgqifc
	xJRnTgeiyEAhA0Zqn+BIH9bKgvKGW2zGPhrQKDCllQ8FrEGgZDaiKJSQbV7Upfnh6TghnpYelZm
	IDmkA==
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2640826eec.16.1793956914789;
        Fri, 06 Nov 2026 01:21:54 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2640800eec.16.1793956914305;
        Fri, 06 Nov 2026 01:21:54 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:53 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:51:00 +0530
Subject: [PATCH v8 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
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
Message-Id: <20261106-08-dts-v8-11-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: kBsKCnnfigXXT7K_4Ztc2KZs4E3bHNkR
X-Proofpoint-GUID: kBsKCnnfigXXT7K_4Ztc2KZs4E3bHNkR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXzZfmHVLVIJrp
 3HPgzFPv+kniP4a65PejA7y0iR/arS80Mc+RYm8Pykq0IyRimSieQ8ISEHVAjIfY4/z0na/ijrk
 UTah1ytBuuLMQ0q/zSwNGSMJU7Z6Wsc=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed9c33 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XHihiHp7Beehtrn9I_oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX5IoBFqoqU+ry
 NJhTjGoarhtrSvzJ1FDflEMW1OQr98W0OYYrcPUdVsd3GqrcbI9M0K0D4SfcEUlRP049tnxdI/J
 P4dWOtYgXIzEZiTCAuqXuo2adWuPyNs4xZ3h5xqMZW48Vk3FHF6uDfO2gSjbHNFGaq0wTqAQ0Ik
 D7rTqZhEtKwaBaNUKOMO9My2oHC2VrUWnHO5Jra3lmRQkf9RXv40EAsKooanrzuuy+LN1CYsHyh
 2P1E/7BUfxqCoo9AiluGCeih8UipS3vUDZzyzo3FGBpIjIvYiEbN92lGhVhnQ618hEzRSf1b0qc
 MZUmojTVmgxGDQDaVJM8CEEtUelwtLrmfeCodVDHgVY5WhdEPmF7yFIjkdmKnmJF4fNQLxYS9RF
 Ls6uaE2ByWXx+mOiXrIYapzBnAT3HNYyE4fADSbXbi4Uaq62dcJBGJJkxhSXzbSd6pFKekNWYMH
 AYdq4AuMvQ6xi7QTYrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add random generator node for the RNG block present in IPQ5210.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 61a58fd5d4ce..91ec7eac8a67 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -386,6 +386,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

