Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6B3EF675
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180932; cv=none; b=EwyPheg4CsbkH0KQpFpQquqRPZ7zoLzlnz8+V9sbQVZMojptsmOouomzE0+rGPN1X8LDdSlbbiK82oBM8XJEOqI/1uGUsWfTVaf1YvDGQxaWwCbKEX+jSD8113ymG0GRq7RZtfG+PhwiRaP4Mg48hzjIKk4tTJt4CXq2gyaYhkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180932; c=relaxed/simple;
	bh=Pvg0y4IvYgyRyjgGSyPm0Vv3Ghs2hJveIaCUm/K4Qg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKSoU9eQr06mR/zat2lV9+8DokgyUZ8FGrrNu6aF6jZ2VWKtiHKuPusw/ogFHsphDxBAJ584pfV7avQ5i/3IaYVfuJmBt+VN6QdIn81Tl4pVzYQkfvtwzdofWD6D36DafCozYFz2rSq6wHksi2PM0xUK/+vtgrOsCizUeU1xm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQHgc4Wp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/ioRg+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQHgc4Wp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/ioRg+T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5aHxs867200
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQ+0FnEJugjYxtjlpuNz1AMACB0wuPR4vp/JFTyrtdI=; b=TQHgc4Wpx28xJfm+
	nTuFt5EYDOkev0Rxiioh2PUjtKDIW8liibfSjiadElGJBgU/PUWFYxG5xT0iuTDY
	iH2zfeM4FDrfwhm4nHwhO8tJyPC1BdkiadNVp3mB919J0I+GOy7Y8aRAl5Cou+/w
	PtIIHcS8flFX7orG/S/qzdxsAhL/KGNBoYSepgklMJk6IM2jdJZ7KBztJ+K1HzAf
	wmolCJ1Zx9ctgAgA6EP+B6KEjYCXWEZSau0xNxGqjFWHnnvbd82/f4gGu+OJKEu3
	6Qg+f9iigDyhZr+BFRgY6mJ191wIddKgVSehNNz9bizLwNx/AIUK3qUn33Le/1FP
	Bl+Ulg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1guby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:55:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba15e384c7so22826135ad.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180929; x=1779785729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQ+0FnEJugjYxtjlpuNz1AMACB0wuPR4vp/JFTyrtdI=;
        b=c/ioRg+T4qMGG8EjcfxkWmI9ZM3HKGC6VCUZQSzb7cWSs6ZagDNTA+IyT6KxHwPrzO
         4BbYbHRyo5pZJN72hft1eabr+XGHJ6Nbet4WZ17dxrW+meHDAClbF8UHoCz051YpST1E
         ihY/+5sACPGWEVbexfKwRCDhmH5qRKLGBo5lSzBdJYfDfRzMST03T9JVuKWYtYTA5kBC
         zs6I+xtctQ9tyzs4JYfGwBRYvnRZkGircjts6/spdKnosroFDR+EURp0hS8lLfL5DWX2
         lIHoTNXf1SWFwdfolwcfJdvxX6pwxMkN/llpgOS9rUTBJeZmGvPHGG3kW+erbjAz6bQf
         fgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180929; x=1779785729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ+0FnEJugjYxtjlpuNz1AMACB0wuPR4vp/JFTyrtdI=;
        b=Q8YrUjMVFPBuarOg92f4as7Mi6rWDv8L5OD42jxL3Fv4Ls5HO0+H9yruiGOMKICy+8
         o2H3yDmKJsd4HDOWeXtVRQCoPtr7G4D+rcZjH8LrhrTnN7YHjtMxiRqWjx7mT+1zBIKt
         DH+KejbgI5NCi3dbS0lZGxPEv6JKHgsWEAjtDBeFgiMDKFpxte3uj9eh7orDv6hbsd8+
         rn5qbt8Udye7x4oRQayiu6dqtLBKngRE/4MSd8ftsUNRS6nu2zp2zx2gTt22H2ENEKI1
         04dADvBJylIQ4QvKO9cGuPg1Gr4L9cQP5NvFO3wAp2DQ42d31u3ugycy4Gdp4sa/Cqw3
         NmVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Qp62OiOGzI7iHIR0LXk+eo4TWUUoSPNaNdyKPhMRmWkSJn7p3Ny3946qaXURIq5QjxBALRHcf0wnn@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9ZL+E7FsoPEnMOq2CQW75ZgZOwCBN3en6lENBERucEXwIaWT
	o9CZ6EkERZe6M9YnC+Xckgg5okpPIivZ9PUR2EeaNn1t3gsa1xXIXyJWnMRbKpyHxE4kbX5tTa5
	PjUUVPgVWpqUC+OWBYwvauGu15onzZGj+eRAloevI/Bi/PglazAlUSsKnqy+/HWZH
