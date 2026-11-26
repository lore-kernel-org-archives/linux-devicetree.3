Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688494;
	b=kWCexcA/gIZ2OY0N3+611ytj+GpIZXt2qcrKtT7+5oai+jU2Bgan8P6uNAtK3HWHdmgA
	 2KZz0efBTYXhYMU00fe/U/+UhpNaA6i6P6uvJ7O4d0QWjmrUVpyclyhhjWVDRVuFnaX5T
	 wGuCnTevLLfrPTt07srspR97ieG3fGxJnPKzaXUgtrE5I/qTp4G6+WFrFlT43lMmR2rg8
	 HSvsXxLg1k+K9E/iKcXa71vrk8N4C+yLjUIDYJiOmQnvftvLrmkR5vrXREM9g/NdQW74O
	 NN/hqfX35iVZSEIeE7I7t5nSkb0+Ja6njqgJc2vjJByru+AxG7uuElafDzJYreU74hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=;
	b=OCfjWI02Yya/Fn9h+0gjv2667/xXbX8Qey53+tUwvRd7SuRBiOz4hnLPP1dFoG7B6i7W
	 /Y+JmEPy34IHOV9QcrTBJRujLNnjZA1Qzu4IZD8KzDRcJs9iHJD9oixAXDfe3xDv4ciTm
	 Bbhem5egLeqYUY7l8GE3bzqS0SUT49NdrCX+OsS3tbLzLOypo0h41lV0vCUfH3Z2jqUMV
	 Q+S/LgzyRciSoqBSqgPP8XrA1BevdCs1EyKdua7dPCeRzZBOC5LmDjWINfxfB9dSfKrDG
	 3VfcG2OmRfVtq5XIiB4IynpTdNWBpXtr+/W4c97ydNU/lkGyn/OKs8I9aSTltkZgvLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqbHFgF8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC7WrDRs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42A606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D42A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqbHFgF8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC7WrDRs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B82d919534
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=; b=GqbHFgF82iPOeT0Y
	+XZeZoHdnPykTJixxstJi+Bmc5ml+5CJr2OQkRQT5u49rIH/cVAcWRvmXs5EEGBV
	LiHxmazNaHdQR+nQjzMfVrTjDoQNRz5WwKJ6t02AtPSgtuTlH42tqqReTlj6jlVy
	eNFiDNJRm4uSzKv6ufNqxHtV20PvWzWQTJd96o2pHmCl54zoQB5LpYWizDwDmVu+
	jQCLNKkYzNAU/jn+OKfpXIOFiOa7qbfEWX32Af5QJcgkPu6FDr+EChtWUZ8GchYA
	h850vOGf/gu7t22sVGhSIzybOxH4LSPzs1YlOFsgBfxos1o/yprXEX07wnB4NKJM
	/FO4nA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2mm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946038e22f5so356724785a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688492; x=1796293292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=;
        b=cC7WrDRs8lOs0U7n1gfVxxxfUvrWP5mWWcow1htCpKDrD3Dp4VtrNJ/xnrjleNPfrK
         fz835Ja6qShYzqhEhfxlyc9us37Xs6vHAZqKA4UJ8e9yu5RW+1xdBGam60TMiT7x3Kb1
         ucQ2eww9FPA2/OzfdniAXU4X6yvx8HsWS3DqV5XJjswc0wIbdwVqXYfktH0G+E/GonC8
         JMYiWpmHwhKVoP6nXm9FzoDKFNP5HBOB0vr/Sd4awQmR7DVt2s07ZkkHablpIoDH98TW
         FS5d6B51ffQUVVRAGTH1JJVSQzGuFAml1EkNwUPMIzXqWAE7krUoF5kwpOt+oGQpBfxy
         SPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688492; x=1796293292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgy1czmHr+DraDMqMhHBVWGh+4sl2CDRnyRUXWQ4Wgk=;
        b=XsA3UkGZntoPRb4n96fRG0PhE09QVGTSH3WWfO9P0Q/TWVmWa/imvwf+oDREubBk11
         NpVuEpKyDSO8loP+UiDGDHWhyry9PrKxu0c/90ExQtwzgTNuCv/96ZCZUh6b3OuVOAOI
         ZhopRo67Kyjy/9wrLcb0r1h/1PrHQAb7tyvlsgNhnCfZ4bP4YmwNNtMnFLICIf8F85cb
         M+3aPVFRXqy94CSbJVQ/VbNrAQCB2Dk+vuiHJnc9mdEqPP1RDXARRjp1vmc/x9XGVdkH
         ttuh7RbVX7WtlD7HvTd/p3wSOdRneMHhfLwxtpy566HH/dFlC5eQ07Q5S7kkn2ttBU1B
         /aqA==
X-Forwarded-Encrypted: i=1; AL+hErHfnmLRoCLQWBWV2ixEfNRUM2zuS0XrY3iFNa7NdfES++cpdPhndZRQpVw57a/nOMlF9GBe6W+kwK+s@vger.kernel.org
X-Gm-Message-State: APuU4Z8o5qT8ZBS/G9O94PKRe9K1x9sWI6mbFonpc8fW98qdpiGerBdv
	1bybhmVt7DJeeaUMFQUgLQg6uX0OQTZi95rt+M8kbXu59mf5qFmSkrF6y4olJLuNOnIyRPbef9P
	uloYcBa/bkfXwqWJKGANv7CPaJhAM/av/AZ8qDFGxmy8iVvtRwd8Y2qzZW2LUNWMf
