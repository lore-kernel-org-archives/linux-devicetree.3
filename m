Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D94408034
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156715; cv=none; b=gxKPEI3k+coDz5A1qh6m6hOimxJYHmNoTIqitUF8bwrrCLhVkha3GmNe25kmnAAFzRFP1KW7QU0Z4cZj7F/4vGh4l7vfEXzofu/JNyQtpmEt/06iBPyRO6GyycsBKne7hxmKJfK26QwNYkh3oh+8/25IcSu05aL320UCW2hP6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156715; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myJNV+roQzS87B7QVycK56PGN1rzEj4cUxRvyTs8VjzIgsLseDLgKTP5oE0jgQDEiZRslDmZPl9qYMB9Ejj+bWRS0Zl3cW7K4RhYyvUVt/sMP/oq8hkR3G4w7ct3kj5Z0IdMg49mnD4lIuf4g83Z2XxfQk0IEHgzROVUOfci00c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tgm0soCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFB3SjIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tgm0soCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFB3SjIb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMDsb3604284
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=Tgm0soCuKMXqzUgK
	c3fNrQLdLdyJPuapJQcpxfeivlDCotvtPNuZkshVrcHO+nuUvGNfacuym8kO3i4A
	TWh17mXmqZdL94QRaI3INGwuRfE14mLxgyg3qhiDJ9oqdcqBV4z92NCp8PXzrIxD
	BP/BeA/IZ2FdmAzffezEydto4db0XS/fXDVCd2MzeGTVP1cQr+1Pwau7Zo+T8+wB
	WWe7pyvmf3xcoRJmqBYJWwy5lSbB66wmDOP0UrAwAbsfu1hlSwDkTL4+Di4JebEW
	U5cLj5qG0hiIbhsVFRNI0zrI/GwSePg8aCRVabM5bWLc/0hW57JQ0wcTvLRoea3t
	6wDWIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysugx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so2938980a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156713; x=1785761513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=PFB3SjIbVwteUf7jR9+FJxDpDsNb787SRx1bN135iPhhShXsjiNC5kpOcZdbI1E+9r
         /v1s7fiWUtz2fW2zFoVSwimE/0U4uvqURHNxcAfOYJd7GiiYVl5pT1K8VpJC2P2N4EYn
         LBvuINYs6wb93hMaI428efCWSJ2yDaKtllxm0xCnn3FTXCucLSdIs6yBOsdw8qy8eCkO
         d49USW+SSlEzZu2Tsv1bWqh2VhsdUvTf3sbuuZ2Wt7cLybKdN1MHig1MWIEaltEprBLx
         Zd6mFz095FBJIkrGNUt1Ar/5NDHo0g4DbSvFpq7wQGwb5EX07dZo0vphLef2E1Gl9sMx
         VHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156713; x=1785761513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=LUZ2VutkVnVbUPd6Gfz6QfXnTfkxnZJZuHUFRivIjHXtuizHLwc0spNv3ZcsB+rk7p
         spNHJli9IfKi7GP3QsELqaGOsSxg3rhye08bbS9iwsxf1aDXgrBr6IGrFqZgUYx7gnXX
         wzv+fRkyU/U3fqdVYpZXkKVHQ5T6AtyS46uSwpFB0FLLOZmCNSR+D764ZdhIkaLBuI08
         CnRf1ATl2MD1GoyqXWC+fAIlKgC4nIw9avIQxrtHjQOuCmwNuYOVqF0cq5DUROq5r44k
         xm2ObQvlewcbIUtiZhm1bFZ11yns8kEs5Q310pitKZhwq29EI97ZOdIJVMsaNj64e7PU
         tUVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrF09NOh18oy1DWk4AQYj+dEo74j+dmRMCaynd3OnwaTFNRRiMqx/P8hhJQ3nKplztKWhwDHMnGK8p@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMnAlFHZciv037Fmgxiyely2MTcWP3CMQ1/jKtc+K8W4NXIAr
	Z2AUvOmLych49GJmB1ownRSLUL4tZPdjC/jj9jnqvCzJB9AWjO4Pv4pp7+c8xkJ0LuMNIchk/kY
	QYhYYadMKva6LaqRIBA8X1k55jDGkWmqAuSb67bzW1JPLCUwtRvm+rMFyjJorV9fy
