Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F63FDBE8
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759055; cv=none; b=kiql7I5Q5cnCqLHBxX3lMgba5Cg8YWQOVWxFPDI6kqvil/6+LvaP//dgMCcCp5zXIoT8CVCh2pWTRMhOqChROiT3crjTMSM965hDOQzhkkaRfMnGoRkIMt7XWDLegFeUWUKo1XtOFwrMLescS/5BusqTqRYT8431BF2bBn4gv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759055; c=relaxed/simple;
	bh=tVoQTbYajMkKgEqrf3VZ5wL2L00uymH51mQnbqmhBp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qk5KO/fBkonEIKF2OquxDAOYYpqKBO8UUQ8Cv1+lC7s812OT26ZR3PMOZGCOsIt9cG17oyKMwTcdRptbGSylzctNvVsy0dlY6DdtpvfJYarNhAgSjIbKzuUHNGC3w+rvMpGMNCWd8duGehGWJm98tP7g84Tv/Q4FGpEVCzuGsLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wxbmgn65; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ay3PanOs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wxbmgn65";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ay3PanOs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4YV2684199
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 12:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEK2It9sbhPK3Ps5mT3CD89/vH1PdHBx2foX295rOX8=; b=Wxbmgn65Zi1MGbUT
	TjQ0AAHPp6TYLf6IUqoqYB6OTdToG8iyhiKD8SypZ4GVIhAvj++F3RG/Lmj8a5ez
	0ANHS1LJtDTQZ+QoeGzE1xsHMV1jne1Vj3/CzfG9Limz3sHRdeHqJTg/MUo5kYDx
	Na00OdBHWtt/3IOv/wU/O8qVovrMfvv978PMKKZe+BoQi7yOT1CbuF12kNDFvvxI
	Kwm+CSyt83PziNcViqmiLm05zQOlxYI+dhFzIQ3+pZP4tLFqK1eaHfcYD+ARbWy3
	ezs/vi4azP32Wiyi/C7uxXlADt4rXYRG3SPHYc4xtkw6XSLxtqFKdC+GncZeV8P0
	y6ygtg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp169a6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:10:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso4748559a91.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785759052; x=1786363852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gEK2It9sbhPK3Ps5mT3CD89/vH1PdHBx2foX295rOX8=;
        b=ay3PanOs1wKc+F/KKp8rkAzPi/Ix1LY5ukkQ8v43iy0knqHyxiZolEcgscnoAtggQE
         8Njjrue2DJfHGDmth1CmSJeuLaJrsfsRg8ZiA1dd4fSFQTxvhSxukQcsdV8Z2vr+XeAn
         oseMgOskPSSAvX/tZyByhA6gVVwl2Pvq6WB+7fOG6dWp86M5LwiOCh11lcOWOVnO5jV6
         KLi+Db3AsCKqs2ngr2CFgDRr9rEHQooNMLxYH33XtUCYQmTHzz729lQJPdDTcHpOq3zy
         NsWV76hIdNLsI/RvFaHhcsG2MxtrzoeGuEeFy2sFt4KvEEV1NmV0HkkbRnoknwdhUMDB
         NAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759052; x=1786363852;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEK2It9sbhPK3Ps5mT3CD89/vH1PdHBx2foX295rOX8=;
        b=dzA3iTE1BOirY8qEt9/TcTymUPdunvh1sZI6cQcTJhCt9BxPsYZsQxAPeyvno6Cicd
         UC+KSYKOhFdIP1wYe9aqY7L43O2fU5OcSzAdLH2HPXvXEK5P4PdOvynlvyK+Rg2mXWqX
         8J1yKAz/XfluyefOO+0x1kS5FFdADr2N/v5f5Y7347GYRCbgNKy2mAGzS0j1f9f18KF7
         6T1vjPOH4KG5YeeGABJFtuveu4MT2zCpMw6MoVqnltvEEy1NH6fevr2T4mSG2LbM5v9B
         jSg/Wt3OQReQvNdR2yTYQE2h+WVVF1d09LarthHRJ5OY7xp4JQMwgiqByeyvtbOw0ytA
         VonQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNF0PeEqn37cooNOEIt01NBwjsPdZAHT1b/bekgCKTjeATMtimMmYPmcgIB8UVis+RAOiDpv6A378P@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOjCZV9KG+3tJftuzCmsYJO8lWP86de8tojkOvDpFq5bCwSb5
	JobhsK27tMDSzRdoQmLuMnW23ciwLqsHPX7pGonPibdY+96YQ8xNJYItFa2ACv2Sl0vUTQStF/k
	xYdzwt6wAMYkHabaRhgy8Pr4lPy2Nfz8BydaSeGk83lcuOVwXUpX0tzFKgerlJ1tT
