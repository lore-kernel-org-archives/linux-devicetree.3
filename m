Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E288A382295
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665613; cv=none; b=dCb/0P5qGl8T+8p4Kz+idSwZmSTMBY2MZQ5due+/u0tbDYo6CbKg62WKOGfYYbBmySthxIgnQfieg6A9PZXqhVH8agCUgozhxgq8A+/Y8Y5dGs4byr0Pm+T/0sy/9umUIxOseiKjZF5gnPkQGk99ib2MzlqPHYdU82wpVeuv2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665613; c=relaxed/simple;
	bh=nX6Y82zzESPqhrrlbQlA1NTD5phO4pdq0SzAisS/ebs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSyloHj+ApVVkCXWf/L/SprUa7xTvHHqUSTS4bTSaaRnGYvlmvUI1+gGDS9bZuh8uqwdwb9li1H6lGaz6Nn4ykl/cwEZvGK7ecQP4vZ1USuAC2L/2qs/RRpPQN4jYAHraj1JVFhbb4WZ0n9+MwzZ4GKDD15jugfFUznZWSf6pWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GngyPDcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAACeGyW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GngyPDcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iAACeGyW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K4qC5S1843753
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=; b=GngyPDcq1Xlv0Z+M
	7i81LMUSUSpiI1gDp/sbGVZcv0j1cXNv2LV8QZeWhhM1Byz/L6Jg10yQDVhhIfMb
	zBHFsJsYYih1GwTBHa3JL1XxVTfZDhoV7Wja7WGosFeLeoiIIw6h4m0yRSQpV4U9
	QzQhcFMdrqJ8h69Vo256BxgpxlLtv5CJOMF7b9Z0VBgu/Hs+hRsy/WMEgHDcdE/h
	/Jg+G0MC85K/twJWOAXgxkvNn2mYRbTU6STKlFWdPaesLQ8C1pegTTrW0iwTv9Bu
	A90C61Yk9aps2fNTvkUDW7pSTlZmUWBWS8RddEgxtwcenbgWiiI8kJZhKTqi0vqa
	GtxbNA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388m91n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f07078eaaso2107351b3a.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665609; x=1777270409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=;
        b=iAACeGyW6OU3h1OVZqJSPg/QBr2ytPZOfO19b8NDxSCEF6FafHoVDg4BtqhxJxWFOu
         gihX9IbkhawCAD13mLh7YSk3OB1n21hRJGpK7jAiZLCyRrvrCiS59vdKUbrI6EFapA5/
         acoruPXqHHBlNrxR4rXObXNpZ4C+mfWI2EDbQDJjersHthZIao963fgUvuk4Gv0kjdtG
         NLm3KuUk1jth7R5bGJ88ZQyfjFgGcf+kb0UGNICCV3YGewt1mz9kcRkFD4Y1BFdapU7P
         RDkAhHgENGh1aGYwKtsrw3HfF45KvtnxxWVTY7lm3sz8NHcM0mBcHNndfCvCKU2a6LQY
         DoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665609; x=1777270409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=;
        b=rVwekSGTclQBYjDARZZfU0EO+VqQ6oCisTVRAy5idC2lwyEoau0xCPRt7Va79KKIdS
         yteCUqR47cKWLGzDQ0OHCK16z+/GJLKj5uX3aIbz1tZZbJyk092H4yeFQefjL4UyocX2
         ZhxqIdmSa6weibuvVNok46OilUE8qXGXVrgz7x1/DUPwDl1+6j88E1F9LfKZ86T9IbOf
         e5zB/xEwBKe42fytVOpfG5QXIVEjnVmHRj9UdKgKGOyn4qkti+c2GrXVGunIxTPg+QEd
         g6qS0eiL0jqLlJwmQ4P+ELj6fZdlW8+yhQsb5dOePNtrhpDchp0fSEj8YHsrQlw+A9gH
         g9aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xK6ahKIKLdOQVPHs8hc6z/VL6QjdgcEN/TuHN6dFQQKLrM21gV/2pDoP8MZgSHjvzzVougPVXKGQY@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHugebl0RVmFu1uKTXXMSG53GF7CsFHtNhbOY9Sa1GXZNe3dv
	6ctxncOYp5knLm6NVYlcBnYFcnQOcTLZGznEJsv4sy7s9Z5riqJd/m4LVVB/tVGa0DEhg9xy99a
	MmLQ5H3LkspC5wvwyna3t9TRqkOvnBdRn42Y40P3hfLNjPQetrY9Hnnrxh0rz1Pg5
