Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFE24E534C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733140; cv=none; b=J44vHOJ9a5W/GrWe9XGkXn55zzLkT+S/+mPQn9zlq5ySSFXbBaeKSqs8G+CeANKoaukWJErJyrKNZ1mVPODh4oIawBjg4u8x+OPBfAbEYpu/czHlDb8auq29q2uvr0u2G1+alnFXmVE3Ytl04iI5oqxIVUQ1o+W+FUQ8OO1nA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733140; c=relaxed/simple;
	bh=yrWESk565CiF7pWVu3f4zAmz8lqipJBbQUa+EmPfuek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zn8Z/n5Eb3VD7TraehAwmfGP90mN8G4BtHDCqr9LnH/T4a2xviGM5dxkQI9p9AT6/DTcF2tPsJPkPoxpv5JlnPDyDcEmpYgjC9HIIi5BL+51t5FwAq3KPTydntoDjqWudlufLcpm1eoD7ddDC3wMQ/ZK3JdYoGsmNcUwPsHsWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXM5dF/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLQX+l9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXM5dF/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLQX+l9o"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dVda3916159
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPVi9Zw6kD0
	/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=; b=DXM5dF/hKObvtEbd3gN/IjgjB/q
	03wp7Ww3S3HvzhYfSpM4SW9P7aGAZm2dYvRS63vtJiCvLgGxdq4Wnow0tvBFn57Y
	wsKvT4/oGgC/JJ9ctDe0oHzIwGJD0ExF9Gy4uDif65spp8GaZWcSIwAiRm/wnlcI
	/4vJH/hfbc6Bkbr8MnMseU7A6UloMOKNznjHlrYUcafI3aOXMzn+lMahCkoZRHu4
	vu95U4frlU5n09V6YdJuBAIvUuYCWJhxH7ojsMAUHT8/CGOQ+ZVfVfpBAqZMqlrb
	UCr7pNO2mzhkb1Dq/wDgzH8CS4X/r5OvYHe9XaJJWQG9NO+mooBvAuR+nBA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdu1eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7b0f8e40bso676430e0c.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733136; x=1790337936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPVi9Zw6kD0/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=;
        b=DLQX+l9ofv21FD9+A2dTXIV252RBaCCmoyfCR/XfUmQtw6vQcsT3encf8IqnlRneWB
         e98LIF5uuIv784rd70+MLds7skJZzPc5lHtbMD9MvQwFquWECTzfB5hc+mUpNGGrJQJu
         DQHw5zU9J1Xo2ehCKEw/Qm142EW0lwbgka94iUniINdkoAwWYU1tbjs/rWXRyXKLaZoH
         jYsiPcB1CW8GBKJR3RKTMcHAact7Lm1XG+DCi65uo86WW8ULAhtECNnZ+TJBedGQ3Aex
         dMymbOXkxNw+EWGNVR++oqCTnAccqf7SilMrJkEAGljRi9jENp1BE0IT+bAML26vvi/N
         rWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733136; x=1790337936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPVi9Zw6kD0/7aVTfZRS8pZ7kqHzCb2nAl0SG1FLnUA=;
        b=hGVVaDO2FsgEWCTQ+rqdqqC7wRMMnYrZsAlVY1db6ksfxBiBHnx23Joa/7wdtl7nly
         sabvia0PUOWIQlXzxNA+JZabY4JRpTa3YFTdkINcEnBIjaTCkbi0ZgQrF5DhDHgRVesj
         Z7wb4bh5Gj5xyha9/yAjNctDFno3NeebOdskpShkgV81DuxLqD/cyYVrcvwrtvotV4tS
         VMSVE6t/xuqLrk2LmiOOn+VTri9mfLp91PYkgzCNKwAyE/29WeFClnpTBUtitaof5DkO
         z0U9BGji428joadDyxUjBLeM3YfL/7+ju+Pis/fvH+1qAyC5xJK8EmKVtbamx8KBVTgE
         53Ug==
X-Forwarded-Encrypted: i=1; AKwUvBw7hSJ0+ZjTtLxn3OqFL20nOsu5XNDTedBvUH7wgm2OY44wfKlYLCkbU1GaElSET9zJwV4j+r2a9qRq@vger.kernel.org
X-Gm-Message-State: AFuF++lHOFVG/3lua4C2MeSBa0EieIkNy2mJ8Sn2ilFAtDoKcdCaGA6l
	8vD6dCfnj0G8GPZg3xcntDBKHnIVL2esHaWkLvkRDz7pHnYbJR40Nkt6uzUK0vRS1cygUgW5RSe
	bZeZb3lXJhIYz+NGpzyVDoZ8BcuBLyxDnbDbZG/D/5t0mRfhNcGf2o9Ewi0XTDPhY
