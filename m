Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B424503B
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665617; cv=none; b=LkjcY90JXEcwUSKjmxhZvE3KKXSiC85xTtErSPk53aI93sZ6As45ppEmOiUtQ5uvHyMWmAWP+t27fTiVfD+Zc8wbU58bX1coYSMjHibJs4LG55WhgF4GXdijfKcx5MqysEEiKt1ZjRuhLbwzARU3/4QMMADv5S2aJusb7U1TbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665617; c=relaxed/simple;
	bh=WaNBJJv+6oSOPyDrHj7H5U/mPHlAb+zThv04RVsrfDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErIC0ARL6ZaQfwF7KuL752hX81Jx59LJu4lolrFMzAE/vlTWpWGiDJKVD+2mrMWkPTuEBwK7StgbOGndneiaA4UiKN5r3hT3cuhPmvxvDs98/nuYD0yrhUiClhKLG7bzFgh/eVZn22iKskjn7qA7OHhXAkjlRyoQfRvPPGyPwY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yrap/BSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4zkMUNz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yrap/BSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4zkMUNz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K57RtH3842300
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVVQaFx6O4r01adoydXe8nktqRl4sT+iMmmpPIdWQYw=; b=Yrap/BSZl0h6O+Zw
	W7B3mr7zSD7bd2XJsQQ58IOCaqSn/iZUDKPU6qvF8vACf2ENPdKABSk1Ay6Ph01+
	Fdx1WotmmXMzJWj92/SSrY7gAOo6i2l2mgoyt2P9DeUazJ5nd0QwdzYiWdCGq2YQ
	nXBBzV8Ra8FcVH1ZmCN5RjqEhkFmSNPwFer5DgZGhOusBx5w5hW+anldlPSCzCg8
	UAvPXeuZG4vbjXH9ZAqRGhPcF413YA/8O3/0DJiF2zjBoQJp1do+41zw4CO/bSKA
	uEFgvZcxMwo9rJIYdWXLNSMLYeZRhZGnJsn3g3ljQlBCrf5BAlfZB58nN22MjRSG
	KJSKJg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hc973-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so996357b3a.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665615; x=1777270415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVVQaFx6O4r01adoydXe8nktqRl4sT+iMmmpPIdWQYw=;
        b=Q4zkMUNz0BZI4LyvQFrITz42JM0pbKuNwxpt3NtYByHnIQupUIASj08Zwu0WglALV7
         8hKGc+pstXrLT4zN6s+I8yQO64N1l0M/zZQhPSkg4iMLCgonLGp3oaHt4fkUqfC9nUGF
         tI7YM+QM0nHJVZ/Yr0p+koCrMaPCE0zLy76Jfsek2voP1bH/K6cfgOKZwUSpKcn38o7k
         qJWFcbJNMoKCcviNE0H7mG3N5DAZnqunZtuA27D2Qch/Fh41hgXtjyx40AREX9iUh6A+
         bsjpq2I/uP8JBV3kNEMsZZ0eVbXj8voFgreT17FktAhxXZfH4oj/VZu6t/iwwY/2oXN6
         p8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665615; x=1777270415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VVVQaFx6O4r01adoydXe8nktqRl4sT+iMmmpPIdWQYw=;
        b=k+F5M1d/IgQ1WhrOnd++jyXTxvdPr2TkTtaLGR+/iCUY2ewraU5QRoTLYdHlweBCWZ
         fVAz1swDZf6cshGdBZvhSr0f7zq5LA0Knzj7/4VX2jntYi4xKtZZYdlJVMed7jd91JBh
         EfCF4mJwMY08HQx+THnwMRG3Bk2w/d7VA0O0aozurbaZzHH6FMgjU87TtKTbTxGTvFU+
         NbBscrpqeumC1RiDOFDuDNCM9rxLpl0BhY52Zsuv0YIwMdMBtou2TvCaVIFxHfVjeb47
         3vHrKU7TihTUXwGTFrv11PcZMolTJkjvY/Z3jD2qYH4/vIAeBsREwbiDTPGOhGBAGbje
         WGMg==
