Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC3D400DF3
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661647; cv=none; b=RLrPI4uYS9VAhrQ5tVO6rPysBzr82ubPsDciBjDNVokkkD5if8kEZzIEq5E4zjYOjohiPhPw1mLKwEfd71NH7oYF6C28vntd7jftQfSpTUb4qqQlt1AktwlklOFGI78h7ZAGUUJkGToR9Oa/Gn0jaI+cNYvGs5YHoD8a/7EHyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661647; c=relaxed/simple;
	bh=G3am0/a/Ijj4U5pm2yL6WwsTqv72Q+O6M5TIZ7omO9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqFj+7pukWgua2u2J17WnrEX06LOndQpqvhEXHzKt/noRoFKhVbr/hTj1xG53J6r/A3IOxvZyPFrOAaCgX26Dv7rRd2JjhngBCThZBwxPRzh/4XOyQsryargrWZGIjhf8bbKuqR/VheXnOcwvP8yFO0OIE/3mXSnM+623u+D4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9UZRBES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3FzneFg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9UZRBES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3FzneFg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47h3D3654914
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=; b=Q9UZRBESwxa427iV
	zYcF16rx3BgqMFpAnE0UZgIdCn8gHcyGim2mxeXkEl5VNuCju6pwR7QWN/eekE4Q
	4xhPF9K5O+4OKZmoh1340bjY1oQRrvex1FHGq3fg+Od2t/uHOXTWLxhIzVxeNSgX
	2jID+6PV1tBxFaFUu25A36J+jepeio8Jfn+1W2XzD/J5Jn8i25RLHo+lGTsKpqrg
	MzGO8CE2Vk88/GpLm/y0BBwgJtDS6+OxNTicv7L1/uS+MseGQEiRrUnVtsf/LwwF
	ghNWk1h8QQFgXLenKshoMo2nkq/uyFd42n3GOY+2dZ2utxSU3CQBougBqS86sil9
	UShzJQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0w27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:00:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7baeea793so1140243a12.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661644; x=1791266444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=;
        b=h3FzneFg9hC1B9r9n3FOHAswt25lAhQvQQB7w3CTdl3g7WXrh5JC4411TAyM675hEu
         W9vjjIP9iGQj37GlsPowqYAljRqe5CWHapTDIZNtJuNqkww7L8AGB5eGsxV+hBFleWuU
         TvO4FwtxvRxFhdY4QgxyQUVh81AFZA3gRtj+UsHnGk7lT4caUQqNLWdW6B4aZ98eH9y8
         +W7KX+IBFgMqnJS/3BcnGoL7DdA0XiZXhstit6VsNyAh5382p9pdQz90txNzFNb3hGR1
         CcmdYD7ePsJl30Dg3Nc8ETSMQG75fyuY+AYRoMbu1+bhcrzIwW7JIMQzXdCd5r+jZgUj
         GYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661644; x=1791266444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=;
        b=mlxEScSg+mEA+D2exb7xqlR8vjthiGc/VJI4rW0djwR05N0ifJdnDxvH05UTLUDEW1
         grpu3C/Pg0JJR5rxau0TXi5bRdIrwHXJyLyoyRUSs62Sj38Ci2t6AVuX4i2dgtw99ATM
         tW5wwPPIA80S3d1kQ6ufxaDfKAvxiIzXGDQ8vmUvvUHGV9vtXIOfbWpE6bLkekkh+hZ9
         98vz7G1NANXsWb0VJhFrqV+8a/pFVHLai84EJXNWpcJDeDplxscaS9hYJRPooZ9wgnBc
         k+8h2LUlnTUscCdpOeNwfDYPW4IFp6va/iwy0yS1VROLzLOOM6QVFt/O1M+S6X49CyZs
         52pg==
