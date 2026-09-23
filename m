Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21902FD69A
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131306; cv=none; b=cIM9glO4gD+G2+wMBvRdIQXQU5snEtqMbkAwAtelks89KugBZoSsjgyY7FYWK3rmGlbiLwNyZ47L1nAmIlmCDPZ+CkS+Ao6OsmlFhPxeC8ml8EFuTYAQ1Zj+O3mohXRfLHC56RQP6RdHQgqiFkzT0URf7hcwPA4T3f1dLZeF61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131306; c=relaxed/simple;
	bh=3zxlA9C9JDSmEjes1CWNauY2jFOEDhJh1YydLUT1UMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzDq1Zap7CBKHV8HN5ueOD7SjP4u+JKfENLMrU+JEM1g0Fgp53lJtUw538X8hKoxkIpkuoM5BckMBN9muLEmKLxRW4vNZJNfZWkRzIiDodhElgbtJFzCXFu8OKLYjRDJRpX/md6/lyNkDXzdz1U10/mZ7RkuWgTUHuX89InSJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bA2pmQqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaHmaysT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bA2pmQqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaHmaysT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6qmf178636
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=; b=bA2pmQqUc2avg4UN
	xCfbCNscMs/GPA8JCNyLaWKYI1FwNHK9xQLB1A4D8ZKQMQ8EhjnfpeEDOguQGh+P
	MkAiRXzRdfKd+X7gTI0ctlCeHcnjmKaekrbwT5nmHWmaRjffoSTpD2r+ySnoBdqh
	tfT8eGrSc8TlYEPqDkp6OcL3u0IFCzEpSJUxiS1iKWeLbqndgaxw50PmIlEs9RIJ
	ckEfdjGZGoCSFzuPONBFAnZzlxDvb6pQSP7dE0hsFaPLlz75RQMM7AfxWBf6fLgi
	LGemtbLKlatt7sUFwMdPgdgydgfy04Ou8rQIrW6FXDW7JxmrDHyrhWvVUBQuMZ7U
	3vV9GA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec35uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so501435a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131303; x=1790736103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=;
        b=UaHmaysTmVwj2fTqQWiYL3/luOA9fjLvISXAbOCTiWI23iTxA1AHv/ddnOhwuewu2f
         X7BVPMXhd1RQvshINFct/zLYBo8I1Y1dmPy56LFpIhnn9Ftrpo+vAvZBDB5UpWQrfllN
         roxWYwryHo1SwctJc0cqjGa6/i+PgJbR0xI2CUOjrqqMB/xg9KOlvqfXkOvgLib5zeBN
         h9dRxWm9QvU/McXvzl6Yb1hD7Zk37GFv7I37RvV5bmFoyer/EIndOO2DWFRLXkl06GEl
         96nZ8mawMzTqmT434J/6dnFgjmZ0/dp0fEQBsj8TYBc6p0vXiAg2jXVCE7QEEAyfPAyX
         yjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131303; x=1790736103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVu70ieuUFEGlNRXy7mMCfRjrDkk5y9s41r6Xx2+eZM=;
        b=qHcJSkkCzBxiACcXoeKAvHDj0Zn1bM86bx2Z0ILBC5hkS2EahX1Vw2jQfpiySYtceZ
         r9isLpBS18ww+0UWPwX5ox7EmbpKQF5nDy+ExOXh7sZpjsLfsIP1emozJD+d+mbCkjZB
         Rc/E+Ni3LunjUm21mSWuw23uZF1o7HuB2LEIjdyxjc2tjGKpFyJBQ0VnEKNXqWyr2Rw7
         n7w5yOSvI/82z/XkT4I9YEIaqnrtXjRa3Nomq8/w3Q1xOHdI6YegQCggX4s8i0JfiB77
         /RRLwM3A6NhB2E8fOQOeOURetBycWJpABJt/0ogrl53tvB2po5fqi3wTJVSTAKmy8nzZ
         NuCw==
X-Forwarded-Encrypted: i=1; AKwUvBypVRqx5mqgtm8XpTpTctEwYqCLhfXV/PNJO/3jZZkLpbnNjAXvnL7gaQQrh+2W2KgeYQmk2EoQUy4k@vger.kernel.org
X-Gm-Message-State: AFuF++lcqllg5XW5m3eF1IQmLkdINcIUEHc8ZmR//DNl/oqX6AzLmRug
	i5nbNWD/pIwka1oCbjLiVKRNdBdGoysOVc2SS+/TSvHlJfQMm/++UW6SIEqb8xrYcEne6e4fBg2
	8Hg4aCsW16I5h5aUHAWPHANtR2aLLx6+ZmDDPmMSLxfZLIGX/jiioICCEQWkwiF33
