Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7793CF032
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966826; cv=none; b=hBIxkZD0LDf/fQFWc6iGx43NYD2TlJ9steCTXkYSfVrNtmxngzs1hBc//HZmdaxiOV6chZWYRjhbdjslSZ5kS2PQHlOYCiRJoersBoymzq4eAs1G9lWF3c6Iv30Ai4t8fhqu6dJz/ljboUohkThjd7mSgI26Ov5Ox5+vNWRxB14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966826; c=relaxed/simple;
	bh=i7K9Z6L1blSo4FLwUqtu/dPp8zle1D63zPXhfonV+ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmPWrpvQdozfXBuoVFWaUHqJPyK6ECJSFscbwgJPSA/g7+yeKwPDeQBWzEEXlGZMLjvKSPXC+HDAbA3uErCDJF1QKDrQtFmH1A0YRkmc3jOTzwWIc6O5jOQvoR1mDTewZUTDdFNoWRo/Gv23N8D+yVkAxVB4PEYu0zq59uHIorY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDJaX11b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScpmJ4JX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDJaX11b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScpmJ4JX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456tinT366547
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqPIJBKBW8nnQg6FOvU6D7ze4pCjVpw35+JGo/GcuTA=; b=FDJaX11bsQfPpGuM
	v7L8BpGBbCIHCUO0CxU4LGJ9zinwE1+NLShOL0S96CXgFVmGHgSDqeYQUVhM5hwx
	9ycM0mRpGKCZ049daJMPDAOWQittDI414JlS8EoDYAwYNQ8fADI4dOaONPqN5vPQ
	QI+wEhBNw7eaHD+c/hk6U5Sbq4XnWkQhPwUc+jOZj9gOfdQAwqGHmwSNKE3u5Q2h
	uO+kW7dxM1US3EY6MA/9JkcIXXf6mLw/a7vB9itwZUSrCO5mdmeteAN3bJYqw9zz
	lMnCpS9+PtGDzt1qjWK+PXXnnLgTjUuWjJfbeyG+vyDISRBkm3WgcKPAg6MkJIGn
	0UVCHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6uav9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:40:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so53012955ad.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777966823; x=1778571623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqPIJBKBW8nnQg6FOvU6D7ze4pCjVpw35+JGo/GcuTA=;
        b=ScpmJ4JXG+e9VHS79Dr/MLBCHx9VewNVuVqN7Nh5bByPbofc07IyiheSrYuL0/xA/h
         cS7Ns7VkZ86P8H7BjYUzS+8jrIrqi1kQ1k5Jk+8yBjfoTo9GeL2TTaWejNH5F0oima2v
         V2bdSRJQoORR4XQPIfJZgcTvj9+Rkfjq1Irahg9AWdwEwsnl9NoUtWNIOZPeDBVUhQZP
         HwEvLt0cC1CMkFINUZRZD1FT6OW3fLrAOdWGeYWSftAquyu5HPXhmEeReUR2VNM/hAlq
         N0MvtL862AxHmqPaxDvNdQue8h73mZh49hWI4zPgikofL7rWQATxt7UNzrG0F43r+gsf
         9LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966823; x=1778571623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqPIJBKBW8nnQg6FOvU6D7ze4pCjVpw35+JGo/GcuTA=;
        b=B0+GzYAAA8qccF0MlXs+lv8C2ZZOrHBEzSNnKvkYsD+NDJ7qknY91W/ydO8HOxiap6
         H4rciaY7FTZAHQFtNZvgTVi36FQVquoy8E2PiSeywfqzdpESRHu5Kra2ETYw+ciYkJAF
         155URA5sDyf5yt82Jw0nkoO3UipPAybMXx7tsyI3Ty+Odke1MXjZHZOLf+UMbDFc/f0K
         C4ERcZlwVbDmf3Wuy/6zDWs++UzkqSQ4isPXg6nE3flNF0BSJ1eIqoUQR03oT0GOSGrS
         Cp9QySfKz+QJTHxaaJW57cz683fpUsc2+9iBa10/Y6AsAMgR7qKzZrYArZebRm3tY0VE
         hvdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QPkQW1upCJr3X7+kwEeO+PG6pocJ6j2Bg70MM7nuccjgVBoAb37U0miC6y5kEAHlt7kuQ1ycOPLwf@vger.kernel.org
