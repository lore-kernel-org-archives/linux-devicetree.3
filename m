Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667983F8EAB
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260752; cv=none; b=PWRtc1Dpn5+tMmpPBI4caBJJnLSj8GNT73z8JyoaQQnRt53Ip0Qu4r5ruXvnPMEDLJYgJNA5S5LKNdkYLyuWL6iyVMoJU315cE29jzbjiGCUC0hlgI4+5FwMaBVH1cAroceK/WAoKDf+YtgK3v8o90YdBpTOC1/L32VK9APuV6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260752; c=relaxed/simple;
	bh=P1G4WD59UslfHmSGoht1INg56+9ueT01g2DBwALfOWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JoqCG3hrqsLiBPjD6ccUKbtmgI3T7hFFb4KphnBOg+3uK7ca1dB0Ye3XGxs8Fh+feXu+kZp12vXmnBsnbT6zf6R7GE3ek68ZmxC7PROF2PVhPmGShZEs35SMtfDgFWEIyZKTFImSluRx0eKMASWsX/XGV2i60tzNF6Or65cWYUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNY6Ix+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGs3zC6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNY6Ix+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGs3zC6Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcWAT029642
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRYrJns5NOatNwE0rER/65uy1hFRxfwp93geYMrH+V8=; b=LNY6Ix+9a+3ohKyT
	4WXERbNXCdpkij2KPsFPYnVzg3WkoOYPzSYxfjOshMOFCafvHF5n0i7pGY/60Cos
	uA5+NCkDHNy43W8iMvNkkQ52MwMeJnfTwWiqQExB9K1W1VxA6F6ZQFru2VMpCaQB
	qN4fBzs8uuqENA6vo5AXzUpYo8/MFjhEtlEA0gKXjxscUcnHrZMPkO8uBdzEU6EG
	PAcYQIkGz0xE23qGw0YY18xzs5+ipHvUMOzDphogRF7IOh/fxgKOJ98QsEaMcdx3
	/tVyDRRVoiKmi2EvkIRufNshhaY6bTkJind4p0lUg1A1EFiFUcl+JZNFDTzylXPd
	LrSEAA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxhmw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso54032a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260750; x=1785865550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRYrJns5NOatNwE0rER/65uy1hFRxfwp93geYMrH+V8=;
        b=iGs3zC6Zf2irruwkmn8LyinwRRSYqoeza+LvmS7EJRRUueiVxvEMkO6nc4QMB5bx/X
         ZBB+Bm1HRXERvnKMzW0+CPod0I7cQ2x1CeC/5K72RMC8U9YfEXiC6/2kFYhuA2OAFsPX
         won9X1dFgbmQMH/yIsXqdKnJfPUXZr7NqVYv1GLbodaQz1Cvoe7eFJrNs0bYhirrT0BQ
         jR5oIo1hpYuqxI6g2kyo+LpFPzPCYGokkKttaKDeq5fQcWVVdaYMYF6DFxut3DU/4gA8
         /N23wuvkNClngshEcvWtYW5Xd8NfuMqrXBX7YDzOf1ot19D3c09+SBCPXOrzGmEyY1CC
         IF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260750; x=1785865550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRYrJns5NOatNwE0rER/65uy1hFRxfwp93geYMrH+V8=;
        b=pkPJ9xRaU/7w1APaVJWOod+5ckaIkv89uFGPwhvB05YdvaxBy1rR1Q9YvgxQnsOYsR
         3TCpCjzbT1UvPJlNj/QZDsIrqmWNKdL42+p0W0OMzSOh4yWSjrVltyfqgDiOD7Tmurtw
         MnbcLjam/jktGUVDBt5rAUdGsPomCg9P6994CTPMK8vp1YRE+wfkLrJdWMven1zTUIXi
         0tQ8RYN7yurQbta84271IRnPqHZ9IoypTYyEKqRhllT/xlY5nL8iqgA11DrSbDayfFO8
         Gq6FI4eeMY/YCcy4hd6jzjUgfjUjWbwJbTZOTZvbeekcWjbaeNTvlSxrFmIq3+HHrNbV
         UORA==
X-Forwarded-Encrypted: i=1; AHgh+RrSnl5HCAyEU0UgGCWKlQ2hhC9nZgpf/+ySbVFZoBNZfCBLCVIfLkWCzjLMNsfW299PTC5Tz+xwcPro@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQRm3ZqNu9VPDFie7K9+hGGufPLX2Ng8d83ySd7IgqNc31Ca9
	PuEJJxZOXtrWeN6SRPVgGOQe7EtTqyLD9b7n3x+biLuzyIeRNWR2dRtLv/i8ZXXi8F3cKn0tb3+
	A0KokwZO15Fq2Ns8EpfdQpawPuEQTyFylKPw/iUxoZfz1qF974uZcGQKLRkLH7Pmf
