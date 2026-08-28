Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C7470135
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925938; cv=none; b=KqNwXlXjvchIdVOjSzEtpV6JCJqzgyc/98/hdAeG8Xwrrs7MsS7+lJPSMh31lDN3cWNWacLVQYvW0QC0NMLivXpEVrgI+JRsqeXBxQhRfBUlHdt2QIbOmeTpSRPHCAwhbPCo2wMUpYu2ls8yDvt2zXdR4jds8mswQJf5jtiElkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925938; c=relaxed/simple;
	bh=tW0/V98WOWAWLqVlgzVwKvZe5FLR97Vr/8EkD1Pe00U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFk26z0bzQo8xDC/B2SK9ruWtxtSeqmHfba9hAD2LLccDEJJ2LsSpD5RK4SygjV281HqpQObfhBy4BCiSVOI3IC1usPKeZyzlYOYCo+JtNStv5fqSbFdL1P9eYAdh21D6wDzPoLzfjFa6046tCcg1Y/1O+MpVDeiN70oYEyHYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEykGVwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axWKx8Sp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEykGVwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axWKx8Sp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkgcZ3790343
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=; b=lEykGVwzCrMDFdeb
	9e+QDLAcIZ2XB7THfDrgjzLic1KuB4Lz6y2gR+ZXQ4RPwS0x6qbaNYL5rZTIfYMz
	j10wOar/678L1YAwliMD2yDQmxixLCvu/4SsB8tifv3MszctofHUVMQcYb1twJNc
	Eun6mwsep4wEJvzvFZH9r7DruoazC2p4161cRML5mSHW1o4uzF8vsRVmBfUppO6z
	1zToiG2xEpn3SZtegZBG3mvoGEN/uXCizrqgQcQzDhV211VHui2YBioaRC/oHGSf
	01TsOUHj0lWEOJd6G0eQhz1OWzqNrqbZDCDOqxHdsFC8ReESkkGjsKYs0b6L4kbS
	gRibDw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9wdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785c40b6318so625584137.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925935; x=1788530735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=;
        b=axWKx8Sp0pUWNyMJ3595ZkfajjWdK913Ig5bh3efdelYpa0Ze7SoLsTpC2Y+5xYiKf
         whJTBXECZ261x1DeZdfhCkgwBmKWkj+pkphCC52zmby+6w0s+gQ/8LY3u+KNhlSPG0+g
         Lmxk6juZHPNJr56AuBvWpq6gs1KWY8f3ZzaZgDhGUsBfi8B/1kFQB/luEF9SjwVw/6en
         FRJkvjZf7uCQRCumofEOYXCFi0t4cQCtj1atfNlRZ6aslE8kDUmVDaGray1NKZG4uYm5
         XPUWlcVp9CQu67IBCCBYHmpTFKut4Y8w9L7Slqa+8D69pSBywrW1Lk3V0w+P5hh3vjRx
         buBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925935; x=1788530735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=;
        b=NDH8HNp/gIIeX5vWjwcwIRdHxYyWDtw89eHEzR1g7w/gsEGzj2V+ktrfwPRNXLQ1aN
         1H5SudlzUmWqjwHeUkosUq5AK3k0Hpf2V+pNZiYSxidn+9hvhe2VopG4TJrRgJSoVksM
         GVMd1R5OCayK5yzesbejIHLKVMc7q0LXmpWA7ZniA1m74RdvfeOu8KiioQjo/elCH2DD
         8EjiHyS/shYO6l2JNUvoX0okzXwTB5JKPciQLL7IjyDjH/xmggAbZnqsgFvj40Qmlc9v
         4+0c0HRFRzFVd6PTdSq9qnFulPZVKkCrp/NPrAifA1ayNHQzBIEb3YVl8dwrlPf+3VMc
         uoJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqprlrEPSJFCresPzIDg1afbq7LFmStmG9nS10NkPm/hkRuWr9K2ppiTWYBIKl7ssK/eXMyW+Lari8n@vger.kernel.org
X-Gm-Message-State: AFuF++kDYE1QUyIvr5zypQdpBCZ6u1xusor/6hVq0Mnc5p/mDwgWiigH
	wcADDxmYoPxYfF3G66CT+ReKhcaa+jit+Sjh3VQJUfo7NY91zHsjteTKBIG84Z4FE4P0Nh35jY4
	79qI9PDSGrJ6Crbu4GSgK9xYUgaD38BVPSEm48vU8oX6LR3EH7nCLxisSLzY6EgFu
