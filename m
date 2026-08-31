Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B184540682C
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170723; cv=none; b=r2jTNCJPGuhrjbsriIfWLqVOyVwdyoDNCM3ps27vouzqtnLacwTGUCZtM6a/lpXUpBezPTIprX+BslVHE3NLVSDh0ZNYova8wNiM+Vjw2E+zCaixmnTbgNpdffMwApur2maAV1IbR3Jg176e6KLJlD641EYVZ+PI9CbCnjjgdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170723; c=relaxed/simple;
	bh=0f6KiYKIzIUdyTPDzMlnZgcnxBraRegEdurp6XJR1JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aE9tEA1T+MjpWx2bJECw0Ght08oQQ0g2Mz4tGNaih7mcM82XsxC/MNJgLZtiGSVrgCLALIMiAmKJ62kE0XNcWJqeM7Szx1u7pMTpd9OgUCoedqP3yJ0wZqkLkjaj96RWoJsocnidFt/UKTyC05k+EttH0ovo99Z4Cz+hjb5VfAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exe7SL3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCEEgOI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exe7SL3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCEEgOI5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9IlGT2516461
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nE6BbNiUbfj7Zm7Xn0kNctopD00SGmrbKSh6x9FGbw=; b=exe7SL3y3aesN0CR
	MJQhB4xgDNXycqbbeFwGzZx59rGhxG4dIsUwYQrHg3aoOyPMX1TlIjlkjBC/jp4t
	AscARkk5aTU4t4PYluce/u3yrr2ps5FQONsFBW5HLeySfXd1sC87Jv9uiffPvrZh
	QAEUut5wrTwFcPz7rBR2WaastXZHXM1yfmDnpFMuB6DYZtz5ddHIuzaEyrE3EQzi
	lhLrmm+dL2JtGOMlz5xZyFCtKbu6buGi4xiU6AZ15Q02oi64y5DL3/O5QJHIkEss
	zTqdmDohA8wKHA1ReLwcduf/CJsiPuZTSnORTyQO7b3ZNZolSrCxf821Pz0F9N38
	YhZAGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcr6bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390ca1a9abso474680885a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170720; x=1788775520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nE6BbNiUbfj7Zm7Xn0kNctopD00SGmrbKSh6x9FGbw=;
        b=dCEEgOI51W+QOUIrGZcuD2UlkCYJENH/VGMtA460sGXxQ9EbU6y0BPEy14WHh5q+Hh
         7F4RscaC1QBjGV/Jeo4ZVPY0DoixALmH0zCqzEEAsYcmG/gR+ug1+kVfWgM6xSDC5cds
         i0EbCcXFLFnpmCjC7cmC0q0GKNHGnU9h57xd6SCItCCZud/mOJAV9CZ60iZ35vgFs7IO
         61fVkWyLGct/07rgsDppCDkbzMcSuYUTdMbNYFL/+4uYoFDr7UJefUQbin2UELmDH7C+
         pad40+Bn67Djv2J3CGqWYNF9zMst54Or2VWvUC3tocxfBTxHBAjyrkaXHGa/DvJvMGTY
         OHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170720; x=1788775520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nE6BbNiUbfj7Zm7Xn0kNctopD00SGmrbKSh6x9FGbw=;
        b=Yw+Ho2KCma2N5+lB9hK/P5BAQtqDYINbNs9+gOJ0AAJ7GDgFzhxMtX4wWniURw8vej
         6RzI56SSwK3dNx3DJ7qnOmG6PX84Xp686/s27lK5G+1o7uWWoMH0LwKnTVI3y0dcyHFr
         FS82fDeN5Eth5LgJfRaljNJ3CEdYksMae+78Uj32gQ7Eq2f2r646/ZoAoQWTFt8Z2/Ue
         vUQaEiyqug7SCldnF//yekqZ+RrS7+Obb8FqfR43usfqv8XGAoxHRUZfNncgnlpKm9OL
         f2wvDL1hOtreLopm7gY4U5sbz6BSLmf5e9mljQFBEpb00XzrwYs6MRdGq8Ug4Hcc836L
         y3hQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBp6iUDALEDNr53cwGrx4BladPPfR5Ch3pdEnLwz9UAeh98SPJDitO0v6IuzclOYvxG1YbuL0bRSoB@vger.kernel.org
X-Gm-Message-State: AFuF++kqsIxjIRDt4HHDwkZZLdTVGVZ+CDynjLsjBT5gnvl9gy3MS3Ho
	GOKpGUkCcme7ED+7QzRL6umsk9Msx4XguBZuLqSmOxO4LJn4THycbLtZNuxYqVa0tvc5zc57gx2
	hx+x7TuuTDBFnQSrCY7dQFssGpUY3X7SjHQb+0crolaRHqxkrPKdnpixOXhSuFeBE
