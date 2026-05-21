Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E623FCB2A
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368868; cv=none; b=Ig+S3/I0R4i7J761b0y0CMVG1PWH8jB/7nSxMuQgiTZElwq6Ywm2+FHCw0lzTxwvMU8uHNsuzDvATbU4irdRmfldKRFjUFaJO8DOWWLg0kUv0AsfvvI0ZyPrzqTRUqhsLcSq1Ba77zbp9E8tKgh2jOlDmUaRmYsqfmcTUPqtbGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368868; c=relaxed/simple;
	bh=YirJWrRqQcQlSKweDeLmHrzIa7EXeT47ncvGBD26WCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1gTMtx4vtGVoWX+eLYeapO/TDsjvM0pW6dEQm0rHofTefgwz+C2iG9080mFBRjUzbeADLXpr3DXizRfIZP3i7KHcXQSnvg0Y6JW5EPWYWwavs5kwyfzwWYm6Z4TN/4Ne3yLouZ3EcWqnjKX6x35N5DW78TeeRTzAznqw73Ad/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUcrN4dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOIYRUA7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUcrN4dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOIYRUA7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99pbd3009557
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=; b=DUcrN4dzNb21GoA8
	bLwAgkK92MxaGr43xlyPhW/pbqfdTSvvOm5cbzgXYp5dXyHNwMEnp6RZkbQ+hkw9
	qSXIBQAFE0JR337OdFz/Wd7JhzFlXVMK28N8DxAigs7UOZZ6SqAvdARjcwYDSRzg
	vNg7uL8FH6tODiLDTmVSwnwV0M+kka+BWwYPP3hCFv1bGfHUJ46CIKuotlvukhAU
	G1c9sEU6ZieXqE/gIP5ylXjAASloIzFAo1pzuFmDudZfUMzlhEsecrzR95cCePjY
	0bHBRyELrDyAdnXLIDqUgYzAdGuteWPQ+bSM4LbuHWgcNSrJagRZZWHDFS7tHyz/
	nZ6MFg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so5670574a91.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368865; x=1779973665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=;
        b=jOIYRUA7PhwZLRvW7n+7X8Jh58RUdHzpJ4foocQCamnDA+cdnGFpkoMRhtPI6fVhGs
         NlGeX1cY/JBkqa5rv4hraLw0IxyF9l3BPlqyPDeJPA7kryUcUUqgiMH/S1vwBPoxVmR6
         4TK6sgwl4kiMnM5oHTF6frdTF9cLC5XYeh5CLmJ/Niznq6Vg8litOyuncGTNDvgOntK7
         ZwudQYyZF/vCl/0yvcO1CKoQt7RJ2e71lE0koAojCKgNA4UUSd+cSrNAmucWvBM2I8b1
         hP1YRq3CfXAKzUaieNT9/fGy4CZFx2ANjEusYv/uJ3kz9RuM9Ekfc0vZJ5ZCdafNdpfR
         lfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368865; x=1779973665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=;
        b=Tfb+jkgpPfoyynYDMnnKn8E2uQ3wgW8Gc2EBrxth6uLYNLLRoopVl727N+zEL9yrt1
         GCaRj4LTO0cwKaK1QPrLozneFlA4VfKZU+pj7efZ7qndLQWiFM1KiolWMP7xm9mw/UmZ
         soZGXbVL16RtqzwYIOjDNbi740Jy6wvwapQQG86DrHmOBYAKv6r6XtveGFN7eWA4hJrb
         25UsI/iOoJa7RWrF+PX/i9Ydjp0q3y93PkZkqyIwFuItJlxH1Ftz8t3d0JAxw9qG9/Zc
         WhvKpmcwzVi24FfaW2EHkvxt9e5GaBE586w6NiTUAcVDgXnWOop4sooDy0zHdPRncX71
         fgYw==
