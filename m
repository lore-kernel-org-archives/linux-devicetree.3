Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DA2F12AE
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210080; cv=none; b=RHwKH/I4BYfASaQY9Wbb068IggvobroRUjr9qTYNsNZL9iAVSrpb6q5JMHFuvw2fH40eekUoDOOVU34XDxaeRwRrCxydTMUl3LQ2LbKe8eIFPdLBqBTUjM5QGxsoemogQhOuzeYNd4N39mEXX/QQjsGRDB8QRVZbdj3CVgV5D1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210080; c=relaxed/simple;
	bh=TIdPufXGdElKKnuHJAx+uoz8CFWSUSnL3a9cM2RTenE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMFX7wdC9NsrQ2Wo15UHQ7UnkKQp4KttrVL15YaE+G62CdTP4+wvaG8ppME0vDAVV6j5X20V8GI+FsnAriTH2xlCelIid08t2p3xZksc/gH+NmOhSlH1OqsP2Hv4G1uk4ZaND7KW591SpTjF/BHDXoZ6oAMrNgO1bGZj5feJPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sgz85z5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aypbt/av; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sgz85z5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aypbt/av"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJERXN1401136
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GRM+mxmakpC7NoTjq1FhUVVt
	icKlB4ODWObaEuOgJvY=; b=Sgz85z5LwU/4hN9dsMBpi2gliJxiIpqUn4joeGpe
	7kV72iMrCYhjXl8iyv73iDinhN6vKuatjnNGka+5wN+lPXIHmiO3ssYcTYBZAVPm
	AJlNsqjxgl9/kU6kx4IAeMBcNtRn7t3X0Zvp/Fw/hPSbfZiewTogqFHklB+BFJMk
	atwfmeY4Ze9KMS/Y3Fcgv7tmJY0PrJk30pkVvxR9nQMZhmtK8ufPxk0WIK6kQo0U
	zdQRNLvcd4vbG+PKDSUwyqaUHwmMMwk1maYIEhh3sv5no8DZYsbxh3/uZr0UYc4e
	gzB3cHu29AxzMT+b5clTaJ4jwTrZUhpIryaVYZN+Va6OyQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g89rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:34:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-71b5daaf011so76169137.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781210077; x=1781814877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRM+mxmakpC7NoTjq1FhUVVticKlB4ODWObaEuOgJvY=;
        b=Aypbt/aveLSJzXoz39pq/qs0dYwJfu8XC8pe0M8i8tWVG6QyuaLIDr2fQYQp3Y6MxE
         G2R6FYUgAeQak9wfiffIk5bivynocPqEJmxsNY6muEnEruZQWRjKfmD5ElTbZDuiiPnY
         h6Jk2C9cdmEhUVkheXqSqg+rGsEBIlrHzJUB4I1fxOw+qSeERwB3l55veliYEL9slwpX
         HXaYFOHlwD1SrE7ZZb8j8b2dHFQefRvTaNWUHdPYPPiyNLnBqQkeEaiuQ54F82gGx3n5
         7T8lEVgbO4fQFNlEZqKPfGDcR1bK1y1Rgyu20r5ptHwspS7QgXJvXTvGaJlIqB+Sr5vr
         apag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781210077; x=1781814877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRM+mxmakpC7NoTjq1FhUVVticKlB4ODWObaEuOgJvY=;
        b=RSah6IP3WVUy/qGN7AnpP9t/jBfr97mx66R5CaYyF+RzyzfLoLdnPwVM0cDkRGRb/M
         GnLqf4f7BH0gXLY8oMRQ/gJ3G6c/ak5tCTedW2Dn/67BxeQOVQxezjuVpEeo0frNqBry
         jrk+eMpH72XFkmvqJBg4S8CXcG62TysFpYTAwKIviHLsrYvpZQZLbTYuSgQUz3DLDlM0
         Wo2ioT4U5B1zqqBR4J4vAi86IGpW5UZfMpqp/dHmvy6yfbgJ2XwmmabQ6aLWc80q4ABN
         kH8aqIbNdQCs+ipzp1SUth1BwxWUftBxzfgbE/FJuqGsiZ+DbvO++BX78Q0bSrLg5QOx
         NnYg==
X-Forwarded-Encrypted: i=1; AFNElJ8F07CU2Xv58VUX1Iq+MAdzPLYmCfE46bFnaJYeU1SPyKFfL0cNM0oM2Q11baTLykiJmgK4r27SjD8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwLG+jI1RHxz5/vE4JvB1LRJoczDkDRotWyYq1S2vfHbr4GbtHl
	4F6uPO4NJ43r0XYjPDwTTNVnWn1FFHDQEXOhWcZBKTNJQVKHyEySDyxjVHIouHwqwHMtn9G/0RJ
	5n1qjb/FzY1s4piGHlwp+2TAW6Uktx+ZM2kBSfUS4bs7M/TMA7lz/FGCHsme+r5cj
