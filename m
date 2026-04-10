Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6073E8C66
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846629; cv=none; b=J/4RoHsBioUwy08PxXY+ZoreiPenH44GvxQhtnys4pZjLrTNS4oaeQ8GQHbDTRJ4Vm45iFZKIqQXcM9d5g/LOSGWcBaTsisSw7F2fbAisgIEoWv3JKByvsyKiU4qPZucheMDLfMZMuHWL9NUIviVsDgN4kwktvS6gJOoAh6HsVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846629; c=relaxed/simple;
	bh=J9OnPVi7AQGDlRKXt+MWoBDgIpt3jvnlZETPcjSB5i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcoLYEC0ubdW57vH7WNGBClv3JCq4BP8wXfpFhLsD0X3CsWfGu2Aa+OIiQh6SGDMHuoQiqZJyKODmax/F+4ghUeAM6ccpU4xr/p7/O5ECyA8ig3A8M8JDDWqLpE9dx8yO9jJgtcBt2aO1SeBfjiw3QTcTsPprcbHE6FCyIDumT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSBv1/Ks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxgLXxOa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSBv1/Ks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxgLXxOa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1SOi1322650
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q+v2CHIXDWd
	ku8x8lWlY0aFDr5E3OCB8FcYtsok99e0=; b=cSBv1/Ksu3d53PO2w72z2rW1+vy
	/c/1yToQxAgnInKfNp+zvhW+UKw1GlEJEcW7nbZR3BMdkn6Usrt/5/41YmGqov9x
	Jh0AoZ6UokvC31YmmowPGSXD3r7T8jhFPu0/Wd5CgvtefIyKHlqiFWLdDBkjhEgB
	yAR8lCnr/y17PPdmOGl5CfW65H3VnpDWL4z74ddgu46YYs2L1bl+ce61LvMQQewS
	apwcx+egi5rRpu4DrfkEGtS584n90OVSikeIskkvF9D9UgRcX/Y5lDcvSOOYFcLO
	5RbHoF1QujZ3exw54rdO1sjgsxxIcYsB+q7HYYtDcGwW0LQOhbrS2ASfnwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh9dj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c7ec40f92so2335768b3a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846626; x=1776451426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+v2CHIXDWdku8x8lWlY0aFDr5E3OCB8FcYtsok99e0=;
        b=OxgLXxOaM6BeQQGDut+uvXIlr3e9hRuqer228MCB7zb2cD5M9i9UG4YHvpu6H0ct7u
         FWICwvtk2L8zydZu/LBhEeB1q4Qch0dpqcR4BiRlPXggGEK6eBuT8OP0klQseJMdoBfX
         uiGMrzmYGTTkHum+zWy1NmU9sls1Bc8uGRtgBxVQkpg++hhdKl75cQnl00m6F5r2Xz/4
         JjMbDZVDRmTjCu2JxJHgs0PwSVfbB+5XZzRm2majPKkG3XXXvwe0E8vO7ZWmjjEceKm2
         dBV/OnMzbEnL5/n1Z67c2RhGzMj9dFs5AFoow8RamPK+VGnj9aqERGiodT1pe2chHKZe
         1RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846626; x=1776451426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q+v2CHIXDWdku8x8lWlY0aFDr5E3OCB8FcYtsok99e0=;
        b=XlQF8Q4dzHeZLS7woYV2CyXHPo7V7zFuUSE9VB3cVHHWh7FfM1QmozUVMrmiQEA0R+
         CuAgGgwhabd1yyamr/S2Lcc+ZzQqc9g9pW3mTtuP5IwweRDEHO1kHLgPl4njJrt2T/ME
         wwSox+rIGK1BLdmzRnVWURGckTpAQEKTpjJPzrrXc64Ws7OPUY08AUjT/9k0Bf4qAmOk
         ZP7/qWorXOJY1Yt8c/5Az3jj07Gqkh6SAeDRmX+reuWEW1ikMlCluygQIFljD2B6+jjb
         wbDO/EFRKfUohe2OXaEyIz0bNJhdFlmuSiKrjvcv4NFi9Ck+RaRJnSCNolQNt7axs3N+
         fftQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAwCvThW+FX9zNuMbLfL3FJ3a/XDKkS3LuSVcOfMdWRB6gcsSK4XQLIWtcLoJac05C94j32WhPr1nu@vger.kernel.org
