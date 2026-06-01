Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1D3AE1A8
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322117; cv=none; b=QWNwMGAeIO+h0gTB1yEQxyXIM1itz4Gq4wwx/Pepv6j+8eqNfqDrbXjA7ZpkDZzJ4DOlc1wAJIcx7DepooOoy9rChBp4POH2IwkFTt7OGLHQ3fZDgveJe+vJhx54YPRh7ivDQ86aLXBzYg0MXXgTd/4lumxMibScfZs4U/Hy8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322117; c=relaxed/simple;
	bh=wK2kSrx/pkY4LtGToP9RGTEX/TwkRTf0yVVB5y4qHNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtAsYZXGdTDMT/OTkifxU7zBR0eWJbvr+RXlV1BMQlRgyGhwLYxCTBhHfwrP1eqpojJUOPzfB6JDUTy62ZZ3yxS2C122Ex1mDkowLBjr9f/90G8EDJyi0bFykEyiOTTHG3/wQWA27ZPRdUKn1Wb4d3ShMFY9mADWK4Gy0HS7ebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sel3T2xA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvvAGFfL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sel3T2xA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvvAGFfL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651AxF6d334640
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 13:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uyAUjOxF0Tn2t9DeI7xkqKHi27Jd5OntW0Mgn/yPicU=; b=Sel3T2xAawdSe8J/
	uljNAH7MCAMyUYYXZWoLgU84EQUBUG3aAgqCqRdrl55n079YlNx4mvSMlOSjPR1b
	Itfvh0EL4KB1d0Qk64wzqKyOxCXZGWqA3pQX0cax8lMFHK8DSW3y952idKgXYqVU
	onDdZeHJZOv1hFalCfmb0CfoUXdgtHfGcWDF/Cu0wGnFFB9EAOXsLV83/AilL2Ew
	UFs5BRAh5Keu6WjDQexe4iAhUL3qGOLYHFv072Fub5igqNpEPfUKTpqaIQbuUuo5
	5zVTzUAwLAkf7bIl5qo/bSjb0msEeDHbnEJIGeicCDxYvQyd39KcK8UD06G3LgL5
	4TLNag==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfrpjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 13:55:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso3889784137.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780322114; x=1780926914; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyAUjOxF0Tn2t9DeI7xkqKHi27Jd5OntW0Mgn/yPicU=;
        b=FvvAGFfLct8FP1ihcBSawtpycOZTmruYVg04BjbnWedLjIN+egQJKik6AbInDmy16z
         oZid6+QSqylHBC0vp/AbHIOoMHWEiSVHEjrsbphnnaUYuCbPdhbiXoBJC/9NSRUKjUK1
         D4t1UOaT6tskHIFGfOX+Uh4qprEWa4VTwtcDHuA51hbXR0QQ7if+SW5moqnSDp7NB4c6
         lwcGnpWdZJeDQ926PhQEb5CSfMnj/EUcNPavSPOPD7WYB2qqpYN/M6EdeF47KGsS2YxD
         LZSBgyKDDA+GDQcCOWBUgKTO5O5cIegXhfefImeJhI7gi6kEa8GhioddIsUjJQEBIpI/
         HvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322114; x=1780926914;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyAUjOxF0Tn2t9DeI7xkqKHi27Jd5OntW0Mgn/yPicU=;
        b=mF4/uSnA0SYCaJHTFYSgOC9A12a/gwS9rrcOhlInztyrxcN4nICVbaoPuoQuJa7J0z
         cEhc8Bul9ZFHc4dIHRrDP9/XiU0hMg4gQlVnEUBDvD65G8POdAfYaTjEQUsxMkLyx01Y
         YTdv5eHXgK/dKx1hN8JDICbbMLiDbodGayz6ijnIbb8EKy9FjFN40achD0nEutfqNts6
         0R/V1wPQB/Gf9YdEjsLr60LEX+fiN5iFNQMXHzGl34H9TLLP9XXcd8l3tVPar1LNy415
         c+ZIuq2oeipFDL90Hh9Yagrfqww8hdqFEBerqG9n3v6+NXHYLpTlvu5POzUn8IK6394b
         v/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GWLl85PP9zsv76nGYtVsXdFAVJkCXXH+Z38yV12OVjv1y1AgrebP1YA2tGdXWJCqjaFanhJOX7U93@vger.kernel.org
