Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F4352C28
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777116231; cv=none; b=lNenEwNMPHqxFqDNvk3lqDKW+jHFUqL36KI5cih6fp6fEz/A84x1/kQy7xrXw5nLEfBlkV4AY34qMZ00077PxPdns6SDOHYHXKOWYqYddMPmzkSLLg5BdVHjp5UFUbDjveM/RqzVL/9UgklNz84oPijIzpYC/b7atrXOjR8Nt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777116231; c=relaxed/simple;
	bh=34c0hEvFTLJTAz90CQGX9s6Hvt09sv0pDHtaKmeta5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gzw0HK4pQDUlVqkPZwUCP4CnSQowbHwdS60SxLghJ7dBW99bJt5/pGQTiw9ue7tnu21KojwnJ3nnELknnaIH59V8VcrFEfhN3dUH0EiQTPNyJoK4dIel15Xm5+/9OXMG5yYOG9H1vbv6+kvzKGHcg//Fst2jRrKPUvMW2hnvKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQMfRPhJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+RdeZny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQMfRPhJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+RdeZny"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3Pkoa2365855
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=; b=BQMfRPhJ6Od33set
	Eg/xsxtIu1Nq+/EPAJqY30KFa79LysRlUM3qSMP/ZqD0OuW3gBZk+TeDTwrwkhBD
	T6IjzSGwyRupreTPxrVeKhtvm5wE/TH6YX1vWk1ezY2iiR9yOlenKCqtQysT8sH/
	7YSLYQgsK1ACgEPuOp9qG7hN0lYzDPJCMwKcTGYHrQSyNUTjKExPXYaazh4x0r8V
	n+MtQgFkfBxGhPuPU0G0ry14QOJ3vDhXZK9RTsvKbKC/9s3sinkRfG+CVGmZSWQ2
	np4BY42cA52P4Y0rUOyxPsD4mabwETf2RzU1+IeMVPCLMY4lqJokY2FVJFTesJf0
	mZON5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw0sjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:23:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so106006591cf.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777116227; x=1777721027; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=;
        b=b+RdeZnyyze++zpnjU0Zs6KE8Cb9QVTMsSkMXM1FtwYvl8U10nt6pVsq2HI0UO8tZk
         nX97+sFW1PY5Vog9xIWO+GR5FD+pL7vu6LkZHElzFxDiOT3YMnH5xYI8BeJ7YHrOABly
         hCep7B/pa3rvAYtGSHcqyhxw7AkmFSodKAOqiCbyV3LYdeQelkEdP7pJlPNvsNFsqBZd
         lbyQ5lmiKWyAj9PIUOCRDanLtbRUzVgSnRFbeXFAOAdiFjuP7xhnzdVAZ0JOyFMmJei3
         PacN/ITRbYwijCtwEduq+9lLxx9s+9+796HGnRVjpVbLSVKO5q/MH2gAOV6YFB0YKWvX
         7Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777116227; x=1777721027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=;
        b=jS6QCueHWlld7f1Y8vZaCRgy4klxsOTP/6Pwjn+DrsVnVhGUFo18JJredBj7S4EdzT
         bQRN4f3aktaSw9TjrEdon/BX+UuqOBtnrCs3toMF7AK1ntWi0WIPS+ZFbg8F2gPgIWru
         VyVA9yA+fncYk2DznKIkXMc7CIcVlHlBwvW/FqwgXJpT9wo6UuglMpX4KD9sKEIjluFn
         vKgiWPp5/0De+cBvjpy4110iwuoNNpI2Nic33WG8A5RbsUZiGawAo6HhFuRIecyVREzW
         KOeHzuVbFdXhyXkHOizWvbJOfZfd8BCOkrh2Z8lOL+M4yJIYh8VH7yNf+u4sE5RCClKZ
         W0oA==
X-Forwarded-Encrypted: i=1; AFNElJ8oDXgPdrmKgLuMkbqzZKFUVa2E1zRu37NX9u6untC1ncFVqtCn6KaSOUtMVLUMpsua5SMb7cn8q4vK@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYK2pmtQUagY36eGVipEnawPuGL3EWkw7r5hB7ZjziNcoFDUx
	Cdz62vxkD75WFOU8GfLECzmzFE4ORR1WBisefw7EKwssCVyfLYf3h4f788jhSiL4mnfvCwYNYAL
	5CSXj0nuZg8UXKwpx/MqAOKv0DiUu0Uw3rKvQF1SFngioCy4/KkN82plO9pXj1XCG
