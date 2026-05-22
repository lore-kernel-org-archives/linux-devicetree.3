Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEDF383C7B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479693; cv=none; b=SIJHtF4OOYuazBWi+EiY+PWtAYssaplzMJelNB+lI4RB2yNG5hotWrY9ugQIuAG+HmQzn7aAWc+710eRlZDXYSjbC4qslT+fIqLtyK6rYWP7AVWJR8giww2Osf3LF/8RvyH68Hd+H6e2J05ovUUhO3OaZPng2cFLV9PuXqvg0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479693; c=relaxed/simple;
	bh=Jo3NPoIdP0VZV22BxqrJEsV4rfTesv9UXmVWD2So6nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKxtk4GG01ewpWN8Ys6Um+dH7NujYHPVReuoq4DYHCHEackqWdeX/MlKifnsHqk3/kKhHOF0MBCOfaJGosKGyOcFKR4MavZbWNmkFJmaeTNYUmzg9RGbkj0aRfxZa47sVH/FQBz+0lHNJO8bHFPuhly5piflDqrbqL3QQy9WuTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJ6It0vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5J2plZ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJ6It0vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5J2plZ5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCD2kO1958709
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lu45SY7Lo9D
	dYgZ88DvqzI3iyVBj3O12AmJ4deZuVIk=; b=VJ6It0vlKhR2QeKiUyu1yKRCs2X
	3LB6/vsWFE5VpnzmBZ1lcoSTM0EGMSpqTURWpShhR+G4jphbFkTlWMgfsHC5xIAm
	3BPz9GSqLWwF075yEALD6n8F05CGduIcOKebeMrPdiNiLAlDTZ5XiWjs/z5Ix9qw
	y9ETZgfLSNn/UZ1Bwl1qrkUEf66d/uhJSPVZ4724Um5OlUVd46+hcJGoa0R9sMjA
	2GT4GhDpiXhjERdfo0doiGbLJWFsTZDUhri6FKOIif/qQNCSTyTXPpmhSLknVl/a
	88iUpe2WRUOFBOEz+kCNwRwbazhyKF2UJU9wLUTCqC9V+evfnS6I73yDPIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxeu4my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd00a65673so57629655ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479690; x=1780084490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu45SY7Lo9DdYgZ88DvqzI3iyVBj3O12AmJ4deZuVIk=;
        b=i5J2plZ5qhAvhMbOUqXhhhXpyGrSNdlCWYyowjtrp1JbVSn+k271/aJjDn4AX3v9rA
         XGi05WOzgiu36rnlJ5GVfSthKozEzoJnCvTbzcN7Qp4xnHOrFkh3lyda6Mo0wLfaSruT
         7NMLpkOPV4Lo9zuMmEI5WA+fptZOBVf8uINDq2Ke/yOkxeveyTMr2kQdfVxxZXU0FXlA
         ujMWATtOSw3UFlCr+2RiDrHJjiB2L98IjHt9vKaJC6QFSjdnRIypj/+9oBO1nDtprZAT
         0VP2Psxb/o/l783VAP7mVW9JJo8Ok7jzBndOlT7A56FaGmv2P7bAZ/Z4iZoS1sEP5gKI
         Eumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479690; x=1780084490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu45SY7Lo9DdYgZ88DvqzI3iyVBj3O12AmJ4deZuVIk=;
        b=VwUCT72BgYxuL2jr8l1YJhwqy+ySzRdJpX5sUyuRTeUWb5CC4PIpZsS+uO6E0ALUW6
         eM8fLqRk0zjZg+HAHS6CxnRjqXgLUDjEwuKHMKsfS5/gdbTx9QC0mYo+9GvxeOvxaQbl
         Ny56edB41OoQrs+QymlcBfjK6M/kL+rW1DfogQZ1AH8y6Nr2l7r1clQnwDAyvRNoScLY
         IgvG832mm91JFCGQj8Un7gPtP/tHhiwiw72mUP96hP/ksO3XBrhve3TX+t0Tj0uhWfWY
         hX+FGAW8UEF2A9+iYaIRtRpacZ5nPSw5QZNnGdLC0DHgfxyqfoAc+jvehVPK23DpM9Ns
         BkLw==
