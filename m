Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2064240BCB5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625813; cv=none; b=O8zNp6xlxadKByfWyEoXOMyqrWNv+oydVkZDD3hVa/8tIPnJ3AP0weUKYw+98RTe1WmHCmk1omb98kLTh0pXAXR14LCixxrqqj/eFjxpU3fuvG3vYk2DaKy5wYM7W721TJ6b4YuCyz9eDeZFNNWscWIqbd1502HrzdHc4PqQ6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625813; c=relaxed/simple;
	bh=mD9tId+Svje6Ru2zYNpqemnJExGKmm442e282hRmvzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z5Bf4bpRxnGrN1fkP0iye3GMFll0Br4m0IV/3aHWerNUFpT2UPkQ/uWLXgWfMRp338AkNWgvSA93p9ZUxCB4jn+yPL/ZA4EO0Vs0ZJdsU0y6lmmASiy8GuqUMIpDnmbNjpbF6ThK4QczJ1wCKv96TPCbP5IpthA38lXJXIaeWHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXUlgRwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kE/F+B4h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXUlgRwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE/F+B4h"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6KENY3884164
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDrOV1sZZazMNc+kOgm5iVwMNrFnJkh1ANMkFcdLDJo=; b=iXUlgRwXcHcMLxg6
	lcy5ikpw1MDLvWOdhzjxQlOaHJwNGJ37M57SGza/JSMUcgaIeQvlDw2pGJSRNcp6
	vddTGU/YakUabjf4VrFM3wv5uBvWVs3NB5kEg4d6LnkGXhTt+mC0girtPWymRZgC
	jXxM33+wmtkAB4//8I5ajJd58CAPEd8hWQDWyRdlK22Pce/FXM2jstJL9fyIKlX5
	D6N0iy1rdv82J7ju/H6m9VoGYQhM+TW9GDN2XBeOiaP5QS9F2NYnamQs/E+RI6w1
	MZbh9wCYL6gZazw9PYlfia3xO601XwuTdrRC6S0nxPU/iV41GH5fv/BG88NYwnUY
	T5LKuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcbpcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:23:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e6d253330so2732450a91.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784625810; x=1785230610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDrOV1sZZazMNc+kOgm5iVwMNrFnJkh1ANMkFcdLDJo=;
        b=kE/F+B4hsLQAi38/4Ij+uKcv+dzQ6GM+ESeEi02IpbSeO27wJWBuWAk7iBja5czYRK
         n/NGjVzvZaOQrispmeLtrsxyhHswn83ehMDjulngyfrRA09umevO7X6Zl1IvWAYZr2Uo
         NrwqJ70jy0p9WSERwC/WuZYeo2SDvj5GoqolM+psqAuCdzYJINaVum8E3N9Up05OBdR8
         +7pjdd4e+/Ok1D6/pFIaINttbFHgc9qX75ErzdSA0P2hxjfNIVwMKu+44nnClS4A1O7a
         vP6DP7evGLPwSzpnoithmP6PGvWB+79fFR5j+VKdXVL9OYVknx+0A4NYG34i9cwM5ZEg
         gC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625810; x=1785230610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDrOV1sZZazMNc+kOgm5iVwMNrFnJkh1ANMkFcdLDJo=;
        b=Xgd3eBIV+UXJRKXtcxme/ozudjrPTXUChUefwu36cVybnWxpa0S+CDerAqFyvKodig
         CdJKHiMCsQgxUt9iSr+AAkJ+LsGNw0imN/O0dIBv5uAYqdLO1ncyt6t3V1zdjsQGjLxJ
         ds1vlJM9cRJMYQESpsg3M0npSGSTyppJULPxtSNPPGzbY30INuqZVqdNPKyMElXn5JkU
         AGpXJekRHBjigzuGvijicRPtW+B1c1Ry8X+paS02u3m4jN9RGO72al2yL7aDURD/kqkR
         hPLr/vPiopgM+wYgGgloMCjOaFSf/J75fUDkTgVo0tu6NSdGLl4aUE7/KEhjWh6k2pAg
         0aUg==
