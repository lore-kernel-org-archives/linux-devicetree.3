Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0070D3A8743
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542341; cv=none; b=ujYxqmvUfFKD121JYKrXWZiLjCJsLbODbUS1VkjcwAFDeCP3Qamd7gLbZFSGSHGxv8DldDlXLKRuPuGNywXNnGTRZQKb8bEnyPoEC4fw5Mi9CpkLie+Ehe8aogDKgiwX6HKQtYJ11XtGpIFuXL4sLcP+9Y61Q1AnRO3dKUlgXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542341; c=relaxed/simple;
	bh=u9UYAcBfPm+Cjij/4yHsiT59K7r+ruo3k0BHpFBTT3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOZBKefy6KJFVjwh3qzLQPYuYRVb/+nBTWOqWd/bW5xVllcK8sxrcHKrPTQGH3iNeOxMWhSSLeHkac/d7hlbQXEcUEpEVv604B6GjOhys4vWN6izbNfxLUM37Uy0qhKnDJnECSUkkb50DyeNPFR/YEGi87flEKA6Nin417Z8hVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cupf8YAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq0QSOvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cupf8YAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq0QSOvG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U59JMj2907506
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=; b=cupf8YAgOKOePClH
	8c7dK5mQvmjcxfWxCE//0zxHTCh4u1qdO6dqXRVwAk11ZeExUaBIMRnG/jvlD7lE
	mqEI7QaNBCTbZIv8OzSjsQrEtGaLq8CilTt/KwN4ovaZRFtOrIJQpfNiIkUzO5wy
	4KTRiCv3Nx0W/Gzf3mtkn9N5JVUCGriiVYv0cJ4xlfFMFhtP3fSrEtHLzl4jTGp8
	kj17Isly+JSvFjnrshd96MRjENf8IWe+jvggdVYKWwkjtl56w13VfnZR9rpHHDnm
	CYUyNZtZdqQ7gFBTnl+PV9SgfqJMexQyotpowsfwinHV4Ntmi/Wp1HA07wZ+Bq+w
	imFnqQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf91ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa860e71eso450250b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542338; x=1778147138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=Qq0QSOvGJZ0nVLCUOHs6UZWE89lGBj0wm5hhJ8Rd6KG2igvPOq9iMKok+OX1XnciK9
         vyuAS8erSAkHjUWih48Nd+/hahPdjip5C76SuDXvF2A69+ZjIh83JrIGO46DghROSmyx
         diykMMUs/niDJJiGQrLHENmS80o5nm8n0oJj0qUS4u8vlQscahqQea5hE5/xcMPmL5no
         q9quKuNxT+f/EX7LQLHhtLKWjecF6ks/aI10wW9AQnRtx4vMMpP5wkMkSC2/l29EP1C/
         YQNhaLSryiHYzWoKumW8oEt6MMHTBjPbCXNorrMZM+0Oq8P3jNTqFo5yHTNgKwnpnmVa
         4w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542338; x=1778147138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=OvYOY3+5K3+xiGE3WZdnLXKUVmuR7kTDeVmrlvEo6YdMDChBnh84Udg3s/IUDI3mls
         0egPVK6wmZWNCw6NTorqt4+kjP42um8axH5eGQsCkCGsHt1PKBrqmjZzaxR5yNq1KIlF
         FyvZb2/2Ut0gjnMoBnmjsTmjC4xCepTrXS0mQUK944lASVJK3oyMoXsUJCBfrY6qN0AI
         yofDgksawzb9JwISoKb1JHRod/liYq2qf2IAYNcA46XMDiLW8/o5sFEBa2Pr8RSCef4g
         8L/6XXWOWig6dm/gjmRhDZFf1ZVPiFvw6pS3Zotz9uW+UI+Wk+uJvnmAX6B66sA/8qJa
         oORQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7ss7XJlB9ldwyKgtcifBuQlEaEiMDfH4zpdKjumjHHi19hPZkTqLyUm5qWaWkDABStrRS5EswlpIv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JB9B4Aggy85iFCZLHssJOW7IPo0zE+uiy9GHuIFP+zramByk
	Q4s/25kboFzV/iiw+s3yxcfsi7BXr7F2JLyPjW5HhM3ajOcfdrrGv8Rd6gdB3JGrHTwbtuybTq5
	nL6evmDIS/fkuHxnjGgnLeVN6iFoojvgRSZt4RjqHz2Xar/73ypGGXWE/f7jFPTxk
