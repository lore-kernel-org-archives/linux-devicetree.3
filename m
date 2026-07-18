Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC85733E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379412; cv=none; b=ooALgBzfi31jVYw2XcTgogdZGVgiTYVCqXXezKcyItTVOoUJNRwKe6Jd/S6omdcRAzAjMYTDRP5yL3ZItJLMF2eTr8yWuVo+8p5tN0CpL98DPV55k2RIxJSJ1vv/SL6CTk+gn/r/r3EK2Bqx6f5svTC/My4bQsNzB3dC/xkJIcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379412; c=relaxed/simple;
	bh=DDibhNq8GbSHNp6BcKkSXQbdjHjDiWHzHvxWR5kBACQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oExPE4Age9yiK4NgKeDaZWYVAK7m4mnttvdh8W7IQnsfxvvWVk47R9Bcgs0LEwkHe4Ph1+6ZCceScYfsPEYyCwmeABTwifujo6Ya3pbeZl7nhxaqR2qOk96x4hvGkp40MPGaDKB5C33kkLwo7rlWCAaomKHqVvlkUDUiEVe/co4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXn6UjSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0STSd51; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXn6UjSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0STSd51"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHSaJ243463
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=; b=aXn6UjSls5rCTgRK
	uRP5vQdhVekU49n1gOLMMoDYplWTuWPUg0jd4MMTkALQPxBfZVpXtoQO3HJjQ10H
	xHzDT+llmALkXPdazrsaNcP4TSwjxEWq3UkKd/XFOsyNCp/Wu7eu2EfanSpU4oJB
	tNsBKRuoLA7oj55wTA3Bq/VO97meROIVZfBYGLd3WNrdVegJIb8c5DZ4UHWFfZyD
	O3LowhlbuOtoJqcnjYOvA34ddoUfAV6owN/s5sePRVzRz9M/JTlNBEntPFyEYoAP
	NnetsIzqKA+fGJG+QUKy50OI2sM86ZZj2A3jlhlDCOgcliXvELPRzdb26RPMrlSJ
	O6yf3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chgrfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so2128848a91.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379409; x=1784984209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=;
        b=K0STSd51H1tjOvL1euSusLBlZMoBq9H/jnRrC+5c4RuC4MmF1PhWCuoCLMDRY1H8yq
         unLhlj47Q6u5ArJ9cYgqiKA7fFl3vpewHIV0M05VkSGRHjnMT8UytyJaHOWHG5nxIMlW
         ZueWaZ++DKDRlYLmXvR0zRzf/lSx+asyTZlGD3tE58LNI/HTB8kIn2vQOqCvWmkEaUzd
         GLTcGP7Dp4Ag5EcK50qgsjphqveUuwD8G0Kfv4hXUhsBtr3/CVM+GlyaIIUs/ziI13j5
         RchQw8y84nmx0GiavMQ3okCg8XXHy3jHOcEVt3/FEEGWkuTOGeGWfug3xuvDesCtPW3v
         j0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379409; x=1784984209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=;
        b=jqo7xn4hea/IO+Sqxr25a5+KRvLFIdBYpv5L+smTEC5QMIS4XG5goba4ceillcwZsj
         rbWjceRIOOcSDUNBHleIgoQyK1UvIgFjcWjHY3eCaqQ+bZj/ey/DwJLzd4hP6zeOgQd5
         H28aDlS76s8N1p1wpvCfuuKwTJZY5EIJAsoSOvDFj7EmN5QyopZcXv6CtWzLNuSbwjX/
         jayl/eGXw3/WEIjDUl7KdDa2kPey7ncE2dY2j8/ZFnSt3YskXt/VVqGHX2pPjav2KkcM
         olnXP9bvY0n0bibjpji5ZnKs1Qxx6o7/GDs2u1waRBvTj+E7gpzFdGXrN8hDZNNWwqPk
         Oz+w==
