Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545751;
	b=2flKw8wgI3iNFLsNzEUbDiVdJx0yo0PvUkbQzwXOpOkIb1mv8ZAVRgLqCkIDQHKmPv7D
	 5yPQUWWFep4N5VboRzwvXQxzEtfDyNpvZDUeSRCZ49NgKfcCuhVzccC1LrdxtkFTObNjZ
	 TYsunYMM4nxGNSUCGN7Qaw2BMiseZuaIaY5nrGqwJzx1Wy1MSrlpScGb2DMOmBr3xDVMa
	 Q8TOxtpRCQQgg0MaR6S7bP8F2zAjVu8H3vWaKori+vXV9iESAp3C/RMJvztkKUZAHuw3b
	 EH29Yfp4xs5nDcJU13XDfCe5z520SBnkgKFJMTPMHjyURch0Q4TvnMF8Q8ST/aKNwjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=;
	b=AOdZMjqeFhpAvfxLZcYT47THuCyWFo1vemaUiGXDdaPE0ELNwfNZgUZE8CnRO1svorcf
	 RA0yilbmFOnUgS6CpFf2UlARfW/udll8I6MDQl/AG19HNigOxhmSHvkFeE4qVFRsbifGR
	 1KjXmjCCpBDY3K+WGb72lNlCVz6SfRz2ho1CyjKJEt83cFB5srewQGXlJaUdYkxvIsflt
	 qtluTtIgmxJdOeS9zfaKUZKMVobWJSm15iVjuB6q0RnyV6mReFafBDYH2+NZxDHeg096s
	 tsMM5JCKDJ4Z6SvXaASYr4QLCCqgSAJ/dW5G1DZ3uG6Zgc4HQHGxJuwvQOC52DgFmTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzrXUVnn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E1SFlVLA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24CD606A331
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24CD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzrXUVnn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E1SFlVLA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KKd44120584
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=; b=nzrXUVnnT6/HJmmi
	SdT1vf7pGZnIpU2ViVZaQOljsNKmBFwAlvCYgjnVI2aDic1YyeQx3TR7wVg2wVDY
	Po20IlAiHDF7cxxiT72xwx6hEkSEmix2N09OaQuN7DzokhLT6Z3B9rZosdqU5MYl
	7XBOTeiDBMTBsy5V+Le0m63MFWyyKmSvsb6HjA0jJCScDx94wEKMB3lVyyFCHagu
	VbQfjgmR7SMiC/lXLt4ppALNWg31YFfC+ZcbBQ4WU3cUlPXcLr62CLnAN6fdEbX/
	TkLsXp3UI9KRi0rbXL0ZL+THToatp75xGByhfgGYNIM9tt6PR8Rn5NAh5rGrzPJT
	Cfd0gA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx33g1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee184a2474so770515ad.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 20:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545750; x=1795150550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=;
        b=E1SFlVLAdhIXdAHLo5dn29nhqcsqtpVy5+gLskr2bk/ULq93paSsrIepRaFE4TkSXU
         VcDh0w0OmoeGtgHQLtoMctPXh0AdbbJsB778HpSutBqTgu+7P43y3OlmVZXpb6jWaI48
         /m2PTvK5UK6D51uGXD7bMkrOP0CH1QCKt/oEHiKOBUzgXoUWxi9N8QwVTriTVHwhibHt
         1W5/Sc0hazRGec4rbtLBhpUtrB1N+XolnDb2oYxTGc2E6n/Bvq1jfGMA2qWzAfwTLoHY
         L8+cLR89ijAQylRNgfpd6HSYUaczJs7spdAR5ck9vD20rYS6DMDdCbVHNUk5t68XOLIY
         OBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545750; x=1795150550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMbHWmtPSkJsblSxkOw1DQa9fks2pTafNZVkV2m2C1c=;
        b=m57JBrgMnWBXOzbRIV+Gvz7m+CUnJAoTlDhRMvKAHlg7h9wvw5uhUvlHqzzC+yZNh9
         zhTX7SDAHlArhKPmYw/t1aynzfwqZvQQavop2Cm8yiNPImr+rD7ruIo2VmHKzP0v0xrb
         f2eTqZh5qTevrVH/AzSCfkt5py/3ldkebLsZZTevFnWV82xw14bX4MRi9pzIl95J3SGN
         iKADydzlSrcEegY1LhUrqjsYlHQoMWh08S0S+9owh4wXs7BPuKIJILisPLIDEwkD3qCX
         SeVb5GimJQe3z0EM3HRg+zHcm24/g2zql2lKelHTOWmmbG7/4qV4tL/qQ9ebHpzzYSsY
         CSBw==
X-Gm-Message-State: APuU4Z8ReoBHGAPXQsary1bcEjpNxWQxlc4Cg8DQhbbKlc/cgWoALNoW
	MDjQPrRKx/d4ShPS9kQzR9Q/dKxTfm+KKDk9xMIImJPCCZFOqozF0YZQ4UQrojB3EeQHHkCA+HR
	JaSNAQ2LR9IdzO7CZvqx2LVUxvuK7t5G0zBhPrvSNt9UA5IegTs1+0tMFGLrybjJg
