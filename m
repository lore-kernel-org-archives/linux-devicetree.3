Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E42B443A81
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675559; cv=none; b=ghtG7ivdnPyONPcGc/CY6ekEJfL/KZPOxhrnqUsQzGR6KY0Pt53uGiGA4UJHJ66+rlHYGgtKNosiI+dWN3V3WChLcRJXCaJfQvEn9XDc+KMrS7vueprnq8C1aJTjcLilRRnKS1xy21uc2TFXlW6FaFE7qKB9Oj+tu+8k2mo17Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675559; c=relaxed/simple;
	bh=E1xUp544mD8hGvP00uo8LYF6vpui1oe6A/h2MQI3tcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkoUL637aAB1fLfyOgU+6hQNQDyTvNAnoyoLKzp/Qh+RWwGOUcC+vyPXVS+89OfojM6CcJelC/i+9jw/OBJWM9FGW/tepr5wGkWUznV9I+WwGhiodywyaadfFtQp03Z6htmSwgCqmBsQgT7Pxp8mlMsntkv7H/rCXP4K5k7jGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyjhpNuQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0y4p1tv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyjhpNuQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0y4p1tv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZoCI3172023
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=; b=TyjhpNuQp9BpmM/V
	hfQs5MsNOrBW1VnKtfA0geUyje2hqOzgCxZOTVB14J8kQp2pNW0lnHztMhjd0miZ
	WUV0rQLcB2+sOlmqMFqUgOlXTKVtdWO+28SbCedt24QqSUtxq+Y9zQclgnwh+/Lk
	ZTysoWbUNMJpkiV4aMXq+5a8NYnx6S4vk+8blIndxvy9Lr/NnADPPRIPPewNHLCf
	0+EWoShyXWhhCpCCuXE1h2QYuCVcZvJ6ugfBE2ofp/zGdYVNY2/d97wstKGHK8+k
	COMstR8LkOw7eaBhk8wgzgfabf788U2GzvuUEYubL0TlKoVPzntmaILtLebPUmDJ
	YH/4lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsahha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:12:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so323897111cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675554; x=1785280354; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=;
        b=W0y4p1tvCdLiHlMpOtF94Vz1djN9Y1oR2/mN3vg4fcikGpKe7/tYtBmSFuwWpyKlF4
         TxdEMhjEJ7Ft5XU9T2JWBL8FH9OSiHvYUvJ3dXSqmn26t2uYsHgWpGx4H2ZUysAnu1Na
         sZL4DJ072NvragGKitHMK/yJkxxTxIZYR0fJT3u3rGpvRLblitsVh3MlH5mWsKyr5Yzu
         ZfNkizEcflsevv4A52316G8Tpn7sJrNm7CUdPQjv+6m84b+0uQsIi/w7Qv0h9BllLO/C
         HfX40TWQX25wASW1Z0C1Yj6hhUnOBFeoqczUXZxPbahNVmUyyT+LUEdoAKMdx9sB5pS4
         qMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675554; x=1785280354;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=;
        b=IpmMh4SzhbMMV9UYBvJu3I3l64Wn/W6B6YZkqHph3nkTnSK/o9nPhlPvW5uFchzCy/
         cD2e9goOSHWkyS1473PtbrkaM7Ev/wt1aogMxvt4kv7H3J3Ig70XvQDM5C3o8RkfhHpy
         L3BV4fLaRYm7T+07nXF5hmpv7ovYuP4jSlGhjkuUvWkUZQrmDCYXKJQHsPtrOf2CvDk2
         ELAfXa1JmIkPSJdBLsks0NzO/ttdogjESltMmCIGi6srwDfHhg4i1By1KeVkwxIoa827
         8cDGIqa2WIlN1sYXAY4WCLgKRQfv7II9v2QIIx/dL4z8daORZB7pEgagLUXemGXBkNs6
         VzsA==
