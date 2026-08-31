Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF63955E0
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195450; cv=none; b=EjDTmuNI2/Pduo4F1lquaBiK8wRTWQr82B98kP2LgfIHeitwJwhwto4cprG1z/1SWlcIvhTHjrMhdGr+DEM+H4BpP73ejFeOQgMqSrqUiDEZNa2fnnIhKyh2+fZE2KwMXiulVvxeicyz/IdgPRgmjBX8uLOgFijueYex/M4qO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195450; c=relaxed/simple;
	bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKnZKEeYRQd2hgnWvuSjx+RX+C19rVwoEN06SUKK+hfWUZIMgtP+IAJPAck+mlao3D5uHSfpVGOgQj8ECtf/qlsQBEKPGpl200IeqDQwWvo6o0sKspQrdq33BjtzhiZ09CxFXxO92S5mcBaAK/vF493q4JqoYuHYxiAzuQiA/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5owSjKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2EFUCWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5owSjKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2EFUCWx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VGPUDw4073469
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=; b=V5owSjKSOMKsOwwn
	OR+i2KyNt5FBm0efVJPXmKnyojK9jC0UFdbxO4w/cgmKaD2ZFZWXbxnnYRYEbnEn
	h4+YSc3lUVHvd+35ZbIfPlZwxrFeKWJEtrd3lcY66Upr0VIeDHGhZqbSfjbtZ5Tl
	mcSIhksRjl9QPGWiETlwRY505wY3H7O4Z8NjbJYDGy/HEKN/8NM0wFRJ8o50GBY4
	T2hICs4NsBYqzZcIC23vHMlveeAsvYe5voEm+lJoe621gnhc8SdBv1euLP82V+9o
	0JoqZ+aPKnc8nMPdZGcJYe1e6gxuvjBE5woNWmP4adBCqbNk6I3osAVh0Pd0wNus
	Qk63Zw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dr55n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:57:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso479148085a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788195447; x=1788800247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=g2EFUCWx+PuDrTZJw2/6uqXBjteCE40Vtt14vHARVmhOGSKELzVda6T1PGoBstPWmQ
         EU8/uZtrmuWzwH0rG6uRdFK31wmjQlVKQzHVoLIpoLuKxag+evZD+CrixgKRIhoFXceD
         8JQPf8+PEkIRpelunzl0SLVxksN6aY1kHT1ftVszdfvfyuaQtFnNdbUtax/kqjeAOZoV
         p0nsVrcmliTZPO1qxGhcxSqpE6Ck9tDS+kR1Kc8dY3RC8RwyJI35KR6+Z1oJLimoLsJm
         9C4n2xv+/YorHfZK6DST2GdiQbajRMye8kO6oDgcD2BHGwXJSoWN46REQn7rCkfXGa1O
         4UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195447; x=1788800247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=SU3dqyOr5Y+KI6bZ9facBk4Ee4ywAl1pNTHSVrXhzhq0Dsd2hWYUm+KoLdLX+TY9Su
         v5oXRsfIfkYUv4F8Ekv4XMDFpt+HnPJEjgDD5TRkYRPvIOlp13GFMr+4SonsvWSh9XX/
         kcsd1MSmneEZxql7BRb8w7vGHjXm5mXEKO3veXa3HnW6SIVComJqTQMrm6M+n6mE9Yvr
         XUp1mUYZ2DXmPquOFG/wM2OTVX5zb5r/N1OVbTa+7S9WGgTfAFJX7mN4RG3NW1hUiqsX
         /8N0OVWrl32Q4vBLeRlgOpe5/+qzqBcqqWLt0ctei9If3YRI4kxCq8cbHNYcmtKdRRkD
         o9cg==
X-Forwarded-Encrypted: i=1; AHgh+Rre/xmnNPtfNTViCYW18+AcfRTA2ormeZEB2OSp2a49LGZYY+kYf2eCHcaxmgGq7Iayd4pazNnVLUmP@vger.kernel.org
X-Gm-Message-State: AFuF++kGnkUdvshDfnJmjxCJ/dN74o76Ebw7tz7hP89DqdyqGXWDicNf
	+CLc+BuBrA0UPTt7UvgJlSci5yY3c4tcOzKPwL8f6kPDH0lUecU1qqLNsn0j/j13Jj5rY+tE1Xa
	axTgcl9kOdJ9acGfckWb+9/+7AHHK6ZdcnvNU1YB+4JQXiv09/+7mGzxK0bCYLUXM
