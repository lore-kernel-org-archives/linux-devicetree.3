Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C73CE0A7
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461703; cv=none; b=B3YaO1qjDgTad/ZRDw8AuqI6Ee4N5VUdwY25mSR7wW4bAhJX8TqdaptaXaMcPspFMwhKKqlv5tgnYYcuyaEwIQ0qLvYiILWdAIH+BwizRexwEIdLKXYmOQtBZi4g0pA9raIhsP9Mi+OqhgFVuphzXXS07tlfgZPb1TFtY9kboV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461703; c=relaxed/simple;
	bh=K+J5JXbqYwK3TUxpCoU6dPlVnyBExv1tcHHZpJs6rIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPT8auwlHt75mmRWTAkopnNYbBFWCuIlKmAQeZ2fCLQiUcPeHHezYWMUAGicwo+RK2lu35FNHsRsXIuc/WaBJpY6SR2NGaaMMPZNKyA53gJtB958+gt+pFTYFI5irnfrgfALqLX8jFyPSsx8mUnaic/jkkuaYyV1pcV9yeHRYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDxQXeGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob7Ifg0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDxQXeGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ob7Ifg0m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3nVx820916
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=; b=LDxQXeGlbB+zParA
	4JxeTWgUg4obq59z2T9jEIaY3sJqLOVnjcOZ5op30LxQgwucPzpW7H6GqETZJ4Nq
	V/RMxDDvTzTuINKMeFSWBzRs8fQUDiJUxt/T9310441FBwZfVZCoe5joc70zRfbW
	7OAVPgp6wGQDLsygXQpX1eDQwHazn3JiK8MPOllZhyt8PkFoAD35JF3cDm7/zqlP
	FGQpNXbFxOVzz0xoG6uYMKBBSNEGZuH+2BN4CBSjbCIKzp4fa+lmQBLS3hOEyseR
	qiM65+SBwSRYgUBgBNrFseN2Sa0sFg+IWnjSf22omtTmaBIG+wfOIfyVKs3uDPQ6
	yplvAQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82ka35j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 18:54:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so194072a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461683; x=1789066483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=Ob7Ifg0m5OCuZgMuEyx8JT7urnNM33jwjDd6DeVn53pIobfw2jU2sZbhd78n8BUp1T
         adz7VgVLpcBVIl5dOzKtCqm4bhPjdlZSLNf3hNh79pcft7so426N0jb4weeQDYB/wpe7
         U7MmL+PY1hEK+0Cf334q21vjRNGfqR2ZpQ8xcylqH9hCFG27n9xb73tb0CN6jSCpvD2i
         PHWKkhnpx0cwAUYOFhXHuHgl7gDARePSHX9kc4MP5kWs/oJ5ixvWQlk8HNW5vQAMNFK1
         +gbEjUJ4eeHomjzs0tU/Q03NJU8+VaPmt8MqdiT0qdNKaLajAziTJuordS+C2NaAdw/W
         MbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461683; x=1789066483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=LimS2rormP7AaA9gSVYV3nSqBR8xXb0p/6VcO17dNpcLd17eWWKHUwqgvexgjNnlQO
         bF8loHCVa/CafR96vKaoFCL984zMKlrjyofdeghi8FJT8gxxA+2YDzaqkNevmWAqsq8m
         UnCb4miHc1m/OgDapVBevr5iJLCAYrAeRZApR3D29zxpeFHY1oPMWdAeS7+qJiHglqTa
         l2QxeTTfVV5Z/qsgW9un+2VEim2BE7aCT6EZpXl0/SRQix0Pq0hob3QTiNJwTco+DwCS
         G8eteySzOeaFhzlRTVuevN0wzPV+GPG8Sj6t4BIPS41Vs1sYbyN/7f8S8ea/Rgp/gndp
         2HFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGCPzBJGsFhFTI8q2TaxhwYHrZZW4l+B/ddl7zL2+rV5zz5dIIFC4MF76Lu0B/Qi/APsF8roDViUA1@vger.kernel.org
