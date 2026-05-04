Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F6B31B131
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882494; cv=none; b=XjF0xlOV9zeqNhSFdTwTRAI1yp2WS8XOY3CKwmc5JgZlEebmiBKYFcBAs2J5+qQzCCpvImYqYcdewVHEnu0A4kMu28Daq3dDjimpmWCPX7d4/RQX0xq3YkOMXxrFQlb/eZkNB/oKmMVvmAVYvFYVfaj4ieSZ3kwct/FK8kdjmP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882494; c=relaxed/simple;
	bh=FLI0geg6Fz4LJNVJe38o2oRNImLk56h1srt9jDp1Ad4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOjriitfS+hEzpdYYyRNx3CKnuMHy728NY7CezuSK0YM2cBsXRlP+p5q9RkhYYn6/MZxl3M1kT6r0Rb8wb+24gaVsfJfw6pIIs64MDkyHRbKog7Ul1eX2MnOSs4T40z2umBGc0ENSm7gRm2cCmWhc6HDmFSXm3qP+UNMdBReEiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv4QrLRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDwgBny7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv4QrLRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDwgBny7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446Dwcn877381
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nfNktoUxXUD6+d/5pvB4YbxJkjpwKjoCg7C
	QaNqUz0U=; b=kv4QrLRVJA/A30mIXZYDosDt6I/1PiiR8KoS+7hM/qs6HgMA4k6
	fyLrWp+r5T9kEyPuotHQe23DkMFo0dN0Bp6Z1mxcOHAdunbTRItMPYDQ9rpfrNga
	6hN1IoU4Iv+OcW7Wo6iaEphkOWYna+N2FndXwkEj+YfI+Mg8hJ3qrgUn7BkyrNzq
	e55Wja247QQpVGg9Xv8UUb58VdfN2rmNXnIuszwTTecQ7kXcb0uBA/DSGYsQRDe9
	7yiiP/QitqChlt3FI6pBwD7cOsQsnAuGQeLd7cWsYFmd3PttUSQN0AD6nbpzdQE4
	tTWOImkhuDzUM+bu78boHJ7voIyuZaUn6rA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emt8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:14:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3524738eec.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882492; x=1778487292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfNktoUxXUD6+d/5pvB4YbxJkjpwKjoCg7CQaNqUz0U=;
        b=RDwgBny71Z82KUxpEOLbMtdjszC8J89j7QKdCo9Bpzaiu73Q4DnPPTCEAQoq+hpowp
         /qC6AvjZvJOXqcpXMcvOjVfLxFmMOPTfk6uvfaB+QrDkUq1uwdzzVi8RUqeV07HVw1rg
         kcjQ4ImtiOgpuJ4GXJ+RblJveEjTVznSO4gITI8tLFj8+uw3jD62MJoabkHE7DTd+ENh
         LrN7POwpLtewLt3x/SlN4TG6ei1nNnbXRZfdol0rmo75pI8DiZtjfRIfnl2KJviWParr
         eb7OA9qEbP0D+vpf+nLc7UStk66qh7zgHNjNl17xHckX8J+pJQ0U97n6qjajGMhSOhYX
         3cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882492; x=1778487292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfNktoUxXUD6+d/5pvB4YbxJkjpwKjoCg7CQaNqUz0U=;
        b=a0eY1R3VvMb69kZXOzH1Rip1tbYeOanW48Gtjv/QTJe6xAJorMTM3HSsycLMHdY4ZN
         EHk8Colizj4Nr/h4EGK254LOYZwMGpZc6IlKGzweigpF+a+gkpJPVc60cWvmrs8HuXkR
         +M2KOtZlG7yJ/O3ksFB66hSdv/xrU8PdeTrRw57WR3QPqsj8CxY8wMAoZdmfe7XmKQuF
         KYJ1x0dhY239xa4EJ8JTEQp6mjJ5KLgjryGn0K4V2qd3POPZCcw5t2swdwvOXRjoKss3
         QW2B8TYclroUxHDJ9OYSQpSe6PgIKupflmOQV5AzTDIRiRQ0ZYNyoI2PGPVE4II1EO/h
         Ut4w==
