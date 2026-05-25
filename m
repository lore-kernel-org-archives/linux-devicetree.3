Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D18346A18
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703935; cv=none; b=TX46cpjp7nNH1Xe/ozka7aLjbBeZy5cEh4pwBslX4OrGvfT1MOUUxlCMl2c1B3ZcDSYt5eXt8y+jnpD0+abkvUBLqfTO7EAEUZliPSL3vIoq+U7eWbKbRHBmSqZCHwvhC3oi6ycC/X8KJ3lBg6Kn4e5RFeOJ+7Ko5cvuqk3YjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703935; c=relaxed/simple;
	bh=3sg3hRSFdrfYqCE3ImKh756AK90qi6+lrG58peXytwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5O1jR6Uj/l2dTMP7KuEd6uxJlvGxfjgPb1fDl3egTL7S38L7qqajedpdxS6hvI78FUH3pHUQdUXTbMgK4ObpIW4MeAJG6j4sjNE5qUDo4vhtP25JC3krl5ihVfUL8GNE0u3i2k+ciYTYla0UHwwcWWrqTYME6E8d8EJkOocmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cO8llDLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrJGbLlQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cO8llDLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrJGbLlQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Q2lZ3019604
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uwUCKvWUz9UKRblR2yyK+gmY
	yUtgsWhpLq6L4tfKyJM=; b=cO8llDLOwJG6kCq6ALAO3AWp60Q3Fn/zM+J0KPKI
	/p+6yMwxOmwy1/wdDoeRBTPMvlOWlcR8Mzh2m9AHX9GakIEr9lQvzuPTpzgcKIzu
	aVhmu628ASoD31XMJ7iS2yy5hXtr6GtJtTih2v6pkf0GlLpVUu/P2x2zwyRrFSyf
	31ywwyhrvR2pGFm2nws8Vzpwusgjci6vf18Rs0OaTh9z0jL7HJJYlrFzcnGm2TTM
	21Q1TOFGby73S/am8enV8104gW1l5+dW51Hm9/wy/EETOnSrukN5xfb7MYyfTXjm
	2Cug3lsM6TCkcYwWz2pfre64SifoHEc2HEGwxhWgnhEuIg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6c7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:12:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575242b4308so4460875e0c.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703932; x=1780308732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwUCKvWUz9UKRblR2yyK+gmYyUtgsWhpLq6L4tfKyJM=;
        b=LrJGbLlQGL8UNZaG4tpfJkdANCBxDiWG1MwlGxg2cJfW4Xp2b0mEHHW9zZt7EYFWXP
         FuWcq8xgV11jDCeaSbH07AI79Eske8fJecZiPeGAiKqh+eJSUZTpG7i9zkzx23JCvGsT
         7sT0yfsNfzS950VxS5FErbMAh5ExoeXhw+4ErLU/tS4374rSOUzag2M2wa2nK2QnWSom
         +SMkuS0T2VirvACJ/ejrno55KptDirPHFZPE0c7xhqZnHQzV627aPKT7NxiApya8Lzdx
         j8U/oxS1VL/pWjQYUrGV0knrWyMgNwm02iFufbOACKuo3UBVDNVz9mATX0cB0JmOPgcM
         27Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703932; x=1780308732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwUCKvWUz9UKRblR2yyK+gmYyUtgsWhpLq6L4tfKyJM=;
        b=DZ0jMRczNv2NAwZsBD+F/wAnyXoGfwPPfPJuHSrYioPFdEWzgFDaQwawz712OMY0Ns
         Y99PiwyRagxem/WfkI8kN1gswmHZ8EFhAFgRTBjY6cOV8wBfxAPk7D4591lrD2blfgkF
         Hal6ms1Ji3Zw9gK3KbZqoSdMMdKnjFgr68f57Iysq7uc18uXVnjIfgLYE06xD0J25xnw
         QjaCo8xFrm4nCTUhKPKsmqvUPHmEA60uZGeEh/OGE84Go3kOw6UCxjDkCsmx8H1RfxQs
         M4sc8cB9Ea2MEptYEk52y1ye1eKzziUbLAU2h1RyLrJNN/t5SOuOZrkM4xdpXmleR+8J
         0/Xw==
