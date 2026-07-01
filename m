Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D7395AC2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889807; cv=none; b=ppgalNycjIVRXPANg128B0qz+6qiNqI0yo1RbB58UnXrWKIQhZ4GCFLcGL7O77M//8fj2lHV1dBuwzYr96yeSrR5I64ctITSMXk/L5nkgzykTtGNEaC4TeM2WZXFRE/8RyI0A5KPEJdeyVgIFOncz2QAYioiQLwKMnvT/8Mb0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889807; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFxnYg64NOJ4jqn01Yo7IFohlrGyo6akjpjwnWGQLC6VtJ62LOZOekdEEbXVZyJAybWVzkMUZFcV4ANVeZYZZ2khXRGRmMwVkqv2mXn7symlckMpFOGKVN2wxvxacq03uiLz5v24mWMMQb5AnsuJ53KqcodFfULzuWNR+0nSVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3FAgpF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiM3JTm0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3FAgpF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiM3JTm0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lPUm133268
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 07:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=N3FAgpF640eEDRtz
	W9Y6GKck/p7tNPP6W20/0d7qAV377UyEqWwBX2uicUbx8OxpSujX66dkPxoFO4Rt
	LtIltSofIQEP8lYzcYTa3xoI+l16LMtKg3VlzHu4es3HAhp7IClsXA7O+LW4Run/
	16e52/x/P2whpqNqWBN9yKhS4V8fKUnYUgYGzj2j9/Qf9DzoMvxYX+2wnHhfGpXl
	3uQ4YLUmC1QucJXhCOtSFbqjRuTcUpcYoemSSQVMpTQuhfd/MmzTDvAJaltKjXsE
	IGBe6gmgURF1KveOldNb/QhGyyrXG3f4jMb3SQq3OcdnExkTqzvg5FNXylHcWO2G
	4p7S/A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1a9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:10:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139c6673856so513255c88.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889803; x=1783494603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=AiM3JTm0WZ6bZ82IZ39Gm2HB1mA35RrCP7/jFHsPbYiistU/fjoo1cO36EO3KiFLfs
         MqDoUKw5KnsKzqGpXJVKm/bYKFjO0G2sW7ST885G/Aj+Qx66ku6+ggzCQZm7Gv5oUCWb
         VzBLGr7JZ/JtjKYYrrr56y373gNM1Yrgy6N8EzHRKtsBFdqNMfgzdlfVagvZV4ATQCZf
         DTY/9VJgfpzt9bmJtfoO7ryO28Amxez3anOicgsr681V+3L2esZAXE3P2KaAC+KFwp6o
         Ok70jTIWnpUMcsbd/IzI7rJgC/d0XOOoOyN3opr6QfeseLqCno8woJi2GgrDtVhiViwX
         7CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889803; x=1783494603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=hkJRAOY+I6ZRN+ZOYLHtt009W9K+l189aw7X+IZcwB9HBFwGkP1aHWnzMcAVy4HezA
         YjYBvoMZOLj1bEf5RwHdoUXmOI8VIml5XKAXUL6ICEy9yUMOzDTc619yV+qs0lWynpKP
         OwpagaL4ySu0AdNOKHglpWQEl/2ICQsju17sJ0jbWH+48GZbICsEOH/6B26JuT66G5qw
         MlyqCoQEcjawGtGem8bVNz/Kk9CTYRGXiOweoNDXs49vtzfQqoZh1ORbWuU81hE9oHt0
         SLPCOGtVKFggqnT+cqM9xGxFnZoyUlgh7VYnqYA4FIg4kPm/wZmYwSdhpA4+35KppcUV
         nBQg==
