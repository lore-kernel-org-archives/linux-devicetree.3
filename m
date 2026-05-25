Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037EA39B94D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690597; cv=none; b=I+kzhBuMDntRcyr5ILTidABmT2JGtmVg2vK1Y0e8lj18A/Rhu8duZT+QL4vKcPjYuETtH2uNkBu6TwEt/sNfJmj669UzAddwU6FUiMctU07ydaQpdJbQIipqSTg9XGIJNxSJn2fIeZnRhiZD+3Whlu0bHCnNP26nS1Ue8EwCh4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690597; c=relaxed/simple;
	bh=He/ks1fl1XY3Od8AiQUMNJnoXU/UQ0LdPt6+yLk3TUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmJZMlYR3RV7rHpWK2e9dmmXqSb5eJ0wGtNxcGMBE7nJPn4rkZ+gNUzTaVBJqh7kedeBAgLzdSPwYfVLxN391299rjK718jmVFqnGV1Kr+Y8O/q4J40KGGP+xVos/tPf3tAhmz3Kf+kKpMLBz1oZStwMk1qzOor+mlQOGT9JFSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhflI4xY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZpJ3+wp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhflI4xY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZpJ3+wp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OLprhf2904634
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef27iEQ/QJT5/88Q9MJdNPpgnDhI0fjuhKF1bIzsm9c=; b=IhflI4xY/Sgne4c/
	A83XyTb2xIiViFxyLk4uNX0IvZ6UVae6Do5HKjC6gtmOzekm5rF53kLFT2wbupJ0
	AJDWvonvot2R1zI22qDHC48MfZTQ/rC0GMBVXBUn8WCEGeOwQ4zj2m6gz32837pB
	pJQLeBn8EY7kGsxE7Kw9GcMBBcezk+DHq4cVmYbPb8s5u1v9aM3vwbva3P/Ls70y
	6oxwE1nUfpaLq2biIuAvnjLglPPvNujlA2Fh+7HjqmtBD1epADN9tHSxHET2Bz87
	qTvk10NpaaHcpN5rahU3ffNFhF0EMMnllbxnhPOrYlL+4lI3V6ZRna/0e5APWTET
	7cIESw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t5ema-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304627c66ddso3670970eec.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690595; x=1780295395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef27iEQ/QJT5/88Q9MJdNPpgnDhI0fjuhKF1bIzsm9c=;
        b=KZpJ3+wpXL1GSg9Zts0fBduIPRb6b84pwSG+2scE+Hcv3myXgPQU2gqjJIi+gPZjHo
         5pCIxkbGony2Mz7si0lRdbLGcfy6LUjMH8zVZLGrVk5LcH7MTztgvSLSSRfiBYJPVs8H
         WZfb0p+HDY7y+R3YZt6rFBxz7U0NSbRT+DmaKZujO+pUPyD2z5V/WbjgrQaR0Gxfocfl
         fIWQPWiRc5Tc+SYPhDw+lF/sLYH1kCtEAyMy+YTKqeyZzDacZ4eDAvyhIlyxJ2WugLh5
         56TWqcbI43ijX3bdLW3cY4OGxy7WgC4raL/Wkxo4fZ2KbFpbbOsGYmr75XJDJYGnAg7J
         NbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690595; x=1780295395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ef27iEQ/QJT5/88Q9MJdNPpgnDhI0fjuhKF1bIzsm9c=;
        b=Xci1VsQKfLeTmNJ+uYj0O5j8gYGcHV6jegWfB/c+FKw4882YDfFXWB2q/18lhVo1sI
         4f9lUjtPtQfk2V+NZ3Shd1HvmUMJcn12xHYV4YEsnzVMQ9PxaDnVIxhU517iovWSnMFm
         lFRwyPtA4Bf2nCBhgPzX6kbJ7eYC5TLeZKEcoO9GxnQctclnD89l+b/uqz+DR5BqIp+R
         oWlzE7lurHamlr9/dp/xKHckL2U7ihqSsTaAW64baE2+QlqMcM2sTsmODesyCzdtX9PN
         wxTzOMX2gAri9bdoQOWvSjj7dd0dR1an9KC4thlT5nQvx9V9ECoeHHV8ji9oObWD6H8o
         cR5g==
