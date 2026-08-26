Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002D344046
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787717610; cv=none; b=i2NPZVbO6PCJKSA9RiXtR1H+fAFHZJjnG1bDxnUHXknz851hgB3XwNomznarHo01u/ATuR3amWL8RH15dwbIXN3HWswXTlVquUSp1rtqQzeWSbTE2wjHgUS6sg0NUQ2rIdyY5jVwIHNc5QUZH1tiDqh9bklpFEpnLHOkIZiuQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787717610; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBJa+NxNElr6e/JCq5W4Icx2A9lPJpUZvnE3bT+3TNcSZDex7nF8FJq4TtH69fDsGCV+K4ziMOjb07a2C8iUWmSfVO9OsDRU4CzlFJs59XTf3+GJd9dGlflJMTr7+cQm9qGjWayqnjhy8gmK+EhbOipWYDXYfxyJVnIowcV4AZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZZZHu9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LC7fHurC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZZZHu9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LC7fHurC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HBXh3275655
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=gZZZHu9W0XFBFO579yqt9Bnc4M+
	HjzpMpjWVsXd25Uojcn4woEDxssXTEp/J9q2NNzo551L6C8smrRczGH2jT25L4WS
	fxkwcaak1piTckpUobP7eub7toOf9V0TuyE7lVMB74biTrUNBjX2sALoiUVhtA1g
	W+E7GGpt5VVDx6HWEaHACE4wG91GWo5lTPqJ/tpiahqZEUZvnNr6qONtebeea/4d
	ueYpeJHqwth9+uhDK0HgfmCd/H8+ihc/oXUGzep9fyDsVT8SYEKleeEIoLDVwvQ9
	7X1TyJVI7lu0FTM0QkJMFO3DfrWIDSFMAV9CsC7FNZqSHL0MxHkK1rKCgDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn1xjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso830256a91.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 21:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787717607; x=1788322407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=LC7fHurCrZXoW5DHbEpLlPF5nThoFoqLMo9cH19XI0lPGhvo000+8YxTAkcYEHiurJ
         V2VvLKbaQoA0fpYv+PpU5flnk0dB3qqoZPSD3cl88V1GQHa/q9JrnxOf2GCituCs5jCo
         e+vhWJeeouFa5ky6zfk33sZZBuTJWSrJPDAW6qFA7cqHsFkwOo8DFu96S6+MNAqCGUgt
         NdwsPpQUMlldq937kdW3Oy7q4fNfaGMZUiCfDZ+dyhqZcwbfHwCiXeMfxMHNdEZd86xU
         R9Dr+6nwLWRQucGonMVVN2IQRw14+WSIrr27R/X+Vr3Pq+halO7f6mHP0grKE4reUJ8I
         X/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787717607; x=1788322407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=Wbtgj2PfrV9dBU026tpqj3JBhThucRZzflcTGUqWbhgiOx9FQvLPIIT5mGNpHiCQqY
         Nb3tulICAoSWFOPcOMU3zokbst4DVwmKw6eF/MM4ZIFOr1QYcBEjIHkn+Fj1YyFtZ7iR
         r3n3bhaAKXrG+r/A64CByEGXCm9JiwmsR6YbV1TsrMkvm2t6BS/JrFBxo51w3WgIARZq
         9G/nUT7qt5RJkoccfh9Q6Bk+k296m0pAaQyupWF+BV1OyiRyNz4VDI6u9l4coQoLo0BT
         EjuTCyAwakG5zMexR2yCMIONzit3hPymfybhYfKKwm/d726rb90dNVXLjH+SIO3pVZyq
         p3mQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzLB17N+SYZDCpFawzfy0Tc2bj0lBShRZybCtnrSLLaUwrueYOtZu1TP4MYqZEHoysSPt0UKqrz9nw@vger.kernel.org
X-Gm-Message-State: AFuF++nkG/v7kGtyp7gle4pTP9O5Jb7LADVquL8Xty1S/10W8fSw7qHT
	rVBAXat7jrcdOf8tSYqevmrSlNgbKvt0w8Zs3b/lyl4mq+rNhS6EEwaWaZGV6dz3WsbuCkPMV2T
	il7xh6LNckeKUqk3845tl3B7VCuEK96lHjzC2J3HsVY2FNfrJtThxnvk78hQl/mo1
X-Gm-Gg: AR+sD13TLQkN79VCqTdxELd/pWV1zRpwFmZMchCvfzgF5xR4d+l3WR5EYwF86AQGi1K
	2WxS3pT8ggjANGdvU/qHr1NHlxB5jDi4I52MhcZMJieQhlLENlHT9s8EgVyCEMwTfJeBBurgw5g
	+1aXcIwCEN6rXS0PCCiZ6Ifef/gYeY5BG0zSqRYhQlJ8vXMKDAGox+AWtMQ4UxqgdqiKfyAu8kw
	czHQfBxXR+QrZgBeb7mGrGKKBT62rry0QOUUmr6udzrrCCxEjk08Qxaw2RUTVXB1VFbXd9tZQE1
	pgVSTdCztFvfWyYlafjGVglnXv+RliSVoo/k0Jm2qUWB0AUzd1TQeubMyORBV5a9QJnu7K2FAWJ
	rAHA+TlnLQzw6g8fcH+Ei9yBjySJAS2aWThBkpAh7qV3pHHIJwRV7uV5VfBUI
X-Received: by 2002:a17:90b:4c4c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3966d43edbamr7612475a91.4.1787717607329;
        Tue, 25 Aug 2026 21:13:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3966d43edbamr7612405a91.4.1787717606878;
        Tue, 25 Aug 2026 21:13:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm5979471c88.12.2026.08.25.21.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 21:13:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v12 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Wed, 26 Aug 2026 12:11:58 +0800
Message-ID: <20260826041200.528588-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -6HvWXLBtlyWgM4prVABSXgPglyAo9GL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfX38oFKZKfrTXE
 luP/8RDuDgk6eo4qt/OE8MNXD5ppg3PiBI3pAO5ww2AnhvE1/LRRWV7QYXAAkmCuXxNsMWnWPzP
 H444VWGcfhlXAh04eWFbS5fDf4tMu9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfXxaCTfy205LZN
 UhmcYMk5FWScZ82gueTIqjNShbop8Q86RZs5WG4bly6phMgKk9SzXM89Epr1m2Cli36FLqxIykR
 HgEhy5FXRkLwHrLgyb6upgLrLWVisLQjy+w1VH36kgCig6ITasNV0xtHm+T4RzFKjTwzw18ng8Q
 zputhN1OTZ1JPU49BOkXaJzEvG6bfATEktIuVrvihkDrfpRp4cF4UZlAi0feowLQyExZF7WCLOL
 7G4PXbQaG7MVH+zkgo/6myvid64GAN/GiSVK0p6BsosbS2CGcGGj36xLDscilfsMmxMJlZmnYB9
 oZ224VKDcW4KNfaSsTqzDSj5e0zrxAZ9pzxpmwqKgGycJw7p620wRnnPr8q8MdSOKwC49ZGhtL+
 9FWefvZ+C5w7v+UMz+thnSCOcb/G5RihSYLKViDcS3NeudY2pIKEz/03OzgZdEWIC9xc3zadQn6
 SkqANAENQkDMOVxwbYg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e67e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -6HvWXLBtlyWgM4prVABSXgPglyAo9GL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260032

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

