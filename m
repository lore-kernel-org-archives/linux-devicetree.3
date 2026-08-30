Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281622561A7
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061661; cv=none; b=aQ3ZoZSl7aPM3ba9Fh2vniI/d9W3eRiiyvZu41wAc/qAITGitTqCKAgkRQPGW+vNQwZGns26IRhhwa+my1Hlm55Zv/o//ABSK57zEoloLI4P5rKGXDaDvmFrL/IUjqlqdAS+GRqk6D6lD7U/TXv0+u5eoqEqSoxR8v3ymN2T+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061661; c=relaxed/simple;
	bh=RZhefy0Bru+3z6+0XZb/9fKH1WWUBSNbqtpfus9KhRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8amRZPVqUCy48jd2R6P909ctiP8LquFctH8x3R3rCABfGblYpOQABoxqJcPh6/Uka6eLahHkrS7kaTLJs2W0grsF7XrzbvnjMwdfwEh6I88kUMcxX/KGCZ4tbdPupFvQmH41EbTWsF7szzy14Kb0aAiXBl0dg++XAdP986dR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn3cyGjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPNRviSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn3cyGjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPNRviSq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2RxU3413295
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgN
	iG8dIxo8=; b=hn3cyGjFJLwi24X75Y3rmwKbbhGtpQwbGcWaS4tSrnYlFpjD7wS
	Ihgr2fcD0aeH73tfDatMHwenzo8OCNeSv/AL3Rod2v122Sq8IjrVeMdBa5w6pSA0
	HSIBIvkL43F3z3tAMXhJQsNZRTVSplXTmr5IJfPdXgRUNGa6izFftL1+0DqLJX6X
	fImMKbPlkrp+Bbs/iowW8E/0XRhR7Ki/5zK9LmHkO+9bnalwZgUMJ8GMTAFmIa4C
	ukvXFkMzuoILgGaQGJTnFkLcG3FM5A6847ywkK2j+WWSycZvgQV0q8Rj0jvzqfK6
	TQge4biOHz/9DWAyGPAEK/YMWBDV1yHJwqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmt9ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85599cf98e5so4670593b3a.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 20:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788061659; x=1788666459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=LPNRviSqwYdZHmb7A1kPkgCYHC3s3l+/XUKZeeF3Rf+B+baldZ4KyoSo++SZEDl/AX
         I0+sHSL5MDeqgQf07NElZnni03ae8YYGzzXQ1+NcuwIe0UcqhNx0tNBZkL74EKP5C3gH
         6BchpisaWU6jWviVKainTyKykWGY4IkbiIjWCCI4w8PfFSbyczG/Uy8foUYIawQf0uTs
         VN5LP3qVU1wUt4NxNGeIic4FRFY2Td+AmY6BzvIhA2x0iv7S/kXP0xggMjl0FHSOanVk
         ApeZdTzxpHmxkzcLO4VoHxHRiFwneaHgRZSQUbttRbYrE7Ev4apBU+TBMvj/0iDs7aIb
         pTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788061659; x=1788666459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=hCz1e1kP783K569QcFQoH5ZFPwzs1bUYkaUqzWi7IKs9o9GUe4SmrfHOfSs2Terit4
         /gakxEJeiF8/9UgjHYPnyYz4gmbpBF5HH9GgpnrZ6a/zkn0rwv+Xjj5Z0ZE1zKLsJwKa
         xPKqa646rGPAHiPkdkW1eeucNOkEIwlggnDpiYHZ6w7hSrD/Q/8YnDaip7Pidg541+BK
         2cLztJ9sCC/fvo8SAvMQXZiyYhGsdjgDzQmrNqcDtIyTOMzH4U1DvlUDz4rw6cWVkH+p
         kelZJlw/L6EZLIPzOKIGQiyUymxi/zqhZl12iaCzE8tUeoulo7GQO9JsjnGW3dZJanRl
         SaVA==
