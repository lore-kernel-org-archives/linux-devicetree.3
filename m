Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B928488F
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705749; cv=none; b=FlnhDAHEUkri8LexFUVK3rYby8V7qVMd9BKPX9pOLwnc5nDRf79bY9qx/F3kja8fnnjugckg70Htgjlx2spYuSfUnCGAncqloWIBz6sn8snx6yBfJF3TCAZp1zvJQ0gsr43op0Mzb1b3zPZNucoFcoQHaZEPGGspaVYtsy2oalg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705749; c=relaxed/simple;
	bh=4j95AdScqCZUqe78NadBsPLDTCF86ubLqdl/5jQITZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hO//vXEtpUIbn305ZcLmn/y40zUA3Z5wy99Te9xO8fFXeIKlybTiKLbXZM648lMDlHmwMK1mdrYbMjfC4LwQA25LKuMAubK6LAzfLOji0GoUh7Xvyb04qPJN6tzy+Iz2nJ9qMJre+X9clx/JT1ZTJTIIfSnGbXWmuFSoGjuhArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCiZK+C5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv3kbSl0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCiZK+C5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jv3kbSl0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UfWi2851940
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=; b=MCiZK+C5xkpdMfCF
	pUhTzAW3gMPXzSoN1bNcB2CNWC+0CN3POeVCK2sGrjk80vVuP4l1NF9I2eEYghWy
	h2aeQcdq1Q5VWuFrOOa+5NP3fXP0Crm/7CYgSRYdasTJV0M1gP59uuvT7qDWtBzk
	BGAFVV8ayK+p9q6PvWUCbLS1OzuZ+J0XKVOkBgKAbma5bJQQ9fgtvob96/6ZIJ9z
	y2QuLDiHLbC5w4WK+MFxClYxz1tgLUGVzg0d7gj+iQfu1Rgj83Bsn1UqTdnxUKxZ
	Bw4VQdiOYjLtJxKBwGBTRXduGdJIr/QNs/YHs6uDvpjrCGiD1F/PaL6yKybF2Bt+
	RXCDmQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ksqf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:29:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso220446a12.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705746; x=1790310546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=;
        b=Jv3kbSl0QaY5d9aZl0A1p/vPC4oAMeuPtm0wlFQr0Tr+AYdBrWwcQ65g7ngCmEsK5V
         58ahdB8K0H69wptz6kaXXzszRXDxyCisv91Gc5VbBfTDZoHGBXbxpEhFTsodrs2r3mPk
         sH2myarg+z71+c1KfxujAyzen5gjZWPTpuX+MUBrgBJe6T+GS3d7H1EKgVOW0J4sM6TY
         Y4GSHLtKmdjuSsZovW87w/pQsNCtF5QgmxOpfeHcI7iUwq9HcgJ3ieCDubduXmeHtzPi
         64zisFDRLNEWs21M41xLxVXLdhcdTkDvvm5t9woZbCvZrXQhyP1tpd538XQKCtcfi601
         veHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705746; x=1790310546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNSqr+Rk87YOsnTrOXZyhE/rjTTAgCWWWaJtccYCJRo=;
        b=tiABecS9n25KKr7lXD4/HshGKKhvdJ2R/07EvbpKuSu60Dra90g0mKddM0+OMoAq8i
         8HnB9tTfyOHHAcVm4bcChGiSj5/p/4NjGUng7JTZsBLsWFGmEw+W4vXP4hGKLZJnW0Z+
         9agER+MK1d4BtG7G4XHjJ4jMKwsWp9f8q5+BzXCcyO/V7w48w1UtD20qUU44wCu6qIAq
         TT+DeOQQfFz0ClyyNWFyUtVOx9AVRVPBtR3/deg+G/BjkYFME1upiOQnaw6AsllB+boW
         28ZO+YYHN83bNptw47w4IEP/TJKbmGIFW9nmMBq2PuuFsv9rn3g4y7KnX5wpAdVdDWoj
         N9zw==
