Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576A35CB87
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909480; cv=none; b=Bpct70s7VF39mJdajs8yz4DN/J0XEVwYcUvtAYEWwmLz292xcUrDvmdlJzF2c1PJs+lvonI0fiK7kRyB6rlB6mbGF2dlK0RvKAXlXHA+qEOyhoPudCrH5M69u2gO6PDQ2BuxcT6hARZNM/4ZLQn5r4P6mC684IHa4mLPRp2zuls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909480; c=relaxed/simple;
	bh=ItKhX2Lojt9KIazo72U3GJYoHblfjFW2x10W7iSKuEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6JoPiB5joHypwKHOUPy5tqr56tLrn1VECHWelvEvWqwvwXJLhvU5PmnxpWzNyrmDxNDc1V8KX92BDSYxHQK7fzQlJ9zxJaqXbXHPwjX5VTYi+dEdaIjvRlp99fya7FQfqbPjBB+OAoeIDrzajAaonLQLTbI/8qB7hlT8i4j0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkJdHlqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+dB2ipz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkJdHlqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+dB2ipz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B44I1a623960
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKa6xeChRoaH9uw0NWPjegEQauJVOAFpyTvUBF7c83g=; b=XkJdHlqyqNNNVJ0T
	JjR2ex2NYnd8z67RD/PBTYWlKq7fTF4gQvBIchCi2R5y4HILTn/+PVPKSI9+8YI/
	N6jHuKaxydlsG4+vMcLwyYKAGt7aB0C/yHWs+nOySWnD+lS03xr8vX937RjJkdbm
	LX7k2QxbGmIFJrMr78lMoCWM5/wzTcXx1KYWN1/4gl/q9p19fy6wgq82u9D+mBAB
	HD7sT5CyRawMil5ynPmjAkx4ynxInHCYEiR9zUkxhYOtg/GgxyKytYKa/srkhW6X
	Srvxi2Vxe2VXzMosqtfCa3Apq2h2GLmR219tv8Mczj/a9BbiwvoSJsT1L97unfip
	H2gDFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrnbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d68dbb77bso19115521cf.2
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909477; x=1776514277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKa6xeChRoaH9uw0NWPjegEQauJVOAFpyTvUBF7c83g=;
        b=f+dB2ipziBorQBM2XXQZEspUk/A9nwvO0yi3frn3cSvr39ZChFtCoPbBv27oxv5QPe
         4eQ3D6tQpb/mR7VTUO0PmXZLE27h5Nzj8ki28s8uH+eeeXqc56fdzy5KSDaYB5mULv3f
         HusEb9cNVj5ctpflQjrDpucfbPke6YvKsx471afRo/rUTrPZxvMa64oYAQfM4UXTGpxz
         E1cgEeX4cXX7wy3ltMXUx5HIo8Qv9gAcuSZtm7Uzp0/eQC7eJzro0awmRUUqMD2zRHw+
         s8EwGhbd4R7cD2QNrNxN11aag7I5eBXm3kTKkkhMdf1LWFq86S3mOQVRKnCOTyLnLXvv
         WdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909477; x=1776514277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RKa6xeChRoaH9uw0NWPjegEQauJVOAFpyTvUBF7c83g=;
        b=h8xDfs62dEJwXE6/9CI6CYTA6vlbvZ6x86NW90AfmxOFjtr65b7TUw0XJQDvkru+GZ
         d/OZOjs1Gz2dj68W5L8wRGrALPX1BRiO5FuFnbus/KZmFE/vgu7F+rFVAuda7XJ1++fe
         A6vWXf1T9eDmhlTSVpDqw68Ph+RWKhrQCTlDV2kMjtSg0UqBByjYYA1zmmkB8Pu7VF6k
         HCa5ntMIJdP0GsyeGY8Pqbcz9I9oy9eAxYneOXBLjKxy23nImBJICG09Ip3lAYXI4iwu
         j9Skqa1c4f1EoVGZ20tsOWinHM5M3sw8rSmi5SFyMPzL/Qa6hoMrj4+dRB3naei7AfaC
         DD1A==
X-Forwarded-Encrypted: i=1; AJvYcCVrro8EMSdIa7Q+GGv2wWl5y6oBvxkhmg+2U1/UOogNwPZ9srUH19Slb23K8BpqcZal1aZCYl2Pk5be@vger.kernel.org
X-Gm-Message-State: AOJu0YyASqB11QaK/W7dI0o9oCJo0eHrtAAF1B10vdjh6uIZCB/JYcCf
	Fzxhh8iwJAWLoKr+Liel7fhWegvRvud/h2ruTxc1mHgobjyY6J0SquWx30OexEU+pMIjszbgSSt
	OGGA17yBrekrpahr9HCTDJoE/BUXtYusFK+wD3W7R0xj1dYStxuBSA3U0rGnrwVeZ
