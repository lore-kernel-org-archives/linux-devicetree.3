Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CE486652
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246488; cv=none; b=cgH4X5MvPyXY5rdte12XD7Cv+LMasDlQhT/tVH1+hDC2ovt00vv1mW0DtvpxW63MNtog5z9c/bwJIHaiCRUrqN/4kumBVCmCIoGQTKkxj40WTg7yBzMWOcrKGH07AKSNPYPRGHnzSqpyp0IzR5ty/lpL8wakm4b0XR+6MRprCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246488; c=relaxed/simple;
	bh=8HzxPS7FvDZ+M+LS3tklfzFn4EZhdMtCAvEsfyhCM74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYsDLRcVITGxD/MeFaIrVDJ64h7X6lMEvTJGjO0n7HdPA0QZyiQsOsclzcJJP+vzdUnDb8wn3HCSph1q3CGHym5kO2bBVWqxCnkXgPGza0vnhco+PhUCmtCd6Wolf2kU0aPDGynN2eALtea31g2qGPlU41i9dA/hHJ6D1HuAgZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWpTyBHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF3pNkXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWpTyBHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF3pNkXy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9QBiH1774038
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=; b=bWpTyBHg7X6syvcD
	zVY0QC5ucHZaQP5F+eBPVYFT99OWW3T31hnDYAiXYzgwn73VaztF0oxsnknYKVmT
	GGTmkMVuUCuZhaIA9htDlE2wNl40wB8uAq+Q3u+Kd2bG9rn1nfOb9PrnARH+mBO+
	2I4oYKAm3Epl6MJhrUGhf03Q0PzPNMFjbXpPC+6lXNX0GITq0upmWE8JpKdB5qSe
	TS2n+T7Iqq+AkHB5zsR47V0lgs8+fYQZNZ898K7W5OkMfviENayHII7Qhb5yeq39
	LDe5kobYjYDonamnkV0qeRjlcwYmHYJDJlAanWHF86DhHr75G9C4ripI8sWpSMEV
	CJLYlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb41c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso450286585a.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246485; x=1790851285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=;
        b=fF3pNkXy4l+5IcQ5wsYebm5r6jhuvvxMDcVqw45bhnh+ik5CY68GYdFcvpyEXXID26
         z2jYtMyl4iyI9iYaVOF/uTNUggO0821IvKRAwWNE+nagobKK0pX/hVywOEhlKXmJH6+V
         xJ/d3QC5fUSgJ05CqvR6UhVEvJbm9w7MdJ+a8xcQunoRnju3Jemdkk2QmXb/iHydih1Z
         8ZvL4Y9vVwecZ9cMTkB0Dr8JtIOuI3RfLjso5KtOp7I0ovqmf9HmGvmBJQ5mvl68GnT3
         39qdKf+5LTV/KqWBxY0ATBtcAotLvMTKJtLC3jBsF5nSrOPI5M7oroqfSUS4G8xC++dd
         wfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246485; x=1790851285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=;
        b=QYujCEBqUXuS6+T3zLSd89cq1owg5dbrCKbv5OTlvchJh92yeJ/UYKjbjlqP6ui1Yo
         TxxBxBrL8vYY8WSlKp0KeZqUEo6QMdrwUTlPzoYLDZ3hfNbNfSsyjaKge5pLhQ0yYT9N
         zF7yyb+a5DwRtiUyYSJsRaY1PkYrBrdJ37XSH97FJA9X3BkLhBD5A60ygSvMA+ot2nF0
         Eh1Ht7GVsMoM+LGnX85ar/hGlkm1hdwaEI6kZpd6vcB5upgLWCv1dgA8kTmHYa6GpEjp
         92SYtua/LX13n2QUgSkVVLrnTk0RPhe8lMDZ1PpHqMyae9o9GOf/LxHGDAAOrW5pXEYv
         D7Dg==
X-Forwarded-Encrypted: i=1; AKwUvBxmZ8Y21gk0HLxOKoAjIbRDfV4H14sGFxsMnhyAAqgac6fAQQE84VbA0OiOL/u1EZLYcrGxqPyEH8sg@vger.kernel.org
X-Gm-Message-State: AFuF++k01QzfaqZ64JG7VjT3CEoA7ZXPmsEjdycnTJb7Cz87T8PYDH+J
	Du5us9jnrYssBHDze97okdYSu5I7JvJi+qMcabOEjJbuW9ThbuAD/+BgBI1m5yuS5hwhqK29wec
	03w2LSx57JEUIZaXANaNoaG8KLswJLU1xDks6MqhXeBfRXMc3fReCiWiMQdqQu49S
