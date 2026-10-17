Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8318221DAE
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213129; cv=none; b=Wb1OURDurbyAoRlPVyH4UOvEfersQPMzaDytt31NQQ5nwG96nNEZG4r15ANtmXC+8cvBdeExFzmd3TOPNRThY4M7csWl4iDYvLTeJMqbhHrVi/Q4PHnDrRqzFvMAmcNpaYCjS+HXZaUfndZbJilQGVZUwLkK7pfC50tvJb3jZlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213129; c=relaxed/simple;
	bh=3qS4oD30KOIpnI14tS1ndzMw3Vxps/onCRIRJ9iaB5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFgcm2H6Tka3R0OAyRP0mgQ/jIvzXF9oT3Hwi5glTi6hKJHIu0RMz/wqUQ2XUmVs5nuXMosOqhaFKW5RAxxTKp89uuJF0g74TIXC/JTsdXCdZ4CZJcDVaXxo4LRAUq/Kx4ohyf8I3kR1y9C7qmOmtF3E+fJVW4KM2icOjinKP34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/h0ufaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJ9AwRqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/h0ufaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJ9AwRqa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30VcI3780479
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HWHYeNhquwj
	AsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=; b=Z/h0ufawb9ZTPX/NIkHL/gOcQtJ
	nzGdDJG2R+iFJl8X17T3ad6BtegsqokA9O/m3u8WlOHcSYaUYWh6NgGMmkY+gQJc
	NRpLtjYA0ZSXuGXU42GOQByolp2YxvIlK+1OCndDRLTZwsQXFFwFtHxI3KPlV92t
	TTRndSwYWU+zQ94NrluBOIBNCnc/rByl3OinjH9XowrNNXNQu6RTZBcDNw7P6SDx
	iI//xG/7MEz0g+KblBN2bgG1h/7R+rCOeVfUIH6Tj0gfWSjgu/3Y9OZF2B1GXD24
	8+gtWfpBm4yy6wsUwdS0U7ZRh5Da31kWExzqWuquKfQ6PO8eEVVwrmKtV6A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgg7qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so2144661c88.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213126; x=1792817926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=jJ9AwRqaGahM2HCUQh65+XxH32TS3yENLP+89w9ysHbzolE0PRJJ8ZjgsaLK0s1M/6
         l26bgmstWuYwdcG2llYqfPzAYGJVcuiKjp6M08bYsgtdfV0SoS7qUyoOlvoG0l+Hig+Q
         AK/6IjCnWCeHUHfoFS2P2eR5DDdYzKwwFIPVDiQ8yLf3020vhQx3/zsaX5itFwqDfY1g
         qD69JvuhQBMMsTaT2DvNweS33dJFFjknG2mpubV7jeKFk9pW35c1/AMaGHgaz9okvSRH
         Vhc4SOEObvicCHhRyhiJ4nUDkGi15m20QKvtM00arwrQNWnYPxQaGt/+S+0+3pOmb7ba
         wDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213126; x=1792817926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=FRtKEEcSCVduT7rUmk1of58DUpe4See4R7Za6DHP9rjRbOPMgIiVE+M7OGofLgdKyq
         WLXhaWI6RNsdDCToFtbRMADzPD05rHuGOfsmx0Mf39PJqW6Iio4E4FhVYYkgWwM/vP0Q
         E2pinXAGYw2KOJNJrbvmPLGqXMB4f+YLjmZUq3rRA+mRlcJUXMZwJwqsON8GUqZYJhb5
         nVdfYbz6muTv9dnCnqeT8gJCbLwcfiLdCFcd1TOUef+t//yI4Ocu4gGOdtdEjivhk/Zj
         BKYMmMKbV1PkarkSMgbCw4Wh6/K9CCEtqE4P8lHvGC3wjizvTuIGiujUuY1pssRTzQ+Q
         LRyw==
