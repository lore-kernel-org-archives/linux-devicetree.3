Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736DF39D6E8
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851470; cv=none; b=KLUHDg964cFNH/8WR3YriknLuoNeOj1eUG1xbclqKMiokm5ab55dyPgx/NHHHPLp+qpD09vyfaw+vUbB9kSD99DvNwD+Ptry43+kC6lwMvqLftgBAWjtDifpTzMRKLo1GCtNw7tCe52rQU47SXORsxa3k7a/Gt5yCZn0WtC3r7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851470; c=relaxed/simple;
	bh=DVXNSz/QqITCQAR3c9vgiIReGo6sp1REqUL1NIZWtK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQsr1MNouQiG0jsLHPPEI+zkGGr6yLAeB8jWomQZpNCSomG+ZjfUUe2DhfyHtNrj0IQEP+UuAseFT1pAh5OF8gD2QzMzJRPzywHAWgca+kL6JMVSuwGtmT2GzU1N9TCfWNXedH2/Xy2eMXXiM63WXkk+/noIJPxfEzmJvPd9OGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOVR+D3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7OzamKv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOVR+D3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7OzamKv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LlBQ1645936
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=; b=nOVR+D3Xa5S6DRd/
	1KKeE1mxAIPGXaULM90bjkDTDUbgxkoD1yEXL0wk37gs0zdkGEAoJGyIVS0WymQc
	hmK/V/7joRSlL5pOpdf0XjslTgJrvK/CSu+sBFOhYKn20Ubl5opN32dWaqRd+UbG
	t64JIm8tpLVVxc9P3aL5ycaTh+XSlOFprqrIYmpiyxlBYZvOYzgpZ2xHeQe8Wrlp
	/joKRVRy2fN/fcXg19D7A36CRr5fJkH//8yhdb+zGkxCiLMWlwSN8V30CODCBhcl
	FWYzMCs42c7Ratjzm18VRve6iOeDpos+dqdv4mj+Zw/uMRgFLevq+n39R2M/Uxrs
	m6Tbcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvug7pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:11:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903982af1so927704285a.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851466; x=1789456266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=;
        b=S7OzamKvKV5CDYTt4kWeOb8Ie5cg7vQZrU9mMqSX1Wk9lXL3Q9QrI4+5Ay/DygxP6V
         jidXi1T7Tzt9tgB0vUvuJnrMVxCsIBGHlsjige/h3Dxv8G0YcfS/Cl8/JP/OHtIJ3gMO
         dJG4+6aJIvPLSmy+Xoj3SaHqGaRt8/GCyQOP17hh/2GNKoco+iSN22Yuw41zQE2zaCrR
         nBS+vXtIc/cphgDrn5z7Or00sXWhphL9bNrUHD5Xp3teKI0MtUJYXQMksw9T8zWgf/ie
         En+bhnto4shguiUJQ8jyuBjfoE6+Av/EBW9p57QOILD8zpG+4+9to25Edkdxb8k+eVff
         lmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851466; x=1789456266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=;
        b=bPhszi4D3YDWAk/12/3NJbWsSutjlcD+OLiY9tztjFPAHv0lySvT7l4jF1gs7WqnOk
         f+6EhdQeMoKb/TAGjb86k9oX18OMMboZWcJXSeYoK9lS9WRu5AA4z8NNHS+IH5l3HAnX
         SdLc7jZGOYNTjNGjsBJqrEiv/gixpV+v7K3rD4VmtFQKJbJwO1tIzswpb7wtYL85MRcs
         zHG5RXjX3e3MOgi5UUU2LWLq7NgxNW7J0TRsO9zj/bbvFzPDFIxo+YOKE8HIiylRiep0
         bQoRQuonSA8snM6Ugm3J1BBkHAEPZ25kOkOAAQeXpwO9gXFCJLl6cP2hyYh/Mu7GzTwe
         yavw==
X-Forwarded-Encrypted: i=1; AKwUvBzsXsJcucjHnEndib9yqpbmK+xc+cZt4HwdjSAWMZ79d3N2nYu/Ey9Gd3oJFidSFpZu1hBnmOfQBvr1@vger.kernel.org
X-Gm-Message-State: AFuF++ni8FD/RnhBsI1r03aeJbVFLKM7e8AyFZ1vyrdfm4ABlskrQf7j
	DF5Z6Ag+KGSUfLDElZgzittsGY7XMBIPPQGAimFSZx3ne5jg7yZlZFo+a+gs5QTcIksyJ7Mdbm9
	shpUdiArihI8YjtycvLyA8oq/JJn5TTPnhGxeVoMK1DnBYXJRfAEEnzUpzacLF6ko
