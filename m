Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA453403F5
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 23:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780961816; cv=none; b=pZ9Ty/ong5gbBz2wYErr2F/oGIH+cDhvxU4/ZdAlEsRLPVNcXtgCqzCpLyI1v5CnwJ7pWFAct5kPM87ZQLxb02q1smG1A3fIOoWG15HM0qZUAiBeTns4YPLm5jbpOnnOTyzfiR2a1bJTFH6SyCW+oKDe0jp2NS0YAj9gGs+AYCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780961816; c=relaxed/simple;
	bh=2NmZWaJbIB33VnT9ZsYiOup4YkK+p77o9Tr+gBsdYRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j7WzkeLKxWMfxKAESiKkVXKevMnp+dDlKeEXNMQYOWpcms+Mt/PixaNlyN72c60gg/eNM1lODlb1h4oDwyLcw/E/uSeHkt/lw/OxUGcj66oKc7yvJetvLuJymLBWTe7EFy+dF2zzyU2s1joPkUYpazhXFb9XY8RO+xtXiWHhBvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfe1Wp4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIaDo+Ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfe1Wp4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIaDo+Ma"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658NDbeq445135
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 23:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZYk44gZi0gQL9cYyDZb0Pr
	aSrIqM6bq6tOD+CvfB8fg=; b=dfe1Wp4+8YJo75IuupNucxzuE/twbtpGtsnDUs
	D2Wuw4ncj7zES6qNewC4xFlum8ix4jk3lLiKnvxsvx47jYfE/0JSoQivnu41Wj6m
	eTETIjbRVp/4b3daTc6rzvUf2nk6fMnq5FrpMGT32HBkBwpkxbsUynmcYCGErCtS
	OKxt8YAb2pGbk1h7u6DAO0d8ozkC073oone6OxBMgvc7U98rPH8fUFzCuBWude9O
	rxJWKCtbrR+iNCR683gEy9EZZWZdpGgEdoMksZanpcFgfeVDVEI9ujxI7g2zpowg
	Q2YzrTPyoA+wWLA8q1XBTtHPvo8pJirAldqxUtr1wMOht+6Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun43e42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:36:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so50309465ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780961812; x=1781566612; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYk44gZi0gQL9cYyDZb0PraSrIqM6bq6tOD+CvfB8fg=;
        b=IIaDo+MakmeBQAmd8VulDJxlpvUNhPbVJ4LawvqaZx/UI2EA2U5sUQCGnu68qDjhhb
         SDfSEBec6dN0TAfBEuroIqWcwIVk2+YLAsRtcNXf2y49hycchdw6zq+3Srat55CXc6oj
         6Iw27V7OWSe4knUhkP5hLM2bosKi2aJoqL/GKY7Xft5sJF1We/br4NjWPIbsDHad/oxM
         Ur/Xz3igBhiSm+1NQOZKj0ycAkNr+RON5LGFS58YPEaol5OhOif2GZzGg6g0u3HTXXmb
         RbvJgMZNsUOkisMQRG2oEwcvDFBZ6UUiQLCy9jcFC6OrIKBZCNUyX0cDCph/22CVIli/
         kEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961812; x=1781566612;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYk44gZi0gQL9cYyDZb0PraSrIqM6bq6tOD+CvfB8fg=;
        b=Fo67HMKQhjezuSJsVfgCtuYqGCL581kbLmiNkifCIP0Lw/+8elGsvLfa+0Kdme1Tok
         OT1kxFSqR8fB1PftAEUVF0Z0zOTROxaAb1EmjldQQr6spA/A5bDbsuakPefTZeJS0/qG
         08Uv/Izjvn2qounQKtxeUJv7/fKwCNYGJuw91whH3bNaa9VZ/zMa3hoNu282JqfIlvKS
         av1FCBEUa64rlLEugS53T85etzdQ+D96lGV6HuXJJduV1EIc1upnex7yhuoPqvRN0kFG
         scO/12N9ohkQNPDplEGW989gPgvJyCDtmx+PAwzIMDp7EwCehdrkPaUQ7Q3a0E1zkn6u
         xBsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9S/C4FvEJJU8iPOa3A9wjKulRAs1JW5W8pGFqc04mLiSVBl45uDXVELpXtPgBokrtKStc2GLHibZFG@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjzIMx3+WR0CpR7q3PiaBcRsVkMBOZMohgo9difWeN2oC0Q2j
	rDOGwKaKoXrwr4EsdxmsNJky1X77yIdBM0yF0zc0g7mjKwjViRjAPyHlfXThfVpxV58xrzAWBrJ
	X1PVg4aNayN0wtWlqQMIOVzy1h9rWTwwNSL8saYrhXRN1WMb9MEACulQpr8RRlmU3