X-Gm-Gg: AYBFou1KJ5x1U3FqRpFPDq+4gfirz3dCluoAeHp5Z9+bijQi2U/mPEnEGiw8qIT1Onh
	hwVI2xf/XqW1+PHB5QPzHZ5YibL6Z1h1TLTRHzoDmy1N26qD5eGXgJmPbsJGyZbNZ3rCzCekT2C
	0fW3IrE7WgkbO8MtzTpTzUY/FG53vuMjWyMhKHUrJCTtS8S+Gmrww/roV1jLGTulvS8Xx9MZkm0
	TaWiYkSf3YwjaEd3K89XzBK9maCg3Hq0SSJn1y+w03dlo00vfP3YT728dSXwZsZbYL14anBk+7t
	twmKx8/ssyEKUzBNdlkIgULcPX4hD+htexSMXdtcong5konKhuCPVR9ifpji8L706xNXs/VG+TC
	JWBP5sBHLnXC9mHX7MJDF18TsYdWU6ABSdICsjTqqj9Mb0KSfHSy4apkqmFl0LeJ3v4AuY7ktEO
	h9
X-Received: by 2002:a17:90b:1644:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b1b0597ca7mr1229867a91.0.1794545749564;
        Thu, 12 Nov 2026 20:55:49 -0800 (PST)
X-Received: by 2002:a17:90b:1644:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b1b0597ca7mr1229846a91.0.1794545749067;
        Thu, 12 Nov 2026 20:55:49 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:48 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:26 +0530
Subject: [PATCH v2 2/3] pmdomain: Add support for system-suspend-only
 states
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
Message-Id: <20261113-s2idle_state-v2-2-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=2420;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zLzmWla1eE4cZjRAIYhpKVJwqHFJ8WiKdzFMzj9uB2E=;
 b=rvhcPu1xJ1lcFOXWFywbCb7prw5OTabSQiwsUPq92R1r9apAzpDONPggy+TWZicvSkRGi5WvS
 SUW7KHUKWebBBb+61zgtstKHbs2WDHEKd3X34LZIX16klNqJJQaX97/
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af69856 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=XIWP2vTyFktR7zITobcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX1AqODf1RiLEt
 q0SOOmKJtUKp+kuE2HHhWg+Jsmkr1zUePwMql+mfJgyMME2l2dqvYMBsWRnBXOPiu4bUoN1uMNY
 RSxygx0YnN+arj59KAPhxyUzVDqwvliwWhcD67cvYI/Jpa0yrI5FW+FLd6y8z7G9ycMuCP3bJMq
 LHSlHzPJALcLt9qIZ5U+JJkvNoiSLxKVKfa1U56lDIeqwPKCL9EDmSgi/6/sBTd8hJfY2tIsHKZ
 lc1szDq7ht6tp9mRR5X/pmsPDGOcBfcYWd4FUG6sGS7p11lJgMtSutQ7/+JYE707SiBnp9ezZSa
 +wTN6tcG1yEVCx0fI3Z+uL++vKBW/r/HzAebCGx6fzH2qGOxp6GICi1gDi+3eBL5fN3sfFaOBAb
 7N+uuphKm69SPw6Ni4EeWroCV6s/xWOdCNgKfSeiOpTGMN7wRjZhvDLGDolecphgR9+daiJcr8e
 BSO1gVRi7QU8FpevSDw==
X-Proofpoint-ORIG-GUID: SfqlyD5FPyOrSqG8AyifUAR8_pthuQkg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX7wsOf4xcOJOO
 sGO60Vl2/hBL43jGGVmeDF6PJaYFrRFCSX9TjiYfWXWwNlnMkWZLf/welYbYQYIEiG+p1q1Mgve
 WudDi+Y4VvfVB/huzOejMIjTOrm64wI=
X-Proofpoint-GUID: SfqlyD5FPyOrSqG8AyifUAR8_pthuQkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

Some domain idle states require system-wide coordination and should not be
selected during regular CPU idle. However those states remain valid for
system-wide suspend like s2idle.

Add a per-state system_state boolean and populate it from the system-state
property. Make the genpd governor skip these states during CPU idle. Leave
the system wide suspend path unchanged so s2idle can select them.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pmdomain/core.c     | 2 ++
 drivers/pmdomain/governor.c | 6 ++++++
 include/linux/pm_domain.h   | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 964e44c2f78f..288c0deb2340 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3701,6 +3701,8 @@ static int genpd_parse_state(struct genpd_power_state *genpd_state,
 	if (!err)
 		genpd_state->residency_ns = 1000LL * residency;
 
+	genpd_state->system_state = of_property_read_bool(state_node, "system-state");
+
 	err = of_property_read_string(state_node, "idle-state-name",
 				      &genpd_state->name);
 	if (err)
diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index 38bba24ec26e..7684f9eecf85 100644
--- a/drivers/pmdomain/governor.c
+++ b/drivers/pmdomain/governor.c
@@ -185,6 +185,9 @@ static bool __default_power_down_ok(struct dev_pm_domain *pd,
 	s64 min_off_time_ns;
 	s64 off_on_time_ns;
 
+	if (genpd->states[state].system_state)
+		return false;
+
 	off_on_time_ns = genpd->states[state].power_off_latency_ns +
 		genpd->states[state].power_on_latency_ns;
 
@@ -407,6 +410,9 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 	 */
 	i = genpd->state_idx;
 	do {
+		if (genpd->states[i].system_state)
+			continue;
+
 		if ((idle_duration_ns >= (genpd->states[i].residency_ns +
 		    genpd->states[i].power_off_latency_ns)) &&
 		    (global_constraint >= (genpd->states[i].power_on_latency_ns +
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 14e0e346c610..d9b3e67042e5 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -188,6 +188,7 @@ struct genpd_power_state {
 	s64 power_off_latency_ns;
 	s64 power_on_latency_ns;
 	s64 residency_ns;
+	bool system_state;
 	u64 usage;
 	u64 rejected;
 	u64 above;

-- 
2.43.0

