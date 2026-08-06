Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2393E9F60
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008634; cv=none; b=UZ23Hevo7YEfHYr9gecQ0P3ftEBF6sreq7OMDeefwigxTzHovRiKaCLjqHUBTTrJ8Mw5moMxkfMebdajuyMLKUBLKiY1BX4D1bT3EmuSBRFfMjAXRWgHtbJh6ieyZgfHkZ8KhrgJZLfC+TcmqiG7DaxhyzaF82SNvEutbjmDdO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008634; c=relaxed/simple;
	bh=JhF9EmqILUf+L0nuX1tHuBe1NXfMGY1V4yo/37P2x0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAPaqZvlAD9A3ZH4QRPfMpVk2ShazBXkvhf1jd2DX7oSRDZpZjH2wo3UneCJ/oRfWvfzX1B8ZV/PUjLX3s+8X0YVJpbUEwDNFUHbgK0IZhG0j3dVBb0aTUfR2uPdABKKba8tq7iQ3e4C2XX65zOtMb6pJ9tBGRhmn42G1Qi6HXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuXqbLlg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbg3SUnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuXqbLlg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbg3SUnZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67694whQ2618504
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 09:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CBB0LkAbyS99ycMnXEmjA2Yw
	5k60EnyvQkBRK6doMHQ=; b=KuXqbLlgAPFu7qU5Ma+mOyO3YAtkguXfdT2yXG/i
	O4vjmzD8xsKtQhvw3qfXZYdOBaO0ZbKn853xvZC+DEd99CoI8EzKvFSDfiB60VaN
	eYawluzA6xjI3O9tMVYqS13yPnHTWXcsgD70FNSfAyBrnwMNQqGipxFw2r2rlOl4
	DUhl3s97vY8feuTR9FY64Rh/uOlFjvRx80iuee2TKWtK67w9BUSrNchulhdVzgMQ
	lcQlgwaVrfUAeiq6/Ebb8aDVKII4bPmqtAcx5MC641nWSqAktwSGUyaozNPYBb1w
	W3dIfu6AQ0s1fFAYzzbbwAWyL0fGh2zZYS8iZCy/iz2Z/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkf4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:30:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso21346651cf.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786008632; x=1786613432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CBB0LkAbyS99ycMnXEmjA2Yw5k60EnyvQkBRK6doMHQ=;
        b=bbg3SUnZi01QMBChBvQZld9G3QcNM1mTTdgFj9qAv9YjBGq9RcIg2G43FRfPKokNki
         3+o+UItwPRZ4p63hSOsuprLDzSvUaVS7nSbX3JtHu4j0iXDiX5tkBSJuQupDEPKU+koN
         ahoBpCcF4j/tz1Uv60ZyGKBKNzHiz5waC2fXGrsaIRUEmbheM5ppGM1mj9Gi/r/X1bao
         hOIozBpAAqYriIB8igr9Ly2G3Qkfgjcv9yjbqBEPSyv7ysEr0kTizy6KdVwvvUBPHeEC
         6n4Rbqlo7rftafs1p/5y1xpXXMp7NNl1OgEFj/UWL4jSISOR25TEweGWZVX1F72m6tlu
         N5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008632; x=1786613432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBB0LkAbyS99ycMnXEmjA2Yw5k60EnyvQkBRK6doMHQ=;
        b=OJ1EWGqif8XrGiV3vFvOsm4e4PuOw8duD6X/jb6UzZZonzIf4M+kYt67O6hmjScC7Z
         hdS+uhLRAsL0KeJwH/8CuM/noaFG8fs4MSkdumi/wKYBUqus1AQs67S7ocxRdt4emQw+
         1GwGdYp4W8h7RiEX2cms/8DQM8jLCUR2rRSye8/oU1Q4PGbBlwPpnr33J65O6tgzcj1F
         XhOBf53vlmMd56DJcnZvgSsYs3NQFUL0XigNv2JBmcOTS6JNkKTWuIwYQvjI7/IIireG
         HBHgbENLIDStyNwDulylFLk8e08Qv6Vbk5dOAV66ChOJYOJB57B+oPM9oMZ9t3bd9HDi
         7RDg==