X-Gm-Gg: AeBDiet4BUhHi4iF3OpFIKudCqfh/2JIU4WdRGYiERKU/5znyAkLGtcQ+8muEF1LY6A
	2bl/C62X6smTwba4sCqvMFi5QQoqfJVvI+WRb8+iCw3X1HO4P55PDVz+cmMp0ujmwa8LR7ZDIuc
	KaPcrVjo2uEiDbeO6Poxy+Lx5noBnLXVpmMHC8xyxsA0t/4xltbeW9oDhZbZFJtrJalbQpkM50k
	fH+NyGS1AZJ0rhaczotgM/WpQyAf0q4kh2YtPRuvLSIH2Oe2KCkgsFaUGqauVO35wpqMCeDe9Vz
	ND1YW1jlZdUOcUCdLsSiwFE0OwZZ9kW3hhFRTyivlg/KbQGjSPogQHlbdHN3TW4NHDOGPfe+yA7
	LlUQwiFEihgj3H/OKtFYyY2iUu9DlhhvpYeOYjFFql6Kerv3ksbZBGDxMB5amibBX56Nn
X-Received: by 2002:a05:6a00:27a1:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-82f8c82e219mr12829926b3a.20.1776665609559;
        Sun, 19 Apr 2026 23:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a1:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-82f8c82e219mr12829883b3a.20.1776665609062;
        Sun, 19 Apr 2026 23:13:29 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:28 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:52 +0530
Subject: [PATCH v3 5/7] arm64: dts: qcom: qcs615-ride: enable QSPI and NOR
 flash
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-5-7de325a29010@oss.qualcomm.com>
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
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665582; l=1047;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=nX6Y82zzESPqhrrlbQlA1NTD5phO4pdq0SzAisS/ebs=;
 b=+Pf5sKpqS+UB+n3HfhmUCJlJHmLgfUeqMoJK3bbIQ07qCTG6SuEdv8fLwUbm0A1NwbRiFjc8z
 qfUWuQvE63NCquTcg7w+m0EiDhz7caXTOFw/ERSpAY0ofEc5thkT+t0
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e5c40a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eijpJye3pRbVNivL--0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: H6DklFwRNwNc6v1N8gSbhtDXq4uSHj5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX3gU7IC6jhk2d
 QhTiKVPnLp50EmEh0kZDzuKuiGn1G0SJY1jOpgp3yU93Ijp7yq1I0Ouz6Cc0J2Wn1rhQIm4xtP4
 irKmEBbsZCx6/lZ2svld492DFB7wAlu6FDbI7kdTmnLVLi7WpuU01CzdsMp8fPMn3IJt8HZyW1J
 J3Fjoi6Cdh69ASO6fxnMAwPaiUhCV+i6F1ZRCO1BLDV4SoRflAcVpCJt3VX+JrxxYlCulAd+/V6
 j5+bqXTtgVsnJKOcFDmx5CnbcmKWbQpQdxYnD0RTyVQm6kk3ewZZMhCapf9CNYVa5mJly0FCVAT
 kGtAcJOfljKN0lzcL/xvpCmR+EE4oe5pdXzUtokdHJftLcAsRaNutCvVSgbJD7rLlgvqjJYJYiZ
 Lq4tEQI8MX1dhGVUowpTZuLy0p+kSISRW0FD52frvjVyTQWgaIkHCAD7SPGCNuxj3dcRnzLr3qn
 0Ly1uC7u2rLOXLDLwnQ==
X-Proofpoint-ORIG-GUID: H6DklFwRNwNc6v1N8gSbhtDXq4uSHj5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058

The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
node to allow the system to access it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..b096d96ab220 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -516,6 +516,18 @@ &pon_resin {
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1