X-Forwarded-Encrypted: i=1; AFNElJ//FBiPXT0esd/hUtaLKygJjpi/3ZTkUlz1Ap3efM8Wjkf9SeYZro9NbjDVtiOMWa/ZfEXy1s3lLVha@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPnQiP5t9+FNzBGoE2EIcKSrJTidUaG3hGdyGc1Wz3Y+cItQ5
	32OuVzBIOL9ygkoi+SCc0HoxBXWvQ0RbiLTyaz3SagPmgtUXscDy3r1MyjwIg77ZaJ3GQ1Watoi
	D9ZkTdusvjinJ04E2iBMxEOhxcciAcrRY8HXY+h0sekTctSn+Fzb+6Agxhktt4xfw
X-Gm-Gg: AeBDiev05O+/+R7HXxwhu1zMFIvSh9RcdTOoKFfQ3HyEw4xIRMOTSPGXBqesIQJYXSS
	Rngch98lYK+Nmi8Bwj03Lrs93n+FNCZvsCcvTC5rF0ziAEbkvpXb2nPXbv4wg2RvR8nFS5Hm1tl
	2KgU48Fd8R2xPmxpruaWmZsI8es83fyW+4Gt7wfLUH0Sg9RklMkVj3qzyIFWt+yus4MH0lxMxIo
	dFR7Ae44NEPDw8Nfz9vVvCQkVcB+DjqnANjrObrCfde2eXK/+sKjvxXl3YDeREH4/oc0C3uwC1+
	BdViQckz29RhRRQ5FAydniFYXpksZBtciNJl5R/vBr/0zZ3o/Vzt1E8egswyfsiCDk7eQfm1ck0
	/buKNR5XFiZY1tQfB0CK0XfaL80DqM1bipyS9vESAxvLL45D0ri3Y0H0ufbRrhZtQYHRx
X-Received: by 2002:a05:6a00:2988:b0:82f:66e8:4257 with SMTP id d2e1a72fcca58-82f8b565509mr10317068b3a.32.1776665614620;
        Sun, 19 Apr 2026 23:13:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2988:b0:82f:66e8:4257 with SMTP id d2e1a72fcca58-82f8b565509mr10317002b3a.32.1776665613218;
        Sun, 19 Apr 2026 23:13:33 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:32 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:53 +0530
Subject: [PATCH v3 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-6-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665582; l=1316;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=WaNBJJv+6oSOPyDrHj7H5U/mPHlAb+zThv04RVsrfDQ=;
 b=YjQE9TtlyTOLdtjF74fv4xRCrvlKlwM0C7iDsTGbqAn4OMBL9tb1wjyaBd1jk2NFfeTg76P6R
 9zfUwHSASnQB9cb5FZR/Hvpph+K90I/ZvPwIuEF2aXwB8VXB+IJIr9V
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5c40f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DDoZI6XnaA0zmnrO1bYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: G3a86XRrmfWiCqb4U1ZkZ82cwpDwTX_0
X-Proofpoint-ORIG-GUID: G3a86XRrmfWiCqb4U1ZkZ82cwpDwTX_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX9rTxWIOjNwja
 lE1MVCLMPahj9mQbQPASPdST7pRcVVjbRgqF/f9D6GPIIB1KlT/OaI1/aFAIt/GkGySxh5C4i22
 1W10s2LoWQVa71LH9ar4xHv0ltowApTld0fyTouYmX2n+Le3ZJkcEzBbtZsl2jUfqqQ3gQy9ccI
 8MhkQZFlLsHdOtlBJGV5koixPbjOPzhVQNZC3LL//YsbxgXrYBM/0mT5CFzNGIngN7ak3QdnPpq
 GjLSk7KqaknwBe5cqhzxahZYz78buScyZXB5O443t7m9zStTm0yI1F0CXENqDPRmaXx2TjfNxE4
 lCQxH8rxqJv812DYdnhGNwAccKjKPz49pvYEIeX+a24OtuXSa5+JxbjLtha68PMfdjL0N5MnJ/p
 s0KbypFOPycoVd9TKYsTz8FAS0ijp0TTw7fvLFIukzLwrpj963rRpz8tO/ENAJ9kMLzZT2mO0c3
 7rFNa7c8GZlfuTxWXfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200058

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..01e35e34ef51 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1

