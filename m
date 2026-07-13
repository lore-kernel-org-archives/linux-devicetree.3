Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDC0361DA9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947529; cv=none; b=DQSpzKDyiVIep19zRP3HibktBfJR0Z1g8IrY9U1THkURJe2MriM/QJCzWL6pH+zsfBSTDayeVRREz3vdrYmjQCc9XM+p97H3/Jmhw0IuKIaoMD7KduiY7cnRWYp3X/I/Aaf58kigZyVMWZI5voiNyIQneucSVPvxQkhiVH54/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947529; c=relaxed/simple;
	bh=I9VTQjdbXxDO981XUX/Vys8K+bp0aczFFonM+Xf8NjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RX3ea2WlRzuRrFSVO6Sz/AX3JDpCUF6kthlkwavm50V/jDkAh4bZDGnDXJyNNqSLe5qjsXR9L1Mcfc3XFNnmoOxW8cd8WfY7kfP7e46lgd7swvrlnRoXpxP9G7Qd95ywcr3RnKZsxsQdWI0CKZ4doYHpRJWiaDPgE1DAFh2YarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xjx/+UrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcS+whv8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xjx/+UrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcS+whv8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3Bq1561359
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XdP6BiYreQ8KP5TA+jNeAWVZzVOnmZNP4id
	emgPGP/8=; b=Xjx/+UrSXnbaW6mdEbIFkNRnr9xSzxI9QrH2uNr9vqPlAQoIdG8
	mQ14s7v6Who6TEosWQ7JszNoXQLHK37YrPGoXgDJsQI+t118NCimskictbp70ClV
	qqsexcPoHyS0PaoRKibAbCsFShQKJPn9fNeKzoWlp4WEBimGq/MPkw6RloOLRY3+
	fo6Ds+P/9QyEvioGIEy/5TikvcybeY7WaiPf9AOzTEBnChe0Qzjw1H4kJPXyrGRA
	3GLIvWQIeQmq854VFPcX6i6h2PwC31n79fnD4dKCmCeSbQNb0CLOwBZ5/zY6nGmd
	9HLknabrOXr0XrX4KR84MKJ/8kjsiUhOoBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3ak4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:58:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso52588391cf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947526; x=1784552326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdP6BiYreQ8KP5TA+jNeAWVZzVOnmZNP4idemgPGP/8=;
        b=TcS+whv8sdsvuNKE6e3RwXCmEn50HQUuBC6EK8vafPDb3yZztiXhdAh5aHD8oRIWzT
         O4Nq+PEYXTys2UCD0SUhBo5EWSFLN3/Z/0XeMd4H+er1bVswIQDcrVHbyivMzAwXZUnu
         luL1O4fsNb7e/5Tx1FWNj74FK0C9YeYmE/QHjBKw4+Q1SPzQEhJlMXZDhEnO2QkqDn8K
         k2Dl/NzJAEOrOq53t0ahMTk6tLcFER20/R+6M4IN0bSQQIvihkYWKouPj2/pdMrl0gCk
         6UR+EUFGTfOTKKUEFBcmxuDniLE4aMh2Suixa7wqXlJ/36Om2tOPfpmG0RYPMUoBJlGV
         RheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947526; x=1784552326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdP6BiYreQ8KP5TA+jNeAWVZzVOnmZNP4idemgPGP/8=;
        b=CoHHye8Pew7fh0WybI5GmWDEU0ksKN88rhOwpHgTrcfSOuSICJdJDCDSwaxOqcrgdJ
         gofmyV0NGt0KnlpGaCRvGVzNFb7TAi+DHN7PhLnlm8ZkRy0GwZQ4ZzHllzVoWaAfp11e
         ioxJkj879RF2zO8yYFw447Re8AV6Uzs3l2m7ibJTPO53Eeun19OTyFPISLtWwAJ3Gjbw
         IeOod0Docx/osy3QANJODXJyh1U3eCebMcSDd1l4gX8i9fnFljqj8Y0KYjXw/aWX5Rqg
         DzIPW7bE0Pbdl8ooUtAgfdmkFdN7m5Sh46oXVuFCF/YLjzQfOmANWF2JEn5oe/QO/dNE
         Pyqg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8402AYsTf1YtSByfMkf+UqobvyE2IW1ZPa3m5GpyduKHxIZCnFMWBtsX+fl/uAC/D8Xs8WWJf3Hug@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ3GhWvt2NF1zZqPuuactdoDWmWpCygknBbL/CtW666kdhiZ5t
	fR2mj6geVRybDaR4rhMwZuJvNcwYIW6HQIJeQvkJKqHJqkeQ6tiGAQgY8oDllp8O9SChT10F0uj
	hGBwmiiHMLDJYPf0igFTKNAQ0LABlrSTJLZgzL8eH1h/k9Tu5d5Jn7sATiz0v/4in
X-Gm-Gg: AfdE7ckiAGv5wjhQNbDGT98dUZT6N+W6OB2IY33DA+R4zqDHtsf0APodjndlZrk56Js
	rk31frGXr32zMvzzL33KqmojKzzo0tu0/e28G5jswkx1GN8XufsmyiwhXJ7ElqGQuHwjCwn1gH3
	z9NM9ywK9S81FLE0yKEvn7so7FDCrzMQc3el9AZReqUDhxJYJAmJaiSsy2gM3COuE7EUcbx7qxg
	YrP0WWiGgfzPbM0GAn7rtPBTr5uLKi8FyZCvgu5vjOPfaqv5ORpH2lMOOQNToONWbVJs1WWM6PW
	VbRu1JXoMC/pf8+krggfYbjo5oPaN4rlIgGm4d5OdwICKJo4ZvuE5l9XxFhFpybCSa2fgT+wBuJ
	UC9hBF9zUP43R/bWupjaARx2dTZw=