X-Gm-Gg: AYBFou2eqGERGKKGrsNQ1p6qcQ4QWodp6t+iIkKfEe52F9ho6x+YGZejifN2/gx4M/d
	ST8FKtMqOBOoOpzXXhcf785/GvhWa8p1jrrOX5tEKlg6mNSJTDjjzvRjUjYCoK2QQDNXEpoCzib
	kZ1jK9mBEe/JXQ4H6GEkINHQyiX+VpvARu/BHrVZThMOi9+8NiqpHpZglJwj9I6MaE0gGeB/4Ru
	rYFRNeQXYU5a+gRdjP/z7wuqKyckCU8+IfrBHZZN65Ihcn1Se1G4F21FDk9mgwV8iTILykgonC4
	EwGe02esbhtTtn3RaSxFwbi+sWRJunQrJnnpWMKx7W7DZQJ17DQs6MvA191O2Vgxzc8hcYPFS28
	TEjdPV2e5/XcXn3RCePGC/kQ=
X-Received: by 2002:a05:620a:1a06:b0:932:fcb4:4d0b with SMTP id af79cd13be357-939806da006mr2798141685a.24.1788851466259;
        Tue, 08 Sep 2026 00:11:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:932:fcb4:4d0b with SMTP id af79cd13be357-939806da006mr2798137885a.24.1788851465895;
        Tue, 08 Sep 2026 00:11:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:44 +0200
Subject: [PATCH v3 4/7] drm/msm/hdmi_bridge: Drop redundant initialization
 in msm_hdmi_bridge_init()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-4-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
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
 bh=DVXNSz/QqITCQAR3c9vgiIReGo6sp1REqUL1NIZWtK4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T6ccwdo8OoNNuiJLkAwQshlOHv5IiHfaTkw
 avBRqliwh2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0+gAKCRDBN2bmhouD
 1yBND/4q44Xvc48hMxu1pda3s+T5mew5AFxVcvM0Vnhayn/pLc/O3Br0Ly/OcFOuJebwixVWGk4
 tXe06Yq8vc6IB9NNzOZJS1mAhYdpECWPENX4auSJ3R6quDLguKJUNNsduorlxRQRJ4Xj4GnBNRK
 OlkzZqTCEy9TY7HrbZ9jCRawrXhczzP1E86LNgV7hzXmTbydYHkYpZce+CXDgaEhoLsgexnT3Qx
 rNsufGslZHQhaX/mlfuutiCkcYj7mz0BRpVLu+BlFKMp4p8eractYTD4jkaUsUtkt5lUrszwdP8
 Y9bckC/HX5zPbpepFNoyWjPAnR0jDGsGWS7Ey9Q5OqpbpQPLDDH4+lQMlEEKiCdIaXYY3AAJdjJ
 XT7Uu5Y7TnMeUtMJGniF9J3lyCP6ShkwHJbxpchJueFdIG4JRTgwk/c/5bdoR1XdG8Kj7NGR+DG
 odpCkiZLllzBdcAFbMtmjHLLOkDkSRszbSw1c9USEwVOOWPKHiDstrrcwVM4t5QEYYNGQ3Y8EK/
 YoClYAQACSCPEsv2u+pfAYhE8MJJSuFXsN1At847Xk1vH3/BKfg8tznJuX2FZmrRXhW48Vk4pAj
 9XxyQs/YNWh54LNI8aGgUEtT/gEQr3z5XfEd5iPSwX5DuasRf/5SxuUIuECa1uFhhzf9OZIROCb
 kcxfrWQx4C86GIQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fb50b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RZP3y24nY_lDZDhlvS4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QOyWm61_RCSU-ZgFEQTeNMuArh93-A5L
X-Proofpoint-ORIG-GUID: QOyWm61_RCSU-ZgFEQTeNMuArh93-A5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX2WkIJH2kkkWv
 6ZGetn8tX92LV55HrTpBVbfVpcvlNcqQLRFrOX5fcSLoeHyQXX1xDg6+AmjntV7YtCNx5stuEAP
 6w7Ai7zzZePai40FHhodZAgTwXfPL+YahdSvW1jDrgXD926DyT/UqLAIoWcPxWAs3H3pEnnLw5J
 NEmNRYuVybllMe7AwauTUlsICI+yZw0nE0m7s/dYQ0I0QpzM6RSr5NIQHIODNJsTB09y+gPpjjd
 yK87gFu4TmGac/CGdN5Lu79EkPb+gxHJLW6BJRnalZ8AA8nbNNBQXWUZ3n9cICYvLCnhw42EFmM
 J7tSuMY7gpUBAACuU1vdTtGHZ8Cj3yJhgwsrrp1kR0DwuqIYcR/WEMlSEb1NonK/SL3caZAmTaQ
 zQMUshJ/xEn09MSIR/3pl2qt7fjBxDaHsYTyQYzrYddUo5xjS4jVSIJFBheq7ProjFjwB1s5U7p
 Qfn4uxsf1w4yGQbUY7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX36Pjh9gq0Tok
 OX+X0V15uII9jpLUxpxy0/+wvRJftenp2GelRC7SwMSt4p4vwfkwmGiVQME28np9byl2dp/tEcj
 //HKOuuM0cok0cpTBbHpyu0cp8DeEHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
the function, before any first use, thus explicit NULL initialization is
not necessary.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1860605850c9..49587927e8a5 100644
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

