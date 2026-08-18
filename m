Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CEA472760
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056762; cv=none; b=ms4xelqtrQcsvqU5Y4xTOWtgLBe5ZlNdSRr2cI9vgmwytWO7HPdg0GsKHs5vcL0fSSTdzL8fxQgDr1jcQdGQFfIqmfkwNB89WTdVZJ5sl50oSz1KuEf7ERnhEX/qOhouMpyX/KHpB7yqfp4HH3NpBhPKTv64iJ+UJI0Sa/W/N20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056762; c=relaxed/simple;
	bh=YWSxs0QhOciQmaLVZF+gvmiXEVMso+zn92JvOv5pGPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkqameOs4EWPhlovcU/OauEtQeBLjzOTH4IJ/T/QmsmHCcECkY61PLqA9DvLSZFqp5A+LOzpvHBsFWOD4N/pqRiz9oLWAw9fXVEo5FiWe4ZDlr9hZ6NIkGCpaOMJeVM3DVdURprrZsikg6aXrlKVqh74QB/eAq+YfSPtkT+3NGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TM8J0xCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U41SdFCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TM8J0xCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U41SdFCw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABGj42056984
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=; b=TM8J0xCmEZewL4S/
	dbMxsHXBib6HAbyTZYLYPSDrx98anNKB/jwnSq93FKHHtlEArfohkCMk9DwbTodI
	BqmbJPZuGmAcR0xw6sJSe54hZZDWpw9qS8CFhcteeqgU3YNuRH6svWAMPmBrepPW
	Qdz9yumvQ8pokDpLIlf6Wr1v/e5jbQkHHe7QhuBGkNgOMOzWGLlfuC8/Tj7qm63U
	QQ2E23BbF53ab0rT4lZHVxrmy9ZGdOr8KBeGaW4v+LCcC5psbnTdZPwyai3yThAN
	3QVLrArxnwkbQfhgRdvCTYgOl2vNxL73a4zhE8qdlaXppS6yzJNgRFf7/UOUL/PE
	jUZgPA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmt3s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:39:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so6997311cf.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056752; x=1787661552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=;
        b=U41SdFCw/owJbmuomeOXAZMJkj4GSCmfntJTlnH6srb3fRdr1xMevdE/fQnHqTklir
         VUEQm84cnXq2o/upwAn2/bnA3oy8gjnzFf1UOhVf1m9EkXKu0XRArmMquUDg8b96BOml
         fhqyh+Ayf69zsCP48/1fQaradpGyl4hvrJU7rR+jTYjsUT4qHlaqb0okathpXA6Bcwlw
         ENirtRMa6yE5kmmQY9EK+0lOPbgTEMzVXdHNAemECkeez2TMvbwyJvF2jsbZUDqGP5uN
         9iDJKOHfjZzeBiJFF+DIMb55x4g3KQQTJUhgPbNOtCnG9TlcACpPG2lcPTxUQQZrKUFD
         W0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056752; x=1787661552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=;
        b=lZ++gkx1je7udWnLdw5nRh8X8ZMXXYfYG97xrwfBbOgoEi3kgRV9cAk7sdIdK3oG3j
         xg2ZCVbLD39pC4FJLqmdm55XiCb1/zGSPJd9J8+9VufUXaZ1VNzj7MVyi1c/794PDwFr
         DQ/I5od/tFNvGYC9Mxzuakk+4y0gKKkM+IFUtqTySDMqxUxOw/8IZtNLfYRhvUts6po5
         OT9+cumE52gpyuUuBk/9ZpDQNiWPJ2l8WdIx98YpoKknqAEx7Lp1K9L2GPTTkKnvGbYv
         tjbhboahOgLjJIYLUwHmaozpGiqJJBZ6C0fw4ZDnm1s3dDLJnulR0Qv1BoFJ9UX+T5s3
         n3mA==
