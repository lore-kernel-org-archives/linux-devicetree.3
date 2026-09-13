Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FB38E100
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330737; cv=none; b=HtcyL7ZyY9bU+G81+V6oK3leqa6pTvBqaqoz7VW/cxr3zZUEut87nfwmEv/FQtY8bMAMD++9MDGOHdVC/RE8W3OqGZ/gwJmOMNVuCvqr/33as4+KwKlxUUpzGEJr0hudik6qP8vkW7OTTXcZVB22nntVpcrY1vn4ksEpezQc2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330737; c=relaxed/simple;
	bh=FCsM4SZPsa9sU+Tf0jKlCbkbpZoWu7eCILvezrdZJP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwiN7pNugbUs3Kz79ofiGoro6YRFZTex2BkEsnySj45LpHU89uoaAk/apnlHWnterxtJ38ezb02+rlzsCsp5gnrYrxtlk72kL4Qh4hSCi20aN7OJ5loqCkRrg5lyODOE+Wqz7rAFu1yY32zLZaPKBQZ0ngrejG5ak1SvgOVfLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrABeSY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXK8B1ZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrABeSY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXK8B1ZJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK02gp2527793
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nXH3YsdC31I
	SX+t8/e3TLXrJZQ/UV2nsXGmqyk9K/i0=; b=BrABeSY1C9r+nKwVLDLszP3sWBn
	j0SmcgK7rOQ9fKgW/6WM73ZM0it4m0psUVTbep0O0cQbSjx9aptQh5+CcWs1qH9+
	MmMnvyPhS+4tdBb9Wwe+KAA6a3inVIWS1oSXopAxKGTryaMG+3oCGUjoCROqNRCb
	eQr+M0zWE4k5CqagC5S5GN6L0ydKW7J2nkL403GvVRoPRFPH0vrRZDDPfJTrSavW
	LTkmDiVt35MsTaDfMU/gXfdjrF9wcqbOi+M1R254WD7+zK2ATmttqjX6m+66avTF
	lpELG9F67QhIZrXHCtypyOCqDQ91115BYOew4860OSLuxbCp8nlvn7STtCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dc1t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1bffc2eeso149741085a.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330733; x=1789935533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXH3YsdC31ISX+t8/e3TLXrJZQ/UV2nsXGmqyk9K/i0=;
        b=iXK8B1ZJp0o/yEeXSliD6nA4fyblaJ6U/cISZvg9z2nCNyuLn9ErX42BHLiGYorrv6
         Wr+CF9ZyolFayXCkzLrhSDU7Bni7LmObkbM6FFNHXgVtEPQ2b3NfRs5GbfOgQQ8fvjd/
         MMrm4YCYHxPSr87w9Qtx3GXfDcO7/efgehShQbZ6quB6ig0fqImqZi+5NoFN13aN+tmO
         SVYmyO6Xjr/Bp+eBD99wevbvsKRUxiR6SrUTivGdOlbLCwuRezAx4JVcGlgy39Fg4QI7
         MUgD5yp2XdysvNuVbYMBbbpdvLPIH3H8XBWqVAdN5UTzytpSqrJxiA1IndepON7pu273
         97XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330733; x=1789935533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXH3YsdC31ISX+t8/e3TLXrJZQ/UV2nsXGmqyk9K/i0=;
        b=UaOQer2pEFPrF3HWwZ3Bu5ZMeuyiOVwY6GH4mNAGfR/wtuNb/G5b6qP/19fZAY3CTq
         Ep+D5Dq4i/7vh4DOcf677NZAQumI1kfzN4VOtu7PCX38yxNAVVmyAmg73g7d9b1s5Bfe
         6EPqT0OI2bdzucGVclAO2P0UdJWEYYNrt0EsnB9sc8kNquwBQYRrunIyxbu55/CKDp5Z
         je+YZrOPUvstdY2ShHhkt5h8ofXgxvIWpZdTCOU6HMINk5SxTGsnsTeekMYR4guqPIsp
         8BOooxso+NDGuvnnJaYSuQxJSJXrm5gyKUPe+HnsohkJ4epUX1WIRH48d2ku4ohDgfVD
         Ehlg==
