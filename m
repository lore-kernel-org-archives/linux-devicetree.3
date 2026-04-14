Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083F2874FB
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189951; cv=none; b=gIAoLYDtrx5o0FQjy+T03xUtKQ3OdTudn8TRVi8pE2q5+68Jn5dznHVJ3t4u6y+FiVwcrQIZrsrOgax7yhW6TJznIvLYirXwRzv7ojy83mBc6Fw0IsmCPGZy30B69zjzBHpFS1e++n7oAdOnjI6Sv/IqIXphoPZ35s4lttjfRkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189951; c=relaxed/simple;
	bh=bf+IjV06ReV1dDFWFZlv1VRjyhuRCC1wGSrHyy9iGRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUjFjW0V3xvFl8XcEwzwMYG3KhdJ58/Q1N30BVcrJuJdv3aR9R4PzTfp2Jr3pcv8gbHkCNHYEibeoNNzROMMomP0a5yigN7PCUhRCpE4Zh+UMs2TRhkAgKziB7ccXZyyVS7j1xS6BUrPBV+mshVM6NgtVt5fUN1KjnfrmUobg1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4ibd+mY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAR+m4NC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4ibd+mY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAR+m4NC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHvoSr3059023
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OhqR9vG8Ni4aOgZIumqEuvhz
	5RlcPtP1kdti8y6DfmU=; b=Y4ibd+mYZ9Qa+tNlmu4HM9/+XdXNR3+RfJArR0RJ
	COyWkUgXTuaZesGKU/frNzKpUFSq2tQWlhy55Ed/FGQCEzs9vxd3BqM5951xMPkq
	+/5yZLwRps4phBE55PYSsdDsHao+e5c2iPT1nrmv53xrdjCjuYzPLA37/fdZdByv
	b9MUJldbmzmzELVzOyKJwkLFAYJCDe+Fn4ZZ/GmP2jRXCy7NCqUecYMDUJe0fn4D
	tcN6ERPKoH0g0V7y9jY/Eyud87qCc3SHHWq99kde0r+1HhnURwe7Y+gcNCILnXUJ
	7T0fVxUciWYXQkGa4hfxfQZfbliqHRf81+ECdypYPeUDJw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepr127-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:05:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6055b93cf47so7413324137.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189947; x=1776794747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OhqR9vG8Ni4aOgZIumqEuvhz5RlcPtP1kdti8y6DfmU=;
        b=TAR+m4NC1MDaSOjdN6qi2DUaYp9karXuSfCAC9rNzCcqJ1iY997ueFgkSIK5wgcxj7
         q/7+fASW2dYuqrw4nyyN0aOumpfNpP7j8+TfporOgfIMQQ4xMQkBqZAkySYOBE/lnGAA
         DYRrWZEwkdiMpJ5p+bKAOGDL8WD2sndKZ3bZqSh3eouDsyOrLJXsyMBxoD+OQJIJPlvS
         xVaJsVF+yHH7nphshnKOccwY3/PxYFz5jnnBQyd7i8I16TgY43mX9ctf3VNPpUaHhalG
         E/1F6C3FeKB96ejbWlvu+QhaClj9Pf1go2TEO3OW/TvJDxtp6xiONgyruuHW45G6O5zi
         gK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189947; x=1776794747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhqR9vG8Ni4aOgZIumqEuvhz5RlcPtP1kdti8y6DfmU=;
        b=h+nJCJ162x3HcKEYnV0VbwJjiLum32FhxjzrtcWjh0mh4B3Qa3OO9nbV4Ab86t0lQO
         ndVstr2RNCHHdIjvtE7Eh29fJmb0iFYZ4WtIgEmhUVojouXvS944p/l+FQufYu7yQRxy
         L/aT11aJeN8L1iqoHcbE4GqqufZJlAVBv3++R9gWInXBsKad47Un9Q5UPXnMwMVn+aHq
         Sdtr9mm/LqYoSnDG8zC3ZxXhcYrSl9u+9Y+BOLs2TYN5MGZLdNNJ95WnlIaCSL+Gw6NV
         RbTHRnW5+JlYDUnAMyGulRhib9FtHFb1C11Sy+Z77DyFdsPyd8rgKSFqKuOyRz9ofGLC
         qp+A==
