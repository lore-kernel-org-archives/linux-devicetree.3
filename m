Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590E84C9DF4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768962; cv=none; b=aLUojwHv3GM/Scw5O3oN8lWWVpwcpF+XL4rq3OXzwFBA7mD+bbfYnhOijBlWlSJ6jx6jrAJT1zvxL31de0S5KBk5gmBqe/uuX71vLnqaQT3G1zQAda9jXONFOtvi/FVQWKPYU7fFB0NxKsczoYBGYvItw3Geb6G19esR2D/XFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768962; c=relaxed/simple;
	bh=ApeJNtJg2uuP/vbiRmNdqkDoLNz/Tysd5DekOcVETAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHS+6XChdi9lShUxrTtxSuKPyMj/m/15wIWCQ7x62FdP5KP7nX/eAcFR8NFNPy3U/odgfd5DWtdD7soBCVyczTX2QO48bgSa1QXpu6ElvCTIXuWzDab7neALhfdm/pa91EnRPzHn+rR5axBTiHjclH8G+PSMtmgvM4KBMyZ/le0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knSPFgXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiFS8Cnb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knSPFgXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiFS8Cnb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7jrX2678581
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlVKhCgHryZkBLrnlZnf+iSZX++5oXxO7RDEhGF/n9A=; b=knSPFgXfrS00pGn8
	A7bdukjs0giwOkh85f5Ok0Ymly30IjtXSbMNPkgFA1Cq0BsWwc0EzG7NcP3gcx7G
	mGzlhSY0Ku7/bFbSnB5JF00e0tCAcJCgDa2GMGDeAQV/8zk5///0qdyLZz1D2VnM
	qSCMCn5tr56wOxEhGXA92xnPuCcZF+RUfGJpGfGhCloJt01ghQYj3g4kmSguGpau
	Xh47GWopCMBObNaC293WgFac8NNEi83ryojnLoVAwyNMClln1aJuVC3tQbmPaLJq
	pprPWZF5dNq6OaFmK7EU+U0BYdBQn0hi1tXXabJznsYo/usIt4RCmZZMgBYWeICw
	kxyvvw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj9w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:49:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88551591365so1272412b3a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790768960; x=1791373760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlVKhCgHryZkBLrnlZnf+iSZX++5oXxO7RDEhGF/n9A=;
        b=GiFS8Cnbr2VCDIQNUSUdBZGLWb63Zd8eaXfzzv8J4rsxtaF1WaBhksUxMnr+iVJZF7
         yRv7ysjy+YItp6zAtGA7k2ehjt54HOGinWr/eovsTh/OcdzqkAhK9RmvfTtmfxIJdeUh
         k4M/AgkwmtjtW22Fl2GE/Z5R4svVgp58tAC4AHeCQB+rJIPkN8pmZDK5ddPsEQqKNCoo
         rt+lbmUI6bYSp+pQU/hZ4mm5cTSg9Pj5LzijqrogvkWY1omJkwp78yGok4OOkqH6/hJ9
         oA4WsPv4iLFpUX/TPtyf2lq02VXO9YTiu6THQqWsxnXMviPmp+SEfiHC/SSih3RP6Aeu
         VimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768960; x=1791373760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlVKhCgHryZkBLrnlZnf+iSZX++5oXxO7RDEhGF/n9A=;
        b=nnTSXRQhyzN2d9t6egTA+tPNq63jxnxXf4rjILaKTSCVQoIKePQ/PH6omhW76YS3ZD
         1h+OuS8erJyKmnJ7G1NsdB4BCAt6ns+2nc57JVfqlGwjKPaBMHM1gaOVMqmgSjna0KRr
         nBAr7JYiWG8N769oCXvDtNkhY0n4zamSTXHcqDLNF4dZUFIw7deUN52Sw1MuMeDLHUtg
         8tU6rtaqxYlgEeDRAD6PARrW0A/G0ud2CAoyppl65dJD+biL3/nqh229JIduKEv6++x2
         8g5/j300IYjicT8jH9ltD4M08+JmO4O5mSZTFtODNebCmQEtoQxRpdY8oMeHXqkizDny
         ssOQ==
X-Forwarded-Encrypted: i=1; AKwUvByBwabjTGbNch8aYlnMzvJAa0wfc4Gd0mYPOtvoDcbWDQmr/HvGGHoRoeesUPcojuCtCVDjSX1lLfot@vger.kernel.org
X-Gm-Message-State: AFuF++knqGgLr2sABco2uMqGc6UyX5DvAVGR56zE5Q+qRry/URM9rO3p
	hTiljEvBezU5GLUSRkgT2W+gHMBqrYSdDWtZZrWxJ2Bh+Bxm4qswbpQDEW6HVhkCZzXIq2AUBTw
	V8s7pd6+q5hp35rFMUpXUQZapyO+3WxhOAmzxZyTDSq2L5YSrON6ADPW7JSEqdr2M
