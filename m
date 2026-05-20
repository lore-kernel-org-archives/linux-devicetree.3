Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7173DCDA7
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280889; cv=none; b=fIjWkIHogjdeYNyZcKQBCFPS0Lrl3/TYgjZZ7hlCaVlA+V7oWsKxx6UmRNZY5xpILvtYjCVhQM23FKMd1PqaYfViaOw1jilejppVAaeYCBLrmO5FVFHtjQz6eNojXhDpximx1esXXkIC3K73ZdcNi/gxQXd1g773G9g/RYXhmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280889; c=relaxed/simple;
	bh=zCCict06pIOXxb1IpBlXdDfgZuXsApbE11u2/vLcW+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6neJvu8gQeJU+2QL0QlaazyH/fHtQm/Sim95upa6wmo7uj6blvm4bKyTU/OyKGstcBz/N236I5GnvUXS/YXY06pRRiVLJ+vA+Wv+ftyIDCsdCNTkqaC3UWalEkgNdUMFlelpPE0t5Ls/9qqKsMhO3ljTb91T8z3fM/FtU2yR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbtzF/Bi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoGy0lNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbtzF/Bi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoGy0lNQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K77Xch1953961
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdpYM21M8Q0ktREpxiFdF0gP
	EhGDLYOGCqnBfOEn0DA=; b=SbtzF/BiR32o/geG0QtteC1Uzq1i6C4LZ/51oSut
	bHXz7+2Egv/9Pu81p1GHLwbUU6v6Iu2wkwkbrjlUntnzg+ifidGgt9VM9epsvb02
	QJyuQAO2GH9W5QLXYdDsdDj8i5rCGkLaknLoWC2t5++LNKC/aHKdYOEADVxIckmc
	f5GcHBZj4JhyR/wx1UFYQYewID+vCYTW6SgXAFjxHCuxyIIRDoo1vaOVzd46N/c9
	oANqQ91DOpmmtiWl1mA9rF5SY1bbVf3H9Gnu+DzHQOlUOByBkULTYojDOK+1WXZO
	Ew9E4FgIEl9tzdx/xPQevSKR3wevc2ve6dKWrZQnqaI8mQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xvrqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:41:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fc8572552so7986001241.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280886; x=1779885686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdpYM21M8Q0ktREpxiFdF0gPEhGDLYOGCqnBfOEn0DA=;
        b=YoGy0lNQYTvBpiYWw0CEo4XfRrUgO2CkZI3LF+l3QW5AecRG/T9SEmYJi/HsKNqqoQ
         sceOaG37Q6vJKWZ8nU4TcpbF/wQ5RhYspCZ2WIXLX5FWyach8BRxRk07b2D7wLBkL8ca
         rUcFiLEDgOQArkCE6TJhvkUJZWxYKwI1nDg2wN6E0+PoVnPcVls8Xho4g2YN70ryyiJr
         juMNJBM2Icp6pVZnXWOW8KdC8lL5VHhVU4VxfTihq0eGzarCXPUoEWnRgSulf7rvcHQ1
         HaUmbhAOCAofVIFd4tqFqIDUsrpIVrUWyca0dfSmky84yYnGN2E0+Q4zwlHi7oD8esH+
         MDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280886; x=1779885686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdpYM21M8Q0ktREpxiFdF0gPEhGDLYOGCqnBfOEn0DA=;
        b=leZs0hgV5Fl7IbrJ1T/BkvJdQAeAk58z9L5+5GMxhG0CTrOR4BiNB5hwcxc2NRG2yS
         ZV//5X2cZ6Bp/YiLGK+aRyP3s4K9l/LsuNA4nGKD6Eo7OIt5AKwfwi69ywrmeBzUR2wC
         1tvr4wyL9CC6aHCuiMS96tQiX7QpOUHFA0HWhMMQz10oHP5q4AoJmmSXwY1RFv6E5MXC
         2xtWCYy9GhaTNoZIjx4W8kn4pc2EAFOFG/3eO8VhDV1IJrY+uZB34R9RYb2+FnTRWLjZ
         nSjc1XNYVWsPPkFa2ODbDYdvuLhZzCKYe8WIUCgjkaAN9CfMCODv8bNBE5Uaw7a8Gppj
         1i/g==
