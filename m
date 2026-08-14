Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4F139FCBC
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701113; cv=none; b=ZZbVWa3ERv+okJS9em4cntDgMxq29zzWme5m0mJN8R+S/oUowK6vpY20UX/3wxJG0oyyz+q8CHYLLKuloge7TgXEffx4zfl3aMf9DUtnIPjf+GCKI4ocxURSZGHu4GbdwFH4kmccaezo/YHF60tX4YbTIgZEYg7PxlyXL0LYSc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701113; c=relaxed/simple;
	bh=9rCY0trFA5vvumUrpeAIJy22vaSMb6byDQ3hW5wJ+es=;
	h=Message-ID:From:Subject:Date:MIME-Version:Content-Type:To:Cc; b=C0ybCe7ntsfbTbfNyLfZQchJQSwxC3OrXU4GcXE/HWzXHaRvKkyrV7y3np9HTHi3/vzihulf9w2lJt7r0Ks963Aps+BJaBVii/0LTfn3pcRqzw1ovP1awv51ug30sZBCNliQgnPyoeALOJFG5izZkemD3BIEM/AMFDlwC/nhMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDFo2YrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsN9xFYr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDFo2YrJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsN9xFYr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fNeF1079085
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dl/4pbaUh/02l4hy7pirGK
	zvjFEIIv/7H/wV3RxjyzU=; b=CDFo2YrJTinwybENcklTQ2Nf5af7qV8ODazl7t
	GxFWARuW5NPibZI+YuLiqNYr9UaiEjDeui5UskwsLRuo4dhMdETqXGpbSDYiQagY
	SNB953WS1rR0LoAb6Ue5a0nSqfx6Omx+JYfW5Ut/yxmS/LGUuw0XDrMPtRCq/sDn
	/CRBZ9zOkPWERaB2HKst9Nefl8qMPTqcU72AhkRK1ddkrLwSzAytzk+pMrV481Z8
	Clnc5xRrgvgR/2jR8jQXLlS7pIK7x/7ogaJfnu4CDx8hLsbKcjgSbyYUR3LETGs5
	LVCDaKNlX62oC7CNwYAHkcJYSvygcFHcZAwIRfUpTkc62y9w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexgkhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:51:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1407213a91.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786701108; x=1787305908; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version:date
         :subject:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dl/4pbaUh/02l4hy7pirGKzvjFEIIv/7H/wV3RxjyzU=;
        b=CsN9xFYrA20ex4RuzvUz9J6vJBYyEDHJS0exjx52w9brE/LvOj+9hT0uXlK0685l78
         QaENd5dZuyGAHlbjfLTbfhc27ONul2tmz3tzD5Sg+iO+otDF3HYLPZYvkVSptS2SfblZ
         4aoOzKKNqMmHR6a7kujWxnkKfISQ8ND1nqC0+/WBZ7VOv3t0XM9wef9B0E7mS5t9UGjH
         M90yKzm6XMQK0XazWn9U1890AMM3QRCTGzeqwns3bFoMdtdjvELUzgdNcPOOaOn7m9L8
         WZel3OMPNe9HEjqGgvN+Q5NtvJzLQEQqDu2Ko7tH/GVuoJOxKsBrcJfBhQxxtcCoPt4A
         D6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701108; x=1787305908;
        h=cc:to:content-transfer-encoding:content-type:mime-version:date
         :subject:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dl/4pbaUh/02l4hy7pirGKzvjFEIIv/7H/wV3RxjyzU=;
        b=blqfbRv7wUhO6Lev31XGVZZ+l7lnpMPHgm/qiKkLDHC4JGhx03cSQ333p54QLrXiAg
         6I+OwmKQkG/P0J5Z47LUVEPbmvHSLqOw9LTkoBCg7+YquF8o1u6vMmyaUe5VJ43F76qO
         VNZoeclSUShtGs7T8HuOwRAb3TP6zfWzatvO0rSEU9G3MYjpWbJJHWiTWrugyh5WOCPB
         7Klc2ipqbsc4n2Thyq75HkAnJp+4nEVga3azMMz8w6yyOSJYaKnNjt48fSzF4jlcl6TZ
         3652JWt8XajdVnACr4uTK3m7EOLJXoJz8l17ECuFQ8ZL5ZI/JaiGBC2e3XmsKvoujZG4
         o5ug==
