Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452231D367
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725942; cv=none; b=WMb6HN9Qu7qaLB+UHhSQZxy4wKFQ+p/V8em0i4s5YEfH1iSW/JwGEkXAsrjoLxr+ABuQFKGXVHtIWo8JGZwd0MMXWrbR53+kOeU/2y/tsnUCe0+mRDvqFSDWph7KR4f+W8SgIuYCHmJzI2SgnoIsHUxAhpSMNTnrFk65ydOE7E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725942; c=relaxed/simple;
	bh=IsWusAWlosbM4j9npc6qxq97dbDQtPZwoYZI4+aRp5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9MHvCSBLS8lAr0h/s4ujPmNY6wN3a0pGklT2DrHLzMZhora2Bg9OCuC6bi9p7NupzVTpoRDDhDxqsREDkiJK+hpps0csr4JAdYENR7oVniCR0VZ8V5bscCAe+wv7eeXMHm4yxklcztn3ZFwcn2KG893iCpT8AtLNlA+6P154/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWlXyZ2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLJCoW1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWlXyZ2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLJCoW1O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397gS6u674421
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YdYBqRFnyLV
	gWS2qLz1OhP44yxjNcNwnyE3ts9vB+mo=; b=WWlXyZ2SyYOeOevFQKbZB7X55jP
	WFQciUEoIJCkIqaVexo6JNnXn5HjAxNF4e5T8FRm3T4SP8vGEo1njGaEgnDE4lzc
	w+M89GKiVo+IQTC4KUqzP5o7H7H1JNIqHuuU3eTiEqPd9Pp+6xYyo3m8v+PizBIH
	g+x9kjREC0/QM0e1VylAzFbcZq1Zt3wAuP4rO/q4lorP2fg1C9Osp8XlG1bq4XCw
	XXIfflSDeq8bvrhB4W271/OuhdTS6NQnKKLNPJuZg9tmZnn36FD4mGAiEHBHNVN8
	igdhlPp6RubKRBDZ31iN1Jkw7Lzo/y2w2CW7YjDnb9/FaXbiGp6SmfUhFqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmuayg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:12:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso654309eec.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725932; x=1776330732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdYBqRFnyLVgWS2qLz1OhP44yxjNcNwnyE3ts9vB+mo=;
        b=kLJCoW1OFlBB+o71G7ph6ZxrxGI7plV7e9mOwC/eKB6kH6hnKzXpAHNIe640CzeW0R
         H/pU8W1DwqdFJ3Fg0AQBwkitvUmYdRZ8xjN5irDcyzVYVJxd3hquC39GywuH7WX5tCPI
         /va8PJCjLIdCpSqiYDe2kliiiT1PGX7lMiFjR0t8ZHgLurdmZMCegQBDO7ovr8mlxVpI
         R/mVmfWkKnAvhqLheCJvTavVbUuVPQGtfFlm7+P3ANpY6a2PNeQYJduNtWzE2VDq5UuH
         WZ//7YJSDr/C7q/rF8n0fLTNNYwYnrx1J9lb58NmOLRhWTuaMp1G5YZtlxVhALx34loq
         7s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725932; x=1776330732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdYBqRFnyLVgWS2qLz1OhP44yxjNcNwnyE3ts9vB+mo=;
        b=kt+4awqLLARWjb12nO62mNKzB9164z4us2nZaZ2Qw59lhvl0Je6c9VdmMay3OQVKAJ
         e+/HjVAPcPJGatfkiTe9rg36IZjrB+t0kNQDoU4NwYBK1l96c9Ok/ZN1uU9jTrwbP579
         8nYB/XGMkLcwHovwjclHzuG/HnLqDHLnDrjuGpVDol8epANEBMTheSV45yDeBovdkzN7
         X03c4Sut1tRrPpMPPEk8/3f4BFACcz8dPrZIvkUDcZrxeOXWPD7q9mrxNHeCBymkKysP
         Yyhl5O3y6Q0yI9yMhQAelaRHXmneHtCNjHXCQzS864KsZyM/el1XI7XbyYD7+FrMyvJy
         fwxw==
