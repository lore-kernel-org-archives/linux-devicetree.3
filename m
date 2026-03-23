Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3863BC660
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278878; cv=none; b=A+Kldg1pnE0WPhgOkHmBwfEvtzqNo7wQJ6tkfrt4sQ7IzxNj64MLORmYMnF5+At837Sv6D9CiFMIYwXaYZrvuX57BdBchL/4IxAwzxGoVFusYUNaA2z9vFcaBWU1GynJJFbBg/exKuFpLwsH/NGwvppw3sK3++6sIXi6odNfrUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278878; c=relaxed/simple;
	bh=DgCFuAH1MAn9WMIQxsNGcqdB7NQIVcWocOOEdJWz+o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3Q2WDl0ixvSkT7ZHF65TLJq8uPYFTlH9km4lFnBfqbiuBxveATI+bW6FWk91h5AhOGVMbTbWOqoKxjTvmtw4yFBokOyquadoCf22WAJP6c3155qYVY6+m+0taPhBp+sXU0YoGPAXpyAa8RCRkvjRpfi6QaNWRxKBoE1G5BJYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1qK67W+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cy9I/eFd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1qK67W+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cy9I/eFd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFCkKa2479562
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xC0iWlN4QgfYjkcjbP0CHmC44gUm/NaZnBbYimYqqTM=; b=F1qK67W+C8lst9Jz
	P+bHCGuzz0xR8ZciJ4BaPNPNzOU6hVt3jKMCEgHpZazBUwKgSWxPFJhpYMh3snFu
	e+4vPqjFRN3P5xrx1evVl0DM5wkbyNkPzKVBNagWtcJIIe3MEP/U47MOccJylzAz
	yNXSB/d8dx13F989rOlv1K077RGQDeEN3ncf6zF69cX9cnysi5iv3zNgmh28xxcW
	HKwa8gNSwQsnLdJUqgYAljIjCsLh9h8j2kijnLa88V0/D8l9Qt8LrZOFo6nr4x4m
	SVPCwuILzJI+5qu3xXqQ28ZxS4iJf80M4phAp4EGYk8agbgYZCw9tpxHgAzcgWJM
	CRSyqA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jrgw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:14:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-950c363a61aso1216433241.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774278875; x=1774883675; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xC0iWlN4QgfYjkcjbP0CHmC44gUm/NaZnBbYimYqqTM=;
        b=Cy9I/eFdOLUvI1cTn+hcMi7kwbOmr19qrmHA7cckYszyWxZ0OjuMmIpgNGXQ9dZNoB
         Xb8Be4pYCmRXYtkGSxQU/DakD4rSjzRoRhvoYL8+weaQGKgvTibnQ+DY7JZZ04KrOCkf
         3L/4eui7NlUyZIFppbdScWozPgPhggudKIM8sja5P2m1sQVT/GiByXAfDWEaD9k8ImeF
         kyRKZx1rsWlGqOnTnVDnRL1DYvKZPIZYb7ODYSczuYr7Bc7vCzLkCA/K35xKC8+74NnO
         j2Co4FDR+UjZ0SALZ5dyYbv1gxL6JI2Hfv2A3UfKnnbELE1dePKdXt3nXWhefD0ODEZr
         6euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278875; x=1774883675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xC0iWlN4QgfYjkcjbP0CHmC44gUm/NaZnBbYimYqqTM=;
        b=ByB7Al9n3m95dYoX7mSacyXFMYRXzCkJcbjYx5ilv17ZE3D0gzXUj3Z/OZkUMtqzLC
         wIddH0YPoP6w61tXl9CdvMRrxIrnrj8HhPWZUlueiene/ApLqqD3h6sGhHNNqsSYmfjS
         hL2AThwttNtQKr1ENAgiNpV6Q3RQBe8caYrri+4Nbl0CR12UnmnNLNdWbpcqr2yOQ7FV
         a+rEYJRkV2im38nMdeeRk+VQTzxcNYrE1PxZzWMgDJrOCCw2ZgGP/u9134OvPx2jw9O5
         4OCiHSGxQJbJbnchFgObQIOWrncnablP7gKrT3B0Fr+MgNwOvx2kdsVW1W3kYqxCHsSx
         bGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6QE5wn1SAMwVwNv4PohdpWHgwnvvzgbfr2NdS3VINLmtuOfYv6Zk+dqVFZsnJh/ZT3LoM0tBFHLHp@vger.kernel.org
