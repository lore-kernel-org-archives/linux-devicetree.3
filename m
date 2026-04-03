Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E48B3C9431
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225493; cv=none; b=Uu2qH0/RIHhWS4TelRneOHVPCabx3qgFzOfI6wnTBPanny1RgXW6CDo8mSMSKddeNyZ9VqO4GioTytx9rqwYC4gH9IzYY5fJyrbus+zvBpmNnIrsly939d+ZudhdIbQJXxB1vwkoKuKmu3vrhPIRKPirJgRM348TpnTCrKGEjPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225493; c=relaxed/simple;
	bh=pGXUSvvrPCaY9bNA8U6IJfdUVXNbpB60+57XVCPk97s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0sllCufl+97LO1mHi/SGMOUOs04BGTeIPGFBLQNFAek/NtlivZySZqUl+LqMgWOpYWqPQlEln5CoCT7ZkaiDXmcwNB2THpfM7hzD3gx2c0y0K8BofnDaa/5BdgA9/e+IOc156HyFkyzy63XalSAaJGXAmCjYKuSKaT+V2A1WoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fK4mZTh5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/p6e8Qg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fK4mZTh5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/p6e8Qg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DVr8L2359561
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 14:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6KRvTM8QKouT3ovjp7AlioiifSQn5uRmptINln2W/A=; b=fK4mZTh5TGPYKExD
	oZm23RS5Zq2fnGuHku+FWwGyeVm2iXIYZD7P/MIDpnAyv6gIHevKuVOQBE7XIcSW
	CfJ/3K8LrBrDppN5wkdREqFYnCRrsMQKkSluWLnTenU1yXoCAhObCqTClaG9G8B8
	ohfl538ClU7uPWXn/7ZvWgSfyhZLReYNpDiSN4KQJx2ZICan9H+msh0RCRWlwS/I
	DxWDNINrQkOAzsodaxTJI53cAm0hO7zpY4gLHFgv/8WU5Vdxfd6qStLyq2zhC3lj
	C+WzWxIlZcgVc+8bGOpknwNJPoaMglQ3Yto7IbFGKYZ1YnIZtRGbwEEGcbqySVFY
	1FU3Ig==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1g3pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:11:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60521f54387so666906137.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225491; x=1775830291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6KRvTM8QKouT3ovjp7AlioiifSQn5uRmptINln2W/A=;
        b=N/p6e8QgY3V3+PDMBMEd/9J79xG61RfoCLCU5k8++eAAs3DyWfCRP0CSJQjULelWsv
         RXwnJnbVOpvOvxnyfsQLrxlQj+6TbmHdnpsPW2cAP4vjbr7FSu6KtRSGpws1mtKRtoA2
         mqDcLmXEQ+GiLY12022R42wf+jjZWoS1i7FDBtaxUPfHOtit+EJg7HMxR2VE7PWGG9xy
         qcqQqKvb9fKNztKTnrD48YlEO+F0jMTXeeaTaX2Gb/g8VQ5nm4ViZxbQisCrBRjehKQU
         V6z54R1e+hKl8NQQIqKhZlc8hgu2fVplrOaYWVofNerlG2dnOvvfgJoL/JCQYtLg90Cr
         WVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225491; x=1775830291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b6KRvTM8QKouT3ovjp7AlioiifSQn5uRmptINln2W/A=;
        b=Knl3y6OiXuqqR+4h3H2vIJTl5MJ/t3HPRTVccrFBUfiqnQ7VoQ5bD8nQv8FitBMKBB
         Vw9bPhgBKBr3mg8yqzdFLjA2BbP7KkmtVMmxyd7YeJXaAvhf5vYUeS0/I44+f4q8B4iZ
         7REeAFrJFudOyd9ygSu9GkzOTNMBnfO+qLDoty9H8g/CkQpf8O+IzRBsSxGLTSk4/bKq
         HH3takf4hYbogYTq1SSQVnLiV5QgTEIu9JM91wN4ymzBuns+JXV6vWqaN8779gZL7iGC
         xauVFxWmk5ESoVgRgiveWplzE/VpwFgbChh7CuPUyTqr8AgYVjH4pguoHT3AhkBe6B7u
         4+3g==
X-Forwarded-Encrypted: i=1; AJvYcCW0tBKaRhf7u5D+VuMRmUAflw9VlReMIF4TriFoIyf5qusvOboL1/m5ow8bI2NV6wxw0b1Kmk7sf2gE@vger.kernel.org
X-Gm-Message-State: AOJu0YwryF7bgAb+LN7Q3xbd4jo6bGnr7lQ0JEDCC6twKcoHwMm1V3qF
	aoC9woWfXkE+DFwoZ72lNFhqmWx2ZQQnbvwnkGgWV2mdFJjHg1DWX7RVCkdGTc8LV688m4Uw9oY
	CSTN+ijMKdGbAB/7T9aTn/6oYo49gGQOjITeoXXLjOk70n2X38YoYQlfYFa1Z+Ykj
