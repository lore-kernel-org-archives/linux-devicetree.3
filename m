Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893B53E7160
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896018; cv=none; b=Kq+DCcpv7eu2hmGJZlTPAoWU8O3E4cdx2182pjB8ba0lsfxUgFybOuahpjo2Yq3216qyL9LYrS31uuQQHkjwk68TixV61R+3wds0yTlNicB7b5MKNn5X+xpQCiGZzY4mcRTYfkh/vyEaZ/OV8Kje19CO6UoHPzZIiWXZ/B9Fw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896018; c=relaxed/simple;
	bh=BySI5VmNu0XMsBrJdklikPENZUstY6BjektoLcaVQcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQAu2mglNJVfggVoxwkST37R4vLYee3tMnBiFzEeVvVxjQ8lg1M1vPGXv0UHYGa84+EbLZzvoNGoMKHLMpwdNKZqQuwSya03mAXBHOcRki1Fqb+i4mFbrgalq2sTixE0tCNGMsUl4r+NOCXs/Vl5RM0OJhBYZHbOuzyMSiJA+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwLTz2OH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Edlw6GO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwLTz2OH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Edlw6GO5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VkJA2025285
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7lobyN1OUJy
	jnVa2esTQNCM5aKbLBwwEc/VQBoz4IIY=; b=iwLTz2OHElynWyqQ1hrI2NV35UR
	Qy89V72Quc0DEG6bOzybea8kMSmPDVnlMWtG71sVGiREGsLVJpRetfe9s261Stsg
	CFcoOBcRt95JubJLuyYu4ypKJIUG4w2Fi68KJ8ykQtOF6CUJ3s368gN5id2SetUX
	JSAmK4qC9aPJSCP4MKD05clJhbtgNTPUeea5XBtOG1O5Ch9QyD4q19eFv9bkRIyd
	3trzf/nzsQ93/0gZ3xY5HtCXGd6S690dkWXQHZLwSx7UxCDiDVrJmX7VI6nAPNh+
	m4x5hZs1z8HpJTikvsh/XVEazOBZH0ckIpX36zXzfLvL08xAM6PHUFYeBKQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32nhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so1694026a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789896013; x=1790500813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lobyN1OUJyjnVa2esTQNCM5aKbLBwwEc/VQBoz4IIY=;
        b=Edlw6GO54X3GnhhW9W8ivqbiczmmcxyWbEI4/lQNzHw2sn881ctEariETv2qhBnvDT
         3mnOCCxoGV17Oi2q5H9BvpNeXUxWquz0JZ3Xed4c8Cnx8ROgQSBo13EeMrFYOD+DE4nn
         pOP+w1ZSgLnplfxNoggR0h2273iIgTNgBPr9OxtgxSJSlgfpL6JCk6hIgSpnccQeQlJh
         cXyzyDhSq0H4NOPetlyxXHKGl6UR96293JqUMJfpid1pPiQskEE4Dw5SuP5yLjsxvf/c
         /RLDkPXcuN0WU1fPJ3lA0fyirYn8iu9LtSm/tkC2Wu3+xo45d454mlpkrr3FKMDD+zyA
         WTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896013; x=1790500813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7lobyN1OUJyjnVa2esTQNCM5aKbLBwwEc/VQBoz4IIY=;
        b=Kr1417HvEu3qB1GPM6d8+hXBwb571CA7pG9DzGTQjQsum92mCuMWgc2xVE35YO8Z+r
         HlR1Ns0+Ry+A8wspuv151FmWGIS2UQn0nVK9Wnqybe5ksoeiXL4uzaJ2u00yh8wIH1pM
         2MRNcauMlZgcPEIBGXk3bnQRwlFI67wRsV5Eqcx71IgwP09ejQUXlZFeN5iOub2m/VPM
         Sgkppn9snpjiMjmEq6d4Ht/wKWyyikadiJQDbnExRaDp3rgWTAz0Gnk8Ese//DQKsuIj
         i5IEMl68pBDO4cWKZD+z4yd4GZwJC7Jjd5ITAWhiPG7kpWim5VuNMxocC3iKh/SGTELJ
         6pIA==