X-Forwarded-Encrypted: i=1; AKwUvBzNyz5XpdEX2QiOPxYolBH09CMJ5n+XZRBYWuxBfMgansAagBdpjTkyk+T2/16DtZfVBbCN+/w4ykjb@vger.kernel.org
X-Gm-Message-State: AFuF++muo88tY0zYQk0SDGQyrJqpsrxDqegfhrPbuVrLVz/GrvdSa2M9
	Uk2uljo/p+4Ix+luspGo58Zs+6s88u23LDtvR7hKvDm25cEHgb5ZXVyOLSgrA3nP5AwkA75hMio
	Z0AVIsCbm89PMaQHrBe8zVRwqfN+Wjlx21FULPMrKvr510LlSWSXe788W0TL66Gd/
X-Gm-Gg: AYBFou0PIcBgWcDJMoseavyVGRXzk2FdMX6j0IoOW4Uz5dDm7jYGiXILOb6iH4uWp2B
	0Fi+XIpbl7oOZ4GW7OsEO1GikqhrXpCiYq0q7gXin68IuyeNCDfbVgvkUAvW/rT5t02kFlNwUja
	MCj87Q6VVbXN60Y53Lbqs9O6xW+Jqc0TMMHom0Xpq4/fs+gkSX59pzyMYFnB8yCEv5S7mTedOkF
	NEI+3zl2Y60sHkbkNuQQInNFtaLrYanCmsgcxN5JRHcEMdN6BvIyQk0E98H2DVvxFJcBRiqwHn0
	lBEQyZ32EFJc+K/qtzkjlydFc7OtaCUE89C5RH9x4Y/Tz6iq0lXD30t/cRTft2skVUHF9UBV8qU
	rnWvcvdyPOSz7smN5h34Ix1DhP5GHa7c=
X-Received: by 2002:a05:6a21:1690:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd8c39ad61mr2809864637.15.1789705745808;
        Thu, 17 Sep 2026 21:29:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:1690:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd8c39ad61mr2809814637.15.1789705745400;
        Thu, 17 Sep 2026 21:29:05 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:04 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:40 +0800
Subject: [PATCH 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-add_iris_for_hawi-v1-1-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=1480;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=4j95AdScqCZUqe78NadBsPLDTCF86ubLqdl/5jQITZo=;
 b=UOByjBVunhomcKzMaDfypw9PHAHMVJ97wORuq+6SfPAfwq3ZcnGMRssw5XKGY9GbnrZJJitwi
 dHb46wPCYFyB9I6+6uk1TgO1HOkLJ8HUklft7dunsj1xj9os6Al9Ww2
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfXy4Z8hnpEXw5r
 laWXr3J5oajdVatrSB2d/3p42NNAr+9VS4lzCXKkaywPlfuX4s5HKhqeOoe987QjBvUOjG++LFx
 y2orlDDWWGsqlPEFR4PwhwRjaTBekgRnkKiNgVAdkUkeNpGVjv1Q7R845xTDiF6vE6XA/CrKXmz
 SUdPSi1PSeseV9n6LflVjb+JcgG01hruW/GYn6JD0bj6gh/aztKCVeTMRJLU1MxA59YGXr294Rn
 Eny/UlwnEJ0tuFf7U8piGtmcfxjHFOLJ8IbGnOP1A0OcGe3HM0cn+HifmS5q+v8zHNfdVXphLKo
 xE49K/5U8KPOVieY52DLy9m+ewodzEzPPEIk1PRd7T0DmlghtyNvNbZfmJ5+TxXIXad06N+8u7u
 CFl2OjF33H6wJAk2Y1nt6FXLxo+l0IJsDk+FRGrPeKOJInTJmZGPx/ZIsQLRWyR6FOwjb/HJYQB
 Zs+OUqv9TBwXY9yxg7A==
X-Proofpoint-GUID: kX5QFUtXXjF53hTvOZFqqNELFEKN5kSy
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aacbe12 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfXyylgH+OBNyMK
 4kIsJYI+gxc6NLFgcehzLCKtfv9JWK/jd5WMy69HjeW/HZjvLfKA8thlHg66w2TXWvcsZ0V2dM4
 RoSCxGdI+liS9K2E8gXWgu3n8OQtXbo=
X-Proofpoint-ORIG-GUID: kX5QFUtXXjF53hTvOZFqqNELFEKN5kSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180056

The Hawi Soc Iris5 video codec requires more clocks, power domain
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

