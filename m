Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604739;
	b=BuQ1T5N+RmYGB0y84wLVGoHBkkAMxjrQgxgTnYiA1bweAMlnDnDmOa5Xw1y8qDBJbeGY
	 MHh0vrbldz2fopIv4CzyQtsIGD7F0/0G633fTA4eypsRTVmi9QXL94vNiRTTev2k1T70Y
	 FvfrPBO9a/rFozP+ElTr66jCOHeNHDiHfDl1eyThZMP1wvpxq3sSMIORy86qrE72Ke8rK
	 lWl5UcVsY9DeRF19rdEwgavKJvi8aPOZuVFzWTuBGvGeSAZBbQxBu8RCpDnSr420za1Jc
	 6wwb7JlGTTfaJRmLmNoawckKDg+FjaGbkFWW1ELfn7NW+7p68w9O5olCUwjZ0hh5I5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
	b=jGPnPdm24Ncn0B50SxCp9e7tfOLa1OkyZE7boVzjYgYV+7cYtGTCCcl7EI8SyIdA51pt
	 6MsuZmHPvELYZcie1R7DOV4G7mKi9T8zzGqANjPTHGjmYnsR6MZkjS7VkMtH0ojXzPE/R
	 cnk2lel3syAIwST0OUO97bjXdBWJ+23AdnFx0q/OTHarA0z2ptjq+okXKte62SclknZAT
	 Vtn0ykSa2Rm4kH/qMxng+K9pNgGoVsxgJ0zefOxoOOPGqGTKuGG9t2uG+K670oppoVjCs
	 bcyuPPgAQ4C6gHZan+MV5xhoDq97Lt90SB7AveEc77qfv3oC/3TLBD484iwJej88ufg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWonRU4Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRHkkdTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AA606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8AA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWonRU4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRHkkdTK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23v8DA2752934
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=; b=dWonRU4Q+/LEfOMw
	nvCbJdrIzu4jsc7tq5zoseQmsFCEOORMyF41B9D6chd9bfBM/Q1G6mAW+whh9MYT
	pK9uxM+o/4vH49BL4t4bJTt9bifuHeSYg2sLJO0JGm7fC8KrZp3rsHI+VPQKccqp
	uWoj4T3hYqHBn5+R5q/mxN6L4zpxVnGj8RI7o+L8Fi/ZAmTLXakkHqvvOkICLAXm
	13HLDGNQX0Ye0HbnBimrwCqeDk1isaPwT/nRUKTUvBXC07TdPus7VTVObAmO/CDR
	s4thpjEpLAnzk81nC3dDgq+SVevVQHemb+Ohd/6XeAo1pMSLw3aqrzPWp1SFl61Z
	60mhrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg2015xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:32:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea381ce04fso34050605ad.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604737; x=1794209537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=aRHkkdTKQXybd1KHGc+2gPPwqinsNnb5/6EUZsCMH+1okFs2J1fjS3M43zOdMW0xwZ
         3baE0JcjtZ1qh7Fdd2MkTw+b/CEsRyNcfckq3pFjH0I960LpyH0Wtnj0VDHEuzWV+1NO
         iwdS/SmD9QWq12Jfmlh6dOOyzcUc4vL+ebeGEh4ckqaMKC/UjMfmMX6priQtsIz6Tc5k
         Q97f2Z/vetHiAknOApJUszJFcHGV4VZ1aTulCVgY1aLHCfJAfLrlWVSdmMZHCzK8Vp2w
         RuFSZbgjVlDD5dB1Mjj+2ZbpBFBDuIaqj4nuWYUXsJo4cLfVrxZ3Ez3QDrd/6iwt5vSx
         vTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604737; x=1794209537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=d1D18420neKSpNNN/8DnxYCxZ/L1gxnQP6wb464cUXuDtadXW5WidG6GyArzvN5LV6
         6clWaUNxjE7dgrgjeqU2wwFeebolzYhF/dVW2UThWlvamLNoswdzQo9FCT07Jg9ci4YL
         LGoGrFH5rvWXmKXS+UMKBINlzTBnjEKzYMxCq4AUg4Ao1rjlPzYwNXJzqYx0TF0+11ax
         j4SHjZ1rwREKxVbRULNNq7TSkhx0SpM9P5JzvMdRg5T2eG217C2wN6DQLSz5XbUxYnbL
         t2dquW9L6laf4f6oH+kFGlIDFQ4uk/NfLOMCmQ4OBcY0jQx9N7Awp2qmSh3KPgfYAU9M
         aJ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+lhGFhYjM79pxJkThjUpECG/sMBQNx85smr1eGeQRnJ3wV5lOOQuPn8DeWIT+PT16G71vkkMUzEyj@vger.kernel.org
