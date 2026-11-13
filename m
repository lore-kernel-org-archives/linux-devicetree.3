Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548052;
	b=NeH9JHdHYM3fm2XhWsKBf4wf838tODTZP40RPryS3EZImtCQdxtqPWgaa8odGP0MUzJw
	 5JIceqHxZh7mchgihCTdcLS1s82w7voOpNj5r4oYbYuzhjiOcb5WNAGlXJDO1M/CCPVRA
	 yQueRc3BKo6dW55idFeCdZf3zANtgs68kwqbxNsMTzSrS7AzZ4JzSoi4sAIe2/J8KsfIY
	 vWvHZ9KTjsQRUCigtS1mjmKW9yoGcv/00OafFiJy0ofy6vtRht7vPqkPvtixMe21mGVk3
	 h9ix05MpuEcmIv6BK/cmErhVoMx/MgadbmnJjeL7/NcnAsfhL9zjuVF0z2kyvbC/8uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548052;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
	b=xNS5IcRmRt1oR4UIZ912FOCd23A/8/3A9MdZ0k+4oEJoRnELgLmICPC9bimkmKcPqPzq
	 nO7Xza2PdX6lR/Ntog4LZ5OhWryX/kVo14VBKriDQuaYdYry3y73tQebOJrXN5qGkhL5U
	 2/hBT7zz6FMflCXcwHKamEt9RoxIQ/NhpnCSaft8UW6CFv9mcd93QDnnAkz2p6IUZC2zr
	 fJ6Z1jaH2KYmQFR7dvj5vLa2YsCe9McOdD+Q6xZDYY5zBb/6yKRaxa01vfWi6EBNKiJ8H
	 Uat0RMUnx39i3oSZWD1eJhGgbg190uHmPk3Ue9ogdr9pmzkBsY1pZc5nmTPAPP96Tyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWAqQbDl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPx9Dmk9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9918660A5BE5
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9918660A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWAqQbDl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPx9Dmk9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD572Oo3717374
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=; b=nWAqQbDlmo+bpHw6
	6kKcxDeVelCwg8ZXGH7dq94SA6ysbO+KK1D24ljg7OtxvreSEUyzhLSeGoK1/njT
	Ihss6za9pwI/QexkKmpQdygMOKEcAd94EleyuSEQNNoBrJR9bn62Kl/GNpQLYWDX
	e+vekL6GV5CHvwiedvNhDCg0wYqoEGQMsqv6IPog35lAvC0VUUd02PEzUMMUSM9+
	iseLgm37WeB00kG+j4iqJSnoOongYwWW4aBCvOOE/jhQs8nT3LvVCyT0juIz8Rjb
	wc4XGUXwodUF1PWN0KSzJbSpi4THjxKd+GZzeVlG0edxIX+V8GRWQZqab82xClzZ
	HIcjqw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgwsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:10 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-702a9029845so588331eaf.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548050; x=1795152850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
        b=SPx9Dmk97fFj037fv0vQrhUiXdiJGMYRWtK/cHCLLKan3DGaA6oQQ3+cYr7YARiSZM
         x6P0nrjBTuG3Qk7DuhJEF5xPcKPcfvM+kqvwALkp1tiCoqlkl5gZFRU9HZw7/1uu5Aoz
         xTrdVo6tCfXFLjeU4gwqSHhfYtbE7IYCQ/6hQYEQ4vZarE1KYtR09E5ITskP86LFKaMe
         dk1byOD6IXK90yVa5+5hyKb4Nf4CIdnQfUJRaDfv2afXd63UXQFY4yN7EafdZiS0niT1
         n5+A9LYuIpnOX3/ELiBdB26d9DpAc3+4ozjjZs/rH1iAkdn/keltrJ8VBUZgodyv3KD/
         meow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548050; x=1795152850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
        b=SVNn2rj2LJmZU4H7kPLjy585HoQe1vmQMiMKfpljYb6e9IMZx5hAuN1V7QwZhilmRk
         7LW3k+hEh5iTjDqndOavkTc+ctBl6IMeWKeGd6KLAesco1t/+vFi+CoEzIwh6nSyOiwU
         0h6+1fN4eKs/u2ZSXGhKTEIQ0G9W54VIqZBGvznNR3vbvVFxY9Z068wm7tOLKbawqCNR
         Ow4fM9BV2/XRIzVck0kaXgQ0ZcsSvDZEvqH3FCp/uFQw4n91FX+LLWNXulHiHzbhMGLV
         H6gdKsX7hjk9ViAtThahOrBkbUDYXzN/TUN+WykRxredWCy2nJRZMrw0e9lJW25rDe/h
         g8tg==
X-Forwarded-Encrypted: i=1; AL+hErFkJ3n/3nmnUGiE4IqkNunRRabeEp94/uLwUH7dD7x2Vx5VgNKX0k5QCxK/2Ev2tP1s1e7Qt8gcGC3s@vger.kernel.org
X-Gm-Message-State: APuU4Z+iMB58Q3YbAYojWN7oz5DuEebyyDi7J4szo/bai06E3QicX+NU
	2dFC/wib+sJSwbSDAnpmF8Qdtj8+nkmzBomhlYT+FADF6tXyykm49T4ql03X+BQfCPbkvt8thco
	N3yGwPkx6UZMR1nrNahfC8L7Bf3AKeymxqiPJyyXCYtHHoUIynaF+7GjokmpREWh6
