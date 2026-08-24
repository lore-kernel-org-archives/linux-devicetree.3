Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64C41D12C
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572556; cv=none; b=OJpeHfmoT0UGVx9m8JiJin9Ys3WlAgnh20Te7gbzc7APZsi6Qu6szWK6tsaqFo/ZbW06iGPAWB4Ia96eCdH87HvmgMNMYbDEZM0XbLGvWdq/4mlK51qwcoYNZ6kU+9En8z5vid69XrQd1oWulix8Pu4Amh2d7W8Sk8LMJ2YA3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572556; c=relaxed/simple;
	bh=0cKPDq8bRhl0Foa33+8MRc+vxqpYerlRPHV5hLOc+Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHXseG8vhtv8zMOSr4oo9PLuInO8hqYjw/OZTpjsDg6Cibc9uGkE4byj01Pmgm6RUgfjbFqg+aRdVJbvj0pFuFcHD6OQcgQtnMGcH5fdxS1IIvWrJtv/S86oDrcjH08BLi4LKRN/99DZ/81Y7y8G4QJ6/BaZgGkKW6tLfRJl/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T37+Lv1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WseTfM4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T37+Lv1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WseTfM4S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMPVS2743033
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=; b=T37+Lv1Jfsp0ZESN
	ePGYLj8G6mu/dnJpRN2mZvK73AJUzpwoabZFAPFaaBuzUjJzYxeG4tY7/eqt7kMU
	n5zfxbECHYGQXybWOek3g935FZ3mIsi3zJfUjz4Sid1l16cavWbrXmuEkdwrGxHH
	wW6wXiq7RndYanxbQzfNgqH/ADC3wnbM+cWap/3MrfpWfOzDy3nN+pVRyJ4rJWJf
	kmZ/je4/FxnwETArbgjoPJO4XZg+p5UnbDr4aMet9AsCZJTosIW9mVZ/Mxm/rMCk
	KStvP2EVlMK33qC3HM2lXJZj+vmkZR/EVuRcktxrocGwUeuxnShzB0WEPWX9CDzV
	FN9lAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0wxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so42627641cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572553; x=1788177353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=;
        b=WseTfM4SuNpWM+JJL/5g/9ii5C+PaLjzslX+tbA+DP9vOnOD1qP104dUP6bDDeI3yO
         m74W0YUcC0jetTNiuU6MLWQs+V46joiFyaQJCBMbCekkyKAKebKHYpiFhY3pCMf/rQ9m
         hmTLG0iIaI8jxXKo4wQQYUg7OZchNoYpzA67NQ+kVOdUjO5s+1A1IGgLRjjQ1n305MqH
         yrmTUjiwgNmcknKnKWZ6Px0pTiJ2EWtNIHe5Up/Na7UJgOrLyRdxZTbYL3d89bLo2Kl0
         6wM72JKap3tgMHJfpS/2aL7HAhVzH5hW9swE+Lcp7Zhh+lrT4UUTeSRhrsKbsKyOtZxl
         doAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572553; x=1788177353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=;
        b=hn9LdckdHiWmTz/oooFXCQxdiqngS0LvvYgc0ClrhFq2prKcovo7+tfFlGTG9mocts
         m7y4PoGGjTJDgXpQpq1t2v9fNG+lv1+mn0ITYWgJHNHoHt+GYnX/niC2g2R0lpThyIeL
         C3WCY7dE8yjcT8+n1wbCubHLRtdu/CrGnu6nMSoy9FlcWzyI+FGt47AUJcIWvt5ZzVU5
         hf3YsObW4a0X87SzeQw11hkGVCWHmnJgBzewEehxIodqeyLnJzEAprITe/pBafZz0Yyn
         my0G/E6stwLM+an/o9RKOFfWjRRKxzNZXntT2AD7HmeIGXEisT0J+MCp/JAXio8LGEPN
         b5Nw==
X-Forwarded-Encrypted: i=1; AHgh+RoN6WxiUyUwnBi7pHfOc3wFAZugePqjRNnzUBaK99pj4yIcod1IaPnVK1GAHS41jepy2irvj0CjT2iz@vger.kernel.org
X-Gm-Message-State: AFuF++nR8YgMahdmSt5Bh3mFuNYS0oRu9aBneuALpjRmWZnP6yGPmUhG
	SPoQfjasM64H7AEz6BSgtI43zv2SjDfEr67JgwGtKSQtZmEBfmMHJjNnVnfSXunAmGxM8KvK8ya
	V53EbAbECjCWjpIIpumX/An85xhzCWxvhNvf5tjhq0OmDgXNNMte7RpBysa/c79/B
