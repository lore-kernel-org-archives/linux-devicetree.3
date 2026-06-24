Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709D33F5B0
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328165; cv=none; b=he0nZwmgajsLm7tocx0lzsxC+EWtxusF9diSamWFA9Pel0KrmtUfKIQsiNDSEMOCmk9giGihvgNBtjjT3mcjP/X0OSsHpUmQSdJX62lap1A88IKCFx9H3k/xxe3LadpU6qsYypdGL1s/WqDVEqP3Pmk3r7ui+WRsqvJb+ZCcvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328165; c=relaxed/simple;
	bh=ljkxxdkibHf/zG13tbBNZF0bPNJtB23442nbC4IkU54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RS71qP4fgq05Zy9txvW/3VB7HENoJHLemABEgrCckDJWxnJmbziw4fgii300IRV3bqpDUQKmq7FXW/4xvgeulKPbM5rGYccthBC51pfoBDDA7hOZykfUDcc/UiEs3RgwrNTTyc7/pipOeXqkwytW1Jiv95CM4yduNGkt4//qwbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4vFishr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTvFWU2a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4vFishr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTvFWU2a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHiqmF4032561
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hIPF7nn3fup
	mBAWrRVX0ZLNwJtzwsq/OA/kPq2MNqW4=; b=M4vFishr5M2279l/H0QzTbNsaIe
	9CrYX8dK/kP8TDuiuWF/rtkKVMpPPy2aPzg5K6KsW5BUOSKn0dy0MR97ha+N3TIX
	Fv2lf0kfPrqRvQ8tFFtFQPaSKpBTg1YaBzmqcCHuzHlfJDM9924sjn7jGfGnUU5F
	sqN7g7x1ZB2ggQRICA6MNUuTOA1jwJL3uKVhJndcduOonOBYRc1SqlOSkL2GakBQ
	ghkIAka7tkeIQWQA1pZIolDshdCXSF8+ad+Nt3III9mYKe8DO8dlSqJsQni7xGos
	rqa+UaM/NeHWXh9uEz0xy1feiBbx4h3BWAJ5KhDijIODD9p7Hs6Yf/2MCxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar3unx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8923722247so1629769a12.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328162; x=1782932962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIPF7nn3fupmBAWrRVX0ZLNwJtzwsq/OA/kPq2MNqW4=;
        b=jTvFWU2aICKAcvVvInL0CMJLAHiwgCGxSREAzMjUCXaiWKbJ6TWkx1hHtdoSKUvj2N
         jMuDitv3Mr9icqbdqZ+4/3k9OvbKxZQipKjZP9h5Pa39DhEL3OAh+Qtjt3B3cmYzB3Np
         9OQb6ibN5vc+6N+QYedtrcuuDj50U+HNPyVhYADg3x3YSXjtOG0FqoIn46Y2Wq3dV42Y
         PyL1InjAelOg/Jv27Fa2LXjuHukilcU0X696u0X2PMZplKMlbH72tcD6cUBf8kPA3L0S
         pwQ9BkQkucPpKSM0iBKsVgI8TP2D39KcGKci76efBIB5t3uG05q7+D3VQxWjBqEueAdq
         JytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328162; x=1782932962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIPF7nn3fupmBAWrRVX0ZLNwJtzwsq/OA/kPq2MNqW4=;
        b=dP+4ivSAFffyolRtGLZ9lmCg4hj1uYmV2blUdwx3K4gwhGi92qiKlcxKxC7RJIsHYh
         tQD9TaGYBAmzA2EZSTJmUZDkxQERithYVU5QH5nIlENTKV0KlcbHtaVg7LlocdO1QndM
         yNeD1FR7PaoPSaxxy8aS8Ha0dE1qKlFGQRElPKbAZzdDXisLGtfhKBtH+ez+BJzjz5IN
         nlPu+hwxpDFnqVcLFxoRs139cnKSPwoz5LaOACeFMSDVpijxJXxHqsBgniSwXPnX5nqT
         fREaV98YaWbHz/BMEed6GjQGguxWL4s0BmlV+kjsT3qiQg5FIcvQAF75KOs6/LR52zTc
         Z0yg==
