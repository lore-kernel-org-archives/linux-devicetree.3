Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A43411A03
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220571; cv=none; b=Tg3CFCR8O8xLBKkFL8QQhX/adJVbTp+BjmvqvzJcgHsmQZt3s7/P8wGXdoHKBg7yXFzzpB2bFRMXufeydMvpD5C0VYbrC6dAo4CDDNFRvwmvD3BuXeDqWetE69wjAReue/LaeSzqg+i4aOvjqPqegVIzwTiF/37x4oglC6qms/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220571; c=relaxed/simple;
	bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9tbo5o58u4gnILwrxlErkbHFaJtoMrvr7KYnhhE1mEob7iMesojrQlq/NnlDD2VkhULeDz0JPKcB437+ylR0iqV/OBZT22mX2INNqdih7D9sgZGVEwu0uc4s6akUFCgm1rdGNw2iFFqV8PiVUAosQoU4uO9i976jJzlR1OphEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dA0RfeMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqiZokUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dA0RfeMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqiZokUJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3FZw3454843
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=; b=dA0RfeMBtnbVJrsn
	enZJto7m5Dxj1g+dMurI7XWBMSt31+A5dbuDobUumeZZ1yvJXoJ+PJKhEp8efH/D
	RwSb0cpSt60yOXcfKSD9Nk0vT1FeYH9VQzkL59wbSMvhwu82b71nTwfiUFoO726S
	XgPZ+A4M9oRZrRztLKrq9vHQEhbHD5Mk/c4gbym+g43X6GemUYkRDnwxLIFK1a/o
	WaBa2a2jqGlFMYg9RumHEq7VFi5Bp199uESxCGgpuOBPeHW6kWdLWe6yyv25CxoO
	oDJKSZ2IUfp7MSvx3hSP7vbpLQHVX23+Tp0gEjFPFlg7iaF4S9TfoHMLS0/NlVQb
	F+S1wQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg880u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so85630485a.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220554; x=1787825354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=kqiZokUJsG2ilNMcGucGt2n9/iEZ2Q5h9DWwzZKkZwELj90TsYZVhaEEkNT1WSBytz
         mS4V5A3Z0ox6Zpp7+UKJOw95esbsyUvSXCCk/Dq6wfK6dc/jWq4GjR7OS0Y0gUkfmIza
         rjUFmxoyCFEJYKYDjmYlEnMDPQGndhdUjARTxG7ZRFIy8bKWbxrH9pb682MyGEVFw5vF
         A31I94W8tco5LvKgttFkEHLQOWR0fxryFWGOsd7Au/FAFhvChzoY2ntDJuRflV2obmrd
         OaC8rnIur0xyV/Bdj11ZZAAI/kPJ37eOMN2K+hcQQWEVWihc0BNZfpLGfIxhw8GcRmTe
         L+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220554; x=1787825354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=gba8g+9FWBG5dsNglAbwOxNLg51tZRE88/hIjHuBXGS7NCnX2pSY7sHSJoJQjBFBZm
         aLXQdKDeUtj1QUjocSAYD5BqD+omLauOUYTBke/25UKL/IvUuDi344D51TaPrplTOrNp
         0PPUbh8igeQUb7jzB0WMt3K0wGZ+mJ61sh0Rpj+xSsUim5ili0A6vWRnujEaKqwcW86g
         gISHktga/VucV8sEeXZXW/fTVbTT47sljxnza35xmp7tZ37vB5ep1NJ+Z8FEacgiaTuo
         cy5gM7HpqggHKEMholCawf7CuJb9xlmkP2ScVcNo6l7qPszu5Tn70ZX+Fhdr+yEbArju
         KfUg==
X-Forwarded-Encrypted: i=1; AHgh+RrKa/89y2r02/OHtGnb3vlNzTbGpWGqZrahK4+vA0hcpjie9OcszueHIkb6H12Vv4/EQXc9kFGmn/Sa@vger.kernel.org
X-Gm-Message-State: AOJu0YxKa58NN8gG3LcAuXJLkoifaEkNw91u5FhdQfy4eC2dYLD4RfSP
	KrfwrM89V8iQktcdAwhk8Pueo8WeNCbcii2g195lumHbxFOwXe6hm1MhmQLQPy8YjZYY3BczyO8
	PdJ9JaboLuMZXAS9pBvgCMdHix6LtJEjnK3RX0cCxtQrW9TQpDp4mAgB+9l5/fUqd
