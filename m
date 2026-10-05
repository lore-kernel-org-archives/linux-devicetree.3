Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8734B2044
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214208; cv=none; b=nqyLFR3yMW2qSqcAjvxnY4br6UgbT1DkDEy7FjwXHyqJgSnfS4iJQO7J3KcJnhiT3j+AjS0SzVDTSRgboLYXiWAr6KJe/0fW5oDZWDzWPbumebp8FrwGJKpuNR/DJUy3aTDUHifDA+KdWON4C3m5mJmIa91ls4nHbRpBvZZdta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214208; c=relaxed/simple;
	bh=uqTHWyaK670j38VSC6Vk5jxeyMj2fpngghwnVdDV3Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcUmXUTv7UjRPw59JNmTPg7wzz7EjEEpJBK3zWWZG3RS2Ho4SakV/y/lOQHalXFVPamGRtSxJK7VUIZyDjj3KflNqzwLwWUg7YLeWUx3+7v15SI2j4i0jlKP4jWW1myyO3h4ouKzCgQyW9/soysIebx2WyyYSlHIUg+dYvqghNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTXUDG/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MowwhOhT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTXUDG/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MowwhOhT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EOx8X2178387
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 15:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivmk/W1sZczLgwsdJr+S+hTa3Q0SCc61+BfePbAr0sY=; b=WTXUDG/IkHx/8NHQ
	UrAFYQc90gAae+vBsuqmPRZ+uPD5rWfKoZhZAKdvpM/zn7m6rE4FdfUw2sHNxLA/
	00gRuNXC/7yBWcEfHWH98gwcd88cNl6G4RcewGMOzBWOuxyYK56Ipc+gBC7lsBMh
	0qI5LTgb0qlAJxm3qvOGrE/6EHBEg6StBgWG4ei58w9T376ugxVmQ+mqkjsepmuv
	nKPYanEB90p/lNI8FjukSR1TW+UwbqTpwQvc0sWICparH1IxBoWGMMIfh5OGgv4I
	8g+w+iGFUXd+bkqYMh21BaA3SVTb9vVLR/nPt5WtYSeETheCT2ohnLr4GBemA+9q
	XEwPUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj60k8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:30:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88b9d8c9e55so1600625b3a.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214205; x=1791819005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivmk/W1sZczLgwsdJr+S+hTa3Q0SCc61+BfePbAr0sY=;
        b=MowwhOhTFuei9whVE3NP4SZdoRc9BJB3V+2i0eEBBliv9l9TRK54eAnf12B0P8kCdi
         xMoneu58YEZO0J6/1rMRvNJQbfyIyO7p3JxrsqcDXvA9dfvgyfozmWAm/nffHP/GXn2G
         OGA1b8j03bwxPKDOT2rOHIF5ilgznZXGGIHB/FfzSdGnamjxXm73y8K/vhdCiu3lEx3n
         S8TmLjFSk9PFxj4Z01g9nc5fMhAdIC2PViQGOr3bc0QwLXNeJSGLHqp5/OHNXvi9GQQ3
         WE2AMTpRGUF2j5HgiDhmfqzyebZMz+j8zvl5WhehftsjbhJo7A5QrNqnERJu2DwRn/w2
         bwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214205; x=1791819005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivmk/W1sZczLgwsdJr+S+hTa3Q0SCc61+BfePbAr0sY=;
        b=T0ashXXO/8YPpPXmBy7AdOZn0M4S/h6yvUlg/KDtAUYI1MTZpdpl38UBun3gdLNTiA
         drnxrSbVZag/5QdBUTrhuCn1QMFfDKSX1gEGemgH0m/O0t36GAC9CoFXesSa7XvP82Ny
         JjItBbfLIBNBLwLu1eoj0Sos7MN6vwDldmmi4f+i5Ls9q9RMQyXgqk6rj4+OqXW29WK7
         Yw7TXYm/kR0bgmhA9Jt+VUN0tqp8z8AllZOwcm38vmZiJp+HoEWC1/fmSpv4rm9iHCq8
         Gx+08RnwR7RbNuKAf0Xdnn3aCwQwOScfQXsIpKLW7MAcBG148zVZu3/gxv2GFgOo85v2
         nEWA==
