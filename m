Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1437AA9F
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026988; cv=none; b=hPIx4NxyZvVR47jsCfaXRS7kUvoXzzBRsdDUbTpXjBGzdGgaWD5MsGfN5Stb2Iv/V3FRdrhmqfdXdS5a1tgPArW+/o89ia4Z1o4VxZlPww/vd+EDRw6BCbEttUNbOEl2rt5dVlruoqfPxOs2/bBG6xGVDPUMFAUTHAyrwVJu6tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026988; c=relaxed/simple;
	bh=wGDpoSZqYJqDTEnEAQVJ/qK42MGtGFYK8KANTOjBUSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSinnhnhfIqKO8o6a6OzlOCz2WSHeMOk3v5zaX9VQhOiOso1O/G3Yq4ZAlvHkcz41l92cW9x343qJxRvU8EaPVAYuLBf0fFme5EzFvehmBGmiXP5JgzdYSXvJGksEZsFnO5gRim+a4P/ybFFbYeLxlOxMpYU+tB5Mmu1XDi+BZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z08zytSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaEzAbhy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z08zytSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaEzAbhy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ZG9d4167976
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2wYoIFnM6RKKrEDd4VO/GKMY6ecMXwYhgCl7ffDFpA=; b=Z08zytSjetp1mI5L
	7txLAiyAZqP54Be1bpuL4UezQW8cL+/jgrY47vRBtDH1RVNao9M77ZrUDfLGPNSX
	5ihyEzqJ0R8325ziJT4/icJ1639Y0s0bfiRExLBSWJ+5rB92sJY9PluosMyR7v4i
	o++UEJgbIagLqzyuLFCdzqbfv2tMtIiPyG2AkVOTM1uWYDkajjke9Rb676qqFnqi
	6Vu7VEYsdmnjWe9ZAF9HgTMzNVAA1M9LapbZ3Z3w1t36V/XkzpY4iIQhFZUJej5a
	k6E/+i+FZ7SwrggO2ogAwPZjzZd0yANxwX5B3eZ2oWwDtw+CsgX/t7C4S2vKhaIo
	LYlnGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n0te7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0ba59a830so11917560eec.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026984; x=1777631784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2wYoIFnM6RKKrEDd4VO/GKMY6ecMXwYhgCl7ffDFpA=;
        b=JaEzAbhy5JDGCen0kUBxrcezXxtXf8t2KuIVOPlzGSuuO+tYgk3u9HcxzfKi+b1Lsx
         HGNDMEyT3puliMR00n5S3MY1pICLM7jUy0nwasP75d/5R1hmsWabPWrhjksmgrZp5jQC
         hLF6vFwQm/hxWkCEJdxQepNYXEzkgPrWuX3K5dZbw+OGroh3UHpECSql1P54G4E8uSNK
         pia9k+5Y1zBS8XhKNxMsnudH3w7Ff1QY2eVh8Vk0D6rzB7Q4hRNEmYIs8wlm0hDBcaaC
         hsADwSmdQ7nyN4VQg053TDvkhc2wex4G+yanPsNrxlXXW4xlcGxnZcvxaJTGtQUbW1Yy
         ml1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026984; x=1777631784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y2wYoIFnM6RKKrEDd4VO/GKMY6ecMXwYhgCl7ffDFpA=;
        b=aH4EAhebqVblMExzhmRqOLkzRw7phHzBvtjHKB5s7/uM0c3mCDzrXgjsBdDW1Eia4D
         5FOfSrNTKNLNNGkxArbcxYwz42Wv8cCqjgY0aZ8gYsAgAPW1jqNHZq3CIG1XrPYeBNtr
         4bZujJ0DAa3+pqVP1gXcuXTBBX9sm4HvglGgR3QpjA3jIWha4NtZMhj70vHxaFtMKOYg
         zjw1neTB7e/qCbb7rjG0Tl9xYjP5b2IWAdRhOlbLEfGv2WnezS8xeJNHDRKX1TKVTEww
         RokE5IbC3j+/1J27ZdJSD1GSSpzRr8PMiNuUAObJV/t7pv+2jMe0WOChcpgCmXDoPejI
         wIQw==