X-Forwarded-Encrypted: i=1; AHgh+RoOuV4Kve7oulH+jjAb+fP8/tP8tnjKJvrTBOPaSzyA+VGmir1JVt9927JcZzFpyJBYZGFbvktxtLwa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7kLaTCEJSmLAa9WxD8imOWB4aEHks/1VH2znd58ocv7YO6hV
	glQ5o+gb7CVBJy5bWjBNCP96HqMHSCTHjWiX/Nm2vFRXjnHQiYtT6JmzK5emTDqHq4WFG/fstr+
	oK+x9IM8QVhcpn7exRI2RIjJXjY8R0h2mZoPGzWlj+fUZMNDqZUTDpwsV+4lPspQD
X-Gm-Gg: AfdE7cmY7ur9KSs3mPIej5emGIFl67+OFEojeiFV/0AB3k4EfdGNm75dI1shVdFZhQ1
	zONFqtRj52luN+7/qRROnx0nCEHydm3szIp0VS+sia0s9yXtR8cqzS2sCUEMk74RNO3ZE+TgGRC
	TTfkPL+RGdGZh6VVNppPH1C94Wq/n2EzF100ISvtnVlsEZcnAbCg7uTbuoiy62Q4Vdcn2eP5av+
	G7/YHE4SNs54170V09uSpJHXiRjCr3pwhSHRB7WdDFj5JhPehIWz7eawIK45rFBIG4McxChNfzR
	RAjw1UyZVQ/9jnAQDCobCb6az+kYkyosX6LWZzhbYojoaZthxkv35EAS6zuBsQ9I8gnm1gtfnf6
	KqEQDuPjK78yJlTvGJXEYnKj1he/xBog=
X-Received: by 2002:a17:90b:2496:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-38e5828ab64mr2495309a91.19.1784379408925;
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2496:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-38e5828ab64mr2495290a91.19.1784379408508;
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:11 +0530
Subject: [PATCH v6 04/16] clk: qcom: dispcc-qcm2290: Enable runtime PM
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX45R9RTqycn8+
 LFHB848yzbigxS0ulDLEK4Hf5GdEK+BQ1l8UQ+BtGmYDBpTzbLh4DxzxpWnY+fqnHBzfEz/6Jz1
 x3CXdWT0bTbtPHV5fFNE2EbqtLQvfCg=
X-Proofpoint-GUID: w-VMZAPuHM6biVGV6vshqP2SHaOglEzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX4GaEA6iccuj4
 sRTOB3MHPA8xHz94TpV05STxfPljUchEuJoJf15asBJ2rR1XyADkJBDOT/ZRkn9b55D9gJF2w28
 1IEzDeJlNLAIqrxpuP9IaWNzzBA4szi34zrZmAHBRkGI0Jd/mOKvMoo7lRFfQ8z0GyL/hpvtQLz
 8ZtC+4nWbUEi2PUdfP3MbjzAcTz1XzZUtOax+62P0F53IW3UH0T1Z6wYRAeBvrKMGvy6nHHtiDa
 lpr4JcD2GIZb0U6XlxesEj/Wev8xVDKKMWDFxM+NoPjV1t362ogWFQM78OF8aF4jLciMR+SuURj
 mRUUY1Zgl1FTdDE3fJORqUmhA9zhD169qcGFQU2Dk5aRd1U22NWdz8GfHVGMFAd+2NdHyZrMRSb
 5BxHU/dxCxZP5Wm8twb/U3UF2XF6ocMaM0wQ2zSZxk/qaWSqYLM3Mw7feqe+wozpsBabWn4wLFr
 sRTKut6e/66MhoRxyBg==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5b7811 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3kQL-WaTcMt34FzATK8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: w-VMZAPuHM6biVGV6vshqP2SHaOglEzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The QCM2290 DISPCC is now associated with a power domain (RPMPD_CX) to
propagate genpd performance state votes to the CX rail. Set use_rpm to
true so that a runtime PM reference is acquired and released around probe,
instead of leaving a permanent 'enable' vote on the power domain.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 50a0705128a37073a077b560d0c9e57544d54348..2350ce7f46d9f6e395c87c7a00669b10e8bce3d3 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -515,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.use_rpm = true,
 	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 

-- 
2.34.1

