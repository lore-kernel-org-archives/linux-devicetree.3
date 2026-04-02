Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C737CD21
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110575; cv=none; b=Q4EHNdJLAW6TAuxF0wxnqNsrQ9otw1UWN03HZ9OuFa9MicghBzlG8mfCzoIgbr9zTF38okVxsrseSIUhgW2Ffc8MOfIECeTU3X0pKN+L26cLLx7rCCnVT5ITDOHD9rksMMUIDaG26Ew5GhBx1vj4voU35InnpJS9PqJvGKopbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110575; c=relaxed/simple;
	bh=Gg5vcc/3RVUkhCzfHW9ClSxYoLFdUKduZUXpgADLaxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V3xjl/TViAmiphv8HjvlAvbaaahk4bdjTQKXj+0B+suDa3Ad0kc+HQkvdSKZyeXBmeGXJe6cM48eAYV0Gug7KVwap5VETnEIk7jL0JY6O8V1q+guyFQ3gF7TiuBqu+YtHe3iSrdhhekk9J/vqk4nBYOb1d+bpP0+RPIcBGlh2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpkiiCCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BX8jSw47; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpkiiCCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BX8jSw47"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4M4o3044352
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 06:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mPXcXgDL9LwDyWtOO4mR1I
	5ylhidkezebiRyWUGe/Dc=; b=mpkiiCClfhcAZN65/rew0mZFXobfwL5wza81m5
	XItLq9DnoTd8W63BrJ+/Q25LEt6KVwXL9ObeoEGTDNGf9rjbtqhdRygKfkfbvYCR
	DdAt7knuBEY+8OPTMKGswo02BMF6NVk5F4D9darb+WPhoyvmM+pdEkA0Z53X42eJ
	TPZBBH59zQSawhS1ihSnfWbzUZBRvq+qQOATD1i2W64y4RksgPcqvA0RN+bLHtV6
	XLVuxvMSRFlOh2EuB298CD065RWJq5vQuH84ixpA2375wHGIHBcppIFsD8liGZVz
	2JMee+yMU+vVpn8XkMR8/QpDygXi6TgMbXCm5cVNoYdvpg/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483u9nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:16:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0bf2b3879so13550865ad.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 23:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110573; x=1775715373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPXcXgDL9LwDyWtOO4mR1I5ylhidkezebiRyWUGe/Dc=;
        b=BX8jSw479mjGmzMDKFudN8Rz1iiXrOtUCIU0YeV3XcQqZ6Gbp1jjNfuUlMwIjtwUYE
         PQtvOJOCQcoj6hT0SdABcbF8jMwxYhdg5jM0MawbH+RP1Zf7oR+yH8cbTb0jcP60ZOJT
         gj5njttYrH03lGGHFp2PntobDq2FzY4iKiyKTM5t949ftcIFlj3GjbvhQWoyv5h2nBtm
         BvT4kZHWLj4/3ZUEBuoYV5/cNYJkgeLYfxa+Arf5LZplVB7WFLNN9zfCarbkm5WMUkOn
         1EQnEG3U1KRGpKccsUzukYrZ5OgqNa7YQgbCRNzbzJcIRebKN6ZvD7gsVv2DaiuZulha
         WN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110573; x=1775715373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPXcXgDL9LwDyWtOO4mR1I5ylhidkezebiRyWUGe/Dc=;
        b=XaeqTzys9QoUc83YBjTgdNeyietLwry06w101kELBLI9xwxRU12lR3DYRoIoMMK4MZ
         4jA3Ncjk3cG/lbSSMnTE2prK4q7raj9szTVXcnnqWjf69nDpMPACdt8fsnVt5Sc1acBN
         EtEpzG4F0Ck2rGKN4zuCOY1/pruQELJUwwOvHgw7T+ovk7XIlglPegqFPZZGqPChdxHi
         rEFkCTvaB8l5TemcU67oLtmLbGdCPVAAPIEiJHr1eCHoWON2BdF1B8fcFOl8QwKOq9H0
         4kHn++BGj0051QLedKWoZBRk/kUHXh4dDy9P67OuXec4V7mwJVDAtMW3necuy2+l7PvW
         jyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsk55MgrSn0pkYJhJT1E7cc9pAJcEJnGZLuEXMt0/avaAwoPeIZUvMRAGthRY8GmkEiNmH8FKQZrV4@vger.kernel.org
