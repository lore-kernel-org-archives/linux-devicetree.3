Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4B46C4C2
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925936; cv=none; b=cV7TwqavNqpkFzGVD8TETn5GhSK7djdw+9gzTFzd0jMO96IIGg+p+cKcYIWdiUdzQpITLHAmdcjdgOxZdHZgLeK96qQGHgntABR+b9/gmu9GnZuTlIjxlsVnYO7WmwrReF+gVQA5PGWD4WuiPtEsJyYXx5pUaaXsLWhUnc6pLC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925936; c=relaxed/simple;
	bh=Xtl694D0DgWPJxP23Arvi4tkW3Ki0aks6uVKllA5u8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egJIEUJuO6dueeK7yUIXlTeqhaR1prkHqaIzlMwyCJLqH8uLTali521Ltxphj3rj/HLND7c6o9q5ZT6RmlJaNRISxdk9Nmu0eto7I5pPwgFNQSRfnOsBMxPQIkLgxc5B81kCq9AFA8AKqI3JnhIZ2P1pcfmubhUsbV6e/VP6wdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgfnRBLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdbDzlP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgfnRBLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdbDzlP9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkdgw3226294
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=; b=mgfnRBLO7+xtH49F
	uQrk2QC6D0rt/5dVeKPRy/DmH+pa88OO8C9ikkle5PujDNSOWr+ncp/TaZfxF0MW
	kAILn0v2fT77VqEkeNlxTQKzOnQ1Er+3tbblX3dh294Vlas3HUGqCiXxRpjuz83y
	jGnebV9LW5jQyJngOtI+sFo47kJpO6RowGCs6nXQxTR1MaFj8yve8B9hmyq9XJt1
	mKdBVDtYW8fIJXh7N9PsDyBrXuxgOHhADfrpJakoDHy2qbY5MHooOPaYPhHTzMPY
	z0dsFrGbRlh+UrF9jXSjbydb8O+nC8aYNTOjOc13JmCPDwVMCJUInYG5leUmSTaB
	pl11FQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxt3bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so13262551cf.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925933; x=1788530733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=;
        b=bdbDzlP9+1D6ej4NA4CeSFR55i0k9g4UOH8NjSKkHFVLY5txVUweZY04xiSPHgWFAz
         Bq8k2/VS1PLcp72ISqU4pRmTSJRZggerY9WllGepHO3oRjH5MlMgl/JocAJMc/v/tcpv
         Kgj2GgnB/MeiGw7OcYQBKMY7Phd6FtBS1u6hRMJ+T1d6JrlrGTDNLchRWlHvS2ABVuw9
         3iWN3krVNRDjaxxV6g3TIn030Wlfalcs0RbU/qu2Wx8N45UIMlSjEGFZc8N5rkdhdYuF
         +M3pqpeaHAgNMYM27BcepFlTlsWH/92QZ3pNhz29H7fU29RKBq8IO4cOH5rpygug/adj
         y3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925933; x=1788530733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=;
        b=fXKs04X+GHRJQpowi0txf/nLefoKMpnMhlYPGwKSP10gDP4VXlrw5n4xmg8VE+nCWz
         ggHw75w5bSc4DcO7WS3X4+diUDHIGGJ7i295K2v9PPsFnee9DxqpTsAOw+XQG/M4xQaL
         bAR+fIJACdZCaS4W199QVnBedPSe1da+s/VpG7tvpM730VWTndjMbLWvUZ6cFr2S90tp
         I8tPjj7FQpJT2+zvx/1KQBkifh/9dzB5QnafLBycrUQ3xxmGtu2Ozf5jhBjCaVhW9Bvy
         9AZvyAunZ+K9r/3Xje75dtoZ19vdKNnlz3ex89j2XAeSECwVwTr4CVx7L2syBmrYUrxJ
         m/Vg==
X-Forwarded-Encrypted: i=1; AHgh+RqHKlSzuB2trp3jFr/ggWbW9aOKVk4czV/b3UE5+z/fdK8dMXPRPME77VOncRcYm+TrU/8VjkCRkGRa@vger.kernel.org
X-Gm-Message-State: AFuF++lwGpMwqNKC5IaZo32bRL+JFJm2ZfA5pWTFYwn5dDlXIrYCkawc
	kBucoe3Yn31exL6lo6GG/Ch0uvnV55iJ2l908hol+vBA/jBohJI/1H/SMngDv1TjUYg+sEoo5GF
	Qhyp1O3UyLMJpRXa8uBQZhy8GfidxUBBdYBTGnwRrh6l4b2Q15yz249z/9zoTUHku