X-Forwarded-Encrypted: i=1; AFNElJ/slpbu/rryZim3h+D1qaQtrNmRvCMganXoax4pvPgCVsN3/ZjTDKO/vpZDBDop93ctJQDxXWa9ZNT7@vger.kernel.org
X-Gm-Message-State: AOJu0YyOi1zSiMDhFnhgFjg7YIM1gp9+BjbCOCJN2LeUHmQul4JoM35p
	xD+7GBi99Oove66hPxoo9fu/MC35hRPrnGQSC3rRZWM5SRF8njYEYkwZv/RywNxsWngZSLTeAq7
	1+yUwyhwS5+T97T2fraW/jivhody3zu+psomlJeaUJ5UTvOY22Z3xix/2tMWYmogH
X-Gm-Gg: AeBDietDLhCRpVcH9/B9z5/TOlSavlVF+hpjlBQ8w5miyam+d104mCRYNBssaBG536I
	RdsQzgmjOIN/bBXr+g5eh2CBhva9AVkatwCGUy5Rjur/nEbHus4Wr0hxhNGU0x+9iH/bsNg3CRa
	a5tcwIEps5udMGtQDp+v7+vYtWlt88+xksoa+ZorwNWrJ5XlJQk03cjLG81F14YqlHCo/2ovXu6
	gTg+lvIjuVKBOGZ37e8EfxRuerYS8qJdjhXmPLen16SQ47MGg/brrRqLcDMMd+SOoEhl7pky8Rb
	W4gD1GGfTUspWM4k1vXpNmpcDOgM8moYO8KiFtjS2cpkm5a4buIQgcLea16YWntD3/0NQGxpG8T
	Nc6ZM4gdtsgzSRXShLGsJ87gjLxDkc5DV5J8nCHZ8UdofE5D45Ql3vEJqyBAbnw3ZuldMheLm1M
	pbrYKdH+ova3yPN7Ut
X-Received: by 2002:a05:7300:7fa2:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-2efbaa9db2amr3069698eec.32.1777882491930;
        Mon, 04 May 2026 01:14:51 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa2:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-2efbaa9db2amr3069682eec.32.1777882491413;
        Mon, 04 May 2026 01:14:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm17450886eec.26.2026.05.04.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:14:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
Date: Mon,  4 May 2026 16:14:42 +0800
Message-ID: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gGbsRO_8H4sH2jHC8DWHrbIEawz8uqd0
X-Proofpoint-GUID: gGbsRO_8H4sH2jHC8DWHrbIEawz8uqd0
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f8557c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-P_PvXqPkIm6cR4a8nYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OCBTYWx0ZWRfX4m+WtgKVeq/g
 9Q9AC3ti92Rf0vOXHgvo2EUStmdBOqHHJ91YUQ+AE+TntPmYqlwbz9ddZeuFPXrN/yD3Ecak3qf
 Afr1eUxGQ1P2ZvRvoxJ+WbBNGU3FlaK5oe5jYifs2j8cw2O66f1qCnZA2Cym+BKxtc89vMqLow9
 dfp7l9EFQBd6Fp5bh9SjfMjYpJSSJbut+HjZ+sTlUpm3nUX+W9o+djndBrNR9vriaKHgSQKEOXn
 dT+Vif6+aH9RoicLxJWn6YXmIquLLFuKYNRyUiskCrIjtgLfz2zt891B5VymaSo6JfyX/3D5pyk
 I+dV05bHAOS9gzz6nGi1val4qpjrH++4IStpZjLQge+wDNj4eVtjSM3Wa439zCYJn4j9uHxlYtY
 Dmztw3YBeIumH7VGgYYjO4cvr3kmwKCiVYGya+sX+dmmV2D5nsbPFqlmLreZrwKytsGrIW48ayp
 ol6tPp5Lj8WETXf4IYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040088

Document QMP UFS PHY on Qualcomm Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427012732.231611-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Add Nord compatible to existing qcom,sm8650-qmp-ufs-phy item instead
   of duplicating (Thanks Krzysztof!)
 - Link to v1: https://lore.kernel.org/all/20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b2c5c9a375a3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-qmp-ufs-phy
+              - qcom,nord-qmp-ufs-phy
           - const: qcom,sm8650-qmp-ufs-phy
       - items:
           - enum:
-- 
2.43.0

