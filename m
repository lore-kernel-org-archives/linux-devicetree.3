Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34249219D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390208; cv=none; b=WH2moxku9EWY7rrOT1kU/T0frkfSK49parTwYkS7nahjcJi32h28XAItD3Z4k5nEEoxc6nMWCktDxvG2rRwpJmIoyh5V989WTE9m/RwzJTV8U33t5RQKeHwIzeEeBWYTVL7v2I1PuqF6amueM2axDjyHfP1O2ooIg+8MdGL2LZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390208; c=relaxed/simple;
	bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lq1WqE3p7vuiqc1gzPBuzBjRtg9J4BBqw2q+hwf3JqLXTUAwfzG09gyqXXwe/7zyH22OH9hOaKzIhqlCctK1pnM4Hy8u2VERdAfavAcY6O1Pz4C38QNH4//gCiAF1IEyWSrk9TOOzHE0ZD2f9GuskiuKb0GAnzC1zUBG+ERCQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4XcYK9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zg3F07ts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4XcYK9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zg3F07ts"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNCDC431594
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=; b=m4XcYK9xP3ukjTFm
	POMa+hreh4kyn9JcRvfNfLgC4DxXBkgYTmCOtHXhCG8TbRPFxoAe04xqVBP09sd/
	8PpN+nzhVpxHUBb8+6k+H7CDfDYRYbLpRnMK0ja1c4Q3X/hZmpUzSfBw50rp5ZZ5
	/nDVbaHSy/OVBkPTRV+YwG0n17i10/APk+PxwSWhpwWSHZx3jSDq7+3+8yvgLeKM
	wA+dehsK+1degMzwCMVUU2cyn5fpp+aHTxSUhcNvJSIElaUCak7DhwLGqsAPvDHh
	EBtM0Y839F58MNuCjhZ2BowhyP0cD/R+xSTeQFFlZY0z78bbFNE8LV1aJvnJTJNy
	TJj+jw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7989d8ef4a6so95878137.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390205; x=1789995005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=Zg3F07ts96IRWvGoHuDNh+em8EnE6RMMWr8WRo+/omjgqdFAYmOhFNXP6MzW/28QVa
         4yAG+CVp39LuUHXXrqqdRfooEirRAQ1jkeAmeFQOiNXlXcugCgzeugnf6Xy/+w5Eofkz
         xW4JOt/Swj3S/0FA0c0E76mm8AeIn/LN12ChDVmZYbt6XUUL7B3Be1W5u/tCL6VpTALo
         414sotKN34lHXI1ZEQqCdbH0FiLVi9wxLzaJ0FvcFGW3lYI+zNqYiwQwMSl3ha88ZhDE
         HPZQ3mKLGyjx/Xc6eSOii1vNZd8OsCZnxgfdkRF+ChW3g/e5gB5AW7smQPBG//VzHgDq
         jV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390205; x=1789995005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=mSQRnTOUIqcXppvWH5GMB470vCUakOxNvcjsIZovp/GgS7cbKfy6VQb+M5LWyd5URt
         q2XyngI9G9tbe1DEp/+20GYllVKP1T20aO7nUdlp3Z+65GwJ1p1ykWT6jr30g/dbFCIG
         BZypTHUjU2PAb0ofMvMgfHRgUnwDBlTVMiWlfgRY/4KUjKXGDEfTm2x+4CsVjmCpFau/
         LmaDks5BvZ1hbFJ8p/pGtDVDWDRYfoai8c57JZhzO0W9h/1mR1oelBJjEEJqyHbEFljG
         hTv7S1afC9hhIZRmi0HiQ1kjU5Vn4Uv8GOwzhBkypmdBGZwwwHZ+ngosrhslLbuzOOfB
         yXGw==
X-Forwarded-Encrypted: i=1; AKwUvBwS1L+NZX2SXNAEIoC+/RZ5kjt1iFX0gyiU0xXK5kAWF509a+Xle0BR0C9Qsu4M/bHHbUI7PcSy/HZO@vger.kernel.org
X-Gm-Message-State: AFuF++lkreikMeoBP7DfhxMxJt79/dxEQNJ5sI4JKgGeCw2YsZ7sa0jr
	Eb6eZxXslYiIEOOWdPsP3Te4y6qxDRTNdQon58esi+0TvHffXAeXFXn0XxFKhdVz71CAITi84Ay
	tFcwdmtUhAevThJq4BIbNYg55bAaS45no/fx8SpTlbrmLCMtgVvHCSrcEXn/GaYWi
