Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DE3EAC8D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065484; cv=none; b=s1GVz4jRdc9XeYm9b2PO1uGE3hPzBJBznZXL4ezGXT120EKIKSQolUAmlOiFni3g6c74YHz5WzwZXwNGkaQH5Gg75bUNJlEeTKZNgD6xYMGEOzc2ok3V3GhkeA5DocnEphSXXTLYzHco6BmKNT5vV5a9fA2AUFVUkUDn9UF/3QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065484; c=relaxed/simple;
	bh=r2fiEN0lX6+xiJIlqbZ/NyYeWC2GmPUInxLRy8wHsQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWBKMuYT38Mwjxpfc5abe53sOEt91xDzCG42FhAKJw9dczNPX1rFaym4c+SiVnHOX9sY5UfS992Z7RH8PqYob4mL4gQKr9913H16c0AHJXW6vLwOWW4x4JVuI9UbJJf19wwUVQ+kkKlyeiHNoBptu3+QG4qh8aYdAqVFBrk1I1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfPDRtQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI0OTkJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfPDRtQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI0OTkJ9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKXn34119185
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=; b=MfPDRtQTH/Xu604d
	ueoXSptQbqzX/KJh+1NR+JgpPbyRR3wC7Euf5/g1Eo/W2D9PT8MkhDcZ3RxlFLjm
	oAfk5JwCr2A4hP5M+jyMN8g3hB00QDB+fyYDnrAzjtQQxVv1qILn2iEmUm7u0dXk
	af4olwCmG1L0UjEIcV+hvGmiqPzWUO3M3SzibS2uowkTVtc9Bk3yNCnXm5+Ngh3l
	xynJWJnItlO3k6QNdj8eBQUOUT34wczj6/TGIJVIG0055tic4vtgbitJCTl6yMus
	n1KgIf151uXNGWYgMgbcK1neBLrxicDg7q+hM8Y0Nvr+P4QN1XdLpGcfxP4weB+q
	prCU3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rch19k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso12008255ad.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065481; x=1780670281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=;
        b=FI0OTkJ9dB3fM1RHSHzN/eXvhrApsQTvdg4xrgCRjKLdXAwmyAcZBCn7o5qxZgF59a
         cMrDkKaPAuOuTWWrkG+TK0jetwGemEv3/AjbaxIrEMkPbFDYlWVh+gEcWFjScsN1fMc7
         jOkCwlqJi1ENl6lxkP9cgZUBeDP4DIsUHlUPZ833dyFxyfGkRbyeK708tZC3koodVZYQ
         xdko1mvXRj0G5ocq6sGR6bgZNu7IN1kIlAfcUrtJwMK97oa6YC9ZGm3v5pJbQCVcUf/r
         Gv7HJVB+gQ4/T1qY4ZXwA/CDd9Bq/hkvDfJFzPZRR3du/6cDTgbScswJCf20KM8X7XA/
         BeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065481; x=1780670281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=;
        b=HjQfSYOqF23uxfMDh7HpNRA+W2SKAKRoZChR8iBT/YDYoXmGc1SIUx/KdNqvOwUhvk
         f7f9A5o24ZX7kqj+pR40wOZ/YbZ5KgcbF1ZDd6uuUsuxe+N8ZPNRwXBcV7Wr52NzW39/
         sRq0FReNx9mrKoxIa6tdplPmiYqSLPc6kFbTilFPUz87RgfVdMeaJQGRhokudxEsOcyI
         GyybRJOcewIciCg1JZz3fHsIqPRweAtqFMsO2foQxxozQDgG/UiOerRyaz2t/Ca+z+qd
         Z6DAWLZ7RYxB+5aq1fMYhgBUrWAwnzn7ENO+KgCss06IWV4qLm/3hxEH/1I19SLYEdFi
         JhWw==
