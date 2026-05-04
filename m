Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568AD3E3DBD
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914458; cv=none; b=KigdJnxsTaNm4rGfMTqtpC/l+DEPLl2BEMBcwbWij+/goNJlC/7eraUdYTlNhiYTAuDLjo/xo03BpUjH3NS2glwCV3iavnZTluU/H3mExYHBzo19agsNU98xFQkGK69wE8wQhS3aAufr1G/ZGChhsNR/QfH2dgy/2ySdRsBuVk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914458; c=relaxed/simple;
	bh=yxHmbdqK6WosmDlIEl5iYYf9WS8+dTPFUUD0mndZ3hU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rAPtlrfiOCJYyQyQ/AbzpwMoh6f7evPVr9OUVfUIEz2hm0SO+mU3sMQfuYtOHRVnH7AjfPWUBepf6tbFJNs8zf0MTcILIGQeZSxWj3Ef2V83R/Ga39wTD5YH5CVE0aqtCGouhyiHCd5KNGpCWRyAUfvoC0zu+JLOyh+z441kRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1CT7o9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCOhXcay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1CT7o9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCOhXcay"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B46Gi635993
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 17:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p7kKiQDi7BN
	iaDBqw45od1LCjR64md1hECtCsCF+nm8=; b=D1CT7o9aglKqFyuFwXuMjIEz7K7
	VOuq4iuN80hIiJ01mHV8rSdOvjAzqfYTj1Y/3fMOpdHDlkQfcCVjcfS9Zv/TJED2
	OpJd7SSuUxy9BWMNJVg91z6sxOSKNQ60SlTZOROO1cIf1gGHnIkNaO5YPCQNBLjM
	XaWguC3Bbh34xu5/BERjgS4P6IFbQPyPozkuxxzlOFUkTQt+evZphtslXdBdE+CI
	xwjkQRacO0dKTokEBGPIADC8oh9O8A8DImUjZiw+ye2an8Yf31o/wA2iwhFLOj0N
	/B+JmXnDMEj+5o8Csgy1YUgbJYP48jdQvX9URJ9nKjRhOsY5FJpfzFmSmSA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx499td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 17:07:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7985752be1so1529155a12.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914455; x=1778519255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7kKiQDi7BNiaDBqw45od1LCjR64md1hECtCsCF+nm8=;
        b=iCOhXcay2k6INhCfSp3tIUGmBle7ejEHgFVqnpP0DVnWnDTTCAqVWCkfMsOpdhBC5x
         UC5EvMVF22fsAiHDWwea8ADDypHmIkOVi+Cced6iWPt9R1NlxquHQWbobxZyyCkKTzGQ
         Gw18j01UaLuEBwz+c77XKjGdvHFMlntV509F7t+u9A0Y+l3azV5Q5Yp4yqsvZ+qk9itF
         YMMlz3UpDdXAQvaxr9strvd3DYOcrOtUl6M5CW49UA4GqOl69JFUC0MkmDGiTUwOPEBJ
         +GI1cIDGXAMRrr/mcV7nlBZaSqnz5En9ozfeMOoiizz7O+Inh2mI6CIll2LT4ot0ZoT2
         XPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914455; x=1778519255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7kKiQDi7BNiaDBqw45od1LCjR64md1hECtCsCF+nm8=;
        b=UZYIEhAR3chGQ+NFRnVUYlwCAvQ3xsiMFCq6j8VAVnVhIANC9g0jdQfaBE7AqO5byP
         CgNaIx70kDfb8H1RC4x/g6WChp4tbzIcTa2h7vmMixH98NWjKzK5AmOIXUDuRUt0S9Gj
         iyYlNtl/yUxZKBnWWNS/gw96Ql32OgEifrr13Y/ncnra45KJNYbre86he2g1c/CaAgOz
         O/gIC/VumLTBeHnVbXsvMlWabH8SaIoF/uhrr/sDpFXR/AEs6VXmqfLu4dUSuxtixpkI
         UmAcHw/b8pDEejILRqLbcb9fgAYwJXgiHSHpvHFH/6GjKMm0FE3iIvShXHSVBtb4DYs7
         TdQw==
