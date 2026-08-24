Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17E411FA7
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572520; cv=none; b=fYCEBDf2xGwfgVcf2zAN122Xwgmc8W/oWv7rFJ6pf4U7IIW0+VWIlUxrackzCkNvO+GX0iSqrqGKayGXx5noR8gITp84a82ZB84K9M+mqeWbAmBMOj00LX1HJMAE5MtQiQZH3Tw7RxaYn+E5bgpeWlDcoXNrgWMMYZkKAV/vZxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572520; c=relaxed/simple;
	bh=jmorG+sVx1jmE+pmAn5LNDloJj3Nod1ZC9WT9PbJf3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGn7aFhBtWzbXujAiJzp2dKvUGSU2XDNGi+9Dn/lg643Piiqe2dFIZWzNGCBv+XrJHs7aukj8TdXdkiAtiJDtLT+0TpSmqKSqfjuWD4K2wBiDnEsXHtIc+H9kx0BA6yxr7ovVvVWr7MIeg06pl6inOLZrzu0/w60MVwtsvhtCng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVunx+GZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEWUn8wp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVunx+GZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEWUn8wp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMTQH1673126
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=; b=BVunx+GZSV/Vc09B
	lLZPzxrRnbqQxItV/fa39Ouc/iI1yY2P6frNypWXqWZfz4jbC/GhlebXBtiqA3dP
	5ZopAJTUi9nA1wD9waE2UZ18mROpV8doS2+78CKyexABBHQg/Rq8NaAZ4IK9U82u
	2tH5+pOjegjgQAFXEZZBJd+YVG/lau05yxOSgZo2C4Nl0T+6uZx4U5P3ny1X+y8U
	a/zXVqKrWG4UojoSjtjnQmAVVrSOwMRlmhA+cYenQvFKXoKw7Puja4T2ho11r87l
	jq9r5JgrytaVIu/24ciL/75Ikbf7pEiwszjIBmz/4IanC2pRKbalTWc1zDhorDYp
	Ogxnjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf117d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7b3adda4so35329161cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572517; x=1788177317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=;
        b=MEWUn8wpDARBGYcg8YT5wGfIe66jZpztNzdwJIIJq3eve1kW1kYeC0xvtKMM9ckSIN
         g0BnxIJh+PEc8nschtavy9K8yBVIZB3VlPfY5nA02jzwFx4zoa21060uAkRc8CaTxVkI
         6HS4Z9TTUPOy30nzcrogUUqn2nTFk5kf+WVqQoA8YqhN7VqRZjcEi4Ig0OcXsXXdAz6w
         M0gtrCknWnBMbi8xDZVKJNZGE3aPNc3t3tfWsTxeoY6BMv7dvFHxLCg7QWI66jwfdRvw
         y7a9PCd4vNzX3zUbQB8zIakhnUqiwKvsFi3rCHWkkXnjPsJgIlmlNPQKkrsu3lowXnGd
         UcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572517; x=1788177317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=;
        b=AtTDciT9Rla3uIxK5GY18RCc0KeV+ljRDnjJVjKiiRwcGj8k7xNTDnfM55oRi51kqG
         093wkNaNJcxuk6iIAzYel37NKspF0gdE843PeCJfSl5Nzu+qcIkw0PV6v+MnWp0FuB9y
         Uff0Nc093njO1e9wy8CKsrNn88rwKBl8e2BPr/gOYZYTr48wtFasML2OKbsVSPzEIsqs
         HqUiheuztUCGy2tN1STZgC4CwNuRhLjvmj862AwL3wWNdFVEBKc3ONvxRybT7zXAsJeS
         oMDKh8ren0U3P6fRaZMiHUNyvcvEYQ97bqRp1bbCe6i2VMazL+CgsAorJt5GAs/l6hT3
         FmKw==
X-Forwarded-Encrypted: i=1; AHgh+RqvJDywhIwUBhZpSNeMMYGWaBk4+d0efHFUkS+jJ/cr2ceo1TJMI7M6OKHj04x0lD7gI+rsLs9vDvnp@vger.kernel.org
X-Gm-Message-State: AFuF++kJ3/gpTYHChHQW/kPYyNfLixwZzsdzKp9bUzn1PUimxeQa6DPP
	6Wt9Hhjs/BIh66LN1zNeGKQThDw6vzHhWkR3cSJlW3BZnUobnfwpqgDSy3gHi30hhH096vT3qbA
	AfvCu4KyZzYS44Br9sT5oo13Ty9MD3nyie5O3uQaAsm+K/F/fNImPUGWJnAJ4sdKC
