Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32B541BA9B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572547; cv=none; b=U3MhKUcRMDf/MZ5SkYJwPN36ew+IrVdfyTiCGHKp4wqV47LaNgf1EgYAbmUpx2WkzNearPdvAo4E1tahjNgNc8oOSz1JsYYgJdjd0VIMXYNDPspyoXmrJlbGpUEaii41DySvCl40saS+lXDxKGY3VPmn+yz/H9WOCrxqeA/Jjeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572547; c=relaxed/simple;
	bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2xcroARUipugiIWERCXeI6KtRS3umvjqoqlUCSqjNsZwsUf+ZRVrNrpCKdlAmBSOIyrXoeFbgtVykjWjrLfE1nhDOrNC1u3Bqkk6vLd+Tipk6YHsWQQjZgbEwtvywkihxKJqe5bxmCYhjfGcRv2KmmrQf0PABy9zhgL6sDX6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbDwN4Jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfrnF8BT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbDwN4Jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfrnF8BT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMmwB2846158
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=; b=BbDwN4Jh+Vsz7xJO
	umA5bGk57tpH3ZWZLGMOraj8fpEJa1pTm6OMN9OyQ9haCUEAdVWz0Fo5qLSpdbmH
	vQz2TqJXpmGVBWXMSQ2EKZMy+86UtWYxA7oQIO2Uu6PlFlsztoHD3km0EU78hj5r
	LG1JMGhfRcM9vnoVCmsR873NYNrOxUt80bdYVzdKoIEeUR26IrIDX/ZFWgslqLRZ
	YG7dF7NEePEfndOI1WjuPM9z34fBF8+g0oBlJTtM+Zukj79AXwtRAY3bF9g2ZkUP
	PPU79Po6Y/xRX7OofI7baitad5/meBqMxNBJPN7r8BobuUHd/kGjJLcDZtQYcZGK
	jdBrOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jh5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso60994391cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572545; x=1788177345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=ZfrnF8BTldY1Y6OI0c/H9YMjPE9A546ruAnagU+jadLq0Fx9PpxPbdi09vMlGNBb7z
         Wz/4pgcTuhvSQvzEbYAwQhOEAu1sHHObVeagkP6WJtQ+bA/lgFfFgMkIJcvTi1Uzy5ZZ
         yfsAVvDMJsQYF2NOI2JjU9BFiOw6eWjLK4ZC/iTwVbtV09Vtvvw2ZWFHfkzxLDQ0Q2IH
         JzWlKRi9mnE+8+O3le0QDICGL58v1FuMvJbJM4OEEsb5ZSmVGNS/dRlHfoLEKPvQMWsK
         HdnQP8DOv71ek6Z2rvpgyhHpCzXYq/zbVQrOiHrfM0LBUrYbpNF3AVf0a/R2QmyDRH+g
         eXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572545; x=1788177345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=nBYWwbwnkiApSk9PunM0ogjhwgUzNuDFy34J0OLCZc+34joqLvhR4bEmSxXJhZAsUm
         vsqnleKRj6VmA23gOimIxBmgbEIgvWtRhz16UdQ2pmnhFjY5kbL2hGQ6fYqV3la4xxxx
         O4LEHROsoZMu8ZFzujl6hjvXfAj7tatWOBvYCgBvh2ZoBiRkos2Jrv/H694akQVkCdgC
         edj0jWAr+KosZvap5uBwsEDnqMDXqfdRxhqD5ayC/qMhnlt6yJVvIqz2F8qZ0ntAyPcD
         fMAxTldPw3hXLvlywDPSIEIArpTQMbvwLukaz/zK4aWOofuiXg3siLlCJhTggorwkYgb
         ZJ/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoiquaJOaS0kwcUoYOm8NSpJpD5iIpDZWtEWL6at1YbQaSCMSCALQ9/uvP7szFrT1F3I0OEJU5+oVrw@vger.kernel.org
X-Gm-Message-State: AFuF++lJOHuZ+e2cRLhccjwEhpN11szObcH1PD1y8AOVayjhlwCcC4FA
	syyHcvk3shCKH/JL3fhyNdCK9d7tqK3COgTD9xAdFWU2UrYAdMyF7+JPktvTZgGNcKYEJVnz+9t
	j3j94AnwXy8hsviX4NOnKBwZnLNIy7G6beRU8umWSXUs6CkB5535xFrn3GVaIflSH
X-Gm-Gg: AR+sD128Cx+Xi6SGliL/ZOdpfsMZnNGX3HSd05n8f+xZt51veveJwH/0foisWmSDKKO
	IYAcFxs2r+MthAt7QZ3aPm8C9KvLo5KPqSSX/Hwt2AdQvmpAzNcEPFrDQdJaIDkmlDI/o82INuG
	8fji2J7UL0y2EYs6CoOPc6FhmheXX9Iv0JaTR5mNkgX8rSzSXmZP7shwOTmac9UNQ1N2cuWXwB7
	VvBx8zagR7pILzcAAbBqb+PkVAhs4OjB89v90LgvTBtKbpaGbG2jFzTrcO4UZ780puP+kxvFqA7
	ovkFGwPR451Cl9PSM1Aitp2OKHXci5C03FNAXWOmaGjttdjMObvDPuSH0SVxbbcow1MMOlz+xtO
	ALDPRGH6v
