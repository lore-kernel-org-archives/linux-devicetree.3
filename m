Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05794ACC6A
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379395; cv=none; b=Dm8aTqeGL2CXXgfJsvPEPNUIlw4fpd1U/S7jQ/hcHyxo+ggdWCPefijY3yhXgPS551om0ZoAIynI9GquqyFXuVVxkKNwV9VhnwGA3j7NtHqIKRib4EGCY2wh9MLTgvtAwKpLNagUs4W878PTF4UJbWo8i08JRilVLeZbZH+v/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379395; c=relaxed/simple;
	bh=lcYghPYPQnAUdk2tTeEOuezyDzc0WhSPRSI7GgfJz2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDzI1bEVbKug8gv7Q4eqkqteniy/YzqtiZ1j8+wwO/wtdZazxyrAQfg3jis0gbpWhNl5+KDM0svJxnDO17xD827v9mQ3okRR8PEmNHBwZ15ZfXhxPkUmDRUvG+tI5yIqyDPknwD6w/Gdk0sk3ijo+NEDCDom0TZQ3iVzik4xFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQVLruBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmE3Mh88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQVLruBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmE3Mh88"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVHjW2970016
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 13:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BjZrN+hkuGyVx/Cflq3VwuxQ
	GN0nui+PJTPi3KeyDmY=; b=hQVLruBuIcAcZ58hbB1ru6pS5+rp2PchQurd9mzH
	Cjd0KVZG/NnqWGIQdyVQg288r219R/JEbMS3svvQ0klRULTlugDVr6+/w8wRqxet
	2S6F8MD4780Vz3obRwb4BBFYOQKy9jT9f/soLNJuPyhVpAmxLcsaqhSfxOqFl5aE
	64MCXP72bi/M+/LwZbBsyN+/sb9mNo4gUHKzk/CTYe/nEVqDQ0vac6gD7w/CLDvU
	jaoJff+EyhomLL5I4gUXkcAaVIQlETGRMRVcZf1GlaHqcA3+pzj2mPqeRBy3PHJv
	QzyV6/ZRtG2KoQktzO4735tsYTkeb21f5/CTeqpbnu7JcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u2a67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 13:22:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so745158885a.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791379375; x=1791984175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BjZrN+hkuGyVx/Cflq3VwuxQGN0nui+PJTPi3KeyDmY=;
        b=RmE3Mh88HO9cSGJlpPowPddd/FjDsoAgPqN74P3iX7tu4xTtC1RKFON3iMKhzNzGAg
         O9JSsxhbMVnvLg6H2xGEir7c55CGvaioc0Wr13bBlbtSoYKwTEZlpTOd/uXL67QMPIxk
         3fIfyftQB7P19g6JKidTXkCdwUseeYxpeed/kdg6k6D2cxDl3qn3+M2J7JdSkz8r2tx7
         PbGmv/H4VU2mHosW3me7gBHKF1sqEPHqNeG+kabG74Q/OU5VnTIaofy2pBHBWxomg4TR
         rYDW+aqCwVruywPQvMmchSUch1583mhDypBm3af82bd9aQWILrEYUtgh4bi7bZHrqTZU
         b5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379375; x=1791984175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjZrN+hkuGyVx/Cflq3VwuxQGN0nui+PJTPi3KeyDmY=;
        b=vqm8L8XZSBfdfmYdFLbGBptD4Enz7/FgGcTdrJaHgqQauS+s0x/Av6b0KuNLSu6Ek/
         QmstMyCM9zfv6f+vb4nTkQayoj2HqrE9+/Iil+0Xf8Bby+VfhnNRdvGuRsSRAD+V0KQS
         DLFkZ0d9nDH+5oxZQV+2csBcWgWOgLZLv1dJqxnawiVICuYM7nOqPHsfD1EkuYsr6MG3
         mqvjaje+DHIvCjxKFkVmb/K0gnfyXmT1qkO0QydAqas77OUEjK3RS/alWuhqTyqsFSWO
         VsejFxoeYOdhaF/WdV/W/Yw/3oUOh9A4W8HKjSJFa+2PSn+SLkkA/ZStYLwMUZuH7g+E
         hBNg==
