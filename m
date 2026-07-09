Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB143B4A1
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622610; cv=none; b=d0pEPWMZHKfvrzpgsjd3fch5GWxXh3wnB0GQx1x5ixPKYF2YCXN1Xz2iB6WV5K+wSy1VbHineofjOFOyEH0itwV6JBF8gBtFy83QnaSOkfoWiMU6UA4izDDJBfisMhghM+H8EZywzSp5tt6fxwnDNijNm9ZzRKe6FA6AOls6dDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622610; c=relaxed/simple;
	bh=I0NgFN3rF+KkU4yqBh/hyP5wG9C/1rf8uLv6/y4DOzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmIZInHAxgZmCqf6CB1s5yT2QtR0DWb8GKYkmhWeAV8bY2rjyo24WHWpjp/43O4ucre0PXrhWNQ0oifT5IISfApFwAHKot8HGpqT9kbBrmJNA9BTt59jwxJjpWHxVlTgOFLQWkO5Z14JTg/4PfInbAns57HNMc3z9Y6Zr8xnmW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrFaRUVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtQNxNt9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrFaRUVX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtQNxNt9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXAG92503948
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=XrFaRUVXvcGaBNhE
	ipDn5AT4mzKJkmmrNwgSczG9YfhH1HLN3LqbVGfzkoZ4d+ZwQCBxGoqoiFq/8qHt
	LQeFAijKeUWmlUvtdQY844OtLzkeR113+HWzn6J/DkvbdkjV4Wzt9AljQ6uoLrvS
	/z7SYXRzAGTLe71+O2jVCHnKtHXma/1qaJij/1uOa3wOtCKGkq883YeFVm0x+Whu
	HnN80yEmEA1TBY5RL1xnMvuHcoNPyKyfIeFpPwUOUH+/xEE1H74Tl6x6a2Wzv6gl
	JXLe2o9ZvPhGwnGxQ9/dwKR3udYAL7jP/LSWLSWx4hD1y565HjsEsXkKCNuql0IK
	Z6rgdg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3ucuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:43:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894391f000so299906a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622608; x=1784227408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=PtQNxNt9iRkGLSfPyu/0w6+3SNxXARJBdTcL0+7yQPNDxB3ZKcYs3vshJseggAOBVE
         kt8MrpGvOf/CIrSDeZ1bWSAxbECks089zLc4HEURLARWZkDvNbjee1EVPRDdmp52WhDa
         VjKNzeurFvReZA02EOaguc/SWOKTf+A0IfeCFUGlYRDsghs3ThWc8KE7Un4yh2koJobf
         gJeSgmRnJfwQJsUmutCn61Fm7+Q7XHafuOCqJUbdb8Gyb3fCnruZKVTBUJ4HXUspDwb6
         m2GHH/1lg1g+tivFhp7ZUrvRS6SLQ2UTakiDjI5z+/7aAAph2a7YrN6xEPT9ZOXps9b9
         aFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622608; x=1784227408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=kjMnNV1K/B1tNLD2uP2Gi3Y7Qt8lbdspJs3XUbUf+s9+7uPRUCwitGdPg9BoBhM0uZ
         o1MuYqPvCfAxhU+Cg5uEYDh18wvWQ70sA8xGdFSkm11E5+bciiuUCCC3iJVHZ/ohqiMu
         0pe8xbCWLQhzdqFQbBYTlPxEC16hIVQaqmfjZ52Iv8yk98JnTXps2ofMdeDAIqooofoV
         V59Bf28REgRNJW0HxO06YfNfNLx0WctnP+quxuoNWWI97T16ul5uUp57SQ+v7guIxKkg
         eH3v4YGm4llBl7QwN3cs/lnZOIdPXjROXv2i3b6RW22e5vfAEOrxANmvpLaU0XTF1myZ
         gCMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCqtfGVmzatwNQEf/dOr6v9DNiQHqYr9pwaQxnFeY8D7BT5ajHKecDZfQAzfhCgO4EIm4Q6sM7MII6@vger.kernel.org
