Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF843F23BE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100515; cv=none; b=UWR4OtcIbyCS0ubQQ+UO4cuYA93KJ11fvIKRqAFYf5N0W404oajGYVyxqY5neWsPDTOz2luaTTPTSIm4y1lLJbC6SR8C83jjocdHBYKejGqEDRtrHflaE0146n+/aPdxeIi7iILdooXzd1VETfWQ4UpQGt1DSDyZg9IUFP98aB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100515; c=relaxed/simple;
	bh=Ir3Vc68TUfNFyZZdTpS/qqZD/AMADOKm17xOvscfuBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4XrzZx2iPVlHCqXxjK9ZECHy3ahuL2MqlbQRwfo5+1epZaCA0F3+QSMe3S36FZcAAkSaVPLv+CBxWfpas+BO0+QBkL/e5fdD5AO2PhavjNc5c0v0aKlGpNwSTgMy3AbE03fQmd6KWZ52UPq1K/X+re+3a5oNZz4jZ5+lydFPaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdF8qLkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE1vfoa3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdF8qLkG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE1vfoa3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAHK4J2685073
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIwJE1/qy7u6e7wGIM9P0EYSMQ5Ur4KK4X4O8/mp9Tk=; b=WdF8qLkGV7ec6yTA
	HSxxF7o7iypNfIdJM7kZApfQzPsml1WC+EnK91EVsNyCmeJpZ/w1tGraBzAKywA5
	QRXcIFTyh1MGV8NU8i1mz1BTzH1bpvRByoR9oK0AstgtPcbQ6kzqERTC0R3DU7Py
	6+oPTWYhdlULLpXP6fTAyZJKJj0htU2wNltFqQXJztffSykPALDwsGxJu7rKk3+v
	IC3A/mDCw1Z38z2V6ZucHcXsWIpLBRw6EZ/wazVZO8XjkBzSls9t0wK+KiggMoD5
	byFX6NIr10BfLHqVQ6VNDICYtXe5FLrFBLGulLOb+Yt78sKPIhcOq80XlE9rISNn
	clInkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbsa3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:34:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51605cf3c60so26935171cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100487; x=1779705287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIwJE1/qy7u6e7wGIM9P0EYSMQ5Ur4KK4X4O8/mp9Tk=;
        b=EE1vfoa3uc5gihAE43IDwuhvm8ksDmfLrIXPxXdxEopASFGHxcJ4ogu8RWcwQr66fj
         2fKlaxRD0hsUPNIk0lbQA6msV4y2eAYBe65vFjrGbf9NF0SLt7j3LyW00wxqtw4xnhyu
         +oHEroVTflzGHO4W52mb2s3HXbswh4aACOd4jqP3D8p37O3rTAV1JXF9k3diJ8ixF2Ys
         xSf5Sxe4iA3hBIscvdHC7cYYFzra4YcSRFz5HIS0s0ISZudJu7z3w05rVfBH0y0UT3LM
         FcyYpt7LO79y6avbTSMnwK+BTv/qFP8vdg986MsR3H+ahqaWeBuWW4lJnbp//9t0caf8
         ZL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100487; x=1779705287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XIwJE1/qy7u6e7wGIM9P0EYSMQ5Ur4KK4X4O8/mp9Tk=;
        b=D4EQEaBcN5lgWxp6gVugWb3HiAoFPXoPxgAYIP1BI/SGqpdbXIzhhflkJVDFHAq4oc
         kx4xyNjBmSDqd/7o2sppWejkMuVBXj8/rxrlD3m9w7rtHXIRZyF5uK6GxTHrItCi0IMq
         bNAkOT5ZDa1eiy/2xH4rYst4TpYKP2cHGbzZdv3WQtaPItCl1BvWsTxpwnSYG4OyHxAf
         bH54ZfY6qxlE01wjjslwR9xzg+i+l2Z2ELbnj4wLvZu21HJaCMSWzJLp1JNUDWUJh2uc
         9rtIzPXZtxQdzCoYzMxJlPdP+U0AV4tPjXdx7dy54n7wVu97OUNkZFYNaBhq9Smlzebg
         Op1A==
X-Forwarded-Encrypted: i=1; AFNElJ8Og41dpp4r25IwFKmoc/gVrTt3N2JhsvcP326C2VkJ4eLB7T9GgXU1LxbinKPSp945KUwubHxacNal@vger.kernel.org
X-Gm-Message-State: AOJu0YyBCz5wHra9taeB1JV6lEC0dAx4QimrfbJnCkgaQrqAaUiYTx3v
	QlkV4Zvv7r0+1hNKU5YkbhXbheSQTwuSBOOnf9ZpfH53nQdaH70nXBip18pTRATJ5+sfo1GzJPW
	PIfQDZYoITW075CNtHDfD6R8np/VWLGvmXClUQEDfjCFiwgcSNbLD1AF1Ng9I8ztV
