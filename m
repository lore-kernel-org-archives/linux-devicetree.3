Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811563CEBA5
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438795; cv=none; b=J/ojdRls58E6cQlceH1+phnzJrIPJ4xwKuNi7yjCrYa2ajMBUEfkJBEbn0l1Mk01DAKG3ijEMQMdrXF4XT+PVVul6mufMNCvQny0V6Wo6Mq4nNTkiWZLt77HYBYHSfHCXyAeTJkwn4iSWRykxwawwhskF1mzr+LkPbjZLrCDUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438795; c=relaxed/simple;
	bh=SzBwb/XOkJe3ULmXS+nQcxJoz+wqwvo8fVhUguqWMQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IhvorHv0W2IcYRY9eT2OgcrBwioN8DUXhuadQj++hVNXHWqjOCYgxQqSk4Zs1W2Fu80vKU8mfuBA9rtObUiEIOOm5qk9a+82Eed5DGy4CQBCV4E6js3N1Sr01ionJrYpRmxM9MWavon/Xlrq4eXIGIFy80tnA0sU+mYmC8hh0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4PUmbW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBfKWOrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4PUmbW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBfKWOrK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGXsF051816
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Ifxe0PB95QnPU2t7nurvf
	5RJy7B8ceDIhZ9cv3GfDg=; b=d4PUmbW5oIRn+3vKwIsQYBU4CW5nuUGKcYQDei
	GEYwUE/jAFmw2pKJVFls2eEljvXfkzpQFKbVCoM0QBeuW2S5fWAkt1+n2HYQe/Hy
	f7JRMVzyfYX3jE79OmpY1Im65oliJ6Jq4DLadaXwm+pmOr/lBycFRK8SFn2YGpdI
	Fk7RuWUu17CQ8bpgnTFTfjQF9xHIxfj42lDW7nsV8/UzWmK9mv8OY4C7GpEuARSC
	D0FeOdlCD7K+cZiduicRuzSk0tH+yzqIek6fcvxN+/Dm0TZp/Xzxpmxhn49WTPWr
	y4iD5H5w1bTkp2utJ/++rolgZlTeJOT57Eg4cJWf2u5hTGMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1uwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:39:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06c242a34so396775105ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438793; x=1775043593; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ifxe0PB95QnPU2t7nurvf5RJy7B8ceDIhZ9cv3GfDg=;
        b=dBfKWOrKeCmoZV7iv22huA8C8FQsO2EjR2hnIQfK7nZRYZ6MqMf3EzzUGg1NX3xRIf
         0Lx3heUFV68m5AhiRz9H/ILE5+7PwkYF9O6DyNDq6SNSX/dhaOLApcf0kvDezELAZRat
         mAN7RP0AwdxwE+5qkApNVihqLu2MjAZRHbNVzOhhBUKpY/e6XUB19oIRfm5HyXWepYrS
         Tj3V/NfFFxzjJP6QHCnddbv4XYLXkHHCiXtlFial/aV+omYcLuZlsNtBy4wbgILKalSC
         JcBPcAFVS2egpf5g/7ghbWDYyMkZ8H9nIy9iyQM37H7OgjQisOKUtwcLCkyFDaamsP7+
         ICnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438793; x=1775043593;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ifxe0PB95QnPU2t7nurvf5RJy7B8ceDIhZ9cv3GfDg=;
        b=nxZv6gnmDwpdmleaSwHVuSALIOrJRS9PcoPcf7JSGdlsK77FjlCMPKssW2guCPPU5c
         gq4pvZ4Sl4wGkiFvnGc0yowXhPcqqh5ZNRyFCGG1Ag2Vo6jGZMCyk8M00iNPhq6uSz6f
         4YoMrjyhunZaYjU/Nssljv+RwFIKAA/tZQlnmkBdolJO/o/bL6KW/fV6Aq7zkqBYrT2I
         tqU39MJZpvNJK7vLswERGkLluMmHO0Mjfy2o5Lgf2fJdmaXTiD4dMx9lo5heyCfn1fYN
         7zNmkbJc59dJ3n/cUBrEaom29aXRDL+XdeUCG0Ws+BtVbKdfsj7wRkzA2dROD7nN0upK
         Gzyg==
X-Forwarded-Encrypted: i=1; AJvYcCUM8woIEzkwmc8K9JKJ/JYSTnoVNntE+CF2U4592r7yfNVByuNyhoSI0ZK+3FTE9U/xS9j6AwKbWZTG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6QysSNy37Ry9Ee4ubgsdDd5EazK+8qqHb2KlrFVAaTdZU75C4
	9+8/GWSvU6TolttJKV9Y+DNiqAxbg2W/ZquxpAiUuIZDgQiPiZ2VbVf50t2SCsm/LXAAKRJArUe
	lTun2PWSeQX8GBzQUxMaEkXBZVEgn07MGWT1Z1Qxnh/VYxRtEin/z9NCxOnOLE626