X-Forwarded-Encrypted: i=1; AFNElJ+P3VIj4cGevRN0rz+kuS+Fzoiw0ycJVtcV4w2fEW4KtVmdsYbbTZdzJ39dmVkUhjJr4wGpFbeCI1ya@vger.kernel.org
X-Gm-Message-State: AOJu0YyQftoNz9ZWNkSuo0Qk0e58qbUsGUPwbpc1LKvKzWgSlnC8Ll3t
	Kd/TdYGOzJFIXSmqV9zn4aULFqTiKnR6OiLhv9hJc1y+R1jXnQVdKeKewQas5DX3ZZjTO2Vv/G0
	E8QkniCgCtF04GVaIlJXo85xCSy9r9Yy/vRn/AfGm5nC1wEQxivjLP5iDggl8arjI
X-Gm-Gg: Acq92OGovkC9JiPPwpPemAFHFBoEWGhWa+rcuUsvxQn3HWxdQfyDM2pDBN3t7Fc2Eam
	SEMG4GZPFGooTcMDC9cWt6u5+wpciGoGq+9vKDq19gF6ibknLzZK86Q0cB01vTPAGk1Abv06MsG
	p9P4kG/5BhJj2xp6lhcnrFWv9koSANYm3JQQb4q2vnGNAcfScwGjZFrvoI5Q0MmSqtDyswjhc2h
	f5Klj//TArijr+CP15aH1fP1VIjG6H1gzPCKjO67wZAzWN4wvdul9PpWaq/pZTanSYzMRDNQs3E
	Fu/gZ8P0Ae2rcgFGpLUs9w6ab6gJShWYThYtFBv73J0PLZnELqy55Or+pbJmRdjmbct0x4eqOmO
	FrJRQl2Ftm/ABifi6cqM+GN82e3enAAXzkwHVipzsYAZ8/wtL
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2beb0878549mr44533545ad.14.1779479690379;
        Fri, 22 May 2026 12:54:50 -0700 (PDT)
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2beb0878549mr44533235ad.14.1779479689886;
        Fri, 22 May 2026 12:54:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 12/18] arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:03 +0530
Message-ID: <20260522195009.2961022-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXx4W5mp4H7LWz
 kzzZMs8FWER1knRaFkkpuYXl9sLt/c7CgG7qXHA9N7SyEV256yBMnr2HctJ+QQh2DxFxnNiESBH
 mAeayqlYXHunzjyw0cSkPrBqUiZAMkgajSIw/ZqSkZojXSbmGZaOzvIZYA5F3VAx4gzsjaz2Vsf
 TZfR6HyrmStoOBOZC56K519Uwcws/RiLOzc+5G+b3SqMB5fpx0zMzzK63FpmdqV3AycytRIPAit
 s+FGj+/VWw6dJfmQskHnSjhDHSHj3EG2breNVKPL/s6pEmbsd9prtutg6O+K1r2HrtI1ybLDsWu
 v/deRXbZDEOa0lgNLMttti2MMtlymxAayWTSQ4zTfSpPCXCxHCJBxJx5+epFZpDAnB4FkzTUe8L
 EtWb6dbKgmV6gMzKBtvfYF19rSwDjdk3ZOtt4HyGFbHvvxDTcRCzOhG61uEE9s6On455McXx2+f
 dRWhOY0kRiAAZsf/PHw==
X-Proofpoint-GUID: JBrfdVp39Yhs5pTUO67lxO31sZO399JK
X-Proofpoint-ORIG-GUID: JBrfdVp39Yhs5pTUO67lxO31sZO399JK
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a10b48b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Hh5InDi0tDfhh6u64JkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..6a6560a3758a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -720,6 +720,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7280", "qcom,scm";
 			qcom,dload-mode = <&tcsr_2 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6694,6 +6695,10 @@ sram@146a5000 {
 
 			ranges = <0 0 0x146a5000 0x6000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3000 {
 				reg = <0x3000 0x2000>;
 			};
-- 
2.53.0

