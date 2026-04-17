Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D723A318EE6
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467187; cv=none; b=cArNE43kacGM2mk1Mlf/VdBc/rZNiXhZEQb4YGt3X9av/0lVmLFsNROHYpNHqGkq7u/xY4E04IfNHmRV+hPa5ZNM+HwOi3K1YLrQ4S2+CMlnk8LSLsZRKNS3TW3sECKsyl1WW3VWW0tUTt5bIuv6rAYOVTGyFHsHW0v8fDeMqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467187; c=relaxed/simple;
	bh=9Z3rkMNYW9rC57WovaqtR7c3iwiDtbCMHKrgHTDkdLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuunWcwDig8rKrHrVnuzySNzWnOIHtohIvOgRCpRprV0TM02M6usSQvtKLNCy51sqpUVK2fvJbSO1H2FDq6e8ufQNqzkGrAg7NVjgEvMh6C5v8oOc1vIVNhiKfb/f3B/mUzvBNsBshM+6ELu1l+tkDE85OJyWykj9WR5D8SO47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mByWzSFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Owf+DKO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mByWzSFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Owf+DKO+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4KU54068820
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TH428YEn6ULrJVdAnHLIHUkA
	mePOQLmqHqXMw2uWMJA=; b=mByWzSFaw2EBeSlzjfKxrv4BnxD0ROeFqr0tN4eh
	OJ8DSSnGM7GukrsMUYHSQbuhKTcQ53VX1VY3g6DsbjuwFe1W/5f0WTMZf5PEGzNT
	UdLZKNj8Kv9hlDPNX/ltMd6G6AfmD2tgEgW5uMkJuUx2o/4E9opODlugg5KK9/zl
	VI9dYUfxt0+fgNqxdjFZtfiQfi7oeVikvjGUKoHVGCLKwWLOIouDiNIJqAz+KBvP
	mtEj33FvehXrFWfxKf4ayd6cRLtubTyq8pWI0yzxwwYG4DEkN7hNomxxVjqfZNrd
	d4A2in8DsddCIz+irKU/dz6xavOQ0qh/2WFqgPak048sEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu2k2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:06:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e160d5fd3so29499241cf.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467184; x=1777071984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TH428YEn6ULrJVdAnHLIHUkAmePOQLmqHqXMw2uWMJA=;
        b=Owf+DKO+HBqw6DROp+0bDLeQdK27VUBykmcqjiZxFtKOovDjF4lr5QxugjF3QdNQQ6
         yeYBuH6yQH2hz0Ev/DofXjGzvZfquzlqGQz3iS9XDhdQLfDsnkf6ydX0vsmm+GrHY3r4
         kiqxbpWofa3ylMhaCzhfVP7aFs8yd84Yuw33Qa5bl5lHctElxG8AE3kYiEjUx2ktOnR9
         sAcJOqE1UT8QwQ3ja+TTf42QTEw/cIx+eHYLSuYccg0i7Y3V91QqbhCZwFsj/uutcEHC
         VDTsSm9RH/OiXcQ4nFYD6soID8b5Z8/qYRfFdm1XmX3ina+PJyQPnMofxydOLbfBN8NS
         s0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467184; x=1777071984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH428YEn6ULrJVdAnHLIHUkAmePOQLmqHqXMw2uWMJA=;
        b=bS1DWB070FmjCOKnrMAlGpwB6/stAJVDR4zcUbxTFPJERDoPeedfgzHLGnMC+BNaqf
         GcApE7dTaCaz+EsebN2BQXWfek45P3AnJA/b5sVttEun7UlXfTXpSK3Zeahe95EkTqbi
         3dKszoHTbNGFtzWsD5rg7lTHeRKAanV1rmGn79ALx2JfmTpajaSPvWKwMj0uHq+EQ8Op
         zhz/mjq4Z3gRIzyFXqJKW+R4lb/QWB1l+Hq7K2+l/MpduXspHw3R0r/rmbb/0K9iCnZq
         5ir7rsnMxrxWj5C3LhhI7F1sNvQlXPpIV6s9FvVwOSeoDBbB2szWjMapwSKoxAYh+V//
         bJqw==
X-Forwarded-Encrypted: i=1; AFNElJ/DI1xd53YyMhdAImsL1gr+e78uJCFGQespAJRsRvc60NUwI/vaEUvKa1JZ1qFGX7wJx/b3N9V0RRCh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3IDdqYpuhgmFv56zfKtDaXTJBupdwD8OpwBbajHibHY1EfJEI
	iJrsOTDWeft/brGsO5IAiv1VhkuJilbQ+vVbox29EtVl/oymM4LnSK1EXvKLcwWsmOdl3hqu8nC
	PX/oswC7Pay0l5EkLStY08/qsMvJOzVu6hQ45U9wpHlYe0xQgzVZCKI2eNZCtZjydFoBy6CAR