X-Gm-Message-State: AOJu0YyAwddHoDyOBzg1x16VFilE8WQEQBIm69pNlh5v1/+T5tFoSh+z
	DG3WAHfRacF+P8HGZxx2iSRNoDg0qBFD0tQ7SSO2Bzdw6tEWzFJwbASmbckHgS8IxS40/LX3jWc
	u5JcipvgkTNhjzTW7cFXHtY+M/PU8MEDvYyF/JKO7tSioMUFR0rMVKsIv7J8NQQtb
X-Gm-Gg: AeBDievQ1pPw8nlUq8oJ5xo0wiqHVno663r1kLEa7fzbiUuKRuKe27GifB95wqECefr
	ZVAnj6JTzsRVC7Rbpm99Sx2KRLW+OGtl09lydMB/mJj9IaBYwOCTvpYXnsy+/n4zIdu2bOnjiO7
	hhDm1Ga1KH94+df54TeFOSihZtoDeOjbL6oQ/laqF01WbNw4rLnS7CWBWcQSlkykBKjTVBtL/jd
	cRg/9PxhPm//cThyLJYtC89iDg7PBqdDicEYf/4MYff7gdXnpxDdZ4/28KJlXM2ij4aapmOKi6m
	f9QD3w2/Pkss+u/0nSpyeYzFHOhcSMHbkV3DjT2nlx2ORNmlwy6W3aUGmkLF7fNyryjcoFs6ZU8
	vjwgltYXkeksnQo1bWA/wq8w9eGfu6I6s9Mw98jeTgHDK6UV4
X-Received: by 2002:a05:6a00:1748:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82f0c2efb76mr5019908b3a.47.1775846626195;
        Fri, 10 Apr 2026 11:43:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82f0c2efb76mr5019859b3a.47.1775846625556;
        Fri, 10 Apr 2026 11:43:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 26/35] arm64: dts: qcom: sdx75: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:03 +0530
Message-ID: <20260410184124.1068210-27-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX2yMkzLp8YIbg
 SeiDrzPP57qjS7xspSkowDbShj3XeXO5RTIdzfX41RlB61S8GpJZ37z6YFlxABj35c1mUW3bgKp
 AH4sPAKRKFRBE2RxlAX8oln0t2W9HQO/4wT/Hdp3/wzkU4NXfvKRFcPYSOXtskZHKaWZIt56FWY
 kYDmHlkHowPVyhMGbT3sK2Kb+96y9E5PeSLYTJsQVshK6cyE9WmeVKVBSaciUA9tXKQHzWyBwWE
 oXe3cvU1bDq+xKUwX+9S7VZqJ3qucMcrMkCcOMeW7gn1/W5SsO+TPs1E6nd/vFWCmhGasXNhKKP
 ncqlsBS/W2G9dO0KuorL7d62LA7VIKZNeKLUnfsvonbRIiRm7OYDNPEQm87LfcAAhjPjgxEmNwb
 txEGa8X0USqkEZsyuNGq97oTUdL4aHtIhrUHUMnrzmu5nmcm5fGf/pubQcKpW4GOzRCKtZgMOMF
 9P/qfsGxnlxSq2gzGWQ==
X-Proofpoint-GUID: 0hfI5-baWg4a3ATr24GRf1UodURC1ZnN
X-Proofpoint-ORIG-GUID: 0hfI5-baWg4a3ATr24GRf1UodURC1ZnN
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d944e3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index eff4c9055d66..82a8107f2f1c 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1100,7 +1100,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdx75-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 147 52>,
 					  <52 266 32>,
-- 
2.53.0