X-Forwarded-Encrypted: i=1; AHgh+RptDRLogNgNqD5cFXeubGlfxcYPNKtMP88sE0znN9+ygaOk8fkGMpvs1sG4P2c+RoW4YaFdUrghSykY@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyjPpWU64XovnlLWhMmFg5dk7Jz0yDRnldxwXRNbQnxXD/McX
	1S4m2+CVlUWUzuchOn+xuh2l0G02DVYpHtsPdrngKv/84HfiYCYMSr6Z2fOBAooHbvE5xoUncpy
	ZkToESEcOMF3nK8QseFQLAZ+TYPyj/dx/skMIgre6DHE8ZWrQq2mDG9Rj2SeFhJsc
X-Gm-Gg: AR+sD13mwgLqYx5ws5T20+3jwZPU9ZFthYjSF5p4egMkiPJQXDs9Y/uD/tF9j0hm13d
	+aq1EMZPNczHPgETdDgDNOwsTnEgDwnazALbwOJdGKPGTOBHiDffFRkN27OvUJh2WCB2ztUeFRU
	r7EJTDF8dqFE+DmzslUTuYfec94TyB2zwG6M4IqxeYVaeCO+PYLqviwqlonnq4huENrPxKNsFGw
	w14HPaegEBKISwefVKqGF1Zx0zDVOENXHaFMA1MpqwYd5TzCnoYbgmJIj6s/N/8h1S2q1NKkFah
	5kRibdmOzRDwtbujgS3I2rmtu4vfM203Z5dAtJ71YO5s5EOwPSPcCWEdcNNEDRGGeKTHTDIPtko
	eDPgfqc1qxQcemWWNlquQIthw
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr235315621cf.4.1787056752504;
        Tue, 18 Aug 2026 05:39:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr235314971cf.4.1787056751991;
        Tue, 18 Aug 2026 05:39:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8517775sm1713144a12.2.2026.08.18.05.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:39:10 -0700 (PDT)
Message-ID: <4b0287b4-6fa7-4fe8-a880-446ecdf01b1d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:39:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325-nothing-spacewar: Add ultra
 wide camera support
To: Danila Tikhonov <danila@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eugene Lepshy
 <fekz115@gmail.com>, Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260801143125.267054-1-danila@mainlining.org>
 <20260801143125.267054-3-danila@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801143125.267054-3-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXx1lhP69nmDpW
 eIDuWI/JcSNCRlpyld7hwVKuphrpr9FewtKs+dvMUBbRV0mOIOBfWHLYLhiOeT/VPa6mQ/C9ANU
 Yqr3z/w9lC1frk9Izws2fiViDiBO5ZwOQIw6cxg+jHyB6zcBjGxjye6Bgp591vpk7m1JbEf3GCS
 EQwN4PAqzis12Qs3N7SpdIrCa4ljhC4sBuEYr2Bz9UhCrOtXNfC3k7ppLpVYabUpJ0NS+qJAdU3
 TDQpYuDzldvjA/H2WnB/eNKK/w8C4e7hp50Kf/+vO0Y81MaifzfDMuQMArG41p8IofS38omCgIq
 rskh4txFd6fH+lIThnTc88SywtHhRKwG1vE4qNopxbqVwazsq4uKJGkIztD8W6RDL0BvIrejFkS
 6sQy7YSERAVi+4utAx5exDKuDHUqHLwLRwEV9faRqAU/mjnkjNn/uq/UwOez3wrE55VDVprTw9/
 ChSaIenI4SloN6ycWGQ==
X-Proofpoint-GUID: NmLICAzIWnQU6DDm2LXR6xUT5sXOOh9L
X-Proofpoint-ORIG-GUID: NmLICAzIWnQU6DDm2LXR6xUT5sXOOh9L
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a845271 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=2Ii_74CIHdEfXmswDR0A:9 a=QEXdDO2ut3YA:10 a=4cnV9WtFwDsA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX+CbYOrMZ3sot
 /OH9e7Ry/edRBwlruoccq380lJwoHEiJltPE9wKBUkaoOrYJg9+E/j05SFrUAvXhUk2tR83VjF/
 llFrQCo8YqyZ45PIsVVQYzACbSPr9vg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/1/26 4:31 PM, Danila Tikhonov wrote:
> Add and configure the necessary nodes to enable the ultra wide camera
> (Samsung S5KJN1), connected to CSIPHY 2.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---

Same comments as on the other patchset

Konrad