X-Gm-Gg: AeBDies/9lRrd7kqCegUWJynCZKzX21DctDxnKB80TMCLwf7zCGkHX3qgiEBL4UeVw4
	ChVg22mE55cPKBeCFiZ8vzS0kKsJ8MMUyp0eFCJSkgxaSSUdGTS9bX166Abr5sDUTTcpv+d0L29
	PtIgr/U4F5yv0ZN6nQGDjIV1qA6BrexRzDOc0vUjeSfXXY+kTKx54hSA/I/3bnn04pYQnOF9/uz
	1ZoVupLPGfV4eJwjPwEReYpJdbSjADAbAEpnl6fPXBBgp89/0WxzVzjihbpVuwODj5AxgUDyIhx
	WxAqU2qAaCX4+NwBIj72+Gf8pYQWs7moAP0MCNcRTSshJhXFjLhOSOaE80Gd+gJwW00YaXnDmkm
	SSROK/Eysu8oQ8rpNwV5xtxuEnADU0cC5Z8+pvJuhumgiE3+4detLYbUY15ehrNPmcDUdLFeKhQ
	Vqpdr4qrxqP7NO9iPgGeaQ7lZ5JSypc94kLNTVUkZmTlDgsA==
X-Received: by 2002:ac8:5988:0:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-50e367967e3mr442519731cf.32.1777116226876;
        Sat, 25 Apr 2026 04:23:46 -0700 (PDT)
X-Received: by 2002:ac8:5988:0:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-50e367967e3mr442519461cf.32.1777116226424;
        Sat, 25 Apr 2026 04:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41abceab0sm6416323e87.61.2026.04.25.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:23:44 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:23:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Lukas Timmermann <linux@timmermann.space>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung
 LTL101DL02-002 panel
Message-ID: <ughwlscd4iksf45rdxwcoavtzpusslu4afphfp5gr5rrrmdtu5@7eu65pg7hp2p>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
 <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMyBTYWx0ZWRfXzzyPNl/KsAf1
 kdnTUtIvDexrfCdG5lYahXLDODebtDS7utghozXm7caxFVaGJDWfNGbuxtNRkzlj3LRfBRf1JbQ
 C2h1xy0SshHTk99L7PqRiYv0jKQ2Mde87RwGSeKu2BX15yL6Dizu0Ku07nhfdpBHnxPTbAaFj2M
 NifsKH+C49Ub/W1zFffjTpXltjX1PEP0KsFiOu0WSXJvLMAg3C3Tp19tHi0tbMVeLoR/Ftu1FpR
 l6ULIjdBfdCC+gMAmWLmua4/cxr5tVWtqGx1nwSspkzmRZmWn58QQ7z7Y/bU7jGLjZg/416hQR1
 NBjjLsyzRbBLNrDlxC1KBMU/syZU+4yM12ObNnOb8zyYBMVY13zIhfv7k2631nBZ26cDv15o7p9
 IC4WkP/YT+ffijsrDICF/3lVE0Fh9nVEGOtKha8JZxoDcXSoI0dtAQkcroaQyHvuoarjEdevyVm
 e4h4psPMHvuJEkxU6uw==
X-Proofpoint-ORIG-GUID: csKX-8dy-JOTmiFlFJVdFdsnAldzfUxM
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eca443 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bsQV_sbQVq-5e8UBBKAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: csKX-8dy-JOTmiFlFJVdFdsnAldzfUxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250113

On Thu, Apr 23, 2026 at 02:49:53PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 23, 2026 at 2:15 PM Lukas Timmermann <linux@timmermann.space> wrote:
> >
> > From: Alexandre Marquet <tb@a-marquet.fr>
> >
> > Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> > Samsung Manta (Google Nexus 10).
> >
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> 
> Adding new panels like this is discouraged these days. Is there a
> reason you can't use the generic "edp-panel" compatible? I know that
> the exynos5 driver is pretty old, but a quick glance shows that it's
> based on the same analogix-dp core that "rockchip,analogix-dp" is, and
> that seems to have support for aux-bus...

I'd also prefer to NAK this change. If the driver can't cope with the
"edp-panel", the driver must be modified rather than pushing more and
more legacy panel compatibile strings.

-- 
With best wishes
Dmitry
