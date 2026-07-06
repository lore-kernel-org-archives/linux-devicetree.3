Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9360041DEE2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337553; cv=none; b=ppbTsNoLDhFGHNhRZasdNa61IZRv07Mf4cJYe4422UURk8gM1z16PhfbXL7HlPqfgLT56sLQCP5Rj1SGugChn0X8k03rRFVh6GM8Yp+EJr3iL3aHLSMLqbULawoOYFOFXaIM4CvQIxwet5S955urRb7rvKudOqMndeyjIznIwAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337553; c=relaxed/simple;
	bh=zjzyQGqtQEvToFUvVoo7pZ24KQzxayJOTmTLKhS4AOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bv860PxCa2JV//gp+X8EAYt5egMS/Qg1KZgY0HCIJxscTQjqG2iBLcRpOg7RNyZHGX7N+8fheHZuRZUIDK1nThGzbKeEzrmvheMRwRTjKvs6X0a3dQnPQ4LpCadOD2o7IOilECBnYby7x2ROt5MI1Pi2Mymg6imZfx/4KkluPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNRM9b93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgsHo8vU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNRM9b93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgsHo8vU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJa4316462
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=; b=bNRM9b93C2KoANL5
	Fk6+1X7sDHXqIMPZliAznbS4iL327Fmj4JPnVK1roSk874A8RUVwRab+OugbudZJ
	dHZzZUEPKGlfSrT8+RPR4FaRF/+DNoShXcYrekfr73fqrAAwdwv4oymsMU5wUa6N
	iKNnDbofO1GGfC5EVRDrsYBELG7UmIcxgspDndwkgVJcM1w8ELleBZm965P6DpMk
	ViBEGiUV3Ho11W3dAi1WLENHYrzd9pcpvPptYFaHmSnImTygKH6F4oa4F1M6jNyT
	HKejU7bWF3H58ajYFJ+EL9xS2RNcAIbF1RwG8DqgzukjM9NybTFiLf6jBwzgTi24
	PSq2KA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h0qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:32:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847ad67cc51so2887387b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337551; x=1783942351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=;
        b=BgsHo8vUJTjtwlowhC2zqO10pAmxq0btNYDrRwdJ+/hK93kTZ+hoNczaXm4+FF3QAv
         I0iUOVKe3k+GhSB2hrJvDnhdCXyRcxfpKKhUbGXDdh1En9kuqUgHL0AJoEJYTz4Qjc8Z
         YgfuMaqxy53SyCVGP2wTkbMV0M4nQ9qy+VtcTfJH/ugrm7isQiziEI61Saci4kUxD++Y
         yw0q4Dely9vNGXL7E2OFeRveCmCtHH4oqwgE9nj5eDRcCbGfwVyz//NOlBBNDkNjIPCg
         EhEE1HuBYB0sHu069ZoiQSgXOkzQcuupyLs6r5osk9NLICSiw5H7/F4XoKvK4AYg6swj
         HOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337551; x=1783942351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7SkMYn1pW8LZr6abBIJ2z33PKYxNNOhX0ZIHoUiS7dk=;
        b=d8ZKo8DhYfZCdfn5uKUjP3JMJLCcsrV4kJg8E2+MeHvbwk/ydZeHY8por5sWNyCMIk
         3tncqGRVm36yBnRpOWyTBW74Sx+rA0lApDy45Rjatrv6dXwKXeptg0ALOLs4jG/js/Ae
         TSe8DE5OFbIhVnFzycDxzvxldzCQp3dyDljiLleN0BKZdCNd+/apK2esM+DPScq6hd1B
         rHDdI4XX2p0/P0+pw0BH64RkzvHOAf6oU5nuVYu4SasjjpB9wADQOKXlM/hhc/hmpp8a
         7sxABRQ/GG8bSsUWu8cDEesPyYJx4FA+Qo8+rhjWPFvm0CyHP1zwJRLWEW8eaFDa/Z3N
         DTQA==
