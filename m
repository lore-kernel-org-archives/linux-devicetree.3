Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616152;
	b=ir448C5Rw8SR3xFcJz5qNZKUZrJJcfg0BAejUEDs+JYaEhdjAdk53M3uzab7Plaxtvr3
	 ttajivCWI0Z6pvNhNG8maOgDm7rPaAQNTN/1d1EVwPTzsOYMW1jhhg9/lJEkpwIcSn62j
	 73JaTwmi4KRw5jmyXT7M5zh6OO9tY6O8IIE/gZn+TnmlXOYMetAnqGiIeXt9Z7xSerFek
	 0KZYp/RDjwOy4Z6osaQHIqUKa3FtOnPuLzTEtqg4w9CMpS3mwEwRn8OtTj/CM40RX9j+H
	 GYeibhya4Tbpl6tyr/mChbBJw1H7zp1B5nHfHrFhV6brCGhTqvvRK8j6gxfvM4osiRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
	b=oESQzJdDeZRbo6+vodC0G0wxpeoLpaUlUoYNCiMFuXhV8ELZrG1bUF1eO1j1WvoDLj/F
	 ZEMQI0m6V5kS5RguaQUWnBlWWghJBlEVU22JEACzuCyr2CMchg6otGfTHF03SDLVtG7lt
	 9tizCRFdt4cI5jVrrsWqNDejbp9VN3ueEdk78bKkRh1a35+sRv1fciPqmWODM1WQwEiav
	 7BE07eogtJP8Dyeo2ttl/ItTCzEW0APM430WePWIQd+1jaDqf/sQdxRHIkTOeBWwaBhxf
	 bm79ysvNCO1PIgbZwmH12m/CeRIA2XY2oYoXskCY+t4W7NGEPUmVop1wSPHSGlxGGjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="feLuO0l/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C560A381F
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962C560A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=feLuO0l/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALxw1821086
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=; b=feLuO0l/CT2ghoed
	uWCaqsIZ2w3ODay8cdCXrpqJJAlh3aK0fZ6dgD0motSnF7FBmwAUNfcI8j2jNpoH
	wZL2zQ48H40pkLtHNzjSuaZx9hVzE3e2cUi87n0AdL/iX/lfYvixOAgtIkm9toqv
	OIuid24eBWkfw7rBeyamFIVa2+tmGVWBBPKBB2bBxWzV/sJMcKZ0DSb6oF2AB7tl
	TGkWkB/IsAd4UmrEJdONMYIoAv4ZSxwQAYg+ky/QN/uWE0prZj23nG7I12TywpuX
	hR+3Q/I3JbsE79i7GV7+/TTzdclL9Ccz9yQQEtIdrX3Rja2f2T7syKYUic1sYfNI
	/qi0kg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:30 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4f652f9bso2331104b6e.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616150; x=1794220950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=DRPg2O75oPKSxOXYQNbqEtY/HvWI4vPlEEzIw/cRp2iimgyHDxfebX62QPSais2HUg
         abMcx2aDq3DpEl3LZG/sY3btJIwMUDx5ZgIpjpukEbd59jy/qk4BuBmEA40LxQpxTc6F
         PWwucg0SDTR3RpJbjhD8/F2eEkeCp4CuRMnKp1DytBh1xGn5nWNl3BgRDt+Q1XEbGCvp
         xXr1F0be9KloMEtWNbS0FBsA9I/MK33hmElQCvKHgJ3n3IUwDIe0Zr+BKNZQqhXBW2zu
         biKWtTjz4nOj82KwlMHEJqE+jXw5F2FW5mVPpWknZxxl/00OpctP5okPmVYTTq3uQP+i
         TxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616150; x=1794220950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=ihqzuRB+SG74gInjPRLuipRGnwIiihK9KnfbkI4OcC1qz+XyGv0dwkb/D8xwAMQcgF
         EG1KEMcNM9TaMgDpSWy+kAhB4GfZjvNyfrTXmcwzaPSl4pA//knmS9LMnSrHPZMouJnu
         vuf8I+BcW58thFYBGV40UFpvEH8GTkWjTmM0GlnL/Q2xPBnZttP88u6wNs1nzwiX658q
         n8N3x07GaEXW1P2E89hhxm+iUACv9LaWDr1RbdOhOdOXEv5buHWb4DiyW8pG/7Lq+Apb
         B0MJkpu965XTMaNppiyDahhQuGRX6JG2bVoxQZWyJ+fHSIO9Cw6PQXKrFwDWPwQ6TEBq
         p/3A==
