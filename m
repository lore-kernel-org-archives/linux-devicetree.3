Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153141DEC5
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431381; cv=none; b=EQek3RcggICdi7uL2Cgr/h6NF0mDxx/mjsH6T0n2f5JfkxJHXjODQf0huNR1Du+FCgMOim2bssdBhF/z3bhWgsOOHmBiRRuJLeLbgq9cZ72oAupiB7/gvyYqz/TSsOErhO0+qk5px7W8KA5cdiczkjBtWsKTWbraTT6PBxN6cXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431381; c=relaxed/simple;
	bh=Bid4n6JTOA1xgaR4BpC0MMEZzAZiU/fd95e9vAhYLbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhYl1R65UN9WS0OeGPdvpIbvshjvufCunVSmYtkjFYaisKj8RSxpVZiNYYDm2J1Tn2QpoI3RK/dm9ZEUdQiyhmIA6e/OsHurFT5TclDCdP5JOgmYtHQBwREhFnceqOwNQH0BvPxyPxjQv0csxc1ixdXiE+DyJpJBBgtfPH/daTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEnFDe0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kvrj/tv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEnFDe0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kvrj/tv9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8se93749467
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RG56V4Z+Vn0H34SgJrg6IYyHyxjczrTMMPHe2w1Yddg=; b=DEnFDe0Qz7EOZ+3T
	bUZ8HSvP3drPRhGSlgE5424s/l9kcWvrHXUEIeP5lFxi5XZgQ/vxpJzjQoI4xRlS
	fi0xq8oWeEdvZde/rO590vPU+WoLc6rx+DBWHp1sEuEOJ/lrjeCdl17DoE1C5lqo
	8hxt8rKp21f4R7sBWoNdIZkg5oZSiFn1RtKgu8bhhuJ7P0LeDYHUnS5uPACUUhk2
	/NR34am4tZdmpnLRDKvr1iew69mQv7/FMDbC68Xurf2012XOePxD6iEqzcncLWER
	73cRm/qetGB0usIJJnhLcjzgQN11WnMTD+zEbLy0nrX0Hbd2XZgrPwJkOn57tB+n
	CQiTeg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9n9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:36:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dc607c8a54so87745006d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431378; x=1784036178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RG56V4Z+Vn0H34SgJrg6IYyHyxjczrTMMPHe2w1Yddg=;
        b=Kvrj/tv9aNcB8OPpjtN2nlJw6k/DtU6Ugrvh6loLZ79AkkBkklzTfp+Gsy31jw7Axz
         T1bcTAMHrjHDdmo3MSg8cb8F2uuMCMEFbW7J6ls9A7TFCeKYH2s+S5ZgevtXRPtVgpad
         0fwz0/kL0cHMYkr4EkSCf6589U3qujoKXKbE4QILBvV2x7kiLiBFr0UQamWOoKVP4TdC
         RVdcLw783COj4nbTYKDy30XzpIqK+c1KiVjbOmRCR7oLM7DmVMBe74WvQaqVT01LU12X
         l44bjVjt50xIF3SnUvOLn9gG69Mx+vWfxuWfWx51aliIafyfZjHW06W4NBh0VyfTcQZh
         Fukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431378; x=1784036178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RG56V4Z+Vn0H34SgJrg6IYyHyxjczrTMMPHe2w1Yddg=;
        b=syw+4KkLKx6eAPYtNDajO20LZgiOgV8PvvEMIKII3BD+cBM3bpaVtnW3LfFSCkT90X
         xhKkRQw+YCdas1XdUDGTUMX3E35z9DfPLxwG/nU6oTm+Q9nqqa6Or1iXdyj73N9qSukq
         YhWAiifeockBg8Jd7Kbg6r13b4lD2FjyLI2wucY+IwiAMXQPVTkojxRyRj6j6iKFvjGJ
         o6eIwErDsxrJM7xRtKLwRnJf7/wu+4q+V2zHTXQyzPybqdrf4wGPMNVb7stesL8rGLTm
         FEnfIEMbQbrxpLXu7+v4Z5MakPVBMUgNFsMqpxM43hQ14NhlxKV8nvQQHYyKdamuYBVy
         /61w==
X-Forwarded-Encrypted: i=1; AHgh+RpOMVlXolngjSNFKtvaXZhy0BxqDkTpbpOo+Awwx1j8wyKG8jOOXTWkJOYWt9v2wvFuuZpBYjhSqg1u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+zKLFd9coxNSaOQCe2lLOwtVOg+a/iGOB+oAixtD7yYMF4F3S
	pzbthVbKHa6W4lFLp2Ox3E6Daj5lJ0FApx6gDKOLE5i2xmeY5Z/mMa81cwBEtgMXhqnlbjVF3qg
	yDnQudnJeEbvjiaxeAOEwx/H5cz2NyDi3dPyTuZtFAeovM0k9S+RKrGusO04yssb3
