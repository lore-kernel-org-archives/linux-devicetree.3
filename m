Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4CE524B1E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063531; cv=none; b=Dw7WlGor5QL/xz10I2OqmX1LfRwCqCdLBvFrK+Qb5+gm1TTYHABp9G66TNtNPk6JdgcyXc6ggBLt61jeJs23kts7XQ3THHZ6WVIdbPqjmg859fy78l4D52rnMyIW6J6WcDZJ/h7UvyO94Hjd3BTsTq+RZ5TTROMYl7GhNHR4mRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063531; c=relaxed/simple;
	bh=262v1U0Tkp5x+C6S/jtE3f+Te40vfsxOH/z2Ilw8EfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9FkI2wtHK3Sup8QODk1UMFRElja1P74kpCgIXUR6PDAUcnO0BUHA1jMCTvjMaSdXq5pgHC2iYjY6gqic55oJ5wRQPQmDrdzvI5hkYNBqpp/uPrLJ0Ll2snCXC1Wn26hdkPhWstcTdU5Ef+65Z4huzTUTNz3tJe0RqFl810IqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzZWn7JV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icjh+4LI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzZWn7JV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icjh+4LI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M702kr1978678
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQT5Lf8ST38dRnd2k/xXz0WnJEWxcT2JfYhUujtaKuc=; b=FzZWn7JVcw3Nk2J2
	xFeEusuewCsy80TkQ1NBvRne0FTd3OXA3F+sABOdHGRlF+QWMz07hTD2+3rKfMUD
	7o22mwlLevrkA769NqyELtDo1n0XXsblJzaTlJjkT9gr9MOA5isQCVwHc992ZWzW
	gA+7d0lcgpPpMB0y1XcViCt2B7yL0p78fEUbdDubPb1eilzoGZZM3vnQ56yWfRBr
	br/Aixedp0RJqgxu+EoeEBDWGVVJrBMo/cBd8uICEIYmwAc8SFItGmuc+lhMtIhN
	APADHj33N7Zu25EApQ7jEMIYer8yK3zc8uFDVYtQaG53QSJIEs36TgpBZmC2wamW
	NCAgGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0hq9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso133556385a.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063513; x=1790668313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQT5Lf8ST38dRnd2k/xXz0WnJEWxcT2JfYhUujtaKuc=;
        b=icjh+4LIiZO7TRApEcLZpW7pfipMNuFIFVy+bgC6uC9jFsO2V02xjRuEUyrexB/Gs1
         J8mdqd4AadI9wezOwMQhqHWzx04sMeuzoTcrSUrFY9vOGtvR3SK9vt7+lacb7I0/JuJH
         WlWtpZQd3NtyYFyTBqR1GOzRz6kpSeYM5JN6mwOx7+i9VHsFg6HIOgKveUPj9r1nCj2c
         dKAWI382A5xgP91cBktXo5QTjHuFDAyoZ+fD6U12dNtq1EKR/j/BayZXNGV97xpHmq4m
         Pp0Pz0DnBwtbjxl94krckPhbsLaj4jj0F5lig8l3cGyxmfDZdthHSkwVnnb/hZASIVB8
         t6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063513; x=1790668313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQT5Lf8ST38dRnd2k/xXz0WnJEWxcT2JfYhUujtaKuc=;
        b=IIFbSpej7DDOUat9n5fsjgTFbg5AJxSV7chHYycu9QVhqdq7fAgduOuDpp7lkZRqfn
         MALjGodh3coUd9w5JK7mqMV/c4l0lFK6rUGHd2eUnAd0/NxfwdAB2zHYwWZMJDpDI+eo
         6FcCnEHoqMRZQneKy7C6MFmNk6kJ4254flLKL6mUJeq5NNGBtbIRa0CghRLZVCtnarVI
         RNG3JpWJhuoFm6lz9o+hJ2wrXtu6f0Mcq9t2BzaORrwc8E0BiYytY5hSDz4OzTwsNRtc
         KEcGDI1n/agLO/ssPqcV1XYEL8ie/vviwFMIsajYKmfxWpRZx6eAnIMp/0CfDI/mT3c3
         Ipmg==
X-Forwarded-Encrypted: i=1; AKwUvBynP9bL4Q1T42kPn7423H1loMoNaOO3jrjlgMW8p+ztWmpsDlvLFA5JOxlQj+xXA/pQzyJHCqi3C8/u@vger.kernel.org
X-Gm-Message-State: AFuF++lukMP9u66lHJF3tW/PFI14F7s/mLYd/zE2sJR5Jr6ecJ1JqiP3
	zXy1U7U+cvbsjHnW9rGQVllXm+Kv6rVvoMXEk4lUYdQR2eYKmCRKHPfzuF3DBZ8Zq+irnigAR4s
	Ie5k22jCO+n5ZOfqKux2cgYisPuAlDnLNw98mUEHY+HEOAMCIqO22TDsrSu2sZAhz
