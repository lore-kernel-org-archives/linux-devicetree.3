Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364209;
	b=aD9N2OEUkA0A0fvxHZCzxrd3AoBPKtd3RThwPte4wuLaoevnbOmpi8E8s0q/LFGqZthH
	 8jM5afUnyCsQ+YR8Gl/45zb9IRsyuJk4Fp1/KJfWljSK6GLHj7ntO9QAzBV+pKpIb/+ie
	 sjR/VHe2NGx7TCZQOT/xPX3xf3lVufzSy1kLkrxjgk/AfNfs2AHxmF/c7Hil+TyhadUl2
	 ntzaW0SnlCEl/GJHVVYLP5glai912N3Ua12fZNUlyv+2klCZd/1Ims1eo+bnqqmHRgCA2
	 f1vWt8S8aNdAg5skIuIzvkFBa+R9iBBZBTshnI9WXCUbbnCcPHLYpCfs3LQYju0yhuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
	b=tT93Tf9w9SfSVB4vHAyvO2MAGZfraK/Xg29rVqo0UIBZ0XGAEMgGucfv4yG6otIzQQHZ
	 41GQsDKF00Lbv9IfYGfXE250xaLPkYFnhw5n2C9VCcJC2Ezw+TQVaqU0BnnarXFqPKtjc
	 7u8HwiEBeMrP+q7pk1V3E4SO6BWHRTmXc8X9rIVqV+952Xg1InTi6O4sWb42dcy9/683m
	 rtQjjm96QdtyC3bAwdFhn3YalQU83oHtMjTA16z1GhkqsjqPyfcXpqD9yox2Chm9TJQZI
	 AXFzHhig2PQCDDISEepXQfbISYlQtxXnfNzCvgpTdWDpPIYzfCLXzbsq3Tori75js6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696EE606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 696EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG1tX4143834
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=; b=W6gj7HQGhDXp+iG7
	4V/LGVwlaJPU8X0isqrWeqcDf2mGwKFBxnhoJ/HcvsjrANqd8rQDEY+d8I+nDAE8
	P1P6nUPSsfO3DJe7APIFi92tkM/W7oMI0ShSPrSJQIzcm8raY6k6x7bQ3cvkoJ1u
	A6z+3/OBfxLUy6e+McQYDJIZB3U8EtBSjPZ+8oDhRHQoSQQ2vJIRbasGxToEiYtJ
	RtySHqm8kd7s+DkTwIwhdGv6tIVbkPmuXEj8lvPykq+xCEsXNNtekCg0n3S0Ku+9
	PgIwpJqKxLHYaqP/BqKK0IVMcr8jBgtUxKdrmRFl9i1dHwmf+2GYo+8jnHkLhubu
	8K7E8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7531hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e818ca61bfso8285605ad.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364208; x=1793969008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=cnRfjBSvvjPJz/9kBPn2anfFh/+Q2iyZ5Dj8C3Viye1Gwp2pC0IuLvKWGBAovG6pPN
         GfugOArVMvbOT/HmluJ8b8qUhjFyWkaRW0en2VmBFoEP685gq2oks1BrackWlUxwSlxi
         v1JcxJTJbi51aHhWWlcFpYIJnS0v7SBdq/fC/VSAQASEUs+D6ppMnrBSEZpkxke9TFEW
         hH+hbCGw1oEsalOH/FYykUMh0stQ/R9Z8v9kyacDtQH4WNtftuDuKOGua8XlvssMSLQU
         r48+rSVN2jXBJHTp6immlpFBBPP8Jb0Fv88i++rSPTCXTKox70RnehBUUy3qC22W87eP
         Fr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364208; x=1793969008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=FIphsOpGJvdvrbcGzSm59gTZpYSy0WxuLZXV+HfuKkLX6FWmvwcB8vdHskq8pku/Ba
         zUhbMRXsPPBNz3bFWj5woTbfxSoVFpb9dcEkvcN76ybFYuUBAV1CD4o6EszuJkBa/U4Q
         6eTWZIoSRAhZ0I+Tw80z9j7xv9KdPaoWNYUbO0Kaco4NC7Imsy1HBs7bBvJJMn8F1XCm
         19xCqpj2AGN0nmZuiGHidx4XxG8eyq50aQBp/6/oDhM4RzqlgOX0o214WwEGsufPJYo1
         XgeIbXHl9XzDrlwjH9/0/gq3qEYl0Pc6ZUPkgEI96jTp8xrW4WgpcKnIqJus8+f9fMC7
         iP4A==