X-Forwarded-Encrypted: i=1; AKwUvBy+5Pxa87/UvFBgvUJyqLa8nSmTMQPETu3591fC8nF65DHmYkg1ZMgBgILrf+HAExf0dlDo137mWPqw@vger.kernel.org
X-Gm-Message-State: AFuF++m/BnN08xHNGUH89/4KepMB978y385gfm9iVU0cFrzkAgigcaVQ
	ZA2gZxJzdJuCs4vtG1vUQl3djKJkulXA26KQOQgo+qAsbwAFTEjy3CjAydiPxKMcmFrT1J32N3/
	p+nFesqdGlmoS5aEatsoXyVXC48Cm9MEMjrMkmCSOY2nGoLGb+x6VV4YyezhMIWI4
X-Gm-Gg: AYBFou2mFLttFM6YrM13wHxkud7IJof+mxvTSFXo0GnyoVfa68l0c3dFKmwZf5JT45l
	PdIIgtsiwQQxUmd7TMoqxGa9zaa6hq7D1Twzhq9OgTfdkq7xXpHOxnwXQ9daA6x8if9qyyYxrxN
	tyV93Lg9tnz7Wm+BbKbR2zWKp0Xyh8Q/t0AP5YTSuLlUp2YK3LuJsRpNNes1sdJuN2TZWCLdc00
	HhAwsMfoDy3ZtwiS6N5RWMyCzSVRL9CyvS6aC3Mkr3DhMGKdKvKwmFSlfhqIlUycLjVa22uzhTw
	vBqAZXWRzZiqNsFWpSy888QkZWaYjMw8YE79h4qZzs/aEk9mM96Ut0EnbBc4dCzrv9GxyramLa/
	U96oBGYOtVc5gVw3+w8qLEAPCMLdNJuUf7wBaAZrE8a6oVeGS/t8FPAirrp0I
X-Received: by 2002:a05:6300:279a:10b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3dda195fd8amr3737681637.74.1789896013418;
        Sun, 20 Sep 2026 02:20:13 -0700 (PDT)
X-Received: by 2002:a05:6300:279a:10b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3dda195fd8amr3737669637.74.1789896013020;
        Sun, 20 Sep 2026 02:20:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm9353630eec.28.2026.09.20.02.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:20:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
Date: Sun, 20 Sep 2026 17:19:30 +0800
Message-ID: <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nsf5tOHwvLofWJiualCv9_LYDMXzC31D
X-Proofpoint-GUID: Nsf5tOHwvLofWJiualCv9_LYDMXzC31D
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aafa54e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wlBrTx1nK-2z6_sN8T0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX2PqO6FUPgOqr
 qGIjSGXKgTfwZT/84a/cCtPbmT14loBXBYC2gW5qemav70UyoQARTmcQsTImxb5D9hUvgV3u088
 GcJau01Ou3TkJJow0i9/87ob6GP1EhD+U19O5HAv5cs3Jz0l+qJQ5NPgGNr5ZwoZIUQbyqVq5si
 NAfJKZ+rga4rj4Ee/6bSSpTbsXvBDDzBI/hxyP169UhS6uUbHK7IbDIjdc9RQ1XxvNNwk5Bmmol
 EIkQnrVU7cwXIHKgsCSxdOuPTukVAIpwljQ8iY34P+bJovD+zXnfUmEPOXZ3Js9OtuuKy3oGwob
 0mGOeglREYHi1T2Ha2cgXVogOfEyWEAF9832BOgTWujJ9R3HnboWmEpXzhP0FYvHKtCDoZjglzZ
 Zhdq/dALiSstf3D+VoBRcFakYzZGeYbJtIDRTQALNSpZPJql9Mmgx19WJQeRj2WZKyvgcwtIf3y
 +aAzIR+/GoahO+UZoAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX6ZVCE7KjU0Xp
 Ir8Sn1gMsh1Qb/WemPKu5ZZwh1bjuj/s3Y1bfR1g8IzFqvI2lqxYk1IJ1pyfHTUXBzKezYiQ0XR
 y7FRLdAPGXDap9iUQNfEnzZdIpgGXWc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200134

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
board and describe the eDP0/1 connector, its 4 data lanes and supported
link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..3b0fbd3b6e7a 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,30 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +390,20 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -377,6 +415,30 @@ rtc@32 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

