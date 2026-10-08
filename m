Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261C044C50E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462131; cv=pass; b=CG60fbCZCV/H3GhqI3HP8qvbiqRXkQerV2cEOCzLPwAMhL1cWVNJW7apypCVcIGXv4GsPkDxBQeP8dv4L9goUeY1kyTJGQJNZ0+kx1dSS7iEElCDINhSbIf8p47KpccaON5T7MAIC9nQhgv34rjEzGDYTddgXSzARAOO0pKmKIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462131; c=relaxed/simple;
	bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcG+6B9HwB0GX/a3SFcXRt52n3GqVGQycqY+D8bPmbCfDSq1INx9Vzz7GelFJ56CpMzY+exOn89kr/aWAIc2WVgJ3nANwa0ma02QvFka419+LiD1IgQweQeW2cQ1KEkwo048OU124TTGAh1bsaLYbdMwfLaRWRSVNDlrivPwEhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSlQoHnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUnCAw7v; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSlQoHnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUnCAw7v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKN4Y1708598
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 12:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=; b=PSlQoHnbsoQqCE1q
	KWv2ipXNFwyawIB51ym7mtbKSWaIJ5GKoB+2wyBvbFOvEJCzuQMHCpzQZ6BQ+Tv5
	foRGsm7S/gM3eabLuAkAm+s77Cnb+Jrv/IEIRhFf+ee7PdA0fzSuzgkMLdVrII4o
	EX2pu9BeJWjEz46dxcMRmBKCgVOIsKt4DRxGHKAz7pO3WgHaXJyuU3eWHVT6xLKM
	NRHUE4bp+FXrDEaYr9LN0TNdA34spBo/xomgdbz4ZkYNu3nstT+5ir6qaY06sCFN
	pjz5MIKEBGfEycmCJMWq2xd1cW0knOJigkR2i/QD7dx4rvVdwUKP8vyQ0QmRwmN0
	pu0VLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ata1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:22:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e827b3a6b4so3090435ad.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 05:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791462123; cv=none;
        d=google.com; s=arc-20260327;
        b=HuREu3xIeem2J7IA3f5n1j/VDzdM5XmSmIKFyC0B0sXbe5TICpV21OWDOE4bKFtvCK
         eHYHXmk8+B85tbzQu9IDpP2eekGg08hJcdyn0kFyVCohM1i6RQ48DW0Ns3YvQRJFFgHq
         Dx5qCvHmFP8uSG1m+5vqzZP0AP+3xaeuedlhlRpCEF7S2inTK/hlynN3v/qOa+SBeljg
         MzfWe1mRcea6qeZhlYMzOzA0hB7BF7zvAJJHjqa/qXz03XxoO53DE71M0NWmaBIfGSIw
         ycGxBY1HjMI6nA372JCY2V+aDZ1AQ1FydEw54VaN3AZpQidZcRBlw2hMvt/Tx623meOm
         i8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        fh=vq4S/FQ3LlBpAQ+lW0KCij8+/CDa+D4ICYEEAAGXfIQ=;
        b=afUGeYJYBqsvtRIt0HzP3Lj7HlNQwBeIG+L/sv9bYIYtth+oYqGmtjdxULYeLXLNr/
         MsrxvFozRApCe2fWjTIY7irRJ9CreNjoPf5lmQkzqZYQ4gmRDx+V8d4YtBjXjVR4iClv
         BNNYk5c/LaHz/ajoQUVtanbI2Rnn99MgiAfURdv2hKkXzVfoI3rHrGXKUKPOakpsqusu
         5ckajrBPuuWGyecZQoi8Wgjdui9/9eSYFZbLg8muV5BL6ChLfShP3ZJnlWBLdzP4NzFa
         NgtExcOJvUnEYHI63NW7peW27oEyRtnRD4UEBtJUu5jy5xvOx3N/7txL/7B/TXUAd7in
         hSeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791462123; x=1792066923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        b=fUnCAw7v+6Y+SMXFHRJkZoWQ1iacf+BgAjuo1pB2HzuS6qDBXYjUdRapTmNVAYtsvX
         sOwkYwVYM1wAD4endgtxjUazgbsqOvhIwcdnpROUgOqSGmjv5SXmhl890tcfGWj8S+bs
         YGnoU6R1cp47fpG2TWCp/UCxJL0xweVQT6FX/Z2s6op9g15mLld4KxReRYF+p+xz4ttz
         YukBNQnyaV2p3Ppi3DyXBjcYOFcStwwbv7fRC5gfoCFF9LQRufUjhKVKFr4yc9lOlFOB
         7li63nc59LRTyF9j8sc87Zcf1/qnQ0oiPGjafe9sF5ohSs5kBXYKhCe3CpQ/3VDkcy8R
         24LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791462123; x=1792066923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4j9FfZKR8IGCg47cVnrN1yTG8l/L0oUKeTDJQOU6mc=;
        b=sCAIVJHSd2Zt2qEX5mGAkmZnZlTZtcWJfWafryCoP3aMHDDo/L8VAoIMsrpOVETrOM
         8yC2yS6vz9F3feYBOFx/Vondo8WrQxbKPtM3ucv5gkHs9JYV97TMvoyHfCnVQr6z+beZ
         1VRn47faqDS0bOFH1ZoVmS37XKDQra+r4sRu9Wh2DgVe02iqc55215/J78+Ep9mV5eIo
         lycTWxyhETUsjv/tU/3in6PeUhIc0aXE0fnQX25oVi3jGC1CSo2gpWIgU8YqrTDOxPxQ
         lPdoElLqa93t7KzLHXSl+KSSUu1FUMDVtc9kvfd/cSjToIQH7sxRL0cq8hMwMQD99xsy
         TwQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6XWyNlQETzOhuMowC0wHZ9jC47Fh1fu/CjYBS6SQg3YxypJdHRncTD195fYWIQUM8CJo0hlocxHnt@vger.kernel.org