X-Forwarded-Encrypted: i=1; AHgh+RqHsZrLhgkxpmMAc/9FmmegCImhoyB/ZCqF8TIjkoU9tn9JDrljKT1FKudDbPRigfEotlNPCWtAGwuU@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxoaI4sWJpfNCC6FKNzSBoNX/IKZlwldYNAzIrd0mZ2Ryo4vN
	XjhSZAs/gIt8M0u9GsW0Xc0rndZOFn7dC0c84G5Dca8VMFskJMbDJiNFGyZ034wqw7vwfsOL5Nb
	sj/ZII678vqO7Gvqpgih86xkRkFqaiqPF9MgDXjKp/6rwJxTSHIwrEzGQxhy06qs+
X-Gm-Gg: AfdE7cknvtknkMlsgrPEk++/3UrBub8lN6rJ5KehSSTS5rLRJkfS1EIQZvyhBP5owT7
	RxyxbUXymxa+KAlpWN/9W5QXI5M/PwKLdwO1rmXT3fdW7BQhA//hdQrfk+em4abqX2Uq2w0DdCK
	3vdy4NX+PqxFJ2cBDKgMFNVvfKwkUekgPVhU0flki0P4IAYE/W9mZUoW24N9/U9HTqX5GewJ2tL
	xZ165dkx2GRcFm0F4YZUeEm7zw+opeeX2NfLbPI/bxa7ov1r3T/40BLxkyd4YGM9DzsBkM/UmnS
	jo+ZXlrtmaBK683qcjW3NCkasN1AhC7Jh/ZJo7ry+VhtF+WWmMTgbblwhmKTyg+77vpOQM1rba+
	Vbo2DK431dQ74HNigIlgtxYaw6RJ+7F3nhUZ6gue+86NF
X-Received: by 2002:a05:6a00:e8a:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-84826c1eaf5mr136604b3a.2.1783337550703;
        Mon, 06 Jul 2026 04:32:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:e8a:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-84826c1eaf5mr136575b3a.2.1783337550254;
        Mon, 06 Jul 2026 04:32:30 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:29 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:32 +0530
Subject: [PATCH v3 4/6] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-4-23b4c2054227@oss.qualcomm.com>
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
In-Reply-To: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX+qrAIFPrcEV4
 8U/k0ad3Bz9jDpXfpct1jTNiwZ21LkiuR04b5pPi8ASuz2SSBlNBmvary80N5UYMidRbuOvmirA
 w6SsgEtJNA3DtIIA16vKhJrmqrdZNxrz0omAPCBHYHFM8d1C04oSqHksVxlszSpY9DJYjX6OrXB
 bv0pE8shHKcOX7ihnfFey4aFzc5gbYLbexy75pA8N+GVL1fc7tGpeWegDP2/6gFZzhebnS8qB85
 sx90BFopYTgTqM8hmtXXB9p+k3uyznrQNjZkc1km2l/Zt/LEROqAXgoJCRMscHKWPFFH3o+wGzs
 Z+JJYoLIBaowvDafZ8IBamkfSLRomQ00+unxHZHyMAgSXzoINhdJBgo52v9UVhtA/FTIftPBEV9
 /To6q5sWqBLr1GXL+YCE498Y8vUQXIFKnJsJ05sOTZjDdzpLMA5O6+yk76kA7easy6uysTbkqzo
 aq9ffLnfq6uofxgj3MQ==
X-Proofpoint-ORIG-GUID: Jp4VEfmf10hRDdDYFVvoCWBPR5ivrIJ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX4OQDX499lPCg
 4llT1+/x1FOgEp6cupubaMIoI/cEasaxQWUSEMMHsMaEc2bUZFmQS0io0k8Wd+YmOE2xFSHk1zL
 u+XV0mavl41OFtPCzo7IPVRfMT75g3A=
X-Proofpoint-GUID: Jp4VEfmf10hRDdDYFVvoCWBPR5ivrIJ8
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b924f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mnL63iHeaYg7R5sIRJMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116

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