X-Gm-Message-State: AOJu0YzhJ/AN/y0EMlYHAFdVPDllP1nokHLJ2P8mRQ7oE6b/W948ARyM
	XOTeDejrp+05yG+JkPV8LjgC8TGcTZkTvka/7hI77VTKSx8nNQ1BuAdlgTk8UgtHKAirFIw2Mze
	0E3omwRAhAhBgs+i3yk0qudSGVLEA4sOTnDDiM+7Dan9Jc0MaQd/+qXoS7HWoAzrZ
X-Gm-Gg: AfdE7clohq5N4NbxkyNUvl8FbKFyJTYfrpvruboKeaE6Hnl6XSqUA/GnQyrlVdXgihl
	hw+pkmwcQ3tcWeSmTiBcQJn6O8LG+c4QZP6IO7t16j5z9+v9FYIqFiVxnHNyGEeBx8oC77a0SEK
	5vVvpm4QJxvDkGqQot2sLYcZAVNBBF6AC4tZcKY0fosuvX0YZf0/4SObMRGJYWwQz63d+UlLFpE
	o7TdpR77hQW+HlkWaoezWxHKZKG0Fiyu1+hu6Zlcm2b/4ZqviTadgnnYjbJyNSL5z9sojFyA0EB
	rMRQSRWg7HyB71cjcntg59llM2nRe17yMj6taDW7sDG5PMRfHdRtDI68g9rcIMaky6zTT8o6uM+
	1toO2FNobFp8l8heXP7uDWeHElohnEH37j6Y=
X-Received: by 2002:a05:6a21:4902:b0:3c0:b766:750e with SMTP id adf61e73a8af0-3c0bcfea632mr10283282637.25.1783622607970;
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:4902:b0:3c0:b766:750e with SMTP id adf61e73a8af0-3c0bcfea632mr10283252637.25.1783622607576;
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:06 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=849;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TpvtLBwihWHNEKd1VwQvgAfHhzoeB2GGOqDfiPe0Xho=;
 b=ZIve4DWCl87XBF7AfPHf5g2BJeKum6itVChbN+14NX0yb+c2lSO4GLV80PWdApQDHp0lHww6y
 MmdHRS+rBCEDgn1bSRRYLQshjQmUl8u8iyr/Z7ckKek/8UGqepWFhl2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 4wZIviWgDhgonfy3GvDarkDYxJL4-Lps
X-Proofpoint-GUID: 4wZIviWgDhgonfy3GvDarkDYxJL4-Lps
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4febd0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX73PwrSxsYCaK
 /B8bM04RaWpLBngW725W35w4lx3dn9XD59CO95eEBNxDR/5IuwBtxK95okWZ4FDkdSRUVdV3c8y
 LCBQGnYsScb0AjVI5ONX8pHRbIAwqo4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX1hyU88t13p8e
 AEVXf+Hw6qY3GCeS2ylD7LaIOGn3nAYqmVOA4JprNcciI9V3zKZxUpaAVgi9jJNVG6mGrmIz5dx
 itREpoL5LDYIslooQVqczNY9ZXsPKO66qz+mzOk4YOJHOSRCgint+JauZ/+u/XBmEglIcmjN+u6
 SuECCbRui7FX8K2awehiwo0RT898dBgWnKYquF9FsLFZW4VzcxmPa8hfXBnKVDh0LsrxPsX9Krc
 llQDkCfcQlp+9ZF0EHVPvCTcUp5luT3Qyf8n+1dXLdDWMZf4vyiLsYk2jwpMocq+1jWQjtr5yBJ
 YRffwHZJTe1a463gumUSpz1dwy9EfR4BpYIJI+uFLwZyAI6lb61OaE0XVewxcs5nqp0rrjB94se
 SePXftEnpGlfLQuk6w/j+wd0uobHIDg04lD4yUke+F087JfvwgZFx59L5SRTs94W8gfz/n3+Lw+
 Ore8d3OSmtr8wl3QCxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra EVK boards.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b7be09eb5a5..9febbf200f10 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -36,6 +36,14 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.54.0

