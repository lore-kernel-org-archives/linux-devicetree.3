Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D207C39D3FC
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591395; cv=none; b=YnEZts4844SBN8iv8m0fQ35EWFCOKQoNlZgeeYW7zVz/68ASrTAsZeghU8+b12rCHSwmQh42n/ZkWUCH/55LwJD0LEowKBMQwFV1kqAA7v6hnpXZ2DMARuXX622eOrrkWQOfrmp8tY5SBzPa64X9IVSbpIXWyVoYL8MhGsf7IXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591395; c=relaxed/simple;
	bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQQz4GLsY3kHGT28W+hxFKFJveT6FaDqQnir39ocspf/BSnS9hzcrcpr6Np0Lk8+bVEPFxw040PFZflCeHu5fZT+dZuLiRQr8CoH8vxI+zgUoZYmBrZYbobvEEOqB48Pj+1fd/02DkqFKWBQXVJeUYoTn9Q0GjB/cnsTpYPqIFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNC2GR87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kG0iWrun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNC2GR87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kG0iWrun"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCL1ui545238
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=; b=aNC2GR87CJrXucOX
	VEhsel9rhuSIbyow70DpMTPuFlhvJtZ8Hg2Q8yVdIZX+bEJy74IahNKZB5u/ZXvs
	/19aGlrDMkAECHKwyQuYIA+7NyXUCuPKzwMRPQzHrZPHTyWOMRnf3nTVr/cyaD6K
	rmj2FJIO1LgeZGGofBh/1A/Z0gkzP6lpu+aC0HaDSudetpeqgUVnxXyV7b90NWqW
	QdCx5S7SNWr/g/uNGmIIcki9bAgePbh7Xg0fotwEmJK6jNEYbHl5pgdBFHVmGoTy
	Vr48XN2bYX0DG45oahE0+snEvI1++zAW+9sowPya50NCn1ZJYhMyayrxwXT+PTvR
	OWOf8g==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444sr56c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:53 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-696233b2816so10327222eaf.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591392; x=1779196192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=kG0iWrunOPMuHCbOndKLW/LKfwXgwwsDYjFYPXCCzazNEofI5ORXQfWFnTs+GOteEU
         GOLMwVb5hO43DJw3F5nqH5/56huI6ThCzbRbsqRxl9vPyNvzHXUIQdBzEtxTUHDXoE7r
         7X/+K2sVIMYIqgt7WP+2fANLHfVmrvpNsqPmw1+HHnMo4d75hsRRN6DgWlyo4Pszkr4c
         xKvLfjwfm7WIf1ismNYfHupfxIp5f6Qx1BJ5s7q+N0P3pXQBXc0MqSDq6yQDb9XoEYWb
         /CPnpovXJA/GJL1WqDdISmEwsAxp/57+lmqyordEbnjXkYm4TNG/2IKS1CPnqlKa9QM4
         3cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591392; x=1779196192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=bJgi9aof5wHKBC7QawwJLFCfbPEUeXSFY6KzxB1zdbRX1zjHebqGvFYOcHniHisQ+7
         nfNogdSgadGECXiexLiziqvoGdx/2/fkAc6VgFjsFyNvGmxnikzwWdw9UXo8fyfCAGPE
         KYT7PlsYTti45ca2Z6Y9DyY6I1FXJp9GdAIQVo5LKOKRazfdbixgp20P5O1DwH9TyTT6
         S8NTdT2qdg52IuorvL0aoeb49JPttnt0/9txLa7C/O1edWvhAdquEPHijzHeaf6rnZKk
         9pI+TbrKyw6ZHH/+lcoJHl4FkUK6ZruBOZ9aEE88SfRrewjPToT/Jj6pwtY77Ow5kfhU
         MUCw==
X-Forwarded-Encrypted: i=1; AFNElJ/eBoXfYiMvf4JoHQ9WaIuZdzndUu+69CfmqCPt/daqj28TklBPIT05qkdVcmI/5NCH3ZaEWvJ+Czwp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7/l/BIRFclPdnHre0gkEYO9OgUc1yfWYvk9Czuh4eG2cyLHn
	wzHeT1O6kZu/kOzc3Hq70EC+OdEthV/91Tc7omkUbtPh+s1lsJuglIU1xifsQGdqbOfMXoo0S4R
	hvNh5NNAws7CIhYXkFTdh5eH3d1WJV9zARKnPAVSKQbSrjo5/Dn9WkdckHk6u/LbF