X-Gm-Gg: Acq92OFLVvM6STIMM8mJatfcd8MfzgTpoS+kkFTSphzVf9D9L0ybkSf1glLlpuwCHPM
	6ZqqzJzk7AT0XyfymwoJocCTWXgY77DKK9WIrLJh6H521NAWKlwWGCzXH3w9vLrG+ilqMC92Hi3
	y4eIWv5GawopIX2QJDvxjOE0AMRxCO9NGAVotAFHYuIhZOSKCnjyc9OX2xcZhxEg/feKsWaTDfm
	boPn+xEB+1N7NREewilK2EaQZ613u9z7s3jx0rzC1s0QdqPD0XtUd98roK0zTDisdx4Q+BQDFE4
	GQCP/nLPN2aDEJP1KtaUOqHhkuuCqVCTDqCpNrmUhx3TNBwzC+j1yH+dsCvCnTYOzVQ2TTP+QCn
	OdnOgOZw8P8W/X+4xve3aUcqg5OzLuFyPN1/ye7icuhPe8kig/oDC4CUfcCYkLalOpkySULVinx
	+FSpsE7tkKWQk2YofSFJb/sBECrtPpjyYGEp8=
X-Received: by 2002:a05:6102:5e93:b0:607:4fde:1921 with SMTP id ada2fe7eead31-71d5f4c9e9cmr3251260137.24.1781210077293;
        Thu, 11 Jun 2026 13:34:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5e93:b0:607:4fde:1921 with SMTP id ada2fe7eead31-71d5f4c9e9cmr3251239137.24.1781210076870;
        Thu, 11 Jun 2026 13:34:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd8d6c3sm124092e87.59.2026.06.11.13.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:34:33 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:34:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
Message-ID: <l2f6cuhsq6y2grrufyaki5iijk3lpbjlig4sdispo4yxsmckcv@iyb5jwdfph5w>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
 <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
 <cb244225-5375-4925-8d20-232cae9da672@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb244225-5375-4925-8d20-232cae9da672@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfX7+lZzd/O8aTo
 reRaa4aZ/YBKEGT+fI84rRr+daVsOssau5eGPnmKiKMCc968NCsU57rer8SrxuW4PnOnxpkxCRk
 7gM/XIYkt1orApg1ExnOlaQh+3T4ge4=
X-Proofpoint-GUID: B5zQEia8xIx-LFGKopL3Gfv8KIK5z0QC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfX/sC3Txcu6aPe
 5zE2Bo/yL4z17Rrk2YxTwnTDGvi7rA+15dHiFvVm5nM22WbzeSLyYRBJ3bYAFNMtBpvBuexdVoh
 PIdMn0Lz4dC4ODuIIX6i2TdS/uGCgYgk9qeEfhyuwJ4MjGdxjO1OqkShTGICABY4S73wvmtYL5I
 mbgFtFFurEIGuJEU1vpQxe5eqGgztuxEMIiqW1Q+DA1jkxTkWjsR6QQjUwJeY3iGKoVtb8mUO93
 w9Wa9QsuXOULhODXA8oRdgGkcb7KLgK4hj+Hr+c8sgftiWfWJnVlo53EAhFTTjzoaek2NOIvJDC
 w9qULg6Nq9LF1T9V160Sg9zdBp2t5SOpJ9yddBn0quiy2yAMZ+NhHWGXUMccwu33FCh1gMhhc+S
 lvwNgNVzrK9zXfxUjOZOGqTxeooBvDWR2ftY5VGyFJC0XREF+jOuRY3XVpdOTV4lg9y1zw8xj5v
 B5yUXh3LBteFAVtglDw==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2b1bdd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wIx81Qcb-Uf8PA-ulogA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: B5zQEia8xIx-LFGKopL3Gfv8KIK5z0QC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110206

On Thu, Jun 11, 2026 at 10:15:30AM +0530, Gaurav Kohli wrote:
> 
> 
> On 6/9/2026 5:33 PM, Konrad Dybcio wrote:
> > On 6/9/26 12:22 PM, Gaurav Kohli wrote:
> > > Add support for Thermal Mitigation Devices (TMDs) to enable
> > > thermal throttling of remote processors through QMI.
> > > 
> > > This enables the thermal framework to request mitigation when remote
> > > subsystems (modem, CDSP) contribute to thermal issues.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > There's no other signs of Daniel in this patch, please fix the
> > tags chain
> > 
> > [...]
> > 
> 
> > > +		return 0;
> > > +
> > > +	/* Get the TMD names array */
> > > +	num_tmds = of_property_count_strings(np, "tmd-names");
> > 
> > Is this something we can stuff into platform_data for a given rproc on a
> > given SoC (for which we already store *some* data in the PAS driver)?
> > 
> 
> Without tmd-names in DT, it is unclear which index corresponds to which
> binding. With #cooling-cells, tmd-names in DT provides an explicit
> name-to-index mapping. Please suggest.

Could you please explain, what are those thermal mitigations responsible
for? The series applies the same limitations to both mechanisms used on
kodiak for the modem. Is it always the case? If so, do we need to
handled them separately at all? Can't we apply the same limits to all
TMD resources provided by the DSP?

-- 
With best wishes
Dmitry
