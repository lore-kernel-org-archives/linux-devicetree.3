Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341273;
	b=d2HQh3TCJnQmhIWuxDsFry8Kaa+3QzGuhjGyvLEgEs8anUXQfq84cjOAH1BVWbSOkEh9
	 EP4VGyECNJV6wrBGfOxLic2r/K+3+hEk9McrL7nqWZXFTZcjLcWGoN5YfpfbQFxbVqS42
	 sT7dKwUt8vSsTjf8ntMKlyDXfK936rlb7puFEnzVhbzu3BCoo+tUWe2XvVo8+laRML7R4
	 6rLT/rj8HUFCnDmW+i3nJQiar0ETsdL+z6xwIm0/QGQnPtr75cvRGJxrjiegsemm8FuVf
	 AOlVuOp2pMfpLCtahvbcqTASh2Y+NrwsxSQgdy4vdgKsP5qbI6hJt5qOtc0lZlH1yeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=IxTFmPByCPLKmxq8eSikEXVCWRA0FrgbSPX7Ka8XkxZ55DEfs9IezfZ9atN+vptIPAH7
	 OXopbU08Aq1BQi2zbksuvW9mATfgUr0KBPOI1UIRvUH3TLORe312mqSKKny01ehD7FyP7
	 KasqBFumODie9OM4KWwWHUggGMtV1bbdAlOVuTnQM24AHhcRnSM6x47xpMWvYalO4lc1n
	 GaRHh2ZSHx6bQyNMwJZka5PM1fZI6fq+nVgZjcHvHzIhbie7RC46wlSxEjA81lm7itbP1
	 D+7FtSiA71Vz7GSQGvJJGFHBEexR+06GrWkEWVKMq5atMDKVRlpyqbKjr9k8U0Yo4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdV5G4b3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DEE606A322
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48DEE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdV5G4b3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F4vT2287020
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=H3H46kX025o/8Kik
	Xy7yiyuTpz5wG0IzznxcSF7+VdlWJKXEDJZm/j9eQ4Z0H/d+WMDQeGW7WoFxRTNx
	Q1ssTF7U3PCPTqh0dCPHKXyzAIxhQa3YNfFu/P9il/b5KqF48+9TGGUzMkOi/IyP
	IzpriTfzJdJ6e5h6MlzNUwFLdTf+xoXIJeYLQfEo4nzyDcNV45KMYLGCLwUK1Lc0
	xlrGqsF5n4fYZjYql6o5JnyGuFs4ED1cVXdLCwAlaGXBZF0v7E0H+XhbbNL9P4DK
	ZI788tuSb4vUFSEjpRUCetJFuh1nf+3GRhViKJ5hmtcEAcIf/NrcXHfTx6oY3ulC
	9yPT1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so527560b3a.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341272; x=1793946072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=GdV5G4b3VRO8hQbgSlPzFJEOmY4MIxcbUCNo5ur9n9fbQYrGzRVoqcqGR6ihsiKxgA
         RDCDMHX40af7FsOXqOPPMAS/cerUx8i4vFzZpCAVJ+YqSgQqwx2f3VRWvxpqMdAR52yy
         8YameAINb/uQSmycUQKTj/QBRKyuqVOr90KPE73vZcYLPjyZVLXaEf+rMEgPwPeXq9DX
         lJymtESt9hNsQjlbCG152n6SJSLh7SPjVvolQkJKeenR342y6PuTcySzv9IUYoJG3CAF
         TP4MIjuBN2qqaCzobBCKk1DB6jyivHM7jUp1AJRKY4wt2vuw6s3cjro5en9Q81wcmm5U
         oqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341272; x=1793946072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=el8N82JpaDuhcgpsfxTJ71wQvnttrPbuUihM9ni64dWNsvkyeRmjV0nTETB6orrRrI
         ODoemRKQiUN0kRPUabkWlKRt1PnUhJkmvNu6gW4G/capDGO9ZkufsluS3JxC9fx6TJyx
         SapCUNCLK7Klz/1+dRZZG9eCxY7zqOl5lYV8KaXUf/0uCbZY0h8OYT0BrC0ylPvRZv2e
         YTO+4wlWzcfIlvOwDLf55U9eJRDWh3+WSvzBrof036IxhTKiIYRPhOl7ljQjYzA0FHWR
         9FYsDIgD48sVozdMLATijJhWnvwOA065LdOaOkHSqJZmm03DwSuE4JQGecuYB63fe8Ta
         giAA==