X-Gm-Message-State: AFuF++k25/tnyyW8z6bY2eHk066b5TiS05QcsYLEOna///oe5JF25USH
	OvnRS3UHsKQtI/xeaaZx5WpBIFGXbAkCFGNabYTZMAExkK5G1228AKr4by2GhdHEFOTOkYqqJMp
	BifataJvgl7fXOG2iPrJ7rZ6Hkpdz11bzlWH2pfGe74i2Ss/ez7c4LtJ+tEFbCWht
X-Gm-Gg: AYBFou2tTHLpHuWCK4xtbZh8khKD3u/HBC0aE3XCMIhb1YLtGck5MpiTrF+BFeA6Lzb
	Fwb0prA3LCUmdz9Q7vtHCvJYiVN8YkWehXcZj+F67jSbpfNFgSSLjK/gV/pS6fy7Uf6/bTlM0/b
	S0SoRyN8IfQOIt2wa1o2pE4vtUSrBEQtf7W3pK8fHMHcaRSK544OYJFekuFKXSfm8+UVio3RVpP
	/KmCMx290G1Ql/TBILOolbZL1etBe/p8imkTyqjC+73QmojYSafrpnquR+KaY3+Gmri1hCVQBc/
	a86zzWfLsFrstwpvY+he291Ti6xjhtQG6pQtlX3Gk/efuormvvFQK/Fi/+nBc0zM4aCO5MfVXFb
	yJvQnU9iLgbi5on0zSDy9xMzLpyymIw==
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723114a91.25.1788461683356;
        Thu, 03 Sep 2026 11:54:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723030a91.25.1788461682819;
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:48 +0530
Subject: [PATCH net-next 6/9] net: stmmac: qcom-ethqos: warn about legacy
 RGMII PHY modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1105;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=K+J5JXbqYwK3TUxpCoU6dPlVnyBExv1tcHHZpJs6rIE=;
 b=VDlMBVbP9rRPq/DX36zllF3huKy8nLST52QEJlSSp+jxj3Zs1EezJmpRt51v27kOytNJ7XBqv
 7jGNDwMby5uAoWl595g90dVdQe+h9jNOgpVxmQVVPMCnxoHZ/z8q+ZM
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: hGo5rLa_AQ2fhglYRalxxXT0E-2QhoAg
X-Proofpoint-ORIG-GUID: hGo5rLa_AQ2fhglYRalxxXT0E-2QhoAg
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99c274 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IeZn-EEC65Et7LrU5-sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXz8/jOiRjE7ga
 SsM/ySzafatw9LfsPRr7eB1rEDq1HceSSehK+5THNyJ6LKXnfAAoFb4y4YVxNDRSsjrXF5tiibS
 KxO+x8cx3jXVrXY8kVl1fNZQ1cKMjK7ooH9Qih11EyYGlpifuWwqkndctU+5I84klNeImW06Lii
 U4xQA0/1aT5WHD0aJSPplbvAJ3hJ8CKrFg3ZKNj/chbnLDpFsHvncOko5gH2245G4icQnqlyMiG
 1GuE29+kRJ+7O5280fNA/8fEDSZejiUa2wRFNxi7/QrbaLbBGBGQSZc4QRezLIK7kPenCPPY8jN
 9gTZ/Xb/AuzjHC7u4luwJt1jK+RU5QRBGNLJoPimJLCX3r6cXz/m6fBoiVTNQRj7LeyZgnkELD5
 MqeAh9mg7FNa+uDLrxYxYjhzOzDknoZHMOKO7+dGkLyN1qLc6DzQC7uAoZHCHei02lnc1VaC82l
 2wshaiPZoK7SwsBUlSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX8YyG/LB4u93Y
 xangEPaoEm8q8mQmIzZPrGj5UgIGr0+fnHGJ1p1bTAvNPUIuQh+MSQfecdyWU9tr78bZ1bLGe5W
 1ZiDwgFDnzzNmSOW62S1R4Iy6nFBNzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030165

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 67738c1598c50ade22f2d548a6d66911c348af51..2ca2f03de30174c9771fdc517c0e21e3b392ad76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -554,6 +554,8 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 		return;
 	}
 
+	dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1