X-Forwarded-Encrypted: i=1; AFNElJ8IAeqiyJ5owgxYu5BTi50pH6ytZ3ytMWyjz9mhUdoWJXi+3rrmPylg7uyQnTruec6dgobsfY9vli9h@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxP51Ot6YGW8Z4orXERU7G0FAs9zTlqpqEosTgVoGcqk65pXM
	BWx7QLKryW7UIUp9Ck44Xc3NOHrUMZWSbZNnZ5HA3znszUEWVuEkC9GM7bIxaa6WLLDm6M5Bf0d
	EtqlSjJaK+T4hsyVal2RhCFLFQNp/rVXE5nzECra5q7Fva6wsFNnHaTlWHJamPB8y
X-Gm-Gg: AeBDieth1rLL9R5QHyfi7G2QAwOzD+bpMm8hp8fYMbL5OklVxcus4esZd0aHt7EhJDo
	YESwMU7f8rG85IZnlPkxqllpNeeh0B/L4bWlrGyDrNbyOAuteNh81bjoB+p2f//w5d+nD5ZEubd
	PldqsCaO7yNaAPg8DVeFca61pfr7eH9BBepzYm28PRYLgNAL0uFUZrmtIFdAoRU5haaycJpPJj2
	EWc3dGyxEx/oiOgzOnTneLNtRLMqRCA9/8Zdo59+cSCZOFNmWNKYEM5HkiN8OW64XoOTIVIsjFj
	rW0SScUZbP1R3D9m1C8FZdWk5JR8j/GT76K5CIWAi9X+M1vVI63MirnmvryRNk+B08kyVo7ItVl
	FxIGYsYil3UorLtXtxKYgKpf2OqXM/8BzMl6+k1NstPfZUOXDW3TVHK3gI6cskU0yk6Dq067gi9
	0sLIEFPfjIuEkihM7qMDm4bZPf4w==
X-Received: by 2002:a17:90b:510b:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-3650cd08149mr11462702a91.6.1777914454995;
        Mon, 04 May 2026 10:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:35f:b46e:e329 with SMTP id 98e67ed59e1d1-3650cd08149mr11462665a91.6.1777914454469;
        Mon, 04 May 2026 10:07:34 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:33 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 4/4] phy: qcom: qmp-usbc: Add qmp configuration for Shikra
Date: Mon,  4 May 2026 22:36:59 +0530
Message-Id: <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfXxGxEyXijM1nc
 H7SeZOwoJgsERIt+WKp8dMqfg+nOHKIjiSCjP572seHi4xChAJHivM/tcwZkc+4ViKjGS9Y7gaX
 9JZvoRzmaZxwJKkYHtWXD+L7Vk3DbojotZ/eLFgw53Og+XgflPmj90F4DEOobFWf3vnhBjxgz+T
 zIIAkJoWKGSmIE7M6o0NY7J1SswAstMNc3lSpuVjlLS+VGaKbWWF2u+lYEsDDaw9XpsoFqLdTE+
 gj05lPwyxNySvhfrPDG83TklgyeFG483zvKofwrPJYluwPgugcJz9B9xV5L3EUiSF1laOdh7h8G
 s093hDE9c+4o0cme9av8Bl1jIqWV9tkOY7MmxaPkKkYFKqmB2UtOPWLnje5dncj5QOo8S+8AYL2
 sKhjTXYCh5AtXBAJQj7QoLomCtetHeD3IdnqCUiGiZ2stxMzD5AqENlcYvR/nVf2sIn8By0eL7x
 nUPB5K6ZAE7sarhHzrA==
X-Proofpoint-ORIG-GUID: nF7LWpqhLu5A9RW9Gp8CQM_ZQueswFNG
X-Proofpoint-GUID: nF7LWpqhLu5A9RW9Gp8CQM_ZQueswFNG
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8d258 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=K8LLhCEcKGHaonpVBxsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156

Add init sequence and phy configuration for the Super Speed port
on Shikra SoC.

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

