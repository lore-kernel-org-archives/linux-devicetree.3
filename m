Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED93191D3
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144000; cv=none; b=PC7WovbL0v47oc81M6IYGHr/dDxkF4nY2qOwmPIhao9I6J09In15KR+Cxdmg/QpWdcc/47oj3ss6dTdD7E/4dAmIw2JSnN7mtFX6C2ecdsoUqviWo3hrQGxSGHRN1qJ6/mkpkRG4p1T40rsNxACiRDtSwcNwzIE6jeGsj9Sl89o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144000; c=relaxed/simple;
	bh=sjmBNRJAUWM/l3tV2BhGUd81z4O9unkCY6+2tE9cUzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9Q0rwqZsW1fEy2PgyZww595qOR3cdqIuLQNYtfIVvnN0dlWMC+C3PYBCFlxb6a0FCu0QEy7XuNQYWODlOI4utTBAG911u/04cbuhYQIof4+polboL+ZUMTY5h0AlgBEJoAQ99GR7u3UmxmGPbYIpQLMfHz7PAisZWGVClM41dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gh12G1Hx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHHJP29G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gh12G1Hx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHHJP29G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JCmimK3305995
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZvEjQ5DDupVNafr16E7+HCBBe9PbE5KGeZMQIn+IbQ=; b=gh12G1HxKzss4qzF
	SElC8fiFqYVmQ9SfDqhY3XUeh2bTslb0koJYwNbAlf0vvZl0h9BF0Sc7mA+Nbkq8
	NQ6qODGMLXPgrwXqi6vAHC1cKPEXkodZwc00ZouboXzZSwpu8chrGwrdSzGtU/HK
	69snH6LXmYJ3uAdOYqKnUgmj0T81TfIg5Cg3YSrTCh1+lhv+WZ8GCY2NUg+cv/51
	jSCJ3zRNSDvp2X5G67GwOYYZbVi4UT3JzT4VzgJ7u2MbSoPnQLlUTlnDWHc7Q1Py
	gX7V3SyPh7U9WqNx6zBw1Q72GE57sOpKUj6vYpPCMSQqxZQ+BEM82ZvGdLWMWUdz
	R6hUTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb9rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so107091385a.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143997; x=1787748797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZvEjQ5DDupVNafr16E7+HCBBe9PbE5KGeZMQIn+IbQ=;
        b=VHHJP29G02mpYg72ALHQyVMxvjR3uarnNdj6hiwIraDCzXMv4E9BFMVEMLzYxjQS9/
         HChJFZEIUXoB596Zra8Blc3Q/KZbv/JtjBsHDPbkprrujc6yajQfLG3hOtg+tIihlAJI
         b9nWkfO82LQKCHs621Xxc7STG9+TB4h97ZIGkfuEYQHfHSKyqvvLAmwKww7UUmeFP8dp
         3hbpH/FdYoX4yw7EB+A4jdk0JxuZON78zKDGwQDDf3iiNr27vElHSbX8lN5lHu/ik+WF
         76U0JCyrSay7a1RWURQOW2gnOfvO57/IqzfUgeURZhvyWbCNihvfQBwXvLDIyXSq90ty
         /xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143997; x=1787748797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZvEjQ5DDupVNafr16E7+HCBBe9PbE5KGeZMQIn+IbQ=;
        b=QwB43PJqKp6argKEiPot/nB0VvnJAAyd5qBTx0ZckmD1qG3ES/uolGoPkZJoyMCsum
         n11/KqrEMj33iqXnavZYKg5UFa0Sj3SugTrNejTR/cQ5Ckb+Y3/afGgmKliiN4KmqPfb
         +WyUd3MaxS1Zu4pGiw92mQhMaZllo39RrlrPWqf9O5xd86eEPCz8vsMtgl/EAUge/cRK
         s9kta2R3wAOdaj5ivFDkFgKzh6Rk935F6SCJ29Ftt1Uj1YYcyFlYwYiPRV1NCnSrSyrk
         bab9/if88Sx6QSvqXBfS8ZUS/ID1oHTQlIqgqeJJ7Ut8auriHBGglQp3SVq05pEHT6BF
         xdKw==
X-Forwarded-Encrypted: i=1; AHgh+RoouAgygwKvKxTfBErzFnp+Qyw9xvuSnnY/IWVbaeGlV6VNTM1+ZDCS2JzpzZ/jWrO3Zce1qX+uVbsw@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpT/LAQWRtqo+PDf8nf6x4X9FUkHBYU9aArOxHXhmw5TsJ1ch
	iDQ20my8yBLk5bzpPoU8M/bivSPZ2p1fMQui6FSPVn3LelpjjBtPXx9KdTnPo648AHCW0xFF/1B
	G/8Biq/clYHyxXhd9GLaEEubOggUHTmujKHn0/XR5TCvqubd6fZmVJtK0ByeoWIVo