X-Received: by 2002:a05:622a:1456:b0:516:d83c:edb6 with SMTP id d75a77b69052e-52df5692459mr239115431cf.12.1787572544886;
        Mon, 24 Aug 2026 04:55:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:516:d83c:edb6 with SMTP id d75a77b69052e-52df5692459mr239109021cf.12.1787572539399;
        Mon, 24 Aug 2026 04:55:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:06 +0300
Subject: [PATCH v3 19/47] clk: qcom: gcc-sdm670: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-19-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDnH7t+SC8XBiIl0Utyfmfs5AZfqP80p+fUp
 +5xic0k/WSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5wAKCRAbX0TJAJUV
 VsX1EADFq7yn3f9PRnVu3BXzqwYP0Yc5MVfyCCURfA5sC8JpIcx4kH26rUc7S9arKDjM9PLCo/I
 VvzSIQqwXIP6bdokrlApVa+V2QgtmiGO8mRE8ExEfljso1GSugr2d+Jv7wnGn/D79lS0dc+yY8g
 a/sACixX/P+/Bw/79htVp4M/MAkPW9xgXwsG/ORkXMi6muJ88dwRUUrdMUSHCiFbRh8Y+6Xo+jU
 mdjNG1M4lUwGQHhAIxe2WqstxTAfrFsqZ1wJzoX4LC5HzVhYEGDe+Hqkpn5/GGFRnAGYOYOdJIM
 AOAvDtixL0CWjcX3bbGfps94l5uML5q21wweB6Dm4Un/mnr8EmyOz2aPFA9ToBQXGMymMIRjrxO
 7Lztluoi8p3d8GW//sEkv5PkBjrp/4mpk3XBDqSMdPHyE/wPEydEChsQ7q2gkjNMIsgmJhRbb61
 +y36JuGBgTJAI66XyjZ/IVISLsTCEaNYLitErKnUbnfAOwb2XPVWheXxWOAb47uM7c3ru5/f+oz
 +hTx0cg9mOomyL+H6Z4IP81b1/DcQ+XJRYyBosycpfTC/G92GC1zN+IM8fLf5BIp6hlrAXZ/IZj
 0HYriEHnhiRh3XJm3Pi/cNQs1NUiT2Q+lO5JHTVYy8nkVhysN7HQFnOQIl5eaTKUDoJ0vWNxLIw
 WYXey4UsL1mKg8Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c3142 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2OhR1+9g8lwA
 lq5jK6m89fjxbctUy41aMW4wafrgt6Lfq++T1MjBiIbCZSbh227DsnbEpU/Rh25n+wGyOp8IO6v
 rzeT7wj8EdgUN9cckUUMsbLelje3j4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX1lxTNFnt6Whx
 ba64lQns7DJrknbmIhMR0/3/c1i9gYxRBrRlOJkzaUj8ATHyrMAfhYg7FP1GztuQkiwrJq/Nufh
 T+LKfI+T2BamkcU3XW7X4WitPNySsZLQGtnF8kP6RVWDdf+5vte2iRpmZd/3+PEb/azwGnzYOm5
 lXX/Y5CVMctuirzokAH7oZNTg5HEoz8IB4vqDUbmzPYE2siM8vfA9iy6ngXBJtW8cds/DMr1W/p
 3Pq3TSME9efCr2RwJby3RcivGEv/nVRmzHy/XmE/nzMccCwAmFNks94XRTQ2uinXNaXpr4pTaLm
 AQgrsj+P5BM3ClrV0YHz2wH+mAabJjMtUnQXcSEUR6XPfZwzOYLWnYuvwpmOYbEJjXZazLL4zG8
 ZUJF5nljLSNbGoibYOmtoU6N6De2hvG32f5pgndmC97qQ6m4UEWs1KuFBR2lbZPkMXyZyDnPzCl
 6ge330WqURn8WzXQ/8g==
X-Proofpoint-ORIG-GUID: Y7fmSRIg7ycsDLOF7aim_Y8vqSGklHnf
X-Proofpoint-GUID: Y7fmSRIg7ycsDLOF7aim_Y8vqSGklHnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 6d0f9cede5cf..57d54b45fa52 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3948,6 +3948,7 @@ static const struct qcom_cc_desc gcc_sdm670_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm670_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm670_gdscs),
+	.use_rpm = true,
 };
 
 static const struct qcom_cc_desc gcc_sdm845_desc = {

-- 
2.54.0