X-Forwarded-Encrypted: i=1; AFNElJ8JjyUzWfu7IfM8rpEGYD6D+FlJyl/LuKTwYq7krlt1/ljErvv1xq4dXWOi5MooXkEafZxulI04nhs6@vger.kernel.org
X-Gm-Message-State: AOJu0YyDk+arSGt3wLFxvqI33gr8ybKnZkbP1HgLIosd0eGmofJY67PT
	x15AVeqWB7BTLSKEzsvTj1gNHM0gATJ8cB1JE2I0oDMU8F6bP/iuMl+CoYPM8iQv9XNnZlalpMb
	Vdl4lYqtk/68fxGM7+IwwebskyHyp+EA/2M/v9/04Yiva186o81pXH0gEE55hJHwkk0kIuhGh
X-Gm-Gg: AfdE7cmINcQZWTU1HxtRh9SGreJZ8I9s/nX/TwGEuAVrNSr5VMLt6Hiw55/6aIzNvcX
	Jh1K4WpeYTx42+xJLLw/2iocNz6AJnUow2lQWSOwew2n4LNBcfCWaOi9ZPNp/TY+juAcITUaVeT
	qjF3a3rQwXpdTUdgoWwsNpwCBdqgqOo94SkxAaxdXc3mkXyTLphVtODajcbXouwLQStcEGgTA6p
	5vWDOlZ0ywcaPACdetWgbcVjs0AouNC/4mI0KzKWp3ap8kNTlht8nV8n2hpo7/lKFWvRJQdungv
	JmR9xjOwTfWklUjElVw3k3uW0UwR6RIL9k2IVWOkMdebA4xpuFUhi1UxdwcMgybjIseZrpXUw1Q
	U9iBgFSV4XjTxEJeYRy4sRxA37REdxyaD3jeNSPdHu/BEWMQChJ0ky2CvCFiJl9kS3VfhOFyK6V
	qW+10qD8gGQoCuRrqYw15EXuKcfWtEUXJk0vvgBPNC
X-Received: by 2002:a05:7022:4595:b0:138:407c:1d17 with SMTP id a92af1059eb24-13b36e031d7mr527224c88.33.1782889802965;
        Wed, 01 Jul 2026 00:10:02 -0700 (PDT)
X-Received: by 2002:a05:7022:4595:b0:138:407c:1d17 with SMTP id a92af1059eb24-13b36e031d7mr527185c88.33.1782889802426;
        Wed, 01 Jul 2026 00:10:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:10:02 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 12:39:41 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-apss-clk-v2-1-776d054ab8c3@oss.qualcomm.com>
References: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
In-Reply-To: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ntqQ518YRuncJcWI8xZqqbfRIoeX6RHe
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44bd4c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX5MUCHhRRuoby
 1dry8WKTZYm9BSngAO+ZxGj1pHshDgpR8gXy3LLs66rHEgdZBr6NIp66t2hq+IqsZbH8XaTEijM
 XrIAeW2A0raRkFZn4NO9Bka8dktnG7TPJesTAwZd6WQGmhu7lMh1vSL9UEa5eLYYO788P29pIKC
 /vlT2bZp1BHi7Npcj/FqAySJvEtUYLTl2Vae4xHWIz8bGMEcRo2Y4slPywxwAs6o7qjDTMZCRwW
 K8psQkROSivVhLopHD+bz6ahQp+grBA5udxvUkzRSteUUM6zXMR587Nvt1xV5xRAIBQqeWyAwB3
 jrKDhdQ0BYJ/boATQPRYmwlFFY1tnZ9Kad0nr2vgdz6JvdIWrZghZOisTS+qTvux2LgHOh9YZ3a
 Hg3x4PTFc1Q3sdcGHllSpQSl9DpBVTFyQPBVJQitb7yZxgZdO/Qi7MIRovSTSi0u8S3r/UZtR/D
 Rwv+7D+Bx93ke1N7IGA==
X-Proofpoint-ORIG-GUID: ntqQ518YRuncJcWI8xZqqbfRIoeX6RHe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX8HaLIk2CCs22
 JlKx0K7pzjy75bkAEKfkHg13Pt5XyCPqhoIHyM+Kep6qL+rzpZjck60+ztLcDUf9qsau6msZxJg
 +3UVKrSFpD+CYUxDwvG29ioK+9m/qcw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010072

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1

