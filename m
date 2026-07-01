Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2B35E1DF
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948282; cv=none; b=gQEgIukW/DFiG2kehQ9tfcmMzHLjUlqYg4uHizngFgaaVkxWYSlAQZKgdfQK3mW6fhB9zmxyJOw/k0Kx7eXv0CDwTg0QzRUvs1jsl5K3c8BC/WmBYFuyh/2r+SOJWegBBwvfiKFKGnYdFRG8BjsLnLIlPmvu0FB7226r2M2AwOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948282; c=relaxed/simple;
	bh=FX83Gh0fEBrmx8X3MdUZiAluFH2SpLb4shTVWYrTpp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqZX2J4fMB2WuijQdtiBir6nRJGppmwA1WxbFFgID64CgysBvGDWHHHHEwX0KjxuHUOSxPhHD7bLrPgW4wfJMq8hJzDDPVbJeP+1d3QyumZnZUpOmKIAlKuhoS1tuNXFaV+nSjZVq4Ctg92SJ1rNhvAPP0x+UPi+Hu0Sfch2ylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=heeBx074; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXjMtCR5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="heeBx074";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXjMtCR5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Lhf0a2488955
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 23:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2hvamgifKm2sB1fXIHK+rOhS
	pe4bd4g/AfutVumANqE=; b=heeBx074q+C6T0fma3VVv/HtU86WHMgVL3fU3vbr
	s24kfBFWwTWWO6IzCF+GEBmkRyGQEtEMsAmtCxHEWbqJFXTBORzIAoHdnbR/5LX2
	hcui7NXaqSskHLoptSSC+wq4L4Er9FavGF5lqZ6U7plGNK5vQbRjMCAaSbHRrBxN
	BiFfKnOqUQ8jmZMQ9iABb5H/dfeBANcD4Wae5poBpkeMpfxwlSMPRl3eO8BkofIC
	hArXmMc8h4SeX4RNfDnB5FnHXB3zK/i9yIV4aSRk4m1DK/qFFkDUSwx8ozbo43rA
	vt7veqTUn8AaFwKLCLsNkwZ0yneXD82rk9jlVl6H+W3CrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpsefa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 23:24:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92da6f3cc81so149925385a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782948278; x=1783553078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hvamgifKm2sB1fXIHK+rOhSpe4bd4g/AfutVumANqE=;
        b=BXjMtCR5UY48WPpxl94vsq9jam4a8YqO79XxMxEqEFco7B381RPiVp/Jsnhhb9uJnB
         v9oOc093cyfNuFhjGIukUrgQwNxyozy4Q0i4Nx/kcJ3eiYnXzMdVztL8FefEv3D9ahcE
         wO7Aih/wxyDQf5PPBkp3J+tFAKiiWRkaZYTHLy3CoxVwMEDYWgorCmO4FwN3bFoQEqio
         ge8OvBMS4zdkS+SWS4it/DL+UKDLLAAMQKrVqFUp/M68Cu7KUhBmsqM7JBGxMCbIqD/J
         WTUqX7Px4tXRK4HkH5jQWDvpkqHJM0S/f7ZT58PsqVKO2BTGHZwd5lkmh5Evj745eRF/
         PbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782948278; x=1783553078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hvamgifKm2sB1fXIHK+rOhSpe4bd4g/AfutVumANqE=;
        b=Bfk2ziACW0/gZsa80r6asjwgp4N7dSD2Jbr7z4sKYkDnk1KhGbBKZ00+jjLu6eaVdn
         +kDuZsCUsV/emdGte1SgLGcWt4XUWzYms7m3RMrhZH3xxap3+ugASNWzvzQiX45Kf/T8
         REQDoTRfYGd/vC8vIgt6lqt6gPlZLqgOv1st3z/8FQmN3d6jMXprcEP5v+KVAUhuT92a
         tQjUeDwupBiCeaiekg5647xirenIqpCT2l1H6jkJWj6NdQ7V1UE+6rN66WZnjdymXNud
         8tgBZfe1mWAlUovSVRRSRxwSctjNE0c7uqHXsi0gX6GJbdiUdNrj28wiB/KIiua1cuJM
         Vc2g==