X-Gm-Gg: AR+sD130Cr4H4BrvlhYOWzSmfJ7G7ObmAK8xOAMAbSWLaUxt03hkIceLoWRajXtMdn/
	G20vEGKRfcv5OJGL9dCM3MOYVAhhodXLp73JEfjggcQqlbsjWVn+/5GWxx2hd8ru/zVMKsAoKc4
	ccS+5hLVe/EzfVwQA1WNcDSilMtbwUkXkU9OPECeWBG5UV6Gd5OLvQVFwIBSbo+upif+vh1MYUu
	H8YACexpd3Qzv/G4IX1oyUcro6Ii0Y5Qh6/fxdxy+s0euNGtMywl1ExQPOkk2xZBHi6RLGvXuI7
	JXKt4WLJ/utXxIv+GzU9rUpwXtzIrrIuG+jOoADVXH2OIVvBbORyFFBWjl9ceoURYaEcEpnoPAb
	Za8dK4ocG
X-Received: by 2002:a05:620a:4609:b0:936:8840:427f with SMTP id af79cd13be357-9371e204fbcmr431979985a.4.1787143996782;
        Wed, 19 Aug 2026 05:53:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:936:8840:427f with SMTP id af79cd13be357-9371e204fbcmr431971885a.4.1787143996084;
        Wed, 19 Aug 2026 05:53:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:47 +0300
Subject: [PATCH 02/16] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-2-840034124e73@oss.qualcomm.com>
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
 bh=sjmBNRJAUWM/l3tV2BhGUd81z4O9unkCY6+2tE9cUzI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhab1MVZleS7wQVUPPQfMs6M40itFYvpKI2o9/
 7PXEj0Lvq2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm9QAKCRAbX0TJAJUV
 VvmYEACbhLI2yRLlT+4bGXxnhIqcxG0hyZTcRdLYjVrPF7THedN+KGjSm+zIbUgLNvj/vNffaFa
 xWKyOXT5OwVyuGu/aJGLOnzWKSiiCfF5y8ye3IoVSsUIzGlkjvNDi1Uxadou3xcGMAiY1uh3gnH
 STKY1bwVWFT2j9hB3o+428obpq4ag9dKDc/f/wzbZW9WH5Pi4VD+Y40C3jcdZDluHtv3pIcY4rU
 e/ZeEGarjVh/3sacIKJMHLv1HnaC2QFvJZRu0Tinj+dzCpnhzFW3bwYVfmxFPCL3OaA8chOUWNs
 1fc4YDLLhdKb9mrpFSkRaZB4qObtDQgwS66cSjdJXg0ChJUr3aYEvdJKjkevX2Nbf9zJViuCQGZ
 l9cvMTD6w21PVZquhE8xhmrTF7CHa04HSdpR7cU8S1I+/dZXmv1SO542CqJT6bbyl9n+SZd4gaN
 SMyQ70CO9yVe2QxkXsxRRYQI7OqzfJZXXZ2Q4x+PmPI8pB0BKr1UguE2u0xV17VtD0eeu8kCg/N
 SG8+XdE+RUzq0Z3s+uv16S2McYajXWxaA4nJu69CagIQOkqF6W7/m0UYY1KXgSw/9eim+NPHApv
 7xfiuN7sDw0C6W/YDOBeEudIasoLIemd/klO156lCGI9dtr0Wg1z2TCsSeI48uy1cIyr2lGhBrS
 5Xl7q5kl+Rsa4Sg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85a73d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OSBTYWx0ZWRfX8W+iNIo9P+Pr
 u8MQxBUBnIcj7vHH1AzaDZy5wPW3b/mWkVTLoYbTzCkkqkP5/9q7ifNjInSaFK0/vkANunDue/F
 s32Cp4vqODXtPgBrnrAfFYqd/gTjl+Etkca0J347xiEK0VL1AMdHEr8jk3yrUVW34AIfwROW9ID
 Xukxa4MSuyj983v8CEwNbfhivKS2JjB69NiRqDHMuafv/5XI/g5D6ixBmBgQRKkrleCI/vM89mi
 MViLbSFMtLaUkMFhm2UKXj7PeDsLPX5Xw6B8s5T+Z0ddlLAYPiKj/2dK1Ucy4cs9DqGGq0KFgGq
 WWa4hvHnhAJYxNR0GLPjqtEp6C1w3qPqbS4Pi6ZzfNcYegWClLHOl6g/vlhOfA/JPK7jh1JWPkt
 N5dj9kI07d1sx5l97LClLouB79FzxnTNj50rHQHkylST3j5EyCohX/8zMudXJsOdTioD/ks99br
 3zjrA917e16fVb1+ayw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OSBTYWx0ZWRfX2e+Jx87Jmp4R
 LbwDD3Ozes8WzcdtlYoBYSxzEzBkzY9s5e2QI+TFMbgRRdSYtMcX93eCUswsvXRUexScZ7HVbp8
 buhkPpIj/c18SYIwb5ty5Jav1eI2m/M=
X-Proofpoint-GUID: tOl9HJPiKMy5aD7WFr6L3Jeg8Z31ZXzU
X-Proofpoint-ORIG-GUID: tOl9HJPiKMy5aD7WFr6L3Jeg8Z31ZXzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190099

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..996ee8592fab 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3786,6 +3786,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.resets = gcc_sm8350_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
 };
 

-- 
2.54.0

