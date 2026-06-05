Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28563FE64E
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 05:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638356; cv=none; b=UhfDdnUCsAhlOY5Cy6FoLxv6O4v8qmgfLK9KGJEoR01o/6LTgSd/8ZU6Z1EmpmjqPeoBm7coVhLgImK/6QJx251MTtG1isl5XvH5TWVHecz6d4bYnLJDmYy7iFYa2h/nKlSRlGBJ0ecvnlUKrRWWOH/BpuXZyqxtekKsbcTbCJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638356; c=relaxed/simple;
	bh=gv0Y9MyUS+ZAL4uhHrLN51la10ovmLjoY2+Agz1LIaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLKjyvfyL9TIVjUwX9U1v1E4mZm+zp9rm7qML1sSsZILLmzCOZhoqR6LaPyLH9rlThkp9joT+RsvpDheC6D9cwSTr9/6gNqBph17Oo1kB52yPISnT4Fvm620nUYCv1vjSf3JtlNGhkKniJV8zQB1t8KzxeXesZiWSaoF2/QFqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOqQGO2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqMb2XCg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOqQGO2v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqMb2XCg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6554pVDc3221220
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 05:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3pGinGeW1bQ1ebKAUhXMhB1L9iSucHuKDFvqamx6eg=; b=GOqQGO2vXGIll/WD
	VgnQ1qruMWla29YHLgjfTJxSbHsd9ymvefJC460jLrTY0u//MrS4Kk74LsD2DBhN
	UWduA+fQFuTGPMazy9cZIa0fKg0Bx5kipVuETZ4Lna34pUax+kZ6DGc8WHktiaht
	fX2BW4D5DC7vehTUSeBW6yBlyT6Eem9ROhymmBGkrfUuYlkEYftcput453jCF5qr
	EoeMcbUZoJ7gMRYDjFoUr2qsEsUNiyEWFvDi2GxCVHI5X1yO7VTpiZUowEZ8aTdv
	kuX6SqiE6UMii1vDwigh5jn6J/avdU4gAIwIGijP6+0Czteq3hGDGhdsz12tGfH/
	kz1Paw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95uc839-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:45:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304e7fc90b1so1372258eec.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 22:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638354; x=1781243154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3pGinGeW1bQ1ebKAUhXMhB1L9iSucHuKDFvqamx6eg=;
        b=WqMb2XCgBJO8tuEeGpnNbW1cY+xwFYHJi8Co6X+OH6qm3hNitNLp5a91x4Kgvgpkm+
         6FqrrrZH8Xv+y73kifJ2hl16wm3y9JcTctaCo0t/rv8RcI4VmkdyAs8ZrC3l9tN4VFkk
         ti01hSgh3E/f1SZYWk+/cxuuUaM2ZyMGGjuJJYmv1PwdYyg5X6uKfVvyeKLtlrKRe4+G
         zLDrgCa2ma0L02AiyeLDgOz8x5nv937ImwbD3BXLt7fcuAEf7zpiId1fWZLH+UK/O+YO
         turVGJBMVUfOSj4S9YT9TXmSlCXzT6XD3WB7syFQ+9qJ91ZOJP5CsLL8TMa9yXryhkDP
         ZzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638354; x=1781243154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3pGinGeW1bQ1ebKAUhXMhB1L9iSucHuKDFvqamx6eg=;
        b=dtWEJa7xvOve3KYpMO1W6PSk9Nz/eZB3p5+OjaIPv52P6DY7DOY1gFrMBb8+ZJ32ZY
         uIVkXkh+ufbBXHr4byCzKg3pAumYqC+Zbgrit+3av7kNKAtSs2piwM+BzVRaHEg+qA4d
         84vrKuvqS+9339+rg3Mvk9nv4Qu6cdPjLr4A0Q4BuV6VUrGHoBL1uxpL8jKCJENUr5EQ
         efqn61LqFPDsEswRwRN8sMQmaKDsLcPeD5aQQPH1n94prJ2eQf5MbD0k3RyQpe7yXf5d
         JLKMSDyEgdK+PHNwIWr9c/k4akalavuWEXwBGpFhZw+lr8JlOFIuHqjeaQHRKsQlC7M0
         g88Q==
