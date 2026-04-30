Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C63FE37C
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539547; cv=none; b=Lt5uLPz1UGfvg8fmb4isQhDURtglxfA/9elPUS7qTN9gCZ7fRsu0jNpbc50BS2E2n+lBFx17MuqLkhtPzsWFwnkzFHYuD9VRj4kkN51FompGt21krOHZk4COgYZPuRpPSx6GxEcdrPs712nD1RrcFk4RQOoD4DEy2mR5TraRxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539547; c=relaxed/simple;
	bh=Zs3IMLtqAkbwUHAf/QdAsoBDB/l+4Bu7+92+/AwBcA0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pDT+iR3f0GlHUxtC7VlmQKKd1JzqTB4oh93kSCLQZmvxPYAwvJoAZ3eFzn9LEZ2g1O5ypQgstEzgXkyTgL8xkeGYRrTep+kN3NN/bot/bhCiDXJqfvAo9vMXY9cLss54m7GOamfFDoM1t0f6+gj0l1RWKcJi+hg76WvqqQOypXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCOD7gsP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dd/BVa4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCOD7gsP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dd/BVa4s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U852Ih3636710
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qyhAeQg1B8d00qwgB1zKLT
	aXgj+2kYZznOQT2W+FINs=; b=oCOD7gsP2jIP5etYAsoVl/Mp8S97Mew+bNw7lG
	dGM8nqln1Q6dnVvyJ7ZaE8mi3OfNaGLmM4TwDEAXGT6k5a3CmLk2P/+ndnc4kby9
	NKzXGrEerJD7XZqVXDk5xjLUVXDmnUNqlbrA5srt714GErJFz1NPYwN86R7a5s5t
	j3Wm5FPdzjWO63jNfY2vyhBX8EJgh6LbdVP7K78QEFozMIgZsaOkRFNBVB2PBrx7
	Htt0hzbJiCkJS5wuBIpB8a3uuscp3kKxjrTmxB1/hHUzSXbAxjd+NfhyWGC9Yai1
	8OtbY57/HCNRB00VgpdrC1i6lVSz35d8iX5H4RGT0053qhXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q1qg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:59:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso1821230a91.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539542; x=1778144342; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyhAeQg1B8d00qwgB1zKLTaXgj+2kYZznOQT2W+FINs=;
        b=Dd/BVa4s87APnvSHvg1ZK6Q/1mObEYsWlwg+ityoooAxpZRfRbinTA6XCVcFvl2dKd
         C0pn5mUSA2oTpqbGS5DvGkpC9rOYMtt5x1FICRavQom6IZuhX4JO1ny2QAklvL7Fpp3b
         ZwOKCFPX71VE7es46e5mMBSqMzjAe78GJj7D+LRL17h/Vy/a/fgP5ZEAT36FWqiyckf9
         VDgLBtd2mt+v6E6vafpfMibHc9r4g0Zx2o2pwB5odNjQsYZIhOmn2/s5FzrXIDdcc1TO
         Y3NOlbL4z5x+O+zqrGRc9aKdJtDlhR7NcbA2o5zw0TEyzGnLA7fy5oAFoUuFcD6Bu+J0
         gF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539542; x=1778144342;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyhAeQg1B8d00qwgB1zKLTaXgj+2kYZznOQT2W+FINs=;
        b=e05ohZ4ZAEy+AAAeLocfcklLzKGHJlOOXvHZ961MrKwml0y4VRr6Di9C5cqhQG1B1U
         VWozn+DT/4BV+F96c/hmcSwAF2+W258GHr6PS1EUd8OEhVXg07E5jOHfZTH+wa0b/Dhk
         4G1eYg0q8PSsdGdHJzdEV04SEHFVAft+Se/JS06HWgTn/GS/N/c+lQgQI42zIIhmJCIa
         AypkeFNakPXAX6y7WzzBPKvGfaq9KOJPCyhIkL5T/Dn36BP8Ek+H0U4JAgaTizDu74It
         VhK0i59qIq0HMwXKABWp2SHhm8XknCFbd3CiU+R+vVhB/8Mj1vlkzSsLWCH2KO+hGKnQ
         N2Aw==
X-Forwarded-Encrypted: i=1; AFNElJ9YW7ATVlWLkNSuxnEa8yYPEbLDnp4jiuaShS1lpAZenCKyamCPs5SBDI0pP/O6KwQqB+/izl+5I9Ds@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQdSdmLP8di/DxNdA1TIXwx1JlTQsPp0SsZYNDUpzNvKexEX4
	hEfaFWhuYRDCP52ecSP0gpIj2yieJfg+S9SRqWA7l8u0cyTtr8lAjaVxPM9cJP5Sf5kSm7lTxe3
	7HS/wdORJ2Ve5NAt2FMfuR9sHYBfNswiVYI4FYK8F1fw+5kLTtywCBUQ2reIY+QCcZqo1FHz+