X-Gm-Gg: AYBFou2LsHdwcTpWntVmNgS662ybeUpMqKbgRLQ3uk+xL96R/c8uSi1k2+v9qxcfZZ4
	l5Fvbb2us1cCjDL4N0KOO0f6uWX6nNzCm05DZhaPOGg6YOlIZhVONPLTRmPvABcUTTIEYuIItBB
	dX78xfQpa3q75WhzT1OXgWaEjMXFNLghRMeHPM/m7Dfv8Nb1tPYKd9zBXV4//iKx5zvAqln+s1K
	WX0zZWpwTlRkDm+FJq6fjwxXeWd4EUP+4lSr8sCaQTvuvImrxFf5LILcn96yxs4EyJxRZffvRRa
	Fm318js/bPfL59xl9qSwRww+AEpoXuBK6mEKa5uD7+n6btcbGKlNhNKezkQZyKLFZxXQl6u+/o6
	FBB5rQL6w
X-Received: by 2002:a05:6102:5792:b0:782:de7b:eead with SMTP id ada2fe7eead31-79b573e386dmr1119996137.1.1789390204615;
        Mon, 14 Sep 2026 05:50:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:782:de7b:eead with SMTP id ada2fe7eead31-79b573e386dmr1119964137.1.1789390204121;
        Mon, 14 Sep 2026 05:50:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:45 +0300
Subject: [PATCH v4 46/52] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-46-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z4diOa3IoZkiyf0cmd+cj1rtu79x5zmqTNM
 gJMyy0kJoOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs+AAKCRAbX0TJAJUV
 VrZrD/9BzSwkSmEv7n2TgG9ugoiSywAjRzsDS+Frozzin9bv6SP0MCeJSqd3Z6Q2PBx/g93HjxQ
 +cPD54HDSFIb/eoilRDkiXCN9F0QKK6Mx/pM6zMccxCaiIPrm46/ftDNaYh+JxF0gmR+rD+ffCZ
 M6HVX3wge/4arOXte5K+tARf3p6uzK64l1DGBDNnOJHaqiDKMUY8T7APXlNAHY5dcBNMS/T5L4P
 MeTDjsCGwzwvP87qIr1PUK4NIB1R8i6ny5ib1BmzDykddY8xCIWmVNyusvifVlLF3RwjCAnOulJ
 vye8ILMlHFK8yuOX8Uaq078gBEBiNBolbqLfFzl83cf4R+ZWDRZB8vdaMvCqbkp28BwbtZigaJN
 8EffCWAE1Q4aS03qBLYrMgHtyLaEiHM6uqc58G0SZGjfYsLNmYvNrVXkcFw5wQ9/VEMcfDdjkpb
 FtSaSJnFS38liimo2oFY0CaHcfeSrnMfOtcWmhp+E0F+lXC4/H1BJgqIbe7/PRtJQZLuet8s45k
 JqWzFlzTiwdNLM/0+S3cxiTObbfWBNtYYOHjiaySAuwVYaysoTga9eXXArOhdc+Mp8eJGFyEphx
 EqKsXrbh95SUdB7OgAjB+0yHCUF8aboB9+xuLjlhkP41hSkWAeWy3IRZegvMM1RruOtrCnvNws9
 xTT3fC8sWPlqliQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed7d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXz7xkK5AhxWBj
 w983ZzMfp3T9/4dAZJPh5+bOEHPq1InSUceKKnFdn8wZxv6ctO1pDnbJPuVgNbXeIALyFgwYyX2
 QHQX98QOYVRtC/9qiHgQmrr9wrS2oEUZAiSGut6TO4iit+SDnwNByZ7z+NEivs01WqgU7ejqTdH
 aOgdqBk+RgtiVPPRvqHujo+CjHs3GLXGXF0S0R8UCeh8eK4K5rrBIuwaqaAMfnPINWYbkCQv/Gh
 XKo/r9BuquedBUaNYTIAAw8+xR5crIZFneX45vmJkhFMVN6RzdivgVVxUjrG1/UmZOemlDoeP8X
 IhiCYmnLs870rOQY/K6nZyaMak+ATBeqvNuBKqNMxz9hDI2qYp+6jbAbE+5IGNvuebn0F5VYMse
 Nso/quC3oh46TsqgGLK40d4cRMwRs2E3jbmZDhqozf5RJBS2N6OwVt3/GeyvVwqrdH4B5VtkOff
 TYN1Jf8PYwiTtxzgMZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX3t+XJlV/kOXD
 UHXjRwy11P/aiLGbImzflQkcstX8RWDtSUI2pOru+PUSLFus3BBUlM5ecXEP9tUf9DrcB7co78V
 xX4V4TWAqq4Ure36uvDKgsmv3hNPaUs=
X-Proofpoint-ORIG-GUID: W2ZeFuKJj67XFv__s5YI6fTmvMIUkVoV
X-Proofpoint-GUID: W2ZeFuKJj67XFv__s5YI6fTmvMIUkVoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8483a1bc56f4..a90e4f30d39a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -970,6 +970,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