X-Gm-Gg: AR+sD13HDH+BsW4SuYsbPbPgYCZBj6yqqQU2aa+b5MWW+xA65Nb8nLMPoHh07ph6S6k
	L/Jpd6x6/U020sUIP7MvyLhRI9thWoGSI08Sc5uLJcWqpuJTxb8u6mM+ADO91EXahgJFuGlFoXr
	Fk3W1kb17NMhTOsQjGionVqYXwN8iUbiQXA0fT87qG13N3w8rSI0bJTY+KS+1yUu+jjSOzn2BfU
	aa4Jv1/Lw4sr7TwMvggAm5AjmtoPeMg9le6Jcu+Jo0bKXo9EkDlATCcSXjzD6Ekeuec1dJ0Yik0
	wP/M+cS8RFSXExB3B8dXFroKslnVh/hlC5bcY8tKd7TJcqUnxT9h0CBYBSJb0Y318DWPOySd4Ur
	ankjerEZjyhl3+bil+XmMtIk=
X-Received: by 2002:ac8:7f11:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52fb94aef37mr78759911cf.9.1787925932371;
        Fri, 28 Aug 2026 07:05:32 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52fb94aef37mr78758401cf.9.1787925931811;
        Fri, 28 Aug 2026 07:05:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:00 +0200
Subject: [PATCH RFC/DO NOT MERGE 02/12] drm/msm: Properly handle
 msm_ioremap() without name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-2-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xtl694D0DgWPJxP23Arvi4tkW3Ki0aks6uVKllA5u8c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWZqLsb4jv2eWG6WOsapWn81xKcReH32cGg8
 b8f2ZeSuxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmQAKCRDBN2bmhouD
 1y+CD/9MFWW20kWIW0usKkurL+trqzNP9TIAiBL1sxgQCfzfMzVh6USS1UWvFJjQD2Lpb2cRPUY
 zueE7v2zYP9txYiJg6btT/ijXKexAVRb0dCTAkaBwQmnXACWpieJurgtwp9Os5drwTu0LE21x/Q
 jSMaIZmvxzwL0m1YI/bAP0yj5CzRps2vOR8q2lQ7Nhx82fEKoaGcpVyXejgpg6oV1ZERZmEOQ/8
 /yo8+D2RfcgytxDu3qYnVmhvrb+n0YFMWbqpC0QEsjdT4zeu57rEs9NOLaaKvdO3S/VMbx8nMfK
 AmezuU6D8jMVsXDtfQGmSLvnj3b4Dwn/NQcmYoZl01swFhxSW3vXlA//RanOjXhSRJLvfajPkTd
 COeNEq3ncHYWh1z2iJrhl+5sZupEuVllbtl71ZUDS/gkrwAgVeV9kvSNsO0CcKYs536hEf1i3GV
 S9rAxzF0bBxTPg9TBEMHA6tz9ydenWhocPGKJLbEU8lPrsWmJZuymriUSHLRlfEK6g6hgqCCXCn
 M+Qs90q6T+9NnNhwnmPBDuNxtijSfOHwwgARf2IAjw2VhDgs1gqKejOqzzpkGq28CEmk6w3o6VG
 1EWfI3eQStM5WvJCcRbQCZudG83EAADcQkruZ1PcZM4CdJ28ANeG8o3/S8rzUiS8/+2ERJgd+aE
 ZSEHRDQ786rt4vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX8fL+VA/PTVGh
 FdkxyO83wdQOXznBLLS3E+f5ZADvma1uERVxxAlzOGL+Vpct0nsGK4HEso5yestt8XIWFnWUItk
 QAKH+IuLqDr31gdDM8tyZJp72mY4RMsvJVNtKU5rTgUG+kT9jFnOYJH2V8Wnl78GltQFNJpcWPE
 0FC6n7uzvmxW6BITcXzUNEOEit7ndofebqhXL6PfwGkQXp8a5gl5Q+jPVkSqsQ/3FhewytYV9SW
 /O1Tu2RcQnZiUyfqo/jWIUF9RVwGg8P4cQrdrWPPtJRtKSOwsryLLy15JOVNE5SYs6GOky5Nztt
 g1RMHglCbuop9X8VVNEdZHqCNU5BP8iaizhtReiIAyFfipo6X12rB8ndXTNlU1/ezgdjsJxsLOn
 3stHC0sS4zgzqmEo29vo1zVtUTy4tw04fy2UtmuyQWMRj8uwvTB4UWO4mwj9B+FCs3QThh/LOfJ
 p2xiki+cW3LHm5FD/9A==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a9195ad cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX2SUNPqxki49/
 s7mIlEzniM8HKOv8+l3355VvdO6MNe6E4qPmGbMHEDJCLJINA0FFZnDLc7UCbjtm8+uw16/6SK/
 hOwKntCVWXfLWZnIzmxBvB3jNqL4pBg=
X-Proofpoint-ORIG-GUID: EzSOWF96qac3Ny_74mwTic25Tkpkj-RE
X-Proofpoint-GUID: EzSOWF96qac3Ny_74mwTic25Tkpkj-RE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..93b94e330cb8 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