X-Forwarded-Encrypted: i=1; AFNElJ+fqsCzPyIFW9Km9o1eSEmBz4BzrgPCdpFw4oZAMeQdYB+Qib/oI3LbffZwtRDsm8CZPCAyFYj9jmfr@vger.kernel.org
X-Gm-Message-State: AOJu0YzDoFhbie5aRim6sD+G/UcT7ao5aruQAsM3OhcEn/HFuQ9WRT/l
	en8WdqplgFwwyfAt0hif8dKrf/ZeA6n8RsbtSpD6MLnbduOZ6T9HHV6pQ5aRPBGjdw9G2ezqb2t
	QfPeyTpKJkVB0Fh+aWIZBcXJxyg9yM9rLq2j+Gb0q4MFN3p0lCf5E/W6VG2K/6WQb
X-Gm-Gg: Acq92OEgPfVbGjBGx/ZhTwBuB7O5T+On3eo602zLryUMqIZtzXwMmL6bvcmCgqay9gO
	Xox6YPCGsjlj53iYu0D1jlULd33dsd3KtTgRBoP8KC6Cw8SN3Ook1TK+/UsuCItCYFyrs+SnWme
	LpDSma+bVrZNxaVr2bVDpN9TZKv5rtAaaGqDTooPq0eMRVlBPjlfZcmiyaZLaMu+FfVjUsgST/0
	E9x6XjnGg8pTrXBjOSBh3RAxzIgNoiOsgVh3HqVXd0oB8eAmYIzNa0xBMSn5r8hAYuNGSmgpKop
	7o1mtJDKrOBGcaB8R/RuL54rCgr59Wz3ttIgpT5yN74hEsGAYMrIEJihg6okwnITqzFHTQ07atc
	HSibtBkFfcTOMyVfM/EWtNeThS5+QhF4yoKCrvt2IuJOEg1FWS3OM+911
X-Received: by 2002:a17:90b:548b:b0:369:996d:282c with SMTP id 98e67ed59e1d1-36a4518224amr2783811a91.9.1779368865168;
        Thu, 21 May 2026 06:07:45 -0700 (PDT)
X-Received: by 2002:a17:90b:548b:b0:369:996d:282c with SMTP id 98e67ed59e1d1-36a4518224amr2783773a91.9.1779368864679;
        Thu, 21 May 2026 06:07:44 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:44 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:45 +0530
Subject: [PATCH 12/18] arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-12-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YirJWrRqQcQlSKweDeLmHrzIa7EXeT47ncvGBD26WCU=;
 b=Jvl45V7OgOUM8aYV8R148D/rmh90XxOkj/uzYbOYvGkjVVlhglof2QRAN5uENR5TNsle408HH
 KXl1h2m0pMDBfce6Awn/BSg4H2GhoNBfx1uyDIDKL2SKmKF0W0PG9QE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: uTMzd5Aee7e_EA1Li8ywNlJkOoz2ksWe
X-Proofpoint-ORIG-GUID: uTMzd5Aee7e_EA1Li8ywNlJkOoz2ksWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXxfnmNiJ/5QLH
 ulaK+x/yjR0KKnGfdfWcrmn7rSDmHsJwiSdu2MwcWbL0lIMAlIeQphJA9kbrBdjZqV7aT0rueEy
 Rn1Pc4RQ5Fj8ZTyzbCINQ6ZcXgrBcH4jWI2x0194l9UBBIoiav7IIMvWkX5ddzyMq6x66fIk7O2
 KYzhRHw31YPDRuFD/NYJVhuAHDd8hVPRlOVSRXWfWiG8iDTYDH67+05mUJRT6Ws9IPai4uaRL82
 6KpIRZVOSxDuwbmSuTjPVpsgfFFEeSkLtnePu3BuXUt/E34tCyw/qwvMriWw9FYTykjv59/lIM3
 ULGnUNF6LLh/z1UrJwmk26VtExPtoPOwm0Y6ZCtr8ZoWHb7EeWwrooq+igmvcV41PlYusYpC4Oz
 fP0f4S3qjcqZ4DTl3KeskTMijb0RzKsT3biF6/Ee+WF+Cb9ziuU5gCb4Nqba4a8Mv5CCuviMFOG
 l61dvYV5v5rPitQkkcw==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f03a2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 07247dc98b70..dc773da863c0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -933,7 +933,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