X-Gm-Message-State: AOJu0YygiiRAB7h3iTkdJN/f/cwhqfAHY3xHfhLKPawOKInWx1dl5hci
	/ptWl16ZBbAhVOSJyKE9GOURrH4elR+Ggn7rfk59PmPWx5wg4lhIgoO3dSv1frjVIfb4VyZ2NLX
	snVg8tA4I6/eWr7Xhxq3Aeb2VlPh9DA0CXe4r8mDDobRkQ55Z2TCUPGb7PsRPOUnX
X-Gm-Gg: ATEYQzxpgzELne0urktKLG+wocl6FOkYv0Gi04JpSIRnIB6L6yqlvuZZZ10w40Zm6dD
	Q5y+mQCS7ITywKjA5FW/zYBmVGBi6nb6ZkkWD9HJEsjePHHGCkpYZBWbDAy31ObzNRaz5OyR1NN
	Qqw1DKaBl20LLhSoDPpAqHi7PhZm1Gb2D08VAn7M+uUcU+OF1DVlXsZpvR3JnrjSCqW+DqV7udE
	/J5oAdrx9EAEz8R23sLwso320M14O3PWkdSDwvmEVsxPK5hsjOdZDNiJJM2fAqJvZsMnpQPDjYZ
	3y1pjSYfCX8AX7lsElhUCnlr4LBwtuhM1MRTgxj72mp4dy4dQqYP5R4ErwWnmjB2GsWJAXHq0KN
	ncwZoQhgBT4HHj1gZpGdVThwR9ZFjw/6WwtvelzB7InljShxbdh31rAK2ynHot3f6g91vqIJgqn
	7q5mLvabkwuumTPyi3Kb2aVTSgHAlvY+Elxkc=
X-Received: by 2002:a05:6102:5125:b0:602:ac40:96a7 with SMTP id ada2fe7eead31-602aecd58demr5912659137.19.1774278874815;
        Mon, 23 Mar 2026 08:14:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5125:b0:602:ac40:96a7 with SMTP id ada2fe7eead31-602aecd58demr5912646137.19.1774278874300;
        Mon, 23 Mar 2026 08:14:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305149sm2562308e87.65.2026.03.23.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:14:32 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:14:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
 <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
X-Proofpoint-GUID: 4rc1uykaggGnF0KYGNn32bFbNlJmV_jL
X-Proofpoint-ORIG-GUID: 4rc1uykaggGnF0KYGNn32bFbNlJmV_jL
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c158db cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=yFhtefBAoxeZhCgIeKwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExNyBTYWx0ZWRfX0DItVPsG2KRm
 EU+ZseNlRErLQ4weCurHqSz0HL9191B/MrEpA3S6x/EB4PDqbq2UFR3lMJVTL6J9sHRj+mtmvXT
 b17b7szk/wAH0yGes5hUDedLLtrM92jJSYvOirwjqwOGHjI8dXhsv+vNGd0VOO5ShhdR4gfQJ0r
 jl78MDNWJyZW//2dr9nZcl1YdxGxnMzLY69T5o/uGOvF6Ev497m2WKkMaNUXo6aOmWcEJhsp+j8
 cUPimw3XtKGmtshotaakETFtkBPOzt8JJDL9Q6gf5iz5/UF0SdPkLGqnKWweYOhU61VMuckB2+9
 ZS9G2GGC26PB7Yd9DlkEkOSzQ3jtgZQEU2wVXOoxzXHbccGzOeTjWUdYtk76KDuVdWtXMJVsL1C
 djyk/exCr8cgB08nBvgGFsrFgVyLc051K5o1Jf0aI+F9MYclNZdJ/xeDtM5TSgM4zfKie/7zl9P
 TPl0FaWi5ArgXZ4+vQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230117

On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >
> > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > > > > to reuse the Key E binding.
> > > >
> > > > What is LGA?
> > > >
> > >
> > > Land Grid Array
> > >
> > > > If not in the spec, is it really something generic?
> > > >
> > >
> > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> > > vendors may also use this form factor. PCIe connectors are full of innovation as
> > > the spec gives room for hardware designers to be as innovative as possible to
> > > save the BOM cost.
> > 
> > innovation == incompatible changes
> > 
> 
> Yes, I was trying to sound nice :)
> 
> > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> > 
> > Depends if you think that s/w needs to know the differences. Hard to
> > say with a sample size of 1.
> > 
> 
> Sure. Will add the 'lenovo' prefix then.

Is it really Lenovo? Or is it some other module vendor, whose LGAs are
being used by Lenovo?

I remember that DB820c also used some kind of a module for the WiFi card
(which might be M.2 compatible or might not, I can't find exact docs at
this point).

-- 
With best wishes
Dmitry
