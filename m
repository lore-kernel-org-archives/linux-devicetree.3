Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806891;
	b=FXU5fWFbSeF8FMtE8rlMaDDmIzMPUgrPojpZggWcOBImGJh776DJq4qnqD1SaI23FXpM
	 JNr26qiQ4EAINamuI7/cLcwxIUPSujlqGF8jxGxUud6Rn5ozmeTBGFuaFtfiDK1b5xzp9
	 gsefysIQCIJzDdC1aDpvdt5BFlcjZXGcDPVwcy/Ma26QkMMjE/OWhqPbEhA1yeI7rjYVJ
	 9vQJltB8oiWc7PXVGJrb0Rw19RIy1gNVdSjpixVd5gsb9COQCId9wLooJ+TUZjS6EwTbT
	 +ZDoZ+Soj0bOb2jFKyYjc2mjjeTi84CgmqIGK8S6LA9/77eRfoTFZ268YBKwJor/v9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
	b=ECOXb0+QxqPjtwIPLZw/1s0TKSvivZODiPLNK2XFW5M00F+q04JCKn8V7CXMrjarfr26
	 6inI15wJlK5sA8dRIFYNVKgIfL/7Oup3nn00/VSLblrjsTiS0Cw1Y5+S9J4oEfC8Dzlv9
	 BjN1KmwVcwXkC2a6WFtGS6i/A9syM1xlJmQlM7nGHnac0ChavbQaKAbv6QdjERvi+5BQ+
	 y2wXsX6EZ/eyWVYAbMQGsCZXU95jhJTT3PCMDmBsVmwolwpkerKDudaYzDGM4qM2W58B6
	 KyrX8Bq6zn/mnMz97X3SKHZ0Bv+KxcVWn/x+5EryeGhp0b/SMqocyyBMOvkB5ufpMpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC6606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBC6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LnYd322995
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=; b=i9ASdc+dFArBZJF1
	J2TL8pAAfcAJniWfpqQ9iIlS4m9M+4LsFmM8dH4h7ka6x39UpA3k32mQsJV/Wycv
	sQr8yWCEDyul6fTYwrrqwzfqNYwKM08cQa+QRlVcN2wWfxjBDxAl2M5gFOhqzOas
	m8SX8JYzD8jD0df5LycrmWb4eyClIRy+3V8mqWuevfodur3hDMMnwl+pdMOpQ4/U
	eoIq29/dbruF+t8GKK51lcry/z71BwDz8/pEkF5G4+3Z/6oKiqDB5zIk7Skw+C5/
	6B9pIkECRMPHXdZtHJlnFWSowNmojPt5PmdxsGpNt1C8COX0kSLfKCrRd6RrkBNv
	58aX4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx50cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:28:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed1fbae872so12328185ad.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806889; x=1795411689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=eTHw56QsmFnZpNq0v6EqdzxrNpgoVces8lX4s5u7LTQrNpOIbpNTb7KHQyJbIwundc
         0p7mImb8IqvGEnWUhf3NdFbpKuUZ2+oUDjph9wi67qGzX9wLGIvAeEK+P4gOLrt9AuPZ
         fpoaSNxRsI2Qp4x+pgIpRkE95FQApJisi1y/5vGaSBxbesQCJN0ooa7LHiLL/+Fm9vUF
         /EfQlJAhYDIFgz7gW0jJqbYbP7hS7flUKEMNDp1Un4w8AC4G1f9Vbv5lJ9s+3ydR8Grj
         1MDXAp2CenQJVlrM+5aD1EsECVjTirl3POB1EUfeNBE3jpqDxJoLwPweFqUTFkPcbeUA
         rHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806889; x=1795411689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=tB3+jB9uD9ukUp3ngZEFdmYMqMjXMeuZ2x3zP62T5vkN3lzyvqdBgAlWq67K+hUy3q
         fQW9alzbbc7FnQlcJNhCPwLAAI5qIbl4vvNfD/H1mG+9fAYqDAVlzHfNngCE7SgxWSPK
         eU+ESvf/58ADKcq1kLGpzFnxFoPsfiQP6re2t4cAOVZxovtKovXhi9EDUVbU6lL2T/h5
         3uHBZzZXPXiNTDmevKcpTEPhpPDSqYR8L5hmUvwrl/ps4ilvkWsR84Z/eVhUD4bMgy8U
         2bD7GZjKzVSgkBcBSR6CR44cGEqLeKMuuYEqAJiokxDWTv4t2PcPUnF24N3D4mgWQV4j
         lSJw==
