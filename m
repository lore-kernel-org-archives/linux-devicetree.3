Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8664D90C6
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786058; cv=none; b=OmaMoxeFSkM2/0ZTKRtq3ED/BJUwbABN2qJfRyH5s0wHBx/QeRlOhHiWyt2NM46/o0k3iQX+qV3HqcSJ0hzv5FRN9MlchmEepoh17H7Wg2lALh8wjxW87AkXLDI+9szavvCfq+RKZJQTuqsdph/EO0NPJCMas2rAjB1wTMHHxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786058; c=relaxed/simple;
	bh=lpPbeM6c8VvIV5J0fpRx6DMejGRPAycCbF+JSHgz2Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlXJe9jfaVtlXDvUX5Qw0yxiqHUjuwwaOGpz6hu1HTdR8HuCLg81fTAAEc1fYbqHQXFPSTe88l+LeAbCuR4bmYOyk6VRInURDzo6bWro2jLoRxYtCKuFu54qVU2NdQvhEpXkvx1hJ++n118XZPBSiVZLGNsZey5j/hGTXvKGsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUZdxr7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGr77XLW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUZdxr7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGr77XLW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnMXK3777241
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOCrMECTJmCrKwJs/AjWGhAhZLHRv6vQjyZ6M+guQ54=; b=XUZdxr7mZFNkNTFP
	sTtyHTKLw8amstQ/qeGkdGX4+b77Tm9hJ3Sz5K83eyFhOUkL8OfloU1cbZ7I1JXl
	9Y+gvlE3GnVNxTD0fWEzKNKFgnQMRvHAGDD2MLj9gqwjc8g+/DLAYcujXeJECs/I
	gGX+sDe0+ZzOk4F5Ke2khBAHhuwjmntx6quy2SgdPrTR0MoSTA8AyXUImFuiHRDZ
	F6aeobqnC7r9n57K56IluFmUbL82yHF/xdgpiZoITwtwLcIFCsrOhdDjy5thQNjM
	P9N7oHaDMO96AvT1haLipN67lUtSf43qiy7pWMmGYu0v2v/jSjQGwO0bWNjvNovG
	U4oARQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyh5n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:00:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97ca6578487so2732415241.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786041; x=1789390841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOCrMECTJmCrKwJs/AjWGhAhZLHRv6vQjyZ6M+guQ54=;
        b=cGr77XLW812185t5R5ZHKyS10PYYecps7qi33ArZsKlxeZNu9upKkW/KSQQeqZN3j+
         0Znym+ygYDEgNCisfXPfENuY0LDkDdjWfx3iZ4ZU8YjaqZIpgwzSuq9QWNUVc5XJQRtt
         arGnliBpqc4lhUUbG/Lg1AnAd4zyK/8Jz9ukPwqGZRnrXTuyaS4ExFf/XjkmP/+RGFNl
         jzPxIFnMzocD2q+0rKWwKkwljXB+6OuVAg6XPKwPC4X7z15h6ct6NZi2pCPKs+PqpDtb
         ij1nJGJyHGRxG/Y47lpQf4o88ohbEmaaudGQU5SR59lCYUMtSUHW05GpjxWekJqlF/9B
         +tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786041; x=1789390841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOCrMECTJmCrKwJs/AjWGhAhZLHRv6vQjyZ6M+guQ54=;
        b=rqhMeBD6y+GVhaKH9h/7OnCjZ4dvD6DJ0NdDRslrrkJ9syvYxpRQqrjjy+dpdpuUF3
         CSalK5xwj8p2+cpLydTckMOG0eI/8LABzAjEeLnWn7UocS+nsWiMLe46Zcwx7TlMWOJN
         LAK9hoYN1xGPKCKRy4JTa7rndzOc+4Vxh5mSXkCl5UDZHMVtXGnklC0SZb62GRf/jM/l
         3cPe1m/Ywv/p336mzXD8KiGRxA2xb4FjbtVbOASvbT0oLyqX2SuaY/OFUB6DqUwdWh03
         kSsFW+P/RCfT3Ux6NeT2ZK2YQS/n2Ui31uakhd4qfyHKLCpacSD74qjfHoOTMOjqd5sD
         YgYw==
X-Forwarded-Encrypted: i=1; AKwUvBwVH4MEOjcWdCHgjaKb9KREI2wKgGg4f40Lmf7B6KsVuZaNuiBDHp58Zvak64jCfgTYhUbAfeHdWJKn@vger.kernel.org
X-Gm-Message-State: AFuF++kZ/B8oaSa2lqV0lGO16MJjiR0y+3aVrvrrlqZLt2kvCj5jr144
	Zo2G89wlqKziaG1uq5JjYvsoEqDqWtAR8phVUf0evJElZb8hO0T9rwqjR4+cUPnaMp48Ed8Awmz
	xue7tHYnVlS+toyQGz4ODKZgeWzZsf5fbbaWquaYvW1MulBRI7tGmcVOru522ncn9wu9DyGJU