X-Forwarded-Encrypted: i=1; AHgh+RqttixHrryuMLqb8WJSd8HYAEatALDBEutI6v+vqJCIqK662EGFoRU3Mi16QKaGxdZFPh7eNhWGxsqg@vger.kernel.org
X-Gm-Message-State: AFuF++mtk3I78NmZN8lKBsAE8kMa3vuEwdW0hB4PWqdzS1Q0Mjr+v+Ws
	YZDkeNZPfo3RTTw60OFIpwjfyWqhKC1zDMz/utMnH0jz7ZqbF852Y50TASEoWIqOr2Tq3hmWPmF
	zG3wpLyXgKlh2eP1bggeBVot4R/2SuAftGe+GKGoJ4ovYlK37cuvPs9H7NRHrOYiP
X-Gm-Gg: AR+sD12zxAn/cVSTxgMmC1GsBke5e8MWCs3slgEgKkoUbkxsl5kUuBUwVGSSHayXwg4
	pjLTVL/hDOTudIgbL7jyJpTLb9rZgv9vdFuzBEmsTzM+pnX1a1AtjONIiZT/0KatFgOncKd9b/g
	ynmOXD7pcwcvXZikQuFKIflFOK4NugiqfyE/R23r9RvvJlAWYVxxgVl7ooUmYNZZS912tVZOQHx
	+9DdLPtIDRAk34n8PQkbNCluaS1ofhJ5b/SiD45nhvILhqO+14SXq0KwOV+gPzEOlT/fdLX1Ljv
	0svf4DG57Ri6LFostJmsTb1gIKTIeD8ytV7Y4TnFFTQxp6qNL/JvWA/3xL5SDrTeEzA7EvU5eJn
	a74FxtMeQi9g9Z2dO8LNXODWcZCEiZeHwyRPWwvAK1QOzyMFFPTFKckBwnSCB
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456200637.6.1788061658708;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456170637.6.1788061658310;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm20956768eec.13.2026.08.29.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
Date: Sun, 30 Aug 2026 11:47:19 +0800
Message-ID: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfX+pbY10Nb2l5o
 l+8pHr3yE0oqdePZPmLHeZSrQSw3GGoeWAMcDjwIkkTgHYf5ZXxKDN+gm6lt16SKYi4UZnL3bUI
 5RUuEw3fndvYyXAfCvLStlh5QxkoG1Kdo3fd4KcH+rpbfsPlEuytxI5D5xiAZBaKk7iTZb786/1
 CgCRJOkFpLJac/2COD/4zntFg506mpTY5deT/lVWWolqj9SB5gBaPC2jDo8wwhaNX7QNZPyeKrz
 6L+tfQPTTvzF+fptrNC4M82Mzkxwcg2cKeOChmiTMOLAnQDglQbc/cEbPZhTP/NwzJAfW9U3vf3
 6d4s1ChYn1iTl/IjJtkExywQnNrXW3YlWAH5elCAS7U5NE2IZaI6i2bRk4fuWB4c9oeqzoU/i+H
 IiYQgDXkADS7/4plUjJ6B0ghgeGT8Fut9X1mGJ7iQgBertEuI2yJXLqadGI3sSz0nQ+y40tTGsg
 H0WCumSNKujVx+lmDxg==
X-Proofpoint-ORIG-GUID: 1oZ4ElJMf8fa4FKqowq8A6I0P786Ojx9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfX1DWsen+AuvFw
 bSWj/VLlnAa7SwXnSak0ZnlmYfKg2VUko9QBrp5/EdO9LxE+8VUi/3WtlOwVbi0rSWRmGf9psyL
 AKi73wGv8ShijuSDvQZ5uIVsW6Yr/9o=
X-Proofpoint-GUID: 1oZ4ElJMf8fa4FKqowq8A6I0P786Ojx9
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a93a7db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GXJ8kvFa_VRzmclzPfYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300029

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 5e0ed30a9a46..f6534e9e9912 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,pm8994
           - qcom,pm8998
           - qcom,pma8084
+          - qcom,pmau0102
           - qcom,pmc8180
           - qcom,pmc8180c
           - qcom,pmc8380
-- 
2.43.0

