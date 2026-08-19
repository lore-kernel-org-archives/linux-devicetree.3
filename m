Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D2315D40
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144013; cv=none; b=unbwI/HktDxx5bWxa4YoWqIVV+dMKqNkMitCKNfvnbks11etvMg+LDeh/8SRy88qFtDN6JqSsVYY6Ru0bIl2Lj6ZIvPXvU1YPlQwxMw456+hllbkhrxFS+PioFDSPRwWX9ILtYD+xj8S+OeYi4u1ojpY2e6gZxZ3U5SG4c73Hjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144013; c=relaxed/simple;
	bh=IvgrZJ8sAzvQ0Au3XWQhd4qgea8mcKU51+s+Ti1Pcl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AM0SJmDSpVtIiJSRRQ2tZqdxhAaaTkX1V5bcczuzo/kLXlsprmB0sQKtfhFJFr6vdOFh5MCdpjjHfz0OWri3ds/TKfv841f3iz/53gBOiugTI0zCm29y+ucg3JrnoFwjJn5Cn+SeYfRGmquKc7dITkFL5oqVUSpGHnBanJB8aAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bkl1wGRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxCCHo4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bkl1wGRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxCCHo4T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClF85321549
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7zsfNcwOncPDcVbix5NwmBDOH4msPcXxm7UEKgyAQQ=; b=Bkl1wGRcSetWbtFP
	RRckJeJg+OVX7t5SSIHN3WQPTA8Gui/TTnjqIt2eAltdA+SjiYdxdua2AMNJ51uM
	pBjsjtkOWqKziltd52jjp+KRJY/uLeegXBjmbd0PdRoOdwYqaxeb5z0oRRbAd/++
	1/jGltwb3r+VS6iPPdv/Yf8ovaXcpSlYcg6hM2VtJhCjJElp2xrTUnx1EMl9FkSb
	AsT24Uvnqb4RW+vPj2mm+x2WYW6SH/qfDpfJJX4fZv0SI7e2mWfLe8PxjRBW+MfR
	aKKKGTcYOLwZwLYQzil8FSbe1VKzi4gsRQcXL18akpKN1HKEw4cJ21hHUKBlOc4O
	MHj56Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftua2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so12060491cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144011; x=1787748811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7zsfNcwOncPDcVbix5NwmBDOH4msPcXxm7UEKgyAQQ=;
        b=WxCCHo4Tcq191BTV6/BWDlNM8Ikfm3gPoocCUdGUdMnhMTSpwVKSLuH/WDKWUq9K1T
         QJVXlcD/4rvDAowgKTObJmQJJQQA+0YR0Y6bAU6+NoXpE+wZUnVkvc3KiQaM6IN+fHaN
         tVqlodtV2jyHHGKx0WO9aXADgSgKd0jEQcpAHOU9302WOmllbZ4WgKV7Hnw3QcpUAdQD
         CPGxRu2FxlMxPYiHFwpe18vTAjSH1u60+U/lmjFIqzEy1snkflPJHQVgpzfrgCK8M0Hv
         I3BWm+HkmK+BZZQmEczaA252xL0Pg6y9TcD+SSpWHEMrkzodYDZ4XXayd4p/fiI4Od2f
         vz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144011; x=1787748811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7zsfNcwOncPDcVbix5NwmBDOH4msPcXxm7UEKgyAQQ=;
        b=Vcc7bE66MyDhPBb/L0ba4J5zqBdUdDdKlxPvHLuUNyKyHPZtaom3ZVK7xTzyr0tOoH
         GLg8xKEBVdDTmLrVxsZN0YRCV7EUPtea+QSRkyWLveuq4xdlGxlYIG7iDpSYkS8mNV6T
         X43WgWv16+6XqJ8T4lESSeJPhWz8c3ZmQ1veG5zeEpLS00U+9h8HiqAq87Fu1+pF84n4
         5eUG6TCk47+YXN/ilGhXKgaROjYWz28tWmlqUeYYb/CiRLI/p7eYfwrq8tvm0RD9NmpM
         U/eJTEc+r6h9KsQejyWHwKJNuMcfngaB2/6ix9MW8wcZIwU6q7MiWOO5SBiNCsooLce9
         MpKw==
X-Forwarded-Encrypted: i=1; AHgh+RquXH3c0LqH1kg1eVYRTAonhh9owuWd3QsJirWIURppWgv7ljtZtL2hE1PVxwrzNp052H9i7jfWDuN+@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmuR101k5MGiXyVUUXzoZd9CDu10BJ6WMXFMR+KAS4jJK1dLS
	5qKuvRaeasA0+K8BdT/y4JdMQozfvQJqupNW/zyCpzAIyKBSlnlKnvJPUoT1bEEqAEDqTw1Okwi
	1765X2ENB8+/wW/Em4+/OFslnY9Xrl8kqg/JuWHvkolOXJJvtqI84+bPITx6k65HsTcmLfhz7Zb
	dmxQ==
