Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6139A070
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751165; cv=none; b=FLqkR1/Uhh75h5OWnWJhVlnSM9EL1DdV3eGLJLqmRmQfcfFzn3h9sdYNPI4cbYXkQxEUF7/V270FPkVoiIzht1gY8iRAA/MZFE1fYnWyanOAU1X/L9EWzxDfIy17w9GRmmBfAJzMhBGD35hPqAqZUAQNt+0TNrsaJJjFZzz7LDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751165; c=relaxed/simple;
	bh=vUXL+gSTGk0bjQabPzJIxoQjd2afwEJeYM5tLuE/9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ursfw1D/S7uzjwVfU/WccFleAeDKu+SsUKQcAqdAbSoPufOwi11Qse8gCJHAfyMsQ//GQetnC6eM/4jeoX7VrbBYLFa0fmeYRBbxTjqCcAqpnCp1nIu+ZSz6qwFxdz4PLkHb0S1YuHnqcK1Fqkfs/e3gmFFOmxGHRo23fSH/Gec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/5K5xkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbqcRQuV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/5K5xkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbqcRQuV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9HRwA2524633
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GPeG+kh6X4YCA8qVpC5/KWg/cw4Vi+/YrqYdgXB2/8=; b=B/5K5xkn76DyLvd+
	mHNg2Mo1LVopdvtgwb14CfXwUxEvmwJjw3hJoBqQW9jg3RY2h5nnLeWMxFI+50zt
	bg5IiywvyPdO11oLj38IQoYWCGRyoWRctb4/dRGUbfR2Qt2ZFawOZcz4jacYhaBv
	m2bKuyWccpEU6r4DLBI1OWsjINc7YWVADr0j7sw1QdUcxBbDRqaS/wz/BG8AXqZV
	lkPUQNsViwVXEuiQUfzqfnasaBCGMsSEjcg2insvuR5HVcsIViYw71a0du6ef3wI
	qw7iWV+maD8pW4kNLk6LpzpkCdBJvnAkVDl/FDoLPUsGxfl04DV4t7346UiXcjv1
	4hO+xw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjk9nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:32:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf575af4so176649571cf.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778751161; x=1779355961; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GPeG+kh6X4YCA8qVpC5/KWg/cw4Vi+/YrqYdgXB2/8=;
        b=cbqcRQuVPvqjrnQ6/aOZmD5urvrILD2kx0Ex0s1DDEukJRPy6tIo71akbmRwPKwr/h
         psUs1EHfxtvhvrF/vMzm9nIFEEqUXIuJWhQBuchOGo8/xQt5qdMr5JcNFz2wvWUKeXDx
         H/7PkojrXrdiqLA9+4LfcLNj7JlTA37dk0kn9diC0I3tQ0amqFprWkT/2JiR9XOl+j2d
         ene5tqLi6wjZMYh22l5DZEvISBBLBIN5nYQui0uQBrpuejfp4BF9jZZQ+GNkNH8c6zF5
         h7MVjSrTlTmVJvSIhpxsRy/8U6TtW3bvm745VO0uDFKYAoPFzs4/nEaeJdUdM99olcgE
         vkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751161; x=1779355961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GPeG+kh6X4YCA8qVpC5/KWg/cw4Vi+/YrqYdgXB2/8=;
        b=HA+Kil+QJweUjXbs+57eNSLy+zw4G67a6UufBLZOtndzkIxtfGx3c4WHQXHMr3lzRZ
         jkvDikhB3Kdhx0Vr+VHtlHMn+pH2TL+ycK3LftHmwbwVe4Ypun+kKXVlvPqk6bQtxGy4
         2k+6PLa4C1ObskIs4nvcfb8/yugH/ZcK/hsoW7KFWNUcGm0vfYltw7WWdo2Hrfhy5u6F
         f5CZXmFeVGe53TYpklI8U2Zk9EtO7dLJnlPjjyygAaDN4IddZ9KQwlynwUEJ9sCbiAW1
         iXU3+7e303CLs99zg6dRBJbE0wTgmB9Ko8HCIYfKmhyp5MjvNZXlF9NL9xh+twBdTvSu
         wLEw==
X-Forwarded-Encrypted: i=1; AFNElJ88LgI9XezyNN+sOQHTEQfphLnBkRYZK2mGpq4XjfAsL0GCQYdwnM6xSMCX+FjrRJL5cjJJ053STVl3@vger.kernel.org
X-Gm-Message-State: AOJu0YzMyrjcl0/cIlW/xADcW+BDbYRn2Admj8hA5E82p/mz2bYaYT8M
	rOw6wG109UAOO9STNlyLwcvAXYN9kL+5RfJVJAVXr3ja7HRxZe92Bcd/quiEtdk6A/LIihXndMN
	2s4UEp0H1BnBoNLW2G/LuoB+Nqa91GZkKo3hANfnDECA/kewaOtFU87bWOFeuD/4H