X-Received: by 2002:a05:622a:2511:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-51caa02c6camr128177831cf.4.1783947526101;
        Mon, 13 Jul 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:2511:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-51caa02c6camr128177411cf.4.1783947525609;
        Mon, 13 Jul 2026 05:58:45 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87187471f8f.27.2026.07.13.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:58:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate
Date: Mon, 13 Jul 2026 14:58:38 +0200
Message-ID: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=I9VTQjdbXxDO981XUX/Vys8K+bp0aczFFonM+Xf8NjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqVOD9pWsKtmKrXjOMzwkYBWFcHVEDnfAi5O+xs
 EayVvvesvWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalTg/QAKCRDBN2bmhouD
 14wdD/9CEgHmwJbGoVVTL+gzeUxepciPlV64FTULj2sNIz+WMYIltmWuMgwlWt2g4vGX9OTry4Y
 3sSj9elEUjRY36+d6adkxx4VvNM0AooJG1rTsBvS96eWogK/nIAGIXs1F3piUpyCZUpL7Nkkn9R
 2JwiFXuDELBiYkWyFRKQn7HL2dl9Ui9LOg/UBdBgWQc+egBDk8xMXwpOAY582mjEjxRZDOeWDQC
 v/fuXK5I9e+0FqcvnaszK69f9xKnMgjq7lvowJPrcE56JswPqtMx8S4fn6/m6QoW78JfRceBnUO
 kt0INGwB9uMY85qXj4JvtWqIxp02LJCpnBT5xiCz3yfNJp6vqDWusxMYm90fZxFXGQn8idJYUMp
 1zk4Q8p2MRL2ae0V/+BcZOcWVI+Hu0obJL5rxGPW0EDQxRAW0toJqVAfA8JtTv1uiT2EU8LKh11
 TexU5ybDYJryYkSs4tbWZO9Nih9ppO7M1Xi5fR8+yfgMpFR2IaOselczg1dtVpDRpeqV2fWXn6p
 a2ySdGS+gsvWg/7A8M8gHa/UyayrZGUwYw/E3/RG8tWMELx+/VSktY9+IbLDN81gcC/9oGBQd4u
 NEI4KB1rx4CNmdlLcf3WG1kQ1pAOiFfgS2DtMVI9CUOfI0aohMqt1/oTfeBhu8jvbY00G7E2Vwt L9bcc/POsK4E3bQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX2A+FBfCDCGsS
 Vu1JH3wguO8Ym4lDDobin4CeMw6AbJ+36ptVxkVXZcME2Mefad4j18yhy2V4/HMvHkrJQgnMm+Z
 GtYEEPhjBRHzEw2cI0BUzKuuw66zuRoBth/UPTa70FnKbD/Bpe76xLK2E+NgyDS63M8L5q4zaov
 jHyKTyr4uVRgdQazfenGPUTT8D1rwx82XjmeEvjXCKuUYtAxybYs7vKO8bmNv2PBFA85MO9mtUn
 LoOpT6o3Ra68c6manuGBbITLdFTT2xyhgpvM7tI5/fM6Xrc8A8Dd+z3Qbh6+hhUXEd9bNqzoKqy
 TunUWkcDpMsvAvqSIPiKVC2vRkX0ILvfdv35VlUJUWk5ncEHStQ1LQQTpGccMRfpWIRcKQko7sD
 UbVI+xtITDsF2tSC7prR9pW0CMQvz+V4MY4RxS9A2Wb/fE5W7eeWNmBd9qVQgCGwTY9nKoNP9Db
 hQrUO+I0NpVs1Me+hbQ==
X-Proofpoint-ORIG-GUID: lUg16103STwesVvPFK6CUveBwvQrAzO6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX7AxEHjmxkV0d
 6NqZsSor4H+jK1pBeb8vugwXTlgBZ6KC2Gd3dswmHpwg1BDrD0B4kyQTqAvtzqel8ANM6GScE1F
 DE7mSjw2Ufr8AUqhJSCoHcSayIVQ1Dw=
X-Proofpoint-GUID: lUg16103STwesVvPFK6CUveBwvQrAzO6
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e107 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=13iKjLuWfy0j0Tg89WsA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135

The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
uses correct one, but DSI1 got copy-paste from SM8750, which had same
problem and copy-pasted code from SM8650.  Wrong clock parent will cause
incorrect DSI1 PHY PLL frequencies to be used making the DSI panel
non-working, although there is no upstream user of DSI1.

Fixes: 159d252ed800 ("arm64: dts: qcom: eliza: Add display (MDSS) with Display CC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for current RC
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..ecda1f448a1b 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2557,7 +2557,7 @@ mdss_dsi1_phy: phy@ae97000 {
 					    "dsi_pll";
 
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
+					 <&bi_tcxo_div2>;
 				clock-names = "iface",
 					      "ref";
 
-- 
2.53.0