X-Gm-Gg: AZFdTZdBAb8kYwP8QuS4juLMW29l7wFrCOhLLcGfIjT0i5UFzcmD9F0msXRYcuT/dPI
	XJG4ygdVgajg34+/R/oK4n/xyXnfxcevsmg/geWY5Qr9HMC2hXtlsXpgMEVMRAiLapLpBIOzuew
	Nw5SEKL2/3ReRdCKzlHtndwJCQvKHFi1d5U+KKBCjb0fBkOTZWXN2o3qISk6Tzz8pQVbRxhpzIV
	5dkXM6oqnV2DBVMUGcFRu0pMt/WzqLapgLVExLv2/HMQKqgsMJ0fvRmOTdJ4/cqUvoAPrI46hYn
	NK6bpmua1w5bJ1lp7ltoMhdzY1ykksyI5qpHK50mVZpuRJI96WpesPRR2pSZllsaicQBPgSFhMm
	DTKgPQLh7JbWDkrfVaaAWJNw5ebfJy7sD8uJTzVBEnA3jv859UkRah++tVyKPiuAbbwW5KkuDkx
	jt8GcsutuxHEWToMGqnWToGz6n7O3Q8xhf1lQxLkvTWyD2LN5f5jM3i26qLMUuf7M=
X-Received: by 2002:a05:620a:1a09:b0:949:77c5:a58a with SMTP id af79cd13be357-949ba9ef1ccmr3559267285a.33.1795688492401;
        Thu, 26 Nov 2026 02:21:32 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:949:77c5:a58a with SMTP id af79cd13be357-949ba9ef1ccmr3559264085a.33.1795688492005;
        Thu, 26 Nov 2026 02:21:32 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:12 +0100
Subject: [PATCH v2 08/11] dt-bindings: pinctrl: qcom,sm8250: add the egpio
 function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-8-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uHIwQFyn98qCPy2uszdUoInx2MbuZrYPkNdDr5Eb468=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUDqVtzFPzs8Gezm587puhZaPUNbvwnTGEQ
 Kx/INCo3FyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w4unEACB0FHImas4WltCxT5GWqch7Uze/tLqgdxbgBsH02406mPYEgrtTl7zwNHKRf9V+phriOO
 iTJ0zuI1eZ3QjKGWRM9lAW4IiN0xJTGW2F1EOzNH5OrxY0NafuOJnPq0iMdCbCgIgit0wB9FYJZ
 9HutTwtF9/v0a0QD5OKwahSUTAizr09tDnqi79xb7lmjRDWjAXdWAsvfcHtNLH/aaX6LJyS2Pwq
 hbqzu5H5adAaFA6s8Yy8Zj5Yufpk7bwccIz2mrdQH+6U0pSen089EqDb2vfSQdljvVdPxK5wM4D
 jzu/Xj9u4NQ+PPm63/3VDaMwuoTTZlDWjk/MsuJVSlLeMKioSEOWizzrZIiE1U6Limf9xDzFunP
 0tXd2nlM1HP5uQ5KBGdGE9NePBcz69h7GFp7VQ8Y5rNOzxEuEZOd/2HgXKJcK308u0+hgyZuLCJ
 ++zg+/xJvk2F3LDRaoeQp88lXtBFYUow0fB8xqxkepIzxQfsFquCusRF8J8/7Oft/5AABl7gWZb
 PmM3ZGcaHripkypnW3MuCFp4wi09i/gChZB9UJ58dkIeT6DqaF6Tw0QUh1cnEbNJ/gEuwQR0zdN
 8gbTskTrnvPZYYTpOiV5JygOLtNdzXNwImsXpfibJn0pczbN4HcgvPPxcWmOwX3OwVMt882UjI3
 mhA95K1qAT3t0kA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwXDp1Sj8EE/t
 D5MH/1zfhDf24HFeQa16jKBamWrGiAmi3OQcZ7291qVbduUim9Dt0NXpfLcT2QB0BWKgrxEfo/g
 dtf2vsHyt+BxgDqcrr7Kmq8tyJmeDbU2mNYI/0F/fts10oxFSbqgQqOc6NYIzNoANw2mC8L4i9e
 7GK2mu9E14PIi8/xlyQ26EbsH3YMoUFrg5Y+tPm5FwqrK4ccdyOn2z6/sqyrGcRzEFHxjt+TJ4M
 dvfWzJsqam0Awtd9OTY5kzLyNo0MKn/q/2xXOdZQagCRQm18CUnuhCmEMUCBkxouEg3zzj8WI2l
 KeNmX3y5Hgbbx8gp/daFsWEQBhS+aEgI8AU4XojGTWlZioZCfCFKr40IwXmaEfs1wglnITuE6Ww
 MbXSLGgaFhILmCt0WapILgIHEhaEvXvizzngCdxEa81SbtoUXOaVQrQd8CTlLnhUkhD4yiF50xB
 I4SEOUIqDDDnDPaEqKQ==
X-Proofpoint-GUID: U71x4Jng49xPhldfeyFWANP9mjAUkV9O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX83dnCAFikDCw
 az0mXm8OApWe36vMc9wOhoEWJbVn9/2EmsSu72A486qQ5+rBhhXBZTWrwInORUrHF/iyddnVkJG
 h0xdwVQsTBmGMjm9N49p5I9VZDHJe3c=
X-Proofpoint-ORIG-GUID: U71x4Jng49xPhldfeyFWANP9mjAUkV9O
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b08082d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2Hlz1Ra-QEqM0uTCcOsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The sm8250 TLMM controller supports the egpio function but it's missing
from the binding. Add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index b11edbf8bdc05739a34207be561c49c95c64f221..482d98c406bf661788c13ef360260a024a90c2b7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -73,8 +73,8 @@ $defs:
         enum: [ aoss_cti, atest, audio_ref, cam_mclk, cci_async, cci_i2c,
                 cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4, cri_trng,
                 cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
-                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
-                ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
+                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, egpio, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
                 mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
                 mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
                 mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, pci_e0, pci_e1,

-- 
2.47.3

