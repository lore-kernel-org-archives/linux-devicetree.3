Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604FA402B96
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550020; cv=none; b=qEjH+xVN6x49OIrZemqohPY2fw00uP2Pxm792gbYE3X2cVaCtFoXsKilS5Z/KtXdBzyd4DHxBNiWFFdL34WdUl4nQ8LI1qi/KRgyUOKD3uDjLysC+XLlQPQAKloJ2m13Wo8nN1FrzHoIegihm0HLkgJIcaAlZN91P/MNzpPrmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550020; c=relaxed/simple;
	bh=38W4+Mu/PnxQJCbAaMwDoFX3EQQG/JGeECa6z9bYCOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ex+xBjIIpQaEstxDdijjCWnJCioXmvBN+fQZzKoVmAdHz0HysbKm9/e9h71JvnbGMlhDxVOcgaZqWEG+1+kFnxnUrfPTO4dM5IZX2Ess9wIJDF0ZFp/XKydSxXxzqUcbKKyrqlnN5aW8hVCVpFpCOPSNVCQuKqlI0JSkYtG8kNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GC/yondo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuH+Eg80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GC/yondo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuH+Eg80"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UADvNd007933
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ewPdVdGVbSeW7Omov7gTKOsihB0IfbTCUWiSfL4VRZo=; b=GC/yondofWN8U6v/
	D2WK522M1RGZBMQryzQHiq+q2tLJbedDjo7e4Xe6hIC8Vy/nehbIrqqQZ0XeGqAJ
	VThQ67CEzrqCPW5SitZ9os/f3/Iimi7Q92K+OmAFIFgnabwBOacR66U5pD4TrJpR
	pDReb74V0qWem/byDWH1KR3E2xXO/dYsiKgvguSwSRznqLplugA6qZysR9wvYuii
	w93IW6D/De6YXLpixlJed5FkYNf7lxkFpxqH0msa78nQddfsQSRzGtknnsdz2caV
	/EEINOOj+XMgT17o0kXXJIvFxWqTLQucyJ7sCYoR/NIxwOi4xRFmJ5yG6gIYxf57
	z8AIvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54w8fgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6af4bc2so10326615ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777550012; x=1778154812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewPdVdGVbSeW7Omov7gTKOsihB0IfbTCUWiSfL4VRZo=;
        b=ZuH+Eg80Hw5qsS5DUGu1H2bMDp3usHXhFsfJxuGFNBAnI+QbBGXFBsijCGMb9DKT2e
         UXtNAMX+c9acfCTPRrMDYWLNbc4Re55uHXCwgabucbwfai6ePAiM7xjwkJuVbA0cqQyA
         F+AH0W1spWNkmoCdaPCSBvQvwpHFdv4k8/JlzYH/N2fWUO20PZRSAAdTHuM1+MHgz0/u
         ewmbpDqKYetpPF5Akl1X7fRQBP36DdnU+nBkRsdoCSc4pvZDfm3GSzKilI3j0TKuYN6b
         V51BWUy0Dgvt4GF9PFAscm+mRdC13gmtnw7VdmsrAG0RSvsi4kra+o1nTg0Ti4eaNxA5
         KPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550012; x=1778154812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewPdVdGVbSeW7Omov7gTKOsihB0IfbTCUWiSfL4VRZo=;
        b=bgxz+FR91QJFJeS+abPwXHsvD2GGFjheBxN7vLT5MlLxMyRxWpXIf4O/885rm+w+LO
         Bfyj+q5v67H6lf92z9WDEibNFOgtf3mlIm40WZa18JW7ZrY/kZc5xphYi+1U5ab0T2qT
         smfpWDTyjfcSMjly5ZM4u5yEc92zs4x2hL/5T1kLrqQ90IjRyWASlTRKhYOYhWz9dI5v
         Uv4Zs6ZhuYkTT1WjV6SLrcBbxcZdPDF3TaaQVaQDYkBeoNPmKvIYbsS5umTiqyxPYJOm
         ofkwHkPnwgXrKQjP37MfraIznJPUEWR7h7E4XpXNu2PYJp1IFMzcVT7pGj9IzsanX5g8
         eFKg==
