Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78690212564
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250151; cv=none; b=pnp6fvcgcSK/1pc9H8ua/3uEwU7zwoBmPndqT7f6jBCM11Zd12COMmv1B5maK0NgIi5gHYALBXsFGtT09qtWpochz+37ys7pBrvvIKUa2OAuuCOkeB0UC24B509CkhYWuRNuyla+hPqK6mIWKA0fecr2ozVjnxtIQJJy6Wyz158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250151; c=relaxed/simple;
	bh=TVFoh/O1QUr/hyHCGQA0e2FtrrrITFxyb/9EX7mlAvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWqhmgz9FoK5BBghD/E8OgXH532gfzJ4wD/UFa+PxvLWtFOorBdd1+u7gw6BguBU19BcQs04T1L1zrgzC8BvAKvgSd51lWkZQztJMBGnSglWjJHBF2cOJDSzCZts7MykjGcVoNJ493lqHE94j9tuQJxUjnkZS7XjN0ore4/nflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBE1YaA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNpIZV0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBE1YaA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNpIZV0c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QM01Fr1572854
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HmnfChetANX
	bsvitvZCwI8+1ngUdoYYmu7ffZcpry1A=; b=cBE1YaA9w0SkWWEXtyRMqErK79Z
	4a17OqRk+B0XdSH/wTPsWymKhSQ+dp/snx+mv2mro2STB3xbd/v40puJKEQxXQbg
	ehL31oha20rJx8oDUJxfqo8Y43Ts/GAAX/4aM79X09pH2ew2XS1baMHlFMgybMvK
	svh9oxFGy2Ee1mg/fbCK1Tsov3jVZD3L4r8dO000COQ9r9SM6j7pIG6cLdg6LdZQ
	VR1eLyjhFSXE6WRAKXq15YfUPjkpuE5Kak4AW5N7Ngr1oo9uyCU/syJWieGtIHHE
	3pBPo414EPHn/3Ahyi5qa1zYIzvm30YDttPNWADjZ5WQHd5tXXXz+QwmqtQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3sr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so12442033eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250149; x=1777854949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmnfChetANXbsvitvZCwI8+1ngUdoYYmu7ffZcpry1A=;
        b=eNpIZV0cPuZhgLvEkjI3ByZ9MMTJmpouEHoq3ebsxuxsJP+zGqRtUHz3lx1dUw9YTi
         Jyssdy/If0S/D+bhvFJKU3rrk968H2rQ2AH3+PyFO4gpWQIHeQ05CsDcAez7RX/b8wYi
         guBjw6vFp7h2oaoEhQX3wacM2gXo40Bxm/9E+oxdW/HGjqp16aJcbqiQwt8gv0Fmy8fx
         Weq4Go8UBnA+zejsiD6ykzruCXMq39qYx67NBAJC7zDuk6KR/n9g2vd2zp/WmWqXktF9
         pzTNwfXTkX+TotZ3Z9A9s5MbNEgvK7kEWCrOvL1BxwnByhc9D0FVY8vVvlWaOp2HS9ZI
         ZJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250149; x=1777854949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmnfChetANXbsvitvZCwI8+1ngUdoYYmu7ffZcpry1A=;
        b=UoBu1sxVskCsFwaPPVLwseKA+TZoom/fAaVaHovbFoy/OJgmTnrv3hAAkhbXgvQ+KL
         se60RA80rrOPPlwbVaMpM2HzrRTp8YmSvrA+j0/M/E65tuNgFetfaqPK1lsagAdd91JP
         ZsEeJtIGpWb4pupuI2MsqvAiFobnNilE5gPjQkTZwbvguow1oc4SUIGFSLKZrFI/P2c3
         cjyCxYrVPbQNI0C8kCjuzopGvIg8Uw2QP50Zl7+Ev0QexKoxOei9tw1NalAtX8jPVQSp
         pVVtqM7bi+WOoMfCf631659xOe8rOh+1EXFCrlzO7rpPnFePq7MZZIWQBienMXZvZLgb
         DfXw==