X-Gm-Gg: AR+sD10/C+vri7z86GRMIcAUa436zHXNsaJe2cbNE2LVx21mpHc7IkrNaLdEOn61ee0
	r5Lsbr0v+R6IbXHqWngf0Kkwnyq5Ueqz+3yzcZpAsuXyeFREONKgHbIMJkRhFAtCZDNfs1eDiUi
	XxhGPtJw7K+rIfbO9isthITqTYpEqNgfSILxM12EGSMZi6W0ZCsO/ZEU58I15IgR1EzdrCsawwx
	Ttd3vTz/3LtRi6/Jkhd1wMDl5SKrbfuEWc8940pzBAfRYbJRiFzESYlxkZ4Hj78IW+NozAl5j7J
	WZWBnliXbdT0G+qz/wODd9Off7ngvALc3rtkeFSsXp7qMzDH6cv07sGDkZ5jkQIDd1blq6mKvrP
	p30wIUA==
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr301138685a.42.1788195447165;
        Mon, 31 Aug 2026 09:57:27 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr301134185a.42.1788195446692;
        Mon, 31 Aug 2026 09:57:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm248426785e9.1.2026.08.31.09.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:57:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:57:13 +0300
Subject: [PATCH v5 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-eliza-add-cdsp-v5-3-dda8af2d2920@oss.qualcomm.com>
References: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlbJrrIuYy3bqsq9/BlCTsdxNiAex2geih2Cf/
 m/p+D+Y50KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapWyawAKCRAbX0TJAJUV
 Vu69D/4ngvz5eZmksE2CfPc0VKCZPfkiqi92QQ8rICa0OzLqIhGazNEjJFgzHWV4kub49jcGm0Z
 5Mb17i69tFM2NEurROCMOzJwYqrspjME3LXFSUQhQiVSru7PNKVvfsng10uuCcYpgTTkOCuW4h+
 JlmRsI3Xn0IpUX60SVu1Opy/S3GiWB/5GwjkwmqcG2T/ScgSVy3ZNLNSUFdYSltmz6xfhODyppf
 1uw2bEG4ec+vQfIJE0v91xcYqUvdFivu035mXulta/MhV/qvYqY5T/DeP5Hfsk15opEVrAvDX7i
 jv/wN3oo7Q0LY352COCQk6cnHfg6RoH9rz3MykTiMc6NpKckTmkKxkZkJVDCNN6GMSoM+tqZ9Dc
 n+qxBej8HQQduHtim3uij4mLj4Hj3Ap85FVNofjhHvpmjgrdZbyWfCkbrAZpriV/icpvQr/xqq5
 qxL2XIWluEHl88QMn8sdgRtP+MiMLI85rXsh0diVl1vzRF47FRwyVb2KB48TQsRCmDPLHtuuH1d
 Wz9t2eusbHwHAwVLY4EkoBl9JFIW/8QK4sncnpCkoo5mktGi4m9ee/kLslDza/dBtWyeiHDSiwZ
 bMvcFJUW/4oidNzYM3GVWDFhGLtNI4edxBmTOIfzzdXPvjvkx7qPMigX0Gsu4Nx8tm1o0JPu2WA
 cptrO69UW44pBug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a95b277 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gskBRPyYVKVSocykC0cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfXwk6JB4n1uImb
 +T5sMYdGUnY4WpqZ/aEA4n7iyXdP5vklHbT87lcV3f8PvoC6VHVAzYnniTRpt05LPQ7rtUQwQRM
 cyZAUKq81J1idHGAvji4N7sRQY1yrmuUNkdlsxRJz0RePllQIzq51wF+kvCUuilwnF5Da0ZzdkD
 5WPlVHsT5aL4M2KfPYeDVwv78Te/wqExOl04udGc472K3bgHTu0hk+llWwE/+nUVLgGJEeOmYjS
 zRgDV2eYSER2PC05x/J3yfNUshhyMUqKuIoOoakK1pQ1NUP8Y6JQdvoDqu3fBkClygdh4Bh0RHe
 a+b7pmvx0mF5zo1sX6JA5kT/tGvlBiZ0Gz0apNqaYC8NnK3QYcajP/oZIkEu/eqCh3z9/hJ/XAY
 9ux3dTk8KDXfQrcRoqpAv1ry5+CoHuuoPK6XWBTVr3WhNL5KXYHrYeP7YHMEc5rdGKhqgS1Jf/1
 KSCfGsJxdm8/db4DrkA==
X-Proofpoint-GUID: 65vwTvU3wPxrK39eomSui1d5uYSI_3Sf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfX22cVGFJSVz8U
 cDssjoXHsSbXZsSEBXvicpv97DzsJLoum1PZjGNFAAQu+q052Ksv6Y7cEhcWiBhf/tpfr5jwh+Q
 4yuwPzCEgzJIN9a0bktl434nmRychSU=
X-Proofpoint-ORIG-GUID: 65vwTvU3wPxrK39eomSui1d5uYSI_3Sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310146

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..c55947f52123 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -381,6 +381,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

