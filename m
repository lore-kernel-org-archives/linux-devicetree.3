Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57736A03A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017264; cv=none; b=epi7cJSaltpO4l0hO9nvSKgp3O7JT2gsZJ/wMOGcKaK4MfaF7BasvJ+OdpyJS+X2rwC72OP5jjAOfnWp4BO76aWyP/qKtD9XhSu6Vj4GPW6zfrP6u9Z6we7l7O0V++xuaMaIgHWTJuUjAe+jhNt1RXcKaL9GjYrBYQysusg+Axw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017264; c=relaxed/simple;
	bh=coucDPCtTPijonyA8RvkPeT4AJ3BXja7sjzuQEwuMh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pogO2BryTZbqG2f1zGmRZ41Vj6xaIGJHjSHxKQFA7JmbdQT57pE3k1gilrhFCdnQxvoX8XhtihjIrZqeQjhr6TLm7eVe6GhWm0FB2lcwSXeP5nPCYa2iOgQYN6XSUwJDTI+kJaZm5nTXGpEFyPYWSsn2fECPB0ZS6OI2i5+RwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbGKjUBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImzsNj53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbGKjUBQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImzsNj53"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUeqf866109
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=; b=fbGKjUBQo9EKxPT3
	OyMXpjY7I9SmebKfHqzyO7gb8eZ6v/IY+je+Y6WXUS+VyRQzbgrPB8rnJl2Uaxw+
	KEVO3acdYY0BeQ2YrsYJQuZdoZT0UcbW255/CSHQGiDiqqQC7AUFcISyGL38coT+
	ePnmuEM2PX4SCQZXEGPdllZeex0eiN5MNlfnjey0dv4TMrVir3FxVj0zSn6loNRe
	QpCu/qm8pz2GYnxta057a/mEaaOCk3pd05Y8rSqLGq3Ui5l71DUdwRSRcqn+6eU5
	2jsU/6B05y4jrF21/DFPbk79s2eSowovxktgaCEKhXyB9jx4vN1IM8w4PeKuiGcv
	eMTKfw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngrh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:34:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2786384a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017261; x=1783622061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=;
        b=ImzsNj53rhWwJczGlQPHUnAYiPEor6V/Dj+BhN+6tOlKhjgaafEguY9oyY9sGVj+Mx
         2kOyileeTnEMVWQYxfatfChsi7pdZwraT4YJNcKuuhw/lXyB5Bau/UB4Olyomu/xjx7D
         hLKAAHTLoD2FtfZDgmBBcdfLnK+XmXoYrhhTLwdaW/LNkn8SRaoGvPRBnPM/bXCnAIf6
         iWYIlfQuCIYeLdQHpGVMr/e5kwRNWKbb8eHVWMmRTEz3TLH8ZZjLbNnY6XLcfZBue/8M
         hEHztO4iaiLFm5fr0iXsJDhSg8uejr1QxRPjJ8RQeavkELDk62F5ZkcUM02WInVtBtIp
         eFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017261; x=1783622061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=;
        b=QpiKYzBm5p5pJJh91OJtJtjHtY/UXmKiLVbF5ETIyikDJfexRuy1krIKGNJQMtPKe5
         x9nQHy8dVTycUjpRZCTqTd9efYLh0ZeUwIwtzN/2o8Ha3YpEUAF2MfiyzrYRw2+iWif5
         b7Fayqg7e/JIvhfpBGVmIChDLSmnWnlFHN3F4FGfHPPs42B5ffBh/6w7F6MrFN6w+BRI
         R5QNbk52Dd4JF2CuGcpHr5y0QtOKRN2oQf+0v0dVW/SiAJ/x4wbPU76XwNQpaF6wvx38
         Ir9/5gVQ2tebz4hMHux1R/ksakA4i2aJVUPyNQLku8IqncgdxI3PFZM+i5R02954IeOF
         4dXA==
X-Forwarded-Encrypted: i=1; AFNElJ+7XNe2r4ArUghMQhvgat4C/whEkytMLCeRutOcXOOOnGkQje+iUrPnUGL8jDt2XQ/w5hZyQqvEKLee@vger.kernel.org
X-Gm-Message-State: AOJu0YxBRuWCvt7Pe+5EwP0PEqb8qRXU/TuHjBIEWMti8KWkWMIw/ZoK
	x6sRgYDlycVIVl2GNekxuf6BKQ1ox08eOsJw2J5Lg4OVaRz36XFN+/aSGU+RssoH1fkpl0S74OX
	OIzP4Cdibvxx+MV3b3S8BIue6qgA0exTgolFEzZ6VwNuvuId2GKRJY056awKxwobS
X-Gm-Gg: AfdE7ckHXaVUSVCxNntkAXc54A9upQS6qg4WCgdU8lkBKnKBMYBwxYGMmTi8sQgFlxd
	OcYzgkVZa9nRbOTw1MYSUQWVwekFePsRWn+5V1XVoYcpWMxY1tRC+E4tmuibjVnlsmf3IhPpcpL
	lp9d3UmQ9CsyMU+pClUvXxhIPs3wLlKsSb2Wh5ReYmkjo4x6n37jvAE1mq+KEouGWEivvcmricZ
	tarGen2jkqS6WmOlXu7CGcWoplFArmXuMtjMoDCoQUz4PLO3d93H0XbbwU/uLZgVSUHrDozpYao
	7ah5qg4iW5XjzJ96StbOPkIHBVzt66va9zTJfmUluxUgi79u2sv2rUrhldsjEQbuDbFW/hJ2U/v
	COaQe6i6g8impDU/VXr8gIh+qj5u7ySC72i3qqlxCvw==
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr8198781637.4.1783017260833;
        Thu, 02 Jul 2026 11:34:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr8198748637.4.1783017260404;
        Thu, 02 Jul 2026 11:34:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:37 +0530
Subject: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: K-zM34y4jgWyyhyPJkAldHwsN0oGjtvK
X-Proofpoint-ORIG-GUID: K-zM34y4jgWyyhyPJkAldHwsN0oGjtvK
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46af2d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX1URpUMXI0d1K
 KYL0j29CQYAG6DIpWHt3AVR2Ov/roVloiLfRw07w1nkfSiMSlvQROUlGxuioR8qacfbkyS036F3
 GaphxRMa9ojK1HA2Q2EAshfgfiKWaIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX/2SCnQfJNB2g
 umqnXDlohRfHY0Hl7VNEt40+8CV8Tf5sGybl4a1sp2d4DWs3uilYs3i3IfyNMNuAFtu70PcwOji
 2/5Qba/7WNihlUaxLXzTcCeb3jFbiWfZklOfLovELwuTuY46halqMc2/XZ2Axpq34ZtBC6bJe6l
 xozPm0YXRgCD92Wi8J74SM8bhjotDVtoLu/UkpqTbRNyUxjUTeYvDALcMlXYU4M5VE1g8avGNwU
 7YTcSzlJxf3tgtJwb6f3eqVeJV8w+3Zx72yQv084CsbuyX5Sa/SSdnkCQchmak8coMHI9nvHH0/
 E56M1WxsK2wd0KbPg9na4g6PO0YkocOJuSwNrULGDJgvLwoYZfHLVWu6NzWRUqNyvA36vNAbT9C
 VvdR+RF53BNVYi9SejuLD23xTgiOefNzg2A9xxGGs2jWYW0KydrV6k0NFuj3pIs1Lvf3aWl+gG9
 gq9ur85gnHooR86w/CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