X-Forwarded-Encrypted: i=1; AL+hErH2g3OExtDi1OKfm8JZZSzqptYxg4SziictYdIAv0Aj8zPMyC6ijtfAyq+y+E6OOhp3OWaK4Vv6qf01@vger.kernel.org
X-Gm-Message-State: APuU4Z8yljMFIAGe6t8EWKf8gksw7/ZxXBWtK1Qphk8bT+oecKp62ueW
	CIgdFsCWLoqDqo2wceZEsSPFfoYLPgsb9wHpZC8W65rqtbyKcn2Oz57z+ggr7GkxNKKw8MgeSsp
	471JTdcsMDZGQtoR/bwmZaY6mVWXq5JMGa/elqS9aiKyZsKEQRle/bQJjXKBpjJSqLUsKb88c
X-Gm-Gg: AYBFou0pDA5NL84zBj487iFaa89Y32wbCpJuKOttNw2A4dgFLkY7sMxkSTR++EVgqCX
	uJN/YPBbXo7dVEw8A2NV/JU/Adb2Z29fbJb1C31ghZr5zgfVP/8MijRnr9sMs78+qoOLZ7oRzjv
	V6o8wSfijogNI/0ecQffPPQDJswAN9j1/cHZB1VeS3S9uyruMAdl8iMWnGIyjMAh74tWv2EVnjE
	yrukksBSxDdUfSoPhc4t5R87AEeUAeMXoRQX3+ECjeacR2js5KvUMOEVkkhMYYml5WQHWseYUU5
	wJPz1H2dDArEXgh2NYih9kmbcFwLsaGBUhCq/yQHyy+CdLBzYYUBhUQTNocCO2XGoO9typCCxPm
	LSbEXuEM/XP9ApQMQaYFCUg3bgcknjeCS8I4abA72oNX99Dhb6Y8T5WpKEIwIssK4DDtOc1QAsQ
	==
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831825ad.7.1794806888932;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831575ad.7.1794806888523;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:45 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX91VawgyT5e0q
 +Eh4A/E9ru1AUBsS0hO0KMUC2gsJb2Clu4tXN9Ez2sqF5BKQZHSdH1spJjMD/ihEhJ0gHFpeVrP
 p6qHU+V9Z5rzBqjCxRH76bM6WhprsEhGazcFGile6sEt/ai587kekXd2ktcNy6fWaEGYEH0S2K/
 cbC3GOShkBtf/TGH4rvek9E9PNsiG6W62iDOpKGpDxc48y4cp8ySotpXD7RkgDSE/tSagN3bj2c
 5IzcidSzeKoS5Ilp5dYp7NM9xSGqiyaZ2gQSHh4qY0IQ9EJZnU2ik1WR6HKaiuRlUnJEOmwanT4
 m7QdZgCAeD4eUhqPvR04MFQ3ZfgO5lqSDicxHcKtZHiWDLduY7vzWKRoLr/ACXx+vOJM00z+Dgg
 JL7hgc+GgwKoV08Crj0xc55Hkt3kNqLDRqMpJPY8k7fpv4WlRf2veZlN5MbiTgTPL3JntRkp0kT
 pDV4BqSRNxXQIPYpl/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX+U0Licliua1p
 ELhx4ZztUsNQRvi28aIEJZx1R+MnwGUFQoT94p1J20+kOS7z4bjw4E0PwDfR5/ac88DGjnzRUjt
 GubULgt+PjRcLdBOVykWX6vEPsa/BJE=
X-Proofpoint-ORIG-GUID: UePmzmGbwsgPEyrTBXspfAMr-yPOxMhK
X-Proofpoint-GUID: UePmzmGbwsgPEyrTBXspfAMr-yPOxMhK
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa9469 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dI8U08jQLcRiIMuaFhoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

Add the programmable PWM XO512 divider sourced from bi_tcxo and make
GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
PWM core rate through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29877d9a929f26ca0b3b04b1ea0b11..93df784ba14376ecf2b60c5eb37e6d0b5cef9501 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -1888,6 +1888,21 @@ static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	},
 };
 
+static struct clk_regmap_div gcc_pwm0_xo512_clk_src = {
+	.reg = 0x20030,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pwm0_xo512_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.index = DT_BI_TCXO
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_ahb2phy_csi_clk = {
 	.halt_reg = 0x1d004,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -3212,6 +3227,11 @@ static struct clk_branch gcc_pwm0_xo512_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pwm0_xo512_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pwm0_xo512_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4294,6 +4314,7 @@ static struct clk_regmap *gcc_shikra_clocks[] = {
 	[GPLL8_OUT_MAIN] = &gpll8_out_main.clkr,
 	[GPLL9] = &gpll9.clkr,
 	[GPLL9_OUT_MAIN] = &gpll9_out_main.clkr,
+	[GCC_PWM0_XO512_CLK_SRC] = &gcc_pwm0_xo512_clk_src.clkr,
 };
 
 static struct gdsc *gcc_shikra_gdscs[] = {

-- 
2.34.1