X-Gm-Gg: AYBFou3QqJw11fx8qE9zApW19xijODaJQm978iW+ywZOBc+nySXeLY4Qm98ApdKwxHs
	BIPWldQSDsEDdtoWufw6/LUmnMfC80FeJ7nUIV6IHscMHFYI1fy1WLD8jHQFxKKdN7dLD1iDooc
	6Rst3mPLpI8rxjOAg6wDLQAo2pYaNSXyyUCAkx2+Lw6S4/XS5mdJrtaMtsNn1jxltGhgpAjxgiU
	u55Vzh+ZkWVmBYmpoCf/10ZZoOTGvYuBuFuaMsJBTznipX6yrXUoNMcAQXgAS7pPUxtYKFTuujD
	AoCqHM8Ksd4xcQ7gUxm8oAwiWspeXxLutYsWUkgFl6ShSV5WoD5s2/pH5A+jhTfLsfA0iV0ep4Z
	vwJqMYCrO
X-Received: by 2002:a05:620a:2a08:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93c17e14a30mr337164185a.2.1790063512909;
        Tue, 22 Sep 2026 00:51:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93c17e14a30mr337161785a.2.1790063512461;
        Tue, 22 Sep 2026 00:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:20 +0300
Subject: [PATCH v3 11/13] arm64: dts: qcom: x1-dell-thena: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-11-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=262v1U0Tkp5x+C6S/jtE3f+Te40vfsxOH/z2Ilw8EfQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN85og7VxTIZPWFmWeX5+qi8Om9Oo84WWRyt
 mTPm60+MbaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzfAAKCRAbX0TJAJUV
 Vtj7D/47OFf9X9oAR1PvlG+2DOGGn9jW1z3e50der4cRdUraX5qHZvl3Q+bsaCmPsJfUHNdDqVF
 ZkuTiZ2ZvrJpeLJs6E7GwsGwu6jBEMXn2esPZWF82rUg28HxANfXg0GOu8RvqIGPURD86Tr3Luq
 VP3BbPNFoKZVbMgwQPjqE7akRvmowBCrJSw1/aYISi6kGnz5Yf4XHkoVRef71mLs4AAY9nVLPpL
 /i/5uVOmMLUNLtNwZoOcSV0KjVMv4dzlp16JU9c93L7nY1VsMPv5JGGvRwiXF4PX6JZIZBj8Isr
 uUAZsvOu/iiuymAv0CcJR4R5/xjkBzHgRg3osZ7WKNJf1CMuoleuECqiza2uEwJrR9hBOdx5BaU
 9PcccKiSEJ8+Z1pnIKxqDLrQrqz5zne/a2ByaCuvMDmYqcEwFDKOUlrvJTAQWTwllQDdM9i/9Qk
 xYNL/kKMJs/RWfeu+8EhSdp1cZQlRJqkyKrzUgBZ/htqQBEdviey10BF7JJ5nb7ibXaU4AwNuZX
 JskgsWKB/MWRaOb9BF9TR7WT4cl7oCsnttIWIfBS0lVORMy5zrea0EkgLF2ddiygGUylPfPxmXP
 n4ygLXgYWLGl94V3bcs8DILcqwmOdG5I5KudplIZYlB/nj7OzzLlgsSgDksERrS7jMY9KYiPbOM
 q/qzqJICzvrHdZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: xXyIYxOJHRnSrpMZjBmZ9wgtbc_eIxhi
X-Proofpoint-GUID: xXyIYxOJHRnSrpMZjBmZ9wgtbc_eIxhi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX0ThcE9IGFeZY
 ZnCiJN75SphIu1/dO9LSYvg5vftKuE4yg4vnQK1TSuJzvyW52ic1XR/yVID6A1JWMX4P8EVhXfx
 7L3Ny/72dmilm292OTeBLrGkipjraL9maoYXu6DP+MDFsHJ8q5NwbbSY4pnKEgAPh+MbWZ5oikD
 rF6L4ihYpt3b6TccYLIR+x0eIb60lYTBmlhDLTWGEYM0Vy1y+tF9rRU0A/6zlJgYGucAO6A0S8T
 I2LcFKfyiGjeuDxIn2Sm/V7Z9Kgo/VjeUszOmbh9WEgyxGbWbM8tpNcxPwO8WPFJikdL5dbgcU0
 u/4kMn8f1QRj4BJT263fYTAC+pGm6KjYUfouoKrRnO5b6PUmt8UpwLWv+dhEs7jWaLemkcwS/Kc
 j33vl3mUE3xMU+gIH7sgh6RTdL8tzEVvxPEPsszBJjJj94jAqV8YT+WOZxQX5qvM2tI40ZTm8wD
 HnsxWLrBu1zMTpBesIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX6yRanl4AnFev
 b7o0obB0sTe+qdahHIP7VdIp8iPgiJr2vLcHAZR0dsqQGb5aiIAMnhUkQ115Gwbo3yGFHEZWOaq
 LDDghYyCdexl/t9lZ7oQmIJGTbNVE3k=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab23399 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 2ebb42906c9b..034fd320fb06 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1324,6 +1324,7 @@ &tcsr {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC reset */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */

-- 
2.54.0