X-Forwarded-Encrypted: i=1; AKwUvByDQesnLbBzl4PDKzcwMoZGmUk4OVCwyE10AGNZU/I1WdbnXPQW2A0/gAsQF12p23wrqgR+vpxCDgTV@vger.kernel.org
X-Gm-Message-State: AFq9FYKiBqZEaje9UPj7nw6xUm1kXcgCGOyGFzKbggYAFX4angUendQg
	H8CUMDqRlIROx9ePZL421OMXGnS49ipda/AlVC1HMuyLTtiOXQ/7xPX95bNk/sknyRr8BXrPm2J
	oZ4eMGPzluP1DQa0b+hvQORvw8uw7O9ieaDlimqPSCrz3j3APPqse8WdJZgucrDLe
X-Gm-Gg: AYBFou37q/mu28BsW7r5HKj5DtOmjydj6ttkxQ/e6MPSf1KcggJMqfc3aXGTasIjUOT
	NK4JQ4ORUr1K4HZ7yheFOSmiJi2nti6WPBfzkuGWAr3Dg323kaybF8yY/+Y/qCvjVZvaZzjrAHN
	BpaxNYdrOsn/gR2xEnVxcpGdvwLE0RG7xmQzLaQeJ3N81CQeIPe8BcTqWSdny5B69R7N53Ov8aX
	Yez5pCDL6xtJzRPO74HgfSKGyoUQlDrVKFQyE/kbqNfb5Jy6tPvxfk2JhRBu5smHbvQmC610Q2y
	kq5ucPuKCcUxLCVzYwsadfT0wKbe2DCh6hYWxZ+/AlnsLJ7w2IScWWGrmkBgzBS/9tSTECowcwY
	+iObeSwmiET3YLb7+s9OZFBHGaaJHY8mSZetS+Etw1makaDnfe4pKMUygnRWB09eY8xGZclyliS
	GQM87eGT1FTQ==
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr14573807a91.43.1790661642658;
        Mon, 28 Sep 2026 23:00:42 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr14573757a91.43.1790661642186;
        Mon, 28 Sep 2026 23:00:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:27 -0700
Subject: [PATCH v17 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-1-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX3JP90D97s7uj
 1NX5mIsujrWuJCrmRY4ERpJbRKs7uJkhF3WiuLa/3Nf2SwSGUeunUlMafs18vFvGwFMB/lziTIW
 oRf6Mxg8sWBxwYsI6kDd1ETec77A/jE=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb540c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8sc_bQFcTW-iTt5i-CEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX/VI0NLnwZVqc
 wGn1/invvlBNelDu4Tv+VYjqZtjCu7/Vcug0ZqxOIQQfXXNguc5tjBjjM0kS/kPjyb82ngvfpSR
 SlNvjxp2s4tCkZ2hpJ6pjpHlm/nnqBV5uzGQ0cw3cO8mUqhelv2QnQ2eLNEa84fqGOtd2dv76Aw
 8f4zclq04wIajCFttmH0HpULakM5WjR1NRRWJLpxLcSkGciTXpctsrHoz1KTtXl4gBWIugy4jQf
 QqBKXaeY7JaR+mi+tgrJ3za6/HDVeP26c9oAOSxfp8BNsF7oM5+IR+jfSlF18aG1k5BQA5W0plj
 qjk+bT2EvfU6kVhK7JEDRT28Wga/rqBY0+Ch9Eyx/Vu+LNZI/MErflNJG26HygrKVCxrEO4sgOP
 JW0E3Jt5X0/6qSPVZJafFuzYTRp/zy4dlUFuoIsIFALU+76T4HmeY2nurTBoxQdemCLBh8p1mvc
 u/ZYKSV/8prjs63O+UA==
X-Proofpoint-GUID: Q7dFwKFBuGAmHzkz0W13opnWsHxGzz0G
X-Proofpoint-ORIG-GUID: Q7dFwKFBuGAmHzkz0W13opnWsHxGzz0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c..24ca06b97656 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    enum:
+      - qcom,kaanapali-csi2-phy
+      - qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

