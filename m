Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A21439F96
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433537; cv=none; b=fXR1bWHk8+SktsfE5Tr7nwO9JwthZU5I4R+tE+oNu8PRIarSkeJ5zHp37jP9EvtBuiG+qprFhDsg8KS7BL6uVVgnPuovrDd3iTF4j9p8RZJeBGo9pTWoOzgx53HzsK5g2U+S+nVWGsOh5hCZ/aGr9QQ6p/FIRutxsA5zSkeo/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433537; c=relaxed/simple;
	bh=/qJDC6cugKVjmjaFiZdIAgE0dBgEMsPvwp+P8zVZKFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFeMRKcg95BiupBCpoMQsKUGZKDzPdSHXjs5dZaYTTawrOXcyFcby6aMN5umMtkaIoKIJ7F5jzO2qnM3hIai4DkWiDzHs5Sm6VViMl6pK+Rpez5/P+jjNVLFDRVF9nmBPn/GohnGeJ666iiGHnkI5+j6DQe4ZA+DPwT4yZ3EioM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxaK/D9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enIhWdDN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxaK/D9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enIhWdDN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHA05212404
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 11:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QHJgfTmB9a74tsOwrBzPpi9Z
	i24vB+4V/J7Jo+ncd8Y=; b=VxaK/D9d9ZLeFG4GKdKBa6I16OaErg5xO9KDaE+3
	XajvEu45mVJHmY0vHWUyec6/Xhg1O/jEUAmgHrJayuZBQUhocwNRpKuSBY0wJf5r
	cTYLMm0gC0TlWzdrGfk7oHqMA2aLWJwk4vVt16VcIAoAHWyxaK6cLkD2sswkVFSX
	aJ7ksiwGrd/FBcjgTyspUadfbViy/bCIMmSgL12azaioy71H/7zd8Ra47wwaAy4o
	54Z9PTGxc/PrekOdo6/1zPrRnWVyTkfH2foGispkM6hy2xohDt2XbhwF1CN8Pw2N
	YJOoDmBcXZSa6/1RGPhmnoYRoj7c+nMBq3Sh7tCxJrqPdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhjhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:05:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938153538caso435172185a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433534; x=1789038334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHJgfTmB9a74tsOwrBzPpi9Zi24vB+4V/J7Jo+ncd8Y=;
        b=enIhWdDNg7zSlhyczykio/sL9UknP8R7WEAW5tCJVzdvrQxNtOjG6fu6gR1rj8f0Bi
         c8ShwvsO7m1VixqQNWEy3i1+nThYHuSZiCTPPH6icv7h4lHvqpcQN0KSFv8Bx+RkJIy0
         UhXyImDHwJaY+gjN1ZZAD40mOxeWW4DJgBml7fJ3lYNZiEPwOvwDlfdJHg1Bup5XadYi
         GHtmpXgJCQ1ogk3v1iLjeX9zhnUvfDvGPTftzwEkhBKQQbEmfFmW5tbsafb6TYqS9qQW
         TRsg7fZ2HYAhPemx/bbvJKMvsr+8l6U2tPC8bv8QeL+uXj5C1c0qf4ngCNcYVkC/qrct
         EHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433534; x=1789038334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHJgfTmB9a74tsOwrBzPpi9Zi24vB+4V/J7Jo+ncd8Y=;
        b=jMeguR/6xwiFY7fJ8wbO1eSQLCD1+di5CrjBKCN6doqyoV6fOsdVBsluXHIw5fp/lo
         ee8n800/R16hHEw7vz/99khCyEigOuMzEdoyIQ0RtkPwcNex3eMk2+bXB+LqgQeZGaEo
         ySiCEm2nP0tmx9CNMRqxDYND3EFkRCoNHsGe9IiEa8cfxWjCR1SbbH85Mm2V/03x3QO0
         OjQhTXljxEmOh98p8k7SNshz0UaRjFXRNd72YWr5tlJ8DTIViqk456ZOn8R6/vp1RCIW
         Ei7DYjeZArCNnv+6Q0aApUXfxmC3HKhouYEWTrv9n8L+OysuODfVTbOUrz1VXQwX7mHy
         VwwA==