X-Gm-Gg: AYBFou36WRi5YCYC117tfWfylWY/lvJbfRLur6hm88UuO0k9WPdyjmPmN4MylHskrlU
	bMLQzoVA+LjUPpQ3Foc5Txv/B4bgK8YOHrHWSgSNWu+tEUeqFvbBaytfGrPb6ul/GexS8KwVynU
	OkE3xOrK7s85KmXyAWKwoZ9aoe8sNUKVbOm6RHZb2eCqlTCQdYac/afR3bo0bLu+xsYS3gkyQhq
	Prh7knfsAFTtV6J8EhN4KKC1xrsxfT05w4sGo4QVxkLvO5zO0VQiwOkpnyNRuyZZ7SzFtnzk7+w
	A4PKE5wPiNgyx5gSICzq1p1eDTrmrpSVUZcmDSpx2w2xxPuMNHNKmVg0fIvuE8UhMjufmG/da/+
	B9wkt9wxgWjSOAgY01bqHfOa1aVMcEGWJlJGGKlFUOrHygZftUqiMSzFaB5n50FRjUL7n/9vCUQ
	==
X-Received: by 2002:a17:90b:35c6:b0:39e:888:3841 with SMTP id 98e67ed59e1d1-3a0730cc209mr2331120a91.16.1790131303287;
        Tue, 22 Sep 2026 19:41:43 -0700 (PDT)
X-Received: by 2002:a17:90b:35c6:b0:39e:888:3841 with SMTP id 98e67ed59e1d1-3a0730cc209mr2331103a91.16.1790131302713;
        Tue, 22 Sep 2026 19:41:42 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:42 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:11 +0800
Subject: [PATCH v2 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-1-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=1484;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3zxlA9C9JDSmEjes1CWNauY2jFOEDhJh1YydLUT1UMI=;
 b=xC/oZzacAZKTxllMGctJ2NM9Ibdy/kdxR+CmqgGSv0DFgAVOikavTSjoDW6M/PW1ipIa1OeHS
 ZFY2oVh/LGpBn1HKE2Nj23jmmjch15//pD0neGeVB51x+aawwrinMWj
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX25oSGRXrx82A
 zSGECplnTC3TNsuXaKMAzr93DMVYvFQ237DoAS8CAsgxkTMaGw3SNxVT/oxIg8H6wROlFE1wyh8
 nFXrR6gt49dJIB9B040CW667pHNoAm6a79kJEG13UH30sQ/QG5OQ+6DYgPD0G2Np6H2TwnMo3CI
 J3JTTn+hhef0dcL3KZ1dcHpjPbn1hhaj2UkQqzeWjQzvv/rxB4IP2SUUzHEDPGZE3FdUOLXwg1A
 QXYv6QkSei2mds9pa5mV67asHM0+SFzZI642AoVy2LVTKSPiizzF/TlMqeUOqBc17jVyQMeEcEg
 YPw+2NwjIE+Weh/UoSrqFYCchOAzMsnMfItDqd88SsB9cXpaWQyq9wtKCSwgAPUyEVLDOdAnWsC
 WW2Z7PAC+U4wXOr89RNXr+TEXhttt7MDNt/5zM5dIjzA9p9hFnxVQ/Srk11noGbKWJXV8+hvdCt
 stGyiuhnz4C2WJfkCow==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab33c68 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: lBW2JR_KoyAWa_QkE4ZQGiOGlMlMuCMt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfXxzt0IDEsA1v/
 HNN/dgkVgICTA3LmVYgpCtOMdytZutn3GKPaR2ucE61JEuNklRZr5o/E8zz4y0a93qfcQHY9zaP
 fixygKl2AI6fidtaIYCnA99OYKKniRA=
X-Proofpoint-ORIG-GUID: lBW2JR_KoyAWa_QkE4ZQGiOGlMlMuCMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Upcoming Soc's Iris4/5 video codec requires more clocks, power domain
entries and IOMMU mappings than the current limits allow. Relax the
common schema constraints to accommodate it.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..18891f0859eef7e8e3739a4b94e3abcdcb9d6009 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0