X-Gm-Gg: AR+sD13ETFSCgJikKBQT9fmIvrggZWqP2jf51BB9XWUpVsjyR7Txwvm9esSkHlKY3dg
	EaZBtW5esrRDIqR1NXsIzJPVr/Bnf+ttTcIBaiqrm6QCPmNM+sH8jenbYRRssYCMF7fCItX8t3L
	reoeSf47JVLSWsKAIU4ApiXnKBs8nynFc/iHMie2kdMAi71gu/95g81DDsSZAlOh+UEFUfCCWYn
	UYEMtGD+n8Dj3SsR84TcHmPBkdm9rQkxO9D9jTSRvQJKE+XhWmtELqZerJy4SDcad+/66vLiMWr
	/Mh7l2ehmaj+ERngQTqnLvCySwa9y5aNld5tyw5UYEOH1XMzRP+pLOsanAWTKwQHBn9OoYedcqj
	pm2Ca13sm
X-Received: by 2002:a05:622a:1487:b0:516:35fe:5524 with SMTP id d75a77b69052e-52dd43e1243mr37127861cf.5.1787144010463;
        Wed, 19 Aug 2026 05:53:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:516:35fe:5524 with SMTP id d75a77b69052e-52dd43e1243mr37127481cf.5.1787144009886;
        Wed, 19 Aug 2026 05:53:29 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:52 +0300
Subject: [PATCH 07/16] clk: qcom: gcc-kaanapali: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-7-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IvgrZJ8sAzvQ0Au3XWQhd4qgea8mcKU51+s+Ti1Pcl8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacLI0kkn//xUP8e3HndmLgUoMnD2Cuj5U58v
 Mms0yHSyRiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnCwAKCRAbX0TJAJUV
 ViK4EAC1wqkwa9WsSClSYL5ulyXSOsSegML5RaKoVWZ17uSqee9z8/Q3HfJZ9fuEyeSQZ/wdvpK
 lYIS8n2dfc2GYVBW8rXMpbtQV0sKZsiRLjAubtVGj4SB2HcZs4/yYPMk9MRgFsRQFl02qs2PGMu
 GZtVnDzrbCctbveljGJ/sHHO9Xxv7bBGmhPn2PR1cUxYKwBjp9X6ZHzjEH/UKmjLGGcwdUi1cqE
 Ts0AomjLQj+jKjj8H68Sy1NW/bjlHnYWksQl4U24yqJkwbJ4D0p3MyNCz2/Z5cnJxQjLRvgVVAB
 oI/p1/CZXuEeYbsk+1KyDOe3n1fgDEAyZqqjwzPfXMcotwcraGrye+srm9TQSmZ+CPQhQRWbeBq
 wYRQ2VX0XrWPp8WUsFtx3e9kT+KIYu19eiT0CWWApA5GCHT/dAR+jlhqKrFbM1XskysC+IJxX/+
 Fk+0RBMKZZcT0WWD9Wqs55L5HjjpFQilF7ZSiL96ClUXP7k6yZqah8RvUw7hEu3+LkZ+mkPFDsj
 1Y3iXYGaOL06pgU4AF5e2SWsQoh/FOLyWxIA8NmqdNKfMVdx8zeOJnyOoqzNWozdO9I+62O0xnp
 m8ISycqJEMRa+bzfTHxV3imqz/wfKkGjEkrcnfc1+gN6nJQVnfvXauF58AWiFc8WIoj5HFldK8P
 6osOYhwhjEaFfCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a85a74b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXzovgIhu/EGps
 MrQbxQRv2JJmdLG3mdJ+pbjGPeobPIrp/zuvMDsUG7zNlkpTBr+u4R+idjZV9a5jnjuNzseeWyz
 0M5BzTRNINJswVIFCls2D3eTQNoNngo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX2RqFqzOwiTMz
 3qH1K6I3K0QZDTIh7SxSfNSwzNWD8Ct8X89bH5ONpxRc5vTJNoenrfmmBAD59hWhIbuqkudYnHC
 6p8WLY8jO0jRhnrKxgact6Ub5P2jo2i8p9T5gH72bg4UzSh/LSeuq5S5ThhKHRU75xaggVgdJS4
 5xWi+78ndc9NbOGx36bK1W3bZn4URjjF9eEMnIqBfWQOdp6g3ELMl6Z7ZUh075ZhI5Zl4WjXOzp
 M2ObIBe3p6drKQEsjr+XV2OvbwLJg5K/F9PI+vrka/e+uFo9vOgT4Bd+myqQMxqoHT3Zn5HwjfO
 IsMp/bgxc4M0Vk3SZKiiKntwO/BFuEP3zwn8ypEA/gYKAKgA+8LFZzAa8T5DeIUv3MGZukkDTgN
 dHzh1tZdfPF+juJ9QK0qswG8pOafsZzVfjXSuhsPr334UBq3wIweGEzexfWCCrQIXlOoQm499G3
 hU4XkbeKlX5+z4F+4uA==
X-Proofpoint-GUID: M0zXtOM4H76P7-CmCD-uXokENMYSjZO8
X-Proofpoint-ORIG-GUID: M0zXtOM4H76P7-CmCD-uXokENMYSjZO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

