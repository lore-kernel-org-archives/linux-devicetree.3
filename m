Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2338480320
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203123; cv=none; b=qlry+MxcBZkjCcuyFr3tO3sCM9rU1xW95qgCV7vB5KNfchHt6p7xgiXIYnoyu47c+OU9gyVDf/65UHjJUYsQZ0Uu/S2LQb7p9owir68+mLQ9YApYZt7H1Znru5VoVYmVicmBfLoJn0wvDnuuO9lxTwZ/i/ENmsh4a/f93w5JBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203123; c=relaxed/simple;
	bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNm9wejtDvskHivog85I5c/uJazG2SLedmKrcIkVjIwDKcM1kB0VTtQS17vPWwpF48gfGfSEHZ014Sj6XPzbAlWq4nyd4b9XPd2AORnJjMTNjp7jGhEYLpHGJLEyEX2Jjyf+ndSRrs5+jFbcC6snYqCpBZm9wVEPhbPy89Zh1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvxnH/Bw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5sj92pJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvxnH/Bw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5sj92pJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFZc21726933
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=; b=LvxnH/Bwik2EhgZo
	cMucxqtju9k1R4FGbmT2LP43/ZeOyuhgFuyxEvJCC3oDxfRjB4MaDXYo5V//0oaE
	LrWX+UA48Y4dHZbovHduc1LXQIbEFcaBZSQya8nGsA9FiJrja/j5SAcIDfg754GU
	Pek/AUwdkMVbNdKldQTBFPjWdlq+Dcu2Q6FTuqcvfpKsn7BZBEz3PUw3hzKyssx1
	CMNqzh+TR5mHQppdzPPBNrvX+oLbMpl5/xMMcViNk3T3qtUGPjW8ToFeSHqlS4NF
	H/926sMqXmJ9HzPXerks9M6zuNG0rdTyXCl1VfhL4PlmMtGB6vT8XBiSbiYT3CGt
	hFog4w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs20hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:25:20 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-823c86bb798so1422589a34.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203120; x=1791807920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=J5sj92pJagmr58kJvoZE+kaMzyIzk/beUV5wzQuxu2grOjtx2QtTOXyKxX4idBV3AF
         8+nVwONsodwVu4pBKh9uwJMDPjJeqxxSAxcoSoNDVZz9Lts4qT6H3bT5xlVv+67E/SOV
         ecuv2gJMcvlE/9hCFiGgil0mtBCzghjan2vqUwYVzRFlMcsqBlkPAine5lE+Ept0GXYH
         KO8kQ/k32S/SiY+YqeyKoq8o2OUaxwG8CmbvWlvplqFY0e4/7pEd3PA0kxMOZGv8W2qr
         +XxWxk5VixzPQPGGrUQn4bCCVzfvDE66FnquTvYcu6uvt9mgDo439zLaU5LbJLeMeyO/
         NnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203120; x=1791807920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=zbFgcaTKfNCH+zGy/lXDidIr7iKrDABa9h1/bF773FHsyBg5yCf96fC4Ef7gPV8Azq
         qv+GjgN0J3PCjfBG/071sCp3e0hbzp6ABBjYmHG8RUqKMY9lE+ztCnAVNjQqVdaxnsyo
         tM2801rP6JIUt61Zot5w7Mj8kurCL0ZdxqMVGbVKHgD4qCvYG6f9VRQgHtWBr2loFQmk
         J12OjqSMf/FTnMVg1HvR2wxQoFiXkhJBQ7IMZZWTjM14BmRm7Ci3+O7m0v8ALNBsNJHk
         Hk7yvhRPZO7RU1DufV4QMvIVDy3qOrLDgvEtNkOZIPs3XGzqafAlsERUop3JBgMM24Gm
         SYUA==
