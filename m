Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DBA363C53
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023567; cv=none; b=P1yHYIBh/GgrCKdAJML4NNkalBDOoMeuamaR/RULLy4p7b28BLwKG/WEHOB6ZENExkRCRkDOM6wjtscMLa72WUEs/0aKLN8sB02VpLS6Bf7JWEJZfxE4kgEjTyvlCWPhcsfqvWY3ksarFObU1jSNk90itUgVRmIG5Ls4ixefJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023567; c=relaxed/simple;
	bh=zjzyQGqtQEvToFUvVoo7pZ24KQzxayJOTmTLKhS4AOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdpMMLaXtXlOnR5Ai1gDksgm3UV6rpXf48WDMxrI+2HMMW1bui4fGrPkDVQL7EA+nugwOR24ZAxoGuI6cDStoTBrr6QCreGabgdi11SjIBonAdzgCAwfYgExvkrDZUFCz7erytl2DAWGdfZ4Y9jAARH9DJMl0vOwpL0FeUNnDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8Nlq3G7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGhbXap1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8Nlq3G7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGhbXap1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SQE83912687
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=; b=O8Nlq3G7P7bg6KCW
	3181XiVgN7wWxHVczLpCGpmC8BSECUY6uhB2Mg4zIa2jSJPQnJh0VWL6aYVFBP/c
	aTT4tScsp+ipRcaeFp9EUCwm0/En9xPYRCKONMLh0nxkeMP5HXfqOp+rFJzmr2M8
	/Tt/3FF0F2IGCUaUOAdjyxEVhllIsg3iWTQTTg3jNmGUiFFy+hvmNTb6I8OGCxAr
	B/AHXMolzI2CrnEiCj17KsAHOrMHavwCtKlxJGLGBMMvFRN3fTEzKXg5ER5BqVcs
	VW/DY8/2ak8JdZITaEl6IRgXhceK0KApPfuLTkkSgpAYkJRN9f0joO77oDOUPsom
	RCn6zw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4h4m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38c7de7baf1so4750748a91.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023564; x=1784628364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=;
        b=LGhbXap1j7MlzOM/bJ/BksaQHVJZsXLNrtNDg9DGnWbhlJ6PeA5r7qfSSCUlw8bxxr
         vsjT34em38Sq094irDtBTmAHY6oO+IvLKE1p58myzvvdZDhF5cvo5iKYpMAE5VuzsOVd
         Qop4PAhmDzMevgt1EbsgImUQpogHy0QbKkLXnWqEdD37H1f24GiLePuqseKf9zIuELS9
         aKjFJHyZ2aNSpdJqMyg75o0s7UMkU47CsKAwaIc5r8O5FxOcGLd2ABcfdM5yWPVa1yLK
         MrP5aLqI3KbGaO8O2UWWOBm0EacU9TNfc0CDQWcYyPWzT8JRmKEPnLlJlv2yUfR8JTYA
         2cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023564; x=1784628364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=;
        b=cBMoRRLDPM1BbuUiSoUHBaYqpxX2xP8wp2EV7ibYJyKH6Yg3g1eSOyNw2mSlDkQg6K
         ClPSXpRvnGAon2lWqfwNc93YQj7R+Z14mU3RTk0rWNfPuXOJfiuCYIZFBXXO+ko8PxtR
         pfI4Aiv0CFUul8HgYX9JzdU9Ke02bjDn2dJRDeBAZlYACJIXkEIcdbP6eKahMzT7KrEm
         nbltdE3Dtg8SBPnifeB2Zq5Dg8vrHYuFvMgOOL/H05/MqMhnnzp+h0ymvTShAVRKM3oR
         ImFA1zvWnxOiz179o5MMXkNInv1PUHpM3KoIiKsCkLG8qZDWIspykfGV3QkT5RyU5lva
         0Q5w==
