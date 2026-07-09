Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694B279903
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603277; cv=none; b=qmQweahRW8lsAc/OBwxRhKmVDKsNqMUOlW2uo76WafrigIvYEkZUv6WpIp6ZEwJHh7CrmhsaHRvpQSLTtLO6SIeq3+xa9bI1QQvuXRkpvopt9ue+seoPfeaeeg9Z67E5FAIxwUFOtqMaLKr+5ZdqBUvDdNnzVT0Fprh79DSvd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603277; c=relaxed/simple;
	bh=9drw3nUbb5i/WIxNasF6rDi/OG6ohOaXrUaOzfwWFao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oegqt130g5N8uaBmuToYWCuuLqSGKZLbneDKNL/Nk/GFLrbB3rdhdHqkVVG+l7jMyau8F/PwETJnqA6dOVkfmOk75OcTBjTAOlD5Ugb8B/QlQ+ar45otDr5WEE1nJCcggCKHobRBRmPoauLNYr8FmnSjZErD75x6TdBRxAbIo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJx/VTHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FC0Pk7sZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJx/VTHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FC0Pk7sZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNBoM1525124
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q13PD2lCLRhnqh2J9YvhltTb7cQwMu2ceaCAYeHt0rk=; b=aJx/VTHgW1ODuLTo
	Ru7kv671T30wH/D/6cdvDlZDWCGVt0Z7kuhF0hFPhDa2RRxUYusPi6D9Zukre5PT
	ZJowanZqZuOw1bHZoDLFHfNnsXnOaM2JvMntJeAwuHzQ9jL88VsQhf06VhBueyaq
	jHVwuXq3nOTCM6THpE7dDS9gMAediiD8SznoKp0h3soITWARmxEc+B/B9Q4hJUo2
	JsxQbUYzj+Q4/DpVdVKeOsEsZfpfu5L0bMibRcWdqbrqdxsnYbL9MEV3ufacU6AL
	Z6xw8khzSBR6Xjcb0GX6Ilsnv9aSpuelP82fR6B6yZ4/wCPYTOzQGasq/DVrrk7O
	A28twA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u42m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:21:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so102509685a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603274; x=1784208074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q13PD2lCLRhnqh2J9YvhltTb7cQwMu2ceaCAYeHt0rk=;
        b=FC0Pk7sZv06BTyMmTNT3ZK/huhTOeJK7shv7Fflx8VcMYKmWRo4z8Xf2R1aM3nNKqT
         AmSvGCsVdTlTBnEfLyzXKUP+qpyhZCo16dOb9KmUQa8il933JULd/AcTCt/oqKJUBDQn
         vAKdAMCYV8Bm6gNVWmDFxAUOwRPFLeQYKuWNUmU/v0ikM6WmzDpGTDYbozQn2PsGZuLc
         0LUasYWTLqBWZ+OA5LXnvpK+sZFrzvhiNeEnbqBAvmZeqn4GqOlRkuQNwIb5qFXuU4zW
         Iqa/Z/aMDEm3KMguK+rT3nZfDqK7+AkecJnkUpOhY+1uxy3yJqhP2sMzIUOam6qKOYt3
         Tetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603274; x=1784208074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q13PD2lCLRhnqh2J9YvhltTb7cQwMu2ceaCAYeHt0rk=;
        b=XCY/Q3Q3tVlc72ZHAmau9LWgR0xiByjo8sQ4H92G0mzaQDlN3cKl6lBi99mzUjuzy4
         HQAXcMbIgCaBhdP8pD04mmozAIesyuIB9WnRUbVmT5mI6qlaffCsmnZt6zbcRMJcR72O
         6J0OouWyM+4C+xtgTfDpXKc10j1BMcMNLIQ/k/riupQMaE26S0K5aF6XWjSDbI4Zj5GX
         jJ2Dyf5yVb35x5zFRC3M/2kd7ExTzkPkyg6IpAz7iSFEpdOtMleiBBEYz+pqbj1Ds+Uf
         XthGziaYzZGugUl612b7BJFP+WrOlbP2xoQCDMTJM26Kv0oXHF7tetPV7g9CyOHjafaE
         6fmw==
