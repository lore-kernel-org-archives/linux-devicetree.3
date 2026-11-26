Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693072;
	b=kC33bZU2K3mgJuACfsWViLc0hsGRa7zVs+iMMuUrUImqi/3xsISCVyz+qzSAa2xy8nq/
	 4YT5q5CP0QV2I/OGe6WlP8H+7JGoM9+wFuiLc6rQO1lZmp1tSD7QorfUK4Aw7NPiLS0pO
	 0ooUZ+jI+cH3dcryJeWqJ72/d0AFV1qkxV0w5+oGwQqCqgz8/rdYqCq9BkodZLwJpuq/3
	 9okrMFDZGcg8VdKIvGP96bAkwHJLQ+Xf+sydc2dBpvVBWxLQy7GuhDR3nQv9RB3rB70WP
	 AedaE2VkOPCA0pkYr+t1Fe5r0QmujqAH1KXvRZNc4pfs8FWEU+qol2TD/yDxY0A4YxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
	b=y2pCZLHCaxbYXyXVJAtgYsyFk1u5XGloSoeSCtRRhYcADC2JLp+KzSu9pHY7bOt9tGYr
	 llW1diDQQk+ThK0KBug5KygcDusqwplVF9SG3oWQshNDlgSp5Q9GjkXaHDQA3f27Eu0J6
	 ck0p6OTVbE186qIpgt+swjLqk8vwMcu+l865pvwHyNxl6oqt6Lzv600vyYtZv1SJuBc3K
	 5PGko61mPWhxdrrnQGMn35givIlyScYGNDa1bgDTBHYpL5VZoDjdYx8f4bTSxz26cd3xE
	 zWkgxuXnQh2lYs4pIsCBoR2dBq/x077kQ6P7csFI8bfjpepw7Fs02YcZ+W0MmjsiAkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8QTuoA5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O2/JFNEw";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C6606A6A5
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373C6606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8QTuoA5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2/JFNEw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVsnO633354
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=; b=a8QTuoA5MxMafr31
	y10EVr80Awe2A5XZKK6fE++LI++uaPlgWon1SCHc0su84Gy8pshXliyFUvIlsxAe
	lYw+lcNIELJqIeoTUg+2H5e9Y/34g6josD/8uyML77ZIKbL7Dz04xAKOLNEG1sdl
	gEhFPLqnSju2NBl6nvJIdMX7r4hg4E1Os5BLA8cH835xNx6xVILyDZI+Cl3D+1Li
	9VMEtprBow/ocAu75IeHSDNj6L/OhSUwTZv02/WurtyI6L4zkD2H2oeCeUoR87vZ
	Jz+8Tp9xMCTFF2JQeLrNfuPrjSHlqUkj1JIz0jJMy08v/X7r8RSdkDj9AhNlC2EW
	x/z5vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0uxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1351888585a.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693070; x=1796297870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
        b=O2/JFNEw2ALn/fNrgxRkX7lYTfkTBZQqtPsqMLqJ0JD21RQb7/XeOJ8HTjlREaZtka
         zb8RTGB8Y+VYjDs9zpd7OuPz3PmS1L+hPo7zTiC0AxTKiYKsv4ERx65s1y0bKtkKVFMM
         6s7ObeFMO70d2Z/nm8mbIc754J7ZJKIsGhAkqVAEIaXg7rvNJKdc2KrLsoefINHNEGtx
         PEvg1HLuZe5sHbe5i838yV3I0ZSAVAhb/XJL8GUhIYD3ppzP4Vx0+HKx2wam/iBXjQav
         rHylcYMs7nMYww16B/PrYIg2OityMFLqoXUNrCjMbfeRFw2f4XjRb3gyxumWmSY3tFAH
         GwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693070; x=1796297870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
        b=2sK2bMrzJqvnabVAlXz8/RI9LztSzUuvT4ypL8Fha11TJVmxNQxkEIbtlGpZtr8Guq
         OTe2FKVI306LMkh/gKq/hP+fQo7hjBRCpqZPplDLtvitNjaKASzmGutFjlnI31ilnyhi
         xOu5Y6aR+qLKzQ99CZDfEiAhxUI4788DySueH7kzx/ZGI/s1Y3M69mnhzruV4Dze7VOa
         HSwhBS9DNpm4I2KSlJiKd2/ZAD+iKxKPYPDB7+f6nXFQ8r4cZhVGcoQAqYCl4ve0TAkL
         emMZRO0UV8o55CmuWf1de3A6UuTFJF3EjptBDa/ziKnlCX0LhrN8rJzQxa6IWTfHI3mx
         +K5Q==
