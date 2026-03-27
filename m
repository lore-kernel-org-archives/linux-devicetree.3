Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70953A453E
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642808; cv=none; b=DN2FRsFdyk7tj7K+AcQ8kDeSHUAygj+UlCsWXxtBCfQGc7UrYZE5N/iBLO1K4RGXOhBnwl/nGndwkPs1sad9N0g/eTfWmdHuu2Z1sq/8vFryce/FKKh/aGM7j4tlnqzPsturhvCZDRzlRm5WLixh15kOpcqyMisHHvNp1uc+U60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642808; c=relaxed/simple;
	bh=XMmEmNUu9RVdz+GiH0qUt2UhQyeVsFtCItZxcUhLc/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrrvXvTDj9jY583VAH5PvTP7myt5NpiHqvzpjgPAHnuz0VNPc69Ahd2kKQy6aCHxM3TPcjU2S5p6C2Io6PpSAF/VA8S0So3lg0lX7YwFN+HO1q6tCJQ4V6wwJ3xosGtnqIR1xRINPd/uz8YONl1wLXZUkUbfoli5OR0eT6FJPtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwUtV0wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACh9yo8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwUtV0wM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACh9yo8G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2QuE133548
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=; b=lwUtV0wMSWBtkmHe
	9QfLu6S76bML3aU0EwUQWcq8alTMeK4iYYliRFNlxlocvslA4kZ5I/EWEMnwLq3Z
	ydAtWUnMgrfLF7SpLE9SdtAuyx7aldIYAKdOixBiGtIZSgzxDzXlPPdhBim/5bS7
	EbRf2SpTDsxHTOZzcrwJXaa4P1dBNH1fme+EXK/X9rd2V+FwZrL5SylVtcl5+oxA
	S2dMOUqzGkAlsCA7B5Hfu7XU1AaCjireBdxWs+tnMEchBCJS+kKmwbEKumgtWs5C
	wmszQiB/wnGX0K3yXM6RsPzlXPhWT44PLHelaDXdqoZ7BAPDaOFhYqMEXILcjIP2
	NDkD8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhj8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89ce5eec0f0so4616336d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642804; x=1775247604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=;
        b=ACh9yo8GTulm9AoTFNQ3s7hXH4M8bdAxztlbczLpJaLZPNbWaagSFJGN48m9M0bJlS
         iuxQxSX6sv68sdpZHQ4ZMvn1082/lLAClCa4qRiKXxqiDPHKvwfh9zOSfTRfuM9LWFvU
         lMuGrprwdqx/inLpcfHf9kLo0hu6pqrGm0TZcHXSWmcAHR8bTp4QlGb/TtPH9hrhHmAN
         vgCDA8W39ywgxa/RJpq86H+eZryyYNNlGTshC+u60QfmAnMk4Ww+lephkpom5zcLSaHM
         0xPpTuSkXrX884me6ufsQ4T+KSvnuMlE7IRQVh0GHteTKWw5FbqBja9iaaXWgJQVEu1h
         oZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642804; x=1775247604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=;
        b=c7nDvIJEqsRXDRHCzycWsxGldyTsxHC883lHmG+mUYW3oiFmBmrp2eOA8jjj1ClnKI
         gdtq3E+onMaTZv5GEM2N6QKFmbB2z+ni/yGfd57omkE2iKSbm85xbOHyNbfNEmi72lmL
         SZgNYPVnIKgudscsIACoGIRMnJuqQiH7/rBuvOPAU7CGMK0SyOLb7Eb9BEgDM2CgnkwK
         rsj85QR0guS88LtCqJc8I3fRcX9aIAJQQm0C8/qK+SjYIAY5vr7++vC1QiJlRLdIix8y
         e/YXFMe2r7H+Hy2kuwAkXQSvi9LXGgwfy0REjjmWwwjeCgbmW+9tqSQpBGEicWSMa1+X
         kJvA==
X-Forwarded-Encrypted: i=1; AJvYcCVchsNoPfip12i749d1EVbk9C9tMWZ0UC79n/BqhebO1xsmh+RAs21tCYlNPVTVbM+r0SjBqoFeXJok@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhmWP4B9wtcZeRj0dN45XThdXcXvcfhUJjSwMaJ+cxU+Le3/s
	vXkVscS7ngvwdoFKx9ws8Me59HSwThJQRefyaJ2RJUarxTwXtkt97EM5mJfZ3tN2rkcG/Kg3dMY
	YCRBwTDGXjPUlzhLlKbGv8jXzfdMwO87S0VtKEf0CCYofSkbzSPSUSh+l7hKEoGyY