X-Gm-Gg: AR+sD11vw167++tn4vr7IQjZ4sosOz0f8BMIo2xKq8kHwSgKP/U2ra3cFma3WAsX9pH
	HRBU5MS9XvhNgNdKISDvi3hTs+T4o2uiISplY/KjVboibq2SLeTMNDaWWEa8xyzxv1OHL0ReTFM
	KpmSIgo0pbhR0Dq5mV0cJA+rEgUt9OCNcfFID5P6e8JnRICdnwtaPe4O+BDl+ZxxSQC3739MFeq
	G+G/Z790sO3FWihg2mwanBTjGOT+hCMNrEh/wKk86MmJ2PQTW/9NbqBMFLTqUUX2XjWJogk2HI2
	diFGrR6mw533LyenzrR1/NVybpUXtO7YifLEjsVlhLzZgK0tUislDoH5U23eEuJsuCscfueJZYE
	Bj6rfsmjZuD5GS8XxlN8ZxwKfJ4c=
X-Received: by 2002:a17:90b:4b81:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38fbc3e5c7bmr9103269a91.2.1785759052426;
        Mon, 03 Aug 2026 05:10:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4b81:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38fbc3e5c7bmr9103245a91.2.1785759051918;
        Mon, 03 Aug 2026 05:10:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30a3c75sm3864076a91.9.2026.08.03.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:10:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and drop redundant wifi memory-region
Date: Mon,  3 Aug 2026 17:40:41 +0530
Message-ID: <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfX181ypl338r8D
 S82NghbciBq3Ep8rNw0AYGA3NQ2dTpr3OqHIW5xj7NpHI4TlgzzHu80vvuZAoGKNlR4WKqEhg5U
 fa+li1wja98oVf84uxMtmUckB1XetRoECb9IFIrl+sclRpY4OttbRBPBbmhWY04UAutrqLooPHL
 dHf2/XOLPVOHVm4HtVu5X4mDghrbSDMCr7IpNYV6t/g4hDmLfoX6Ox0v2GxtzotCaDjsdaX6/gV
 wUbEo3bGJkg15J22b+kChvUQPK3ACBRbEFRUzUiMy45SclR1Q9OhxyS1J40JIfIFRH1tB8wY4Av
 Xq9Q8taUAzTWGV31WVadqzPajE7clRL/MyE7fs9h/Xc6h2RZfk13fS86FDwyv5ucDY/QOe4cDcK
 rrWbM+qsND7clBGNcnLncY3SZT2MGLFPckLRvsh8gl/Qw7YQ0dg2aeoFo0hGwYyZBEpBlWvpN5f
 PW9NrOd0E9ichj4y8vw==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a70854d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=stktXEJXvQgT6foQVzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfXyVKFG6an4P8r
 V+MMwJxcAscSAIpVbbBCboqYf4aAQIL493LF0z37TnvexG4YCkN/FPYOGmIgW3QjVN0g2wQXwW6
 Hxz/7d8BxNJ5dsFOfu+6lnRu/uW3tyo=
X-Proofpoint-ORIG-GUID: 0qQGsXhQtkW8gGQ16RFKUxHEEyUTsiN8
X-Proofpoint-GUID: 0qQGsXhQtkW8gGQ16RFKUxHEEyUTsiN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030107

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
index 90f2eebc349f..ba60fccbb63d 100644
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