X-Gm-Gg: AR+sD10SSKNuxaZbCuepcVAm4Mc6zVr1fmO58KNCrA+NqrhQ0Yuk2boETJdNnegyTK/
	xXP4lugAGATsTucPL+bG2dSRI8o9O32pTYOnsEhbiEZUGDHQPHoDMfDEf4kiW12g7Cdkqs3YEdC
	6hcaF/KE5zPpR+5r8VRgbwfkOjWVgWpNtkbbKUXfDt99LgXJOt+sRABOY4SsMiP/81YcVyn41Y2
	eRlkt5hEblhzIpBef3sOIvn0VAq/xqprVKv1YXsuNNTWeR9Q/SAaYQZLCMIa6ijzj1cZBjcqQ9t
	vEJGb+zh5JZWYbGPBj6O+L5FfYMxHkl875A+FrnUylg7ZU/e8E1byQkPPzBvBqnswMjyIBT1hTX
	rWaSWxVpA
X-Received: by 2002:a05:622a:290:b0:516:35fe:5524 with SMTP id d75a77b69052e-52de2f01122mr321571411cf.5.1787572553125;
        Mon, 24 Aug 2026 04:55:53 -0700 (PDT)
X-Received: by 2002:a05:622a:290:b0:516:35fe:5524 with SMTP id d75a77b69052e-52de2f01122mr321570481cf.5.1787572552603;
        Mon, 24 Aug 2026 04:55:52 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:09 +0300
Subject: [PATCH v3 22/47] clk: qcom: gcc-sm4450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-22-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0cKPDq8bRhl0Foa33+8MRc+vxqpYerlRPHV5hLOc+Zw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDqgmd90VHscejGyJts3WL9whMKPGfivzNM1
 kHlnojVVZyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww6gAKCRAbX0TJAJUV
 VkqrEACF9nh/E1bvA2617idNqe9o3HRjWf2q6T+qQqmATHMI5fDmiC8tens3vM5zLYH3nB+gcKR
 axIYoxm6nkGjrXMOJR36gDEiA3ydB496fRNAEaEpDXMi/a70EuXJVNXJdZSq0l7vPHs5iR+3une
 klzOEr61Y4dgDI8ULZUjgXfrQdnQM4G38GSBPP2GbT70yA5lyyAikgCZIa51WsP77KWhNNW9diz
 290J4ScrQCMWRPVD/4HpbWPahPrHnbkdkS/OJYBDO5f8Ax2RXKYIK7+alisiUy6Bq9Ir5EYLEjk
 Oudb1euocyxJhfInT7xY8oZkDPfBuOiWpX/NNYXnyibym1m6omoCE8ggqXcWb6je7A8Xbq16ftS
 5HMyPPDhKSiP3M2BUbIxeYtEO8MsVeWfoHtSLVZKYuvpM1H/lbuihYVPBalH/K6mN/Mr9KRtz+t
 L+iqVgp5LI7/cERKtyynbKq0dWpxwlbpaeVihoNVcl1a/p8sKScPwxEp3B3SUphQ/m//qtyRZL3
 Oq+Cxcmp3SxBdDugrZGycu2bT6EcU6+4dXdZcOLWesf44H0hQoORClhvYAyw5AK6BLl8oz9BbXu
 ermjOQBpmjv68l+B4guSkCm3LDsVOeLTZUS9Pu1u/F9gFid4u9aU2gJ5UMDe9jrPmwg1vvz71Kt
 1FaFrDUk8uzB9cg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX5mUv2uG3aPaj
 2ZTkn/fJl1AbgPMT/QPKvJE39SE6Mr8LEvD4DuByDBBheoxBnhjVKaK53+0PceVaopXr/lAwJDN
 MFTIIfK/7IcRncYH8Pmxdj+JflBg6HxzW1CEDcPMnG5an4aGQkWxO1Tvk+y/hl90SkAPCY9szEZ
 II8HRdPV6ReUjKqKIivzu8L2dg95aNOCiXoEq9e1DopZwGmqrr0KpQcsJ4oQtQQFhaDkMKOe/8U
 TO1wXMWML82zLSz07XuIeVYdPfz04u3jOaLE5TPbCCYJfq5CLxkj0+AEwQ5fl4nXpvRWcrSAxkE
 62/66dGKT/Th6hD1pMKHqVQdmzIfECvw5Q4LcGaRCuYq0vGI70ZPxq+pPpg+HI3+uZaq08JqPZe
 bU16IZSBLX3srgMApXwkv2hIZEhoGajPt2nLqww4mM5FT6BBwKRl7Dwu7olsPuldcTqfgEFcApX
 2VjIZK8G/3z1MAQMxEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxRhtQEeNrIlz
 JmfXUUl5bt9HMzlwQHL9XDHvQM9x1DfrMc2EJzDaJ/ko2s6je30B9VQCYHKODDF+Q8kZ9scvoew
 o6AkBwSAddP92sgi3HIHccMBrFJH3+4=
X-Proofpoint-GUID: __OuXaC9uM4OP1wIhYKQ7ddrNE4PFlDr
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c3149 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: __OuXaC9uM4OP1wIhYKQ7ddrNE4PFlDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 30fc7af09930..41d5f35c8f5e 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2823,6 +2823,7 @@ static const struct qcom_cc_desc gcc_sm4450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm4450_resets),
 	.gdscs = gcc_sm4450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm4450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm4450_match_table[] = {

-- 
2.54.0

