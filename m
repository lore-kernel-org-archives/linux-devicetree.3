Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA535E529
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842617; cv=none; b=QrlCTJutfYGJAtje84M/xQpps5ZviGGB3z3EpjbW1HL+CxIdQ2Pg99OXv6hA47/kbosl+1eYc5dsbzLewIF1G8a/ou3SS8vlxwpIKXQZTfGjZf6EKLPemI0YFkMloQNsik+j3GH7jxUzbqIovjpl9zpAczv7Pyc2QhH/ZQ9NXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842617; c=relaxed/simple;
	bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUzBBRvZ7UZIIQjvz0sizk1nbHcgS8O85ihtiT9qubHH+3rtMw2FVn7qi+Ke/XfQOet0xlrBqWvbTCQYGxXRGkoudA3x/eJIW3gB24d/9eKX/5AgQKpz7lvVAwo0JNQBj+MZkCXSEPhH/1TPeqAeGpKGnnvDRQtlCKA4NNIUAYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwAdAifD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQF1p6c+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwAdAifD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQF1p6c+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAooIT655515
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=; b=GwAdAifD+9bPCWTx
	+Fh3GzdYA1KbFgdnK2XSqJ+nQy3fIl9GAScmzpyKQiHgELlaqdJpCjVQTWF/dB2j
	Y/URTYstjwZqNI7AbAzzpEMWYYXiFXKDtGk1mtjeKEUBY5yP+h3Cf5xIeTgFBc/6
	qASsDZ8HGLZLA9IYrRZVrcRpfih6MuD1wt4pTVglBND4iREAPlrNKldxoPuVYztj
	98pxcXWI+KZM2fnGKyOADNN7nTxYx3cpVUlYxK94hy36teMMc9RJ7HYO/2gjxNuY
	GKaBbo8tBMjQMCyiP8Mz1BgC+QQJ89beu4ajIFDVr2pV3n+Jz+hPtf8JO4MpBqjx
	ze76vw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu04q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so203438221cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842615; x=1779447415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=bQF1p6c+X6JZUYn30zD6S89+DYYj2VuOSigyUReXyPl9fpwsoIb+lfgT7ikk/W7Cok
         7gkNRPZszj37uA8LJhPdzH6mKzZx5LQtKl1VJdnRbUcg/nI7iQrH3RQQ/LU1lE33GMPJ
         7F2wqKZ6JFiw/lNHwLDeBhZONeHg5PG6c0IEEuJaOOWjRbc4aHolxXv2ujpIuTqFmVMQ
         U5C7R0O5axOOGQxqBGJwj/deWkKdGgRpNyo29Jy+jZAgvTPorXfLWNvXPqhT/nDUxLfC
         vBTjiJ0OevoA6H3dLF5FGgDc74r3iLJLeT1C4hWaey+4Vbg/imJH+xmAUMhhRUZTnPNl
         AZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842615; x=1779447415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=pFCAvFT2uWka0oJ3kG5pWbKtU7eCZxj1Ohe4mMqyPsSneEdH8NbAC+SYrj5P98cCIy
         y2L/g1AgK5KZDJogaaml4klsnqggJIsZSpuZX+nVKhANHS1/8vzEzDVd2OoZR4anCRUg
         Ia1KvKcEZd7jhsxQFeCSXNlRsXt9V36fQOP31Ba+ehyg+NPW6iKgCunBLUBIUXDN7bJB
         Li/r4NuzH017KJYVlzrCC7bY5KvwQzDEAf5RLDO0DC0KX4t3FlyLHmiZoSP3W7LWQf20
         5L3rQJHQ+Lwlk73+vkl16KGMn+6uWLV5+syRvt34W8v7hjO1ZPjNTN4SlkpTUaXaWbUx
         cfLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yT0ySrq068roXtNrzfRZcxJFrsuqLCEZvOuhLTO2fN+xyw9AHStLEid4oSV99I1m9HSXycNUUeXjI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0WhIOGffcAepY6A26MJUtRxdhE225CzvoznCJI8G4nXOjvVe
	rlk7fVMkLRqkR9hU+hNHRj5XvYGSyXuXYiIxWdWYeItgYHRcUfVbjrBCnTlZhslZVpEFth96rVx
	6ITSLxZWK+7l4vb5WufU8uLHzwG2vCGcXdjvp/qZQYJL+Pvp0v1EU1ofEVh5YXCcK