X-Gm-Message-State: AFq9FYLkF7jR+9hNQaFZWpwNUk8U7JZLii8AVF9hFlJfiNnnz9PU0hfA
	4MvEb9fDoBFLVSVCs4drhIU7jRCnZjm4UKULwTctHaIBz9Um3FSFmvE21LF/tsEe2srFbtI7uPm
	PLPS426gYYjhtv+s724pafCbb5vdLVno3CFk8Pq01YcOL7bsogscm1FgC4fxRkq7b
X-Gm-Gg: AYBFou2HJZwRP3CUFDZN0aSQac5k4vq9FuHVdHbs6Zm+PzQrMAILXmTyS999HiwKKQh
	xGzgteeA4nnGeMtkBcalevb05HJIsRr1rQhYJZUM8pY30XnCPk6WP0HyOf9s2A1eKHI9YbZZ6p+
	v2zNyXaRTQQ08LY+xQSJHJLo0o22BbRMoE/UtkykCi6Onnm9HEmvrIBfOD8l7IG9Q096dHssvnW
	lf+Bzj147IyLh7HFH/EqUPrhyrYW0uZD2Duhu5Ci8kqLa+MHQ4uVacvC2Hm+uxdJtBKAbtsMBOn
	0aleAdEQ/5ESMqCxxAcX1TZMTfzcyPugWJsvL67qac2P/6CF1XYxd6QSv8W/gG6Ir3oacFoB+YY
	FC1qEnIpLao9IXG1y6pa1I6KbqHHf
X-Received: by 2002:a05:6a00:1399:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-887fb7b519fmr9162877b3a.2.1791214204509;
        Mon, 05 Oct 2026 08:30:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1399:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-887fb7b519fmr9162835b3a.2.1791214203805;
        Mon, 05 Oct 2026 08:30:03 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm3681528b3a.41.2026.10.05.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:30:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 20:59:43 +0530
Subject: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214188; l=2399;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=uqTHWyaK670j38VSC6Vk5jxeyMj2fpngghwnVdDV3Rg=;
 b=DS9eQ9mrSjJ6h49oPLT0m/ne5pIR7xiz2qq0Bdsl7rVRRBxBjDV695swIh0H5xqpJl4eMqzQ3
 wmWtvAaaEDsAX5dYshhcJIbeEZlZmzMgMV9ocFo5rTKXRY+SIbw5a4b
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX5OjwL3sABtY4
 FBtDHkyPXVMM8Y1xXEOunF6cxX2cBMcZz4k+tNqMxKHwB9Au7O2qY4upaeo/TvPtWe6nvntzJJz
 fOQX/oUebwowTSckD3tzbGhO82UIcKmd3/J3dWaTyXIHexAHGa658Wq6HeMhkc9c97PZZE+RGsG
 sLn0JdBm4QzhoidkdPxKxQV9ANk2k7vlElYbTDCchM1MDFwc0VWxq61SoN5R8jyUjJcumdyTcyx
 V99AgIi2o/NpUfVWyGJsfB0aqwroI2FF15LMFgBiv/bh/YT1ojsTzkJYsHrEj+yjgmN2476LpC3
 nltzjDAZh85drAUVLhaU+n3xv83YEfoHXhaF8JFFcct//94m+jvRWw035d1Ekit1AO9UrDOfyfs
 PjpVlqjlrquwinNzocXltL1Be3uZ17Ss0km5/EO3GFhE8AcfAzsk/AlKyB+RFcphN8fJ3yc/Z3h
 jy4CSP0dQJqFTZfe2cw==
X-Proofpoint-GUID: PhiOPAEJ00rB8x81GTxx9mlHny9jE3wT
X-Proofpoint-ORIG-GUID: PhiOPAEJ00rB8x81GTxx9mlHny9jE3wT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX4uH0gonEAl8k
 Y+aFAx/6Y7cwT6GlL1Q5ew4IZiHUz0XQ+NzbU6LbITPGxVm7g4RZiAlY0BNhyPOb0dUPRKhZARs
 q26Ui1qE+THtkgiRVMV8OPz9ZohDLf0=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac3c27d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XIWP2vTyFktR7zITobcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050060

Some domain idle states require system-wide coordination and should not be
selected during regular CPU idle. However those states remain valid for
system-wide suspend like s2idle.

Add a per-state system_state boolean and populate it from the system-state
property. Make the genpd governor skip these states during CPU idle. Leave
the system wide suspend path unchanged so s2idle can select them.

Assisted-by: Codex:GPT-6
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