X-Gm-Gg: AeBDieuxU7RqGkhAXE01EIP+9geMHqm8mksCGt3qJ1s+IkZ0G0aV5nDgV8L0YneGNYz
	D0kxJh5d23oFzJf7DrIfyBTV/ArzQGnE9qxHO9IqAtN0ld58diGJtgD8629ew2CVdesqvoUrJVA
	5+i9KlNZxQOKPczXTY9cje3IgevT/s1dPTu4l1FkosUjVyPVvFre5ZQ5j/9R4I2QS/8BQMZLogF
	hksXsOrrRLFUr573mJel4HmNmIUDMX0UB+IzR9J69TE3wT4CuzwVi66W/TKcGXGJsdPHdcubV3O
	sGkAqLff+LuRWXCWF6WAm9gK39r+jRSOHsgv8NXNSUR3NaRpYKBuFnpHt28BrBzbyHDuio6miqN
	wh1MxqxIqEGsh9K9BwbVzQvqvQ/+0vANgzpKIxRN/wvTu28o4LNGq+0q/NsYQEBwkDa/zx3+shh
	/9lkCPTG/gwy2OaDWuyEzRMxmPNISgRrbD2VA=
X-Received: by 2002:a05:622a:550d:b0:50b:2876:586 with SMTP id d75a77b69052e-50dd5ad112emr103796391cf.5.1775909477115;
        Sat, 11 Apr 2026 05:11:17 -0700 (PDT)
X-Received: by 2002:a05:622a:550d:b0:50b:2876:586 with SMTP id d75a77b69052e-50dd5ad112emr103795881cf.5.1775909476721;
        Sat, 11 Apr 2026 05:11:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:33 +0300
Subject: [PATCH v2 13/21] drm/panel: jadard-jd9365da-h3: set
 prepare_prev_first
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-13-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ItKhX2Lojt9KIazo72U3GJYoHblfjFW2x10W7iSKuEo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpGwlOUdLdYTrG2qMsikq5j9EIHjvVUbb/Zc
 qntYLYJwhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RgAKCRCLPIo+Aiko
 1fm2B/kBk92iEqPsVJKR2/4lISThQL19zM68HkY3kSGFyWIo5pCnoRR2gmnIWYWgNjpV6lysCFI
 3gsLs2S2qhux43Cn2EoLEJp05js6ZYHqmGWXqnzpW04Y7GKfFhy8UHLsV4LTwxqdCCvxCjywl5S
 ha8NsuuYsDO3oDDIhXiQnKzEGPeTi1qThFHMG+9Bkzp21X0SaFvwkOwpIAWa0d3RMdZFTMUqm5k
 cV4a7v7eV74HJpLF/tSQGvKwl89sSemOm3tvkMP0in1PalkmpFC29Xarx8mNq9JUK72YuFGEsvQ
 PCWfmPdMRKH7dShTRjzuE3I4GN7mjMh9hRsHsStPodxzWa1k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SkYd0Jn-Kt2DqWUwFW5sqKqDIObOHzb0
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da3a65 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ic6V0yA_i5s2A4o5CdYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SkYd0Jn-Kt2DqWUwFW5sqKqDIObOHzb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX9a2IjzirYMb8
 ZW7OjxV7vsoCWhkKu8u3KIGOKCc07bT806rkVAU1nLJW2evaswPAV8aWsDNh4LTLCjqAcVCsNJ3
 l+q/fLoUl38qL4HTKVFGDbJ0EnYK+gbWgs4NLNKyn0D/DfbR/HD1JLCBnfy1UwMsQVSfqe9olOp
 1CVQA3vwFPy1M3L2+KndLFFrxKszHLXHg12JyUwRcv1jYVTLLMzMiTzBeRpnZJ3X+Z/1sE3iJmG
 /To4eUk7eZokODPgKEffpFqjuasHsRld//iU+EHwzmjqoBGREjD9goBxvoIiqnt+ZzzxYsrXtJR
 MVX7fuhc3WCh/+qYWlecH2uYGEEZW/wBCfCR/TjfExpQTio6K+YtM1RU2/w2LyGUBtCBei/IFue
 18n92DhcXRz2iJNkri9v5VpXS5/Qm7/VxiKDrWZDoD/68iNVbEK5lUwaFEybLfsck2dSMbfSE4L
 cTGeYLwKEM5/mLavszQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5d9db2e1f28f..11b7e07c1af8 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1652,6 +1652,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	jadard->panel.prepare_prev_first = true;
+
 	drm_panel_add(&jadard->panel);
 
 	mipi_dsi_set_drvdata(dsi, jadard);

-- 
2.47.3