X-Forwarded-Encrypted: i=1; AL+hErEgJ31Oo/UWY0nLGX+7L1EVstjGyGrwdSZ4tSP7CnxNG6UJ9FcUKWJp78jwoda3Pv8d8is1fyFqO+Yk@vger.kernel.org
X-Gm-Message-State: APuU4Z+4PiA3I5Fxe7UUYbD5biWHa9mNiK/fE2xtnDtiWyNgWAGLSsrb
	dRS+NZxMrbNT4i05CNKZadxzNlsSBxqrL53hmWXrZnx5whpH5Or5Ac8pa1kiM35CPGi+9SWShyb
	qsL2AnGQp0Be2g8nz+e4S+Tn3zHOYLhD1pGlRehcMgVeuWPs+pyWeCDdyV8KJ6JgG
X-Gm-Gg: AZFdTZdQ/+WFggu2qouRf2tDhK3wKkqdYN7Gh0CdtTuMKuCWKAe9iqUbFyhLFSJfGEi
	+5iVrb+7nTUyMdMvJwNrUGrv8800z/Mt5XTpPsWXvmSzkFouQZbuucoUsEvoaJlDRGtdqhI8Pq8
	Eg+IkRPwIktmo0gZJoDjEpRsP4DslbKLSWFFOPYj6OrrfgYN7ir2LOEfTGP9AKk0ivJjP6MoTio
	/aXyxaQN/7h0MRh0pb7+ea7ahDCX9B/H4zeQpqtUYSP95z50TfMxIjQFHc1jtv98v2h/1pKR1Ot
	A4zPdXhGz1FeGD6xQtgkg6e4GDY78iUjnWauBthCjcxgTsmoC8ZvOI9+Ea4FYtl8G7+vDJj5Hye
	j8G0frejJqDHehOPC9kkraIh0xu4Yuq7dZ4iDyxeGx/fKpHW6kb3JE9Ilc3APzD+zLfy6pOm3NB
	7nFQgzhCQGqILh
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr3750480485a.63.1795693070345;
        Thu, 26 Nov 2026 03:37:50 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr3750476885a.63.1795693069857;
        Thu, 26 Nov 2026 03:37:49 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:49 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:49 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: agatti-el2: map the WLAN firmware's
 SMMU stream
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
Message-Id: <20261126-agatti-el2-v1-3-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b081a0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SnnUt0fLhKprvfd8ow4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX9PY1RwBCW3xp
 3mRk7w4uV1JntTFZAXU88FgljneeumYM7pZ3D4ZN9uBZpsXQ/1E1bIhcCorzKCiUG5pKBoDRMII
 US/mffWdSU73416rKRNeSx+k/XpR/NvMdGwvvhnzZ8YIB3zDVP1b9pkBq+PTcVBikmqt20TNJFY
 KpbKMyC6y/YIvZp1nQIraP2QSRkoq/xpVC75i7AezUB6DZlZKynLV7AP/5aUZkqOSgWEWT+r2xI
 oN5bVBp0QTR797sjjDDerhQi5VlAWQD6/3jQoWZphG2FSRvMFevE/lFiaYzP66P58ud83btwrU7
 YWKqzIALL/MSjqWnKiEQVP25TSaFUrrc+jDBMyOBfeYXbwWnu0jSxt+ecjPkQEHAwOnfLDPqqlH
 lLAOvrH9fC9NXowWVSz1tCW2BPIt+Au7P/taS+xuDwc1tyHgVTixq8CrR6bsD2UsCrtX/bisH5f
 AcoHwGaO9VHSi6PjzMA==
X-Proofpoint-GUID: iM6PvJwFiaxS4SDl4_OUNdoyi3WRvVJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX895isKYeyQa0
 ZZ7QGsT/0s+zEJ3mjKIuBLA4klxvPKhTI9+e0pN5GeSrwdnTjf+bYrFxnnHljwLzqyGS7/bYrOr
 heUWDpLkBkU+oPjrEldamtkS6XvHljY=
X-Proofpoint-ORIG-GUID: iM6PvJwFiaxS4SDl4_OUNdoyi3WRvVJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The WCN3990 WLAN firmware runs on the modem and reaches the wlan-msa
carveout through SMMU stream 0x1a2. Without a hypervisor nothing maps
that stream: the SMMU blocks it and the firmware asserts 12 s after
boot.

ath10k_snoc maps the carveout itself when the wifi node has a
"wifi-firmware" child, so add one with that stream to the EL2 overlay,
as kodiak-el2.dtso does.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
index 60142be50417..aa8e85278bdc 100644
--- a/arch/arm64/boot/dts/qcom/agatti-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -17,3 +17,9 @@ &gpu_zap_shader {
 &remoteproc_adsp {
 	iommus = <&apps_smmu 0x1c0 0x0>;
 };
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1a2 0x1>;
+	};
+};

-- 
2.53.0

