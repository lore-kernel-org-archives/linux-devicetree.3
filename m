Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9512ED843
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410848; cv=none; b=mLy+1h8vihFzZ0CvY0Mg1ZubKLFLK2YLdy8AfMnW6L1ZCAZXOKeTvLp/w4+S8fKakoTV2x3U6DFQPPsOwcGcWCkIhnDkRf/otAns3j66jQKb4WIgkZEkvts16ik/Ohxdh9vn+jIOHlVpcKo3xOllGrsjGgkFB6fl1b+KC14o5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410848; c=relaxed/simple;
	bh=+KjoD7mU/vlqAGhGWGVLACM2Gls8RTB5jTBpNY7UISQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cd2DheOCxFQti8edac3uUwTM4oOgMtOBcNQ8O8ueEngQStN1X3V/gnGHvKyHKRA98OWOFXVEOt2/wFvxS4pCIJ5F7Ul4ZlwBv+3iySw90dfdzyB1SlOjpRUbcAr6GwXTp8oELbQdVwcaSrML3DdRGGS7BYNe7U5XYZ3dyzXEXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWZb5xiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBrwYkAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWZb5xiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBrwYkAC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD7pl3731512
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=di67ISekbvw
	bJhWpM+p15imtrW+SyyjQjZ671m+0fHk=; b=QWZb5xiC7p2mZ5gV13bNOJYB6qH
	ht92Txoa/5EqyO0OAAybey6OMfi+1c0NTMqpVXgAT7+FClKSKmeo7J2+eP1bf8+j
	Q5KkNEwLP+mVOc533w4qtVerILtPz7X3WvkxVJHJiFXkfjJqt5DgnuGxUaO2LaP9
	wt85BhDLDSaJb9mMnNh+QKXb+bdfLtMM7qL4M0SXA4gKrM8PS4fG6XCxnhYrEGdD
	dwWwBvK85MSBS08g4V0/qg+OtzsDBERBjaURsjI/jHDnSXOG+KJbRJF0slQpb9JA
	tknGKhGHTegzrAi0AE+92a523560a+wQnDOMIufCwiVPAf0+c+q7Flq/pAw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkeuu2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7414516609so1268226a12.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410845; x=1775015645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di67ISekbvwbJhWpM+p15imtrW+SyyjQjZ671m+0fHk=;
        b=VBrwYkACouO5TmuwhHp/HOciTnVLxxgdg3IP06p2f2vixix0Nbq7PHQlG1PEho2eqn
         3GJXwVVoKzJWHmx6Eqc5kBgLpSOqJkGecwHrxgG4eKT4tAWnNU5j7ZItm6goZyuMxkY+
         LG+Yx8TczWcYaL8f+nnvD/8PBkSHy529QtwK1rFOqDRbKHSvQbfLllATlWlV9Z51VxMP
         HgPpFWxWKandcfmJqgLb5r6MTZrVKuW+lDtU9XWB6XVk48UefULGhBq3WdPebAHapLZF
         FsdfHRE5cOmm1LfB1KTDvTfQPAx07B3R3O6aQrUnNQx+qM5wqJ31YYnFAVNu/JlLeR03
         Eemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410845; x=1775015645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=di67ISekbvwbJhWpM+p15imtrW+SyyjQjZ671m+0fHk=;
        b=n1zRjcC41tbNriaQPf0sTfO4N2z9C2FtAV8BjblwKXA7gZCJ0D+1Eg7MG5T3CUVhNi
         alG82oN2iBRqez9/NlwNFPtkPwzyteeIA8rGoUkhhzUdFAB25VYR2a5w4rvCc8ozDuZE
         brHHXYxBhP/kYo4IywKCXkdmlsQTAswerdsHvy8kDix80uQ9ckPXMi7rb7qox7bfPblU
         UZTDP2Zbxf0JbdUNfCRuGehm9YLBsiWtEQqMeXPaZozXOFSQPdA+SarQnVu4Dii5qea1
         hH54n41qUsxGUTrbqN5ZljzEmPrCYSXs/QUACxIn/a2eIso8tRc39jVdkynIfT7azAxi
         l3rA==