X-Gm-Gg: AYBFou2pmGuTVE3D7ODNVrD6Rd9udGfcN0va85Mxj8GbOzAM7sLkd2/tFupNtgrDNFu
	Sne74qF0AehvpJG+QpnqIqkFMnATEcxnDwZjedM5SgCH6XWZKuE19QJ1PRVVLDfDc6S+b3D52od
	UuXtIMjp9s6Dl62BthXtdEZbXUPGJzpC63jU2pteyvJPSJNWXTVFXpChGCpip4KnKnDKBZ17LLT
	HMF5zj91aaNoDhklNq1oqqbC77DcEtRU5KSNyDNuyzjYjr1LUUKNG56JB4SGY975curFFH6VHeq
	kG6pQ2QyeIwqTZe18fnmcZDLcTDXeaaESqMCnUDOPlax3K6y7VFXcLwuc3MNY1WdtA0EaCNaLUo
	IJOTmY2HN9a5qgs4qFCbdwN9ELAw+P0YGCh6GzgPg16gd06CkL4Q8CNy6Ccctrm4Fim3ruDOxXu
	pfDSoEKfWSBvjyJJ/FOHC11JEpaAAVgn/g3BapQaCO8f7K6DVpEczH3yYV8bBR
X-Received: by 2002:a05:6820:1692:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-71ab4cd949emr1026865eaf.5.1794548049757;
        Thu, 12 Nov 2026 21:34:09 -0800 (PST)
X-Received: by 2002:a05:6820:1692:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-71ab4cd949emr1026840eaf.5.1794548049260;
        Thu, 12 Nov 2026 21:34:09 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:08 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:40 -0800
Subject: [PATCH v25 08/15] media: qcom: camss: Allow CSI2 PHY devices
 without CSIPHY resources
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
Message-Id: <20261112-kaanapali-camss-v25-8-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: lfTPVVOdtLUkYtvFTPY-h1bDKkz2UXUs
X-Proofpoint-ORIG-GUID: lfTPVVOdtLUkYtvFTPY-h1bDKkz2UXUs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX6Dw9g+7MEgp8
 QmVOEBvcTJ54lPb3ho6qwS8JdHEiBsgK0wEtBE7MY95fB2yqKOZk0vZ6KqKIWSwXKV0QMhkZAJ9
 bd6zET4PObeyunGSqRyIjM0LQdSYotg6Sz7aRg2nZhD7nmaKIaCapTzFRCiZ+621vlUszb/LEBZ
 ju0sxwUN3aJ9w0tRFyZCyPJd4XnyDO383HUmYD3DOe1CNvQ98DRZp5VqnaIyyLn8jpB1cmhgbEX
 K1c6iZf7Af3pw9XTL7NLU2doc6IzWd7YEDpio7+gDcCfgNqmbcd+VZRPwyVyrFEPuAfvzDPh0ik
 cnBCP2bNHP1G9fN7/PaY0U+HyBfE4UTbt/AS0/LZaSLlZG3TUOdGObFLq/yQOtwCfboxMs/Yb25
 EvHWhz8G157bbnZ1iwcDACnPqgOiX+kC2D5/TAuK75c3RbRBdANCHl9Ndx59N3dtLTZRRHIgbUM
 Mb9/Cbtoaxel6Bx9+Bg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6a152 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=2_0--xn6cTixhlPqFr8A:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX00n7ZPnAu8jQ
 61Ay2SjBKglqJIQC+CTfT1p/IWriunbPG+ifWB1Mwn4uUjsvkACVGPBt9bu1F0M3PYNljHB0tq8
 Wv8p3NcHXle5p0H40PC3POBaGBvD/qo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

From: Vladimir Zapolskiy <vz@kernel.org>

If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
there is no need to provide description of legacy CSIPHY resources in
the CAMSS driver, therefore if CSIPHY resources are not given for some
supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index cdb803843792..4db68aa2a7a7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -793,6 +793,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
 	return ret;
 }
 
+/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs */
+static const struct csiphy_subdev_resources csiphy_res_phy = {
+	.formats = &csiphy_formats_sdm845,
+};
+
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
  * @camss: CAMSS structure
@@ -802,7 +807,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
  */
 int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 {
-	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	const struct camss_subdev_resources *res = camss->res->csiphy_res;
 	struct csiphy_device *csiphy = &camss->csiphy[port];
 	struct device *dev = camss->dev;
 	struct device_node *ep, *remote;
@@ -830,8 +835,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 	}
 
 	csiphy->camss = camss;
-	csiphy->id = res->csiphy.id;
-	csiphy->res = &res->csiphy;
+	if (res) {
+		csiphy->id = res[port].csiphy.id;
+		csiphy->res = &res[port].csiphy;
+	} else {
+		csiphy->id = port;
+		csiphy->res = &csiphy_res_phy;
+	}
 
 	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f7b9c71cf263..508fcecadb79 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4808,7 +4808,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
 	struct device_node *remote;
 	struct device_node *ep;
 
-	camss->legacy_phy = true;
+	/* Legacy CSIPHY description implies the provided CSIPHY resources */
+	camss->legacy_phy = !!camss->res->csiphy_res;
+	if (!camss->legacy_phy)
+		goto done;
 
 	/* Find first remote-endpoint and determine if its a PHY */
 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
@@ -4822,6 +4825,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
 		break;
 	}
 
+done:
 	dev_dbg(camss->dev, "legacy phy mode %s\n",
 		camss->legacy_phy ? "true" : "false");
 }
@@ -4853,7 +4857,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 		if (ret < 0) {
 			dev_err(camss->dev, "csiphy %d init fail\n",
-				res->csiphy_res[i].csiphy.id);
+				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
 			return ret;
 		}
 	}

-- 
2.34.1

