Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A273C3AB28F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371964; cv=none; b=AlB48SoPNc3UqLT0ggx3i2Kxve+nUotsAOqNs7RkWg5KsZndAyZsFvSJSfd7TXeL+K0QI+XVR6TuItIDp3RBBp6p/6Q1Gw2b3W+X74s2zLSqYyrTugDwm3ZGpR9X2aD/hHpySgUXgsI/MGO1I9xdoslgdq/oFyDYESiYgxCw8ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371964; c=relaxed/simple;
	bh=I0NgFN3rF+KkU4yqBh/hyP5wG9C/1rf8uLv6/y4DOzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyGngQcbrXzJuvlLtY0CXAaC5AoxA/iXB2VVv+chjZjCA9ZMeTLvEHUSVRrzdUYgzMaYjrorMEP/8ygT1rqZKZmHb1ezlIQGcAjLGQv5JLeHOEhvhnaQmX44ChIIPwRbMZ9b6MPi7ep6wC3L0v5726/TUkCRdqZ544+oaLIfIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbccwYny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+B4rDaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbccwYny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+B4rDaJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE59R1428858
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=AbccwYnywChyPTgF
	RBrC4+h2W36mvrkx3GLid2XD8jzQPcYsCBVJGtpVUJgTXhdJutcHjTzD+D4t3OmW
	lAYD/YbakPxt2eAcAAgatuogf9tjrG0N3iZnhxmtMXA+tqUfaMGgFLTSup/4a7uv
	Ai9+L9f6UpPHNpTh5q4IE4Pf/vvUYu1QZathG5DaDd80P7UTdzhStjUgkoSyK+lQ
	WulOaq6W7+4URzgUeBfR5sepN6WbPw4AVMZYzUHzxtrLvY43BLm6GhQXeLDN7FFH
	SFsdkd+9rhUtY/gn6R1ofBxxyGg3sYXhf8F+1gFjx9+PAI1fjgUsEukv3e4jEKij
	JNNF/Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxuhf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:06:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso5556488a12.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371962; x=1783976762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=L+B4rDaJS1tOqjar0nRbHmHXBHB3an3h9EHVs0A7VUIzlaf6H1vqCCxIVZjiY9IFpV
         sAY2gdgYpPYoHGP21kmiz0S17QyNo3XSkPEVby7FwTUIB4NlgyVEBjM2yEUIpBYk7duy
         FY3tKTt7ssAh/dnkT6GVi8q4z51j1Q00Rbt+n27BlGsLACVTFrGfJBwFNJfVErpkxWBd
         fXaLAEjCuO/n0ua6j71yHgT7MgTP0E952hqApOR238b3WPr6dBo7z+nDkKdjzgvhz8C3
         p8cnsLxProXCSJ5I4cITmcErWtqDplUlfH9Sfn7dq1+SOUFPAzJPL9la9x/qOpTFlgUH
         2M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371962; x=1783976762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=ghjPY2GkpbLbfNI2txaCoTumUo/Fi8V5083vGXdwXg4flJbPx3762UeMZkNH99a2Jo
         sM+KbACB8wEt1XQPZgcMFMFQte0smqK9hbVhn3QUBkCcUGCCD7YlmKprLyNwClS07VCh
         2CMKc09eu9iUIbPZi0zyO9lHyxcUaLnQCq2HmzYzyqUJ6oDug3DpcFJtZvSnt2/En3rF
         jwcY3aPebwkEWb8XsV7EdDbwQK6ASbN71Hltsfh3k+HuN2jfvriSmCoaxGn6aB3Xkgpf
         /nKDEPEgXLxs2alRuIizF9Y4Ktbs319InmHn9IlYPYGewmdTEdfSblxYCxnlTStS6eZi
         jorQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNw0Yqwj/FAK567xDoHwUjQJSuXrZGzd4256jRB53rhyzth0sX3MKgZN7Cn4rTgVoXAGbpQv/rH7Fs@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLh8Nu0OaNX/ROuQtneyN/sVNNRh32D3bwLn8jDQ9YJLk2wpm
	bUIXvc/NEJGb4MxCuC1M/MY7Fok2hc1AsUgpw9uxYa4mYR3VISpg5FbqB1fk91Xp+ftmciGPlUq
	Z6JT0SfWfuIJSPx7LA6Bx9fi+YiyUgCezWGQbuNB/RsaV+kGmZ1FQYtu9/M4ykZwQ