X-Forwarded-Encrypted: i=1; AFNElJ/okwQ01bG6D4hLUF6DPMbEEcYBFrPtLF3CVMzE+zHND6YF1mDnVyeKNkL45sCMOXNTt83THZf20cmK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvow9PnR1c034pcOjhWZRW3axjhJTdOTggzmg0/rLbFXwozvCy
	oV7SeSimcbk5mxJQI2Y+AmjGdiu4AMT6PrPfG1YcmSPjCPlmA5jrNUw1aoNguA97RNyvKCUhVqm
	brH+dQ1MWJ2UFNHLIV0cGn8wbXgZpQk63ubOIWhKd56ebo9CdyiXKDMjOs2vh7mUh
X-Gm-Gg: Acq92OEYU3Av4qYcR4yFUem55/TcolESWmJiz9AAk2xRYKfXsAcK+K4PU5PrntXC8Tn
	9k+/tVyl6BnM2e4S7PJ6LQ2k2ePFKT5GhfFe6Ci4IFMeGTViewkuTjcdxdMJ70UMiXjztujn2Tv
	SDhZj5vmFIJOCscRrsAU2hK06tQ5YirbkrdOTb7aAGydVfFq6uxQgXz27kts5PT8yZKdU9sbbI+
	hqJm4BSD0wQGnofR4cSVxJx7MJytGHPloJuRdlE1Ewz5YADFEFWi7GIkxpouPG6XD812N0kVoi3
	jk5fL4v8HhvxuKqUzRgDblKWBruVgf8pFJKdItWSVxHYcv+lT8S1sNg94Qq1kB/+WXhsDEB4Vb4
	ebu2RCQ8OEoUh/cIQqOS2+IyYrOrVf2Ao872qsoan1y2aeby1/J45e9iEu601Gzi5+Tp+Eb9+Kx
	a1p/lDX+NOwtnjGeBbJVJBbd/ss5oTWFteOfU=
X-Received: by 2002:a05:6102:304d:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-63a3d42ebbamr13508328137.11.1779280885915;
        Wed, 20 May 2026 05:41:25 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-63a3d42ebbamr13508310137.11.1779280885368;
        Wed, 20 May 2026 05:41:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11e828sm4975736e87.35.2026.05.20.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:41:24 -0700 (PDT)
Date: Wed, 20 May 2026 15:41:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Message-ID: <fmqsbwm6is5qzflvyt53ax3ls5vnxabb2fbl4bttbcxjnhnwwu@x2jso7rr743y>
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
 <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0dabf7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4ielwApaMtWjWprE9YYA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: qamdSWKP9W_useJt2RVyJ383jhT5B-Zd
X-Proofpoint-ORIG-GUID: qamdSWKP9W_useJt2RVyJ383jhT5B-Zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfXx6jJnfULdGDV
 WJEgy8Pm7jOwQxktMeIKhikziHM5cVyY1yaMH4Yyz+Cec5pumEXpQ9HFo819SId0rCFLAm7fJQN
 TEKLi5GwVR8g446Y/mHWlTpnQMTy3hRTh8R2oH7HNcGWOK6riTbRqOAVvpuuhK7Hohq8imoEk5r
 XB/IHLzVO57V1JnGaCfuTFRoQ1vAh7EzQHTX/KQeUwSwHw7wH6V8L6+mVwQpTHjHEODYlPy5IS6
 aBlEc6tPUvdONWEJvJr6Pkh/S8V3BvTC+6x2IZL8yQINg2Phk7z2oAGqs277BUlkEO7s5U3cTys
 F4ZV7sffJZgnplq38ayWBinFGZgTuDO8hlJJrQQ6QE3fXp9ut74nBv8dPgolwgl4lR36m2HWj+p
 LttDyhYwTn9M3q8pMh+fbeUZezhhwTzWW24iKEgOEHLcQi31Gxb0XaW3JJOdm0Lmn17Ya4hTQuj
 w/Cqq3H3ZbEC0KQ4Bgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200123

On Tue, May 19, 2026 at 10:58:04PM +0530, Imran Shaik wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
> but supports only up to 12 frequency lookup table (LUT) entries. Hence,
> add shikra_epss_soc_data that reuses EPSS configuration with appropriate
> LUT entries limit.

What is the drawback of not using the exact limit for the LUT table?

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry
