Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981813;
	b=wyadPvsIQZzcHwcly1UJXxRdeh5hY7BcIzpmQUP5Nk8PQKK1D6ePuhM3eXRcBXJcotx3
	 dL5vBcKFs7Pi1VGw9urMchUDFWJLTZdzlxFBL+XmklTCtCP8Q3pk4CwhhWmWIXquM4C7R
	 CNlAcGS/HgU06vmK2RCF5sLj2YAZgP2wFb2AV2sBS3AJu4Q2zRT42lmm2xSQnDUsCkoGq
	 shmh/wbJdcofOptFZe1v2N5wbr5LBYzOPovjOZ+ht4/NHqv21wTGtss8NSj1rbUu/vp2Q
	 VcAN8hNbr2nWfAJZOKuBnKDgqIMiIiWfy7NzXb1efwJwB410bHrI8pfZ/soLCdBZ1Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=;
	b=HIyzYFJFpYDbTSaPoZEWO4WfpOv2ikL3ugwSkkgKaKTXsdTdL2pz7LHKzkrZvoX4Yn9V
	 EfaGeT4cjXUWtzou6bEXaPkEKcVvJ4H3ebU9NtNOtIFbzYK/yMSh02X9q/8nQs0Vam6fw
	 f4W0VCMTYCcFwVc4uGuV0q3BMYb0Ibir4q7/Qg+HQ251xQECAvCP/xAGTYjKuMoZIMvPa
	 4KEbkgnlNkJOFgtQbSzNvQJEgdUSZkaoBF2hpUccncqDXKamd4j+ggGMMZLmeEoUv7rty
	 IniWFryi6lTACzgnYiRmnM6XhPiB1LwfJuYzVqCqN1hDFJ0s0U7beFmHxWISuCSz+rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C4e0ZujL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JYGInWRu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080E606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0080E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C4e0ZujL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JYGInWRu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwHU2602436
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=; b=C4e0ZujLzOphJd4X
	mfhfIO8LLRld8j+BVB8s781KPpDG2eG8d9P1QzTUbjXNA7qct6VW4dOhjMfp5Bk8
	IRINf4aQZe6R07XTIxyUNoQvnEyTV8KMpAIcTozDcy6gafiN4q6F2cWAADWKuKZg
	m2yCUgVH37K2tQLew6DFROAebpiXc6IES1tG9Xd5ohA8wDLOWFQ1ZNr97qUz6mia
	VQ8mC0nbACPipsjWzAzVbLjSePYmYsTnQxLu81yOD4kRP+2h2iACRJFgksdmrgXp
	DEe77q90GaZ59LQS1oDxNfLUBIxIdGH6vIWw21eCXUf79RwgEnQty8v2BgfoUqu5
	5bz1DA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71fmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9995cea88so5043835ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981812; x=1795586612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=;
        b=JYGInWRuqmQNh37z77BW8I4AbfXNSz3eupsBIckKCRdxaguPp4hwa4fTvh5X06PEch
         j5DoB8jqAeHKIpruiSEx1avuMbE/waSETP//6TCRoXTl+ahhtNM4LU9GiZEG4sg7KxRE
         wC08yx9awu40OOxryJZ6+TeS5gBFh4rgBd+Bv1d5wMt9gYwKRSr91DztnhxMIc1axB74
         6Xczi9zl9jEVHAgmCLeHszo1u9uqcokGPsbHhzJGrQkl50cVIE+vCOzvc7H+hEkYnZTY
         31LY6kIOqH2SyX3uzSsDOB8qQXiHdkmRYVs5rRayDRjRj6O3R+i1x3S719gMd70z7v53
         GWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981812; x=1795586612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=;
        b=gZCSX/bXPArCpvd+oueNYKnus1BEzxnlv2m0hIXiBdT2FT34g9b7C+9j0B1ccXGN0p
         12wHv8fIDC325l1YFfOBH3pIit1ySqrcF4PX8MXHnDbcjiAtD67bzElY0WaPcv3H9Sgk
         TaVlxbLr0D76WB0naxIkThidmwrG6YiXg8MolMCbD+K4WfZkC2/wRmoiK3dRdM16EO8v
         pTjyJgZ9RF1DLQFD7dKVlrr3qRn6ODu75FimcGkFho33Alsq4Gij+WdBD95QJclyfLrq
         i+nX8wXXQfeTUxJxlyINTMRu8KKIW+ESgXESmmI/rnJ1aBPO0krRIOpOFdagAapJZMIS
         Pl2Q==
X-Forwarded-Encrypted: i=1; AL+hErEstEpjnYPjiRtxy7WYhr7mb/ZhhAJq9TcblgiBRWfuRTHesQKVWawooKxstkl1xEKSQHSJfYkZboUt@vger.kernel.org
X-Gm-Message-State: APuU4Z9P7XUxlETgtl9BfIr7mUMznk05wDw8ZkJSRdmtA0g/+vzgy86h
	AqNSclIHVBoxjvZIR59EveXDB1A9mbb//Spka8gtUixAPf8Uo87C72AAkfxle78HeAHoaxxXSo6
	tVqkj7MfazHz85tEGe1nHYCEd0vnUUAdyMqx8dLu7MJsWvuEUqL3vBPmotZBGnkZG
X-Gm-Gg: AZFdTZf9sVScWj/v7IAFKuYYpQT1LYhe6WwwR5lqE+G1im9zjbvmk6rSChdTtkDPeZb
	X4ISYKPhu3+Ycff3f5x+NJsvFu4DDYTKBaf3fdqHJoDG2gHl5IY4OIX0T8u2sgKKEBrBA2HaHB+
	rNI1o0zr7oXY6xuY9gal7bup8Bq6dGpqPI59WX647bNXVUaUyrDA2WUXEUSD1bTf6y56FXSjvp0
	UvFXCTNCMHO12xprjGwDq5HrAUPBmoquKdXKrY4CQKrjdr5wXURE6hO2get4TcwB4JOr+gyAUSu
	uSWTXImc3xBMJLLBFQYby3+3qElNZsIGon1YALxZpY8w2XphULem8Wtix2EgQEOmZMy/h564LuN
	iUxWJiHX1zkUh9LVYIK6RoqXWDMhhzHzqDdPxXYVuBK49ztCV8X85iGiao3Uty98TQkmVl+O31w
	==
X-Received: by 2002:a17:903:32d1:b0:2ef:e97a:917c with SMTP id d9443c01a7336-2eff72026cemr15699125ad.5.1794981811632;
        Tue, 17 Nov 2026 22:03:31 -0800 (PST)
X-Received: by 2002:a17:903:32d1:b0:2ef:e97a:917c with SMTP id d9443c01a7336-2eff72026cemr15698755ad.5.1794981811165;
        Tue, 17 Nov 2026 22:03:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:39 +0530
Subject: [PATCH 08/18] pinctrl: qcom: qcs615: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-8-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: bArUQrmwce1caWtTY0KSsr-luhIFxAMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX/5ssrTs69tzW
 eCxVc4mgq5IkkVoAvKFsBhUeC/Cw4EL5FQTDoUsobGlDKQLcf+cj0z95KGkM8H04GOEvLiT5f0V
 4CB8t9LopszKuqrgOR8Xk/j7JvEfTKSq8KyQb3+wfMfDD07Z2n46GBEiwdjNM0z/CSIMNsckGit
 1pw/bMiFYrVNun6kGiMfoqLZn43rw1weFqfUdA2hg4KhKWyZB8FeB45OUP+wYg2ZKEdYhj746Mi
 RzOQCZugoRNyrzhziPpyI4aaMXLbVmIC0WCxZx8u51I12+C+yWSd4J4NHaRE7ES4gSWazYudoOx
 pP+6WSL7cZwMnC7TBXyagb4wGt8QKBD7Y/0cxYrFDSQ5SzX5QF6shBpqjeTOyArzk4o/4hcwwXE
 6swTu+PfOVE5Gzj7Imdlffbbos7FDbamf+LXPICmI9UGDC0SbeXFkhJZ7u49GmDaqPz1B3pF1qt
 Ig3NVpSkwiaEmEYcEYw==
X-Proofpoint-ORIG-GUID: bArUQrmwce1caWtTY0KSsr-luhIFxAMb
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3fb4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX1s8BBC7X1p5E
 JdJlmTG2iVuDsVATQQ+DafuB6DUyDdUIvVBEiEEAtvyazygAmSsWd34mGCNMTPjkdAgG4vs/xNe
 C612nf4MKLwRhVB7sxoNA7VCrSol9mE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 0e7df184122b5b94756a233a009ec0dd3675816f..169323635d39a7c3441560feb002e9e03a577515 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -404,6 +404,7 @@ enum qcs615_functions {
 	msm_mux_emac_phy_intr,
 	msm_mux_forced_usb,
 	msm_mux_gcc_gp,
+	msm_mux_gp_mn,
 	msm_mux_gp_pdm,
 	msm_mux_gps_tx,
 	msm_mux_hs0_mi2s,
@@ -581,6 +582,10 @@ static const char *const gcc_gp_groups[] = {
 	"gpio59", "gpio78",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio29",
+};
+
 static const char *const gp_pdm_groups[] = {
 	"gpio8", "gpio54", "gpio63", "gpio66",
 	"gpio79", "gpio95",
@@ -840,6 +845,7 @@ static const struct pinfunction qcs615_functions[] = {
 	MSM_PIN_FUNCTION(emac_phy_intr),
 	MSM_PIN_FUNCTION(forced_usb),
 	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(gp_pdm),
 	MSM_PIN_FUNCTION(gps_tx),
 	MSM_PIN_FUNCTION(hs0_mi2s),
@@ -929,7 +935,7 @@ static const struct msm_pingroup qcs615_groups[] = {
 	[26] = PINGROUP(26, EAST, cci_async, hs1_mi2s, jitter_bist, _, _, _, _, _, _),
 	[27] = PINGROUP(27, EAST, hs1_mi2s, pll_bist, _, _, _, _, _, _, _),
 	[28] = PINGROUP(28, EAST, cam_mclk, agera_pll, qdss_gpio, _, _, _, _, _, _),
-	[29] = PINGROUP(29, EAST, cam_mclk, _, qdss_gpio, atest_tsens, _, _, _, _, _),
+	[29] = PINGROUP(29, EAST, cam_mclk, gp_mn, qdss_gpio, atest_tsens, _, _, _, _, _),
 	[30] = PINGROUP(30, EAST, cam_mclk, qdss_gpio, _, _, _, _, _, _, _),
 	[31] = PINGROUP(31, EAST, cam_mclk, _, qdss_gpio, _, _, _, _, _, _),
 	[32] = PINGROUP(32, EAST, cci_i2c, _, qdss_gpio, _, _, _, _, _, _),

-- 
2.34.1