X-Forwarded-Encrypted: i=1; AKwUvBz7yq+rLlsVn/TAK5oDKuZqKHZMNVueN06AfRB8oexttXCH2rLW/ZcDLeyVui/od/xlFIwy+4Q4l29d@vger.kernel.org
X-Gm-Message-State: AFuF++nxH4B4PAmgJNNCn1cEkKuSdgGdnIXqg7r/SdENoG/qZM2YWvX3
	N+S8OWklnqc+BcdpwoaOxV5TyiIz8MAjCV/+xnoRicqEt2nGwG6nxw1Y4z2/6yDXR0VQUDpM5e3
	UiQZBVAmwIdMWtg6FSkS9cHcoyYhLxcDNe9ExJIdEoCiexJth35m+uaXKE/siOWZM
X-Gm-Gg: AYBFou23tWpBfnTTzsr1Nb6A85e7smKhJC1lFgS5Cb4FPPvtF+pNlqxqHWFTsbrHS0f
	RuRTTKEunTW1ViPI+5UE7SnTxILPO1NUyLHeqpqOjhexH+fmVBk6sNmx5xTybz7NJ2vYEQJ640F
	LPBt52EWbBu7l0BAEElPwxpaABGY+EEap/yL0zoK1tRrMJnEb3CKO1lqLHtbqD0vlysQW0bng9v
	o3LtXAZt/1YUeJQbv8Pq84XWy7hkoMoyhgsN0BrETsaX2+/wSxWCl7iQxf74RWhOZ0jhF4sf9Jy
	0wf8YpERgrfmAPjOVayKwVez7WaaD4HQWr0mk6KoTHlj6VH3dp7QkfK8+wip+mAy/MSMZveaZ6z
	9JWfPPqV01ECLZMIxNbHvi1PdflAhSBZHTg==
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374444a34.0.1791203119919;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374425a34.0.1791203119382;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:06 +0530
Subject: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1220;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
 b=USfjZgve7IwAll0Fc3jaXO1yeYZXW0dw4CRX+9heQYvw82iWdkDm7r6PnwgSJ0Zb6xvXTv9Xn
 fiMb7YIyXn1B37ngJCt1AT9ZnLbbGQdMOjK0wTOh7Q9BnZzT8VgC5Rn
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: SJNj8gRr2Phpq2P0s6vVn6O8R5231l2g
X-Proofpoint-GUID: SJNj8gRr2Phpq2P0s6vVn6O8R5231l2g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX1m/yGBRb1H+X
 buZkVvXs0AD6s38/9bZUvzP1n9ALfsVmEVnFPlwiEnt3aTz9NLWTwkGZsZdi6Y0iM8FixhGeZV2
 wQAh0fPwXcU3ZbUp4irEesF6tIBDcF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX1YQZEonE2mf8
 12JsPAxqH9Kzf3gagWWlJpfOgBakArBynWSZ1lHzjd9SZMlXX1WXDI4eo/zVLKQze00bwa59IJv
 JJq4RDgcAMBYCWyx/4WNNPjUAoh9f+5QQ/ps57YKg8D2/t/Ax/9TDvW334TyyQ0PPNzfzgGXxXg
 WyNY1I+M9PqSOAKq+As2s5XA5GAF7q8t/7hli7toCcfOxZVURDa3Tnqyi6tmfVustGlWf+trMRi
 1xj6iNKa6dUNNF2uGpEPii5F3XF6lOTE4QbNv7PNKb6s+eOWeh16S8K1H/SQz6pQJJX2hZAmQ+9
 lIC27ABpahD7YaJ8u0b2yvAscmpjXJqpVsrrBqCULKhdsoe/iXDjie1MpNr6jgVhxxQLUf9jgnq
 Us702peZ8vFdyUdcOV9LWX2R9fNuvbrF1rALMzjdHso04RLW/rC9oaDyyexbqIonWy0fh+dZhBo
 sImma7xK18JIp2Lm9yg==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac39730 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..9cc734001a68 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