X-Gm-Gg: AfdE7cnMpD3iucU/fRE9OtG3MlUTn7MFpRpWAsxiU5B9cHApA4lkxiKwJomwk0YTLls
	XGnK88Hx/8iRdXcHqXE4T9WqOV28Kvt+nExvdpSaBWOubTHHwSk7MbzlLH1UaQlT6ESVa59C/zF
	lta/1qkUdDZ5fKlSTaQqewA30QxkNuEHEm2jwEUXVGhjloeK0MiwJM4T4rYPhnJDlvCkwj0toFK
	aVxyEkFYYb+Pj6hwRfqHkBca0Q9HBpKe4EhfLDMj4icX3Ws2DQmF1l3PXzu5k9BZ34ubfa5tED5
	GZ3nLAuQD3+hSmYiG2G7LlkU/XPGwtcrvtJnlOso/iQoqkOuiSJ888jnJmsUsqZora7uZh5lGOv
	swyliwFxwOdXMUeodwh45BED/WatxSoTEiV8=
X-Received: by 2002:a05:6a20:be8f:b0:3bf:9615:12da with SMTP id adf61e73a8af0-3c08ede1ea1mr2865617637.23.1783371962471;
        Mon, 06 Jul 2026 14:06:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:be8f:b0:3bf:9615:12da with SMTP id adf61e73a8af0-3c08ede1ea1mr2865583637.23.1783371961997;
        Mon, 06 Jul 2026 14:06:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:06:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:39 +0530
Subject: [PATCH v5 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-7-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=849;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TpvtLBwihWHNEKd1VwQvgAfHhzoeB2GGOqDfiPe0Xho=;
 b=dfyRRLzk6X22LRvVuarzLJYhr4uXZga/lIRc5OYOiiD8py29ZoBlA877+GkX+z7ssquDayLoS
 i736/Elf9UxAHI+/pIfeTDFCmYSKvza3YQP347A19hJlyWFrrg1G205
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 5ya-5wCFYZ8d2Z9uwclUQ0dvbfVVMi_T
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c18bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX9g5XOEyblb7V
 xTPZzIDxLBXuaclt0KlvKWRQFNzRbtcpDIIyHhNHw8yUJoSQBXArtxwbeDp7LEWgBiFDVnnzcbL
 MBF9FSL4uqexkf51fZ3gqunS3u84nPs=
X-Proofpoint-GUID: 5ya-5wCFYZ8d2Z9uwclUQ0dvbfVVMi_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX7K3u6XaYHdgZ
 OIaEfQbJAXMMc4Lb9k82LrJUgLypQkhtb8uL1GNB8hCX5RicJV9VcMSPPeH9H7kIhbmxNpN8fQ0
 T1NMAkxqsrwhln/thU7G/1DSRiwMgYDfBZqN82CkR/lO+dd9doDerzkcp9Y1cK7QZYK/LQmZ8Sm
 Qq4LogY6bIpK5itRN2N73N8Hm2OzqVzIwgtd902L0NABTxEYozpz2WMNcs2YUy9y1e1PrmTnjIN
 BZ9Bt57UVgY61/y3/GI6RvdwjvCKQCc0wfIYShhBvD8e1U0MrWvqbrnZ81VLbHGlsZTgvIyrIky
 LeANhvVZKP5eILsr8GMyjnBBt1GbbJQZt37DzxcL2Ji3/voEB4wEEtTY4JBw6qNliU/aLCSsRl2
 NQoPkhTiDJM8Mm3BPyrtRKtjTILSRUohk9EmGS5g4wD0VoVIKzmMgO0W+peYzJw+FOpgAfcQsnV
 IFQm76BvVlRV0TAtcaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213

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