X-Forwarded-Encrypted: i=1; AHgh+Rpcek4wsy3RzjNmpAn4ebGmvlgoCdmG0X98DCwlqimazghFLJbySkrds57vW3cixzaRh3hbtS3YXcAt@vger.kernel.org
X-Gm-Message-State: AOJu0YwtJTjN6CwXfVQVDOlUt2+iCyxWIN6NzXdpP4i1hQK+3e+H/aeS
	EQx4Uow1dCXw9Wv6Xfdovm3b9gAdJTjnxZpA2aIQIpX4di0j/DLUSAIAwreS3rOA5iuF1pZuLxX
	u5dNjcT9vJYObFPuj2rLaM/tnmmka+w7/JZg3tui4vvvr/Ux8Dk+tjdEwehW4zj8E
X-Gm-Gg: AR+sD113uily2unzTrJC9VhyfGNzNeNCv4RrRZT/bc1JzD0rtGYYfJybvF8o75mS/s5
	BNGIxFqOuCg3/VUiXRrqzeHdRxm7m7zo9toS38rTl52jr0LhyYKbvKGvzGLKPkQsV4j7soqsBLK
	QZxOrChw27F8zhZ9QpEtdi/lmld1Vi7eJqACagTz0+CgSxWQyLdT18lCMVnVtMT5GDoBVKIVeNK
	fTPH5GxhNi3hVBA+nF/6fDus2tuDfKvtVSbFnURgph2yKMyTjFO/qrB5U1cPSuhiLnOzaitp5Ni
	oL8LnQQ1wypfvG9bGWFq08a9jJUPaly/TFsUw0D1lFh1b+pNHzr/8XWR76CttKtxKdQNeb08ep5
	7dIdMvUke4T1klzphCHqt9a/wiatPqTgx
X-Received: by 2002:a17:90b:5745:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3933b7a6986mr5464547a91.8.1786701108137;
        Fri, 14 Aug 2026 02:51:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3933b7a6986mr5464489a91.8.1786701107711;
        Fri, 14 Aug 2026 02:51:47 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea995222sm2073160a91.6.2026.08.14.02.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:51:45 -0700 (PDT)
Message-ID: <6a7ee531.797536ea.65c65.2705@mx.google.com>
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: qcom: Add Qualcomm MBG thermal monitor support
Date: Fri, 14 Aug 2026 15:21:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzlfmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dykdN2UEl0zQ4OkJAuTZBMD02QloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AzeaaMGoAAAA=
X-Change-ID: 20260813-mbg-dt-610bb84c405c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfXwBxxgGC+ZrIx
 Df2G6SUHIes7nxBxtgfh/zmYAvhtDKwqcz0rFQ7tbEFSTqWxv47RDYPFYzUHTQ7CEwq5wt6+J5o
 MkpP25nowmBv9y4ACM02xZluRYghJ24=
X-Proofpoint-GUID: KyqVl6fsvCs6cbLI07mRecKfjWsIAQ4j
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7ee534 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JjNNOwtxx9JVdBgQG04A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfX/hUJr0+Fifen
 LAFhF80URNldUB9l8eeHeqFFjcunMTnXfox3ZKrFiWCxEPGATSyi1vqjOTgVp+eULDIAXrjD8b5
 Uof7ZijaU6T6W1b64E1d6fcqJwHN6oGd5j+CMxM5Y2QOSHbUanXTXEpPkLC4u3itVTuR7C3hg2C
 Z22sVWS5iMx3td7yOlIYkPU8q9wWLCqdIDjDHpqHaxl4vFg3fdQvLRBQAxwKs2jTCQYTZ4wPkKN
 yN9lKug+br5sVQvDFii47sqEaWgI9u5YB+u0V8CZIW2Cu2xBa8ug8s4BEwgiCroQ7Xwn1eqrSPv
 /PdyOGyRmY5h8WGeIMc2ecSvGXVTwXFGONOjIIpP8fGgbqbO+W2ecWC6VIU40V4a3qbJcs4U8Ik
 EE3RFS/Sahxqz0INsLium7pASp99dsMPZ++L01Pd2DsXEG6et0mQop2ayY3vIHcd8So3Z0fIHqx
 fduzgke9L9cZM4RiLLw==
X-Proofpoint-ORIG-GUID: KyqVl6fsvCs6cbLI07mRecKfjWsIAQ4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140075

This series adds support for the Qualcomm MBG (Master Bandgap) thermal
monitoring peripheral found on the PM8775 PMIC for Lemans and Monaco.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
Sachin Gupta (2):
      arm64: dts: qcom: lemans-pmics: Enable PMIC MBG thermal monitor
      arm64: dts: qcom: monaco-pmics: Enable PMIC MBG thermal monitor

 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 116 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi |  62 +++++++++++++++
 2 files changed, 178 insertions(+)
---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260813-mbg-dt-610bb84c405c

Best regards,
--  
Sachin Gupta <sachin.gupta@oss.qualcomm.com>