X-Forwarded-Encrypted: i=1; AKwUvBz7X4PLevgJAm8FLMSsUPkWdoanMqA18z7WUKdE6x2a1ZgA7YC0HCo1mUXx0+N7AYNFpdD0fQP8hJXc@vger.kernel.org
X-Gm-Message-State: AFq9FYLBbL6Sk1XsEiJZlWWZkZxQUPh+wjZBpYdw73zoB19GFGccDyT6
	MfaOBH3w8n4503ltiXf5u8tF7hNttmnfO2Tznh3fc7fOqJCEs25Vx7WUIDjzTP28kxH165C/5A+
	I9thfun+Dnb8a8zF736UcuRjemM6z480axDir+y6rFcz6ix8Ijta4Q3l9wgSoEGn4
X-Gm-Gg: AYBFou0jTGSOn3lKKAW8wQfNqxVTbYNlykBc+G1v6y65O4YZitqb8DaCVW27OYtEFUK
	v32qhHR6bAWCkHwHhYfNeLSdvUKo+q3lfTFESmB3mAPIVV+ePhOJxKwlhxCUiqBYTcSaHwiemo+
	zPFqcnPDPYf4Wubya1uFNWYMl4WwTH1ZGYy55bJLf8DaR5FBxSSSOMMr4VfkYga8HVe+4XVlNmv
	N28l0gbsD66XGMMKIpJ8dVrowBJVKY12uIarz3xqz+M5Rz2UzWi2qOFIgq81i78kTq6oFVgceMB
	e6LWpCAblOLNfxyZgi5EzcyrkhAW+cmMbV519mcod0T86eaLVvttI4DfWXgsP7OOW46V9OL/s+w
	2uQvdEzdfAVtaY/VwHEklfW2/zz8FTvEJvyT23fA6nMhlcB2ghU6Sr7l5DxQlQRBCWQ0vB3Cn0+
	sKu+bZnq3O+HriBZSFvPf8pVKAH54u/3uDS9iaeZxZ3bB9W5rs6d7yS/E8QFY=
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290377b6e.18.1793616149931;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290357b6e.18.1793616149487;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:15 -0800
Subject: [PATCH v24 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-7-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: P_UBrl-4DjSKhrDWPAs0PsPauJ_rHKPH
X-Proofpoint-GUID: P_UBrl-4DjSKhrDWPAs0PsPauJ_rHKPH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX6AubeEL7y2QK
 PERprViqpLRjCOYoL0MOsMK086+g/kD5mXJJo51ncFsgYQyi2lPqy/Arp6+gqEP4Ol35ZX2/Z+j
 We9gX7wy3ra8Mcum8BrLrzuRH/T2HTM=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86916 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwTUlR4tBQDpA
 LiACnP+HrDcM3FMPFd1a+f8pNeb1nTCBHWYcJ0mHPkIvtSAnSy9sK/X9zxx8qjDl/1Ol30dcQXc
 1bBdMEq2s2W5/rDEq/g/ei46738s/EQW5qr1pmJxX2RKDQnOmxyRFlR2TOVHhauEUafa0cE0LGe
 Jaw4YYwLnigoREMK30feFIruASD7Kc8r4tYsA9+EqK6kDDnXo2fIhzaCylOsr3Ctt60jHTbblt8
 uUABOgzhcWikmC9YhqX4M+5uVDpM3TGkwQvTikDJVWQezNj4DqnRGR+FFYt24fli4jiNZSe9Nra
 8iIRdFKAyneh2oe90J69phk8KbVROxlFUxa3aUKxVDL+HlqWwr5uCXCGxGIfAgRtBGFyBHYnUHh
 ojJBS4mtBVzQeeZ0P9PcF4DsFBMU2X2JQLPz2bJLXiY0MhGYLsvut1TAgN8TE8FpccSXQMSGGxs
 YsXupBmQxFtFdAzkLlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 385be682e8b9..3857515aac7c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1