X-Gm-Message-State: AOJu0YwKw2pz9jSoo7xokF2Dpc+DHNkXAkQ3FdkmcsQU+6C//8lSzzHk
	5DmdN5WFC/ZZgFwUegonXsJT4uR1T/k1lyzvPwkYUj6I8N2Qc2masWVlgV8MGgqdaCBpuTpkPt4
	D5CVkk8XUQfxPe3c7NgxMEvv3U1bOrwP6hkd4LaxCjdwRRl20UN2zxiqunexBlmmU
X-Gm-Gg: AeBDiest7v1lEYKH3tBzXootxI+uyjqRw0ifNSggbB6NaaWXfD5be0KPQCjc9TsYMAG
	781jjBq48GgmwhUfYobFMR0usMOI1yAh8A0uT16WoEJvkKJLkvdJJoRic0IAGVceYJee9KzSxjP
	LIw/Cz13nY6nJmzZQR8eyYCf49xdBmAZz0aam7uV63kwikLcfvw0T0f4Hdhjm0PJfFt+7QdOVlB
	3bn+iHdCAGSL/IIRzkfOBTFymUhE9oDpQbzod/5uZ5fwWyXM7bsj59bcTFTy1J77QDVUVBlqSgd
	9LF7WnG8j+0GnqEPTdaxov15QJ6ASVBVtrGApB1JU+Zzvo3/rjBJamSkg5kR1budDbhhBlmYc1/
	BveB8+8Z4xeTVDQtdtDpOtZH3L6cj/uPt+eFc8tr6Q9ZoDrPjV+UgilA7KA==
X-Received: by 2002:a17:902:9897:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2b9f25bd9a9mr90911055ad.17.1777966822848;
        Tue, 05 May 2026 00:40:22 -0700 (PDT)
X-Received: by 2002:a17:902:9897:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2b9f25bd9a9mr90910805ad.17.1777966822333;
        Tue, 05 May 2026 00:40:22 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm132663405ad.20.2026.05.05.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:40:22 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 05 May 2026 13:10:03 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom-qce: Document the Glymur
 crypto engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur_crypto_enablement-v2-1-bf115aeb1459@oss.qualcomm.com>
References: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
In-Reply-To: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777966811; l=802;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=i7K9Z6L1blSo4FLwUqtu/dPp8zle1D63zPXhfonV+ss=;
 b=zBaxGUh5pfPuhIRSAZnWq3SlzNJU2ziM6386cvXRVJd2V+JFXobNCfc4Y+eQQQQ5ZofCriZW3
 xt0pdqinOL/BJarOnv7tM1FBKJfk/0SUnp8rXfBOLuUzfpI6kHtGB2x
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: eHC4HXWot6B1qy-B7jrMn_nTQ34q7tcw
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f99ee8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Hz3RRZfyAQ8605JJPKgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: eHC4HXWot6B1qy-B7jrMn_nTQ34q7tcw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2OSBTYWx0ZWRfX55sf8s/c6d6w
 K5SSce6zK8q69m4tEoDO9idaU2GWDZ3j5WSu/PIW0oNINMn66qhdnzdcPwQG4h0LAMr1QpecYvq
 KqccbY4PYz+qMatfAa99/njT84fLPeavalg7zUL1Kyj7BFr6v1CIK9AX4NlRUJ23E2qYKwoogiJ
 adMBWkK4vbbTeD/1McOCatCN8z94DjyMZ9kDS0n7TFIMjfulo7bQG+f/tou2OHORf5+fb6t1Ry4
 m9050SD/06UwIIdhHv0xLBP4oOM9/uXcEbH+ZBWv2tTUD26Xivml01WLQOCuOnjI+LeymG/4Ogm
 Unhg5uWrbKSakeyZwoRBR5EkbpV4wJY5eqVfHWW+w2dObdA5ywaAsqjDsEC8LK/lIqicotql4sR
 MsqdkPP0v1ffzdx5XIyM+sO5vPpM38XW3KOlqlENh+Bw6Tdjquej7Xndm3ruoLqV+QwAuxrInvx
 +TBc2ueJzvbarSMLeMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050069

Document the crypto engine on Glymur platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 79d5be2548bc..0b62271f8bfe 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,glymur-qce
               - qcom,kaanapali-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce

-- 
2.34.1

