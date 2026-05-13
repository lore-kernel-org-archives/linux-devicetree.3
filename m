Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7A45BD67
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683478; cv=none; b=cMNtlGmg1go55ubZfOx+imeVv71owoUcJwSd0crYkWU/Isf9YsaeHEX7KI8diWcrPmY2cNhDsIGvmGvfHa3JM01GqHP2/K9qqZo/nlB6lu8zhtBJM+q5nJYluo+J5PB8s/QoLWqaLdEgOFoS+XsqTtvrlUtFjCKpqUGD0sEOmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683478; c=relaxed/simple;
	bh=5/o3fOjA925+2aR0LfY+xcd4wMWyZg4/UestgLqRho4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmlspleSNRE6ah6EH9wRTi+bD19+5S67tmRw1oDJfmXyG5PagABqWOo51lqlkkxoz3lTMEev+3YGkPqXt5L4SQWb9WE43QobO++UXSFXk+jOELtDADjc9U5vGCAAaZwdLdQ3Om6zjfNj05LkJLuFO7OhY5TSsOP1+mf/M4GuU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YET3eFyc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbQDNqPp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YET3eFyc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbQDNqPp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DA0sKf2321437
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4RrmG07hzLVuJFz0XsuE9L/j
	GG6n2U+1RQiGpla++ko=; b=YET3eFyc9L9J+iBmLq0wtWQs9NyTP+jQi2cMCuoN
	OvdLsmAQ7NNFbJ55L9FZD1wkSV4QQZv3TdvqCXaCB4NO45owBFDkWDWk3g1e8H+W
	zvzrLZA9Iy9UQt25VQHYdXMMdwdgPTes1oZAob6Z2xHRnTTgfiKFsPiIy5goVeXj
	iJJHoEsYpKHaQzMDUFinqR5AlPE5NagYJYxAtiOSHCA2XGjK2nVojqBd9+mwTk+J
	0/qfqphVsPmY2Y2UicXi6am+UViKo0y4D5vg84BX8dnNLwgoUfGUCdKevP0tk+Gh
	pCmbe0K+uYwmkZmwA/vmdao61tb8tO6wQUd5pUO9a+4IUw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguagk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:44:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9569b029e1cso4510576241.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683470; x=1779288270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4RrmG07hzLVuJFz0XsuE9L/jGG6n2U+1RQiGpla++ko=;
        b=dbQDNqPp+I4niuxB1PogR6pBgouaMgO0E76ez7gLe/mLSu50VDkcVMwWpBbAmsM5mR
         rUHA+S0wn3pMIpKu9ZtU9lc/LbEz3UpBqI046cPA71jiueBBGFvLOb6rKS6wIx6/1mIG
         uuY5cpgMf020aj6Cr6OzU1AcUhkFGLwY+7Iet/K1T3PGp7Engl6CYaQ5hS0Xy7ijllPL
         LZAWyTfCjid8pvRSETGIRfbuE36wz9XVDv4es7GgFrGA8ZEmF9vpGAgEJHwWRQSGRkr5
         IpJYVAk1LNJvdjg7l8hta1reONBdJ/DgCoiyiEzg3fgLsZiKukXMC3mM+Ur181MgUxXI
         OWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683470; x=1779288270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RrmG07hzLVuJFz0XsuE9L/jGG6n2U+1RQiGpla++ko=;
        b=j8z59JybTjBvToXHjqTXKWPOCkLfsWiZq/L3xLgv6gH/oIEaJjL66sXAo9gDqdWPzS
         VfxE+vgoMmwZJabZDnekFFYabzZLdnh5ep8q7O+djk97EkVLleT9RIXvxTunpnhhcMGj
         aTAxjFt5fD472jqqkQHOPaq6Hia5uPfQwjFdszjZlLQK9v0xCLGsLNQ4CVz1xgZKagnj
         bEMDWN5L9Y6tyRCjIk7pyAELmZl5HdKOWSSeScb+0A6LKZIOthW3CwCAcLaZo+O5vwuw
         7UNzJ+0gjnR4Th/3wS6/3zGff+RL5nqYKtz8BN/ukZi0MdvIqXc64sLF0SZPSVA4S2pf
         1yjA==
