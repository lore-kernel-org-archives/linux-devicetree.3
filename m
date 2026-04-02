Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF71339659A
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130335; cv=none; b=JeZfvsr9Sd3vdwvhLizPhoGHR0h/QAlIxibZXp85lrjBnik+JjhN8p5dGGHDcE7StNw0tI3rED4lETcgc8wvPNJ1EZxxDv/1x+SwrW+cJfQa3BZgr2bSX/Y6rtGvtXsV58fLBB/8yV4hFp//NVH6Pd+SgDQ6L/Hht5mbGD+6oJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130335; c=relaxed/simple;
	bh=4RtJ3X9urLWVHamPANXERFdnBs08cDu+q9rF8QaPqJg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jQd5/VNPQO7PbCn4xtiYos4upIoo+sT5s/U8fR8W9eILCui2G86nq6nD3VoGyuKRPKtNrnSAEMTzRD5afxmMXR3iPbCt2VLV7wShXG3Eq++pXCHY3VKbCQg5ZhTAaeeAgdhw76iDhFMPI5QyDbtg3yA49Yw57Zl73OiTvs1bmhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VY3Uv9Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHBGwzhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VY3Uv9Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHBGwzhH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328dAVg1249516
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y5+v4Zjh95FklFgUEdPfXc
	2Y9wfc9QEHDJMzJQm9dmk=; b=VY3Uv9Wymapg/G+K2IVYsU9anyyvptSLK7qz1M
	NaL2N8ZIbsmTueS+6iSYDmLkhT5hZ6FoeeqkD2JWXSyHlC3Fg7mU9rejFgLC4/JQ
	v4TUEOaXTzXgs5dOBvjbocMs4LXB6O1YQXikC+B77Nmn89olin9OYryqThcehdgg
	HvJ0Z1fmLO/w3uRbk3EXORwXfl4cBJhTMdISzDR9fB+p+uLsPikb/3ulvP37P8qG
	r2lzAdFVkQMD5B5Jh8YOjtTuivo+ogZzxj/ZaK8eDZy8wIOw0+WP0YBuPRiP3Xib
	nJWOPQnwgqZJqs9JYiIQtznbV5XCyxKW60+N1ZMsNWARCjhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t0qy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:45:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso16785441cf.2
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130325; x=1775735125; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5+v4Zjh95FklFgUEdPfXc2Y9wfc9QEHDJMzJQm9dmk=;
        b=kHBGwzhHng97O1qcI0AyiVTxKmoUVo8fdqEqUGAtDz33giBKuOm5nY5bxj+i1zhPN2
         tdSn5tSk1+S2pcrCnAhUnyAjjw5xf+GRI73zdH/k0paoUjR0Ktjm7K4pvOR1SLSgWNut
         N/URn4vIlS+UnSpfu3V00DhErqwtpTtOcVv/sr1vdylPFGfNb4AJ2r6Q7CfPmyP/81yP
         A+5y2FyqnVgcHYXjseE8pPSm43nqeehqiVneuSb9V9bWrYJUDnV3wsMvY3viuOdyH2YB
         ZOljyuzHp31ZZykBKN7VS2Uh2m5aKiO1QUDVWDKV5ayQ0eAYh9H2ZmX4Inb4U6u04lez
         pmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130325; x=1775735125;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5+v4Zjh95FklFgUEdPfXc2Y9wfc9QEHDJMzJQm9dmk=;
        b=p978oKbSf4NsQsnIWDW5U50ysXNCIk4WRz9EZ9jPZ9HSisuzo/c0ZCt6ouxhLcBmSS
         e9EOii949j4XC2Yj2ziGNnafD8OLyoieZWcIeF8xqt2QKp4quxL5CUOnHr33wAyh2IKn
         kIWHyrsZq6A2OOI2MgTSOMb4PDU+z4bZGx+cxhSnHMdRyJCCcn7xhjmJye8Y/2l+6Y7d
         Q+DodMx9fEIKhHARFmsx28EJbW4jG5RcYedrmnuuZhV0hqCAtmrLldCU8QdKSb6D9RTz
         tTOLI3pb49wKIb7KzKcwlSa5nI+3gqxnCj3nx5dm4Hthq0ZUZEgqEjvKgVc7/DRfBIwu
         PXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmToGPyZi/msQP6cFYL+CwhTWIkB9VTMY9Xp17q2cxjHYjAYBTdCW2a++DaRW5SC5ST56+1C240+I3@vger.kernel.org
X-Gm-Message-State: AOJu0YwtOFRmNUgNu5JJN22ZQdcFd/Mv3Rys/gyquanBMfDvlYFpUR7K
	FHLB2cJVycvfOy8YEBh6vrv3p8FKO5m8lutG2Tgphtt8MSkv3Ef4WVLPc4Dy0brAKHcBE97HeHV
	Q5Mfuyqzt1WQeI6LG8rOswPvWijpYBUDgUSgUZ/iJXHER+vEkPeJpU/cruoNz3KEH
X-Gm-Gg: ATEYQzzDXSGqh8ZVgCxwHhElOq0S7lN4MOACRBM9JtWA8yecCwKdGTsZgAwVgm5dk/b
	FvfzE7k2akGMYBqUd9NlB8m0ha2ymykkjCqPaRGyPCWh+WXsc8nhFpVXwIBzbiMz1bBocXb+xO3
	7VWsX0jYbgvRHGEDTXvkOFBVO/G3SquReh9mrJZVCV5Zjrmm9XA54+lI14loVnG7NnG3R8YmLSk
	FG2SIcoJlO8hecG0cSxXbFjPAsEbjMgCyEzMcHRWRIGBKPJ6gO0Ljr5MmRvcw0l40NAb07441OF
	0x2F/c+aNzvO1V37G9z48A8b+2SIsaf7hgb/EgE5E06sFcwriuhzyN6lTK9iS9VkCl4wVSjIqfl
	zvT/94oOkHszWkrItPob3zvxlOKv9IQ==
