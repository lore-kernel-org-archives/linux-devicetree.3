Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81637DEB5
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887682; cv=none; b=JAV04jyTrPityPLuJsXO2oKuRBMm4VLtn6BZBGybuKdHA7yoz8fQPblI1UDoW6KC99veEopK2DANRjNykm3ZYMjTDpTEnrHwtD8ZIDUgoWpNzQBoP5fbJBU891N/AcSO9HlYJtaki78XDI5DQ96vHDmsPZbhg/jL6aaGfegkEwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887682; c=relaxed/simple;
	bh=6yzycqaTd6zO7vWwqNnDn9oASp2oYwGYeee9ZCMKSYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cZgutrRWq8mRgAz6yO9Q7/ke84Hg3+vZxdzTRIk5n/7CZ6tiz/t29lepQjPzpCevD+cekrB8UWv6ynf/UAPA6kWNJaCje+qlxA79KamO31muiLcpENYhTXa2lo2hUs7HvJMTNbVlCLazeueJxKZECSVg1Y/sXlnE9hG5xlG0ziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JoKyRvud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jfj4XNRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JoKyRvud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jfj4XNRj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fQ5J459395
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 09:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ufalV60YTG3i28AyLmavx3
	qMo2IMwPvj8r0M1rSF6Jc=; b=JoKyRvudM62w8TD2trJxtFcrdO3sBHHrkWHqMC
	U8ZwJ1J5C6xf4BEoVzxviZ8Qh8PE8iKgxqcLWxTp9WWj/R8qkARXZzoYgU6u2cXT
	paT5RpKAc7MpFrCL6+bqUyw0aqK4Q1pxGgrOlqHwv8He3JrhgW+08xo2/kNdTRMB
	olwEz4OYQEKtrwGAaCBRBv+5y6CMeB7nrcQvVjJGKr+lGMRJaJbSm4s3P9xwhfQR
	QTEc7K+ktrnoqCU79rWBbr1d05bHNbn6G5EcvvKD/zRBKv9xOBDSbDPxCAOAXihU
	bP+1bQPhKipD2TBzj0oNCdH+dusQvXsXvdHptxU2vtfLQ0Dw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejn36h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:41:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e6ee9444so35044905ad.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777887680; x=1778492480; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufalV60YTG3i28AyLmavx3qMo2IMwPvj8r0M1rSF6Jc=;
        b=Jfj4XNRjH3zx8p1ubcvtmeI/hxWQLANkTFSf3lmK3QWSrz06Mw8ifsjSyWktVmV0pm
         vy32CWbuJD/mVDIhqeWkFhlOO2Wr7bbQ+qWNDdqdZJRMGmV452Z2C7nW9tWTOWDkUK6x
         9UQ95Q9PDf84szHWYfRF/a3rDmDbpDAN5jrcTEGRoFKt+l2YusTgg7hGcyWZUHMLTZRY
         2TiAbMF1FkhlpKStD0LZ3Tpk6wECO0Sz2pPkfkeB16AHRxD23S0SRGzsLBXGcMlHE7uA
         a1gbo+6tQi9u/hW6iYRQBnS50pqq9Ke1BzynAF8TkhGoC/U6P03MB6pM/S3km+giCD0X
         ysUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887680; x=1778492480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufalV60YTG3i28AyLmavx3qMo2IMwPvj8r0M1rSF6Jc=;
        b=LwCy5/vDy76vBBYM0oxfPbAYWDyhJYk+XzjyftvQ0hVTqWIs1LJSLyABj2/0+RpDwr
         7ow1xI5IYOxprnU5jXvbXhFvxcejM3UUBrFEkpTLc1+8s6plyIFKxQOTPsvXqL/5eB8X
         tnw9Ky5ElXnZyW/zpSJfDfw0VobGnrN3y2cNIO/38pCYqFDQ4DBdCIUm0RtiqAFLeSKk
         aUbD/47SaseMldbxu5r4x/FixOVcgrEjG23TkN98VxcTw04JOMJ8mUu5LGoC6BASpYmo
         f7Yj2IRJBfnky7ggjLp2lM1kTbH8+zjzacm5hRLsZOQ6D1zqhT01iyMzYGmEqbSAHlMq
         z0LA==
X-Forwarded-Encrypted: i=1; AFNElJ+fUwMtef3h+pT+LWyikIO0D18DA1FjhY60mtf4UPoB1QvXa20uDd5Vz+kJsxfE4dP5Y3MFr5k5RdYx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/8+pz2hvi5ASpt27RqEMzZvisGUohjqaHFZLrBgsfM+p60aeV
	vv/9QMWVpGQ701r8fsXB/WpD/GwjYfC0CXVCi2/fvVO8WPLqU9J/LMP5np1xl+LEaVqnVCeBKCn
	jp5og14LzG5Bqf3g2yM/GSU67CwwcvnD94YiwxAmPxk8yN/KFbfjS4Y9xRNH41o76
