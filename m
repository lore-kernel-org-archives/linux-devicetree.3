Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46302377563
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651909; cv=none; b=gtFLjdCo+Kg8e0nR0y71lsyOuKTyJpp8D/CoL7wlTR2+PrePT6ZEGnJ0Ktu14op7RdjV2NSf8RAJqYbp3RE6huTEZ5DdQ36Ny0PgfPSNRPqKZhn9GD+k5YLQVWSc7T9Z+luL8gUB1oCkjat2JNDCtbqlRkFd86JqcOeGZ1Gfcg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651909; c=relaxed/simple;
	bh=gjdrsWZchMvVDRdOArHg+2j1W7me7uY5LfhLda/2y8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOwBk9ipLtl+gaw0rGx05GBbMGCemSBGQ4txD5+YW86NLfX4bqNXRDv6cTGczkxhCu+0FYW9LJuaYA9Wjdkldr6JVzoOqFZzGhNQYFkTFYiVosVk8enkcj9xwM9k7ykRoK4ysvrpfqMqxoLyS+Oas6/2bqswn9nEbYVgCh5Vc5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFxKoKhB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPjtdMjg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFxKoKhB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPjtdMjg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K1Fr583490902
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Pk9I2oqoNuOYaz6Q3ecto857QAUheGCoqJl
	UFcsvksw=; b=VFxKoKhB+bJltLipwO1q743jAwB9WAurlXDNYBBYKCtsQbNGot+
	RDlPAtecUgUdqL+1zc0cqOb+wzooAJ0KGdMEzLf3qRFdbr9xvIhcSFxZ2qIZYVMt
	frAaIibleI3HePvQCCbujz/Bmxc5ZGm99Wyes9wNccZ/RvnpWmvzUit89FuWIh/G
	f7wNXlaN4sYHIXjtiipQqaUq/iX54ScBSiD3CJQkR9wCwNb/gYS81Fz4r8JxZ8M/
	uEAW3PSsBeVbwnzGLmBEAD4xMepZ/wLjn6XVqFb6oHTZ7we2nPd4CWOT2oVrnTH3
	8qRARWwhBpmMiiQ670AlzhhOEtbmpkahEUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fuqqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:25:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2644772eec.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651906; x=1777256706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pk9I2oqoNuOYaz6Q3ecto857QAUheGCoqJlUFcsvksw=;
        b=QPjtdMjggWaPDB9zb7mIRuKdSU8QA9LB+cWx+71QT+z4fWd98mmwMRvM1lwAhaORoc
         P7aERdEOH9AdqCjlIcoTM/SjIC4nZEh5WMT2qfEDJeXvYGZ3dzVXM/X+KTGxPLfobrkI
         g26H98GY4JCQmV03m+mf1cRyOayAjn9OtQqzh7gk/ZtLpcOKVg0Gp+lOYhvg9KtrmFNB
         Q5bO6jh1kqu8IrXY+a0udRCfZIre1kYF1uuC6ChpySybvnmEru1A8qegHqT47RyHoV0/
         yZMa1CP2FMhvm8Q2pOJaZAjtDS86zd52XVM+3XSfBURTAZltNf3eR49UP2dIHPBm+yKq
         5+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651906; x=1777256706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk9I2oqoNuOYaz6Q3ecto857QAUheGCoqJlUFcsvksw=;
        b=CLZ+2KNzQ/8AeQ0an9g8OsQf4npwkO1USO4vMH9mqHeHJVI1pZEUHlFmIH9j9q8+82
         C1GCpLS/fQcjNbrghj9uY/WOyBVdeGawYh9z1EHPJKz/4GKsPnp8KXjKWRkdmwLBE4D+
         lQFYPzBZxBRmbdVG+42Ap7Nrr/FimULxflUoeyLXLzcyCXcrcMgZzfirHSeUnkPcbaAr
         07bgXfERTBMp+DnVayQwNZ3RDXB6N9OuGJLOEnGQJKH8Vi/Io7XBU8eOTamxMTd94x8i
         kdL0kfyr/9AuJKTY0sV4Juho+bqk9hlYu/DfZLhTV4WPmolY8VuUdyX3+00Iw6bdwBAR
         q0Xw==