X-Forwarded-Encrypted: i=1; AKwUvBz5M9n5VUs70ETRPRrxYUQFmGsr0umHIVpn9SbP2cdywwgMl85ow+CG8oJ8HYxuU84/QVUy05nxUYZm@vger.kernel.org
X-Gm-Message-State: AFq9FYLUuVELdOiBVWeJNlQbVwoBaT5gzuQTNXvQsu1fqMRN8P7kEd87
	JTP90cmrPi1GsVSwikDj+AYB8azpk3ftN1gbLMT2nI0Gb7SawdYJYrEcdoojYqtIEZTcOMOPsaJ
	I/bNmK4kGNpR/XrLq4thoZHwFbpgiadsnhoX3Ryel76WHqhpiEQWim8pYHQbPD2BC
X-Gm-Gg: AYBFou1wuMuJwrSq6JYBO2194+0GKsLc7+Aya+sYi+ziS9s9XSwb3DPRAKkAYuaHZbx
	UAhhpbsGpaIRhJa+KCjQAGP2tX8vgi12HlqN3itHmC34ir5ZFAWl0AioAHsEeXY7tSm3WaBJsqp
	cOFk5btYy+o++ouh9WoNl9G7g/qnHtQVqsS8pZJwwV6T2HhwlZjJf+md1T6H/lib5Tsyeanl0rs
	SLmo1K9R3HHvh6YLL6LlWl58PFEiF67ZhQwJarcEIsg6A+ega1YL03D277PBLu6/cCIOs+hy/rl
	/uNKabrNmkKg6C6KfPXwcGURS3oKzaKPGRzpwLilWpSXbcRNFXgCeP1hz6pwkwJL5fbAXVxQGHC
	o4Y9P5sXpTWYpkkRyfBvZaW7fu+8XwX+f0CiHKgRDqWUlS2hSIapkrdpBf++PqDl8K60ltZu4C3
	Hc+kE=
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829565ad.21.1793364208165;
        Fri, 30 Oct 2026 05:43:28 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829325ad.21.1793364207726;
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:01 +0530
Subject: [PATCH v3 1/5] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261030-hawi-maili-camss-v3-1-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1341;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dX6MizZIA1isQ45cxUBsZgjrz8paPsRmmoOT/a2mOUA=;
 b=Goh1WlR0jf3fQOa50V3RiuKdBhpRNJIYT9f0lf6o9kErrJURx/R22pq/QSA0hNNZQXuLu61u+
 0vJJ+wrFvk4B5FV65gAwLZK0YrGFNAfIBqv5N7RItutaBxCQK+0/fx/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: zKL6edn7kQh_rHrhx43wkFtGQFqDBxwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX3EJsiwRZX8qe
 S214gXdpFxOXVmCxDlSA2lN3Uc/HP07rMfrZz6R2h02btmx+0cV+SxM3QMhQ0hBA3rj52vNF6cd
 ESOyPdv/HzDPaLrUs2cqm88Ytf5M3D4sY/tpvQpim/x7wctyyZGFb9GmzqM01HU5HOBN12PtlVN
 Ra73Am80rn40Kaxn+LkFui46rqxE7mwy37lnLjb2otlzlFVOsePPIQckmhuHVK3LRVHgb0RbNob
 nbWzjqgBAPy4tCLcNf+gbfUYHegjo1CBOKARNY2DKTi9D6f2hSwC3WCL/FDWebMPy3moeu7yQu2
 mesGs10saSFXFWmgtd5YqUqyTLgmM2BVFY4vXTBodl+3U306FkRQB8GYgghOh7muenb0vDKqAqf
 Om0ctQEiypyTaFRUP/e5kuEIC4qJUlreFjXQmnqwoIUiYgZL2OWf62gEZgJQ4MCBsNgugIlLDiI
 lQByjLSQKySXuhc2AQQ==
X-Proofpoint-ORIG-GUID: zKL6edn7kQh_rHrhx43wkFtGQFqDBxwj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX2HpKXg6cbOsM
 VQbxfaGFFYBfyuuueM5NmyNByEiTkhk2Ci7r85ubz8Z8AYLVYlYwXees/jkp4kgV7nXJPXN52yY
 w+1DOqjcKEpXd2YBuv7WwzOV54k/hs0=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae490f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EFwTI_IBlkk_uzUYZfIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

