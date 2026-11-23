Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414774;
	b=Fu8DCFphr01505e4/+gBUA77/oCBdSTb4M0KK3c+Upp0WmsNe2iGLSa00JJDJuvZM3mc
	 SfBCOyeEHaLX+qhVpsBmKqmTiPGE6N8id+f394zTaSpoRlGBDPqxdXrx+DACh/ADNoX8s
	 epIlXlghNnquRkwuMjSGgdPDexF4yImstaD0zG/Ppne/5kuPzLkCHlYGkz3r9i74i22gX
	 KQHl7YSme/Q4iKkpcPBRFYcvtT74NCjWSxS+9EVdNiLmAwC6Cb9cJjjPbm9/7K73xAUlF
	 jMNFTD42oMUy1QlTv6iiaXg9cxs1KV9bTH0BetmoGz91PJOfNf1d7H/q5GTmDo+qfDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=;
	b=hC51YCh1tH000Mi9FVLEpduPVXdHwQTf1bBLPIIyqOEggKnTOUaPqWpDf9cjWk//bkIb
	 0IwddLF5ymfZPHEC69sijdQjpSKfn+vVd4wn51vZGx7v9wYbHc6tStIy9cXSLyA8e3vBy
	 zP9XCHizjI5DOlQI4kH6kKZBrRF0oDjQkJS1PzYo3in2IAUJHZ+LKPKIIg8jJGSdXSd+5
	 ydF+6xvJnLIlyRm3kTE3bHgC12vDhBFpapRojSAg2HG4MFQcREHllXQURV7Jwj9cQeziy
	 XXzJrczzgfuIDgK1y0xsqZaaKSME2eoWXgRYAzlZBR+Qce6v073Ps/Rupuc8paDWPIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4gF0HMf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=flLcxO8i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156F606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9156F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4gF0HMf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=flLcxO8i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN516ed3527979
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=; b=E4gF0HMf6hCUYcB1
	1BkGYv8POexfdkmZXcvSU70oadTvrUsrhCyfIM8EBSGj+6V0EdrIDNR3SuVGdbUS
	jHGOqH7x0SlhJ892o/2Fpf+P5/X3djxcwjwERrqAl/gg6Q2Sce3bZlpqheRJiInx
	K/L/a44+od9w+uIJrEIZsm8PMbbQkG7ype4TOT13twHCYAB1O4KnaCYjVhRxh8s+
	vXm2gyCUgIB6os23vUFfqq1+Qthnoq+eOh9J/SSWMaGV13lQ6G/0R7OxgOdoaS/s
	PQ5QVfjofaF8bzwilxJo760zKixsC324FJbpWc2FKfemIezNY91cxKBwvqCkDauE
	pgQXQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnwts0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b60129a46eso3465970b3a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414772; x=1796019572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=;
        b=flLcxO8iumF/ALn/ljoxXp37s+gqavxE/9rQpmK7F0mKym6jBT3i3RD1UbsAXNfi5h
         4p4BCgz9BaaYNPB+s5GFaSVgySAz+uZlwrtOVKx8BF4FJR47sOjYMrIfceNH6FCAvYjT
         UYm5WxfnmIeOwR91gcYxNYwT0v65/glC0RjOGpYtjnWW0y87S76lXNSn261ibj6cVH+P
         VABckmnIcw6nzdiSOPegqzeUHzU/HmqqUba7HPwEcvcKLlwi1/0H8wYayWbJXmBeYp6J
         zB7McJaG6IwAtwN2+t4FFJJLDhOTxEW39h2yLSZT802G8UFcop6srukO+YjLUKyvqgjv
         FOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414772; x=1796019572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=;
        b=1M0H0GQxsVT51i3L/dLSe0yOllVfVj2uZrASThyuTs/bcwwamGFY2Jz/uaDt3DOB4o
         hQXuc+LLGhS5kko7lu2MiQ4+E1X36CDlT81IRI5dEJsg54MFcZVtyZYM4NLfR5yVNeZ0
         OZRu+m8K8rrVNjznRIvFS02enSynoD7fUrpwRP8ShFOhqX7Yr3D7Sc9xeZFJodgfFI0l
         eB03yUGUqwC2traADMQPwoOGXO49pyPRrxk69D2gfzzzZoqM1bQHUkJqgeUtCcT+ebqH
         5qf8LyV5UmbuYioVDoBFqQkkJjfxt+1ol0sCHfdyPWGkX/0r4uEf5Trx+an/L3+ztCfW
         0Wgg==
X-Forwarded-Encrypted: i=1; AL+hErHrWxgArYhv/Yx4X9QQtXdfkbP3VkNrrTPiVgJr+bNGRm55PHhVBlEJSsm/QLBG1jlE9KhoyeTOK0a5@vger.kernel.org
X-Gm-Message-State: APuU4Z8bR/tNTaUEQW0L0JvUAViXl7bssem0wMqMgB7A8NWsh7W6avQS
	P3g0eogcYvInwNV1JCZY17FEfPHVjc9nf6yXHao20sZv6wEVHF9y0Vb49sYCeRb8h37E19H1Yz9
	A977arIJY3B27Ld26PZmW3gk7g8D2EL6FjbJoWfHaIy0p/vADemplog3P5vpCu0Nm