X-Forwarded-Encrypted: i=1; AFNElJ9yHF3hi4C8wEMds0pnN3875KMtLO5LmZOVCR4/fSvWU3KT5dyPgJNASqCdMfx5vii3+nUehnXCAbl7@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJ9WUtY/fLNKxMXZhblRkoHtO/vJlnzy4M+rqytEvPR7309FM
	WZBc7bs82ImM8MUTEs3T0wq4u5LK/QxWpIWyKAp+absUvr9i+J3lO25OrGYHxXoPBfIFvr/s3G2
	uR8yIjiIRPh5wAkH6vCMZeUbP9RnrSP4aRziPcVYYxyQmmlmdl5lM2VbheQevXaDB
X-Gm-Gg: AeBDietdt/C+iV75x/TnwR0wB0dfbeQ8F8FmdpZmTjThSaorJw16QyiYcupWGkHkRSu
	UHqeatcqu8LtcqlqQZubbfrbfKSfCkOUWzrWE6OTF/y8mczx4W4yXrBL79nJqLL02hCkupD9UAv
	Pvwrmr8pU3tnu3GlH+M0ABJFQqZvncchlv1WepSf/jA3kUhUSvCOsucWMq0hNEgOVuLEkxt21jR
	LqbAAAVlfgezrYmbt85ICT/hbKJSb3MEZvR1Fxdci+wnrlzA/9HBD1Mv8aUL3T7vdio62Pz1hOe
	bX7nhZYh1o3ETd7UMVE/Uw/Jg3y6fr0Kl9FaKYO3pROQSpbFFvSYfcZmTMxAYyL2o7vMXHSX8us
	vivBCevk/rNloZ98Cwwm108IVqgT7yx/Z9EPgwjTnlIg15Da71qGvoFnUe4qwuPpPPuvNXbl+h6
	mFtElXvdibfF4dtErV
X-Received: by 2002:a05:7300:6c28:b0:2da:9a3c:8062 with SMTP id 5a478bee46e88-2e479c042cbmr6708443eec.17.1776651906272;
        Sun, 19 Apr 2026 19:25:06 -0700 (PDT)
X-Received: by 2002:a05:7300:6c28:b0:2da:9a3c:8062 with SMTP id 5a478bee46e88-2e479c042cbmr6708424eec.17.1776651905709;
        Sun, 19 Apr 2026 19:25:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cff04sm11850392eec.23.2026.04.19.19.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:25:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 10:24:52 +0800
Message-ID: <20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX8iNZAeKkrUka
 HZJLvc1ZH80dCTd1WDOz/07Ckb7pgP5ro1T5YbV+e3GlCiSgmM0Fv3LOWT+RwJUtpkqVs0EXN3/
 0z8klSfiwgseB620Wd4QQop5K+OWWk8zaJzCMqbGzJkYDUTUHT7UqTHW/qQKeJrdkxW/Ui1tLA5
 yLqgyiR9MinZDQpjR3hkkLqA+CaBpuq3GSXfctSqHoCka9pMO0oklG9b39p4fqyz7DhS7a19J4L
 U0vTrcRe66ZOEFoxzJ33BP8cFwX+1ijNPl7zg8PY+n84wDFm0NkPMXUIXurU5AhpwSwFs+AYkEC
 K3b0Tuix19ts8dfp9kMbUsvkhuZE/Ak2xgOAkyvuRy2V6UBQn326+6TSOOcw4gHWKJPXqdIj29I
 4G5n/WfUGV7Zh3gwYGRP0qT4YuOGccD6P0oF6dFuHOPOhbiiUJLp6NOqQ7I7UW6JGLqptNKg3Dv
 xgXN/iOUCzg/60/4NUA==
X-Proofpoint-ORIG-GUID: 3j4KaCE6Pfi_fo1zCgany3B5zVA5R4nP
X-Proofpoint-GUID: 3j4KaCE6Pfi_fo1zCgany3B5zVA5R4nP
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e58e83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=z_hECjq365cVgtSHfckA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200021

Document compatible for Qualcomm Nord SoC APPS SMMU, which has
a fallback on existing compatibles.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..bf29e453058f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0

