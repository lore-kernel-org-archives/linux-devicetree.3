Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD793ED5DE
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013595; cv=none; b=WIqY3D4CeBPIvLGl4dGpoTi0r7OghJWrtYmO6Adk9HJ/orGZq3rGxLnVmdkBDnTb1V1vQTi6d815IBzNfTHngrC0EUcrQVp7W3ZjprvtgsRVUq75fz4A0+VEGFfWeMD10HI4G3AHN9m89zVRwyfaRee1VHZyLJVFBT01jjqGxaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013595; c=relaxed/simple;
	bh=D4f2vQdrdki7ZGOnRFK/bwTkotK/uzROS4ph9Bdpk2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrJOUxi1H0+B6ac2aDlUBMpbZnSX3FfKxMrdL8SIyco39pH6Nw5lBCz3aiEIWeDhMPEVfNwPvZfYWrM7ex5NTaCpoMpleFeN8yCpCd4Zx++ai6ZDhh9vYNsJTU7j7AfLJFs+zoEIbBH/GqXRSgP3TSnGfar368uoCHZ/WJJJecM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irOwDsGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFMzLR7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irOwDsGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFMzLR7B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SfTc4005352
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7KR++2slyzotzbYYbez+TiPph9cdOcW0blbetyx7dc=; b=irOwDsGcvFpVMJrk
	br/ZU17LxejyM8C+bdwu3FsFaw4F3/W0qbJLexDD/07rI2uBmE5v0jUCeum0Q2LQ
	80MZB++rb0sj0XyOfGTBYSec20di4xQq7RxkruftMi0l8Mwm7s4c9MpAOu6tyqmc
	7nEsZgMoAUwKzm9XzIOAqfmV2mY0n+NivYdy5qe1WYkMzV3kq3PEI15qmtrA2JlZ
	JanbJAeaQja60OjsMI95Gbo2A77yKlqfYxzzOcmcN5bviIN0rcsSs2M4xLyjxTuh
	K8R3agyI9SBkqdYnlu4EwXZkttqEEO8PgsuXBaO4NIPOi0oMB0D2VNMD7icKp6EP
	r/2r+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctjx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:19:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so42405865ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013592; x=1784618392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W7KR++2slyzotzbYYbez+TiPph9cdOcW0blbetyx7dc=;
        b=VFMzLR7BEnpLp8jr7VYyIFlrK3RX54ACR1A+HDBQoSJvE+cT/EtxeH954+WVmUWhcS
         qTsdcd+WhLYD1f3tE38+hhK6h2TkixgDTDwtXyi7YJJdGioogzLo8E7Z2YGhZnYhSba9
         KpOHVlBqVasA2EpW8nvMShnzY6/OY/TiuTsH0jBO/D3nKB+YuSB9f8Uwm6mgLBDSz781
         vMjDnxjL0+bpRHgEbAtcgNnlJpnVqn8GxpSj07Fn8CFadyVMfq0LdTH2DBeewiOozc3X
         8NNSjykrOGSquiOKvCino5QSrgxyXKaowXcwUN/lx7GC1U/BegoYeIPUu45JU2AlSA6c
         6OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013592; x=1784618392;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7KR++2slyzotzbYYbez+TiPph9cdOcW0blbetyx7dc=;
        b=qxEIvCGooDXV+ztqhTvCAitXY9XXoXu+823Dos7zpXKApL8pYdCM9kErYOyFmVNMub
         km8xE5Uqz3nH8TBrwltJ4LSrMN30dy3Ju8e/ZVcjRne5O7PSlyz5ROT7isYfC6QTHZNo
         /sTziAWiSIsPB9U/HjANyLin68N+3FxyjRKWFjzCHpu+gy6RtNIP1wZrooo9FMQHVFb+
         ArCtU+oysdzI8Z3wWjsOzIlzoEsiGv4kZFekTsElE1h5sF/MUrnZaO2tMS3Ii1E+rocw
         hLkufUVpck0qmRmL57Y4DvezDxZ03H5LK3dcoVUp3wvKWQOeAqYUPibFQgts1hp0y3Gy
         xeDw==