X-Gm-Gg: AeBDieudT8iVkyf7Fv+6jssWiif48KxLkpb3yV34u5uzEiO0Mcjir8eyKUrEljJpDfm
	VfjNyjM8Pmh/jj7pMMvsHMo6vqVMohWON/h7Mgp6DC5drIkUHU0UxtRE/ZC62GtM58OY/ToqzQk
	s8UnTRINvWgdMVwa/jeu/rrx2Q34ijBcWRV+5E1IV9/x5BYODfBRU+3zI9tXt7qKKVMoNaTwUZk
	ifQxJycUF/Y4z+J27tAYWL3bTymkilzQgnh3PgcYpmBjxUTTP+4WOxVXLvMF68Ye7dhvjqokdGV
	JPtjbqh9iz05QWkJT/LxLXl6HSb6TujL6OARVpq6dkNZjM5XjEi+L3+uItipTezaiPf2tpg3RuV
	M6M+bAxLeps2XieJ3eD9opE0FcHOt0EWdnclKFdPproAqIaPKNHM=
X-Received: by 2002:a05:6102:358d:b0:605:9ece:8d74 with SMTP id ada2fe7eead31-605a512bfe0mr919740137.24.1775225490723;
        Fri, 03 Apr 2026 07:11:30 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:605:9ece:8d74 with SMTP id ada2fe7eead31-605a512bfe0mr919720137.24.1775225490248;
        Fri, 03 Apr 2026 07:11:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:55 +0200
Subject: [PATCH 7/7] arm64: defconfig: enable clock controller drivers for
 Qualcomm Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-7-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=770;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pGXUSvvrPCaY9bNA8U6IJfdUVXNbpB60+57XVCPk97s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8qB9rA6oEtfhw5E1F2I9M0SZW4hSH9QHKa8+
 OOr9TGSwh2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KgQAKCRAFnS7L/zaE
 w+lAD/sGSyzHSiDLl10lrRqWadTn4ar0xcomvKgXlKXHrjSyctiLQH7te2z7srmzG3lfa1h5s0B
 ikoyEIhTNdPpNk8zWeM30ZUNk23lMbfKS87V+qhENK4zFL742sDpLqODNjBOhpJ7fi4t2FZKun6
 xBfJ2Zbggg4dR5ZmogMqsUYXqesjtNSAWaygJFKibSthKiKPZud/XbDVE0H3MtpSw2XlHqIxoTQ
 6QK5XqwrEeOTrNxa6htGAIMH9USIKfJwO2UPsT9wfR2uwunj2jhkCMulINf8iPnH16T1ytPk9j4
 pq3EV89gi9n7md1MKxxWV3vRcGP0wQDEtej7ugQhcbKAb5IldMGUs+WXhQRUjN+ou1gcB0s6VZ7
 U98HFUsmHWcLewH7FyTlBYOUgvPpD3c0UZCqFLMx0BI2qthJfhcKZEUO6Fj83jK4n2NsQOLe8zm
 n/+97BVz5PLtIjYGOCzl+mvcMr2CCcoJt78rL+sBg1mUIbz2qgESjMM/sZG2bgFpWQDkhm73zod
 46BA0mEeNU6VRIVIEoPHWUTCx+qbGeCy4gqWE5JDUu6kJMPEj5s2C5Q/ewXuzwCgXjhVVTMeP67
 C7/khGdA8PXqsRwqHzN92IOrsBVaQ93NUGYURs2sFwXerP0uUsiwk+E7DTNZMbpN0v0VcEbijO8
 ZJSu7skSwQLJjWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: LA7xi-gbaLJb9O6A1vCpvUWw-pfo_Rsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX2Z82UT/C3v9m
 fjnyNcD0YM6Ewlk86upPteOMKy7UGnSjzKYCtllXcd+56HJrE06g813pxW+BcgO+fd+JORM5O9a
 ifnBQ2Xcm5IuP5rb7XTy19D+41C1KFX8YCDrAreGtUegVG/36BwCjD3Tcq8Hfaqm5YxvY9XKIlM
 rZhnNJrymmcEPl8ZaxMheaWZ1EcVn9wmcE6jiPI550SvqZhH9DeEG7fQ16S5Dyf6CkF+LD/J1Y0
 h/s9CsRXfs1zXyCbcLFirchKEIaKEZXV5H6S+o+DGEYJzOvNJagNr1+HIT08GCJgQd9vmjB16fX
 Ht4tEDP5yYU/CyQjF5tKH5bZQi6pBFVahgIBrnBhPZXoBKTtH/pB2BzfSjAi8Q+0Abn5HzYm81Q
 fR1kwZfKYZxV8mibo6VULiF7sgh3OOrBd2rOYK1DD2VXyDf/8J2r/Jt2M7dzHdyz44bieUBK/YR
 +RSSp/jJozlIlS0RmnQ==
X-Proofpoint-ORIG-GUID: LA7xi-gbaLJb9O6A1vCpvUWw-pfo_Rsa
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69cfca93 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030126

Enable the clock controller drivers for Nord platform from Qualcomm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..f1a3333bb07482ef4f8b4ea9154b0f2c74587a04 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1483,6 +1483,8 @@ CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_GPUCC=m
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_KAANAPALI_VIDEOCC=m
+CONFIG_CLK_NORD_GCC=y
+CONFIG_CLK_NORD_TCSRCC=y
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y

-- 
2.47.3