X-Gm-Gg: AYBFou37iLbUVYsu3RiK2kJ1rftYwwvdnPjdQmT0CHat+0Ce1q0obI5GONX53tGGraO
	ZariErYlbifnVrdMkzg07LTxaQyUcu4EuKV8dVhPFbA8JnV3YaIWWZs2Hgb9Cg68rPbnGM7gQwH
	3CrnG9spdgsUnyM1/0FbJbbYmQLmHwx7muvA9DBhDyXrdmAiBKEVUL25rtl6ivak5CPI0zc0qie
	Lg3AZl4cin29fjlXjDi5cdN93en+fkQpVEQYFa9d9hN4kwsg0f1l2+FHwJeRGYBHRC9Zi4g6vIL
	13Ysyk8asD9rZi4u/Gw4RqzIbn5x1BTrLP9JlogTBh5PWY+y7bmAxX5G0oLYr+XoJxxkWjHT0WD
	p7RvxhHDsQLM2EQ==
X-Received: by 2002:a05:6a00:2d9c:b0:885:ca85:68f9 with SMTP id d2e1a72fcca58-887522a4cfdmr521172b3a.13.1790768959647;
        Wed, 30 Sep 2026 04:49:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9c:b0:885:ca85:68f9 with SMTP id d2e1a72fcca58-887522a4cfdmr521151b3a.13.1790768958942;
        Wed, 30 Sep 2026 04:49:18 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm53163b3a.46.2026.09.30.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:49:18 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:19:03 +0530
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Relax PAS iommus
 item limit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-el2-v2-1-f0822be5aaee@oss.qualcomm.com>
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790768950; l=946;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ApeJNtJg2uuP/vbiRmNdqkDoLNz/Tysd5DekOcVETAQ=;
 b=4Ngh9Rvh79ohRFib07aIUcTOm6g50J5q6GmyLhPbO5fOgWd9lcBmg0dDsgLhIK+DtW6nes0Vx
 RT+iR2F6b56AI9CJ30ByCWO2PrHES+5NCbqAdBzTIUpumEzZi3CRY9o
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX2fz2+2HJFlD8
 uK+Pq18FdSI6kQlW1l741aYwywQ7eAsfSvpWJ1eYmGI8D4TfimCLu445sy7nhYE0LKcid/ZRGsM
 GNFLcETsTXwBJBtoE0OlGuEDuZ3JJ4M=
X-Proofpoint-GUID: EtPvfvBHTwp7IR7l-h5O7b1kS2PF8s1c
X-Proofpoint-ORIG-GUID: EtPvfvBHTwp7IR7l-h5O7b1kS2PF8s1c
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcf740 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nBSyg2lCdujpP7gPECUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXy91SDr/8OIWh
 Hl4CQbU+gLjw9ZnFcBjqtVG8kPZFPd4Z9um5WtkYkmrIRcWS86oq+J9SsIvvAo2k9p+1aMt3m6R
 oVXuyUhWfHfEKGjnxTGFU78C7UWOexMR0uRhVhmzzFt7HZCDEi861ZId5XoAHn1TzGH3UdkuIuj
 BOqvsNS8j1eRB3f1iAlmCPcP1c8ekSwzXfNdXuE7BFeMIzh0jQrC9vb6xtaFNLwjFcPyLHSSFYQ
 1IaVTxGggwo5oISv2SpureM6ZZJsdRFT4IBxe3WXJva+a+2qNC3DXdtCWLaeoLmJK/pE5HVZ8g6
 a2UwS5LftPWHS/7IjkeNFwKD4PERiL49z7XIq55vT4VJRTiZDF5Mkah/vmpoGVIvtQx//KlxQTz
 ugbVtaRUhfidKEH8pG2+ltMF4uvbkPNxZehTGqpSaG9bZ4oD9PhrMn4jr2knuhUZ018hDySsjcr
 NdgvK8Q54eFxcyVGYxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

Some PAS users require more than one IOMMU mapping. Update
qcom,pas-common.yaml to allow up to three iommus entries so
PAS bindings can represent multi-stream mappings used by
platform device trees and avoid dt-schema array length failures.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index f75cab6b4ed9..d56be38aec9e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -33,7 +33,8 @@ properties:
     maxItems: 6
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   power-domains:
     minItems: 1

-- 
2.34.1