X-Forwarded-Encrypted: i=1; AFNElJ80TqFjKg6XhXaKUxoGW1I8W8HOs2cRTKSdIV9KhboK2UFh/2skvtoP9M+DpZVl0qGDFH3jBxNkms+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9HkZXxUZf7eMPmmZUSZhJqJL9FVTRVYVOLIhU2suvzMueYe3
	+JoUflwmBQTUDDkj4rUyJkiNp/gwUctmc6ibfi93XrOJ3qz42+jP/jWYWWCAG1lyPqg6dgfi62A
	OEp7xVXU/txRqbSTd1Ls9eWsgehnosref+FEQV1byGh/O5lYjE5qzVIgIcKKWTC4t
X-Gm-Gg: AeBDiet7Vw+REjBeRiSDwaIt058Huu8qP01qBA/wbp/9R/IqaaX/aq9Aqj992+/wdYp
	s6AnYYmbac4EiBfI9U/Tr6bbjMSrzKvB3BFV5/FLtKF0Q380t6cRo7SjWjI2S9vlNBcLQXXeqAf
	B75zFcKis/DIyvbK1zQKWrMbrwIhJcOzpmY7mHx7rXUysy/NVAwIh7eDl5lgdqPBHFNiWmImIG8
	z584afKTuULA/EDqcgSGursuYGM+hMmM6VK8lr0tGUfcxDC8IY/cHF9QAWp0iJIyzi7435Okare
	eXBeWqu+8ymNjDXAcbB1uiSwoB++fVUcJ40X6GNToDT1molHJ0re7HQNYT8Y+JF7ZNirRYdu8Ii
	xd5DLjlgtuvu0WMfO/+rGr6bGP9HUeWr1RqrV0wAT4786lFE=
X-Received: by 2002:a17:902:7586:b0:2b7:ade8:2407 with SMTP id d9443c01a7336-2b9a24c251fmr20368735ad.19.1777550011992;
        Thu, 30 Apr 2026 04:53:31 -0700 (PDT)
X-Received: by 2002:a17:902:7586:b0:2b7:ade8:2407 with SMTP id d9443c01a7336-2b9a24c251fmr20368345ad.19.1777550011519;
        Thu, 30 Apr 2026 04:53:31 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:30 +0530
Subject: [PATCH 5/5] phy: qcom: qmp-usbc: Add qmp configuration for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-5-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=820;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jQuNrTUKcaPoepDnjAwYPdTKMgqST49w7XDlCVKpo4E=;
 b=MFiwSPcZf5BJh3tr2zD+BrmLT3JEXABs2RnR09rePYO1HIaRBb8SKSbp/zbYg1ZuFm0DUtYZV
 lMvo5NtAzl2BNMnxdzznLq+zP6x8UnkcYfXHX6M7/vKfn5dNNxjQkfo
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: pEl6KjESIGkK6wxp3i_Ndo7yfFryJRFO
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f342bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K8LLhCEcKGHaonpVBxsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: pEl6KjESIGkK6wxp3i_Ndo7yfFryJRFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfX4AAoprYyy2yB
 3WBXGVLP9xwLbiVJ6rjtFpaFQgquyEa7OOljnXu7Yy5bxWa43o7SkzfcllHvshK0kA08FjCqLrb
 7mzfuWfBXYXVj0Rek/sFCAeU7j3HxVO8WVJT6rylrjzBVLuGOtDkEm2Wdp7DBvBr6C4k9REzGzD
 eYcR0zuKr/etBfwxo3K6IlUwn6v+W65KbUSVhWidgH+tPSegtoJQMnMorhAxsMxklX1uejIr98M
 pgk1pn3xI5Zhb++v8mGpa0InqE8sMqpffZoaKyHSrujxfHt/1G44GE4rZ2Vfxz+fyXVyJy8c+hk
 jQIpStswck7hbrMQh+6WlW2Q4GbTZc3nOOJIKMZtNaU3sR/XirZNLUwmo3fFNQZkuVcnBqMs2rP
 OMz6RKApXRxh1zZF7kAbjzbhw+06o8azIxLX9DEZoHIZVY43s/vX+QPvSu0pEp1xviqobnaeGwx
 Sjh/6I7UQZQ4mePzSCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Provide PHY configuration for the USB QMP PHY for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index c342479a3798..400dcebf8222 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-phy",
+		.data = &qcs615_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,

-- 
2.34.1