X-Gm-Message-State: APuU4Z9O5JX1akjZKvocKUfqTW19LQGPhYbwJ+FHHpEjkFKBFQx12RNY
	C5pXHMzcF3k6VZ8Mqf1CXNX9wa2CO5iGTGkzV5BftJnuWS6H9ikEkxVr0zrsDf7iteF4CKmphpq
	BaZLGpxr7e+XNx3GgjxkAPHSsMaXPZumoXGfO77YjHx2X6FVJ1Ti1qlJxg6LW+qsf
X-Gm-Gg: AYBFou1Lhyl9Q3+PtvClIk1p9IT2MpB3J3aPc2AddTR6REK4RTs0uRGdyBkIDKabky6
	Qs7DxzoBqAQslGLSUIQVxYUsK3hgJQ/bhBgHVl+S6kLYaMUsPqcSud1rpvgFleUv7oleophgzBi
	QXyY5npEGBsnaXAO4xNP9Va1badglOlH+lt7Kx0ijebPpjHq+cmWTq50YOIcw6rquHpb4lGP0gP
	yrfoUhhRK1SVf7lmL31hlK1ngdPhBd4cD0+zElK0/4j4cEJP+EwtWGqLvqVbgl8FQrspjUwSq80
	Q70ao3fEpZ3AM834QSOGh2zoIA/EUNXrnk65OdiLz+kFiM9D68TmaWeOQSkJCMDOMKYJnJ9uIC/
	Efl6w84oKohGdV7hiV4XN+nFZevP41oWjaE3p/t6sI+2+s6Tfqw8c/SRdbvKL05CSOOQgB+mn21
	+BGf/T
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983375ad.1.1793604737326;
        Sun, 01 Nov 2026 23:32:17 -0800 (PST)
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983215ad.1.1793604736850;
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:01:35 +0530
Subject: [PATCH v3 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-5-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=756;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=D574Y22uTji1IMYHtzDZtLzIycKBRn05fzUPAQ1Xe0U=;
 b=/ZryEtzmyp06P+iMnFK9/3xFBaYu3B6I0tOctWwl5MAOe5aUs4FQw3ghXnuw/3LmliZqtsg3b
 jw0bmq+2E7hCcOU15UUe4MdnXg8EggGKKKH0DVUrX0CF7blBAziNY3s
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: e4GOzmTmY5RFTmia_rLc_KMQ4xYCbnbc
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae83c82 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: e4GOzmTmY5RFTmia_rLc_KMQ4xYCbnbc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX3eXWqTnMIpeS
 Mlz9c0pWBp1pomXxBJuFCdQR6izHCiq3Du7SbeAGlTHE1l+zQUgsBA096skDsw/eYQj3IBsSsNI
 bG7UpsMpxZcykFsRW+TmAHa0EDsZHLLQPYuW+U0c07OcMSh5hrw+ue4yNdHwFmQuhyDDyHzUSXY
 igJhpQNnBVwP9cdtzi1sIbUHz5H+fqhjCsHFs3320RPkz/SY0WlSxc4Wa674rCDBj4+rEjU565o
 000nW8F4gZcy4oRdLSGFvf+SHrDc9D9emeHNvIxybMhh1PVEtR01KOz3pkKQey2vEJyM6elzwDD
 a05/DT3Zw0fBO11YLmP4GXrOYahkGD/5dNg7YjtafBntAsdTK3ioKG/YUUmkxLsNqI40yvjxnQz
 qkvy6Es/dyKlDsPPL80qaxcZL/Mq8wmGR+em8jSu6b8THNyraDXPstARoiVSYoMUO35FXWNKORH
 +rvc8dEDEVFIliMsNQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX3EEtqMd4HMAd
 RwG3Q19H86v15/WEH1Snxg+G9miIkr7ibzgSKTwjcbkrvCJFwirEBqOq5VICdGvfE/sDwixko9c
 fqnSuAPHJdtFtPOADQw1o4Rn0gExUuA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