X-Gm-Message-State: AOJu0Yx9qw1y0v2Aqor02WG8nYXbA4dRItO0PFknBjx4iZpzbEiGh5B3
	nyPo9htjLoEvWY6Dp9nO20bjiSk7+jisyjcCx/6SDy2Lbk9/2iSNJyWpDEF+iYtRmqZ1O/9KxXm
	qD9TOEdTjFeHz+XdH/rT0eUi0YDRNxbeZNXY3anpDTOeTBE9cOHai1ROgsyTuLsuX
X-Gm-Gg: AeBDiesaaNUE/E2UNsv70VQZ4AdM7aS52Mnt9d5qQqimS8Mp+UhQt2tITyahcyX/fKs
	4VepFnCeTsKe1sc+IkrRd6gxj/9Bj9QsX9Saw2ett7mOXCFo6nsGq9TSi0KafNIKe+1Km62AJP+
	Hgd5ScKTvSTV1y9XzBJ4eQniCXM3HBwGG+DALxmipDnm/r3EzAdYwE71ioL1Fmvw9uqNWAfgfJw
	c8QAk8n4lJmeOZevOTrvEN9incod3tqexS/+7rJwmjFP7NJx3+YiO/3BCod5zlzCom5qEEV/tlo
	hHCCWAS8tBZUwQa9vbZYr/eW+xfJIYop+NBPG2P15miO5zsKr98lgLywkfXz/bLMtKYpbZvLRfh
	Yi2AGERib7q9QvIFkaTCXUxo2HaC0FiLyly7fh17I/9krP7o6KSxPheHZvfmQFgNwHh0pn9I7ah
	hTzX1QkA==
X-Received: by 2002:a05:7022:6882:b0:11b:923d:7753 with SMTP id a92af1059eb24-12c73f6d69dmr15463302c88.3.1777026983631;
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
X-Received: by 2002:a05:7022:6882:b0:11b:923d:7753 with SMTP id a92af1059eb24-12c73f6d69dmr15463284c88.3.1777026983097;
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm9187846c88.15.2026.04.24.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:36:22 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 03:36:13 -0700
Subject: [PATCH v5 1/2] dt-bindings: sram: document glymur as compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-glymur-imem-v5-1-18ede63cf063@oss.qualcomm.com>
References: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
In-Reply-To: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777026981; l=833;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=wGDpoSZqYJqDTEnEAQVJ/qK42MGtGFYK8KANTOjBUSs=;
 b=OS9+gMHu2OM0QAW5DD2ThGSJqyhsU0z5lYbM2EGK6qFnU5VPJoi0iiJOlhAT44iiU25snLRE/
 3ONRLoMr5UtABBQSqTqvBKyoullriWbhOWKgsRg2subZbVbotgNMd+3
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: tRky_nsb969aSPqq_LadIDHK27L6uvlU
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb47a8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vpq1ZMNoxu35JrZUYIwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: tRky_nsb969aSPqq_LadIDHK27L6uvlU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMCBTYWx0ZWRfX30UYSjW1ALxn
 mOIhVm0YsWO1bl9YSF2dKPcm6xOF6CqkkWuBAbigbZixmj9j3zMBJeTo+HAycUWnbvcF6DcpjLn
 hwNFR5uSvjX6IsR9YkT2XMold/XgG+Bemk8tlhZwcgnleq1x2F+6t3+22Dj1R45S2dSn3H4T2Uk
 Sbi21yAnRFlBfz2qDc2KQFSm4ew5dStRNu3q/ufMPqqXFGZqNHPtja/vuEdOM7ASWx0sAtDIzbF
 VhRf/zgFcIc2dunltMnAiefYsx/YBBahmgyDUjrcWHQdEe/ZWCwvSVWyf8sN/bxDV8h0VRDUiN2
 O5IVmNnYXqVSMBgTkT4QVloZAGjwLHpKsg2XBlgqf+X2GX+wLHZgBu9izTOoNDotqaOJSm9UNPA
 SSiErUjVL/X36Wxp6FN2dau9D//uMeTYdSY9BE9mAR7to+cZb4B0ghkTFc8KCv1SUWcBw20Dqwi
 QR9Cl9X+9Rf2TahH65w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240100

Add compatible for Qualcomm's glymur IMEM, a block of sram which
can fall back to mmio-sram.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 8985f89170be..0f7ce2f458b9 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,glymur-imem
         - qcom,hawi-imem
         - qcom,kaanapali-imem
         - qcom,milos-imem

-- 
2.43.0