X-Gm-Gg: AR+sD12IbadBqcvykQBnnp2hvOYajZe5dcQr1uVQnkZnsJ1PmW2SMRmUypQVApV58Xi
	CaX8Xp/yc+s4QlQS4X9hHvbLniPy22W+GgEXwiB9Eap6y8PnDBdQyhNO3PhwXGxHq86jHnvUCxK
	58P/OEf97gDzqSA6EZPB50VlLU3osfr0Bw92hk4hu/9G9YF54wVBI4hwtgmxi+lUXuyArzz350P
	Fm5Cm7EhTK91FIxoLjS9SywjumGCio0PigcHUUkYUVLQV040SD0p7KddLiq4s5Le2aatK/VHj50
	adUc+994WFNS9fcvjFQKsR61woEn9UI1ivqCer2knE5pXI+qDVSyrd5kza02f52/7oF2NyvnJtE
	oMlE3L2Gt9hIcIl5gwxJmmVA=
X-Received: by 2002:a05:6102:2acf:b0:778:f972:32eb with SMTP id ada2fe7eead31-7859996dba0mr2598006137.12.1787925935067;
        Fri, 28 Aug 2026 07:05:35 -0700 (PDT)
X-Received: by 2002:a05:6102:2acf:b0:778:f972:32eb with SMTP id ada2fe7eead31-7859996dba0mr2597945137.12.1787925934482;
        Fri, 28 Aug 2026 07:05:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:01 +0200
Subject: [PATCH RFC/DO NOT MERGE 03/12] drm/msm/dsi: Fix indentation of if
 block in dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tW0/V98WOWAWLqVlgzVwKvZe5FLR97Vr/8EkD1Pe00U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWaCzqQTDLhYUd+TYlb9MS+fCMLIHN5sEpaO
 KPln5AS7zCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmgAKCRDBN2bmhouD
 16g9D/96CCnowO5YVeDTuX8794l+rCeRdeqVNKtfJ7zwdrh5WdJ1dnaBPBMQSnm/x/fVpcxwCYu
 arC0rbwF5A7wOmGm7T67qpA8GmNSqNulzSXmCVkSor9+y83n6waSu80HeiJy+iOntdvUy5hLmbO
 mjarJYL+eEfSYcMiZhIWtpuhYjg0diCrLSbHgFm1UQWm73y1MkDp/S5DsGL7C3ktzxnuZQYO2Z8
 R4tRxhdMzWCwB7HwMlV9tT6kM/Db+SG9OIj1ArPRfVso5lfCZ2sZ0ZsN8TVqxb7w4X2E2P/fBo6
 4aRTdoh22A0wJ8AxWOspRf9PxjJUiARGPpbZwUNK+T4VP0elnJpLhFtaNYdN3rbGVHA1YtLujYt
 0oAeXdDz2BNXUcoot5nAnzMSAFYgqWrXS8Hq/CyCx/hqugWNkaeSUC0epfc3iODek6SsXRzVCI7
 4cxwygFxa/SACEtV+HF+3HeeY7StL0m1q226kw/Nyzn+Ff1iYSsoH0+IORPJPH55JXT6wrHPle6
 +vxcw7ZqLXBglLtY4iBj7vKRtmfgnzmehfxap7F5BFLHv5/EO9s2pGT4faG16ueVDYg5Vi1RvZj
 SGKY58PDV4XrKY1s/2y0e8+1Dtb9hyNA+QGRx+e9DmbOKA7c3OZvRX4v8bjJPdQo5TVQvX+dAfF
 pNB23JQaNvDBvLA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2pCpPUMqfVzW_RoY_q-nN4O8i8mnDzrn
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a9195b0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 2pCpPUMqfVzW_RoY_q-nN4O8i8mnDzrn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX1EkTbNrHkEA/
 R0V3H48rG1bCiY+6EAPVUOsXoHtpC6DKchgmdH4guOPgMD8jsFlRkjVOsQr8VX/tywZyfoZi0Ba
 Zibn32OhinONm/loCbstBpMFf9LQzOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX1x9m2jg/nrzj
 fimNgOUqrAkixfNeMFevckHJlh5yjkbbnjK3psymXQKYylZqFp/I4UHtekoaRM50WlPySpla7Wm
 8OgCYjffT7ceoADpKNtwt7c30Chyf3lkncxEsrujd+lTRNYkUUzYGsHTXgKNhT9mPczP4BNoo+y
 a1llAc5low0nETla/anQcVECTSkke5ncQVORK8TkVRZkxBV6vK4VIRTD8SIh8XJuTBaEjU2kGH8
 TgP5Qb9D0WSlUuleaiDaEjWpq5oQu4HywpDth7nlWUikEQWD5uFUVFOWihxAl7SujAhlRp4IZzS
 GjCZZuxhpiPZqq0ucVuqk9IQy6fZmQ1/VLZjvyZLrg4+NI0q7HzCC6Ipyz6FIs7P7YYpNzrz1I3
 NBa964g6by9QXtxCnRn41C8bljlo60RYXbZ4wPApzd5gl2gzj7zbkaZTn8HtTHpScebzJipTi9T
 jWJLmTUPul1uBF0ODFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Correct confusing indentation within else {} block in
dsi_mgr_bridge_mode_valid().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..531d4ff78f56 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -429,7 +429,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
 	} else {
-			return MODE_ERROR;
+		return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);

-- 
2.53.0