X-Gm-Gg: AYBFou34LoZKnrhAv2zK7DcSflk4rFlKEBf9JJgmBupCgVX4FXeH/FvvhkX5cG0y3Zy
	8gfG8BEiPRJ58lbmgM2u+PcWO/bzfY885XS2zj93TZKDcc1kQ/1LZdEIhN11z/il0LhoYGjKKzX
	EjZCAPI0UFtBngGuoG7Ba+FNBqHeN3Nn1AMlBQigUgDetJNA32uEW234sBFcQatCAVQVYF0XifY
	qhFJSAD1vbIwnMd4RcLmO0EXKlJCY9mTcR5lljdsV9vPHA5ss6eauuBGLg7wlaawo8Np+lJpE2T
	lkCJbUO+CS6ECoI7K9kJl7DyiE5WO2bZLMOU4VKBbL7++EBPc2wEpkMih9esAIeDrvtrZojpKkZ
	qPZROOI36+EiOin4IXm+x9O4=
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr9664138137.8.1788786041527;
        Mon, 07 Sep 2026 06:00:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr9664094137.8.1788786041073;
        Mon, 07 Sep 2026 06:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:18 +0200
Subject: [PATCH v2 4/7] drm/msm/hdmi_bridge: Drop redundant initialization
 in msm_hdmi_bridge_init()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-4-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lpPbeM6c8VvIV5J0fpRx6DMejGRPAycCbF+JSHgz2Hw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVmM7LwsR9IfN8orQYy9CM5ColVQFdi2Uxw+
 R1SoJgAFDmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61ZgAKCRDBN2bmhouD
 12GkD/42dhUM3tdTjVHlHyOQ7i4kV0Aan+nz0E+fR4TctoYft9l66IJD9FM+HWeUC89stXt/EIK
 6LpHTvJ+b36jnJGjNf8EHYsqmo1HoKt+khdlrHPyM5lEAzyPD7RynzOdKZsdz1zictBsgCJfjPD
 L+Wf3hSqhX1Fsr9opjEdDkhKyULS/OSKaQ+J55baoZQfoFKXXh2BAkhex+dABVJ7MSx2z+f5OTF
 0IElxMpwoqE1m+LkD54pBbkVnOHlqQrWWNKwDJl411Yq1oyGANl90ZabtI5OxaJcad6hh8u7EDm
 2vCklTdYoFl1zNsYVmBi5r9iLwcN4RRp0ueNuJ/km/BzJbR6Ad1hVMB4NxT3pfUOwBkLsUZRxiC
 ZbAdbqDZ0dpdKB78kUqhSG+xPxtACQxTSr4+oH1vrytIxyKdagXWHziIVUKYpklGFogWF39J048
 AnDV4+gqGjNWa7QHbaYrbNqdQnMghBzumeYKOrZpXQXIVz94wNn48563ddTHz3Pc+eaLRL4TBUn
 4DuWY7tOrno5IQdppx4UWBjkHsVObLKxPcLdnf78QMi3eKvVRjF7kf6ZaPfnbp2AtuxVTeDkBCq
 JGB2CVKzS4Hbk/vDl7kzLY23iJrEEbMpwvegL8yuBMOhXKa9U58zta4Ox0HVw5jv53/epe5b9LF
 qlKdMnieE0dCW3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 4X6u1x7BXFwa-Jps0-sb6l1o2KYghwe9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXwhndvyrqHqkm
 xgaEWuvKeXQCB3i6zXLeHUm1hUmfP48JFDI7fFrer96E0X68Mt1EMVraESM6dVu4D2GBYjNz8tv
 58kX2ztcXw9BiAyz5K2GgRK+pqMI0j2YWfIj3DpX3LxZyeA+6YdSiwbES7yVZ0xvZL0F1M0qgc2
 tX9xe0tHrmsGUXeLlMl0ZmnpF3CIFus99XQ5kgoBHtFjJiTCptCyc3RZvuDLGKsmlTTy3kY3Q8d
 XGAKtbxZK0OwzAn2a4Cyngx3rcDY9hsSh/+hmMDb3axj8Zrwshqu5a7FKHcrBnsU9EpCk+U74TW
 RN1FPYX/wRfkTCYMLaN4W9y2lVvO5/TvJ1NFifJUToruk4JPqsrIOcVMrPxcY9IBIWudPgQNKEL
 C3Sue3L25lxeHHPZUT6h+igJWTT272iNgh7WkxXuVcvhnJ0Eaoq29zKo/HYxjpi7tiVY6JNaQ/d
 BAMG96Rba1nZgs6hVQg==
X-Proofpoint-GUID: 4X6u1x7BXFwa-Jps0-sb6l1o2KYghwe9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX01NklTRpPVr/
 /W3OfMB8YfHI/RJvPBM5cnFWWV31Ksy2IVfdG15PT/5HxsoWaPZ5G7yFvXog9Il+Ixh/69SYwGr
 JvVAjClo8wArQvguQILGxd1RCUPFSn0=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9eb57a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RZP3y24nY_lDZDhlvS4A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
the function, before any first use, thus explicit NULL initialization is
not necessary.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 04c893062dbd..5400edd7507a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -484,7 +484,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 /* initialize bridge */
 int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	struct hdmi_bridge *hdmi_bridge;
 	int ret;
 

-- 
2.53.0

