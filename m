Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9243F7A9E
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654783; cv=none; b=uDYVytirQZEygIgXKNs+7Z6nrkvXhV13M+79AdDulqfVBSqvPcDynSFWf+SYGH7Qxk/eIMj6V3fjMkjpsiKfDx/qHjrICxlsncw3Pl1+Xw2noWrGxhrx26osiLuDlkiwXWQdMrerLoY8YkLap/3EJdzn1rTQW2vSl1JrYw3AUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654783; c=relaxed/simple;
	bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7D8+c/o8s3NpXrbtx67OeLRy6JlEGwaKXOrxmVXE8Vkysplm4/bH6fmBw+LsOG4Eez2M//Gokw7JpOhqMECs2VLM5nqbi8LG0V2il0QPHLBvx1wiN8kqAnvWFbnaE7oduVOP9fzG8wNiP/LkxyZlSKryeQ51Ww2T8Khnse50Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZEblcQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo8NPbMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZEblcQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo8NPbMf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6557u5xA1957510
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=oZEblcQNWqkqEQSh
	X9TIIJWFvrr3+sTd4bHurOifca7MU9O632Yhg6hpI9JFjGCAO0Gvdczd949cun+i
	aYnuOpuOIK3uokao1T5xNXKdQBcnRdLS04S5kRzkrxlI206IdjlfXxiOj1eX9xcB
	0QBU3D5B3mDyEfMxcdaePg3Aq4P3w0WPjeFt805S49fdFmdTzhCWSHULO8W3nhNc
	3GqqXIyK2bjO4DBzVw7gDH5b5Hr1+ooPRL+GH6E6aEgqSGR1bvt69lIaghpoqj6i
	NKFqDsjklb4T+GBRRGY0cl6/lXtqZ8cxUaPXQ++VN+fndJqaoWZSLHhwA86XeXVI
	K5Ud/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckpv519-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 10:19:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf160f7191so10623345ad.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654780; x=1781259580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=Eo8NPbMfPDXm928afiDOpy2vDVMRj8gdHnNyOP0l/L0AX1c+9cfZVpByT91iDfL1/5
         FYX3Hk5XwUR3ff6Oofj2ernF+I7scOn+JfAqYZYcGQjdvknsl6Hze6ytSQ3kjFv9lprQ
         5cspYquSBdoNzEAC7z45CSWAPi6JUKKyhuk2IQMyjQ3OpnVRkAkmSfZMc8aT78HaqVg9
         XP0qHmp+4Bd3fyxhllUop/K/Ecayn7c0wESJsVeoV6KEVWWDAawgVv0xVFSqrlh7mw+F
         vMpSa4I8QqvByWjh6QsKLeUGnutrIUqrlTqXE8ceMa3d5MSA0X25upe3Q7GRLvZKduXp
         t6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654780; x=1781259580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=CxBY0QTwdf2d/heCQlRESNdxlypxcvH5MFUOlCr0boWoDgyBAj6GMghPj29jInbYqf
         RaL3/phvvUJzzYmRo7Ro9xSXFqpuLNY3RQb1m555Y5WdoHuUguUjvNJTNmQp8B2ZOaOt
         tBSfC55sCAOh8fcQaCL5hPNDDlDM5fJJ7ta8IXU4lo+8dH55uk6mwEmbiOSCGVvOUTr3
         L8xr3LcGc7872+AsgLFr5Aru0XSm7k5gwtlLWKrKNzPVNJ321lumhObqzteTwIOUMw6+
         5jq9u28LmXBthOYeFXf38eyGDg/L2yFWOSgiahnBFZzJz/AMYCqrZMYr1PpMdXv8htaA
         nglw==