X-Gm-Gg: Acq92OG97mdKhD1EZTEEuj6niEP2GYPyNBcfwD54L0Voz7O84QabyAmRtOzR8JM2gok
	UvV9qtKDW/LHIudGh+3LXVVA3a8tN5MVVd5l7YhaIO2HnSJ5v3+maNMuXc2cS/qEi1UdRqU59U8
	o5y2BhSsTqE9k//22nVGhWe1oJpj8121PKKnMD/6OKt/tcThnpwyzUTshPwfBYCFSdUfwZUgLzl
	BtaZfl8kX2UgJmAb3O8TLNryHZHV+VITmPiqusb7E4HV01ZgfvyFV6FJ6EFVwXroIV7s3ZrHLq7
	8KJQxvFVi+ivCu6Sz7llxuylTxl35BwWhqv3KC78DaD+luXySQh8y3oZQbbEDFujgToB5z3xKWX
	Wt2PhOy+TOdpkAoRY//cGO/iCVP0fHaQ0iWVyYEXkA+yDSBbbBxk1hLxM5HT7nVo=
X-Received: by 2002:a17:902:9a94:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2bd7e7849a3mr126806895ad.4.1779180928749;
        Tue, 19 May 2026 01:55:28 -0700 (PDT)
X-Received: by 2002:a17:902:9a94:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2bd7e7849a3mr126806705ad.4.1779180928271;
        Tue, 19 May 2026 01:55:28 -0700 (PDT)
Received: from [10.92.176.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d6easm193406485ad.72.2026.05.19.01.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:55:27 -0700 (PDT)
Message-ID: <e0a49e4f-08cc-4faa-a7c8-ee7ac14615f1@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:25:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-1-80f07b345c29@oss.qualcomm.com>
 <181abfec-a6f9-49d3-9428-21a169a94246@kernel.org>
 <f40798ef-e066-4814-a26c-729dcdb9f5b1@oss.qualcomm.com>
 <166e09b6-2fd7-450a-b7df-b59b961bdfe2@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <166e09b6-2fd7-450a-b7df-b59b961bdfe2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NyBTYWx0ZWRfXzEfx0zg1StfL
 TTA9lWhfNmQBAiaDTkOTZcB+k44nb6/OAXUBnmv+HJiaQNLqFsSFN0PsOf+YtfMLYhv+/peEI8w
 6ezBsWhq+pMRGDpX55+9p6r1FjBZel5tzKSl38iKYnp4PzLtzxM8dgJ5mfbdoFi1Y70eq2AMztp
 4Zt+9zHdRUBfu//nq2WkpSKuYQ3TuDL9lv4U1zwr6lC9dDskhlR+9g9ryEMm5JBpHlNE7Q6ieBg
 gDLP+TW7yggDJXFQ6GnvixcZpFtaJgTe9U4Mq5DqIE96LYFEUvcMocViINDSfp9RP1aSgNaClG0
 h1SDFNk8LttHxRbBilb50rPBbsbVA/ax+AVdhyML9Y+FD4KOmQuBP13H34fRI37EFRRVSbxWLgq
 56+KdA/q80DB3CZjj06BzYpVjyFg7jcedHYWCwnORjF4wt2AQ80q8+U9XYUhnZiJNVv7IaTQtuz
 aqkfEd8LIdnk45WmMHQ==
X-Proofpoint-GUID: 79aBMkNu-tJg1AeBM8BSd1Uv41GHbmtN
X-Proofpoint-ORIG-GUID: 79aBMkNu-tJg1AeBM8BSd1Uv41GHbmtN
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c2581 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=-1BLe5um57GLRqdpntkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190087

> No, about proper patch organizing into one paychset instead of sending 5
> different patchsets with oneliners. That's literally the last
> thread/feedback on internal Open source forum chat, so easy to find.

Sure!
I'll align all 3 ssg modules(ice-ufs/emmc, rng and crypto) in one
patchseries for shikra and send together for ease in review.
Will ensure to follow same pattern in upcoming submissions too.

One doubt, there are mostly dts and dt-bindings patches so i think it's
best to organise per module patches together in big patchseries.

Kindly suggest for alternate opinion.

-- 
Regards
Kuldeep