X-Gm-Gg: AfdE7cmKtT2imOc8ifTfMDaEnySLnLEJzhFdkLe0kWGSl9BVW85f3lapaBOwKeoDmvc
	TLiD9Wex/PoD6AdLwb0qETMRctmfqJdR3uqFtrfdiwbY6IcfuYyUG/hLGPlosfD5N86tbdMBiBs
	NrK4MtxcrVasKByn6/j9qzJ82rU/wpbYBRLiJbRvSRUEL/t2ktBadd2V8NY1Jcbgvbcl+I4erJY
	LQ4p5YsOh7f/nfp9jyxYryLMUPAhDuGeF4wvUogFmVr/EhmCaQM8+WtLrPaOH2n1IDoEVaHEH3Q
	QGfPSGWGPdbOUelwgP+C49l+kxotKgPiADZhiSW4E0V6bf5Cqi1v3Ozs8wfHumAfP9ijID11az7
	n1ZL7E4sEHraoZHvScR4HuiKCn8iTmau2Tx0=
X-Received: by 2002:ac8:5f51:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-51c747aea11mr56134011cf.8.1783431378103;
        Tue, 07 Jul 2026 06:36:18 -0700 (PDT)
X-Received: by 2002:ac8:5f51:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-51c747aea11mr56132561cf.8.1783431376609;
        Tue, 07 Jul 2026 06:36:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:35:59 +0200
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bid4n6JTOA1xgaR4BpC0MMEZzAZiU/fd95e9vAhYLbs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDIyyfcd2SoKZd3Obd8VwogenShZHZYh1Th4
 fv66xTWJiuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AyAAKCRDBN2bmhouD
 10fyD/4wM3PRZPGPtv/uNCtSOW/0mfGKVAtzZ2CUCF5iFHVjTT5VTDZwmTfnr1XTt/NBtAhhrkG
 YSskW+rdEfL35chbmgshMBEfUbzD3zPrkZAELBLnigMuGVQs4LSGEkhaTPX2i2LQfBZsPaEPl+6
 Pu/SJCgzKUlXYFE5qk0abK0fVWyEOwGoyWgWKadJUFgvMxLNUozq4UPsBgOd+iapNF5lbQ3/4Hi
 IPQbJIyyml8RFlTznHOWvxzS9NfZo6Z4aMmEnzvVAVnjZok2z0rw1O3c7IWcnLUTWqPMiycoqTy
 pFStFE2o2t85I/D4i79LTUudoBXt9rr8ner9rkOe+kdP9F5UB/l25D91nk0X+0Q7vuV7F6tyFpZ
 m2df4EjAm48SK82Tnqo0I/alcdKPmKpT3E1zkoS1M2tfD/6yb4cqrwnioTNqQZYptOyTRqaFMFX
 9SetxFiXifTel5ZHiam+cdq/En2vBYIsGYiFudnAKYGiiLBybSypAys+wPwZ7aS0K3AbEAyiMKb
 xAD/cBhYcyaYH3JZSBzX5caucOEnYo/Knoaqmy+wAvjgXsmaLoTtp9bzP77NxErhr3VCS50m1dV
 nR2aUwO+En0IPXc1/mfeOMseTyjso0T0oLkPQc4KyRnRx+s4jqnmQwAVnWKtdkRPD2NBSiRIrpu
 lN2zHCw3dKY0A5g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d00d2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ujLjCFpqU2tUUBGeNqAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ggG68WuXU09zWlTYngfomxziP9h6X4dD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX+g27Yq4M3nXK
 U0VqOD7f55N+xirytQS3/dL+tooUfYtfdbWVd5zyZY3S6BF+1AjCnY2UrRWK1xDXGpFdeCLverS
 nb0JCCiJ/jHPPV6cslfuQbNrGYWmGes5KwmjXC4PcRVDuk0/sl+l3rmLZiV/hbvt1ljOXo5Pkb5
 uvaEF0hz7cNBC3hrizYnHGHxeuWGGjQDWG8+sVJkkHaErVHFm4HYhcleirxGbUtSRVoaX4a6nPe
 /b2g6QhmtZ5HLV7ZDzJLexHxMqnFbpe6eR8flMnBEYG2xgTqPleiXDGOa2gUYKNS5ybhSuH4cnE
 qUbR1j3wJ3IiBBbs+DsQNviVj2i9qq/y1burw0+2bvPjO9jPyRJ2m2AA8/6l313kqIKxT9SUmUj
 AiFA2sswrHjVnrOptmLKFJ80debyvBrmZ2UK2ds6xn5rG+gpNHT0BRV/4DPoC6UQxVH5yl2jeT4
 pB5mvnHnTWYf0yvGoEw==
X-Proofpoint-ORIG-GUID: ggG68WuXU09zWlTYngfomxziP9h6X4dD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX1+2OLp9cdWVp
 dgoJbw+8rbrl6DSl3EvaVZOFkksteHd6xmn7UgtCNhA6pFkasSPtdUzxkOSMFmrVXwAUao4LFBq
 8NlxtBo19k3pxHBPz9So4ZU6RXQfPfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

Grow the schema checking for proper SoC compatible naming style with
recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua,
Maili, Nord and Shikra.  The list covers only SoC IP blocks, thus no
Hamoa or Talos in the names, because these are codenames but not used
for SoC IP block naming.

Since switching from model numbers to codenames, this list with explicit
codenames will have to grow and list them all in order for the schema to
work.  It feels like a churn, but the compatible naming is still mess,
for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
style (qcom,glymur-pcie).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 37fdd5a080b7..1f9e52d9968d 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -25,7 +25,7 @@ select:
     compatible:
       oneOf:
         - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(glymur|milos).*$"
+        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -36,7 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(glymur|milos)-.*$"
+      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.53.0

