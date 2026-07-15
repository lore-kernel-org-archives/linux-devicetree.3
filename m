Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FBB472784
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122187; cv=none; b=kM/oWpDu3XCP5krnpzlNwfXpW0zWsHbR01WgXYZLX1HtfUQXTAC8ByS5OYxb+fvYfeyKsAt0J4QGFy59OU2dZOmqbzOP0OraNXqLG2H50i2CBiVG3eF7FhvH0+ZrMuQcx2HFz8uqZ7MNZQyh0saax6FUbgpM8706oW4/h4f1T9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122187; c=relaxed/simple;
	bh=TI/gyrgYyEz8i0ey4itqHCNeDUaKAi+EuBFY1yy/AZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDuhM5gFsR0Le4wUvM/cxnjM7mhpl73Xw42SiKXlVUtVtsMIQ9zl64t1KJMVLwMhA7jmr/OPiTOTMk/PBTpGVZ0mB3/YNrO61MjvitsAfbzzCGta+Y2E3a5nybqndCH7WBIDwAeie+AXxPNf4cZ4pHjW1LraZugMMBK/RV4p8EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLsNtj67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ef8QC93k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLsNtj67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ef8QC93k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdrvM3601156
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzZOrKAt4LK+OFMk1yB3XTUxJCJnJ6As+g+ylKMvyqI=; b=NLsNtj67uCMfZOie
	zFAh0G+4gmh25fIN/IwmMgpL8jbwInCC8AqR9uk294dzjSqLCMu0DcMjKJteuFG9
	6XQLBfCoIKKCaSJpqOAfq5zkqa29nXytiCfh1Fw9M3Gc0Igc2bDWrC9h68Qg7rw0
	EvDzHLbZzIVLtrXYbMd+MqCcSU12qxZaSKn1yD9fOILk9Tmjrgto0ULUkC7K2TNm
	V8EXlYSldb0oHSu7m2uh/cStJ5xvQ/AZnfmYGzpRC1LoBQ//lpUzVDGFx2yGWq6j
	VJS6HB+YpJ34LynyN5u/ifD0tHYPlGrRjAI1at2wKX86FCh7d13daA8qwPFL+Mdd
	GwG7cw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60uwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eec6acbe21so127778176d6.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122182; x=1784726982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzZOrKAt4LK+OFMk1yB3XTUxJCJnJ6As+g+ylKMvyqI=;
        b=Ef8QC93ku2G6Eg+75aCshR9vCB7wGZYiMUlMPQrskKbIXQBtv62ZeaiQN/9h3HzSdq
         mP/DbC+rw3qREUKV6xpRSYLYeT3BilnzAlnSWpKXnNDj3lkcoPgx5d0o0LB6qGfistDv
         +q/ndeGnGsl9JojtcDjC14cJMzVdSOKGHJZ+1bVgt8jstRsvNSF3GNQ1ictek26GMnio
         ubUm72Q1Tm27UEuJJB+S2K4UpVLlkBqLBnTNwcUnAtGwxxqfh7frGDmhJ2AhkQC1FbHc
         djTJqpVbaQUyGfm86/IoWCEaJOw/0gMxZV7sYDLWVhP68Y5+loglZE6vuicZ7fXhkSFN
         3bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122182; x=1784726982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzZOrKAt4LK+OFMk1yB3XTUxJCJnJ6As+g+ylKMvyqI=;
        b=k8DAu9ZclUCt+vY9fKclpSY6R5RB+o59e/w5hSJgtuO8tdr20rR2X0DSnES1evcf2t
         TGWT3bWH19wyEdf8EGlxwIRGsf3CmYgzldFgcNHck2bt6LCdqDpWODgmZl7Aw4Q7vXqu
         0cqj4fGn66bq6LRlhAzwNi0sfQqA1oI9cHP9d1oxC1HSNUM5pSUbFZnIux9NGXW8QD03
         kDXhSJ7EqFXxGyk7qw2tw3jjriafhzREXEGhOp3cKZZ4rzGA4AMXfTqHfbFgViOmQ8JZ
         fASKfuWytj/HB77/EkyaWD4JdNnZZ3J8huTwjQpb9lB3EdGiRK49y1prQYgSYxGYcIp+
         36QQ==
X-Forwarded-Encrypted: i=1; AHgh+RqB8OPhlTk4zMPrkCzl2GJrSBWHF7kxmlIN8J2q+TQEfHdwoimA5dcJxH09IeBGR4t1Ob9sw275VpN5@vger.kernel.org
X-Gm-Message-State: AOJu0YxIds0Y7phq5jhUMhA5w417SyfqfncaPSyDB4r1AjrGUHLk/Qgv
	PJZ0jQ82RYO+pcAYvxdOh7gC4dKtEyYDiD46z6NPqjKlbcnCfWgvXFN6RDTo/tQJ3Eh8ZU9d3YY
	ECfgWO+WwbYaxyMZrJnc2a7jh65hfroastna0DKPE/PI9gJZraxNFqVVOqM8mjKsM
