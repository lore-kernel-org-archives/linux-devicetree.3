Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CED474263
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984311; cv=none; b=oj49LyWf2sYPa4evWp6+qVxvdKWUjCGlldzXjtvwnb22lFw6thNc+wfGUGpJi0FrqulGud6a40zLBKrJWUfueGpTtcPZvoRLXyOAt/Cw2ZnfqRZrrLeZOuRp1rFvAPH+hLt1hn+6xniyOWZm5amgR3FmqwGzd0zfqoAYUDRw3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984311; c=relaxed/simple;
	bh=6W43BvwHA+IpXlwv8kwXjiUIJU+UUkDiV1MxQJgJM0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ap4hJ+Nz58hK5BTd4WKaGd1LoJu3OM/mDsoCwwTtbQlkQDjthRG9W+nHuCNv3aTn035+Y7MZ7+4pOe6UNGYmzCrsnh9UQ+rjmxJENcPQQc2hUbnYTAdnqkjp6/PQqrp+Slal09DzMp+kot06bsVTN2WUkfkR+uQnqDzP9ypycgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZFxzqNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZuAyVoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZFxzqNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZuAyVoE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F3IO957083
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=; b=hZFxzqNAS2OI3CBO
	4PrpV/6UiPfsP50NJXrowOB6oZjYnW0GtfwA6FRwgiPWkVgJ2U6WIWeqxAXjhlgD
	I37Tceeyx9EDLJ0Hf6OHzyJa3WN31VMNEYm3iU1rtNr9Rh8H+QwKvvG6z+W3t2F/
	3Wy4I5p1rqpVzOFQcohhpMXa48KSGPkn6MnPPaq6A/fiCx4RB/BNqfyKoBe8vrDs
	yBxrDxr1hERsIXfCj0i2Njs/Mk7GSpHVQklUr3Si0B0gHg7PxAX417Tp3A2FCRqS
	m5cZDme16eu8z4rzBc3Gu+adA3wk5DBhHVuHRRShMT2IvTX05XFbOB9EqDmBh/4k
	uJSNGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0mg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4091858a91.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984308; x=1790589108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=;
        b=YZuAyVoExgH+f24i1gmd+8eGn5ReIumN+thKsRkjTQG82vmHGvd5+UKJilIKmpupt+
         Y+k7/PMskc1vidTDqhP5lRe8c4y+4BJ1FyqD1FodOQK+THMZoXpY+Mey4r5HI1UDwL1k
         3oGbKVR3sUWDtmTGH/fXyF7oQSX+8GxxdL2vRLo/DbUvZ0/JiSvsUMXD06uuz8s1eg5/
         qdQxchOppk8KjP3Zg+DusfEISqS8ov8fJd+tysTD99pDeVzvXtGvBHzeWXHusMEy1SWV
         oaZ33t6oXlbTZ+I+390OqbR1K+/Pj/XASs/tR+MFY+ehnnbTOOvyGEwd7mihRNL5Eizm
         XRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984308; x=1790589108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=;
        b=yk0v6kyHb2DOmm74XyAi8Nwc3HG8kZFMxrsYZ01TmLiB+dDSv1tjy2eN6OhnKbCrSJ
         u/g+cP4/HeCEhodFE6ZqAdppn+uzzGWIicGo7JEywIUTq+YrETQ0+ZRJRWg+SUzn6zIU
         eYa399DQcw0DlOblpKh+kyh02423hb4xeLYskqOqP4Gp27J29BGTK7vbGpvx7iCQrXCV
         pLLK6RRDgfEI+4XiPq0jdBGbeuujEYS/gdP5rZdqdC7JlC8cA0h6F0aXLZXiSOq0zIkZ
         0+YCBoe8Gf59CYyrp7n9jZXyRwkTB8yTDPVDrQk7UneevbIkwiaeMN1CcPjS/0bcw9dq
         NpXA==
X-Forwarded-Encrypted: i=1; AKwUvBxSmIIxS24QtZCgkVM0bslGwU/k6TH367+ievQIfhcJBdb9LJ86GxQla3Jcyw3PTo5bcbnXCPNMaI1D@vger.kernel.org
X-Gm-Message-State: AFuF++lC89Vzxk4Dln7OI/HJek6VigAQY11kU/PM/Isfu9YFYTrg/4Yp
	NkapJXmykCCGfKvtaP0OGg4cFlviD4yGDgUgdk3Ko1Fj+RfOxcvGDtezaHwGC9Dz3p5GUZWZBOn
	5KnUtuLSPkU7UwaHM87v/1R9PP9l0/DFGxH0Bq4Y6Lew8yr6tY2oPSyAXoKImq17Y