X-Forwarded-Encrypted: i=1; AHgh+RrBAL87Aoyjxi7M3dj0WBd+URvmQphowGqqTyz1tZc1hqxDMCIntqJbYSW0QnxnDyQdN9Qwuk2OCMPP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyks+zdP6WqbM5799gYeKYGbTG9mujLnDxD0/rDO1lBig/oYel2
	nYm4kJnb/BYpFmoH9Z9JoASkAZMtK7uhDqPCr3cZP/VfcNkSdH19yLmkCvx8aSJOlqjuDWlJrw0
	sFdrU8IwJYrpV9WofNQPqjXQu09+MPOdK7lMJMs/pOJqOzYbaIOTRgvySyiciEPX4
X-Gm-Gg: AfdE7cluJd5YZ6U30gkgVnoiNLdOk1g7MLdqUo+qlbZa2XrLyUh4inkOs2fK206Gwux
	OWpk4VrtMtH/dfWoi81p0CnM0LlMZkifdjwnd1eS2WolibFRlIngKl7M+h1RjA9dtTl17Xow0SF
	UGHQEd069VLNCmFy5mK4w1iz8nb6nKW4Z/2BVL55KgsIAE7DLIixFXM0FrEDL55/rrII5GMtfJM
	Vmpz8EJ9syf1d+qsKD4gK635xZkpr+laGGuvgtW3zYPwtO9F9aoCNosmjZp+N1BxGmrG4gQWVsg
	LsJxx0PRszXfkBFby7uu1yUfVofgQ8xhQVO5/uMFwv1n9g2Rq1ZOw+Aj32OkUuoZqAcNwZaLeT5
	0Es4253/iDgIcu5cMpoaC0941FxJBdToOqsoLmw==
X-Received: by 2002:a17:903:37c5:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cef137215cmr13604595ad.45.1784013592436;
        Tue, 14 Jul 2026 00:19:52 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cef137215cmr13604305ad.45.1784013591970;
        Tue, 14 Jul 2026 00:19:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm113037435ad.39.2026.07.14.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:19:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH RESEND v10 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and drop redundant wifi memory-region
Date: Tue, 14 Jul 2026 12:49:42 +0530
Message-ID: <20260714071943.2036353-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
References: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: z475cR6ucHUMRha_q3x8C57Xqj5x2NoU
X-Proofpoint-ORIG-GUID: z475cR6ucHUMRha_q3x8C57Xqj5x2NoU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX9UBEpxl4ratP
 tv1RXP1X8E5y+FIM+6RMIOSEGGIRdinZo/iNlCypTgP6C/6VEI4FXpNMD/LXiEREeD+GnyXXyUn
 qUh4osXHEEJmQgq2359088YWsx5qHFA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX/fRuG0FaYG05
 Ch9XofkI0nHQ4hrejCv+BmF6HdIHmxNuVsB3IigicLJTeEhIM++RfQakvGSPWCE9Wdq8xJGrRbO
 4mopmKFKBPaXeGug07k2Wxt0air7IPYF0RLWNjXrZdG6D9ociUkEZVMJNy4GbjCv/oy0xDUDI+v
 Bu+NZaQdJuXfLKvXUxWCnVGN/5oyihjIxoHiZaTMA/GydUS0NSJaYBFarterggSgoKr3M/LxH/v
 4B5f3kbg3q1NO7jn9sSuxz/V6XBMeWjf1ypzDnZiD4KdaOHrht3ZfeM4EvmpMaJzCkUfb9DpkUd
 mbrvaE1adFOhKm9c8JDTotvCNkPlDCSOcxJu96SQRrd22egcEFtp5IMLZIE+HqzeltJg/zBQ4mo
 bz7HrmRucT0TQYV9UkkQ8qgMn8boZnDB0IADN8fx0djEIE1gpGHgj52WZWkWSxuqdk+WDxtT/c6
 CbNWyxP+7kz0k3a/HIQ==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55e319 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=stktXEJXvQgT6foQVzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140075

The reserved region wlan_ce_mem is device memory used by the WCN6750
firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
erroneous — the region must remain present regardless of whether the
underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
both board files.

Also drop the per-board memory-region override from &wifi. Both
wlan_fw_mem and wlan_ce_mem are already assigned to the wifi node in
kodiak.dtsi, so the override is redundant.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 2 --
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..6ab1bbdc0a62 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -25,7 +25,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1148,7 +1147,6 @@ &usb_1_qmpphy {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_qcm6490idp";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 9c24802e476e..c3eaa196a473 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -26,7 +26,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1464,7 +1463,6 @@ &venus {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_rb3gen2";
 
 	status = "okay";
-- 
2.53.0

