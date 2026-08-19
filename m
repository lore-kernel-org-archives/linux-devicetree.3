Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBBF3368B0
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144017; cv=none; b=WxhWGwZlv++ymjD/UBhjdANQPXebGqWwdgcb0EbIamCxTu4zuW2YF/CXusXW8vkaeiVE/DzO/VAaSz7mrfW7LZuiendn2CPtou95YcniUBdV7PyDpKwIP/JHZ5Iy5f4MRgDb5sLY8zYBttkQKOq96xRVvrxpuZosBUaEsR8m3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144017; c=relaxed/simple;
	bh=EEPzeKiQRqPtIeuzd2KrTwb1z5xjtGiWFxIPS1hRuYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uiYchqIigTjoTjfHKgvLV+6tuU1yLp3cXLBdWZtmI3eMG9hmDtT04uCwlhwn7YS+ZbJNNn6LmCfLiLCvFIsYTW3Kz0CXzWvMZed/p4oB2ZxX3juuE49BKUgOT/39B52Ftp0TTe6xZaFDmQkWR2QhI/4k0wLrckQOCg1WSGudohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKGv60er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JN+/VjE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKGv60er";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JN+/VjE5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClNiA4107189
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/d+1zB0csAnS/x9UR4V11sunfnFsuJDzxvGd0DVjAM=; b=mKGv60erSSMK2fI8
	gDtKTekRKpeJp7E29ZjwExaD54XgV8qCbD1GZBnUemKeHIMBvJt5h9+YZx6Ukl/l
	ChI3tOhkHAoBRclCAtkxuRKU+OPPUu8lr8/BF8Q5N8W1KFoUqJYE+mwZI4Zlc8gh
	ojZh2a/wJNy4LWBq7VMKkg8wbpLPl0PqjcF3jz37mh1kfTmUPnme/fK4XmAu3V4l
	2x+q2nGPMs35cpcYpb375oSIG4WBgWB445LIY5TWJbzFnnbebsoECDVL9nQUE9Tf
	az6lWlFuoTzn7mm4ijM2OJ4foA1HKw7hGuWdpTtGEJURvPGVtJspaSiLxOtWKrq8
	1xKjFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffk67b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e538afe65so148661785a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144014; x=1787748814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/d+1zB0csAnS/x9UR4V11sunfnFsuJDzxvGd0DVjAM=;
        b=JN+/VjE5wZVvkBG++mZF1fJ8N3jaJuOrfkbRj+65g+VlUa7oR3Gz3p7+xHpe7ntama
         0HbtTaJ8vRkQzETQGnGPBZ2POhB4itlSqUDZiq6wfaC6o0smsQGFCmhcyJ787i6D9qet
         TKInjDUEDXOCiJ7B4fi0cWI5/MG+71Ot0LVBgTwSuH2vsvNuBPrki3fB4QrylZG4vSZe
         Or7A0y2r9ERQf0AMtTHaAk9/8tTxWBNfCa10/7zTXLVTe4O2wN6sW177CGDQ1OZUjzw3
         5bKKt1RojG2OFBjxFGijWjDHo5iKUXBpxwcBpF3+D+olZGoUy6nVGFrdBMA/uIuzEEVz
         PbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144014; x=1787748814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/d+1zB0csAnS/x9UR4V11sunfnFsuJDzxvGd0DVjAM=;
        b=hVx/NEB8ZCtJRZQjmcEBfL6DPOZrvKJ8bPeZAGygDmcHlSBYOAwXCoyS69AwXQw9Cj
         wmDkeEsGGUq9U3lLdltBFJ5dlR0sdsGBrVLEKNOo5VNRFGadbNnK2Y9PYfZaVjZrVdAi
         H2AmkepA65V8cBODmMEUGu59Z3Ne7lMpLMV0LsoADKp5SadMLbIMG0+VfR7kxUsAEzCt
         /lNoHt32M5oC9PA39YIeoN7FnKFKyR1zrA0EHLRLVVzMVC7cgT4u6dfXcMxUCFIlzyNk
         JH3V1Jqep5gkViYdsWG2MnDaKvzkXc7LZBbUpmtyT3wSa4/5oT/GEHhfdbpwC7uHZAkg
         +pTQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro65L4AhLll24ewKovDNX6i/VSCG23qHZ+eOhnKeMfGKfPbfsEWG8M7d48y9hOpOYjafsZ3irDMpW3e@vger.kernel.org
X-Gm-Message-State: AOJu0YzZeKtJdHqjv0QgH6msua9f3iFyxFQ/cP0BEpb7w+bV05Suj03n
	DUlbRK6HvkEz+MIASen+xp5egYGJCWj/NccWBE75XK0M+De4+Gm83KyzBbFNS1aoc7hQ4uYllLP
	naJnD6WV/NQm/B/gQmKGgnxUg5z/N7deK93/Me5/bZejGTZl7FyNk/OlQBJSzgUed