X-Forwarded-Encrypted: i=1; AKwUvBwSVen4yrL4Lnh66ntL0JYN7YMonR5fKGmo+Y2NKp77NAOPXsIBtx0VOCL1RCPGcI/GWCnz2vIvqPJR@vger.kernel.org
X-Gm-Message-State: AFuF++kUluQ4EDq2FYYW4/Z9rWRgHA7L1t8fgqP1NAVmsT17oqpMGlhK
	So/SvbjItUY5Si0jzfHKdCtNJlGDR1A7oegUluhLZUott7wr8BcVpKAKR7xL2PhLDhWHQk33j2H
	plYEvL1rSOWzahifHlLlmhJCMxfTRDzo+2biZ9BJF/db9MvGkpJkQbIYYG7voHCDG
X-Gm-Gg: AYBFou3pykco1jP6NsiWGvHgena3VVMGtuP7E13XmA+O2MvRtDrD9wQGadHufxZ/y3N
	g6HYySZID6pKwkh58Z6WhyKjkUY3YeQoLo/ggGTGxtlSba+xREr32v7b5eVEaQTdFyi20hz+B8O
	DBtUn6/4kjAG5aVtJQSP9UWqIyxzW74AZXyD5DeHBUWz9bEsS1+uN2W5r3RCQWG8z88uMNGFl04
	n9mQEsK0CdtI/qbSDkMPQZXZ092U+ao7nMaQYIaA/DH4uQ9RZ8OBvTLIXMZlvGfcIJ79+RIll6e
	axXKXi7gqZYYD7ugoEEZCuJkPZdutv8n3E9yc0FbZAAXGXcL4Sh6byd3DLEFnqVm7ldH/t0MC86
	hpeJbvLtavM7K8Q==
X-Received: by 2002:a05:620a:44c7:b0:92e:8310:7369 with SMTP id af79cd13be357-93a0386b492mr1280795385a.37.1789330733334;
        Sun, 13 Sep 2026 13:18:53 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:92e:8310:7369 with SMTP id af79cd13be357-93a0386b492mr1280747585a.37.1789330728166;
        Sun, 13 Sep 2026 13:18:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Sun, 13 Sep 2026 21:18:32 +0100
Message-ID: <20260913201835.250085-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXyPetlNAB+hp/
 WYCyJENrTpJk9F7aZs+q3oYU5AT1FtuJvkeIT8v/tAZAjfP0QUXZhsQcABW/jctS7ajNOgoLSlA
 5ZWjnlh+//jrcE98x/QCUKSDDDPifcmG56k7IAL+7tpRsYcYBtV/CIrHJdALJUFdZ4EA642x3kk
 EMAsoghxCXqat2L0rLS5Zf42KOgLHK37yZTcQwpMbwo3bqBDb8WT1resJcQ/qkzOmx+HJCTAapk
 JRcb3nJtG1UVbFGTW5JqfY6Pql2heMUNCCLt5Q4Pg89ZspFRzfxu9cU74BH4KwMiYnUfU00ugGZ
 pgpRR6fA5ZZVhZOn8OrAg3OrGkjn//DeKZJ1eY+fdo6ZhvAeN5lTh6rM+DGeIoh7Xt+WebEFZB0
 5oBsaYf6bxdyvf+a1cfAA38gFC7NlbE6kBstvJnlXiYGGXl194gacqFPNKOmbpelBcZeGxkc5BP
 0Vt+3k5Jxn2a8cqd6wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXztSq/3rvrmlc
 vClT3WUACj5Fsfg+D2WV53A+3rtqmzSOV2zqz9rHYW+ifFaynXPjCjzqSyj8M7h0qHvdzrYSAwU
 b8Oh3g2fBWX7J50GBKe9IW5H80GmVHA=
X-Proofpoint-GUID: l7fuXwZzIhnjxVd9MgJgmaI3T0uxCB-U
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7052d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8N0tIHAAogdkaPae8N0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: l7fuXwZzIhnjxVd9MgJgmaI3T0uxCB-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130288

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5ccb571520d1..52b9163be357 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -178,6 +178,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,thinkpad-t14s-gen7
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.53.0