X-Forwarded-Encrypted: i=1; AKwUvByLpo+2+1C7iF/FEYiEiuNOk0Cu0Vbifrrt59xdIyVG3g2tB9f7JQ1CkkPBwigPEK5rM2kTCu/le+OM@vger.kernel.org
X-Gm-Message-State: AFq9FYIJR9bkwnMVc8YDFqeM8RXTVdbHF7n9MqKf275MVJlNyl2nLuFu
	yeH121jZ3JcFUrsH/2hD0NCpibltnJRIP4BaMZLNpacbS0b3V7s1lGfcVEzrZImMHAmTm3hia7L
	h6rjHNLm04kIeFEWDZbNe9HkPxmvkhQ312e6nDH2AEQrhpV6260+9RpCgSi7tgSbv
X-Gm-Gg: AYBFou2TX/3D98rq5p3YOWjX39lutDod1JWOlGLF7WYzrEiNz+LKIxK9K82e3V/gJ1U
	fpAqoTCkmc1Izew9PHAeJy3oFSZY/QWSibwH7EucXfD5wI/19RVpg3f+Bp902vN58Vu4FoxHihu
	biQ2KIqu7KojEVKaqdIpRjIia3P6OnKT35KwIKn1HlM2jwwc6Ohk7SXwXV7Hz4T2gENaeMsRyut
	5OttHYvgVtZ1PLbZwq9myq+qfTjCuVdgBsL8rgTO10H82G12BigaVLVZ3RtC1U3Xoq6F4CeauMY
	UM9PrCRvqkDL/kDyzvDTYNRwjtUU6Wh2Fjsvr8AxvPuDNJjPgJgpgrNwsgPpIghAIhxsaeLRncs
	vIOW3/96LyEBeXlpZgpuvmnHyXPfZ93Vo/ImwOOiNvrxpGr0QRcy5ZP3Z4eMNSrCPjtM=
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153257b3a.30.1793341271855;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153243b3a.30.1793341271451;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:49 +0530
Subject: [PATCH v3 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-pm8010_i2c_support-v3-1-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=mXOJR5NrzpA3/ALgI/vb3johzXuTH1aNfzirkBmWNV2Ur3MUeIOd0lkchHZs3pkIo2CRjYtwK
 uedTJ5um0QiDmPuJAOYi0VxrRZfDaR20B7vFCvjD3AHkklpe5qFLYmX
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: sF1rTaKAATrOpRnb6incVcC7MxifL_Wh
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae43758 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXzCcEox0g8LCM
 PklrtN+gL5a8c4q3+Ruo8XolN+RS9LF/PYn6UweL3ClzVuWqFUqRKJRui56OKeXbOTRW1fF2Jmt
 t/mj9yqG3B+ETINTSzeYcVwSDJHC2ZRolvRmiIgmPBVUB0CPUP9JZX4EoHFytTossevElfWtJtF
 nLYFf7S5GYRtQXUQwV/Nv73n6hHm6w4EA3jcbQ5jPCc/NtX7W69h64JRXrgBYLtVmo8XoTLdpx/
 uQxD6zY2xtNaM/ixTu5r05rnk9ewkl3hoWC6i3q36ZbXqXKgeRtd/RpuRioCm8jlTxRDxA8yCsd
 /SDke2L5fAzAdcrI2tfaEmwzKY7IFVzLvysduHE1+VDfGDZ4rZkacqAPaNZl4CagFot1aitFits
 wlXEJQqdgvlt7ylfDX+lySPtHln0ZyZRY5bT8SDr2pmknI1UzFi9jee2xredt+PPNim3byZkvvT
 pvwDnpn662XozDB4hDQ==
X-Proofpoint-ORIG-GUID: sF1rTaKAATrOpRnb6incVcC7MxifL_Wh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX1hTFhHwvdElr
 NsfiYJQORsI9P7yVNYlRFGX0TRzYgSWyoQY205Yce0ykhE145Hk2Inv0kC//IStZKfwirZ5Kx5d
 JV6OLE28i6XzdBoyQ1twQg5gpY2Cldk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