X-Forwarded-Encrypted: i=1; AHgh+Rofq8b0bor6OqVX9XpiqDWS9Ic+AV0I2FVi8GkxPbec+0Iet4AJq+n6j8/RaV9Z5nZuhsLfAG2KobH5@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVoUYIUGGAKZO1s5UrhpY6ltwX1mFADDNHaczmQkrZ+AsYowA
	lgm74LirpqlQK401QaDSbafeZJm2WvFANnLmklNI3C7PFDDiBx7TO1iyr+HaROHKStIAg9ghDAE
	cdP9MzRjqbdv3WhjC8r+3aR/Aqp9vDyEXYeIR0TQ1FUDhLLZhltZvH1B3QGmddbESa1QRIoRe
X-Gm-Gg: AR+sD10OMpHM5R8chCO1g9HKjgSuvJ8Mz7/5e372AvBIt6ljKrEirS1gEZjhb/OaPyV
	w3ZHkmnGOeabDLR5YbU4Ybstf7zgWU4KRgP7880ycflsPhojd85PRvPttuDobsV7DQ9VwhNi4Uq
	+koH7M+zjK8TQl6UDxT0ddDnIFdeNh7HkQP8uy0oBlSOwqPKOsTlEsqEuPMn0URAOLsqQorc823
	jU9l1TM37W4L/culYRuTtTxFn2Dow1xlmRndbEu0CX7BOWlMk6dgxbPYiUa6aKlaha8TiNJ1TMI
	LjOFb3itehbE0OXiuUAWY2iN4KzR0WdsW+3+HdfXCiAlFoDZ+XukVzr5KkjkaSYYr7wWEGrVtaZ
	H0Aa7g8INyaKbvSS6FYpzI2UiJyr2fPihBRe6gLs1ik6rc7dam7vTJ8QvsBTYgcfTipuUlMOHpg
	==
X-Received: by 2002:a17:90b:3841:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-38e4b53802emr15746105a91.6.1784625809863;
        Tue, 21 Jul 2026 02:23:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3841:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-38e4b53802emr15746079a91.6.1784625809427;
        Tue, 21 Jul 2026 02:23:29 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4801e0f3sm2308661a91.2.2026.07.21.02.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:23:28 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:22:33 +0800
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 x1e80100 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-devtool-v1-1-ade633accb41@oss.qualcomm.com>
References: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
In-Reply-To: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5OCBTYWx0ZWRfXxQDDaX1+iePw
 elVpa/rTYtwgOIv31cQu/2E7PzMhctcjnOoqXw8WBnZRsM85IAW4I371CDH22FlWj/JwcZgbefv
 FaFA/OCN+AYNbDb5V5I+nbW3Lnw/bDM=
X-Proofpoint-GUID: VWgOsosHm_RFWQfN2sm-0MfzLIDMIxUj
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f3a92 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0DGZwrxXYRw7ACnPEe0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VWgOsosHm_RFWQfN2sm-0MfzLIDMIxUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5OCBTYWx0ZWRfX8WTGsSr/5NUc
 5TmWnIpfgUE7ODGHdHvNNUXWL7iETI6WfT6hH8bhWywJ2oUOS9qhZ+ETMtvMt3na5rs1+In4M46
 DtYPWIGTnb6Y13jcNVB5PcBmXnBXT0YvYXxWAmLna/2McXycyMWx+VgCDBlztc8yN4p3z0+R9Op
 0mhr/Lw6HrX9UcvtOBHRYsDAo9RDx2IZ8oXCpfP8LYiCfXil8FydWSyiWBGtOdOKF96LtFTA01+
 JAXc3zha7aKSGJp+Mg3Q2ohcZ6iz0oTWcYdhZFw/XcTIxJXm1pI5XLmgWjk04bl19thgNavtgOP
 XlFGwEGRe3bPnVXoRtdjyxv12zCjBR7OYAbfoXiKpWL42Zpa3YHkUYNq/iKs6CU8+lSI86KmHHz
 h/QU4z3/OZr5QeSDT6m4c/rcjOAutRKvVu/KuQWIdKzYzgdt68C0pSKRI95a5nVzH4QZS1/vcXa
 /8MEEZiYBMX50CvWrgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210098

Add the compatible string for the Qualcomm X1E80100 SoC,
which is used on the Hamoa IoT EVK board.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 92c3ba6eae13dbd8a6a448057e942a08cc3a3ea7..07d6778a287631262282d75c0d233919f4241edd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:

-- 
2.43.0