X-Gm-Gg: AfdE7clcLPeyWQ6f13cuxq+G9+5v1HEkAa98VW6CtXUzE4RNHrW0y7PT745zukoQHKm
	QSDrKpHE/Dh6QCYAB6Xn4rfbflC20XI60npN16TbcQ4AMe364HuPNBillqGukoCgglzcdGfX5OZ
	UWpNhQZLn46I3zRHi622yv7eApluOjaFxEJ7rp7eAWBj/u9p2U3D+8+6Lta9S38wv6VYRf/MTjo
	hbrEGfs10TfnurU4lT/DGDBv9vT2mBmdtM3LXvNeQ7iMVAt8DtESJaBuSPwQ0D2qtGRdsHDnn5q
	Zo6UWpbIdBWmcHb6XXhkdOktEo4gGVdTFvC5nJpXGFv69kd0dUyrG9aHLXFjZXC4mP8cCXeItvg
	Qy/N3PzuBJPYiJ7w=
X-Received: by 2002:a05:622a:1115:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-51e4effb2a9mr27156071cf.29.1784122181605;
        Wed, 15 Jul 2026 06:29:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1115:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-51e4effb2a9mr27155431cf.29.1784122180848;
        Wed, 15 Jul 2026 06:29:40 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:16 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add CX power domain to
 GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TI/gyrgYyEz8i0ey4itqHCNeDUaKAi+EuBFY1yy/AZk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s2f5gUaCvhgvRPOTTAzerKP68tO0AzBGf87
 kuHHMb0HFOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNgAKCRAbX0TJAJUV
 VhNDD/wKtmNqexfsK16cK8uJ0dSTT/q3Nr8z1KEyNnoErCJ/kLJNbeIxT8tQUm5KUFrg7mXYK+N
 xN3S2CNSBkAqF4nH487Ii6ZqE3xY6o+PpvWlFK9o8zfdh1ZLvKCOP3nEGkClkWtJGGnWy/DJfI6
 DVU6IL+oWzcUNxQrvLEFI4Pk0ksMRzPOnAKlpgAs0nHVJeeGyMGP7akXzcBJEohH1TgtjMMTjBG
 ibsmg9hWpTeKaZNSjPXyE8MtsBz8yXhDGxurNH9sAcfWyHOabjYfbU4AJ5mmsUkHGcx3zHT/vXp
 y58RHnL3/xpaNzOfed0ekcrchQE1/bBNGb2HhQLS+sxLQwNvAweKA5gZv7nB/t/5W3xDnAz/MCA
 LyIgRCoEt5Lon4J+Gm/stD9D2cNgJzGqoYonmANDZeWbk1IBgb4cXRlp7jlLAV51oa/mcaFPnL3
 3b3YLzvIf0csdYxSp0fCRTv4OPYBwCIYx3P0gob5/677TfESudx63mgF3b2rC82h8ocIeRZHZci
 zqv8XawD2pF394LRR9jceOv25uc02W8T+wPKhkEZZDPq4t0KowJsiz7iOBckRvD8z60+/qG+O94
 U0IogF1e+Ogo49BJHqK35SHbO9IK81P3/DWBjCp6l9l3fIHuTmKwj9rClsTXMsf8ltSxIKjZa0V
 X+JTmIT6o/8ZBLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX/xFn2Ns9FtkM
 0+pM20nxMeKhzfAMqR8gkIRzh48XOV/4KKIe5hqOeArLJAOCS22elFRFYPgDsYB3xdwmkwCcbqZ
 6yi0vP80FhoFkw4Ut+25CG1rP6M2tic=
X-Proofpoint-ORIG-GUID: exdzWGouMw7uswjGAqQSwF4vl-Nn0lt9
X-Proofpoint-GUID: exdzWGouMw7uswjGAqQSwF4vl-Nn0lt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX+AI44d9+g5SV
 HKAkHF/DbyMEj09U3Hc4muDdr+bX0N1LGvTnauejhY2N5Lv8ER09lXurmFozVZCrji5wU3aEZrO
 l3vDhBzTH4rI8LfC9PdNkNWyGAp9xrcm9DNf1uHq9MmQyzf7BLI/RLtyimrL9dxcDfaARbcMfMC
 RxumjXAMoczB/O/c8aRncSQ3V/opLxWwAWhfwPjKnXGppzvndwJyN8fCzs2WnowLjhxnc1/JVeu
 xJM9SaW9pxBkXQIIYXjVMfikc473YyM2evsni6iAfjOpWypJ00cu+gfIh5c+bgqxjNX1PoQfapM
 xVEcY8OqRa/zN0QK5uBQhfDx29xNXyXjGJB40o6VuKek3gq9Ir2c7/L8g3FmN0ljGqzv5AQSujz
 sYcajPc/NtSZ67NBhq/9MAzxvJredN6Ww8k30fdXKSIVAZ1GFK9ZeNvUwsRORfBz7gt8T3bG7Et
 eN+Bt3WTB8SPQj5xmJw==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a578b46 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150134

The GCC GDSCs on Glymur are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..db2d5cd3d98b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -829,6 +829,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