X-Received: by 2002:a05:622a:9d7:20b0:509:1dc8:e9e6 with SMTP id d75a77b69052e-50d4ba33ffemr33804721cf.29.1775130324906;
        Thu, 02 Apr 2026 04:45:24 -0700 (PDT)
X-Received: by 2002:a05:622a:9d7:20b0:509:1dc8:e9e6 with SMTP id d75a77b69052e-50d4ba33ffemr33804351cf.29.1775130324469;
        Thu, 02 Apr 2026 04:45:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/7] qcom: display / dts: Few corrections of address
 spaces.
Date: Thu, 02 Apr 2026 13:45:11 +0200
Message-Id: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdWzmkC/yXMQQ6CMBBA0auQWTtJpzHFcBXjAtsBhyBgpxoI4
 e5UWL7F/ysoR2GFqlgh8k9UxiGDLgX4Vz20jBKywRrrzNVYDEnx48c3BtGprxeM3CoSBUc3cky
 lhdxOkRuZj+/9cVq/z459+s9g23bLsLYFeQAAAA==
X-Change-ID: 20260402-dts-qcom-display-regs-11d61816e172
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4RtJ3X9urLWVHamPANXERFdnBs08cDu+q9rF8QaPqJg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbJXXW+K6dditLlEMovL9DdkbYs3z2C01oPp
 WeCIOPxPESJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WyQAKCRDBN2bmhouD
 1zotD/sGZigVnivjw7TmGHtsengJ6zxMrySAYKWLRwprUUV965Sky1jj910WMb0Lg+VpsTVPNMv
 ulRb1hDT0VZ/4fiX76b+5DX0EMVOJI8HGu8PnGl2yhXK6yc/p4jCguctwovS5lOR68APakxHyRU
 6G5KXH0N/TKogzOe6IV4EOmKKXYd0XQmE0dUHFQ81F9XPgr1wklYuH1WclBjq9+prMIWdajeZW8
 xoUgXfSp0Jd4YN6EvvgRxTuDa2k78EdTHfpK9i6xHDG2IYCs3BI8z+cNwJMPIzJhz7tqoLRrO8N
 vMv0wkfsprhJEIwZwjJnzuffp0M6zwTXiwvrkgImSC5GVMC5XFjxgVBeaivryaLYd7XVIXqNIH5
 bkLUYobAgf6ORS5RoeIbnMaNzQpsf8hWtIT9CPtAY2wy/CvdTm2ij7NpOzE5kMisZAYT+qWcsYX
 yNyduI4FDfXkCVX7HZDMY5C2Na3LK1SNU8lmUmRPQHi/rmrgXclcKXny2U2zprZhx4UCo6x1E85
 9aulgzjSc/rSjH8cezL2BkAle6jJBxinJ6NrjLDT96sIepmSJuzG4vz3GecgNRn5lyuIB5VbqrY
 IoyBQ67gjS6i1zKNQQqa4uxoalqX6bCRXaMWI4IKMhkQ5HRERivuAAceX+fPXWmJlcRZvlMn0Vs
 E3Gfk4290VnP6FA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Cl0XgUlLQSEl86rFaslTC-SHrIgDPrpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX/I8m72K+dtxP
 m3ZyhwuvL9pra22o760Iy4v5Qa1dWUPyPRKvQY+lf8/ixBSARkqsNoi40mz2qCMwrOhBz0snsiz
 mR4K8dQr2QzDNS7pt4CAA9ZRhUDa25y1EwE6wG6mRhW2+viWj0Euvg54teW0cWFddZTb/PfHBu7
 PRISIZl18EtFA7Qf4AQ0yOvRiHYxH/UvzFN4X/0i0XxFHQZ+2Tuth2pnPQFJsvzKyhX9glfxRQL
 Wb+Z/V7bZaF/zNYChrXlmmtk7vKaAC19L1WHB+JOZYrgRajcSp5QeDZvHV2eM3lhkFU3YBz3Ohp
 yUP60lICDRZP+BtlqT00WXTvqVDlT0tFvjTTjy+csi7W4pv2LDnd8yPWirNnvlTZTpNVDVIni0m
 vjj51GJo0s83TXHWQNwQxz0JxLuZtOil3srN92Lm9VSLfokTytxubxwcylExRNdsTPzP65UYpSs
 Pcn3NtZBjTHAQbUi3mw==
X-Proofpoint-GUID: Cl0XgUlLQSEl86rFaslTC-SHrIgDPrpP
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce56d5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8PK1uE_par-WY5z1x_4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020105

These do not have practical impact currently, but make hardware
description correct.

Patchset can go via separate trees, but DTS should wait for bindings to
avoid new dtbs_check warnings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dt-bindings: display/msm: dp-controller: Correct SM8650 IO range
      dt-bindings: display/msm: dp-controller: Allow DAI on SM8650
      dt-bindings: display/msm: sm8650: Correct VBIF range in example
      dt-bindings: display/msm: qcom,sm8750-mdss: Correct DPU and DP ranges in example
      arm64: dts: qcom: sm8650: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct DPU VBIF address space size

 .../bindings/display/msm/dp-controller.yaml          | 20 +++++++++++++++++++-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml        |  2 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml       |  2 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml       | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 14 +++++++++-----
 arch/arm64/boot/dts/qcom/sm8750.dtsi                 | 16 ++++++++++------
 6 files changed, 50 insertions(+), 20 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260402-dts-qcom-display-regs-11d61816e172

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