X-Gm-Gg: AR+sD10R3qppnj0dvXibmmIrfTl3dOe8k0XqWw9EZav+dcZF/QBZ+ME0Az8DMV+lNm2
	roxYZUXAQRbciAV6xY9ZMsh2sKTNp12ATIDyGp1vvDrt8rzOW7H/Ofp0r8q7l/56FodqLqZZNwn
	Xv39zFgFRQ6JZFMRc2orU0Kdsf1HToLcojqPhSLoFqnAXEfpki+RLpzCaYuvYb6hdk1zoBvmgB+
	BnWbQ3kVPsEqzMNQojZhUX7+JwWJCAgeQ/bCNlDb2mht6llnBJtlZXlrCkaQKvIHzNLLcwHxfsz
	Gm31zKlBn2/VDz+Scpd0PmxB2ehQ/uGJ8vmkHZ1ahjj2SXf0lUZVJkeXK7EzufU37MdcSqWxRQN
	dxD2Lpzo8ZbfmApJP7jdIrqmXnHUiBdtixbCn1655T25iBsriNfE/e3tl6beeB0GNIcCGYlP9+a
	fOh+PBYo+WViRk
X-Received: by 2002:a05:6a20:cc9a:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3c8ba487718mr4060419637.33.1785260749539;
        Tue, 28 Jul 2026 10:45:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc9a:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3c8ba487718mr4060361637.33.1785260749050;
        Tue, 28 Jul 2026 10:45:49 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:48 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:36 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC
 fan thermal management
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-8-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=864;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=P1G4WD59UslfHmSGoht1INg56+9ueT01g2DBwALfOWY=;
 b=MUklSFiRRxfy92uWlIac14UMm1zJFUEi8tV1gW36noUn8RbsVeyeLf42/o5OwhJPWE+c+0SWU
 8gNlgnjQRyRBgRuBFOkrri9XbkUAWwT0ghpZiZXzbRlk1lpzJhgeAVE
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX03axjiRNPpfU
 vTSOw3v5RKp4OTB2b1Pl0GW654IW+COTjOYgp5ZvwpL+FdTWjn1qpYvTf9J6xZo1ywMZmtF8mYX
 1dk6URAH+SWqGvIwfZSGF0j9WwHXMOxMP+qyCq2SbyyVQnDxCAJJYq2TZMvwhGdz9lMXYCcAE75
 HAg9qpmIfonqddUV3WsQKCuWT94lbySn4KM+C1olzIx6ImjMnU2SILAB/CBg6ll4Gizr53pJrIt
 77wlK3taXPavnDonmLZbK9kcvNodise8uRrGOk+QPtz7/bu8Nsf9BZ386ytkYXBZlOk/EbmtODc
 gmyDj4QPhQKEYwI+5lOvN2Sa13dMFb3ryweHLkxrhslkAa1w4klQ+zPPvWG3L/PHDCuLuUCqkwW
 6Gbz7N4mhaTgbOwVOHSAHYucNP/xgIN5oHz6mnYzWOt0XVXkA8z8jI1nI+QHoYXtDxgU/aMBxv1
 RJknJz1/ihU6CFxRnlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX3K57/L4M7N67
 cJhkLiDxCV2J7Op+YpsldOMZohtV4Ngup5fXvCtvlakjjrUXjgIBorrVhCR338YV5RjgzqvED/h
 tVFZPP0mx7yveHi8zdJeEgUKtN4O9p4=
X-Proofpoint-GUID: C0MleODlIcPnxqToB-PMpjdIALMnfyT-
X-Proofpoint-ORIG-GUID: C0MleODlIcPnxqToB-PMpjdIALMnfyT-
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a68eace cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vTKaowFdNFDPXqI30QAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

Add the qcom,tsens property to the embedded-controller node, pointing
at tsens2 and tsens3 and covering their first 11 and 15 sensor IDs
respectively (CPU cluster, AOSS, NSP, GPU and camera) used to compute
the average SoC junction temperature reported to the EC for fan
control.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 429deffcf3e9..4639340e716c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -20,3 +20,9 @@ &gpu_zap_shader {
 &iris {
 	status = "okay";
 };
+
+&i2c5 {
+	embedded-controller@76 {
+		qcom,tsens = <&tsens2 11>, <&tsens3 15>;
+	};
+};

-- 
2.34.1