X-Forwarded-Encrypted: i=1; AFNElJ9iUhgW2mn2B88FLQnatCVQLPyA8+bQo9qdFOrDhUzXkEffIvI43BRI82jpShBwnQ8uYn2ciTjgT+wm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/khNVQHGnnBGArJKQMhdYqCNFGydOw7SX+D6rLOp0jLblg7Nz
	3ezLbZDCQzRQFHRD88j61HY/hcZGzqZV9X7t0pLAIGtpaWjD6Eu7S+peH8tkUYYCzhd2Bp3oACr
	jx23n2JRssdEgd+GEWfPvHx6hdzAerX7Y/JhN22jn8TMkyuuL4bsOEFd6AruNyQyx
X-Gm-Gg: AeBDietISnLgCtE/BkUwpSgPLuH+xK7TEAuuP3RJY2j9jzCVFUBttgZTeiBDDQ+3pBj
	i8kBmESkEL/fxUduzDArdjrCCDI+bvcEnfo73P9tLZvEMnM8gIMISePFrT1whFWDlTZNcHTkfxf
	Xh2QVqRnHEObT/gF0zMA9dNfu52R11Mc4QSfZ6SjFF7ERfuurK2LKK5g6zJ5QqxVMsAIp47QFUj
	ku7kg82Ys0+qmtwiCIuehaKLwYjwPD09HHS3SLqwO+Xslxs6kNLMYFN2K03qwahDSTrbuXdePpB
	WAh6FiLEe/vXk26AqykO6j/GXQtxWt5TmnauvBt8RwmTV9yIOFOgKyYr7jqZz6EcGoXSxRrAVuP
	CfBW91DlPCq/m00jzSBL/WrZiMf6g1HVaCeIbCPpUkjoDarhmbmE2dYFUa7p59367/DluOeMP6+
	AOMbU0ABFMLOWuHc0V
X-Received: by 2002:a05:7300:d706:b0:2da:1a81:588 with SMTP id 5a478bee46e88-2e479c042bemr18972453eec.14.1777250148658;
        Sun, 26 Apr 2026 17:35:48 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2da:1a81:588 with SMTP id 5a478bee46e88-2e479c042bemr18972429eec.14.1777250148108;
        Sun, 26 Apr 2026 17:35:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm40010879eec.20.2026.04.26.17.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:35:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC ID for Nord SA8797P
Date: Mon, 27 Apr 2026 08:35:31 +0800
Message-ID: <20260427003531.229671-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
References: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -9oMm43lzKnJGA7XOUaE12QYMqUMHzbl
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eeaf65 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8lSouUAgmXO8ZBFbqGgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: -9oMm43lzKnJGA7XOUaE12QYMqUMHzbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNCBTYWx0ZWRfX1s0PNjPudnai
 HCdZoDqIQ2A1xMrNdv31f4AJ89RGDlf3yI9ON3+V75pKNMMafV/uHfMitByxSRWzj50mPUrZ35R
 SSdN+d/tfTTBkxSDpftRjpwI+hfCc8U/HO6QTwrK0w3JA4jGmUKiTdO3IopG57sNlFsvFDbNFka
 MbEDCAv2aO3ENnf3zhHyZJtQD7xdbnaoZ/Wb8H5VVk1LKagzDT2DFw+JAoUly42kQvEAQ2rZ7cn
 /aC23TGorNM1K4wk7AIJM/GikIAlNcA+S1GSnusHcNL7QGwt9vOS48lmuSbMBjtOMLxNM7qngAX
 3woI0yhQl/cuzMOLgRqT9sYKYrsBKkEE39ZEsjqzNlvDnKuKIvLjtHlaYDM+Tj4AgcTPt59IxPG
 m+bUv7fV31JOnWpUdLoGqkEJ+hSf3CvUv8vmTKJbcxeoHyPuCauP5oi+g2gwIZX33L56jzxQ2N6
 aiitlxjRmHx6uFvtk+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270004

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add Nord SA8797P SoC ID to socinfo driver.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..3a35f0f6898a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -526,6 +526,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(IPQ5200) },
-- 
2.43.0