X-Gm-Gg: AR+sD108dI5aGFY4Qb7+jwQM9gV3Dx9yRpOWWUbsm7eSkp8YLrk88bslrA7gttwow9Z
	crpY8Wzm8E3UeJEiyDJo72oDtHWxhPbZQYJe1RQDGtiItKEUvaql3V+Ld5QEfGfrwpwitdu2fGp
	+tiqbDVqTfENmnimvbQWHpm/ZRI5SgngcQovWFH6o6FP+aAsTx4E2JPq+4Vc0BqUxHUIFCx8FfS
	AagV3Z2DMXWP8yy84Y7vayo51B5bnYwLsKNB4rbeKHij30BKKT394HifHzN/IEwPOyqYrvLKjuQ
	O/ePIlI0KebBUx57hNPw3Zdgs0JeCkzMH+RCwMB/Essmk1oi+uZZG+LrBov4355pWApjVMACTK/
	2eWd6eg==
X-Received: by 2002:a05:620a:4b41:b0:939:3c0:144 with SMTP id af79cd13be357-93913958c0amr2083354685a.33.1788170719877;
        Mon, 31 Aug 2026 03:05:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4b41:b0:939:3c0:144 with SMTP id af79cd13be357-93913958c0amr2083350585a.33.1788170719327;
        Mon, 31 Aug 2026 03:05:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:05:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:48 +0300
Subject: [PATCH 8/9] arm64: dts: qcom: microsoft-romulus: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-8-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0f6KiYKIzIUdyTPDzMlnZgcnxBraRegEdurp6XJR1JY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAHFfQgdyxKQIdYIDawF3ocHS4QBgiATyr9o
 qDbmlu1jnGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQBwAKCRAbX0TJAJUV
 VlTyD/9oIG506G2WSKGUxxBJzhAFwK2VaFBnTCzUMGYliVaEhiWfwQ4XC2Txu0rRvSM29GS6GOo
 MzRvVcBiJeePwV0g7kK5GrEKJ/+5+SpIMLGkF/RWoDYZUbgjc9NlG0fq7Af+XII7flip7VP6pNH
 VVGBHZWZ/RlkxxQQYEUcJOJQwCG5O4s2MDJYZQl6R1dxKh2UxrjBt29/UVNUEThrZFclgQ6XE/g
 Wfn+74sv1m+HYOjVYj8vWK/IB5VWZL5d2QBsrqxHNKUfIuWMNRqfzBphCV0EfaZKyEKviKhfFVq
 LMEJXagGw6tjeVPXJIeWuQ8i5tlUCm33VD65W2LksU+mTQ1qWGo+q7BmCMeVJYrnxDuyotFp2fS
 aLSaq4xaB8cMlpghZ9dNG17cY21SFt2RdICRiPpgJT91hlmvqzTzmf0GLst8pBtziAH8PDq/QUC
 zINRgyQDhpCm2fP62s6toNLLbrnBZ4Vwoai1rrnM2XjBuhtkpaUbgkqj53CA/Yzv0Kw0CBIZcIS
 Nc6LGjK41NOcU/odI0niEjozLMPzela3qmAgvekGWo8uQa2szS5MgytYqnuxfWU0tWiE8BW4L4o
 5GvYsOyeweby1SAZG12vK/WhY3WxHIqlLYJQN9vn0dy6kaKiZjY5idkEw3SvwX3hPLagjAtFKm7
 frlXEKLx7xq8Niw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXyL9/ty0VdGJ+
 IazZvL590hmod/mVMMQ/tMSYJNVQoD6lxWVTxK2aLMEn6rqjWibOjECT1UPM2DTZVKWbOU/GrMZ
 kRJnnQomn3oK7WMpydzGcPKobUHLAmqK4e666ol4EfXCCplztxfxpA732+XoYd+qzHcSgK/ngcv
 3rbrru8VIzi3SoKEWaEWXw5pV4xNOImecw8f4t56X2IWt3NrCxZwJa/c8XBpVIpFaZoE2ihG7qs
 HNgERBVVbuG5O6i/fq2tmI0HojA30FaIUikSNsUckOA/ibzbGt1aY2937SzGW5uqw9aD2ZT/9Ch
 MpZ7o0VU/XMHIsVnnVZj6qc1NMp87tAUH7uUzeqeY/j0siGQ8g9Ld2fYj/7V24edmLe3RgiPn9z
 OIdJmWJOpnxI8hQF4aHL5xf266E85CLB19YXsmhjGI5f0t9cTwDWb4GeScVuZC/z0ifZAQM97m7
 bhvNgBF0IRb1BBn7OWw==
X-Proofpoint-GUID: ZcfgU3ujvLhMZBL_tKpPlzYD_6ldSwdM
X-Proofpoint-ORIG-GUID: ZcfgU3ujvLhMZBL_tKpPlzYD_6ldSwdM
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a9551e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=l8FgSqmFWaqY7FSYhIgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX5+lw4BXQXwr9
 KREZg6Q4mhOnHoMpggnPHhEwrw8aF2hk7PzHhan4M+zx70lhDjUr+T4pPNp5Uzi7w07zzjbsSRy
 CpgzmzRf2nbKhkUOcefiHn4V5OrgmK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 13d0f09e0c2a..bc684c295b89 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	hall_int_n_default: hall-int-n-state {

-- 
2.54.0

