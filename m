Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776234E760
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169645; cv=none; b=Ks/dvMvtqQ8s4Nayy3mUWiy5rY3E+GNK3lE5puqYbqOVwk1/B4G6KDUuwEEcXpJeEkFjDF+Zb81dHfNnfLjdQH36sFy+NeefEg2MGRpMM38newholSzOe8vWBTWBkBFj+5KnhJcAUEOzu6asKFmROlcfR7ZEYKn+5q8gHbx4nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169645; c=relaxed/simple;
	bh=LGL4VHxqKITnhSL7axVc8uFn3R+u5JVC+56a547NSCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UN73TSwWhQd5i6X8ytl2jISt8T0wt8XJU3q1WgDHFLZbGcJdzXo69KSeJsQjdireD9i8W5JIu6WurR0GWhhDTrTRHbJ3rKC0odeJckskrGY63zjbJups5/gkGvPPoRZQcT86SVQU/UTT9bQV/++bpptWvx2kP2gM9KSHr/c628E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivDzhSe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+JyzM90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivDzhSe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+JyzM90"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5USrr2438091
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ0NwMyzJUB2GQ7WiRH1btiCyEC/1XQsRKRIRIi2gqw=; b=ivDzhSe2Nl7+MLrD
	QPsmkAixAxCKAGIhTthgVrTiy7Oia7h6wbWrl7zoZ5r0OBs1aMlqFtmxA1YtHxQ9
	HUBWUvpVbfqs5B5tgT/Y+FMXVuVsEAsW9nl83P1DCt5km4Z52s+ziJv1GdxvuP+x
	wvxNW2McNEgoNu8s/JIpGw4e1EUlsZyjEKkTZwX389rHeP5uNetGpvniu2qG4N3j
	w9fPN8f1F7jXmLZP23EgH4VKpNv+ldLfWEbHfbXdmxMKauyt1y2vtitzhoed9IIK
	X/4Qh9AfLs6yBG9BzNm/PT/nWTTF1rlLMNlPmPMjiBeJrjcYyoenDeXDb1/MJq6o
	toQWaQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3a63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so2442553eec.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169643; x=1779774443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZ0NwMyzJUB2GQ7WiRH1btiCyEC/1XQsRKRIRIi2gqw=;
        b=X+JyzM90tdl6aycUxN9DcJOTMMixaDroNA8h/Feg6A55Y2oWp8xY0zZaH9DNCaZmDr
         tVLC9Tgnuk44ZtVjhpP/LFsWmrYO6Rvu4JnIOaDJeguxdgETmBVW1/C+lXyp+c38/oUB
         H60aL/3cE7EC+W3He0lrG+mQrdBFco/k3XQqXD6ZYOZBy37t5z+K1ukw+EXfomWd9+8j
         EbVS7NuLEOUX5lc17d/D7FHGlacGEP9ZO4r8717YZ39hDn8wlCTkm2TgW5w+suCQyoTL
         vGQ/qmfLBRFxUq0z4zrOoGJ2awEhYroQRJzObKJ5U6VU7VmqyWRkOff0g5l711Mwb1FZ
         dAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169643; x=1779774443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZ0NwMyzJUB2GQ7WiRH1btiCyEC/1XQsRKRIRIi2gqw=;
        b=H8PIfm0KJ9cYmrYS8xHcmFYmrJmaOApiChbjuMcculPjh2JnTxA4XnSq6OMKiAACn1
         /C/ep3lCtGn5oc5Y1Gpb9K74pRBsyK/0vvxP4/hK3D4SltAXUFAHusu2pFSyt6FUcraJ
         A5gSeAaKqum0rW3MyWAzCC2/qwM7nV8nA+oJs+XjoZDjRBnGy7OIa2PZ06+sMmMeSaEZ
         ElNnfCcKsPFknJiKoE+fl6eNOmHEiH8Dp6rwdFQZde+CBWRYPrFEBUwM1NIoyECDW5Gw
         ea1jX67rVewWAs8jGqF1XHeyWKR4wM3eYHXWc4q6ojsFkOK8pph/XiiazrYSRmHJf86Z
         8y0w==
X-Forwarded-Encrypted: i=1; AFNElJ9lo9MuUHL0GxHe0IGAbZTu4tKcHIDRCsDhlzfB9ORHlIUXHrhv8rLeKbiWgtaqT2n7uBaN5NNvSRAj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpl5bgcUzRtLo8JP/SNlcRHzH8G0OwkrEfSbILQCPMoWNnwQXf
	rjraJbb0efA2Flqdksp2ryOQpscEoo0RSZDBuUgt0rMgGltP08+YBrCQrQ3CLqp0gxVWDa6j/aP
	nzTTT55WAeczaqC6x96VsRlXaJ+rBNPufNu7hgeYxKBuD+6uSXyEiYSiaBKnNseZd