X-Gm-Gg: Acq92OFRKzKksAIfwmx2qSFlT4+t57Lw5guSkqda6dVDY7ojBf3prdzNuBYl73cNHE0
	LPd6wHKkmhiRDE+4SnFfFUaX5tkSq/C3QPyU/4vO89yyil0+kpczkYoy8voiRo8ttlE+P95yZNB
	BBCk8RXl092U4MwmohLX0zaFuofGDT7ftLQzkA1cDLpwc3kqcHmcr+eN4TvN0CzJ5pu49WF4VZG
	U/VFC/AwxJp1ced6pH1x0UPEJLccS1/CcVbqCaxmeR3FZgdmDjWiHYrkvDed/aWV1UXLy/T5L0/
	zu2bYDWTkEHhBgsK5L7ppWZAtrbiSeJncIlKWhh/ivEphP6723XO4cTGLtiwt/X4G//mUpiqB7y
	Mlx0y6t7j+fKd1VBK4NXwIm9R+nXEpIDhmGYErCh8boqTQIhLMw==
X-Received: by 2002:a05:622a:15d3:b0:50e:d316:fa35 with SMTP id d75a77b69052e-5165a0cc90fmr202910481cf.36.1779100487505;
        Mon, 18 May 2026 03:34:47 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:50e:d316:fa35 with SMTP id d75a77b69052e-5165a0cc90fmr202910301cf.36.1779100487085;
        Mon, 18 May 2026 03:34:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35654171f8f.5.2026.05.18.03.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:34:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:34:33 +0200
Subject: [PATCH v2 2/2] clk: qcom: nord: negcc: add support for the USB2
 PHY reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ir3Vc68TUfNFyZZdTpS/qqZD/AMADOKm17xOvscfuBY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCutAIZqDIFql5Y/yGnrTRqEZPJF2hoamUKEZX
 vWy3htrGweJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrrQAAKCRAFnS7L/zaE
 w18oD/9dVz4awfDydFBDu4bNp7IW8HdGb51GI+Y84ffxxDWflx4As72/5nhYyY4MmAbz7CVORVs
 JVADBTe88ApbwgBIHpDXQgmui17SP5FWHGTW5seBdpv3KLDWyVJeMpDQyl46lgQGUU2/57j7j5z
 u2OO1i9zRrTlWO36h3aIXuyBhZsWcuAoNGgMOt4jm9PiSesCpvO8rFrB6DPEaXSbx5jVDp1L55m
 jU/Fo/Pu27dhJao6KKxblcygBxvbHHvvgMW2fGsZ0Pz9vEuZR1ZWTz70vAjc0t+tmtFrTenRPrw
 QmSjpESrOagw4MePMdU5bztzDHzEMAk/vkqGAnlkB2WWAzcuRPqPYF7+ZOKPGdLgliCef8NKdQZ
 i+LV+mo/TUq5sK6SzGu5nKg8wPBN6ZiCNH3pelMSdgK+kaOl9a68QwKozpiRi1vqIyUTUSvtWdV
 qsK6nKHfGKr+rnNysmJfzl6a31J58xiLhetFmd2U+Tinypyc/idhOYVbcyqFPHwPCf3URi2/WYd
 UVUBuLD5d4f+YAEqRy+bmhqzyNoH7VfC3QuaHfo76ffcg5Zh2sRAGUOkLiaIzHCNpAMuAu8M9kp
 w4Nb7ynzx+Wo9nYS2g7uF29wbleEzbEs8NCJkmmaQuO0ZNc7nNGQCubD0LWIFFvhTJwWFrdpzG4
 I48WZN7y4Tzmjfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OsT5EvHWyyw1J9zCkebwVyUTMpdqPM1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX5QgvRqHCQu7R
 HuPv0kKEx1llnl1w5EPVBTT6ahBbR5o4gkmFxbHZ9KBX59be+1PoOLbuuJGodAtoQH7A0X7lsjq
 o/YUjuS5ldzvDvAA12xIf+yqc09mBzZ50OExrMu3L90mVpLk3HPRtydkQXVxEW9DDkPkVP9Wmam
 p7MAgsDgvAPH4KRbauWSLRy3xDn+3GDGxaM6z7bbLVTAtV9OuiI/tBkRu8KVjiSD/+IiuDSI3LS
 4zGwh858l4Cz+nVgLcu+8ZRBlNkDKaCCrMKRoGQUQ+ezEJ3osttLHpVuXEHpMuUYXHg0ewLYdNb
 NGMhW3zFt4qOxLXqG9epCeUW+quMkcd2R66WMNoWgzS0AYvSnhuhesoaIaDc7neWfJ/MQ1jtP5d
 VWUPL28l8BK7Noy/lvmihY836L7Kx6UkznWwfZMXc/dI4ruKNWpashfipxrzxcjFSpWU7DN8xrn
 viTHGMLoQ+Gi011oyww==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0aeb48 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gjOyZiz6IXqkjem99UEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OsT5EvHWyyw1J9zCkebwVyUTMpdqPM1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101

Expose the USB2 PHY reset in order to enable adding the USB nodes in DTS
for Nord.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e536e6b6e76f488abd0e2fcc435380..162b58800d3d9f4a6a619ba98b471a2511effeb8 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1918,6 +1918,7 @@ static const struct qcom_reset_map ne_gcc_nord_resets[] = {
 	[NE_GCC_USB3_PHY_SEC_BCR] = { 0x2d000 },
 	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
 	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
+	[NE_GCC_QUSB2PHY_PRIM_BCR] = { 0x2e000 },
 };
 
 static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {

-- 
2.47.3