X-Gm-Gg: AZFdTZcuYJsjStmv+ADdqZiXVP45jxRZ7nsFSSwEunmkOBGKqsDN3oZB1wbOx9JmyCY
	s+lghtk5CK29uj4chsdK7JiByDitWe+C5D6i8QM4DjzevDkHPiOsS/x3o2IPLmvit107cUF1CKv
	9Yp9kzt9XyNlHnVcAIrOxIHPixgOGXUMfxuMEbjyiWbo+nTcWhF6Da5u7KlhHQTLNiGtX1G2b6s
	GOS/0j2nRiDQwwqF1GPi8sIW4j8caZh916dYsQ36K05YLLNWCRxxCEZf7nvsa9aK3qZklqIzf5T
	fhbymlwJK6ZvnxOWwVBxvjxtXhl7DFlRVY2YR0w4hulUL2WTbhjpmgxwW2Jlb5rbttkquZ6VfPS
	Vsvm2i8eyrL2x0KM9VJ/f5zZd3FkvUWZ/+CEBMkslnK4fYq28gYdyqiKE1nbz+hfIu5n77rhfKo
	QAmAGdu/Lh/A==
X-Received: by 2002:a05:6a00:3d12:b0:89f:d9b2:4a1b with SMTP id d2e1a72fcca58-8c87b4f39e7mr9041847b3a.9.1795414771647;
        Sun, 22 Nov 2026 22:19:31 -0800 (PST)
X-Received: by 2002:a05:6a00:3d12:b0:89f:d9b2:4a1b with SMTP id d2e1a72fcca58-8c87b4f39e7mr9041830b3a.9.1795414771232;
        Sun, 22 Nov 2026 22:19:31 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:30 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:48:58 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1518;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=/BG00vBqRpczxpyRNllb2yRgE6wS8fyaE+fWjwdrH9E=;
 b=zGS/44VxBHlPLaS4jHflPpEbRCr50HwMGwONWstbHM5+xw98heDXoxxUYSpyzhmS7ZeSBIFcy
 iFCGfa102X3AH92r3GSncvSU6xjB7ETDzzmQVu+LqF59O7lQjnbPDzV
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX5JgABZIpKTFm
 mvUUs4EC1rrrggjkwn33AYsDKB7MJ3PvV8E+I8kD97ebicKaGityb99MtLT5VxBDqS4SNfmNwiF
 Ksvj27TwvXWUlBWqmDpTyrI8KKJPxTmpFWZ2G2/Qk7BkmryuGdoi3zQ/K6dfuQHaS+vzstSs2jg
 nZsCUo/hsBSGVZCHxu0vxGeLZ4bvuGCINGCpFjoxob2L+TyBdsz1TBZO940CR933+YcWIRWCvKq
 f11P3BO0rJnxtEBCGgmcOyaJ2fGpoGnmGN4gW6T1XcaEZ+5ziom8vcekffE56ITYP+l/Kyw5s2L
 b0hTf+RB9dr4lOiexpUzH1MFlOM+nbBpVYGRtaI0vJ0Zz7Q+r1DoDp5ug/b5S4FaAxF8Bgx8TdI
 11vulkIpH3xT2njbDYeU7OSbLklNp1Hr9no+8sGlIh6fkNivP7oF8SnTGiRxhEkR1vh+jwTHrQU
 G3/5X68w8MihYVdv1Hw==
X-Proofpoint-ORIG-GUID: gAgiPvc2Bg1WDe4DAreRwzmmSUNlDPku
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03daf4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ukB5r3Mx2XjEV9IxjioA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfXzMJioJ0K9JoY
 40zMERf5SkFbhJq3XV3H30oh5W0U9FmuUIPVkbyGKI8nsiNDHU4SKGGPZQnNVpxoJ2PSi5jBGsa
 T0XlUF7sGOghvqDQzNSaDVBi7N0jgSo=
X-Proofpoint-GUID: gAgiPvc2Bg1WDe4DAreRwzmmSUNlDPku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts.

When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
and the write-combined mapping takes effect, so such reads can result
in XPU violations. When Linux runs at EL1 under a hypervisor such as
Gunyah, a Device mapping of the region at stage-2 hides the issue, as
the stricter memory type applies.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 71a22859709398c969bedae3e0b931f664cdac97..fa66a34c0fe284579f728266e826fc22d8cb3438 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -1021,6 +1021,9 @@ tsens1: thermal-sensor@4413000 {
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0 0x045f0000 0 0x7000>;
+
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0x045f0000 0x7000>;

-- 
2.34.1