X-Gm-Gg: Acq92OFDK4z2Kw0QF7W9euoinNIq1SJfr4TsrcHZsaoh5oa3f5190eA2CKUw1sHVtda
	bb8/Bd9vPLvVbg94jlZ0iFv30Pd5uTVzqj78Xh0kl8gQ3J/t7CbjISWbGAeVd9JWYNIjMUxjm7m
	9cfxYDVnAAYeut5gxfvWkUb9g4qyEVBe1hDrO+aKNBwC77dtJPszqRU2OjgxR9AlYlLgjhs3WJv
	NhWyuMLHQ4thVTsnqRoKQyv+uf09VdM7jl0A7UzgdOmVK+/7Tc6WusoNQ7r7jDKFeg76l/v83Zb
	5tO13NHDQzmiJt7i/We9Du01owNaCcH16tWDdiVSzU/rzQ/QgjXqcrFbhgZELfmxb141VaQl8qO
	gjrPPlS0z6VnZkAp9AicS9nMCjUfLa+rPkBAJQvpO6iUd3TzCmHQNQTprlaRujR4AHnPhXgMAp7
	BLiBzsFoyuqCgfouRQdYOdJXvZyGTEwWLy5/U=
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr90184171cf.48.1778751160713;
        Thu, 14 May 2026 02:32:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr90183821cf.48.1778751160269;
        Thu, 14 May 2026 02:32:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c84dsm360258e87.10.2026.05.14.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:39 -0700 (PDT)
Date: Thu, 14 May 2026 12:32:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Message-ID: <xr57rqikcxgrrlj7or42r5frwhvvateeryfnqz7q4wkhfxffzr@intm5itd3ue6>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
 <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
 <d2025522-ac5c-4e45-8274-1cbb49b7b348@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2025522-ac5c-4e45-8274-1cbb49b7b348@oss.qualcomm.com>
X-Proofpoint-GUID: t_MFZnljiKi2t7xfvOQSZzUdA-0uDCLw
X-Proofpoint-ORIG-GUID: t_MFZnljiKi2t7xfvOQSZzUdA-0uDCLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5NCBTYWx0ZWRfXxO5DPgYK9/b0
 T7srom2zc5yS0WLmGOI1bMq8OtknzDwoMYpbo15eOuioOCgz7L0FYSRJdzxTxAO4YX+zTuK+ncs
 3gCxa+jaZLGtADGlje4KPSoAlj+B2gnHBe4GGY6TQzqgy4RFIbVPF/U9FwnnfnjnbnT7ZpELqJW
 4kA4DmjBsLFs9IgY+Xa8R5UQdR5HMvzWz+Hd3kcqKQn5cd52iOSt2cop95x4zBMQcNhe6lnWs5v
 Ba8Gtb2UG1UkU0UXdUHhB3AXOZYS/jvFj5sbW+ilzyt8/vFyI9qrEwzP6xJQKCHjjqicb2Jw9/x
 ckI74MzSz0g8lI/dERigmNO3z155Lu3X7mxDSxXhmfjzHnN9Bu5jlIftondck2Kul2QmzsLQieD
 kv/ValbWjHDXJvpKSwryI9BbPrrud2JU0zqAKSAU0Qw+sGMtP7RxFh3Nh1d0KcVedz7NFi0fPUd
 CMLa7T1lAS7QlDW40UQ==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a0596b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mw0au1tfmEV1MrrCrTAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140094

On Thu, May 14, 2026 at 11:23:39AM +0200, Konrad Dybcio wrote:
> On 5/14/26 11:16 AM, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 02:15:12PM +0530, Rakesh Kota wrote:
> >> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
> >>> On 4/29/26 4:09 PM, Rakesh Kota wrote:
> >>>> Add RPM Power Domains support for the Shikra platform.
> >>>>
> >>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
> >>>>  1 file changed, 16 insertions(+)
> >>>>
> >>>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> >>>> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
> >>>> --- a/drivers/pmdomain/qcom/rpmpd.c
> >>>> +++ b/drivers/pmdomain/qcom/rpmpd.c
> >>>> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
> >>>>  	.max_state = RPM_SMD_LEVEL_TURBO,
> >>>>  };
> >>>>  
> >>>> +static struct rpmpd *shikra_rpmpds[] = {
> >>>> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
> >>>> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
> >>>> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
> >>>> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
> >>>> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
> >>>> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
> >>>> +};
> >>>
> >>> This is identical to sm6125_rpmpds. If you're sure the list is correct
> >>> and complete (no LPI domains etc.), you can drop this patch, and proceed
> >>> with just this change:
> >>>
> >> There is one difference — the max_state for Shikra is
> >> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 
> > 
> > It's handled in the DT. As such, programming model and the domain list
> > looks the same and compatible.
> 
> Yes/no, this is an upper bound
> 
> one improvement we could still make to this patch is not to define
> shikra_rpmpds[], but refer to the existing sm6125 one

SGTM

-- 
With best wishes
Dmitry