X-Forwarded-Encrypted: i=1; AKwUvBwcwdHHUGIfBPJkrmY7UHcJh0ga7uNDOjAxUZPUvTq0/DOexVHlOlXSIN1FvGoTV/ovbACj/haVlDFd@vger.kernel.org
X-Gm-Message-State: AFuF++mm/BuHa6XNwVvlp0cfe/wWg3vnbozkytHtMbyt4y7vrlkNr4P0
	unhQaXCBqFGvPobITS8SM9ZV5tyki7udP1y+NAi4smf1f4lhgTj/L+8jyVUMbYjUfuye22yNXmX
	ZBqqs3ZDEAXjgDlK+ac9VSSbqG0qJsoHCd3VQJikYatg48NsW8P6bVYWAwQ8S9ZxS
X-Gm-Gg: AYBFou2oRUHszXX60iVG8/oMvVuLwCEKlNzriN5yj52nlc1K9tO5YQhciJ9cNbMRNna
	/gzRxO2/EdSgMoonllVd6v/pqBlK4oY9cjefU/gaELAy4SaikhvZiQQhU24vEAsMCn54U2uVKTg
	5g53VFqVd6iiQyUDNQcqUZnZYt71Be5tFbnxLgwMt+kKLIXwEnRMdakLXs1Jha+n9qeO+Y+Hxrp
	gOMbUwtEdlkooyc+NchyjKHy2kf2JDFsgD3SMvtBewwLtasXAnkUB/9FXKTjlP0y8dJwvEJ42qr
	1JYdDXHuakKH5nfYHquzPderEgqjnERQuy2ytSLGWfJYyf5+0TcrJRYIfLhrk+lwTLAOnLu4Dl3
	DGmxmyDi7e0UciA==
X-Received: by 2002:a05:620a:404e:b0:932:ddff:123d with SMTP id af79cd13be357-93960f796d6mr1350785785a.29.1788433534304;
        Thu, 03 Sep 2026 04:05:34 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:932:ddff:123d with SMTP id af79cd13be357-93960f796d6mr1350745985a.29.1788433531584;
        Thu, 03 Sep 2026 04:05:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm74620175e9.12.2026.09.03.04.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:05:30 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:05:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <33t3reowiellyer7bc6ipp3n5jhchf5ozbj5imkctp7mcibkq4@w3jbhjet4w6z>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX1Q6GdQyJdCbY
 GMDz+1AfyrK/1vtA7e098cV6SGaR8mCxyn97UZZY3SUW4pGkGd3YK1yafH8P4tUityBF4bxH89b
 oZvZAPpzfEnRTwtVTwViOtSdOoG2KoqdpAUHxrzOWFByYnMudeysQZO66nggiqvjZBvSLJzOP9s
 izq+hDLCNQStPzmKFwn4K9JAil0WkTk529mSnbFmG7uL+6/37IQa5IeDVJqLS8P+FSrJrep69BG
 Et0NldDX92NF/0LR0sJuDVsIPSLA2UsE/wTBUH7gLyp5XzJSJYWUqu6ifWRQiPqQvdwBP0sic2M
 dYly1B0XXP1e52T3UnynqA44TJQb2FgObnvKCFTx/9hwTYCuMmUrlBOdTuqstSrWxSayynPSFd2
 lKx+SdnLktHVpu1IMcXsbHD1i7/447VA6hoR6UdqWlOKhfH4S9oWDBc0KHf5UqGAGENupX/E6HG
 aKflKA7t9So4XtbJAtA==
X-Proofpoint-ORIG-GUID: QmKIIm70k_TzfL1yRG_5yvuYpaY_hz3a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX6ETQxb1eqR/A
 vjIY0udKIFbYJw3EUqKErcmHDKfl559gSbmpvwJ6z5K4/fZ0aMoiR2Drxoa/B3s0aSh2qQyyVeA
 zegdz6jBLvfNWm609uvPk9rKQRbGo8Q=
X-Proofpoint-GUID: QmKIIm70k_TzfL1yRG_5yvuYpaY_hz3a
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a99547f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 26-09-01 12:27:57, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
