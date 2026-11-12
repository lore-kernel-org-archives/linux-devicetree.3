Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497812;
	b=qmUEWySjsQ6mAAt2Q2XKmTn2P/IkQ/RUJi7oDNOkRl+sgVWSaA47SHH2wy8CJLZOt355
	 Qvpmdkl4VNxEmeDi1Qm/vr2leP22rU3/kVrzW85eZYbJ8NOMOVSTZH2ctGvENI3rwLt8+
	 Otopmo3Nsxc6U6ZEWC5PzTxU/20/5QnqA6mTW9y2j3mY6I8ol1AIF++aiq3Ry9q4Ofw6r
	 dhpW5ZeGwYCjlS/nTuw6JkkKptHB1IVOA/Lah+eDfGCP/gCnvyiG4ASMZq1pjOAUTW97a
	 8o+CEivJ6joK2TfiFwct/rKHfToQBz/iRIrzydkjm5xEADUFhHZK/kV96rTPeU3Zn/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
	b=2ASjG7KmYiW6vMG6sJhJYkeY7cjJ+b4lIYlHFR+VtD8jWHG52AgUlVeqhlStqKQxKTou
	 1uFapOhxUV3NyO3kE5iUeTVkmss883vCW/nftKSLkCNwzPxb1HCVpbAte14OSCt5Ygy7r
	 YYSJfC6pmRfKRvRzWSWf19fiwhSHLCmkwhz49SjXX/hE+eeC7aO9bzDNjcTbxcYSDiybO
	 xZLepQVrc92mKATgVbNRTDNvm+8mgR7BTliPwz7JzbiXt3qPZFCNBvOw2iPiqZ3khXkAG
	 EYNSISyZZRGTtcyXZIYLll+jACvvBEj/QKpeIFKRpRCSZ1LpyPu9rHOv+gUTW4rfhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="phRKJV4/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSC4SzMU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C3606A8B5
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34C3606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=phRKJV4/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSC4SzMU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaDBx1112633
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=; b=phRKJV4/S1WG1+TR
	3fjydgQD+giUjPJGsH+XrQ5NP5rf3DyNzV4ZHC/etGvHhOlLkVps+cymh9t1H+Eq
	OjZ47RykDusG+MPbSptzrvMQtkF7H6O5oHoSyMgF8jQ29EaqTB0rIjl42ZKnH8O/
	uXiuTTt7EmAxgTBFJi7WSgY4wUrt7roeyOzm2VJMXjYX/9jsZvVDs74qWCc4bnX0
	v7/uzrCIPUYJ1MZVYF8PiK5BmQh05AqfhRGRL6EHDUuq8f2ItOkNioDmYQnGxm7B
	QZPmGNdyuDoIZKfUd3cnRei/fRwURBkZrTIBs+EH+eImRak+pzLjAS1HaJr2PPG3
	yF3mEQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re28n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so3466776137.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497810; x=1795102610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
        b=ZSC4SzMU4+A59ojdOC23Wz8eLEzvllQ5ISwar8q7wCuiQoXZXjv4lbkNUrlTvhSKl3
         r7AnhYFP8O5tiNPOPmmLMXQJgy1GW5FlDVKe+ykUYeqs4CzoXGSU0wycJFrJw+7N8FSn
         mKP9e28MrAB5RmAKENzUFMc32GJBpwcqQzZ5HxtLaypLxmTZjyRCaPOew2d1fOrmFq6y
         ToZGoFtH9VPNoKatdeG+7n7i4Y02yHs84s4U1jxcEHviS7hNzQPz/wl3sWFFwjXgMus/
         tkRDMfoZbwWiGTnukJi/9aW3fPg9DzB4uShwB49isyzK8JgiBtTHmPrr0oFiDAWhX8B0
         N1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497810; x=1795102610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
        b=e/ZWm3zunP8IGGZ3eiCjnNRE6oLFY9duC8dQvfwFJfZXrhtxWrQSPWKPmW8kqOplSG
         tAmtgg1w6emGsnxgoQatGVLRd+kTcPPzfW5WA+kVEuWXROrpDSwUfiO/PDNfIL2HfnL2
         y+YVgwQflEA57VV0lVkgVzKvlhVhiH6uT4okWexCuxoJUTZ5JvuoYBbXQAMaS2PeU5hl
         WbuKyNYtHRZua1UlSZLpH3wTkB3VLExkmAPAURwPe4mTg4gmJVV17TrURXfzNTE77k6+
         cRRyq7Z8ddf8xJh0ttVy3mEaVo1WX24pN6YdpbU/V8JJLwDII8JL0VGd/xJeAoAqF9QN
         7Pvw==
X-Forwarded-Encrypted: i=1; AL+hErGeBbXg/GN6q8KV/z+2VYHTQlNSK/j+RYQRMrs6uz21EDMuytrardigYcDXv8/8GGMctbHsk0VaC0Yi@vger.kernel.org
X-Gm-Message-State: APuU4Z/M9p+egVabBVYrcmbLY26uGSHZD5KkwspiCYQaAPwS2rSQPI/K
	v5kDuem2txE0pRoMpnVmoUtX/7dzd6LNAMjo6OzlF+UaqzF0OKy7BrU9IbdlL6khRGWNuqkTygj
	1IkQJSA/UvHUtXLiH2rcBezfZQx/qh9dj0DLh7HPlrN6nNW6Yzvsf7HB3WFszMeVs