X-Gm-Gg: ATEYQzytYi0r/fD6MqmnbH+jVkTl3iWno5D03mliHzv5yrmnXGbAmAb3Q+iyikwH2qf
	R6V9NuFAmccWIWqqJW7mxtNR/eEy0rg/zJXjphlUVVRCAKdJKmz6cM1WBxqEOrK4tpz/qRUJKUO
	8fE/7bUPthYmLpOl3ZuL8OEzum8C+TFjm0qKng8GLqTpgkA2Y9HO6oKeanWKqwbBHT4ZI9evvBd
	yaNDhwD2yXW431ZFwXSQF0BeXpXYMSC9JJ80JbwsL0H4QfnhO+cSZahvD1cAbmVT+b6i3GDEwao
	a8Z3minzuKWBsYDzsc0ukv5WPqw0IFaL8/LI61llZnv+RbEHpqIQ2qKzeJwRpNuWYh1w4oIbBIc
	1B2kVk/trOFRybR98mLZOW5fgExnakfURb3KW/KGX4N+e1OhmE+/DKO7rIFEf0ZtmkvTjLkNnsu
	3ZJZVDgo8WT8HXktK0QQGzwCA1iXbr2HfGblNzIigZr1xN7c07Y26HnV8+
X-Received: by 2002:a17:903:2cf:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b0b0b5b1f1mr36736865ad.51.1774438793102;
        Wed, 25 Mar 2026 04:39:53 -0700 (PDT)
X-Received: by 2002:a17:903:2cf:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b0b0b5b1f1mr36736555ad.51.1774438792650;
        Wed, 25 Mar 2026 04:39:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b45sm246409585ad.42.2026.03.25.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:39:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:43 +0530
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document ipq9650 SCM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH7Jw2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3cyCQkszU4P44uRcXXPLRAOTlCRzSwMTCyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgCsb/csbwAAAA==
X-Change-ID: 20260325-ipq9650_scm-79a04db79048
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438789; l=982;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=SzBwb/XOkJe3ULmXS+nQcxJoz+wqwvo8fVhUguqWMQI=;
 b=6YbrueWvoRk3iZz5q1SM9qnCuBi78MRzESc0/kHRInrWBlBKVzcujqC+3PYXXMMVmO83m+T1n
 LXlgchyFPlgDORBN014kxy4cNeVSg5B3bZSUaGcZH6v+sqzfLHjyFny
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: xmicygLapSUSwDMI14vaXMaI1_L7fc5i
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c989 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cBlyCk9Y9sVT8Dj296cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: xmicygLapSUSwDMI14vaXMaI1_L7fc5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX3PMVAYJVXSWF
 mmCNSl0D/ruX8FXPF+GJ76Y6kzn4ZMKoTOF7UjMkDvql0qwhL+se5yT0jeKTvvQmmlLmJh0XrlW
 GqM+7C3SyzGu+VhglGfwoKxjkIVNT4LgD10jP9qSKIkjWDm0AeOeRS9444INBqtxm5sYle4f+aX
 MRyabmdCSdF4DWlyJfdf9+HbDish/7K2sXnwyj5C7CeeCjudZ1onnAHEU5ANfWUnfGT0m1fN6nf
 XGoBQ+PU5SpN8rT2/DznCSn3datlVPG7NezDtIJ9v4pO2vRTMviO2FzHfY9G7wUFDXNCBmNb3h8
 EEB3BWPGYSjdptFsDe9k8EgwARaLLS7zq7MlL60kdF8xbIWQJ/V/Z2jahRk2j4rmedId/Eb4Tt8
 OMNtpDJZdBWk7LTQqq3zRF3e+n9XwYyAMfaBZ3BPn4GaZU9nRL15i76p7DCq/ak/Q/qunY1gGvT
 sTrk/CaO/DmThlWxH6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082

Document the scm compatible for ipq9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index f628b1d70fa1..7918d31f58b4 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -34,6 +34,7 @@ properties:
           - qcom,scm-ipq806x
           - qcom,scm-ipq8074
           - qcom,scm-ipq9574
+          - qcom,scm-ipq9650
           - qcom,scm-kaanapali
           - qcom,scm-mdm9607
           - qcom,scm-milos

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-ipq9650_scm-79a04db79048

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

