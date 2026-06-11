Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECD0366DA4
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207427; cv=none; b=BQiKUITQwLu4EHFt0v0aOmKKvXlnMLSnqT3alEz9wGQSHcN6lbNCsOWszNcK/36t5nfrlM7xjDNtGgM1/lnZuijftEMq3dXd5cSHXH/Kl1ZDuvV1ZHSWUltkXQ74l4FC2pcpH7ZRXicOnamdwKRBEAysi3LEw8ecMZHh+WoEWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207427; c=relaxed/simple;
	bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNHd3FsBsRtT3l7lARabc4jQSwYmT7hlxzsIqnP2AFRcCJZ7wpkL+w+Gr/9N9qZtaTu/4q4JKxmLhJ20GS97yEfzhMGpmTlzwTDkglZdgBlx4IhmuFCxRXYAurCjfWuxw8fnVZm/YN+CZEx+bOEnPJdvjK9TXAITyoCczpbQ9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yo6fWrbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bt3ZO0ZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yo6fWrbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bt3ZO0ZV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3LfD1388814
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=; b=Yo6fWrbbHEqTdN2+
	BXCMmGE/oR4TVPurtKi4M6rkVpTUtoKihAoOU4cvGMpsgMbuChFoQwpTHFzAAdPw
	u4tX1IexymsYYpI25vcFD9nrEIbLk7T5GWFYQw5+wYbB6zUAEnkvFiAaCA9VO1zm
	vm1pFpbA/1jveqNBGGVEpHg33p5GvyQu9U5Zu0rNs00YH8nUsgRwX8iwYd8bSZST
	RSjjkBOvrUDGZGfJ8KJQXtdCd+L4k9vXKIeiaVQS7x/MFntYLEWkGoXUFnKYLHVi
	Y4vlKQowdjseGxsDCiXY6kKl0DF0pIJMNMg+D7j6kJF0VCAmI0jRMIwGlIxBKEQk
	qtzeHQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658pyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422382178bso150955b3a.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207425; x=1781812225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=Bt3ZO0ZVZppckBl32IfyDsM6SYxaK0rz0qn2vaABfJNk3Nh/GuS/ZAB0IvikD5sHnw
         TUmQ94GTTxQWPd+4+dM1oMaL3mP7BvREeTKq0i/AEqao4wtQl7ZMuiEdgTVnS4DExyw8
         sZayVU66SErrAhfVC6ojUDXpKWWfgqSC32IIJW/LpVMipZiyDsYZeSxIaRi8JOL5DjUl
         65aByLW/BVchBhhOtZ92nxmD2Sk+vEpoiVZtym9IL8RvKiYkFaqD/q4QhDBnS9DKB7l6
         XdJLQeDwCh07GM5iGxT/V4XeneJ/iU+rbXCE2axrcICwyoLC+b29OsqReumILLsLY9rk
         BdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207425; x=1781812225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td9/GS8UuO/ePGeolAIDFl2twIGZizf7TvlVctc8VrI=;
        b=VTWFkcoRMdMInVJY+yYtoov5pYRNCdJrizjFLWRwoHcQhO98KiJgnmHb30QTt0XYkq
         MYanR4W8aQlWOWUxKuxtpWouRWPIdWzjDQTsUPaD69bMEOE9NDy8Mdi3QtfsxxiB0VxA
         2qvjYIxPjuKsvEqOb1wHq7wTDWIKlLjn8BDQayJu4RuFlf3KSIPcx7+bWC82fA0iajTP
         T0LzRpgCEsYoUrbAx9g4Dg4VDxucjY1JAWbl8Dj2ds+Q1TVIN/xotfiZ8DJmTZUMHlCc
         tLbINnDviZFOwu5CUrQmNFJhedD20UEI1SI7xquJwpt1F6JwuJ2OEvBe0kPhqoM/9lUq
         f2YA==
X-Forwarded-Encrypted: i=1; AFNElJ9Egqy5iTlg0TnWlbroyA0hqxe87xUeefQ7CSqcAjkd8NYtsPDSvNOQlulVaA0WOoD0MrYJofF11WGA@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjYTHGaGhMAODDTz7r6NxDOWZWrZ4egJo1w1NFlLNI6E8mklF
	XbMcFG+91BQVQlNZ5szwgsiPpFIk2B2qqZd8sIo6BKtoQIIALw5kcv6RE+Yr0nGwG69Eq4gnSVI
	3JnKdx3TJG3ojRFsDV5fN/pVAs7i5IgQahKMDoM2Ptsye6ME15PrC21KmnN4krvX1