X-Gm-Gg: AYBFou2EUaamUgv++utJ8FUY3gZ2lsMFLfIxmvW2rWedSp2cH8FEpPvpdxtxtgureq4
	B+grxyCDm+uSWX1Vb7BgPNPmJZO2q3NWIyZPJOraFoi9bwL3Zjr4kdrMlI2M2lL5jCSRCDLjkPs
	UZWkc8vtlCzYCBS2p2fIpkA1IRVgJiYrriBPfVxPCHQki9DSvE9t22J5olicVb71/VLSNeOEn8n
	HPmvOCt8kF0sny/DrHTg7C/dAvTQSisKKb5OfFg998AGTy4TLsHN3jLWgyKTzGfzC7wEyHjW5Zo
	W0OLAR+VwKpCkpjNmi5W3jPXAmfOYm+vSqpZ7HJrd7j9Q73I7xy2dGzPkB3IchMFwCROCzBQt1v
	GmpkC/MR4
X-Received: by 2002:a05:620a:2b81:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93c362b968amr194923485a.21.1790246484747;
        Thu, 24 Sep 2026 03:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93c362b968amr194905885a.21.1790246479892;
        Thu, 24 Sep 2026 03:41:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:42 +0300
Subject: [PATCH v5 26/42] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-26-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8HzxPS7FvDZ+M+LS3tklfzFn4EZhdMtCAvEsfyhCM74=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3zTqaaLIR6IS+G8pNzSXTJFeJZVyAyXD/cy
 vHiXvx9RTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98wAKCRAbX0TJAJUV
 VoiLD/9xwSzUyNT3uJPF4SPhh/GGQKrr4hG+Rm0WubE6MkehUtW54CQTTT2enl0XRCUhbWYksnC
 nRiHH6fRUNAtgyyWEC8u/9pir03bAKE6q6ZtJd2d2GuiLfBVSoyFkkI9rNJqu6CORGr1gxOCLEc
 pf1RD5EleMWfjpXGn2C1tc8+ORxH7zMii20a5uPbMg2AUw6bnc0Wr+76oA+ys9+uC89/gt3TK8G
 kzAUhxntJNRVfDJN1m6aQLv4EVeD0+rLC1MTqkHQyhi5H5BD7TK+5JbtJOqWie7PFFwPT90pwEy
 qIZlbT4YYhetEAHi20qjHDl57oGEkCXeuTLGg8J2vOQ8dtMTaUCN8x/HChNTKe8aaqtfoA1H/C1
 rTIX1fZ/8QqpDJe7Kw9THK1SoMQuzOha4u23fxrT8nyIBeMPAUSutCrdHTCdG9nC1iYETGRc8Ci
 Q9FEl+ybzG9yWcJdZ4FB30paV2pCIO7hBILCj9S56JnvK+XADUoD+lqNIZ4C0ecjPDIFXy8z2MC
 C1/VC9ZS9pI3/5rcMQkWsu516XZSvWWdxj8k+GiymAIFGJo7naJg/fpL6wbti6eF+fvJOyezGFR
 wFB0BWhOk6e+8iLMv6SQshnu1YyZhkAYUgYGSGooYU+3YBtvDj5ilCQZf3ryTzM+W1boWBOZ9f6
 FIQ9Ghg23TG6UEA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: tSzXCcwkX7OpXkJy63SJpRauTPTyE-X7
X-Proofpoint-ORIG-GUID: tSzXCcwkX7OpXkJy63SJpRauTPTyE-X7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4Qs0hBkAHlCl
 FE9AX5tcIIfAbaTt29s6rHK1vGoMbstrdqTWDPS2QucSyW7KiwNt9Tuv8Zr6ElPnXQv4C3reL0r
 hA56t43QxDRNZl2fsn9oyEUrtYz6DYrS7JBfQnAmHguTi20fr7cBq9RR91A5QETEhMcC11asYd5
 gjPzgiaK1vRWz4gWsRWK64JuoLrzIF883lliQDHITtTsGEXFwPxc5eVxtgms+ZXeU673cuuPUDe
 mtcDFKHAFrwbIy4gWTX3/ePLfFCoHM+6KOrrPDQlNHnDihz2VqRxe64KRbOuCyzDVqQJQMI398A
 Oe3bwXicnrw/TDXgiDfzbqQdkMjLUP5vJ2QA4AlFK50nNA3fGZkhK2jbO8Otb0hX1ahRKDB/QX9
 qEzrP58a1jYhNnF/XbViN6vaZmiEURQ9Mmo7ZwrNtdi9Uz9Icn+dR4tioCm13zaKg1zCp4UgKmH
 +mm7FGX5vaqqYvnFQEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9uozc0XDWu0X
 qJo05YaKkbo1FO1MaPvZS8Pk3dlMZwez+HrYlb7Jj16GP/4fao4XbF6wCJsv8RnzxX6/QrmS5OJ
 KZONQoijLkEG1sUZc6o7frdT914NyU0=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4fe55 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index c08130218efe..14d44c51ca5d 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3196,6 +3196,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8750_match_table[] = {

-- 
2.54.0

