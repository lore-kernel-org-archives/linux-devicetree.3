Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F13D88FD
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441031; cv=none; b=iDIhUAe89oxidzbeef3euXfET2UQhRi8YHZQFQ/OPE8sP6/4VzvTCUC4JKJsJcyA62YHEZpm6jU9nKG/7mwqfNr+BJLn+yh0BnPOfz00YJ/2KM3/pcys4D2TFw+Eo1ggQEi1HFdHQg0GvNXwXBeFKkrv3Cl68sBjDV2QnwEiSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441031; c=relaxed/simple;
	bh=mcweX3+xVT2T3dVpuYVKey0ZWpqhWMQNP+vmeo0s1nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6PCliz9Ij4gg2QuOnDrItjmwmUdoSopS6WWmr89JANah72sy/Z7btmViIRK7RujX1tRaLtXTGebEyO9jD9oaLHD9J8cBVcPvRKV+Xk6cbbZePbU5HDiv5skL9SPuui6mP4EGF4uWIpSmtFY4EnHhlP7s7LxmfipAbVzSK6DpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7iBbXB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDafbX01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7iBbXB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDafbX01"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBH7jA1024469
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=; b=X7iBbXB4iSmXvLLe
	VMujAx5UQUu26NMfnTh0Zla7xAYDAmq/OC94dcYG/UiJi92gURqmkV/+qb2BVBQo
	PZTPQc6YDym72ReWjkGOuwC+NLJLtp1zTM6/GrugbdpF12p2GliohN006uD/Gy4o
	GKs6Ua3KHW6u+ngCOyHv/rRdoW84soiZWqxzTi1hZ2hqwMZByfMIC/PNbRHz2jd4
	3j+ZMFN6BoPUchyTvA7djRlHGkvQEVjqYzNNSLxtA9YQp6VqhpN4H9LxwUETy4A1
	sr6vYundwKOSvjhYuXKtbPUR4V0rfO4jlpgkDvJVYBcbK7zzKr85EtgWBtl77m7s
	TKeRHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvvbpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so137568381cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441029; x=1775045829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
        b=IDafbX01PhLLe6Kj7JEanjZ0/lUD9rDbyTidwrOhEOuM2zPaReoGIaxeLy9vZ7LuCL
         SLY+hQQ+txY+I3uEIfacp+nNNfMQqMyugok9xICBpaun/RWedSdcBtoEx6MycfiwA28j
         Es9omNP3EBTEHOq2hHoa1uLiM3qcW+w7T/iyFMuhM9dT3KmzlNYBr8P9ogWTdWmI0r/X
         a5gLFCLWdtcoAzqTsu9zqC4Eb1Rr2zhXb/S8pRKM989rHcc+XuY2yK2B6CkVC8vyI8O9
         31Ag2ZH0Jac30Z3ES6+/R4EgDtcU4qY1/add1OPP8iwnyACYUCfmWSAkGGgK2dWsQt7k
         IwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441029; x=1775045829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
        b=sJxSw54lnVYXaZCA/MQArOjJEuXE/Gz9WBeg4CaLYYa342aqENzE+6RGLYvM5QCAVr
         ZumSxhDPWYs9UXfLNW76yjWe05b2kBEl5vrFtrgJKerPSU4ay6mO2IZXiCBzElF6nuUv
         R+SCYqFtzZxglF3o35NAgSBiIaJyA2g4xvkTMT5no4GYA3R/mAUqSKWfIyK2KCAxZFWh
         1puqbOfo5r5azIsVmNS5A95oRsLabG2aCJf6pN1Sv/7lmol5y6vPoBcs1TQ1xT4u4nh7
         cZ0IMzRxxzw1olomB8BJBerLW2i/a2XBzGKhn92XErhYKl76jq0ErEUVHcLSQedFhM95
         iTMg==
X-Forwarded-Encrypted: i=1; AJvYcCXDUBQhL9xs+hxtug9/8nZ6wKTDK6M8Kw0lwzm6/d8vzDVEf0Em1o0RFz3XFtmnaF9b63pDhH4z/Bst@vger.kernel.org
X-Gm-Message-State: AOJu0YyWB87Z+kZ2ur9MV5PYHkoNACfVtvoGFQe3DcZpAzfwvWKOmfse
	JwpCMCeg/6VDXpabYbDKsiOiznTvAjU7Qd2waXpN/9/w4hY6pRQWy3tQ6wf8dc2rJmPQryAfC1e
	9aaakzqTGcwSOTi9RN5LkxZQCh79aLfMTeTESjsPp+Py0gEZ2l6fOVbpARFo9ShdN