X-Forwarded-Encrypted: i=1; AHgh+RrRbwiCZeYIPrp1fany+3PHfNhbh7ag+kLlLhAwkjwJCen3ABN04o5ySTpqkAR3+a2EXL+m4Nh/kx5a@vger.kernel.org
X-Gm-Message-State: AOJu0YxkW0L410oKeRzgRhtfWa09uHapu7rYxoQoCvJvoO8OrWqiD8f2
	G2SMUSDOM2tJGhiZissrg05lHj9Yu6vSa6AG5cWRkgm7rVVCjkwWtKT3YOGvLMxu492CEqv0aA6
	qKqGUhIQHa5012zQHAMdckEtsbGTy94Hk/15F8Y3wv43vZSkmv9vm78YdM9K/Y+mUhwmJH+HN
X-Gm-Gg: AR+sD12wwsEABJFfhu5vyRoXmAYQrOam2OwjA8N3OmQcwjsPdphVyoNqD9p98UCzHJR
	bxHagb360MLkEC4qWFK5eZV+nO7804eElZnJhcS5SiK5rD66W4S51ErFNoGVve/ZrlHYM9V3uOt
	lSYQVjzLGrP6QMnxw0MhTb1mcFrpPozeGiEp1wKSs/r4q5jCTcjTSEljkNprxEDCH8ONtRd4FyN
	R2gwFIZyY82FrgwlaPmIsMCObDbIg+jBVZCCpFalEMHVFq23l40gFObPbiiMHDRY11ZryS5zzTr
	wTHBfVO9GzlpCnq4FM3iEKm5/0LYsyvBd6VNML5VlfIynx/tEHlYG9CVF75uTBTlSAOMAQNRpYo
	ebaeYVOX7YbGmGJyi+MvetsqW4bXiGPcmR4uW43s/Zc1+a/i2SP3Pg7ykGNppEZ7Go5OKv5WRuo
	BP8pQd8cPiNs8KgQ==
X-Received: by 2002:a05:622a:124d:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52ce61cbc9fmr150684901cf.39.1786008631861;
        Thu, 06 Aug 2026 02:30:31 -0700 (PDT)
X-Received: by 2002:a05:622a:124d:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52ce61cbc9fmr150683791cf.39.1786008631130;
        Thu, 06 Aug 2026 02:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235e88sm609809e87.11.2026.08.06.02.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:30:29 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:30:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] irqchip/qcom-pdc: Add purwa compatible for PDC
 secondary mode
Message-ID: <6yqu2hranp442yqwauvvfa2tbbx7zg2riq4dvwuvzf53ywnjze@u22iowcilcu5>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
 <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a745438 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=b8JVUCK1TJT_bdoyVbAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -3HPafKZQDzeh_2kyJPWYL2K43-J9IeX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MyBTYWx0ZWRfXyw9HSD+vSu+1
 xB1W28iJD7dYlhiRz3RIedpdaIqX6liSpJir3qA8ejCe68gVx6zLhb9v97LRoGN6hi8cEzH7QBH
 2ybSfT403ZCDs/kAZxeDzkTMS9Qd1Nw=
X-Proofpoint-ORIG-GUID: -3HPafKZQDzeh_2kyJPWYL2K43-J9IeX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MyBTYWx0ZWRfXxY3VbOokoBUT
 +bA8xsVWg+lLeyItP+iEyEgWCKLFh8YHuy2CP/yOxyZVqQvtYGl97WSlDX1IU2hAm9x5jrbXHIv
 SXTIK1GCstF3YAPP34IjfIwZMbo/Ar/jPVc3v2n3w3bgE9bafvPhdQ8NTVKKXPN0n0ct2T/mwzf
 ZXwz/AxXFJaVcKBB4y45kv/smp9chXMrhymw0x32BPOII2Z28dVWVuPQXPUI/Ffg/8r7RcffNX4
 pt/YGrlU7zq8m2maFDM7pxybCefcrNwNx1+gaC/Cq4ollnEWvAQBW8zAUj/x7KQWcEc+ywYpY95
 qtjuQ2xkbmxwbqXYDBAgvRt9Do6eR0bcAegL2uLqFfkEr98bJ7HXB+ZsgtN2iVTC5cOgN+CHhxB
 mgwrDdGFZie7FvbuMZs9aZE/Fr/5A/gT+62zDw1wG30i7ZHB5FfPeYnzb67DxZKYMsiodxILQ0s
 nv/DTogqs09hyCAaRRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060073

On Thu, Aug 06, 2026 at 02:26:28PM +0530, Maulik Shah wrote:
> X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
> firmware sets the PDC to secondary mode for X1P42100 too. Add support
> to reset the PDC to pass through mode using qcom_scm_io_writel() similar
> to X1E80100.
> 
> Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
> as X1P42100 have this fixed in silicon.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