X-Forwarded-Encrypted: i=1; AFNElJ+Kwo+BvOfeogPZhVhrJWvTGb/oKZI/J/HsHOPtroe8kPHS+/oz43TQ9hiF/I2Rj41uZXFyhJXF2qoB@vger.kernel.org
X-Gm-Message-State: AOJu0YwbgNUWf8Zm0GcIlMYm3yfLtDVmbstCeqJkKgLnLUbc4dMEMXa1
	SCaSmwn4cJxxAjrezkMT7mt4IokXkZqBcgL9DFWvHxVdsddblujdgtZsatKuQroE1G5F3IK3K0f
	2HIZEpXTJsrGr0XSIDX0WgqytwMrm2z2el+VTnXpPQwm8xjXr3l+rKethG1TYtCMS
X-Gm-Gg: Acq92OFwCcIji2+8ppFT6sxVbjJ0vE2YKOvYu3lzdbZ9smiIxkRkKbJZmd6NMyIFO+r
	FkE3tpcC7Kug6BvWJPltUxNFPHoCQApzzSod1uCMAG9Kmi3JMvsiUdO6ZdJx6RiUAB3XTJZKSLp
	NyLitFLVR1fKDOTWudRtWlAAAm7kQkpR5NycBgBz8DRGhJH3NMDXQH3eALYFURSU5G/RO2i+pM1
	46PF4N2t5/i/PxGwXZLI2A73ddjPq2w3txVLhjX63fIUM8nJ3p9dCWw2Z458VYSlhMtBKmx3t05
	ez4AweiCZ0TEpEQGNlaUSShrmAQn5tp+RXY5Ou478DXBRW9Y68mdf3IELyYo7xFbIBfCutqsenk
	Sz6IVt16FgsN0reCGY3quQjDAgbrwW828/upI5OTqFvAt5Qs9ijkkpSXJMASC06+zeZvuNDEVOV
	mWIDgX8RQ6ec05hmUTqu45GonSHkca+I3jdd3cT6muf+bwtg==
X-Received: by 2002:a05:6102:d90:b0:631:d3e4:efc9 with SMTP id ada2fe7eead31-67c8bd35beemr6714638137.27.1779703931779;
        Mon, 25 May 2026 03:12:11 -0700 (PDT)
X-Received: by 2002:a05:6102:d90:b0:631:d3e4:efc9 with SMTP id ada2fe7eead31-67c8bd35beemr6714624137.27.1779703931381;
        Mon, 25 May 2026 03:12:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cbaaf2sm2606780e87.33.2026.05.25.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:12:10 -0700 (PDT)
Date: Mon, 25 May 2026 13:12:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: Add EPSS L3 scaling support for
 Shikra SoC
Message-ID: <ld3bxsk4brqehwzxxpjuxwdego2bs6g3p3h35b5i352hbeu3zk@4wyckysck7r4>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
X-Proofpoint-GUID: 7--p8PwP2nQPrnp6HI0D9qb28f1nzGk1
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a14207c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=AL6Zp-OlWJ-5pd4xuMwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 7--p8PwP2nQPrnp6HI0D9qb28f1nzGk1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwNCBTYWx0ZWRfXwoizK0F2yIHd
 BhmAoFZzjtLDtfDUulLOsrl9XjJZRkU2knuPCLbbfnT0xK/MdpGtFqmq8ZmvdQrjk3recfYcBRc
 CGO0MPstc4tTWXGpsiLcQS4pmr1+sC83a1exaxCz5j8dR71sR/Iaq4HKF9hoC7ekcjVqm1N+Tv8
 kimAPx8nXduth21qBkaXyzSROrVG3S69kzfU+qNIb+oO07dEwkbprLEB54n8vfUIMOiuyhZ+MEY
 sOKD+kq+KgRFKwt2QTF6irQU6hOnkZGuZCJyO+5yih+AqoCRe33G9lPxMRKQ0Sefq7SyUf8AJWu
 R0wpsmAXj4FgjGrmr3xzy6Wxge2P1VFZXR+er1DNjF2AO//FOXUvHXYX05A7F5ggU234PH5PzQF
 /o2HWsbGQTnjs30Srkb1VT+S0VbD0vtmvy4zvNOFEJ4cZI9azaFAD3JGly6vgguXmPeOT81JB6I
 PDGFwmRmjcoh0/zqXPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250104

On Sun, May 24, 2026 at 06:03:36PM +0000, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
> Qualcomm Shikra SoC.
> 
> The EPSS L3 block on Shikra SoC is similar to existing Qualcomm EPSS/OSM
> L3 providers, but supports only up to 12 frequency lookup table entries.
> Reading beyond the supported LUT entries can expose incorrect frequencies.
> Add shikra-specific EPSS descriptor shikra_epss_l3_perf_state that reuses
> existing EPSS configuration with appropriate LUT entries limit.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/osm-l3.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