X-Gm-Gg: Acq92OEiOLLWLM7CbwA1fAhBpkLPcpqi9pbdTUtsxuW4Srqmu4oIMOOJjkSR2OZzsfF
	fz20bwGSfiFwVsIcscz0msVEJZJqyZvDMAUOOqK70BlYKY4mnGsFmU1zr7cMOpRHXwiMu9VBWAv
	nTsrQRFBxdi3zTukQTDJWE9lw1xavKP/p6v8jMiR6UFEQVrquf5qvYhNK+lP9l8NfPAPnY5Khgv
	Q3ZhlV6DqARPIgNxX1izPaNXATumzGZ6q3CL32Hu+C54f+eygWSaVx1EKt3UkQDWE1rUgVHc/+9
	7UJslcNKoGRvXHIV8tAJ38IItkDLQJR6gmqjcWqzPQB9ayxa+ak8l2AUlLNuQ31N92Sy1nLzivU
	s8q9m89ZcQAB/PaBi1c+jRbgoYNvpM+7vxzMytGsFpl+wA5sAYVICzIoXUYuUJpWUAUljDqmqNS
	PdFzmEPkw5NaYzDo5ouFjEcEtJsCihBfNjWgw=
X-Received: by 2002:ac8:7d94:0:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5165a1db10amr42448101cf.29.1778842614553;
        Fri, 15 May 2026 03:56:54 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5165a1db10amr42447731cf.29.1778842614043;
        Fri, 15 May 2026 03:56:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:36 +0300
Subject: [PATCH v7 2/6] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-2-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvw/FX3CuWW0ejlOjtX9H8DE4NiE/wxV8cng
 hLNKiSHMdiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78AAKCRCLPIo+Aiko
 1RsrB/92CPB13aS13KB+xx6m6iPMGGvSEltDGHMo/G4iW2GxVZIkHgVIghQzmcrny4Dx6Tp+YHE
 Pl1d+nSP8OrLdb7d0NJ5TqNjHHAJ9oQM2gDxFflthUAdx6iWEFdvt5hxsvN/jTA3MUnhMx85rg2
 fyYZUbiqv7q9jbpavclxzW5orgODzX0TdevQCEe4VP/7pS9bLdsurJ/+sDAPV2tqu1KrzkuBjxl
 nTB//XGovRxKsDSQm/r6KRUG1j/yPfSzQw8CPk4xjoqnLUJ9F8j4JtMx8enfm4dxQrXNaug7J/k
 rYA1KP5yeEMgrlEK/X3RgBNQUz+IeYOuKa8pZcGhRy+v3dNH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: D2AZd7kE11Td-G7kFGcryh3R0XboECsK
X-Proofpoint-ORIG-GUID: D2AZd7kE11Td-G7kFGcryh3R0XboECsK
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06fbf7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX0eI3BIJP7jvX
 rOnFbGZYpPhxSTjJd2RFUwweoZoBVzOwP5DoB5c8ez3RSU7vB1++51PEdO2qKICv4gVYwRs/IvD
 ExQPzw60+7kkMCFAXYYLYCDXuVQvVrBhbbO+danr1jTvtcd7ovqS0AIydaHWB5hLR2dJ7jk1AMB
 8NTzwg74f4WH1OeeBmYdvIaRRfnTFlLyu/1MbUV+SKRbek4JWdfV6Q0Tq/NCRC/BBLMH77XBsm+
 t+DjpjcadoY21LQAJhaRwWs5K8iMJ0KBnkL8e0APX2EHMER2ZWRxugjQIx4hMsVoVXQJeTf6Wdu
 lyaC6YWyzWFrN4LG9mXtopOl+HpxAz9QMv/VSTWKzUkeov8Z9JNA1gDeXObw44P55R7HY3iT5Iw
 /E2TilEeKeg2uRIW9N1HKm432Vy5v7lKtxsjlicTckH1Y1Ef4PNswfO2eedt52bw4LBPz7tPDDG
 MsIV2LKb+wx9FpOvPeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..b09bc6f3b518 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -692,11 +692,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -712,6 +707,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3