X-Forwarded-Encrypted: i=1; AHgh+Rro6+MZhjLlBxKQ2JRPtjV+KLpkKoivz08t/QkdlPVJq+KG7VEuW6lqcmEB/W/EA6uMaZAhMN1D8tI9@vger.kernel.org
X-Gm-Message-State: AOJu0YzzozoKe54niOybiTO8C6QT2Z4ECpFCYK+rxKBX18gqp7p+ixe7
	8xp0pazlsAYTceBUSgONco48pm8cQHWx6T9nD6ADQ5v26Ccdzfi1kFKt75H4BR8esPTcyv+usvS
	lbcCaSc++rDTL+HDkDkjvWz5MGM6TadQOcl65eWu7TCqdEO9KJJ2p6TYlNIS6ht3w
X-Gm-Gg: AfdE7ckIukAltqkfeBcjvyf4m6G3pp48ZE30ZFfV2qLadUuLIaw8neXbMrCPp/qffI3
	VLXCDj3ZY6QO6qZ5JGgmjcEmYJw6EOA0Is7YhymUh75JjA0oIIbjvFFCJn/D5l14vA89IirmXtL
	urUsDZuWj3UiYNX2IhFh6mBOk+KQWuG0LkJJld5x7z4qtIxSFegiC74uMnebExt/4V4AYXb1B4k
	8VF+xW3is9TAlAz/UFMLYvOKMZ1NNY8bw7hp6WTQVmvfpuy60w9h/EbxCuNsGf8NXWbkOgAvooy
	dIisXY5DdTIaDhd9/D+jJcHxEhJua6AZugIGjxMtwdcDkv0pV2qcxfUclXu8JhlziC3aogHXgJw
	7cGnl2pUQQsxQcB6ukwBQPjU8KtNBkq4s2yR1xNWkPpDmNeNZUNc5d+GhZ2dPv+pMMrnCtFnsIo
	Ix4pFGNFyJkiu4Lg==
X-Received: by 2002:a05:622a:1e0d:b0:51c:7b11:41a8 with SMTP id d75a77b69052e-5213f959c7amr204206021cf.85.1784675554628;
        Tue, 21 Jul 2026 16:12:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0d:b0:51c:7b11:41a8 with SMTP id d75a77b69052e-5213f959c7amr204205581cf.85.1784675554256;
        Tue, 21 Jul 2026 16:12:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bafdf5sm155867e87.35.2026.07.21.16.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:12:32 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
Message-ID: <wskpf27kmooybswypyzt2vcadh347rfzrd5mpjwrczjlxnsczb@hjlaoqbscupy>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U-nIvV0r-sg4M6E8oFhfNKaLqoMhpdND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX94EXI1N6kNCY
 AHaRM1qGLlOLq+AKhAiG9wnj6bc8r7yTs6tGsBWvXwpOs7VKSb+XKANek4YQDyg25T24n4ip9Wn
 OrI5BUC7LUO0Bbq52bWecmA17eKUtKmz5iBXuonT2A+1izZ6hI+x5STeoBuCdQeuYO6HN53ZbI9
 jHS3YzGdZx3/wGFX0aN/mhbGaPC7NDWKnnS4K9vGKimDAdJ4hIKRvppL2vOtt7u7w+qD8cZBjn7
 08V1ZWAuBsKjbcx7csN3NIL5dI+VmYiOcZZiwialxrWtynfVMuuoRiGSjUoJcEO2u78MZCO45zW
 CXR8iykvWfFpHvYX22qJfzw3a7A1/nibpbxy99N1f0/Efo80Udq5TT1ODQwr50Rohfb6hn+s975
 7LB/xOyiCR7dBcomCGeIQclvzFp/q5gcmQDNDa5kBxq2xqEEKfV92ppZEEN5HsGY7s7c5OU7dJd
 DT6Z5Uglw9MizbaJluA==
X-Proofpoint-GUID: U-nIvV0r-sg4M6E8oFhfNKaLqoMhpdND
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX9A6dTXf4Veh8
 GjaFBQ8ZmoahbKpqAnOY3XiKiBZYqujNKZ5fWe2P9zCRmFkow/bGEMBXjGXyUS6V3okYR+jVXHD
 7i1hcVLS6LPjn3UNjQgVVLqy3phD/fc=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5ffce3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:04AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