X-Forwarded-Encrypted: i=1; AHgh+RqNrIVAXeImhSeD5MUTzp+hnF2Memwykx51LlLkhgTBh8+QexXUWADSBDxowRCZ9FuRRqNZor2AuUXk@vger.kernel.org
X-Gm-Message-State: AOJu0YzjCO9xaIA4PyYmQUBX/h6tITXmxgu0BCC0Ly1ia3kdjXVi/v2S
	MPl+s8THGad5zrfP80mA0/+zD188HkYdWY+IFGy/7nPfApD09Ql/2/DcHxHjxEmPEEH52r/atZd
	UxJOux4Gu87YfjjqXgFM+FdGxh1WiTwuTPPswaSvRYeZ1EzUY7IZBFek1f2PfooeR
X-Gm-Gg: AfdE7cmng++qzsx5DHoxxgwERYKQJyTiM6kG5frogkI9oj7n+yAvj00IPDgBQgBPAQY
	1FGxfQbs2cMkOJ95sFvN4geVcY5bWwVvGh9zk/rPAghFvMy/AE601BeNr3gMw9MY4iEyReQR8G2
	WTdxDjnVmVgh4+ZlL8jYAla/9RIih1nG6GZSN9HNp2Q1MkIqtEY8QvtGhVhy0PhG5bcXLvdn1dq
	Ae5A8X8fqHkjzyLuKl+pX+2DyhhkUBYp3oPxhiAt26w2OOQg50DEN2scN/Fd7xoJPALiHVGik0v
	k1aJr1dGluGluAw6hUGgSHUkboO0BAUVP+U8gLQeJkIeiH3QUM6GzEm+TImI5gSTLygg4NlMHAt
	uu58igI9R9uANHQBUFgbg9Feladjhg50xptt1AA==
X-Received: by 2002:a05:6a00:f89:b0:835:532a:3468 with SMTP id d2e1a72fcca58-845a2c015d8mr6141770b3a.20.1782328161726;
        Wed, 24 Jun 2026 12:09:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:f89:b0:835:532a:3468 with SMTP id d2e1a72fcca58-845a2c015d8mr6141720b3a.20.1782328161083;
        Wed, 24 Jun 2026 12:09:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 10/19] arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:21 +0530
Message-ID: <20260624190830.3131112-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ow0XXF76qocp9rOAHFEh-0ssvj-wpByg
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3c2b62 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Y4MF9b6SBr3vJwSF5iQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX6jZeI6v2tZzI
 CAJCFYFMvwuFkZ59srYhxVq+qLfltDSUcQ61zEqMMsRaJdRJanjgPOTgEGzZBqE/WHFSCKwwea+
 9p/4Zz18xCHrjjuBlzu0XKU5H9ULbt8=
X-Proofpoint-GUID: Ow0XXF76qocp9rOAHFEh-0ssvj-wpByg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX+ZBm+iv4VCUJ
 3LVmLpZK6WV22FE9mxApUMwit4a71gNQJqCFHG7BrKyPkVAkwBa0CBG3jyXqfWlD7r3IvaMtX9W
 3DjESaVTBOp8qHkqmCMAKIsNfwGR0p0UhqH4UZDvKoITpOuOEbZWbLvb+F+f9Bg3fZUcnN4SH6v
 ELhhlvHd24mq49wz7CrGVj0mSULR2hxebor8QhdAqqHS3un8lnidIv9oxWsRJ+voHbRatqy+lkL
 WDW315W5+zNdnyn9UJw2oQKZYyBmJckbkc72r++8qJl4MtRrp23DSn/T0UCcPCwbVe5exsWcBf4
 JShoEbhSOrxrkqZRydojIN1bL2oN+sqbbrHe06o2bYr+t+5mb4m86VnZVBK5m8FEbFci/kkss65
 CJkBBrqV89dmds8ishqZ0WDHWEf/HTHqE8h7O1/dvk2CS7RjfwVUulIiXMGIFAqzCu/MQYH/iFQ
 8x0nZgrKJE77Ne2CWKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 952d4270d118..0c6ae3ff06fb 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -171,6 +171,7 @@ cluster_sleep_1: cluster-sleep-1 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-qdu1000", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -1369,6 +1370,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