X-Gm-Gg: Acq92OEmpuh4k1Up6uQUHW040JN8+dR8Bl9N19HV0rUOiVM3sIc+J6jNrLnpWmraZ3I
	v8P679pzcx7xOwbKKrFFgIHnWXwNf92hMhHSwiAugvWgTnAR7jeIbJ0MhKPAeAWvAA5GVUAAbcg
	0n8n7IDue+mUQlPgw/aICrpnviS5Lfc8duvwufbd9DN71nAxJEjXVc6uxL+6Qc1pGYfs/8ZI6VD
	M+1uo+gUTLnKBG/nAyHx8Cpc7hRR6+3qlDWG6IVbnRaNUmwmYzHd+nqeV5KxQA/Mv1uXBX9/jvy
	iLV9oxN6EKwRFhX0YiSXnGuterXBxKJBo33v938KdSAd79lB+/LVa87OXiiFk2irxL5tfVruvpb
	YBiYZM6mUoiPs/2Q5gtWdVoXcMmLJzen9a6Mwgbs/ws0pD8TFFQMzus09
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr205752175ad.25.1780961812381;
        Mon, 08 Jun 2026 16:36:52 -0700 (PDT)
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr205751785ad.25.1780961811867;
        Mon, 08 Jun 2026 16:36:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm66206975ad.42.2026.06.08.16.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:36:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm: Add support for Shikra GPU (A704)
Date: Tue, 09 Jun 2026 05:06:28 +0530
Message-Id: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxRJ2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNL3eKMzOyiRN30glJdUxNjo6SU1MQ0gzRzJaCGgqLUtMwKsGHRsbW
 1AFdqybpcAAAA
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780961805; l=965;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2NmZWaJbIB33VnT9ZsYiOup4YkK+p77o9Tr+gBsdYRc=;
 b=1/B6F5tMzl92zsNhiGGCcyT+PvRqnKjT3hrSSl1IsdYCfywRdpbiG9Ou5ujtqqz5AfLz3whCe
 dVeU+IN6Pb5AyXEJI+69OE/qZSUsuy5BHUFC+4CQEAQKnJo+q1QlFPB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIxNyBTYWx0ZWRfX/hucTMS/pATd
 ou3ORc/rAZlSq8eho/jw5Z2FFBxcMrFc+0WXGI0t8RAYuD42LD8n8yrYA9NX9EB0ruqHL8eHIsi
 EPgr9T0IVHTbCM9zaDXcFtzal8w1cYIIe0YzdN69e/8op2tHcb+LX/MrCEbKOsVqeTw/ouDs0MN
 J8OLaZH1nUGB+/yoWiYnWw4slrDZEA1o3JgghdTOCziEG9IXEmeqEmoZfmeLw0MKgu6emaUD04T
 N4tj0Kb3hDX9Q6zIShrzbae9aKcxUhfThxqqkSxpvm8Mh5vA5KC9Ri7j74O92rrdkWeAMk35ooa
 B0PTeo+c1pACOpUA0wxBqGuo835Wn8OwjZ5x342MdqRcdNRnCZon9K5D5IzSMVdxvY5SwhLx+83
 YC2H3MHdo1U9MVLFP+0dtmARTHwOxQH83ggRVs/9SLixb2ThWdwibWwr4a1cPQOXxp4upbjGL1Y
 rY/B7jSnD1CudCszeTg==
X-Proofpoint-ORIG-GUID: U20naGUey5W-K4tDEZsleVgkiJfR-HrY
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a275215 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=bc7Rx1KwavqhM_SNCYcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: U20naGUey5W-K4tDEZsleVgkiJfR-HrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080217

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

The dependencies for the devicetree patches are still on the mailing
lists. So I will send that separately.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Aditya Sherawat (2):
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      drm/msm/adreno: Add support for A704 GPU

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260609-shikra-gpu-5432bdeaf0f7

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

