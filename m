Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CCC3D1CAD
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441020; cv=none; b=NVH2aTHJIhwsplVh0/wfsC9bNCITXj8P0gTtJBiuDXdxOBksq4lbId4+ZJYpmKlANJQB6sWZ3m/AVfV/ruRbd4XS7pTqJIpTQSLvsfEQYsEvRtswMfc+B+qarw/AFX2+ENkuVd1sBS3wzR6nIvXH6Nry2qji+OmdNHIT5DT1soA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441020; c=relaxed/simple;
	bh=uTGT+HwoXv3r5ZEopikDz0sZtchwtzveYy4ceCEFL6k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KHX7wV4Tgf/swQ2iYXc8DBwsZ+zCMr9ociWOaWby7oqIUnVL4nJw43f0946gs4J/IHRQWb8dlf4B0v5V2Tok7t2/VxBWVx3wLWKh20qQMZH37fOlaIwXMSRBI27NB1xb+4lcH+459OyXKxAgw/hLh0I/hoMp/bPrydzVr79DisI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RR3IfW4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCmvrND5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RR3IfW4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCmvrND5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG7jP2993747
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OVzaIuHWFCgICrC8E9z9Qn
	bCHnVGjS2giAh9YNd8wbg=; b=RR3IfW4nt+CY5707Qq/eEB46BKn0eNvduv5NL+
	PkK7vpJ17Emm3B/Wc9dlVM4aaoPVUcjDj/K/evvYOx+K1JaFwJ9gBrcT7kxsY82j
	H/sf3j8zUvh0txMZtaezUCUtnB8ZfKWpWijxNfVGAgLGNuLYvgW7wOysY67FkGBz
	2n/Tt7YhF7Jd1UWaqMsJ9Ik2EZ5pxaK+hrH6UYs7+8+zPqUnIdLxG95aQ1U8seYl
	1/sAqgrzhfSiy/dUEh2AJbJvNLQ7Co+9tMcTS2jVIDLYUv1j4GNTBJTD2Uju8crt
	ILN32auwkdGLXLi97wb3IYQT9GdfJUWuPFkEmF5M/HaVKYhw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4gc34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:16:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94eb847f11cso11312665241.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441018; x=1775045818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVzaIuHWFCgICrC8E9z9QnbCHnVGjS2giAh9YNd8wbg=;
        b=GCmvrND5UGIcwWOPP17R+oV1L4VdtZriT83X9Nf1ZSj73PwrLLgjgaVly/JHb3CJQB
         kbvT2FsCAhDms2M/40/b8A2h/8MQxaiDsLq0WDNfuRf4/99ILeT39nqV50N6EVrEDRGb
         SWDwHgwlB5OSvfbxWgkWM2C3m/l+AQHZsh98QWQJoaB6KJ+No5nL55Uh6sGzTLKTuHCr
         sCDTfqRIUyPA5QW9JZ/MWvbVZNiZqkQ8sLqU0HHqryH7CrhlhxT0YaUp9qjBlDFdX5GL
         VLlpyZMGxHhejQwTKmSPIXx17ZfBcmYm9AYK8LGWciidAxpwubm9ZwmutAQiy7s3/PT0
         heyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441018; x=1775045818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVzaIuHWFCgICrC8E9z9QnbCHnVGjS2giAh9YNd8wbg=;
        b=mWVvRQ38wCmXjrvAz8Is3+wySk5tUbK5zHiQY4dT5/Dwr7isc1KW0RtKho53amP983
         nDWDqNiF98iP8Gf8pnKodyEKm85JbmAFVpAbWlQ1Cfo/EOqPpJBSvZGOkSbWprj3EZ8o
         JCX9S7nt8r1kdoN0+6xu7Akhk9zzcqvl2BrQIKBs0FTkmK4LU6++gRkEfw+kjNf7tOAO
         Vci5cgPmRk08NHZ2KNLNRSSbGCez5BIi0oSa/X7jMe6xqs2XmD6KPyN6P0t7m3IsGhRv
         V9kkkxXJiKsTOMxCxkewof3UdheaLnYtkIQxuXGew4MrY6LwlLGPR3cJEQcy+qNzVFIe
         96oA==
X-Forwarded-Encrypted: i=1; AJvYcCVQE/uIAj64bXLM3DKdfpEASAUDopETYAZdPEXAw2G+sfCqke3Rq6BNAwJ979Wi/s2VTMWMp7KicQAr@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLJg33spXzWSEHLts7Qz03kke+MSXENI7MNfh6QUEBx2rWhf9
	g75xPzMd1prdFy3kbWPr/PCkJSOvdgzGVpZR5l0b5vHpFaRra4EZKD9XfD1IjYxst1en21ZFa//
	dACYcU92xGiUWN5iztdwYCqmB16fmiJ5lysZtLcvOI2Ds0hy30x+WB2JhwG0E3K7v
X-Gm-Gg: ATEYQzx3Vwsz1gxjTKH+ouOw9mbmYQX2Fdb/bB8f+znKuvt5EXUre2tVDwgtSqthT4G
	4ngB52VZa9BwNawE3DwHG8XsNXhez9vJErfUq3G4xDntGch/9u7ZzJp6GLi0XnjgbLCwbKEZnr3
	7VcrUURk2PrBHJnqqIp1irMq+j4tZa4XKqTIxeKaMHtJSRjmO5LmSf87fn1m5JmEnCA8lnToITb
	k1BxPanCTQw/LwjALdX9u5nf5rwmVfrWF9LAaBqBfe8i7HcaUHK/xSX+Ya9Jtv2i6cF6rfuso4s
	HCWBXew+AimJzY0rS8gm+ZX4wax151SrsTHZS7RYzuR3jHR0X286t97UsUaD5mHlDvC5PRfTReS
	IdVzFwgbPPwfIAk+9kC/GEujmK4F9I/QIAaVPA2bRylaK