X-Gm-Message-State: AFq9FYIy5YCgRZ16KFh44uc8cJoAEp7zfghhCG0n4WuLiKN06tbLsyk6
	aTurboeBWPqxTZ7Mh9avPwnomoieA7HJo/F8HpOH08DolEO88s/Vln/E2dm/gr7kUBjkVFuxOiP
	SwbpLVa0d9mZxqI5WlHFR6F9Y1LA1NeJP3Efe0Y1U8EgdsL/igPf1RDxHKTwqjKdVUctOCXzWCO
	hyPzCGfBKxbNCInRJBatHEnslQ2/XXQgGY1ZW5mFs=
X-Gm-Gg: AYBFou0T7sd8Yn0cdAUJarC4WG4ksIl75fwHYrclqOvRp8/tJha6jskChMk2AmlXLA8
	ivcAX5lFfj2v0SroONE+bx+fRIwuICxqRx5lRn/tNKcWyEIOz8erKuiMVYGTG9Zd9flNXA6eOJl
	CJbx+OEbhwON0iYkI0sPJItahryCwI3qpv+mrsEvbFdQsBL9uuUv9S5mvYSXxXY6QJOg4w88/N+
	UQ891yASodpYeVbvA==
X-Received: by 2002:a17:902:b905:b0:2e4:a338:3658 with SMTP id d9443c01a7336-2e60051d4a0mr35952295ad.42.1791462122976;
        Thu, 08 Oct 2026 05:22:02 -0700 (PDT)
X-Received: by 2002:a17:902:b905:b0:2e4:a338:3658 with SMTP id
 d9443c01a7336-2e60051d4a0mr35952055ad.42.1791462122438; Thu, 08 Oct 2026
 05:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com> <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
In-Reply-To: <20261006-romantic-stalwart-seriema-90e71d@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:21:49 +0200
X-Gm-Features: AclHuK8ZT7r3xmegX1XclNDyrJeEDtHELpRcrHYyZXH39CoY5X64BysHsJ4sp3g
Message-ID: <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GINqyrXBe6344J6W_fUc4Wdy6DEBuTNW
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac78af0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=3wAzXcUKBgoAJ-C3A44A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0OSBTYWx0ZWRfX8GzUBPccuC/V
 3vGBsiRgujvPZM1pAN+bzSVBtwcbmV7JP9i79BBC275MShNOwWeQzAcBEFc5jmmMeisMDVh1xv3
 u8JW4EjFknHHT6UpDxtpJ06UGcvbxX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0OSBTYWx0ZWRfX8ZXONShsAX09
 6YhRFWyfOHjtRNubpuaGKtk5LdWoN0+XvrjgqcPNGh9BvN8yb5CbaOYzdRzWwmdhGdIbLyZR9GM
 TfVECGn5HWSNs50uUiXC10xuyvbDBVvF44+CBx7jj8EXi6hTZCIUQXIIm8mZNXXVHCVApbQnpFm
 j3qwgJZ7P+XNbS0LvW6LxXUFy6tP48gAjJsCl2doIVEkiP/3p177OG0vOXYJOReJQIzbYDA7EBW
 P5UFwOrZkXiMVTKEKM45N+G1/88YyaypwWUwyIpiSTjOmgrptrgzOCbZMTbnixfJz0zJcCQvbEA
 CVnQy8hdgMg8YrI5qqHIuW/GJgoRgRRy/Pg8BgjmaxNU1qct7tfy+j0WJZ/vNmf2wAMJOEiPL0y
 Oek3jEEvPcBvDT0foxbwPAxj2laxwb7S7yuHNNctPNZ/D1LgpUuqgzlrnf+VUzW6zZW7330fBJg
 nG8Kss598nFTQjI5T2g==
X-Proofpoint-ORIG-GUID: GINqyrXBe6344J6W_fUc4Wdy6DEBuTNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080049

On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > Some domain idle states require system-wide coordination and should not=
 be
> > selected during regular CPU idle. However those states remain valid for
> > system-wide suspend like s2idle.
> >
> > Add a per-state system_state boolean and populate it from the system-st=
ate
> > property. Make the genpd governor skip these states during CPU idle. Le=
ave
> > the system wide suspend path unchanged so s2idle can select them.
> >
>
> Instead of this I am thinking if we can QoS cpu latency setting and block
> system level states normally. Since s2idle is user driven, it should be
> controllable via user-space and we don't have to define bindings again
> if systems that use platform-coordinated needs this too. They may not
> use domain-idle-states.

Even if we likely could make that work, it's seems not correct to rely
on userspace to make the kernel to pick the correct idle state, while
the decision should be based on the characteristics of the HW.

In regards to PSCI PC mode, I believe we should consider adding the
similar DT property for the arm,idle-state binding and make a
corresponding change for the regular CPUIdle path/governors. Although,
it doesn't necessarily need to be part of the $subject series. I would
 be fine if that is handled later on too.

Kind regards
Uffe