X-Gm-Gg: AR+sD13N4I3tL9WZXHZE8fcPu/EizKxH94KziZ3RpD55FLSEX8IzArvWeepxP6iSZme
	zV/YkMakYj7OHoWH8jb/0ATGBUB10SdJOYSwvZMjWpbFAg/W7/9F2uMJ5GEGroBzLA8Ggz/VAiO
	uMDH0W9MGtyjtquElmGcX9ngfDwZcW1SV3FbRdX5u3iK15i2csyqosoUv5vHn8vzYqvfxnc8XNi
	PbX1WxrVi2sre4sW6X8Bo4zy8k9qlsx8HcLJxyIile3zcw5jte7LOV7WgduBu0aWOUR6Oyo16mB
	L5MFcmhfw1Bql3g5IylmFjiRidRMClnf6O9SJjQRkUpgdgRRHUchjXIeSwkWAHUqdqHVxAp+gGI
	mlG+6B+Qo
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr529162485a.20.1787220554411;
        Thu, 20 Aug 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr529156985a.20.1787220553939;
        Thu, 20 Aug 2026 03:09:13 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:16 +0300
Subject: [PATCH v2 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-13-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIQs6NKImG163thh0qjRhTNHarWxymi33D/F
 F0ojNVH38uJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSEAAKCRAbX0TJAJUV
 Vi6VD/iHgoBx0QvdBdLofKiSGw8eeWWm1RWZg/gtVedZeX03HAIK4+syXM4IgtAZdxc04oX5Gda
 8asBaxJAKlKnx4tExqcAbzPTfCK57eEPs+i5rEl9P0tccLjuA9+/QXUMQP6CJLVfc5iqnom5gjD
 pfPqHhDHaGtu8ZzoM49DkR2EbQT0fmV8lyKRautCbSMRvl8ZhjskrcK3Jl3JZycIxe4NubQTpky
 HCKbkDXF4BCICJIFWcRI4oE8hoO1DbJc2awsCo5DGioTvxp/4yyte4AYshYlwYFlCJhSzflndJ7
 WhdRUsd85pkCJtwaqTVJUQojSWtKkPlJsQFE2gyA8NpObGP7EtEVJm1+qTxKcN4F4Q+n9J2c7H1
 oMKB/p6JHy66pzrTYGkPyqkvNGXjzvpqKj2wRkvZLwA8Ev94cV+E4WTGFL6pXKJmimO9Hq1qbbM
 Il5Oyc8/w9GUWpgq7bsSRMcB9CRrVnag7MMxjib0dxDwYEewBLx1vWuEUqG1OKZkKqQ8hfK/WoR
 dw+Z07JOjGUZvG1WoYm/o0c85Y7gXpfyzE8fEnSg3eZrw6nViCvu9CiKTXMSzUWkK8OwAtTMClW
 5/0LLy0WM9JmSHIknCBNMJco4nDeugSV/8INCDL40uG1SpNcONXHdfzgPj9eF9RCowsD+YKx/9y
 G9ApheSZb7PxC
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX0cyfQ60xsBkS
 bv7HBXmgryeRgvmEbk+yCTVhH/uF2YYaVMQkS3BGj7YTmB7GaLjLzOp2N7ApMUSEFMt+ZsHFDl+
 KbVli2nsJ6cPBhH8qK577boNwIdxxQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX5P9zvf8gWuS2
 aUy4NDzF1T989nc0fnV4I7Mik1WANZ/pc05zR/LLDV2GFInxrIZAZa7sqSi/dg/zk0OpqnLON7z
 IRD9JhwBbD2W9neSjtTeESNEsL3j6HNF2xORT20qxjPeiNgDoFsQ1X1Vl8sVKolvk406ZHIbRFz
 NH8VmE68zfSpDKjRBI8BXzDB7cWgl/1jDrYBUynDO5hEUpTAZRiPKGY/3fhQBbO4yp5TYLMIQZO
 gk41JOL0vbu+N9PV9gre+z9P7MV+mwHKrkC8SF6YKXIE64/ZwmzWN1pr9Aux1WABCt1xXvKcXZE
 zuLfpiFusbnQ8fa5mpLWo9I7eGsPlpaaagxoBjhuPMWHLGs4j3vK9fqx5C9OYyuxD8DgpwC2wK7
 J9uRHdd17QiFXTUtBXIoANsoXY7rEGHiRmVXp+UQgtqoGd9AqbfgBwKl54WZGUwPxT8RWg8mCGW
 dbNaTdPCybfHtVGTR5A==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d24b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pZH5AeviwltTU3yus3_qVylvJuYqaG2J
X-Proofpoint-ORIG-GUID: pZH5AeviwltTU3yus3_qVylvJuYqaG2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..962797c15abf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