X-Received: by 2002:a05:6102:5694:b0:602:7470:2428 with SMTP id ada2fe7eead31-603870bc884mr1638651137.10.1774441017994;
        Wed, 25 Mar 2026 05:16:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5694:b0:602:7470:2428 with SMTP id ada2fe7eead31-603870bc884mr1638619137.10.1774441017566;
        Wed, 25 Mar 2026 05:16:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:16:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Wed, 25 Mar 2026 13:16:41 +0100
Message-Id: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrSw2kC/23NSw6CMBCA4auQri1pp4DoynsYF6UPmQQottqIh
 LtbSExcsJnkn2S+mUkwHk0g52wm3kQM6IYU4pAR1crhbijq1AQYVEwwoNr3VGMYOzlR0+FH0ko
 UVnMlFD8Jku5Gbyy+N/N6S91ieDo/bS8iX7c/TexokVNGa15w4LppoLEXF0L+eMlOub7P0yArG
 uEfKvYgSJCRrDyebAWirHegZVm+ujiX6gIBAAA=
X-Change-ID: 20260302-drm-display-eliza-634fd1c3c193
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTGT+HwoXv3r5ZEopikDz0sZtchwtzveYy4ceCEFL6k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Ivgtj85TYGF809/neI0AN9sHw5BoGn4llqV
 hMIIJQ1UnaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSLwAKCRDBN2bmhouD
 101bD/0QGddyyISd3zfx+N2t3rQhikfcuLeZvwIo2WHhFJCJHQLHENy8ivKO7I/oe4982lZ8A6C
 dJS1a4MO0e174ZCEAVaTACeQBRlXmeic3Qq43tid5xQEU59vzqe1g4l0Go0xzTROjGqM9u7tLdo
 rzSZN8Pi5P6EQPNcXcycef9Rg5FoBhmheuXU9bJVPAnHre6e2fPxGVPTLfWUEBS9/mGrq5LEM+T
 Q8EJmvoReokW+YjddIbbJ0Sq2hIsOtoNiEYVQmW0jNqPsrWDvU0bdmiSquMhpQmtyRCqZ0wKPz+
 SLgSoHdhY6aEuqv33gGbw0ndPWMmSaTUVZQDth+zXA2dWdMUhUXlhkMq4hnmej34C+PFZIP1rXB
 nmMsWoOL61LGKD2/TpkS47Bk1VH2kIYNHlTp27pcMiPXnq/16ewG0jT6aOvdt74tY+2YXW+kVm/
 EKy5rjT0w1Z8oy0SDWCFV3Be3XAORNJq1LwSGCMcRrQl+k44s6qIZHC4/PPlvfBgfD+XGwPI2lJ
 Xv9HT/nJplPEEtwSKIqNvndawRx2xGoOCM/sddyU60w7d2ArHHZOJP5F7tfWkxy02Wmdsbu5J5s
 7RXCqI6S5O/n4EjGlTmNkXqi1QN2JjWWcRrDHKO1c3mb26hmRqN2WeZML/ZJ/vCiDEKULgTrZPA
 F+mdC1Bo/lJbP+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX8ja03voYpc0T
 feUgar+EICrzftYJ+NqZkeq5n4DCgbPWfTnMz2OkpJq/WKnnGFINRmcQZ2dH2KFXyAgI48tTGCv
 zqd+8BssjvIOr6Reerw53VcjQsKIXGRc/jPLXzgNcwJf7AMDSPVWBtsw0f7rCX3qDuWoXK7m0SX
 skjQ3UV4JjyjryMqnHSu7OqW96lXFvePvWYI4Le9wxT3G//IjZIbewIA/URV6AxsvJQj7R9hvwl
 tHd6dBkeqdjzMwL6Gslkr2p4ZO4D4UpWjNwPZu5sUSTSRdg8qUWR34oCy/dr39BXjGly0Sd3F/f
 RT4PXTdurrY2t12j831zc7qGK3egRzSd47WctGTh3lva80Ay52ygOd6eKvzbgfcAJ1Lz0tfe5qP
 25pTxnaNOyGFhpCgiWVTbJR3dAJalZwgp+IEN4Ga4dSyGKWTj/fQw5pDLjkwORUQjWLLYVLsEei
 /P1xVLjZkYweVS/8Dxw==
X-Proofpoint-ORIG-GUID: M95EYsGF_y_yjBDhYEeF-BFqF-u8TWHc
X-Proofpoint-GUID: M95EYsGF_y_yjBDhYEeF-BFqF-u8TWHc
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3d23a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dxrMdQflyC4LrkcXn-kA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087

Changes in v3:
- Re-order soc/ubwc patch to be last in the series. Maybe it should be
  sent separately?
  Use defines for .ubwc_swizzle value
- Tags
- Link to v2: https://patch.msgid.link/20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com

Changes in v2:
- Add Rb tags.
- Changes after review - changelog per individual patches
- Link to v1: https://patch.msgid.link/20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com

The MDSS on Eliza SoC is evolution of one in SM8750, with several blocks
removed and added HDMI.

This posting brings working and tested DSI panel, while DP on USB was
not yet tested and HDMI was not prepared.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      dt-bindings: display/msm: dp-controller: Add Eliza SoC
      dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      drm/msm/dpu: Add support for Eliza SoC
      drm/msm/mdss: Add support for Eliza SoC
      soc: qcom: ubwc: Add configuration Eliza SoC

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   4 +
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 494 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 11 files changed, 885 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260302-drm-display-eliza-634fd1c3c193

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

