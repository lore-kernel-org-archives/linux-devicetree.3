Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2E3B4EA0
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962862; cv=none; b=DkbnHL5kC2Wk23DTCwQnINX03oomeK+035cI/zk2gEyVXEBRcsHWmlFOs38s0juHuHsFpEooCF0HxSwI+8F8C4VT9SXwRvkYj/jJNqnvcxurxyajabWYF3cnP6PmEELM08q/u8lG322xgJYxUBhxvLHR4QCpC8OGXVS3gDNpg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962862; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4IghNlzhL8WHagjrUZH5KmklIADMM/sVhbw+vWTHHBsjxhS4qqs/KqrU3kbmx+W80kC+3ec0YMM07cddHJ2Y6Rqq9haNgr11avGgugs4q1nXlk/NZtyKqW/18IGVmJDEDWi0qqsWtFvr9iAU0Q5EkMggFbRucX8LFonyWWyKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwzFy/dx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4j2j3bP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwzFy/dx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4j2j3bP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUn23203254
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=dwzFy/dxDSjeZe1i
	brzIoaqpVs1KQRON13rLJONOW8itu9kDmSm/IeE3bRYRuJmlgRMtVvizREiYIAUD
	x/rLreYicl6Nj6+JcFT1D8mAfCU+h407kKHNPNuqBf/h11APhXVVoYUkd1dcR7IA
	Zn+k90tVdM/K7COfNGyGXbU/5m0FocIbwcDvoOfBPn1QftMZccQyznpHfOzMQ5+8
	jLW5cNyimstN4w3b+xcbsZ/Z6V5BtidvOu7z/3Xj7N3nERU5Qd8d93e2yMGrhX8x
	PK9lA5IoxplNmHbRkxK4Tfk5+NX3ClAl6yulptV8SWJ3yTsOgs/2l4GDgjI5T0x7
	9w1zVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjb0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:07:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so667944a91.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962860; x=1780567660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=T4j2j3bPoMECNcAhHU6+sHUzfMTQGSrEwcB7hkTtl0hpFE0HhFdobppkgZfjGh1P6u
         5YONvfSEe/C7GbaOVYMt0CfDT18mHzX3jVq+Aq9bP+I1PW2ndKQ5bbdeYtgBPExydjEk
         78t0niIxpSPIMGaOzby3o4IK1HYExfcZWspwaJhUI9DeKCHynzWClauCM6IFep3sCSqk
         OdeIxuihfxKE5R79E2HpQjPNKpAxeVJKAqTIghTi/f0BBaLDHcjlsIL7WTF51KjoRr0A
         DHekwrN62WVS35jRuAnCSlclSR4FMuv4Dh6T3hYPLNBTbDNUDVhPMvxQWLCK4zi21vjX
         PSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962860; x=1780567660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=Fk5zUfhJ06rb5wk/pYDy5mF+Uj9DKCAGhn2uNW4QtXKmmcesClLb+NKfQqw3G8kSDs
         xjDn6UzW5foyCR9/ahFEYYh+On2MMQZU497Xi+mFaoWCk1CPQqpZkj9OIYSbq+Z3/qQE
         tda3Fir9pdhMNbxwKPmQc9qiR4lWPeXK/halIwaFeXPySz2Kn7eb/10x4IdJHnkWMbg2
         ZI3LMAVBqZsv57PTEus+lOAZWTa3LmWnqu8RZRdqUsFCmcy++N4fEy3IzV8hvZXNaotj
         itptwQ8tZQKrwn6bNPjKMvAjhs3ErbYMiGZqVJhN0sSUffL9NVVMcKYhp0Fexcfx5Cvn
         NM/w==
X-Forwarded-Encrypted: i=1; AFNElJ/SxrsQe7juz4koezv4jRSWMDGcX0sDng8xEk3jgCyP4KlW/RUu72GvmSPaSH9er8daBagMIEk/NJG0@vger.kernel.org
X-Gm-Message-State: AOJu0YzeCuwU+chONaSiCOkXPHXJfSpD1/T8L+AYxqQ5HMLMMHKqVmle
	+zt7OfpE0ThbgGlQnhlgj+OCgpM2mR8PothGVl8v3F+ZQUoQ9oY1M0IfDFHgz1Wk13gz8c5TMIp
	3i160M5JBYjDcSs0fmzVodGb0ITjQ+Hj+nIH0HHjxvTlSNInxVM8U8N/zIRE/qJre
X-Gm-Gg: Acq92OFOaNihuLDqbm4p6emsR08XQJb/V7g5mZODsMspV8mbstoEhgcoYFo6Drve4bY
	U0uxzuRZDycjQ5HNyg3q86pkpn4y5+EYkPrP3iEvJXFencEIly6FAG95Lmqmp67o/HhOIKXolb8
	p1GMuKkNWcasZmc6YXD3liyhmZuM8g7RGGg1Z36TUvUF8E9kM6/XUQl+95rDWRlUyi4/3t9DPZL
	BxKWHP8OE6KNQOIUlN3H2FAKhwdxkRLU5Bn2nx0kZYsZbNE8ARosuUCRHJof8UOt4BM2U0xWtQB
	ooA+ZXQo4nBaocJy5OjPVwETkHJuidEAhD8ojwt2iqHwmun3tHvUO6KhDGTOo8J1coDNEVm7m22
	bzgSL8LO5zgXJHI1ObfiwRzctXREqsHgQd4LOFg0OmbDo8q7XQr3iO1vRwq51IAA=
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr17921113a91.9.1779962859818;
        Thu, 28 May 2026 03:07:39 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr17921064a91.9.1779962859303;
        Thu, 28 May 2026 03:07:39 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:04 +0530
Subject: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-3-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfXzt4Rs32n4xdY
 zlgh/Qh6zZS1bfIRnbfR1tAlrXJLb9FPZRTRhlAg8zwSUYKJz0bIRoLDCzSY+HvpDbr1imQ3M/x
 OjAGmppnd588ll/LO0v85da8bNbVxaM7j00pjejahZXqqhfoVQjnbWNXbVQxE0OelTBcQ/inpZA
 j8eQ48BEgV4K90y3wAMHVPQbeqsYRbATbToaW+Z2/lsiy04nGa3ITxbk9rHiNTc0hECQNX1oSzv
 vNeVPyZTIabZwLjx1uTPoDVgxU6kwqAn0+VKvvffbzM3e0pSGLvXISMD/GroiVY6H5+bi0/YsJO
 xnidlVvd4CxsO56YL9GzQ72cb82by5If+Ui+Kng1W3QRmri9M8qHy6IkJiYkEf0bLbDRiwBfLz+
 sLEMgqpzYAU3AHyWo/dbMm2DjIQUWswbvR2FQ+58THdGQ9iElM5nm3o2GD1/7LtZ6BtJ1DVUpJN
 MvgMbBTCUK1FFZ1K5/w==
X-Proofpoint-ORIG-GUID: ExiZYBBeRpbdIl3vCMzIqXAJVhU2KgMT
X-Proofpoint-GUID: ExiZYBBeRpbdIl3vCMzIqXAJVhU2KgMT
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1813ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
bindings for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b981a1c899d85435f83f4f3dd3ea9..1bd70d091fcd7b6d7805ac090aaf840a415c123b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