X-Gm-Message-State: AOJu0YwpZd1HPSMX2h9sZUug13FcaM3jF9HIrGXGPzkpMvvFvlaKocEX
	gJf+/PLSQLEHJZYtAGKj3sNHoyyB/IQFq5nn/aADD9w6r3URRztFqZ0vpKgwGeE4FyrrZr7Ac0h
	WUpfDO80g112pQJJUUvJkNLXMVGoYIEFw087DsTzCR8o899B4fF5uhp1mDlDpVQ9K
X-Gm-Gg: AeBDietEIW6SA1p2ACha1nLnqW6nmS4f1O1M16JK5Qm3xACqf8eLFqlcWexqEnRdSTH
	iDLcszTUvLQ7XTgpYxoJ15XOYCPmJ0KSIJm7WIhIVInNStOU69AfFIqaPnKThq65NgaVRcuSZjl
	xTsnqb3ITM7xJqbL+x4xlZZ8M/q6XJk4GgbivL4+20fCN8glvNA4DI7x6EgOpiNXWYEJlmMS7lL
	jJGwLBbR2b+XRhlqgb+mmN7qXUSW8Z3T/+QDxPakocNgIX8aCCIcUZlBjaA2sSf/1fhnQAHCzHY
	JhjuzUg6ZGwXoOK2XF0SYf0T27Vg/Pwo/cR07keFIP9l3aURl6ZhGWOh3wc/PwK8l/qw5l84Ew5
	ye6Njg2NsEp89OFPnWB5HFC+ei+RtvRIpg7MxSFUiE07NBrVn9Y2Z
X-Received: by 2002:a17:902:e785:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b269ae0363mr63090815ad.2.1775110572799;
        Wed, 01 Apr 2026 23:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:e785:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b269ae0363mr63090645ad.2.1775110572384;
        Wed, 01 Apr 2026 23:16:12 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] Add camera clock controller support on Glymur platform
Date: Thu, 02 Apr 2026 11:45:42 +0530
Message-Id: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4JzmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwND3fScytzSovjkxNzkZN2UVCNDcxPTlCRTiyQloJaCotS0zAqwcdG
 xtbUACmE4v14AAAA=
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce09ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HjKqFMqo481W0hlq81sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX1dj1T3vTKa64
 iNw/hGVputAQbP0hdXZ3H4PkS+nHlHRgNkKYu4JA+/EORIOkL3C6Ees0QETmc2SFWeDYJWYdu6E
 hMaY5W8UKXO+lkoz6QuJs1SLDh2lf1JiNbSmIZxUMA6Zrs0zQViDFfOignxReF5oqhwp29+IsTg
 tN4h0ziVl83ZAXxmZHtrBkvXDxZIBebuNFvP10R2clpBRZ3zM+h2assfcdCi/bkwCog1iCLEFc2
 htM5jO47uAyx0KzrcqrzNoImQN6uSEi5SY2VgzTBUeFY2aHZA5zByN+GuoBQ8yZQlt7y0ZlWZiV
 UL/DfQLnTpxhE7pDWMYkgLZHzmop4KCzR5x8M1wsj84EpSn5IwhT+RZ8lBfs6+Qok7VDMuFgpUu
 BGqv+3ToMulkG6kGl/ZFBa8PrnO9mZqgRnu8/oi+FN8hmpdi5EzAFzHpwwjsZrL4qS2fFBgJ5fJ
 e9W4M1kQUe78CIkSySQ==
X-Proofpoint-ORIG-GUID: V-wV4ZmLdznqNLwZiSKSAAHGTcKqcxvH
X-Proofpoint-GUID: V-wV4ZmLdznqNLwZiSKSAAHGTcKqcxvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support
      arm64: defconfig: Enable CAMCC driver on Qualcomm Glymur SoC

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   16 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 7 files changed, 2433 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