X-Forwarded-Encrypted: i=1; AFNElJ+0ec6HQWc43TPIIelnCLmxKccDmeC8Csvl5uuPWFeLssk3ptFR3k/noFEWt5+Ju9dDy1E8rAm5eSs8@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSEu4VTj45KIICZYvziD9ZvH5gFdS7pxeLnDR+bsKtxqgJCwg
	PIcUTveK649K8cFF6C0IAzVk1owOQf6pkSSoP1vjMjSzF+YYDI1Kk5c7NtYi7eJwUIJH45jyMCZ
	9aWhcuDE4ejV5ywX7p/F4LjJq4zfTSEYET/DwKTyjI53ct9mhNBwXxO5BOteBq1mfm6g/+FYD
X-Gm-Gg: Acq92OGhMs2VY05ZCPE4iStFB8/63XVTXxN7N0zOccE51U/+OjtOwR1iof+yA6z/8AZ
	frKruMi3NELZQdUTlH0f6gMaXQOKe9enRh22JOoCvm6QGU0GpaJtVBlrY313+Bemgfw73eAhfde
	kjO695HajOR/xfDf7Hf8CPLOSHcvyiEMR8vXQb852bLeFoyH7f8mFVmWUd8qvar/KFQMxwvQqYF
	/ekW0nU3fvEQrhmwIhzTlw7RfFI/4VypfYbUqRpk+XwdIPxDBgoCV21lQI593mQlZzYFmX3nq8i
	cxQHC+wlnnBZVmphWSIACRkvKcmlhpYjt7nog5xF5SB2zhdWDpCEZrl7O3NGWnrY1Il4UviWgSC
	dxqCcwsBC3cxAF3c7J8BrAMPhft1quN8MbqhmTetFDViwVh1+HKpfKTOCtOVrYzTq7mec9sSo3o
	DufBDAw/37GqT2ss+QWkLRB/dh9MMHU7N9cO8=
X-Received: by 2002:a05:6102:4a94:b0:633:bc46:c20a with SMTP id ada2fe7eead31-63775911524mr2035440137.31.1778683469426;
        Wed, 13 May 2026 07:44:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4a94:b0:633:bc46:c20a with SMTP id ada2fe7eead31-63775911524mr2035390137.31.1778683468669;
        Wed, 13 May 2026 07:44:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c6f78bd7sm2578927e87.74.2026.05.13.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:44:27 -0700 (PDT)
Date: Wed, 13 May 2026 17:44:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/16] media: iris: Add AR50LT core support and enable
 Agatti platform
Message-ID: <xxjntsesqwz3kforkk3hzet7fevmkcmg6mivae3n3xrco3jqpm@yu76qknvtxpc>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
 <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a048e4e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BwEK3Y93O76JwbGyEuUA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: Yk0_xhAd0ZjRjiYz0a3T09KE7NOY0aPx
X-Proofpoint-ORIG-GUID: Yk0_xhAd0ZjRjiYz0a3T09KE7NOY0aPx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MSBTYWx0ZWRfX5pZlka1+EG6B
 xHgnHyzd2us9jdhvISzGsBtDT7bSIHnZXL6cIewquOUSpepVFqWksKu0NdTTcxIitVAX6eiPoih
 P8jldHa2xilLZjSKnBKSaEstgjVvoWIfvFLKJ0wyQ8adIA19bzKGG1JCnsbe8wXqgjbypE7oWa1
 Jx4J4ll3vNoCs4Z9RY2BsWpu7ONRQ7Ecv1kuP/tvNNyU6G6qdBXABzYgDQRCxtbKrF27QU117/B
 VKkWZjjgAot6ReEBHvPnX9Q4zLquFdMFrpbrNVFZ0P2lPqtURw24Rgz0QKx7HZ1j+BLmb71a1cq
 6/a2xoNTDwLDVyHwa5wbIQt69fLDfEGaKP/Tr6x8lATf9U65VwuJGQJbEVNHD/baa/IR7HJRKQY
 xW2DKeAsF8SyKx3qdqipY53/vI+4pTydM5e0hrI+2J0qhWhgHVQ5C55sXr+TgBoO7fhbQgt+aaD
 HjWv9LHpD7DKDNGYkKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130151

On Wed, May 13, 2026 at 04:34:11PM +0200, Konrad Dybcio wrote:
> On 5/13/26 2:45 PM, Dmitry Baryshkov wrote:
> > This series adds support for the AR50Lt VPU core to the iris driver and
> > enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> [...]
> 
> > base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > change-id: 20260507-iris-ar50lt-06228469aa5b
> > prerequisite-message-id: 20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com
> 
> There's 6289 prerequisites listed in this cover letter (probably a record)

ROFL. It seems I forgot to change the base-commit. It's
media-committers/next + Kodiak-Gen2 patches.

> 
> Konrad

-- 
With best wishes
Dmitry