X-Forwarded-Encrypted: i=1; AHgh+RpWG1b6dr3VYZ2EenpuJ//YZh6CWpXsV/XMmJOsJhUtUn/HcsuqQO/KAz044llr03kxfzCL6L7T1p/X@vger.kernel.org
X-Gm-Message-State: AOJu0YyGM4Ffi9rv+IhKP86zV01Ihc1dtnwNV7lLWISEaOFchpCRPu4n
	tu0nob4AnqWplReQwDb+K4lkTsGraJYkUN/+obfhEYpDCP2M9g3pbz4np/xcOEZb4XTtwp082CY
	EH3A6RnvnvSGgXwzUqLBB02Uu72VNdwpvzKcDgBD8RGBf30EEsVPMVwrzrYzBJgmn
X-Gm-Gg: AfdE7cmp0ezhrU16pfBsczECDa3FxjcWxgYgm5ndBN2ZmO1UvnlPz5Mo2nUZ/ZY/0ex
	RDtTX5nkg2rbkOsrVnVjFnpykcsMm2/dgbpc4OOinfVd0Fo4xzgGx2lRIMBLLM6sxzvxP/No7J/
	xUt1GRdF7adqmD/3GtdJ3H5AaYiwJbwsY7rWBKkpFg6FqzKBt3CAytQWsRdRYpPE1NJ7f5lqK3x
	benDdEgtfg/R3kdbhhJNHH2S94DidLgVsSt4gGlvjlG2ERNKK86+W50zf4ckbuJexx7ZGv2o0Xv
	Wt+pAbU5xUbo773CAuV8EZudfdRz28PznQKoJUOw/UG/sAnkGfEA8VhGufKck7q/pMHFErlBxER
	gCVJm/vZYfjwKcJuCUGzPD9ZX7tMhJI8hC+uSOvjsx0qV
X-Received: by 2002:a17:90b:3d8b:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38dc7bc3194mr11380402a91.42.1784023564171;
        Tue, 14 Jul 2026 03:06:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8b:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38dc7bc3194mr11380375a91.42.1784023563734;
        Tue, 14 Jul 2026 03:06:03 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:06:03 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:35:15 +0530
Subject: [PATCH v4 4/6] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-shikra_crypto_changse-v4-4-06a4ea97c209@oss.qualcomm.com>
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
In-Reply-To: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: jzf7odFrp6ROLFeLG3-yCcvVZ4J-Qyid
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX9B9YI2oJUmQb
 eYv972kECHuBhC92bM/egyuKCS5zHK+gIgxiAuLmerARSidkW5RRpOFE1GlVH04JfJoOOe4qZuR
 tQOxMAx0BbZK2HiaEnsyPt5RL+P0eqzMgM5CKnIqoKCjCDduEvREb+rzxepb0BnjbK4gQZH7v6T
 9KvHbVAWOfKHcWlmB3HtERsXqTbssLXQ5NklRXA+I/HCkNlvDIYkXfowTePFmF1fQ8e+xcZ1Fg1
 jbK6S38jwuTpcTaG8LUqoXoBfIaanj7VWBFYqDgTWs0bFy1O9GsSKcXBPIRYqkxUoXtZ2Eb8sN4
 oKkc+sX7psCE8V9LulQwN6zUFsk796/cidPCql1c4988TNj0hRm5iW9FJb4+BnjJd0qHW2qMKYm
 kWMliqGmoTcljw4ZZP/lKVKqEUazC2En1osGxqg7plQJK5gsiSlIB5I2dnO5eqvdmoBpxdFyykt
 wwBvx8TmrqxbpVpQG8g==
X-Proofpoint-GUID: jzf7odFrp6ROLFeLG3-yCcvVZ4J-Qyid
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a560a0c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mnL63iHeaYg7R5sIRJMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX1+WynM8is7Cv
 JGZMNYQep4cKGeLYZcFcTDS+AjHW55n74ak3JMYiTNH2RyPfKlZU1XzdO+DJVlaGW4dqUiTPazO
 T2XZ4vkGlW3WV+th9VbNApgNQdQqwJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140105

Document the crypto engine on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 08febd66c22b..5a653757ee75 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -54,6 +54,7 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
+              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce

-- 
2.34.1