X-Gm-Gg: ATEYQzzYThGxiMXy46BVgR62ub79j22oVA6gXyk8Mll0t4nDGms/ccgUtgp3VXEQQ/Y
	K+UuhJSsXRMyAJtWeHS4Zyrp2zP/By5kD1w39gKoCGptzNUTavHnDw0N+yXYd9xUdS9EnSueljt
	UiYBrEzQSETKNoviKgiKzTxQPXYz6aSLNW7o/uVYzzBPrH/0rnUCzc6Ch858LA+zbVEWKIfimNI
	TvpwL+rGdf96Aw6A6EI3OlnGeuYgClws5CDhCbZaJHNRHkvJlqgW2SRFXITzbcpb9L90Rrv8044
	OXHC1sUaup1qA0vcPzOxe/nbG+zedETMxvd+0nU3jxtJwfTnC5ioFTfzBRBGVgJpfgVGHMKwyOa
	z3ndGE2kdLzc2oX2Dvpx1eQSamjcnGP4Z8zbLoxUuuFKG0WkQVB37zmiOcVnPGgmiEYf9mIg6qm
	0YRX4FNheGA993Tlg6Yb++ONcg7+svD0n02NQ=
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr54504471cf.52.1774642803782;
        Fri, 27 Mar 2026 13:20:03 -0700 (PDT)
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr54504011cf.52.1774642803323;
        Fri, 27 Mar 2026 13:20:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:20:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:55 +0200
Subject: [PATCH v5 3/4] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-3-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XMmEmNUu9RVdz+GiH0qUt2UhQyeVsFtCItZxcUhLc/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZrvI7psFdulchuoRFrrm3bjFtNBbfR/r+Ry
 EdAolOGIA+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1RaIB/90YGdp6y9KsL/zEmkoBJmzi5qBdnk0y1Gwq6BLObnMYiqMFx/DuBesNoXn7PUPMlQA3ku
 RDu7jzZhYbmPlwn3Exz9L5JtPPRFZL9TRxUMJzl98SaKUytGA1gbGFGjwNqLV3AtERe3DP2Q69M
 PnctmqJoVHm+dLJ6mjssqolccXtC1Eoai/cl8ZvUYNLF6mk+DiGlXoonFE/Viw9HNqE0h8IN/lI
 f+Zr1B51AUb5rywdJcTNtGVM1qG4Y1zzrH2vrAGcgTZhUv/JonezqrY+2/rOQtgJKP6vTgNC+0L
 OgmERuZuSQiQltC3L/vP5unyA6X14vZu1lVZtlUOZV59ohuG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6e674 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2ewHlduzuzxMNEBOIYQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: _xb7AUMr4cDpveW0DwBfMJ73T49pfoqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MSBTYWx0ZWRfX1o2dsz5HndeP
 CeXbQwzT5UFRyI8J2HsRaeWKPGZb9T/fYbdGBhc8QmV8XbPijt7NIFWCNz2rhyw6xLDjp1ypPR4
 jIYg0ycCplT6pmHRkixmQbL4nmrrCdiGgKZdZT9xfwVtR3CWbtdNYg6ec1ifvTK3jqU+DzlTlvh
 yEaq8aTGlsSfvBhIOH8nI4KRqKz/pUWUcwYHH5UiVGOZrTWYZspSn+jQ3wn1Bz0/hPlpWB3BW6N
 2qW79yEggOjz2iS60MG3blAs43YFJOE1eQ+ZxcTT2HymxIui7X904OKllJvHdRAlDmyLNKWBkst
 EdRUWgNV3L6b5yAOyIdG+MWY8x9vb3RE6zupMaf3i/nT27XwcW5Vhs3OcC473du4iCFUjn4or4w
 GTxQIw5E+e6ep2NpdQ4rLlME4lOXag3prInBYnnxgjhjXQt9Rv4a+L+66xOLffRkcdhEze5NxU8
 GZKixBuqh5dys8Ul4GA==
X-Proofpoint-GUID: _xb7AUMr4cDpveW0DwBfMJ73T49pfoqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270141

Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
and increase H265D_MAX_SLICE following firmware requirements on that
platform. Otherwise decoding of the H.265 streams fails withthe
"insufficient scratch_1 buffer size" from the firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 12640eb5ed8c..8c0d6b7b5de8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -67,7 +67,7 @@ struct iris_inst;
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
-#define H265D_MAX_SLICE	1200
+#define H265D_MAX_SLICE	3600
 #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
 #define H265_CABAC_HDR_RATIO_HD_TOT 2
 #define H265_CABAC_RES_RATIO_HD_TOT 2

-- 
2.47.3