X-Forwarded-Encrypted: i=1; AJvYcCVoFc05AYv2OmHTWj3ufnWvVn/HcGJn8uFBTq4EVY4+fi4CkIV9Zmgu5xrVpivdp3OGmNZTl8PyLo34@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6WFIV/j4U06xO9XT4lVBMRDaqtupMJJazfFRezLKttpeEKC9
	GAgqgWl+8uVaiRUvmbrmDKmz1hva2Rdv0HiB7S1MzwinqC+/pbT9ieUdB1yXDFZOMVI4iIhNCwi
	M2FeE0JfIzlBeuZVUhmJDMFI1zuKRc3e4QIBwXwFBe1OW3/fBnKwidykkdKi9WLTF
X-Gm-Gg: ATEYQzwYxzRlGMgqrv1You1b7ureeR4cTPir1cSMoj5MLPRE6XE+MCuJVP91LyRJcAD
	Ryb4ai1Bt//3inkkLt7pTpihfi5sw6Ufy5XJ0AziGN/WpXS6B3puTqlGJ/VTKrBdlynr5UQDoLB
	sPQ/gO0JlGnuk6aYvLNKMMhAMDCReyIYi+q1iji+xPvhKlk4fnkZ2QUofLCZrtRCyafwInIYgRo
	r5DOH9n1O6Qhl4swMcU1Z2/2tKjbF/fzn1bAHiAYWGPohYjK4VK57eZtCHQv+wQRhzaYb9KAPNK
	2g3c20YlmNN9T2jRVwgiyLh8zxhY8awsDp9KHb0M/7YR6qiGwb2eZMTczoNxJhimbExddCuLdl4
	YBeccF/ConVJQtg6fC4qHh2RPeeRV/VmGSgI1hkHlgczj1wBACRq/udHx3rV6WCZpLohEa9Lr8v
	sO728PaZpd0h8moXpfzJSW2xVqmd6t53oZjpAS
X-Received: by 2002:a05:6a00:4c07:b0:829:924c:348a with SMTP id d2e1a72fcca58-82c6e0e2146mr1713904b3a.45.1774410845164;
        Tue, 24 Mar 2026 20:54:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c07:b0:829:924c:348a with SMTP id d2e1a72fcca58-82c6e0e2146mr1713864b3a.45.1774410844193;
        Tue, 24 Mar 2026 20:54:04 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:54:03 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 3/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Wed, 25 Mar 2026 09:23:36 +0530
Message-Id: <20260325035338.1393287-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HIWolf584iBrzFSY9cc3X8DWL0vn6-vo
X-Proofpoint-ORIG-GUID: HIWolf584iBrzFSY9cc3X8DWL0vn6-vo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX3AgD6JxfSJ5i
 t7YS0qzzHj6EpcbKPVNwD7yYP+iXo2XOyhnnFGQkaulagqlOnSRaQlL1GY90vEJezhh5OtIM6mA
 OgwHzwbLQcB1hMjHw9FCY1DVa3EtgTjcygMc+V1YG/zY9iUFnBdsXDPgrekxsmnvivs3VKsmxxI
 egqUbayQDaeYgJoRwt92gOzlW5V+LtrqpNAPieCwzkK/Aw7zrh2BjJCAxuPuuGWoIRX5P/iPIqZ
 iK+kOQaAZKibo+zrKrx4o6Lba3c126pM1/X0c2j3m3mQ0oUhrUwZh4v+JXlvSELQ6uic6DHR+/o
 PHc0k11KAInpyu4aJEfon4K/jaThc2v6nMI5HfzyzpzRgLZ36mdaJK2NAKeKUE1gamIspYnhc13
 TSTtTtYGt/MTy4rX/LuGXeBap0yOXOy6unxwJTfzszWxGV1TkRZTCMkQCDujHtg+rfue+rpWDpF
 1f1fpbCpk+VMxAPXy3g==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c35c5e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=w-eP6_cFhoaRftvBz5kA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index abc6cc8bb0a8..690b90e3d6ce 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -478,6 +478,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1