X-Gm-Gg: Acq92OFq9TWsnxtJcOoS66m66CIXlJI1Z9C7mOS1tMaer71+3CTWQa5cUbSKBci/LJd
	o3y1g5s+MeVpYkmcFZjorMJ65HYZ/aNm2C5JbObvzAgDWjZiYbSaBAdDadM91lodMm2D/wHlRL+
	wIHiHV3HR9epOoIO4aE0tt4HwlpcR+E36t/XLM0IJ8T1bdQtrsJUYn06+PjyMQN7h7zK12EabZQ
	7COn8+U4kCJymJA2bRCnVbMzmPzu4hKQ2TNQw2qnKEFgSud3IWai3b8dW21uZaQLf6rU2kEXpfF
	oUe4sPmzTGkxcwKgkBfGtB2Cvq1DkwJxKqzK8FlikE2mQumLZBvLfaR+EseLocJcJQLZNO+1Iqo
	4tZmYz+1cryFN9Q4DzQW/6XhGw44Do/OKr3WNCnfzpIA+WLZMIqFY8QUVLmlOLlAjxUrj7ey+TL
	uSWt7aCXjYP3t8CNG9zSatgTUXYDGJ++kJuXg=
X-Received: by 2002:a05:6820:4def:b0:696:70f0:7ad7 with SMTP id 006d021491bc7-69b25b178ffmr9484726eaf.4.1778591392281;
        Tue, 12 May 2026 06:09:52 -0700 (PDT)
X-Received: by 2002:a05:6820:4def:b0:696:70f0:7ad7 with SMTP id 006d021491bc7-69b25b178ffmr9484696eaf.4.1778591391850;
        Tue, 12 May 2026 06:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:34 +0300
Subject: [PATCH v5 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-6-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUrAFin2gF+M+wxc/W4ANjprSyX58zXRICZ
 j/IR/OCWPOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1aIkCACuOuwukXm+nYWynwcb4cgPAmYBJclYTUrssk+rPw19hU+3ONBczaDfWgzu8/0wVF2gdh4
 VA6blAe+atLPhziv36a+9GeJvfCGUpC3jE3tcONhdsqdzx8vIp01Epj5lZo3eMeY/AMHvqsl2UP
 OH6ytaDeLF6jn3nKc8YmrUIQuNQ59xRwjbhVwA+6wssLaDqVBVgl+la4Wir8g4q/GDqeLmx6p+n
 aArwsig4imUpyldyExmudDDRXHrkxAyuF4/toa6os3CY/Q2SCpviTITy44Si4vTNxwIp9CLKZON
 /+4gpJY69vdjvEH7+oP3n6GmsgmzKYKU8iWLgC+/uFYuB1VH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1YpZW9lCsGP8QuUmmUbaorLHggR1dnWm
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a0326a1 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: 1YpZW9lCsGP8QuUmmUbaorLHggR1dnWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX+pHa5SbA/P/z
 VUGsZ7dRb5tID6T16h/2mqq5d1I++XPuoHVxP6r9LXBgrWVKwB4PqeTo3ezcCKqsuquDJ1yhnSu
 F2CTegvyFOZ8UHjP3mq9u3SgTAjYwwwfJlatNBXVLPDfhqADJVKAdyX1cCxion9yzEFE3N9T52e
 Ts3JyjVT7hSEw4k64Y733SjgvGMDrDhknKgwLJhpbYBZ+Xx+/zFoCaaImvOgGfc04YFzXzzOMGs
 36BidNRsjgYknuBNfhYIg7yJZbwM/x7rbYAtqr60YLrX5Ih9gfEpT981VVob2TtWnT+dal0Fa8q
 NGpzo2RPoKNR+SrShgqTt6lm8jQ05YtTHDS2/CUoH4SKvQP1rHmuAVfuBBy6DmmLXNgPHVCSQJ7
 UN4zFGNNMtgk8s9KwLB1zRNt+99avGxPB4ZTmUPWff8vMvcoljRrYPeCETq81whsgEOYQr0z772
 ooxtHMpsnk8Hteij2/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3