X-Gm-Gg: AeBDietR9b0j5JN5PUPTInJO1VtdysWeF7ZnGcGmPN8Td3AMr7KX3q/9UT+Y6P3qZLG
	YcyGiEKbwKCrvBcNxOB6I9yIGyRcHW2cKZ5qCJ/v66WMyzQcSCS0v3kQ+Yasv9+I5LZU5cj5AOJ
	4mgjxDfNTwqb39R8Vw1ECXRN6K4cA1XzIvVuFFkni1i80ve34h1V/uZAyRmajo6Yiza1lSZIu/B
	brHaqhcu9VankI2SarlQTuoejlTUhYbPHTzWjm3IleBYdvbpPZVFSUDhx1RnJo0a/s47AnGd9NA
	6PeSkcGFxD6g6SDpErcpthRfV4bfCJrwY6o3mmeMWpzi5GDXN/2B+3sWvc6jZp3ZirMGW2txHc4
	hNIvK5eJiDiLTXXaPXlhB37WPqHhQ68tXAPgrkXizwcdQ2kbCIhU=
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr1696897a91.14.1777539541647;
        Thu, 30 Apr 2026 01:59:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr1696873a91.14.1777539541160;
        Thu, 30 Apr 2026 01:59:01 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:00 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/3] Add ADC support for lemans and monaco
Date: Thu, 30 Apr 2026 14:28:55 +0530
Message-Id: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8Z82kC/x2MSwqAIBQArxJvneC3RVeJENGnvY2FRgTi3ZOWM
 zDToGIhrLBODQo+VOnMA8Q8gT9cTsgoDAbJ5cK14swFb2zCrGy4WRxKC2MQpYGRXAUjvf9u23v
 /ABgRzfpeAAAA
X-Change-ID: 20260430-adc5_gen3_dt-f0434155ee25
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=1351;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Zs3IMLtqAkbwUHAf/QdAsoBDB/l+4Bu7+92+/AwBcA0=;
 b=+KJv/AoS3GKdBpSIgZrb3it+Fd0drlAlw3uA95+37BXh7xxwR5bAvYPzjG/b+KU5qAOxJjlTG
 vkpsFnWnlK+AsUt/kQWi+boNDb5NU+xCl283kBaG8kYpF/oIwz8H+QS
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: GH8OzuBCB31tITqLN2_BmJ4HhvQO9qAY
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f319d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=D-B44Iz52n0xy1KjeIEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfXyOzgZwXYaIR8
 gRS5oGnrWoa4R7j0IUcTGwDN6rGXq06YBbLX0PK05MobQ3XutpbJBFH30YzfBdJxOv7l7Za/Kyb
 +pjL7F4XL8NwcTx7EFJVmXXfOmxz485srz4Z1V0RYoZ+uFFLaSA0zj04x9ilVrvi4WdWf10W5VT
 ecQbkEA7ibCPKL3Q6gyMiUTTmyus3c1jlO2f+sxyuWEbzNlNl0u99p2XwFCtWp1TICsQdOScf1r
 uZ/eT2CeuSzYa8nXsOyKGb6G9oH2iTYwV2LciqNaRiunyHLYGkim5lWeiwIEYF19HV1OrI+qqFL
 A1wPU8G5OjEY28gDn9HzV9LTBq8pJF6x6Y2VQAXi1x/gdOfA9DgjaMFbBg3UINcer3zcxb7vGuP
 I91QKZC7mrV+qekCtn+f3syHLFZR5ruyNEJkGRfRYIkM02FzJBANxwsj6w67nfhzUQxVPvBLUfj
 EJdVYpxExie5bIVFY8g==
X-Proofpoint-ORIG-GUID: GH8OzuBCB31tITqLN2_BmJ4HhvQO9qAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300088

This patch series adds Gen3 ADC channel macro definitions, with basic ADC
support for lemans and monaco.

Patch 1 adds ADC virtual channel macro definitions, which are used in
the "reg" property of individual ADC channels and also by ADC clients
to reference channels. These are a combination of PMIC SID and HW ADC
channel number, which are parsed in the driver to identify the intended
PMIC and channel under it.

Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.

Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Ayyagari Ushasreevalli (2):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h  | 88 ++++++++++++++++++++++++++++
 3 files changed, 224 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260430-adc5_gen3_dt-f0434155ee25

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