X-Gm-Gg: AYBFou0sQyj46pRMBUI1oaa+U/vL1KxqmWIZ0cX9zuL/FTicqkKXIpkWwKspp/cSaMF
	/9y3hcMMl5lZeF3TjKHB27eOXhM367UDKuOJxeSpv/NyPFmJ2ddTs5wTjU4/qcBbDlXui/cDaAw
	pVwNQaD9cfENbLhyv4Upqh3+a7ldiLYZ9uL4AjpZSVYMUReMdpzQw6XDabKC7DhaB/FNKp40a3n
	Pjm/tCFPxp/A8MRDOfj3scrfVGKPKv10LGxSFNVsXnYF++06752koVqNaE/aN/7CWuii6FxZ5cU
	MEieYLY+YOB4aJmas1UN7v+vFEySeMbn4FgX8Qa29GSK3lKxsN4OK68yU1hNg5jLJQBW4gauLVP
	OgzxrE3bXieFhzx334dLUpExexjncCSe5VDs+CBxDhJCr5NwtsIaVsSZMhkV9rmkSu+e75wyzPD
	2jqg==
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr2848362137.29.1794497810072;
        Thu, 12 Nov 2026 07:36:50 -0800 (PST)
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr2848347137.29.1794497809457;
        Thu, 12 Nov 2026 07:36:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:36:40 +0100
Subject: [PATCH v2 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on
 Nord
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-3-30ad3d947217@oss.qualcomm.com>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0QzX4LF5lSbbC5DnVnFoOIfhrWUJ8IJ91S32d9U04Kg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0IFspCQD45JtUKwA3clwnZ7bmvYBwIdZa1e
 /7hBukkXemJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w7fuD/0ZS7mqp98din/mP8QmeXGunJjymxEuRF2XUjni4YRHwtMJ0LSakLhsu0AYQ2rZE0vBiZ5
 rwY1EPw49QYvrNww/r2rRuVhbJwU4ZUfyNaDDOSHsgTJrfViZFm3XnmKHtZcL6slqE8QgbG1P0e
 sEThUdV38phJ9BR+suWYqkFQqpY52cSSeVybV6pGILbXDQ2EeZPVCGwpm1H2ZwY6Owgj7PpREUC
 /eOpBiC87IPeTAph3bak/eDPS8yd/BHJXdqrJZJeSqUlLtNavxfut/QBoMufkxad0FCCvvJCZ0S
 63lhaSq7PY1P9c18tnHjWFrSgXFLEtRcHWiG0io2A+0M16Z+T99XHo+iBXYR47YYTdNEiGqu8S6
 tAuS296MjQ7tLZO5tqa8BRWfSG2w+V8MSWDXjXANJ9p9DJ776NGj3zPzIGOwnC40wL0hSBAKQM6
 LieB15SYTWg1kv3XCA2Mg4xhFBfIENTa7VZp5QliOtJl12A1FslXPVQSYnQMcoe8zaqjNDePjmh
 hlRarEfv51WoEYnBf2BTuw9sqVkm5gg7htUPefjl+5ZYN6W72tWlzfpAK/N8R2tQuiwecKuh76+
 i/jZQLh18pe6d++ugaG5Hp5mrIIJQSjvPteUVH/oFJRK5vAlUnk0GfAJQYQM7vU8lJ8v2iF+uqG
 PIS3fW7tcynB0ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5BDoe4whS87TpszBVSGRr8n5FtvjuXiE
X-Proofpoint-GUID: 5BDoe4whS87TpszBVSGRr8n5FtvjuXiE
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5dd13 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bNGo_Fnal8ggQfzXgYoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX+TE3HvGUkSUN
 59l2kOYV1QH1dedWxm8M+KDr6xcWBhOQMeweqA7HUa7+gnijbk0WkLC2XteKo/6N9fyHaUWwEN8
 Q5/DxLB50AskuNhna4I396bASaNMBUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX6VCykDlEw47V
 NG25r7b8dDswXHS0FX/Pt1/3ojwSy5lOBqpHpl0PMoBHfbB6muhHDdu5XVKDnfX6pumW2NljAmL
 I3UV/e8yc63DcSCoECwC+S3Ele/M6uju946VFMpNthrUbR823ieWSEIT4OCEZY5eDXUhlwLn1uD
 FHTJaQ6C9PxaztOfBGSte3lcGSMKGvf7gebinZXbnFD3hpt4kmDSENih0bDNwfKHxTFUcXTCe+C
 z6tzltJgk6J52BQ8+K75jGTp2JD86coLD9QVnrIKX62ufegAn+GYYq2JmChfLc4KEcTECeYUogp
 zq7f5EscWF2ga1NF0zoF/WrY9qhUjRCyEWqQKwS33n+GFrgmQj1qjUfZzkdPRBrOB+11dkEAkmb
 er9LPmuobx01XGzVrpVT1ULhzFycEUVOoYkSPgEBi3IjxPAxfTEy32susBXAEoEIZiZvN+slmV2
 GJqYHimAw3c8GQorspA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120062

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
by NE_GCC_AHB2PHY_CLK. When nothing else holds it, e.g. on boards
where only the USB20-only controller is in use, clk_disable_unused()
gates the bridge and PHY init accesses go nowhere:

  xhci-hcd xhci-hcd.2.auto: can't setup: -110

Add Nord-specific match data that requests both "ref" and "bus" clocks,
reusing the existing Qualcomm init sequence. The bus clock is enabled
and disabled together with the ref clock in phy init/exit.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index ee473b32f116d..4c70d15210c68 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -452,6 +452,16 @@ static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
+static const char * const nord_eusb2_hsphy_clock_names[] = {
+	"ref", "bus",
+};
+
+static const struct snps_eusb2_phy_drvdata nord_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names	= nord_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(nord_eusb2_hsphy_clock_names),
+};
+
 static int snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -607,6 +617,9 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
+		.compatible = "qcom,nord-snps-eusb2-phy",
+		.data = &nord_snps_eusb2_phy,
+	}, {
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
 	}, {

-- 
2.47.3