X-Gm-Gg: AYBFou2LXVRwFgHhwBZdCShLGqx66zhIL3k0r+Dkai4MbsarlWWK/ePidQC9h+Fdl2A
	WHwAy/7YNy7xT4/7D/X+lCcTrjuSIuV+ozslIE/c71u0N39Ugp1yiNLAeTE8tSEo77i28SetJJk
	YO2t8Ej7WmbhNHQqlQRFLWJmIQEE6zbBD9KnAdRRwshcXXRrXg3+oexXxWSG8dGaKIVUVa/jHln
	3WCzmQ8+8jiqgjVDNjSrnqhenYYI3YumKEKcG05JbyaDZYj+bc2c0t9zACPUTAEvuiQU9zbnyPB
	NM7ntDdonmZdVi4KlrJSYnjMdK/IHH+XyX728DTjzhWK4HKttOPFyq7jC51qADP4DTWImbquo3y
	GS4ytDToeEOaRKaTcTlmNanTc/GWi/5FuRoyl+zUujos0jQR1/zDb6IP2+tWM41HAidwmB0Vk2w
	==
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr70284375ad.37.1789984307785;
        Mon, 21 Sep 2026 02:51:47 -0700 (PDT)
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr70284105ad.37.1789984307347;
        Mon, 21 Sep 2026 02:51:47 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:46 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:34 +0800
Subject: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Document
 Eliza IRIS accelerator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-1-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=1458;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=6W43BvwHA+IpXlwv8kwXjiUIJU+UUkDiV1MxQJgJM0k=;
 b=03mrSIYjGb74v0043xZdV5dHfE5NpPSOhNciwxYPzpcJQhYawtO7DPqcZ9zptKDmbSTfHMUfv
 loUzOPYeZK9AQwFwaD0aPvJ/fdsh5yBlo3IP6KhNuAKpRy5veofYOoQ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: PZnE1lK4j7tLGhTjdVAkv4yadn9Owvuj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXyqKSwXg55dPN
 q27hwtLSAo6Wqw+qt0bYbkzjLWsj7w1E0+mrhGkK4wDN4weyhApZ3QeEn4HuJZ0bMya74UlzehE
 xqPdrAKv2y3ZZviEEtZ2ONgHlxCgqKo=
X-Proofpoint-GUID: PZnE1lK4j7tLGhTjdVAkv4yadn9Owvuj
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0fe34 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX+Ur+q8MJltK8
 mSNg6DBXwj4Aarn71eeolKfNyI5d1DN3e4osmmx9bIyi8XoTuMTBpuhSZV/ntNcqi1SpoiLJOJ0
 056vx7Lv3fQ+Tvub9Xp0WP5Dq9UtMEXxSeTWeaKa7aO89EClCg8vMiflmo7Tqn7dFiUTsgEEMQf
 1SxKybVtlxKkB0CSsl6FLfqJSerc1KwTwsTpJtLUVPg7pPdqoT1RFsNuI94bUq1puW1K/bK9dld
 KC1JHVamKdXEW4D/JQLCt8o/BNJWbQq+4ATDbAtEnYjpX6XtlxYzMDRFOdgeCknSFO/YKWGLrp5
 pwowJBlIY1AwZt1hXfePcdQ8fFlNbm7DlF7ccyJEnUOlKJ6bYfoBQs+mnZzXowlqx3N1B8clmzr
 1Wy6zJN1ns4fyK2bdtT7h+wBtqXBzy/znlrYXxGmx12og5e0OsL9m5Cbr0jKy95t9y+SvXYK0Ti
 hzk7D6yAxC7cqfejPgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
accelerator found on the Eliza platform.

Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
VPU3.3 with an SM8650-compatible clock and reset configuration. Like
SM8650, it requires the bus, xo, and core resets, so include it in the
existing allOf constraint that enforces resets minItems: 3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 6ee9d23554cffb30c92017ef99de15c2493455ac..b97f50bf16f6634bef0e0dc598f9268a654c75d5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,eliza-iris
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
@@ -106,6 +107,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-iris
             - qcom,sm8650-iris
     then:
       properties:

-- 
2.43.0

