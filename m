Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AAB2FFF8D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280474; cv=none; b=C5hkWxvz4XS4pssTyKKyzsrcpUWQsRjMQ+F5o3sQ+fePPflgbQ5/8bpjOupLvN3CUhqtebX6Waoog1QKFatw/xH7QWYj5qU8jxtDamhTteOgKfZ+4ZDEUa0cxfyBsDy3uoZv/RSAJ+aUbAHNpZbd+NrJNjLL+La1RvYFVJxBEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280474; c=relaxed/simple;
	bh=c84j3cN4itWiI6muK0J93G40mdQrPz9ghprJZVQe+x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOp86KWa8yiu46Z4r2QzgQtnDqyA63ZbyYBgBhQtyObM3nABn0FE65JxhQD1GBMsl6GdmGvxXZt8BjUO85SimD6Xn0F8HLbZwV1CFqkvwDGgSSNulJlR7RX1QPAdVmGVoj/sx7SX8x4fv/KnDpn0VHNmO0oYIH0nAeYs3NTnPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ct1DBvNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLh2ed37; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ct1DBvNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLh2ed37"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhx8d2343376
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489672a12.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=XLh2ed37dvHc7XzXS/cWMoiVcQ+cm55j8XQ470JYNZzOISNpVRWL9CALQnAGKO5ega
         gUrzPWIjYRv89cCGRWiwTdCWASzw14J2zC+QX1HgosWctvLA8SrhdGxwSYgGYdwAOzZj
         GHVOYGSuZw7Cm1xLqvkO8w6RYBaWqZQDdI+3RFoc3lVImoPQHTlgtpwo5di9XfqdpkE/
         09by+fK13IyTAFyCGgm7n8mmWjQN5VNU4miovhKl1q2FIY7rYGJDFwAa5ryfGuDbSHWM
         02C89cD7F54ykTRiOAh0YbF4nMvYcFWYdikw/PYvfiD6O0jOvqq41wyX0T+KviTE2IGP
         RfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=f6zhMc9sSY/2WKT3P6mMZjiLMXdleOfFuon9L0iiQXlPwlAKhgJfKdRlY1bYDA9v3O
         +Gmv/zChQJoEFNqc0imWhXP9Ofcc6vVZqJAzXDwLjwql6CRJLtszoHcq3kN1VkFlEYw4
         zP5EFBsc/2+sJE9j5F6taGQJWGSlGLPPQCzcunFZbJFwj8F9KE3tNK/FBncz/MAcXf/r
         Kh860mzSOzQOYYJlBUU0xX+73G6S4u6XZ9pXMONFYVMIEYPD/Rq4Gakyq2Hq5QpKidNT
         U2LtnjLFtBN5veJnavCyqM78cq88JgfxRQQPIltUDgzIcWHrKdqlLMAkZq9DRpnIWOVg
         G+PA==
X-Gm-Message-State: AOJu0Yxo3cJF2018sWRncyVIdZWeMKS0kN8dZvDopE1ZjTpomdv70xWF
	lkkBRJLjJGWBo7coM/JRzXYsoZ/X3vn0UkF85FrK9BMwU2DHNhQa4juUDJr+xYPNgB1qbgBPOOM
	YqsZtUyt/twLBvRCuGs8erkvlP+Y7I/FGbtwyWxR60qfThAKBc9tyKbJISRSvyUwHmpUwHCnZ
X-Gm-Gg: AfdE7cnF6Sp0RbIfLX1CyPZWeJIGGV5nGrrjGtTrpXfpcY1dA+pn5g15sLE9T5BU8SD
	k/SWIVvmEVWcQJjg4NiqWq7hQ+vHBdgM1NMcyn90NyS8SDUmmBTekWfZOnr1mB/ZM8y5jfEJGNQ
	3y6UANbyHbLUQOFkOLacH9tcCCEetHlx7QRetfTwCRMUoXblY4wDtOKb9q0vcZ4e4f8DK+6Bklf
	V+xlhDQgjyNolq+CwWgqQRhpw8nVW+NR7lT22pvDMXDpceYQYa+mbw63BJH70dM5Kqor82FyG/v
	e1i85qK7dk7aLjQa2D8ZCUwHwMinXOkH70R3Bfw7UASTLa7bKH6bFqBn66Nd9ustNVMEa0sqSaa
	RvXK+bTB5oPoHOE+/7lq77LQ2RnI8iPJogPrKRA==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605447637.10.1783280471650;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6c87kHq/tkYL
 u7M9F5sJncrJzV7dFbeRM8G1PeuEvHmwRQSFPye2NttoCLzyvDP5/afO+Eaz4w092ihguum6Zqn
 rtjFTwc3oeh8d2AqCIXQAeJzNFID8Po=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwVsKKXtmNRIb
 fxke5kxAwpG2oSM7Cf5Wv7W4kAlddGIqzsSNDDYNKT/3IwZd7alDu8dkuBYqVXEijberXMzJ33+
 UIy3QCeFuTu8Mpf0UJ1hbdiUVNzjVOCCOMO2Gej1uMvimI0F2YCKKOzoZdwtaC9DT8V7ZSI8Aak
 /pQTdiPOSG+RcnpidlDIwpK22Xblvqyf1v8D56Dd5CdPV9mGXPwdT5z+iraB8a1Quxfoh8wSiK+
 q3BBQYNxVt8GXInl/AXJfrBNos+150D4/xbi0WRehmzo4U7wpkYILqp0kBnY97DR6JDkrqkVdde
 IxxuHiaUr3BRMrMAT9pTzo4AHJ7YHRgNDFsaP/tgkQN0/08OLCprcpCFZ/ALXl7YJhwg+zMPWgX
 USl8inZ5Y/5wSuVwDebKrouNsHf96AgDA6k23QKXsZOpZTOvADIfSNIfAHwIdqUnb9J+xcwnS4a
 frEY57kjO0fxP8TI0/g==
X-Proofpoint-GUID: jcP2ZDx8PvJ9r-KsFdAz_7iGK2RifEuT
X-Proofpoint-ORIG-GUID: jcP2ZDx8PvJ9r-KsFdAz_7iGK2RifEuT
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