X-Forwarded-Encrypted: i=1; AFNElJ8bZSNOfyaUVzGq4LMdpvfIwTe0QWCVkL0Meo2ms3PV8P3+L2x8G2xGn3AVQfB2Z8EdaUYxNXjvXDwF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Ix7BLfvPtrCmUB08YLfXJ9mTR6+k/Z9Q/RT7YGm6+X2x+mNQ
	Q2Yb7Grq0rbLsdYfLoKes/izs/rHinJOy4NpWQRDKTNeMvspac4xKpcWv+5f0JOhWIoLhJZK0uS
	KtwN11Ym3aA0iHQa1FmUHfu2dPVHwJaOjXe0TwhZlELKpvkYlxwi3WYTLHBs3RFi8
X-Gm-Gg: Acq92OHecrf7I+9v4irYpe8FtAhYmxQEdi3f2WacT4sL+G+vF40QTrmPlCp2Ngj6PJN
	G4igGbmQ+/gr2Y/zHYGKz2woo8bvC5tRenlgpMi//T7/eMrDozQuVZRTxMTu0pLYWVsL53bzh/3
	b0F7c/IbpZdxm4PSajzM0JpNACM7cns7DdOyqAzBxKpDGyAjDsjlfWQrz4bW+yz/edFgULkdxBc
	T+QP5LbbaWX2nIOwonGXiS63fzYKDN32FUQIUbbRZhmiIPG7sX88YDUX3EX8+aspRclQFMzfegO
	uJyUhX5G5HkvSSqz8+KwM1g1jXl3CpfugosAPqZ1EKaZxLkQ2Gs2sCTmUSU3SZPAKzuofo3bJ8E
	dGiOQLcKD2y3vTQ13qHutIztFf2H0JduyUwejt1tThdaY/s/VkCUulsRRt2k=
X-Received: by 2002:a17:903:2c08:b0:2c0:bb11:19c8 with SMTP id d9443c01a7336-2c1e820db02mr32151765ad.36.1780654780036;
        Fri, 05 Jun 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a17:903:2c08:b0:2c0:bb11:19c8 with SMTP id d9443c01a7336-2c1e820db02mr32151295ad.36.1780654779579;
        Fri, 05 Jun 2026 03:19:39 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:39 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:53 +0530
Subject: [PATCH v3 3/3] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-3-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=1072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
 b=7rX2EC8uhcDt/DiMdC/pz/WYl5oqxXXseJ2Vos332fRcblOHX5myBQRMg8/MPOkIQQLugj07+
 GhyQMIiwGzaBxX3jfm0F9vACJHj7WKL6YaYot4dhEnVPhF2JXqDCa4V
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: BwTqdLguIiuZzoGfsU1ji4ZtyBvmA7Ba
X-Proofpoint-ORIG-GUID: BwTqdLguIiuZzoGfsU1ji4ZtyBvmA7Ba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX7yL+BOhnKQhK
 X2+FHU2LGoZSWm6TSWAM0lfZJhTrMzVaj8IDB//N+EhdYJjEaovkb47kPcU5vb2GJ//tM6mW5Yz
 oJh9B3MqzoK94gRIwAwJ76tIoMI/VIub5dyGLRop2hYYwh/JutUiWRHo5Dpf8+jHWEJxImBIC+P
 QYbgRjGi/sfGi0hijPC7b2bqGLHOMb95gkf8Uv/hAYNoaR82oRu4ey/P9Hw+UUUtmBnKY1eS6EO
 6A+j7DAPwdWrppGdAHH8/1F9onbNJNKsZofZo/p11RiIRmEZdrJbsZF5HFQbvige2oo/iqRju/E
 shAEdOg9mXHDMNqStknuyFyQEsodNNOlUqHTDvfZifeu+D5gX1BQtuUYztoBBHoopUgSZPjYFly
 jTS6A90cOaQviHTerVJxBhiBHBrR5TpIBp1XxIyXuYPHYEcStxD3vZKG9xi/n2RAsxQ+bM2D27o
 7IFFHE484pZmVPymWWg==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a22a2bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XuKMx7f3ltwE3Y0lsuMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050099

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1