X-Forwarded-Encrypted: i=1; AFNElJ+yrGw1BfwnEz9ZvgTp6gB08QxwvwYEN4SNxlTIfMDUQSGSSKGJ1LitSse/ZgezeCtTIvx+NCUjB2fj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0l16HkexYdCRzxutRI0P3zY9Cj2uZ1janpM0Tf3+fKhSkSCu
	ur1evSLRbtVmN7glgC3rg6vyO8jRhFYs8AcEqGYyiDt7Vnx5i3T+rzrmdA92cCeVwOhIxs9NuWM
	dVH8KxG0SIIZbxBgT0zkD5L9jdppeOJsXpgP9fdcwErzM1VKl4DUzZBckzHHd7qBU
X-Gm-Gg: Acq92OFsoPj5WRJvWlJFu9ApVt6wwp2h24DY+3YYxnkoFcrYNy5ZtT0QqdGGwZrty+B
	4XwXuZYOR3+6Jx0xBRFW74XAshmmnFkPRNJcvd4KzbtCbb2NXfHUN7zyn5+uxh+d4ZNzdQWOff5
	7EsaiiYjBLRFVTknBDfe97E9wQ5uHafNLvm4MvqWdCOxct0W3h46mn0xDNEJktYggBWOv7fZCNV
	zHfGJJ9WFPfUyx4OrysPT25yzPFc/QeDylPnAwmzVaBwdC0Zl+pNc64D5qcJutY+OixsWFlQQ5s
	YofQwZD9BJ4M+frR5JdZMDF/LQtaHpydpHuCdXFjbnw0uBy9NMzFkaRZsSUynVfdWzumv1VQfFq
	+WLi+1Y7me9co6Os7IUjYKEOv1MaUJ03WspHcZxnIOtEb2CswpjIt82hjMmKki5b0IuBPQ/iDnS
	/vi7ST+J4=
X-Received: by 2002:a05:7301:e2c:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-3077b2d5182mr809803eec.24.1780638353690;
        Thu, 04 Jun 2026 22:45:53 -0700 (PDT)
X-Received: by 2002:a05:7301:e2c:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-3077b2d5182mr809772eec.24.1780638353199;
        Thu, 04 Jun 2026 22:45:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 22:45:46 -0700
Subject: [PATCH v2 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili
 AOSS side channel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-soc-binding-v2-3-21b5e9bd1aa5@oss.qualcomm.com>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
In-Reply-To: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=912;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=CVljbqe5SWj1mK1ZsXqlF5s7x32zAr8qQtASafj7RVw=;
 b=jMGYOKI7IuKuxl7rFv+vy9EOfiu9n0LSqDRKLAM+Vu6R164rGHILsHDPfZKkElHc1Xq3giSPd
 o9WRHjZ95hPD/8EHXVwR7FrSWdiIu0MWfc84uB5g5ifxlMXmb+7aUkL
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a226292 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jk4Rp6uFe9xYLVmVXOEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfX9rd062K71JJL
 d2ve05WfwaFR1lydlC9OGy7DIRRR0XYn830wLIFdVUdSGgItWsnDo/UvEji54XrcR6PpGIkgbwf
 9aY7vIYeb0DkBVfqGZc1ghbEf5Ma9UVqik9IOk3DJ0+M2J3k+7+pEhKjuVRj4G0BWrvfcJir+8Y
 8hsbVvCgmj67UrMoEObdoDJyn84uAhjX9uSvTUxTzdjRKNli75qktIS76esXtitekH9nkdLEven
 aJap9hJvvewCVDsfMAMC26hiHVNhGhoiBuv8xBs1pZqFn+hkJu75GSG5bX0cjLFVzTg46ZZqLzI
 SkYHeA25aqlJuXn/i+RsRZ36m7sl9Hh230G7fv3XIuxoLz+SbU+6ML7ioL23pf7eWNB/4aG46Iz
 taw/FD0EU2v3k9MZ7r6bl+H3dW9SEZnH93Rh+oBwIWZp+GNMNl55U4lcC/Jz/zn4uUTMzpD19CI
 f9M9rwLn8Kc+a/nxbpA==
X-Proofpoint-GUID: VKOa8-4T7SKnyPtOVd-ujLv3Jrn1Jub4
X-Proofpoint-ORIG-GUID: VKOa8-4T7SKnyPtOVd-ujLv3Jrn1Jub4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Document the Always-on Subsystem side channel on Qualcomm Maili SoC.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
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