X-Gm-Gg: AeBDiesGmVYsvQLW9D44Ohaobn18hC4AA98t67lPMZo87h6CVsfL5tgJ/A+z4iKpe6E
	Tp+fETXpcqzckjpyDF//EqJxlk/aani94VefR0ciV/FuUPQNE55qMHMmtyX7NoCwm/iKo7wVPVv
	VvCA7mJ6ljy4o2kNXSZF/kjiSjVz3FwhSjPOaubCmy8fFgnHK6SoqbP9Z6IPn7IODnLAfT1a0rm
	cz0aR8m+Adq1cMDCyK7DaW0WA0MJUpci9FEEsfgtbnk8bF/bSi+7jHrn+Zjp0ZUK3z6aGVIA2m7
	LAQkBO26ZAQrDH+9AUCBKcRm1Cl5pCm9jAK+RPztZuL8rPEUAW+zY+Xm3mxTstq2q5xS6Kd5QBp
	/h+YLXRoRGwIGXvmR3Gb+VirHuk2qZyqSNwQDZwXlL93x1NATMdPhg5Y=
X-Received: by 2002:a17:903:2f0f:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b9a42aae6dmr149433355ad.2.1777887679872;
        Mon, 04 May 2026 02:41:19 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b9a42aae6dmr149433135ad.2.1777887679348;
        Mon, 04 May 2026 02:41:19 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba038ae95csm58985045ad.46.2026.05.04.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:41:18 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add interconnect support for Qualcomm Shikra SoC
Date: Mon, 04 May 2026 09:41:12 +0000
Message-Id: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhp+GkC/03MwQrCMAzG8VcZOdvRplOYJ99DhswudUG3zkaLM
 vbu1nnxEvgHvt8MQpFJYF/MECmxcBhz4KYA17fjhRR3uQE17rRFraTna2xP7Jw6G+/IV1uD2EE
 eTJE8v1bs2OTuWR4hvlc7me/3x1RY/zPJKK3IVrautaXOm0MQKe/P9ubCMJT5QLMsywcSyvAxq
 wAAAA==
X-Change-ID: 20260320-shikra_icc-b1fcef45122d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwMyBTYWx0ZWRfX5c+ci/hs5PxV
 z+z2by1tmyHcczZr6rfoWZE10LtdMcO37uPHRsOjhNWDI157dU4ZoQGWIg3eYkgsu0jZwu4l5g8
 vWSzlhhMoMCi91KJxiUAK4nbR6qy6SKqq3PRqx5w5sa6OSbfUo+1GXoAi/MYxJVyWPs9eQoj+vc
 mlIyHTwCEGZRPg2TZRVZhnL8yvYUtfOl+AIH9ECAI56ppTKqhG42slRF+0+5kJi+vEwTbNwrJQL
 jJ0PrclmNuXgy+/3lsUQXUdj4J7S1PbeB4sd0gmTu4CglrCTswf2qDWWGHL1gnAAI6tfpI4yVRA
 +gqxqBkUUb3tdEcADTUQW7w08lSx+Zk+jBe2XTtfspKf2RqSPY9e8HUgaVEHT4EsnUTkHQuKt65
 4mZ3LxJd7i5RVgbDolddLaTPAMZ3VBbORRvwAVJYmaivBO4R+z60u9BUCvkUsAzauBT2Yo+guHh
 5yT5cuAVTooNzok+bwA==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f869c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=OZudk8sDxFVV_aZhaj8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: WNDDdxmes6sxSsi9gGwIW4d3fVAZJ5T6
X-Proofpoint-GUID: WNDDdxmes6sxSsi9gGwIW4d3fVAZJ5T6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040103

Add interconnect dt-bindings and RPM-based interconnect driver support
for Qualcomm Shikra SoC.

Device tree changes aren't part of this series and will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
 - dt-bindings update to disallow patternProperties for the NoCs
   which don't have children [Krzysztof].
 - Drop the redundant clock property checks for child NoCs at
   top-level allOf:if:then:properties: in dt-bindings [Krzysztof].
 - Link to v1: https://patch.msgid.link/20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPM Network-On-Chip interconnect in Shikra SoC
      interconnect: qcom: add Shikra interconnect provider driver

 .../bindings/interconnect/qcom,shikra.yaml         |  134 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/shikra.c                 | 1837 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,shikra.h     |  121 ++
 5 files changed, 2103 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260320-shikra_icc-b1fcef45122d

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