X-Forwarded-Encrypted: i=1; AHgh+RoNxSyUz5rKlK5I9zMxRL8bWSLCEikjL5CaMDOmJlQetn67Q+oenS1jfE7BFYCKMOEkqPZh+Fv9CHfi@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXmi4YGJOVYR7EqaSqja8s/TL+9Q+JQMeBvGKpaqSbf9CIuxW
	SzDDQEWM6v/I64353c7pvXoFKwtF6LYFeoTU3WbAE7dW3Nhr5XXHiFbKXR6x7kNKspTPFdhdOn2
	utzvAE6eeOBUJK8a7Nv9Y/DcEqV3ZDKqAIPIGYTfe6JIvxa5cNZkcZDu1ReLKMrDUWN3T6uZtE+
	s=
X-Gm-Gg: AfdE7cmfdX6l4JKW1HTI4xzirTRwT2HghdV3Pk4fWuYWHBhFskYBiF4szrBh771L+F9
	9tYYlhflOLHPTK2VxhagXJLky9oQPnr1Pbs0nNVvkH8NINctEb2EwXhf+JNjIYHaspb6N9jyG73
	ZskfsYQDoKJMGsc0sCeDyATT7yIBVBXUGzBMV9elWsJfDEGx8swUZqrRTyLz2+jThjfvxJPc607
	tNhpj9hgA1biE5IWxSpGaYOEgOG31C4NzfLASBz+HOlROZcvUdqCN4HYQJM4gdz4n/23LBf1RJd
	WVWovGNRP7q0nn6vQlPmfYH4NyRGCf0WN0cqTnUn1/x4xxSpOhSRIyOj3zJAzRFX7lZTIHu+jXM
	qmIBfDmUxiP/1TNh1tPa8RtXjNDdTGR0Mpw5C9qvtuKaoBwbFBXsqY68bGTTllw9Ag2aP8Ss=
X-Received: by 2002:a05:620a:1720:b0:92e:6858:2ed1 with SMTP id af79cd13be357-92ecf5dd2e1mr746858785a.53.1783603274120;
        Thu, 09 Jul 2026 06:21:14 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:92e:6858:2ed1 with SMTP id af79cd13be357-92ecf5dd2e1mr746855585a.53.1783603273671;
        Thu, 09 Jul 2026 06:21:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/7] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Thu,  9 Jul 2026 21:20:09 +0800
Message-ID: <20260709132013.4096850-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX0XnroAqtjDzR
 KSh0PJkihhGWhnRBPCMuJp1pke4FAU1NUdyBiQTDeoRBFSQP/Z5FAWIHxUGDRlkIHW8ivhnEfJn
 LKhdnh66U2QLLeDbLlev0Ma0ZSkKgUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX5n+FEvFxTRJY
 Up34n8yNyuKbplA4XQLxShGBqp+JyDDOV/O5zTs/kyuhaFN2Q//kc51NNoO4+gcxFnU3uIMaIXN
 b/bFEnoa+rI4DpGvVkXWWl6QALStkTw8O/Pb5oFWdlxZyn/U9JAL+5OiW5hc5uL0FT/+HgW4tFi
 IZqWne3yYNbY9z4OJa9PwsJQSa9fjUmI9e6ls8OMZ4NkgDLN4JpRXPOob54pYt7solsWlKwtmp+
 cYzBEKXQVxhnTInxnTW0canXtH2arrS+p7S26iKwxUpGcko99wE0kYChGRAkMt6sp/16CZqfEfm
 7PliAy4tXckvIMk8NTn8trux/bd9B8K4P7isWbvSwOdv1me44FSNA25yKYb5vxppPwuUrOmpSGA
 qIvGT8LNOX2xy2sSa7b51peaedQVYVJckTG0ytLA8Rak4A0dinjLKuRuPghokUoX6jjSCJccqZu
 XVifRMlmUYZHYITSoSQ==
X-Proofpoint-GUID: JEvcVipzvbKMumNS4jgWJEXTdWxNrREI
X-Proofpoint-ORIG-GUID: JEvcVipzvbKMumNS4jgWJEXTdWxNrREI
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4fa04b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dQQo7YwDhi1l8iBccy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on Nord compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..a7e8dc994b35 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -389,6 +389,11 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