X-Gm-Message-State: AOJu0YyzBrFCgZVSP4Mu6sFjpuphf1UUv9RveIdK35yzvNKbzC4Syqu7
	e5gg5gtWxHlUsBJiYLhixk1am4fkBd7qibO/HBrOdddZZVExbB+y114u1H/IlfZQAiajTKelKfD
	X5/3qLnCEz/3LTx+5gqb6Dwk0N3ME7wY6NRcKN4W1oK76lR63djy5EPpo1R/xcoFe
X-Gm-Gg: Acq92OH8+EjM3hEjsypITaEc1IyNspFnYYWsvTjgcJ8deI0pyaJT2lty9kBOd5OFMPI
	+EFyoljmOOkhX/8aTFYgVuOUCo7YmaKnu5h+7WCnxQeVZgTKTAWOnfk2lKwwBiMzPSkggFCGFV8
	EhIEispn/bCoYINgRosBkARfG03SFeOTpqsbDavyVvWOji6WLdswzG/cGvYgY6qevx2x3BQVV/J
	DQ+gn9Ek1o/5FEkjY9Fr+SFidGGElUEYUsui9rlISvTu5ufZp6HM0FfWmMOXPBkLf4Mp7PB7ZxW
	XlTicg4qAj3BkskzBh6SQgtj2LtYajLkswjA7sV8BbC7hgBRWYgGXM/c4ppNlM4D82WUPANwbAh
	8rnnwfagBr2XzfWyPqbGElt+JYNomCKHNEPJIIfYKgg8yvWJ3jkt6y8Fgr2TMhrpbKqX+T18Bpc
	MePL3EcqnxWz1DfLqxYI7EHwL3ZVBhW7JYF1GaZs9VQiFU3A==
X-Received: by 2002:a05:6102:26c7:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6c690fc77e8mr3840409137.12.1780322114074;
        Mon, 01 Jun 2026 06:55:14 -0700 (PDT)
X-Received: by 2002:a05:6102:26c7:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6c690fc77e8mr3840396137.12.1780322113673;
        Mon, 01 Jun 2026 06:55:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596664sm2042866e87.39.2026.06.01.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:55:12 -0700 (PDT)
Date: Mon, 1 Jun 2026 16:55:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
Message-ID: <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
 <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
 <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
X-Proofpoint-GUID: eKbWvmac6K3cgcIPfcMRbwHBDKJudSrc
X-Proofpoint-ORIG-GUID: eKbWvmac6K3cgcIPfcMRbwHBDKJudSrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzOSBTYWx0ZWRfX1oiHWUO1jj+V
 RwmI39GUKBnNieaYnib3q0+rXRYjQeEh7tmqQx5Q+wanl/dnY/MT4jo/beF98OnMLDbzJl9lIR+
 vJalaUzIyXWTBt3KQkbNUJ5dV2IRY5D6agez9XGUx8N/uy5SL/RYZZI3Nk2IIfW36b7x/aAG1D6
 JF2L50RvMC1YJ2OkO1y7RUvHR4ihWqao5GE1ZL7dKbk6zrIE2QMc1xRWt7hdTSYmYApj5wl+DQ9
 8oD5x7eg8P5Lol7/pA7+iQJib2cQHJIdNstwNliTd+44x67Ujl5LNW77Emsg4Lt1GzO1bLcqSRD
 R/tdohPmzUIxPA8N6ZwlOoS15elhsO12kdelXZO1+LNrWD2Vo2Bv/T+VaKuw8MjJD5STy/vFI2G
 RptBR2M9ew7bRnC2Dk11QlqqIkZL4sSinMwfGBc1ptm1TrqypRoO7w15HG6ACFvbinlaEqyOrPU
 TiXE2kxRaUxvK155xqA==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1d8f42 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=kmbsWd4-S-67eBYOI4cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010139

On Mon, Jun 01, 2026 at 06:31:08PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 01-06-2026 17:01, Dmitry Baryshkov wrote:
> > Is it completely compatible? If so, we can drop the driver parts and
> > make Glymur fallback to Hamoa.
> 
> Not fully — Glymur lacks CSIPHY2. So, A direct fallback to x1e80100 would
> probe a non-existent CSIPHY2 register region.
> 
> All other resources (VFE, CSID, TPG, ICC) and version-switch paths are identical
> to x1e80100, so only the csiphy_res table needs to remain Glymur-specific.

We have all the resources in DT. Can we not use DT to determine whether
the host has CSIPHY2 or not?

-- 
With best wishes
Dmitry