X-Forwarded-Encrypted: i=1; AKwUvByvfDSHaey953SBGR3BkEdZwpbL77TgtPJ/KPyBjt4fXRVv77uNqyqcoq3KlOmdsUgSP+TuSYgPmj8t@vger.kernel.org
X-Gm-Message-State: AFq9FYIHgy3tWBK7vwnoOtPwWV/DfqucLOw4vZ4mldJGB75AAYq264Kk
	8+zbdd9XJdKtdUfNC4680pum6mLtVcWm7S+UoficwMTjzZvsavGqY6J22jkzVdfrry9j+xU/7A2
	W3WVmhqecufaStaOIX2drDDXhAxaoG3O4JRyXARdFvCclWInQcm8/j7Y6sAhaen9H
X-Gm-Gg: AYBFou26ZkkJniaW7QSrGRKk5U/G6VjTt4aq9pfWzGXi9YwSRX2MImhhf1IYpqxbyYD
	v9xmqHAActoK+VAHiliWhJDvKhOtswPDwbMSebyALnfGcysxmstmgEfiSvSlUolUeno941semAV
	yGaoeyxiWGKANV9lK2lYvHFEGQ9CflNAoUW2/hGK3FIoXm3vdMFeVMFBcAdplplQsU/5A9xhiO1
	1lMA1/wsn68jzUk0IWoziq4cMGbq2jFzzIPDcIWnRjGUsawOdfURVbcvAj++8DAGdVoBk4luGi9
	A2BKxr/2Zy8Rmddu2vFCnbuohhyNm+QNmsYWrTV+8GyC8Z84cxg3lYcOxKA+Xbl+YhJosi0nTbC
	7FxdbUyICV6l+l9CcJNpzLpaPMshSLB0HHoHvyMXVyzJAi23yi8o8NJPvuKc=
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956091c88.26.1792213125622;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956041c88.26.1792213125033;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Sat, 17 Oct 2026 12:58:16 +0800
Message-ID: <20261017045817.1506961-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX+YQbi2fDjzWS
 LaxmgK3zbMv5+ikAFRM2zTod9NaXSUAICqegsp/EQSkj5G8E4Zzw1p9HN1GUcD5VKbxFOYFRFIn
 l/Y35U0lrxoJByqGb+AXZYwGR/jWtzM=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad30086 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PKgm7S4WkqlbYhXdoGMA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfXxcwmBrYCrnz9
 cRovLcyS65rjG0lvGXLPDuqcWhMBCay5KUCWygtEQ+31dJkE9RxvoPU8VUQXHBJVBpvYy5q0JwX
 cATpyFCj7nHpVrJDNDJWG1TJ43AHMXloFQpPHkqk+BRQeuK/z3dzfd9HOUJM1ghfL0PnCmTrBIE
 qtfS2ezIMrk4/xJsSPHF658BZG27r+/nmcHbrtZI9QGs5SdT4lKQI0UmJpj63YmT/SmbXqMkNLj
 1PNujM6yn0lJkrLxDuJaTDKFokjSyk9bI+4hatZSobUnvRej7IWg6Q8Lm/xl94tEjr5RlY1TJpU
 0LODqPuufy+1Lpld+cZqVApsE9IWJoJTcr2dR6gHL2cdxgSJv7MqvroMN90WMy0edcNxIo8aDzg
 J0xJmIqpBWfLoeL8a0go20JsDxtISnJTsnA1CcPEjZSBw5aAAHbCTB2MKI6rpIkwUZCFGJ6RKI0
 BzHDEieFlDi0ftiMlAQ==
X-Proofpoint-ORIG-GUID: lY68a0QrK1htWcCHf8tTu7ta9HObgrdG
X-Proofpoint-GUID: lY68a0QrK1htWcCHf8tTu7ta9HObgrdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
SM8750: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node instead passes the board XO and
GCC_VIDEO_AHB_CLK, which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
of this node.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..678e6e167bde 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3338,7 +3338,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