X-Forwarded-Encrypted: i=1; AFNElJ96HXO/0HvToSQDt3eyGWJRfWRJEVjVL+DAAJCMIQYrdycQz9tvzPxX59rJvi9O0Wlo8fLDIPRpNln4@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYF0TzKsgjSselR8oDUjgWn7DCPWYHWILwGIAzqzzdGNqJU5I
	7n/MDBaL3J6AAon/WZofOYiF5KY+rlheu+YZRgpRyDE1c/XVW1Nhm8QinhNXI+PEqwilWOak170
	P5J7FiZHANyq+/+SvVKuWa+cDa5DwLpEZX+5jQHST4IcInqMEkWUK1sNbMwV/zdOR
X-Gm-Gg: AeBDieuDnqVHtMpdpvm8+iztsBGRLI+x2QMAmGHn+arPS03od4ReqK+Dd1P1ABG24UW
	twRRtkOfHD8NknIyuthvjd/Mp+DB8/XbVtKpsANJZJRKboOlvwxHiMzlRn/eyL9MtG9k8QscuXn
	IudfeLR/BBXlXN7Q8CetU/ae53qJ8s38ohek1OM9wpcYzj/FM0vUr57h309e8TUhVus4DwhxF6D
	vZZyprDUK0vYQ8aTD3sqyJ95PV4AY4PhH/Wj7L69RuEOxqUFdSLpoVbBtSPD4TTry1TmPb4Abwb
	CoTpj+9HKP04dhoZApTiAVFUHj5EHfRt3cjnSLjwd08hPn6tPLgrWvGiHNLqh6U3xI6EXNmp1Q1
	R34uSHW0OpZIDurU4krlk4x4MPoPep9bLdZAsurxtIeLeuZyCkiurE9+xSWNVFZD/Xb+hpfL9P9
	oK45xojRH90bHrEKzX0htvKTsoxdq7/lbhuxSSprFvjGUA6A==
X-Received: by 2002:a05:6102:38d1:b0:607:4fe2:d3e1 with SMTP id ada2fe7eead31-609ff7d06ecmr9583107137.13.1776189946838;
        Tue, 14 Apr 2026 11:05:46 -0700 (PDT)
X-Received: by 2002:a05:6102:38d1:b0:607:4fe2:d3e1 with SMTP id ada2fe7eead31-609ff7d06ecmr9583066137.13.1776189946338;
        Tue, 14 Apr 2026 11:05:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495417cesm32389181fa.25.2026.04.14.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:05:45 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:05:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/35] irqchip/qcom-pdc: Add PDC_VERSION() macro to
 describe version register fields
Message-ID: <gfghnk74kr5ca4a6thd7rsyycpcs3744ybz4labevs3zqjswhp@2kmn7s4b4cne>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: A-6txTrNYBDVG60UICxt-WbAhPxz0gok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfX78FbSi0cHo/T
 joJYQIEUM5QvDA/vBzsoF6SozuijJPAqcEgoBBc4hxkOq15ebANLUtRSGYUt/8bH/s63eBwVk/8
 MIVKgt4htAFewpd1yCNPts+y3CC4w/UPbpzZ3k+6+2iqx6vBgoKA55P8mDARyDJN7JacGNcljTO
 vlAtGX+hheoaGMstq8zyUvlvmqHxpaGZHMaSR+96nKQUZWsfZ9Pjcpc5xXIIavWeTAlUF7YTRaX
 Dgh5963nAnIj+c9arr/UMKEWVVnv0tlCEtb8IIOWMmaLZO9hFjqMHfICWW4/kipmLxWzYeeJ53G
 NXSwX7cZXBn07IPC5Agg6YNBcCxSNK+ovuF8SIeqslaHrzkLEyaa/SBObWy9KiF3WYVg1Wc5rPf
 vl90w+SSvt8OoagXQF9nlWts3Nlt7r5DyAyfMcuUiHXS8AXI6T1+ZyfmNhlp4j2Gp3lP3Yllml4
 VLyLMrprIKzU3wbocWQ==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69de81fb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=seQ3RpP1mtjBJ7LqmTAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: A-6txTrNYBDVG60UICxt-WbAhPxz0gok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140169

On Sat, Apr 11, 2026 at 12:10:42AM +0530, Mukesh Ojha wrote:
> The PDC hardware version register encodes major, minor and step fields
> in byte-sized fields at bits [23:16], [15:8] and [7:0] respectively.
> The existing PDC_VERSION_3_2 constant was a bare magic number (0x30200)
> with no indication of this encoding.
> 
> Add GENMASK-based field definitions for each sub-field and a
> PDC_VERSION(maj, min, step) constructor macro using FIELD_PREP, making
> the encoding self-documenting. Replace the magic constant with
> PDC_VERSION(3, 2, 0).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