X-Gm-Gg: AYBFou0ldcGw9XD0e2c9cOhw/qNFQBI69ZGUIq/D+tEgGTma/Uzhv2I+lTJtCZjJoJp
	pviOVd7Ha5O9L9+Kh1Q5ZjG2TE7uyzF+BIsNjIFci+JwIFSgSkQlu0voBXFXnIDRbCRXYzun1MA
	RkunZgOGP4pTHdSlyntSnUctpLlrkK3RQqS2Ao+6IwqJ9phHVO3DUXWsDkXwEpbg3dlf7cqmqqb
	xF6NvAXEU01CzuGWPWIRPuwC6j8r51d1fY5SOqGDpghGABmNmCvE0xZD2hn7XxCYoXmc5OHpS1s
	5zivJNd41fueQHVvKI6V87wp9cSqujY8Hj59/VNB+dIkAjcFFiFYxZsJvuCnjvKarxFi2U8RdCE
	cjXovHgm7H2bCDQ==
X-Received: by 2002:a05:6122:1d08:b0:5c9:a60b:e5ac with SMTP id 71dfb90a1353d-5c9b59a397amr1048063e0c.14.1789733136212;
        Fri, 18 Sep 2026 05:05:36 -0700 (PDT)
X-Received: by 2002:a05:6122:1d08:b0:5c9:a60b:e5ac with SMTP id 71dfb90a1353d-5c9b59a397amr1048035e0c.14.1789733135738;
        Fri, 18 Sep 2026 05:05:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
Date: Fri, 18 Sep 2026 13:05:14 +0100
Message-ID: <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX8m0BY81+3y1v
 Je/d1Bfc+Rh0ISyVqsLzD819iZYwsD1no5aGKJ4ETgWkTFBe/zbR2YidNeeD+H6EZbB6TSxsDR+
 +7d+lmrlKmT7GbykbritfHc517omIGI2a9Kp70j+df8bXeo/HWtJyQ4ZqV2NxKO71NWq0M+K8uP
 xd0rYEIsU0zlI9mM8tbRe/dd1/6jpQG9gwThHELFOikReylwxXWUtuzATz9O4p8YFXdmEtJjbHe
 iUWxdRMmacFPEJ8kMWM7Q5056NUh6GThOGdFPbxab/DkTkZhRgpsFDHHW+0Iq7JzOXcTfN0WKyv
 bykAG9xocMUapyZS4AKB6iEszjM07vLVIC7GKd+uJbEE2U3GySY0/9FY/qTyTm3VJnzr9qXOEpl
 OtT9jGtqmtTLlqQZfK+vDpkoYosu9P+3ZO6b/2vB6rFkU1XwZqJynl5+S24U/Cw/bH5Q3pLnCjD
 goZ9Nd2xTH9d7ybYpqg==
X-Proofpoint-ORIG-GUID: Cp1VNj-9YJ0M1owDj6nEuRV0jjBe-lLt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX1x9z2Vu82E0/
 kmng9InvC4ugKCmSuWaysHtVdLSohm1Gkemk92qesDD4SUQf2AZCxeDB9/uT9E5zYr1JYuQqkVX
 iasqW3IB+nP1qXef7pVZ8YArZrVpgGY=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad2911 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=z2L8r4mWo7kigEPKVCUA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: Cp1VNj-9YJ0M1owDj6nEuRV0jjBe-lLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180170

14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
The panel identifies as CSW 0x1465 over eDP AUX and is not in
edp_panels[] today, so probe falls back to conservative timings.

EDID, read over the panel's DP AUX DDC bus:

  00 ff ff ff ff ff ff 00 0e 77 65 14 00 00 00 00
  00 23 01 04 a5 1e 13 78 07 37 3a a3 55 4d 9c 25
  0c 50 55 00 00 00 01 01 01 01 01 01 01 01 01 01
  01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
  66 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 3c 4a
  4a 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
  53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
  00 4d 4e 45 30 30 37 51 42 31 2d 31 0a 20 01 6a

  70 20 79 02 00 20 00 0c 40 8b f6 65 14 00 00 00
  00 00 19 00 21 00 1d c8 0b 5d 07 80 07 b0 04 00
  3d 7a 54 cc 94 99 66 52 0f 02 35 54 00 80 00 80
  00 80 12 78 26 00 09 02 00 00 00 00 00 01 00 00
  22 00 14 0f 5a 02 05 7f 07 9f 00 2f 00 1f 00 af
  04 22 00 05 00 05 00 81 00 15 74 1a 00 00 03 51
  1e 3c 00 00 00 00 00 00 3c 00 00 00 00 8d 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 90

  Manufacturer: CSW
  Model: 0x1465
  Made in: 2025
  Display Product Name: 'MNE007QB1-1'
  ASCII String: 'CSOT T3'
  DTD 1: 1920x1200 60.006199 Hz 16:10 (302 mm x 189 mm)

Datasheet was not available, so timings are not datasheet-derived.
The delay_200_500_e50 preset matches the sibling CSOT MNE007QB/QS
entries already in the file.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index b66751df502c..29f250e6e64d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2141,6 +2141,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x144b, &delay_200_500_e80, "MNE001BS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE007QS5-2"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1465, &delay_200_500_e50, "MNE007QB1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE007QB2-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100, "MNE007QB3-1"),
-- 
2.53.0