X-Gm-Gg: AeBDietedQM4GyqmLCa6Bjc2pEqZGtkxEhXIgfdTBS3fAl314Em9duQHMKTyEDC0srM
	MK9hENBEwJ2tacwr74msX6OzYmEzZXMY1Cvp88q4VlT+DgIsgkZqoA2kXZ8/5SGok3145Y4WU0B
	9Y+07sX4reS4HEuPwDozyKx0ZjRBU2mc7Lbk69lHArHgTOqyajtTwZSKuHf/RIXlxtzFl7wKwmy
	7Kb94+SfOKHAMKnhGosT/QLS5oVi1ZKpNcjfcRZBksowpLTyvKd2QEW6cBZJ6QHCq0yyB4rTx5F
	Y8VD0fbeD64e+E6ei7GU16VdneCm0cIYsrweYfFMnoVi787TxteMwgpGLS30lQLKlum86hKkSql
	wr8fGVQSBcMQQ3WSVxY0tMlhrURe0nR5N1S6CMuEvHd0EhhWeeJFNqEdZgcbsTN/qVfqOR0gr6X
	AYQE1vbeB78hGspFkUZKHaj6oDY5wQhGFFNLZv4fzFTyhJMg==
X-Received: by 2002:a05:622a:199b:b0:50b:41ec:5e82 with SMTP id d75a77b69052e-50e36b3c5bbmr66950601cf.9.1776467183840;
        Fri, 17 Apr 2026 16:06:23 -0700 (PDT)
X-Received: by 2002:a05:622a:199b:b0:50b:41ec:5e82 with SMTP id d75a77b69052e-50e36b3c5bbmr66950171cf.9.1776467183430;
        Fri, 17 Apr 2026 16:06:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7b22sm788205e87.62.2026.04.17.16.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:06:22 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:06:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Karthik S <karthik.s@qss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset
 playback and record for qcs6490-rb3gen2 industrial mezzanine
Message-ID: <vgrw3n5invft2zxmeh2gsknxvkgluqus4dfb4h2ipea7lvma4k@wrumrkki54s7>
References: <20260417093327.3251203-1-karthik.s@qss.qualcomm.com>
 <b6600312-3667-472b-9b76-c9977355115a@kernel.org>
 <6b24255e-b579-4526-8820-6d7330768c50@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b24255e-b579-4526-8820-6d7330768c50@kernel.org>
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e2bcf0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=5rlWakiHEJELYhtiIUoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: rmC-lX689lUMMtjDmiuQSqy1zdHuIddD
X-Proofpoint-ORIG-GUID: rmC-lX689lUMMtjDmiuQSqy1zdHuIddD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfX27c0u6YBbJ6f
 wzximYobPVqWyGaVrjl5WRwAiqjR7YzYeYbsa30qOiBTIGYX+5EzjAcq8bhVUuEQ1nBmO+0+XHa
 TPTmGMeNK6pqWd066xxOCufgHEojU2LxAfFmd1BTwLPni0mzefbggK6xzRZGRxdJCLxT5fGykXT
 RaMNQm1u9tNZcgnkpFjsl+SykXDhQW4lmU/PsImY3cxAJo2JC3aCEcZE/v+wEYrizHb12VTbPKV
 473h5QXMIakQuLnkla1LafRaJoA8diHdcizI+iEehy7eWSKwJuxpyxiSIyTTktbHADX+Lhts4Wu
 KwRiGmPjE7HUilqMVBkPcDKZF32KGLTTpKGGI6En0lysmG5vWBj2f/9ScC6zEQWA7cXYziZUAy2
 hZjB1Fy+aA3SHvkP89Bs87fj2GAfCxjyfspigD4cAWsXHKd/ELFwYldsFTFz4cvKfMXkZ+hAQgK
 o4tSRVQYJ8a/VOJA9cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170230

On Fri, Apr 17, 2026 at 12:12:46PM +0200, Krzysztof Kozlowski wrote:
> On 17/04/2026 11:42, Krzysztof Kozlowski wrote:
> > 
> > And finally:
> > 
> > Please run scripts/checkpatch.pl on the patches and fix reported
> > warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> > patches and (probably) fix more warnings. Some warnings can be ignored,
> > especially from --strict run, but the code here looks like it needs a
> > fix. Feel free to get in touch if the warning is not clear.
> 
> As you pointed correctly after offline talk, checkpatch does not report
> undocumented compatible for the sound card qcs6490-rb3gen2-ia-snd-card.
> 
> Unfortunately this patch did not go through internal toolset fully
> (PatchWise), which could have flag the issue. Let's discuss it
> internally next week.
> 
> > 
> > Undocumented ABI (without any reference in changelog where to find
> > posted patch).
> You still need to solve the undocumented sound card ABI - new
> compatible. If it is already sent to mailing lists, then provide link in
> patch changelog (---).

Which compatible is new there? I think it is a model and not compatible.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