X-Gm-Gg: AR+sD11Q8Kbxhm8/wvJIIUvZJLSbGzp1duHfoKHUvDzSY/7Lnei1jhGB7stShxSPx5z
	UWZGlb4nvD4+mDzvLFGeRROO6ASQQ3RbNHsGi63xPqi1UqYIKafTS4SxxYTTxBB8yK8bWq3SIs1
	qQkEM904YOtlLF4PuXVTwrX+eZTFezpea1HLkFXraMX0MVpGXgWJ1DYNu3E0qlFXrsuClXuj0Um
	C3NLe7UEDC/646AbyLdG4T/KILKOlFoECCcANj5rt+KwgwytBhr9dkqRJtHeQurWhh3PUX47XDR
	6+5psA1IHFdmQy8lvBFfF3pBh7cUrgRJILaxgASVZ8j8cmtJejeXpgchL48EQl3xalI7HoIgpVy
	WXgq8GIS3
X-Received: by 2002:a05:622a:1485:b0:517:8470:2d2d with SMTP id d75a77b69052e-52df5a33a56mr272564201cf.29.1787572516685;
        Mon, 24 Aug 2026 04:55:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1485:b0:517:8470:2d2d with SMTP id d75a77b69052e-52df5a33a56mr272563351cf.29.1787572516124;
        Mon, 24 Aug 2026 04:55:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:57 +0300
Subject: [PATCH v3 10/47] clk: qcom: gcc-eliza: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-10-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jmorG+sVx1jmE+pmAn5LNDloJj3Nod1ZC9WT9PbJf3Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDfSTFCraCd4oZUwxjIHAdMNbUBX8KjtzLvk
 NSQF6AmeUuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3wAKCRAbX0TJAJUV
 VvczEACQ/BpaLwmxajxISEWhUuHgz/Q33UY2jyRAIFB3W+0dYVXRHZ776asuGMm4wS0AETS2R6t
 J/MZlsVCZS11qwWsTMHUh2nG4+ifPo6eWN9uRILXPRQJuy29jqSpNgQGKjCR0rCqx2t2cNzrDCc
 f4TJRCFfqGFjOT72LkuQ4Knd4HhOx2vId1a8ebrmgWmi1sOYlGS3FMNxt1XFr1cUo+lw+BD6T9e
 j3TQCAQ6uogGWG5qDjXWiQmpuA2YDd51i/upfYk1Qo1QXJsX/6SjF+87mqlLWrvrZx98n7zfHPu
 NornMZI77gdrP64dgDNgIqRfCrZSJmTDV/64DQwElDBFi11/OIjb8RpsbGatn19qrNCuXeK4wfm
 I2ojIkWe5EeUuDxkUY0OIiySBs9wmlFPQcJg0Hb9d4WhOijXXFi0tWNJUXw2DWDX+e7aygPRnGH
 Q7INsLdmwm0mL3R75RwhTjQK/h/7OugYf5q92zchYCjFu9MyP8/FfqRoUlC1BlNLZOwEL6Nf8rf
 3R+GnLijQ0DhB/sT/cbnd09LFSDYji/gyEKURy74P4rQUm42ip6dHZz0yMM9nHxkLSjgz8uVMdC
 vM/Q91J43mPLj3oTHT5ucKx4oab/sgPMZMnQaheTUqxmKgP6ONL2tGITv900hIze3ZqEp3dqkqc
 GAQprHVvqEvxumg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX9LngBw7ZKf4e
 l1jOYTkdQe140lOXTbEEBwr6Qubnx1heW5+Tu0sc1mVk8U58Or9qRoa+CrJjGOBfClXc10134nF
 lisUWpU9iWDtgjU3x5MK/AGl17+EB/M=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3125 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lgFvq8bPxKKT3kYZ0-wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: racZs2shVPXRA69kdAkiS5cvsGAGWzCD
X-Proofpoint-GUID: racZs2shVPXRA69kdAkiS5cvsGAGWzCD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/bIrxN021/PS
 B2NzMTdAGM97Cp+BLqX3fhngsvRrZ7uywkJRurZAeyIKa75/XiRCLC/VAF3RMtk58M8NWNNcrhi
 ksRnJSbgeLNkCdUEOH9WFoeCXgrcNAyIc5K2HIxkxZaTU3SvHDLxIdmLumX2zyGK+firTUfC0Of
 h3sBPnsqki3zIpkrrBDu86KcBzgNjLGQjCiV7b6OZWtYUeL8Xnv2z4XLhABg6z/GgTLPy9FXfTh
 b3s6yVa9402CqVyDW+QLc/xo6MOyhGPxGPiMuCmirOKOo7h2a10QRceFI2I4ahwuK6x52D9lBUq
 vKBBmyGcgRBIx8/v9vy9LD8OwHzAq48j9YS5u5K0waO3Y29oL60R/vuHufhlXaa4P+yQeyILYI+
 9vBAb46DnE4jSwi51IbbQLZ2VU9/bek8Tya2Tyu501+avU85F6yrvhXJ28KzKQ1F6SQV6d3KlmC
 ksRcYH/Xa++Sfw46paA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: 6393a36fe184 ("clk: qcom: Add support for Global clock controller on Eliza")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index fe18942a59ac..e26e6e6e52f1 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3068,6 +3068,7 @@ static const struct qcom_cc_desc gcc_eliza_desc = {
 	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
 	.gdscs = gcc_eliza_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_eliza_driver_data,
 };
 

-- 
2.54.0