X-Gm-Gg: AR+sD12Uc+ngHeKQST5c9u3aFkBf4QcNk5mhEy2JLjeWvgCJSDZTSKlTP+Waj7fEtD2
	TpqQFSD6sanPSjCtSMM1/3FAHeL3HHy9lBTM0/iwMdKYPr0Bi7Espgtnkdwa5wyEV9c7Ub9pw5d
	a58/8NYntRrPTatDh0dImUFKAqvMeR+L2USwep/ImAqHtBUA/aPThFZNp5gynFpG3HB/kr+E194
	TinB7g47Z0dbpoIraEp+FtP0wB/QsCyIYnAZYe+HuB3q5oMhIfCPijQgjeRzwYhaykTENGL/rei
	X1Sh1+PgDpnU8ikksWE7oJnncztOSZ0p3jAqbY3klgfCPuaj/cs+OeuHmtbZrYH9Y3GaUz/7wwb
	HZ2C86n1U
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr418716185a.15.1787144013659;
        Wed, 19 Aug 2026 05:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr418710885a.15.1787144013132;
        Wed, 19 Aug 2026 05:53:33 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:53 +0300
Subject: [PATCH 08/16] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-8-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EEPzeKiQRqPtIeuzd2KrTwb1z5xjtGiWFxIPS1hRuYs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacP5DIfgv8tCSSMTRmpwMluEQG0kFwxzasEz
 g+jBIO54yyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnDwAKCRAbX0TJAJUV
 VrfUEADMe7Q4DJobGQi66cyQp4uBdvSex9Udu8JuO1aHuuPcaLKIJxLd00nxhZz9bpFsOexGcw7
 gtWR4vC/7HICYBIAARN996WLEjioeGQmEx0AqwrsjqosAvmvr2NFuRM+osyCpzr91tO2Gk6XRxZ
 8hf367DTJ1TYDTuA/tcwFKGjaO0gTD+Ym56G3Ajkdh+ICnHkR/xO9t3zlv0UkkwBCI0b371VGbE
 bZQJjXHyBz1SIH1uzoF5jzbv//+HzXNuY5tPn0u5UC0QkL4PPk5GUXlqW0qzBRz8xrekMvE4//B
 ybnBpEpK/sW7pQHhgZBvGI4/rH6CITqvXebkjeciAII+IWlDN1i063l6hNcIvDWxtRMTr3KSfRf
 NIxHtuhsxfAqyZ4UdCcHIAmcJdknAU0LgInVnWFVhv48OG3KJu42cYEDuW3v1c/zEFuMs7WH25v
 K078d87LxH13PgE7vcjV9hvxOM1Ro5LWZpNAgJmGmzclFqe7MQJI75DmR3TAzrOAl9c1RjrKsF3
 UnPCBoReHjKyS7FNTEl/XIE3bmD5XU2t/J5m2STnEuk4khQwgJXR7RMvawQ1il69qnsIzYbvqfR
 bL9OUbBhdzgFxQLnQTu4SWIz4ThyWPBUWZ2uGsVjBAqDffmKe6aBFwwIKhNXHZ+1bAsDq1UaI3O
 KFblzPD0Pha/ApQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX+IonycUUos7J
 0sSoNZc/nP0X+VnRwXimWm+D9z84qOJFErdhrUExa0MlfhVfgE31L5o27ccdjJHVBMauFiYj7JD
 8jjdigmcBa9SQHBkNrQB+LOI904klUo=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85a74e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DgtPsJVQnZPACjYlq_Asx_EdgDrIwJnw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXwAH+k4tyM5fv
 oYuQVX1U/x0DV6dfB3FOEdiv1ER7Bf4sdulp3YzgycJ8WoMwtMg1JF1k+gCye0nzTq/IQLhbV2P
 iji7p4ceevBFDzjxWhKAhWfU4pBp2eyj+i5xmReRFcUZfuEKDacoewLuKZ0W37XF5uQSS+dup4E
 0J1PjGhhoGOfZJvy2w/3NdM1+McR+O8plbKsFO2A6GRfbds0UbLJ8q/GHlKNJDvh/1EkFZo32/v
 phyqL7Sr7FtoYEpcjMTkkCgUcGS4kySUucuSCQs8KxZrW6FYRy3f02MVlnEQNY79pj/dhHfAjc2
 zbsmT4UKZ2fYJLaLSYLlEeXLgZpl4QpvYLELocxTLQS7B18Y4THRFb1lIM18f8i0xNgHcpmi3mv
 g8WBwvFr46pKQuC6nYbSKuspTVzvD8YSZ4JBUz3exlWJvPIVuDIfP1E+Jn/VKgC3L05jwvn4j3i
 gU54bHkvg1OGawHKgEw==
X-Proofpoint-GUID: DgtPsJVQnZPACjYlq_Asx_EdgDrIwJnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..601c81c84450 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.resets = gcc_qcs615_resets,
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
 };
 

-- 
2.54.0