X-Gm-Gg: Acq92OE1DsUWXj0bfFms2CqqvHaMtSueNfkVuiGJuDFjhzJ6lELr0TDf+DNae6Bh5Da
	ngD2AVd2Ld4O2/5hHmW9HI9/Riwk9Uiy8f5hzY4yTPbTn93VVmPEPyDjF6Blun3ah1FuIYzU2mM
	Sg7DMxc7zHt2qsVgbdOxeMxZ0RRIY/qlYIhADQMgDalOJKFDfa6bi+nWuBDE5Mwt/k2SF5Tz99O
	Yylz1N1wPwqiU72xnvtOaEO38dPG7vdY2+RoOmji2A0Mee1hfGTkkJMi2F1P5KgyL6QNygpqPJf
	gHKgc/BqURGrCdn0rPTMMifCFgNwKThFHd3jxW7WobIKiE05OzuZrvU4tTnTut11GHte+Ny/Rvy
	aCoM0d3g6ChY6cUaLxyE7oZ8kCCoPTWoBn9AF0on+C3as4UEou7K/MaY2
X-Received: by 2002:a05:6a00:1412:b0:842:6004:3fb9 with SMTP id d2e1a72fcca58-84336bc5d2cmr4894854b3a.25.1781207425407;
        Thu, 11 Jun 2026 12:50:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1412:b0:842:6004:3fb9 with SMTP id d2e1a72fcca58-84336bc5d2cmr4894822b3a.25.1781207424932;
        Thu, 11 Jun 2026 12:50:24 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c93d1sm2711872b3a.36.2026.06.11.12.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:50:24 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 01:19:42 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_vpu-v2-3-bf8727370a1e@oss.qualcomm.com>
References: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781207404; l=840;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=iPj1GW/qSdbvXy/m2TA9PC5plLIoUtFqYoEG4CieKos=;
 b=0BddLLk9elfDid2qGrQaV/W6cgRA/MvsDd/saJZnUXolYmQyxSdrHMOniDHoXkqOZwWy0dIh/
 pgtJdKPsrF7D4J3Tlb3gRPrwMMjavdL0MKjVR8utfAqBX5X7wdFP+uG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX+ml7l5f3k7pE
 kcFEP4hiVAacl4XSdyIBaQBJo/L4aE5sw/GPK73hMEPxfvxGJRZ8CsfOEY8sgx0XSYUYJummho7
 pllqsGiFH6z7a1Hm5d2xFYHTvJc97B0WM/6BHzYUkgJAybsqPb7wqP87wktrcRgT3iOxySglNlQ
 +dZXf3gEzvwBI3LLIYD3Pj0zVOWEbfub28jy18qZUhrKTq5ossRjIZStbhmSzC0PFahP8dSdZ4/
 +NPc+9ZSend8gj8NXbLFeZfUxZqqtYgy66E34EMiWZ/A1VC3nVW10002h5Bz9zO/fRe8uPfSx2+
 88hnh68nBx5oo6itQn0/MiS/6KWB+D6R1yahYS4YgPRntYYqwaUY56OVstWWdbkEMtNyF6tAnpm
 bwmqgip66Ln7JJXnlePBb+e/YgZ0jERoH+cIG8tk7UzeXDBZga/v6UHD4qakbqHqSRt3n8leW/p
 34u/IkVpGBxfWsN6p5w==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b1182 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: lUqrzC3buu_5tfZhEutvQ3naF9zPIvBc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX4EeWhzwbFeem
 u+RAjfuSa1qdO0IV7aFhg/ClkXF8aNsonJIFaF81UsHFW02rf5v9KF86vPN4gszjtA3CkCAsk1J
 8FgSuxkpMuBY/qYMCH/OP882mM2ZN50=
X-Proofpoint-GUID: lUqrzC3buu_5tfZhEutvQ3naF9zPIvBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110199

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index d0c48bad704c61d17309753ba2a97e89bbfe083f..e2a3131594f0410931122657b12c8a6e70b435f0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1