X-Gm-Gg: ATEYQzzy1xIaiHi+izL7vOYQdy1iQmAJBUKtpt1/xozbAQPVqh+YOkw/2iZW5BXjF8K
	gE5x8PYTOlzqGoGbvKEtoH7dKhAXq/B0AoJz8mDKM+nKXG7ozj5/Dvm0+oRQgm3RU9nGNgHJvNf
	Gff3ZVmHsYJbfmqzz17bwbO3QrRkpKDmyK0b7if0iirAZxbojVOe3XW0C+BfNCEhuaIng5eayrd
	rih5gUOW9Hi06tzIx9o9rGYTtRxds4YlgfKQf0SeI/nxPLBYwcxzgXlqvjLSPqgvXOYPsKMAjae
	YrOrr088kdATySvkrqz0X7JnW/SAGVFfKB04s9us4uz3Gog/vQ5UPhY2KdvfK0sjUBCYid+07gz
	g7ofvS+53GPHoYW6Y0uK7DVGN4QN4GyGJ8HtIvCjYiHJo
X-Received: by 2002:ac8:7402:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-50b80efe33dmr31549641cf.70.1774441028652;
        Wed, 25 Mar 2026 05:17:08 -0700 (PDT)
X-Received: by 2002:ac8:7402:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-50b80efe33dmr31548981cf.70.1774441028038;
        Wed, 25 Mar 2026 05:17:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:45 +0100
Subject: [PATCH v3 4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-4-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcweX3+xVT2T3dVpuYVKey0ZWpqhWMQNP+vmeo0s1nY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9IyV+PYXVL8EBB0Cu2p+oc+uWpMYSdHsmu9o
 R4dFQkLoCWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMgAKCRDBN2bmhouD
 1yoRD/96S6BZthEozMJyE2gdq+wvOCZf5zfzRlQUwhzWkYiuSLauvhm4ChuA/XJ7ifv2/IJT8l3
 fu/sMfHS8zpHMiXfNoA6ysYh39epnVGPznC3UaonCkNjpaB+HfBTXuik/dp93+hnIBNOXRAlPrk
 jQesbEjES8gE3w92EsCApI29eKvbwP53tHbJF2h8PL/n7CDRnAsJ/b40w4ezp4niZRM0p0stSsu
 JosBBBV3v+c8TPpv+B5CxjqV729JIjOOUagtGrNY6LGHFlkAdrnTtXvTOLaInAW0PqCNUsg/Af1
 LPVTqgfZjo8UAZYqlx6hb+H8+2qQ6zBc9IMJX4cAOXvJzKtb+hMiJRXcqyfX3dG6SLSV5SDvoh+
 JAYNq5rgwUzeqtF8MFfNydkVNAiHpk+EP41iKQYHbNospGhjlmAFw1MPTW0REbi5yunxesn5H8d
 Jqtz4g73qPJv4opiWebLeG1P3uT2IgFStG8Z1AbIAz25Vlt0r0dg/+q6Lm/xyZnmBA7S0ikIFVY
 mXKA/S8/6Dvw5RqH23khPhpdByK5vNPi39ll3M+DjuK8wdPteOWV3ilhXAvPnlypL8i05ByE2Qi
 G38oAc2G8qgU/VgQuWJ1JdpjLOx2+DygSn0BCtdZX4tPNdQALdsPY9hYM3L0YvfKtanZskDRtqW
 7UwChX0VwbzuBjw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX3fXIlw1reC3P
 uz0yD2k8LoOoihqRIKI08ClCGJQtI4C1f+84xC8xlnqpuHtFz7gT8o5yhegSdmGcPJAO5lhJ9Nb
 jG7U5UqStjGAomKHb9iMV36A6DtTW9vpORTQWAQ4tHkSRdLVvE8Khjbfduy45QfjGZ9mRbQj/sB
 ADw/Fw2FsKHY96lbfrNdtF03f3DMROjBTUcQE3UHR4k7fFY60aw4yB3qrgGTtQkq/+rZIxkC1h2
 iNleVDUUZ4IvPQwIl/cJ2ccZ/aP+HlbMJPuHqS2CHf0Zar6nWejSSTVbtVqI6EZUTH/EfllDg8P
 3x9QdXHGgJGM68EW57agJF2ydJdk/HfQwd2GdajaQcoYqVXudF8akqYvJ1oZovX+5QAO5RocEd6
 i4XroqHQ5Wp+8ufap3pAZf2SB1zfPW9geltUcSrvk9CMkAzwBsjV9yTG7WaeKVHhhJUjNo4Nogf
 5lq2jAy05n95cK2gsbA==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3d245 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GoUmjBwbbK472THZ6osA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iIy2Tt5dk_LVuDw-oxYk7ITbwh16Ties
X-Proofpoint-GUID: iIy2Tt5dk_LVuDw-oxYk7ITbwh16Ties
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087

Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
against SM8750 (v12.0) of mostly removing blocks:

 - INTF_3 paired with INTF_0 (no DP1),
 - Removed CTL4-5 blocks,
 - Removed VIG2-3 and DMA4-5,
 - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
 - Added HDMI interface.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index e29c4687c3a2..dccac525d202 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu

-- 
2.51.0