X-Gm-Gg: AR+sD10ccyi32X7PFvFRNRqlJS2G8Wk4YdwQjmHG+pNCYEqgydnjZySEoC0BbHTpedD
	hw8f6QLewHQkH5DgE6MbnO//lOiZ4eQYtW6fJW+M2ri3vlKmnyX6D4dTSl8oy7Cp3gv844LHpRt
	mPCfvPmanSfNzJi1agsxxh6S46EDprx8FDBNWWCUevUN7gm42UnEZCEE/sh7lDIfAVLq3NhSx8w
	TxGKVl3NVrjY/qz2iXbawxCh6SunJbGaKMnE+CaHUegWYjkN+r0CaUzIpTZoWG+lVsCBN2WUZx1
	lsgS6E+aI5b/4wL4jDwplR1b61OiOMPovEJGL44lV7eYuHadioe74a97PYPUH0OjTZYWmVAj9kK
	ytly2XTQs8UipH3jdxpFpT6ggTdmXHa2UbP5hRNCIw998Z7MePh7rVGIRQ0gq8zTV
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c67dfa8d9dmr7583811637.54.1785156713127;
        Mon, 27 Jul 2026 05:51:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c67dfa8d9dmr7583779637.54.1785156712722;
        Mon, 27 Jul 2026 05:51:52 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:52 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:41 -0700
Subject: [PATCH v3 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-4-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=MQA2xxhUAWwsr5VbnBKaNxs8mQ5H5+lg10MJbm1R61HLiZ5bjREng0tmYKLeKLDRL3j5vK71k
 n24AKLD2JigA107iua48tO3YT8PL+6UqgEWumJu2/XKLy6+fI/9tXL6
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfXwvKFiLuwuu/B
 Jg6CGQsH8ZMFNjIc3grPUIOX4Qz3o+mucC+UwR44x9IHBH+ldFrFYultanM2Jl338nNQJ6JKsql
 gbkrATgBB/6Ay9pjZb0CYgqu+tR7Ol5N0b/omiA1K6+f2BKxnp9CXHuktoML5hceJ59wuXYU7ag
 LLY+1jmfLEUoNC0pAgl5eL2/8xJSMJa1o7VBG4Wdf3CNZGwdFGKzO4wZ9Sfw3y5Qw+A1LiRT9Dg
 W7qumaRaNrQQXyuUYJKoblqzhgLzw9GWBwgTGKlTSluiEYUNPefw3mOTJGbqq3Vx5s2R2jQPhBX
 vPY1KO8GG4Oc/iTPJPu76F1QQr5+c53BmODq+pVDl49YdZNg6KP/30vz5sL7JqixzN3i68YKPme
 N4c3JGcnjEdo4HgmdxWibVs+mqF3a9PU7rm1A+R+OEuVa0QPdYeqNqqzWDoxOhWUmk555ES7/3X
 gufuw15bYgaI2eFNhLg==
X-Proofpoint-GUID: XxovNtxg-n3C5Z5U-n0H3ire9ncOwujh
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a675469 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX6ARCe4SQi0/E
 y/rOMHyh8hlPhVlixwTlcH+uCBHFA7rtX3rjYUo3orDvbP3yX3qB8ze/eqnPo3NwU3fBrVkiwjE
 0XwRqWnMcH7sQ3HHjZyfyxiPeyVL/Is=
X-Proofpoint-ORIG-GUID: XxovNtxg-n3C5Z5U-n0H3ire9ncOwujh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