X-Forwarded-Encrypted: i=1; AFNElJ8tEz+hjzuzevmADH6PpnxpU/Rs652CHNZGIBsHgjoROPl879oELVH/mFy4qsfumi48iLormDdDHn2B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx18tXvJbMrGIk5Mi2+EkQJzbKGOxXs47Rmnfa3st7lyBumbdu7
	EeBqKV/r704WNLVeYWyG1F7lj0m2Wc3I99MlW4OLPbtxfC2oj/Z8ldsdA578t6Gi7EIprYvLyAA
	p2QqNGCa0yQ6wr0RIMW5LCm0kzkqu/8ri0hid0XBAsBu42MpdeYXmroR6sk4vjpOF
X-Gm-Gg: Acq92OHhPJDD5DoAifIvdylrGFT4JB9m3Zv6X7auiJUzgEbpAapwd9jFn9vQ560snO3
	O46/gqJ4T82xdNKMlF+GmmIM9MJRge5rCXLOgaGsxnMUpTNezoZQccQIEGyv8Jd1qD0VhXUDzu7
	JPzQwvNF4kZoXnpxLJuyNXiaQj7TUIFEqml5JWH/PEZx23pL8Qmcouk0I1fe0ddbzsFGlmfn3mA
	f2/WFEApV1Z6OrKjOZEhZBbp8LBGzR1QnfC0msrY6VHesfL4IjTCtozBk0pyfOBjZWHt2/2zcBh
	tkIUPEShphv55UYUE6VDEp8cRIHG6koA3hS+Sibe4eMeLJxSW+q931AMaf8QEy4djsRa+5xvJWw
	OCGu8X+pifCaTZOIamHGPnLoPYwDNtLZMZII1L1O6UDPuneilAQStUrmIQe5l8pHm0j6omVvjGt
	F6bKevQI0=
X-Received: by 2002:a05:7300:641a:b0:2ea:ed3e:13b7 with SMTP id 5a478bee46e88-30449024d0bmr6237792eec.7.1779690594444;
        Sun, 24 May 2026 23:29:54 -0700 (PDT)
X-Received: by 2002:a05:7300:641a:b0:2ea:ed3e:13b7 with SMTP id 5a478bee46e88-30449024d0bmr6237765eec.7.1779690593884;
        Sun, 24 May 2026 23:29:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm6918036eec.16.2026.05.24.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:29:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:29:46 -0700
Subject: [PATCH 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili
 AOSS side channel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-soc-binding-v1-3-fdf9f9ff1b23@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
In-Reply-To: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690588; l=853;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=TvbhNH7tixvNZJfOsBq6jkZPUGzlohXVcj37szTmhfc=;
 b=TqYQsOXL8gjhX65AfW2kmwivMC77/JP3b0Ene70/VXQ4kMLxaUh6jM65nrJpdres804eGATx/
 Sw1dYSDWvfwCV/BlGfGb438Rq4P3V/JP/s/bb+fardoZ3fKM8mdTsc0
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: MnUxchCPapN7Th-2kzxbjAaRPCORv8Mi
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a13ec63 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jk4Rp6uFe9xYLVmVXOEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: MnUxchCPapN7Th-2kzxbjAaRPCORv8Mi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfXyxz0blbYOy1Y
 Vqs3OnXVK55fg9NDO0hcyZwbAay5Xe9HVWH4IeGdiRhEM3HbFtCvzSwm53ZRzg6lUaNEWZmEflp
 ZLbxxybP2mkl2vO2/npV8fpbXeEcoJprUdJu2rnGtrDEmtfyiuGBjOXXXbiOhg/xpgARR/Ab0Xw
 Dl7jxJhE2ncGyqk22LfE72f7eymYY1zACqKffYCUu78bHSRqhJszCw9fmKtxTsjz3SSWPE2noBV
 QlJo/1UW5f+0A9K07Xwn23FqqzgS2b08ugKEcnG7HEddXMP2gB6cPd4iUKxxM4UKDqGfD0mLwVY
 Lhv9i2b3FM75MfX3hjDYlXDl0wYk+qKRzi6TA60w5M+lrD4Kaq/lvvKlvfcY6N+JAGYnwK7S8OR
 jTgdd28Xsb8UY90GyhdK/QWBHeV2F1tFivHtbyH4Ug1YbBoD7G4QAwB/xAWz57WoYFgkl6IKyPl
 turCuiUzhWd/sWBlbGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250062

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Document the Always-on Subsystem side channel on Qualcomm Maili SoC.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..9f9d9bcb66c4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,glymur-aoss-qmp
           - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
+          - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp

-- 
2.34.1