X-Forwarded-Encrypted: i=1; AFNElJ8nK7RBkzRtpZDdRT9vfWiVsT80jP7nU7/FWkojNIF7W7FHE3Yif/rHcDnZUxU9O7q06eBJ8Q43OVCH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ecyjTxUjbMFtajsa69MObaQFtVncjOjivEv3GCCvIvNgsNi4
	BBMrahh9t10DmdyGAOmBuw5XKQJImZLC4RvyrpBqVwU3UNXtwCRP6r+EI/TOI1SuqLVlEZ/wKH8
	Kmmhn8JPWIQl1DcOCu6HrYI7VUvhvk9AbIMThDWjPPnaDBCj7CAKF3vbn64jiQttR
X-Gm-Gg: AfdE7clZP7p2UzgFmXRmCkRQXJDRuK6v17fKWC7T5QlN/6jWm3qbKcA6XQd3yLdxNc9
	ub0L9L8s1fXldeYEmPzKoGMdYhSPM8wpbnZ1L1FyRJ+7bT/V79Bd9ZtcbaT4xKCbtMzfmRnzJT9
	JD737r9NvGMmzhZSwddjROY/+A4RwzbqYT50NrRoP+Bo4h+/usXLcHhTjEeFwM4nBGHXKNW6odq
	gZ442i6cUenjsZHoSCye0M3PYmnkOsrQ9OlLkVmo/YnQk8JDZFjgZyrNVoeV57vd7qZAT3VDGMH
	p7PBwus4s20Fz3kDun7GWo9J8iVVpiRr3DOjpatro3KX8Ili7l2e0T+0sD2i+y1hJfK+UjxTpKJ
	/vx3FszYyM8AuqcAw0Di4HqRmrOrXd00+ss5q7CPHDUvbLJ9jdrlUthb0g/j0RBOBAjISMflSXn
	RI16H0L9kleGnVLc6q3AuCwb6C
X-Received: by 2002:a05:620a:46ac:b0:92d:6961:9519 with SMTP id af79cd13be357-92e7b0139camr436520085a.8.1782948278233;
        Wed, 01 Jul 2026 16:24:38 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:92d:6961:9519 with SMTP id af79cd13be357-92e7b0139camr436515785a.8.1782948277685;
        Wed, 01 Jul 2026 16:24:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991b0dsm320333e87.15.2026.07.01.16.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 16:24:35 -0700 (PDT)
Date: Thu, 2 Jul 2026 02:24:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Message-ID: <vodejww4dwqanw55dsyhinaxx4damkh3mpi22g7zaaabz57khz@o6njpo34yrlc>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-5-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701165051.4122259-5-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDI1MCBTYWx0ZWRfXxy0vncncI5hu
 g10oR4GqI5eiufT02MJV+iGdZISQoLNkPEnsNkJqOjaum6JuaBxmbIko5VOrpSZEFS4Brszmbeg
 lPQ0S34d4asu/5SkDjklWHkxHKHZhf8=
X-Proofpoint-GUID: 0vuAGA1aOuQqK4TLbn3nFR1lHCjF9M_I
X-Proofpoint-ORIG-GUID: 0vuAGA1aOuQqK4TLbn3nFR1lHCjF9M_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDI1MCBTYWx0ZWRfX1cKw7HQwg0DE
 0POS+51wZjUBVPXVubDczKbSz5bA1WCxgPPWzEr542Rf83X0gd2/nUynUK/HxQ2eIKBm3M5Wy5D
 tDKwN5/EkyngtBA5AjsA4PfSgRta6nv2ZFS7xIExJZiPDFlCMu9cQTjwkFtKxPRg0NcWEmk4N0D
 zUCz1RB5iBHxR0GE8tzKhFAv3IA71SHyRP7p0a97sx21gkt5yYiJwzxm4uFVpFExUxU+fQEQEVS
 4AfLqqscsLrC0R3QjzrHPLLKesREi6Ak9DtHJSQXAPmenq5osCH5YJW30iXJZtuuR5XFHPuP3Oy
 CziBDncgSatY/cNTDuSULebRK1zGFB8udGbrgaTaBgeO819unXeh6aupmk/AknONnwcDDr1WHz/
 X0+N8aElC+HVj71INOZAar+3WDDe0oth8RRPKcnu4P5tfcrhDi6g/pWGuTEbE1Tj2tuNAY8+0rN
 +NMkq77v40mhfu9D7dA==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a45a1b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uS2ns290GtotmmKbczwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010250

On Wed, Jul 01, 2026 at 10:20:51PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for the Super Speed port on Shikra
> SoC. Also since Shikra uses 3 resets, add support for the third reset and
> configure Shikra platform data to use 3 resets.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 53 ++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