X-Forwarded-Encrypted: i=1; AFNElJ+mqFN3jU3hvmV6x31+7T7xw8MaTfrd8FGjAQvszRicoIDvGN7rD8cBKydVD5COdRpNIUF4BwSAUwkk@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWkik/YCrul+BvoGdqYuFLeltkrdKvdmnmbw++BhbRy3/Wh4y
	YJJByGb7sd3oAFNhjW2CI1LltraQgmFEiTw5Y30FtTVmSLmBD48GRDqmxYbX2/JYnDHtaXukaQp
	7PHm1zgywpZTkepZWdB3TN+8luooqlZQW8K4JfsjsC1qreKmKkDbjgDet9eKFQ2u7
X-Gm-Gg: Acq92OEWkes/ZjPuWwXlbBpWyFtVhLjfiE/RakQFalLKwbBLzEgRHkRd1r6qggwCgMI
	7CrGkJJ7JO3Q7/pbwkFa1xse2oSsiG4y31z8EkuDcp7gHT3LPFz5sGnsmxHbjH33y5LeRNa6LZL
	cZpgWN4tcGKznE/3CKmoLofDU9tC9UbueGfGYIMjLF5drFoc1EiEHNfg3FFq9wKgWRil++Cn7YV
	LY9fKvDdec4sZPpTlxtNDUW2oLbY1HTLdTp8NwJqPHvFSklZZ2KggNrORsy/U7fTV/d8YDsuJL+
	pia3vXy6tiRqzjOo0ypzTGuk6k8rK9MIcPDPgORbQQdX8XK6mBK+IqCA4HzWp6SHu+X0zG9VWvV
	r/eA5FDvl2t8JO5aQ0CJN2RWMB3U+ryrrRApUDY7ALxoLKoVWpePpM8ycA/K6RC2idg==
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr790695ad.22.1780065481346;
        Fri, 29 May 2026 07:38:01 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr790235ad.22.1780065480858;
        Fri, 29 May 2026 07:38:00 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:00 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:22 +0530
Subject: [PATCH 2/6] dt-bindings: i2c: qcom-cci: Document Glymur compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-2-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1050;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=Kj0qls3u7hmCqRFLqXAWh/BtkU3k96MxexEBHy6KH/k=;
 b=4G196P5UMnVLRk6IVeIsblLJ7Iv0JI1avhJeXvy5MumHY5XqZFCWsSHS4jdJ5lwUrDTvk4h57
 XliJ3VwUzn9CLdi0zLcQugqmWdTBhUYBPauv31yda9wrKxYiCSgPa6B
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Proofpoint-GUID: zGkWIaadcDOtlZb_TA2_t0MsYQjQeyvB
X-Proofpoint-ORIG-GUID: zGkWIaadcDOtlZb_TA2_t0MsYQjQeyvB
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19a4ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfXyhkXUq0A3eqs
 mc2gxo2fQ6iLmXuE2V5uLXfAjABsNenS/F+ul+P0hJEQuK5oDyx4VecM/tBTkz72yGRmySYqhPi
 g2q+CvIQJafCP4OfP0X6ghPVImxuD2F7fxoSkE5fr1ytVqLf/+oKrRl4R0wFYjPbhfpacq4Bu7P
 z3s0V7Qoc+aU588aJ/5hgRp8toD7mZ33TnZ4lwSKhe0pU4LzjYlT2S0/Q4mfxRoBJObAuPHztIY
 zQL/oDs2YMDMj9YjXoP8KNocQqqJP9nfNn9r13LZB66I6BFEB4tkfKjBn4WAZwJpZ/9KIo/D4XD
 CAmoZY6NhdQMORkurudDAQmtUWPkhhKeDHiRZpRLlb5gaj0V32RlSQ5IEo9Kkz2L8SyIwTL+/PW
 gyVFlod90FKSM2d/T7epfP/9rhBlgC6Bbm7/C61aKbG7KU01CQkksY6Nn4bbfQJdJbIIHUYFfxY
 tl+b8/YgaIzsU8nkYyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add Glymur compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1d..53aefebc02bb 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -134,6 +135,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.43.0