X-Gm-Gg: AeBDieudbS9eokh/wAZcJWwfMNeUSJ3e1YJQ2qlT25B04MBqrjB+wTZfXGxWzmHfCDu
	2KS/rsu64JHF72D7ppklL6tMk9vWLztZ/K3nI2iYYi+Od59LFeOAI+wtKiXkXONckN86u2uBX3L
	KEr7hsvtAHoKhmdshzHQ25NNXiY+i5bnyLSu7ifJfCTvvKvuDQnFdFSvc+BPdB1hxSjg7bXahjn
	BD8lfjyGts1WIpp6obZQ0qzhKCzzFtspFKfu1dEoihwH93wCp1Omgux5a9f96F+W/dODuvc1NAB
	8NQrq8yo56Fc3g1FiHL87gz6cqWv1WbNYysv2rQ9JFm8l0JJz/IV8VHGMQKWzk0n13JACOSe4r3
	ZA7xTBBaSRD/asNZvq2kNokQD2Oz1SEU9BnrUCphQI4x6TRdKtIVKl6HcEvN6sw==
X-Received: by 2002:a05:6a00:92a7:b0:82f:8332:4933 with SMTP id d2e1a72fcca58-834fdb078a3mr2596473b3a.3.1777542337713;
        Thu, 30 Apr 2026 02:45:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a7:b0:82f:8332:4933 with SMTP id d2e1a72fcca58-834fdb078a3mr2596438b3a.3.1777542337108;
        Thu, 30 Apr 2026 02:45:37 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:36 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:59 +0530
Subject: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1107;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QPOvZ4FdMA2wnx84lf4VqyIVMhJ9E7QIKahaQXRd0/E=;
 b=mq2VuzLxRAGP9zg5b7p4sZnxYqzSs0QHgyWzhLlX2DOzHvOMgBxvjykHYlMoWtnFwY4cTgUkF
 8B9sCbEtFThBlWzoY7kS6dOIHJvWbMBxxPEznqr3jUev3FowOQTZBy4
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfX84RnLP62ARuD
 ce/4AWcS2/94Xfi+XWHxILv1kUaYQ93UvN63t/9NImbtXmttioBENfyR7X64pEJ5ruaiIC4wGZ8
 HaAzAd4Q/ETOvXmdOX0QIqvoXPZuWT63WLyd5kssPRj4k2668xh0TaLynJGab1fKweRWG3jGpPg
 mWTjQy7tFVd77LoJvbnLv2BpKAbEU1q8BBum3Pr5X5K95XuS2G0lQtK6W3xC3BxwSKLrvu71ACF
 3b/xJwLaxNQX0H2QeDJyLXnn6IVDCQAQ0MaBMFQ/1oMlLpzeYX0UjRzP4s8ovzUsYYOA1pdhbA+
 QUngNV0GXYcr4gYS5ztMUJK7gBx6Dk7mFC5sjnmizLF0B5TBxwwDplxzw/qgm+Ha/1be6XK94SB
 utRTEkIfUL5OgZshOJ/Y6Y3h4NZL3nBNlVW/QG2u4vT2UHVq/em7AC74RUjiSZxcoyREy07t0yg
 HO7B1NgLOhSCdeKpbtQ==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f324c2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3n6LiYR9N_aqWDaFmTgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: QqmryT0elbKWuK_7sxzNmKEag8fAsk9D
X-Proofpoint-GUID: QqmryT0elbKWuK_7sxzNmKEag8fAsk9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Enable Shikra APCS IPC support by adding the compatible.
It reuses apps_shared_apcs_data.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
 };

-- 
2.34.1