X-Gm-Gg: Acq92OHDp42P8BglWo5E09fZ9jvn6tFJS7rMPtU6/FLFqT0/RBWQ1N1NtsDYLa0lPNI
	N8XH+d7sUQdfSYF9j7+MtAb7wkeZ/72mkR70J2pdnrOGs6EaBf1Bcz1zVSDZkZjsP5ib8ERcvtc
	CTluSbvngwRgwLKl9feC+1NUkrW2oBodoWHHppeUTCz/ctbmf+S9c6oLUc0HYAR6OiYNpX7T5NA
	ChMKqEjqE+ZLYvDB8r4wArM6mCZY8Udv+/Z+ZiSqZ1Do+niGv+B8jtjOdKcFmPdYHBddPj3EAlY
	AU83wiRqkmsH/IDsKPhIZe9H3875I2nDVf7OxhxcgQl8xFJrUW8dqzzEsT3Y4TWYQTomQGXPxGh
	YVshZWeG/EYGgjK9hnyzXvLwYYyHu3AqwdmDopFw1G5Z8OVBYcpDqg99b68OK8mIo9cUf
X-Received: by 2002:a05:7300:6429:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-30397c321d6mr9406033eec.0.1779169643332;
        Mon, 18 May 2026 22:47:23 -0700 (PDT)
X-Received: by 2002:a05:7300:6429:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-30397c321d6mr9406011eec.0.1779169642830;
        Mon, 18 May 2026 22:47:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:22 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:13 -0700
Subject: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=1262;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=LGL4VHxqKITnhSL7axVc8uFn3R+u5JVC+56a547NSCM=;
 b=WKP9YnTK4vYGaVO0+9dyaRHPMS4ebEb4bYteVtJj/gWytZ4fE/tYJGj+u8VCDw0E3kMnA+dHj
 hhX8CbwrCUKC+GdufP8pYpGn6xxe6xjagIVekpe8polHzLcl9JUMe7c
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0bf96b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B0oFbsU2YAVyZoOp_L8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LciQ_1Ao6Koest8F15q4dpVdGtNwzeai
X-Proofpoint-GUID: LciQ_1Ao6Koest8F15q4dpVdGtNwzeai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX+jw0KoI3OrUt
 Xl4G6wnfryU+uI6xFUGpmhCOZPpbp6m11yDde8hWybpy4ndQRx+/5jm0whtU6FAKUn7afr0bDFM
 PhgR+Q/gKgXloDv3PM0DI/BvUyP+O5vlN67OXtP2Q0f9/jcA+8f9fDfpyjs2XmZvuAyYOf8MYW0
 CK/Df49boH59a5Ma/dUrs+mMedpgTjlMM8rblq2Fzp9BkUXfjGJ75gUqurAzUoqBOpcBDQwIudS
 hSnnyhXJ4yUxSk2XwhxxQxm/g11uW4wgjE/JVpt3/Ls+Sj8AuRsW4eBoRX56yu+9W99KrgZO3xi
 tzcHPMBUHQySC4gUW/VfUw3klh85bgWBSY/QCc4N0ts8CgRXazCeZNxqFoEKshoC6I21KiCnm0d
 YWKu/wt56+Hg2HyJKXlBh0XTrSDqBSw4ZKytyqKPANCDctHtWvO7E+6dE0r1d7v7nb7jNLRHiaL
 zqF1q6elAw/6RhB/OVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190053

Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
link mode QMP PHY:

- QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
  values for QMP providers that expose multiple PHY instances under a
  single DT node (i.e. #phy-cells = <1>).

- QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
  values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
  selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
index 6b43ea9e0051..befa76f8392f 100644
--- a/include/dt-bindings/phy/phy-qcom-qmp.h
+++ b/include/dt-bindings/phy/phy-qcom-qmp.h
@@ -21,4 +21,12 @@
 #define QMP_PCIE_PIPE_CLK		0
 #define QMP_PCIE_PHY_AUX_CLK		1
 
+/* Generic QMP logical PHY selectors */
+#define QMP_PHY_SELECTOR_0		0
+#define QMP_PHY_SELECTOR_1		1
+
+/* Glymur QMP PCIe link modes (for link-mode property value) */
+#define QMP_PCIE_GLYMUR_MODE_X8		0
+#define QMP_PCIE_GLYMUR_MODE_X4X4	1
+
 #endif /* _DT_BINDINGS_PHY_QMP */

-- 
2.34.1