X-Forwarded-Encrypted: i=1; AJvYcCXK7w8gOU/XrWfk7iU2Sl3rRMoEG4pQkMGzXXQcPB3vfw7c20H9cojAolljG72z7ZvXfxddR4RXa9XN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LXNSx6MUgpbWp7QEJIXI3ZbzAwAuliLRJTsVjCVqn6wxGQM+
	GpqMTgHLwh1IM7Z7BV4mNGWCokdA5RolofAsM2SSJ1Gl+zYuRb7ZqQ23ssJ7ryRp2Ur4SMJ6/I1
	Vb8f/bR7hzDp/L+tMWeFEnAJZ+J4CuHQUFlRlk+62SUA9KTIk+r5A4jw2Zr0MqjXb
X-Gm-Gg: AeBDiesTdk0hF/E5jba+AYC5gN8RP6qsLl59tE153n0+sER4PTLCOuGnJfF/7zLAKK4
	P43mgQpAswAyzhzfHFwwZMGnb7s4h79DfS5vIB+bExBA/oQT3gFhKLBHCvVEJ4C9wvPVm9U8wN0
	gGDeJsZ7oTW8o/2zoX+ml0t2ORmB/Q2X8HhBt4OiO0cS8HOAsJ3UrlLaaWE48sRTeSBJ0RDO816
	1lLch33b1MUfHNgxqHcVtryKv8D1XqHe4LJysPOxIqyI0Q3HEHVBDhQFxk8a9ekqkPtzenWhB0e
	agVukwySQ+yYmV87hOiQvK0pK++FwZTPxIqFuhnJ59P2bgo3Q5HjaoA8V4K3WjxtIVUpkxAgb8J
	u1xMnASSmcDW2Eo2kuI5DcsG9fuOk3MEwOY8Yy5Umh1lvivzZn66LFO6KhWjqr5YIglWZD5aVZz
	wFduaCtQ==
X-Received: by 2002:a05:7301:d1b:b0:2c4:b5bf:1d7 with SMTP id 5a478bee46e88-2cbf9af8ba5mr12366814eec.3.1775725932046;
        Thu, 09 Apr 2026 02:12:12 -0700 (PDT)
X-Received: by 2002:a05:7301:d1b:b0:2c4:b5bf:1d7 with SMTP id 5a478bee46e88-2cbf9af8ba5mr12366784eec.3.1775725931433;
        Thu, 09 Apr 2026 02:12:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 7/8] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Thu,  9 Apr 2026 17:10:59 +0800
Message-ID: <20260409091100.474358-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5DJxkuUBQZRJwM2YxB7VaSH_NEMRkfhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX/GoLa4+OhAzH
 OsDNlrZQAXF+5P/a/dsy8o6GQdKNsjz2O3zW0xKhsT2AIeXUpy39ICiSYg8Zsvl+o4ewZTXb0ep
 r426bpHyiD26CLBjtxohTqF65k6DGLDvn2mxdIiztKyP8JiXVntDbdfbDBP49GM8Ghv5IpiwKNk
 RC1Mi8E4CYvRY+jVT5+q5BzU8LWiCuYYeYTNNExqR/JEygTnI1rputiUtEFMGJPSHSJM+Qr0Hdm
 htN+7AQjSo2caSz69ycoOJbFsY5PKa/U959l7gWbnIIS3AmORU04BEuPP3mvdOEMJm0DP0pW9Ji
 /gAV+mMqXFOOQi7YiHTCGbm2LXdJzv9PfuujfRbCKuGA2lQFjGEyXzscQilFLFDUY/79oN49hSy
 QNQVo61guUkCT0yEslZAqwH7EF/BNfR61hJfs2H9L41rr+/CTkKGooLJiCYgaAEsK8p2ULsuCYM
 rPgWL+xcqrXDWlbmuEA==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d76d6d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5DJxkuUBQZRJwM2YxB7VaSH_NEMRkfhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090081

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9f9930fb9a5e..9cb4a8623060 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -927,6 +927,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.43.0