X-Forwarded-Encrypted: i=1; AKwUvBywRnw5CQu51idTDVAYBpnvXVtzotKcgJ4/ihJe9vHqDR2vVZZ1dqCJKc8MRz4UfgeRegIf76sYriIe@vger.kernel.org
X-Gm-Message-State: AFuF++l8uMejsqSM51HYi0DwoTu4PiXTEXz90zD/AnNHkFZnL8dedUYk
	K+9vrimdIEBvJOdGwqy4JbPmQgnFZYb0aPbSUFQUN/4lCg5AeOWcMD2CjCM79QAPR6B4veVh3R8
	i4v81OYAxF7q83UH8DycjmU6sq2C37qrbVcQytcPYEN2X6vcOxAd3K3mO8IOGVgbv
X-Gm-Gg: AYBFou1FunexYzm8Z3DkY/NXMySzZU0Em911sxt+A/ctMJpJoBK9TBaWt1Ip49S9VgK
	046j/JLfigYSSRRVCplz96R8zrJzJ6mo2wjjpyadcGpTds8qHXGlTPekPCOrXMOqMaMQocjh8ft
	nccUkiq5EQeUf/asrnnxXoArlVAWjkscGOrF0OIlh5WA9b0NvEAm+6MEbkUGHVJJ8K23sx8Cb4W
	aCN3SH1Xcn/zXy1dp2mMZbOVe63pLe39YIeawJUXbGPhPFwkDlqvof57+gCOqQu8SMVAkAZsjNV
	yi9dG5UPYT4VIjupSKsgW/R1/MyRjkHlCU2gt55ohFFdlIRBDulc4NK1wtyaD43EP97NXeHsoOL
	Mt30bI0iPVNg9FlPeQEupWyj/SqNjSCa2e2+RUCop42zE1MLu1qUduSI+b6Pb7UNm3jp13Pe2wA
	UmdqvOuZfR8ohC
X-Received: by 2002:a05:620a:6408:b0:93c:6ded:4665 with SMTP id af79cd13be357-93e9b2e9408mr369822385a.1.1791379374721;
        Wed, 07 Oct 2026 06:22:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:93c:6ded:4665 with SMTP id af79cd13be357-93e9b2e9408mr369816585a.1.1791379374144;
        Wed, 07 Oct 2026 06:22:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3014cf4sm41282e87.3.2026.10.07.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:22:52 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:22:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop
 8th Edition
Message-ID: <gfjao7xufwbu5unlqhvwri6k7h3inujospqwilwqhywqxuvs4f@gx76h6ntiqhk>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX9FaUjLa1YzGy
 +JeEKYOcgqOuy7ulFWY6RFkgdwwJVbyKTBbASWgOhkidOOOkmGvfkvB16Ok/VYRXsH9ymyEFbgL
 xa9kuc/rXQEDm0Gpsmo+J7hciNgr1xM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX9MOJNl27hvD5
 I7MfLeKPwe6qDQlslN10mGYA1GnI7pwcpbdSEo+7P2r1+VbXd4clO/l1FTvUH5rRQaihxcXqR/q
 A+1kksFvhLLpju9u47cb/kqPELSYJKAErTXMayohnwyBTm5rKCWrt9LHXvCyYjg29IrzbC51FvQ
 G3jsXss2rCGvSm2l/W1EO36/cqyRfDN70lIL/oUl8mDezCZyFYBv2M08f95A6V43GwaXEsIevgP
 PBHxFOAac2nvUUMY+s7w0DSWEi4lW/lVzp+cvkqbtnFjrHdWh6TxG6Km1yc/3ubd016sn1I2B/z
 rBjNbqDI8dIZ+6oDhvRiIrAL9pvj5yjM4A8Fgi4c8QxOGBPMH/yyAOMKEgIsymnYbXANLu3LZBX
 uhBvzORfj4sukCI5d9isp76ZAhBY0lFhv+HCXA0XGyEhT0qV+sefjuZksLVupI/B/CjjoKY8135
 Nv75p4gfuxeTEjZokFA==
X-Proofpoint-ORIG-GUID: iymMXjjcddB9e0ebSXqk3_GhVujZTGZ4
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac647af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JbvdwL0Z4G9UtC9WzY8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: iymMXjjcddB9e0ebSXqk3_GhVujZTGZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070053

On Tue, Oct 06, 2026 at 02:50:28AM -0700, Gopikrishna Garmidi wrote:
> Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
> 13.8" 8th Edition, giving access to the UEFI variables and the RTC
> offset stored there.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
