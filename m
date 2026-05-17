Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D833C81B8
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042429; cv=none; b=CMcfBruM+KsTxb4xugAj0Fib+uUHitJ+YixKih5qE8PnFg0U6MNvJ5Ll84sY3jWHm6ZdxT8qRDuliXTPt803lmA55CILLz+RH3QsEMQhwhmkRfLF8J2VhIwbJ2j89MWWbY0LoNuQ9dR8Ab/xDEsLaQq82kHj2x8NSFtA5t9Tjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042429; c=relaxed/simple;
	bh=KH2q6ukcbp5AaSXp8cEFyogjLF1WV/NKI+JfbIs9Zxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYfGXG41agRlGxWq/GDDW2u6VSE8Zzli5OoKlvFCZPI8IA/taZnVj6qGHrZ4jK5bQ1CntAJIs58urU7cGhu94Ut/Fe7KPK18wOa24DfzPrPlY5H779CbmC04sMwpzk2417EppHtz66oIw3P06X0F73zWIYmOlkf98FJHU72gzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSmJ8zbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvaI5IBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSmJ8zbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvaI5IBI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNvF3m970086
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=; b=SSmJ8zbujuLqmSrJ
	hP4SOwcuU2/B8tj4fWaGfPBNfswDzwWRaUaQMHW70GI3sgVxCVQ7v3ipcL/Pk7Xf
	9ijtK7lEPicROvKX95rXsAi5bd4oB6Mzz3zVyjLv/xXx4axbdrJAB9Su0yCxVfuT
	aqgwaDyVCDhhP73wUZQ2uA+JydvmdKJcyIGFsonoNeh+T1D0K49nhik/l3ThtVb1
	oGRMZNV8mQmfnsT7hUk7OUdc4Km1xVeBqpKPHT6D1xgY0ZSBJfRuEOaPZhmsHa0A
	9O/OhHgFGf7fxFK01WyVOmONmMX+R+of8+EmEeN8mEs/ctRFKjgB4WV8tTd1CDvn
	ejDWNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7u9a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:27:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b5d6bb45so29546221cf.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042422; x=1779647222; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=;
        b=AvaI5IBIahVjXFq/Y/kbe+uwvUk9WKPcCMFU3WhdXyc2qNXvz7Dr8HMp35KHDGTzh+
         OL4KEebureNKWH5DHbmuXDQfTT8JqJnFAVHc7GuGFLCWga5orTEyCHdqv8u3NyysBqPK
         8+MPBnMO+6xTLJXK338sDSZRjUtmtE/L3tV8lmhrmDoKKfk+jnYXd8yd8HhR3sNe7bDs
         SOjlRel9nBNdMi7putTMgSdZrzBQq03YpldnptRYf8U/jEbrNkGujXQifRldP0qqXtZG
         9jKCNcJchNJ9/sh93GgA4Dhw/n/UB4XJtpEQWVYGdvhsdndYAHM1XHOSGR2Vm+gazkwv
         ge6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042422; x=1779647222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47IgD0Iol6l33UGUteMSnMp1BqqYxxlTxqbsNmGL4o0=;
        b=B5ppgB+W/Cra0WsSnIWgIzFGyiwoOf2Z84HIVfBeqyPDjIcK6JeJnMed7gwE20ttmw
         /1YNe0xr5kz2G+VUd83k0Iz2XrdVtUPSokD5i9qBpLBwaCxxwVSyhej+mJJgW4Zh/abr
         5sAA82EdDFcqtOTUrrdrf8R70E1aq+q4Vr4jyBAq4CRSwzRtzOJfrrVm8hhe5Oz30s8o
         qoaMj+UXC2/l1Beugk+JEsJWI3Pt4CZpD6gle+qr0BqycCoeq6vI+cBHMl3r8Z0XaW0m
         4C79CUsQHIVtA6daR2k4AmVdfq1nm1dwwcz0ulgR/tuekT1WhJG6xV5A7LFq2o87q3HM
         lpMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9e4Q+WKQfLv/n1ZYr9tcbZV9oakHEjJ1xOFEvrlORWNyEw0uub9zgkPj48GzfW62n43UO0gylN3xZi@vger.kernel.org
X-Gm-Message-State: AOJu0YytTFTiUFMO6CevZ0xsVmU1rWpX1/HNfIv4Vy6EtHPcC5U9VmRY
	nODqMyKNogp73m3nQEhTa9EmSy2wd23gA2/eISEb4gHyEbd+SQHIQBR/2/HJ5kc+ew9ZGC7WzVd
	1JU1iInSSFki/Qfd3t/J/ODSXrKoLVZSkquWW9KYtCzZLbbAk1p/+OoSpyQKhWFU7
X-Gm-Gg: Acq92OG+bvosyWsAkYmFC7JVZfd4/KgdKhvyphotLFYQfhqGwonNvQ9p6L7MADK9sMy
	iP+FvDrNB9RYNmEI+gJ65cr/GPxj7zMxaK1Ig8fL1rP6wYyj519qvMpx65HobSCJB28P61n+10b
	QypY4FZkHrsqk1ovJNJjLNzN5xahZTuMTsTI2XTECCeTV6N1WUDFw2caKa0DE6oLvQG6Aj75UlJ
	FeqF5UTP9jxzJgVQ11rF1p4LLH9WROsshE/lenqBf4SIQqy0cQHBfLtEww1y7Eb0XXqWh4va/ls
	7F6kGThQcJywaKjbYJKrKfANZZw/a+rS5Htei541L548qX6LetAcOCOElwN8FmOB8YDL91NVc8o
	/EO1ttfxbo2iTkuCRkzUVnRCmmqAGrU1RdLXmUW+NSnHxjCmqae+eZrNTWSTfM9FOpQ1iYTLNUN
	EF+5LDPFt+pcQd673Lh4AYOCeoh8jien7lq9M=
X-Received: by 2002:a05:622a:901b:b0:50d:7d8a:5d45 with SMTP id d75a77b69052e-5165a2754a0mr151817551cf.36.1779042422354;
        Sun, 17 May 2026 11:27:02 -0700 (PDT)
X-Received: by 2002:a05:622a:901b:b0:50d:7d8a:5d45 with SMTP id d75a77b69052e-5165a2754a0mr151817231cf.36.1779042421835;
        Sun, 17 May 2026 11:27:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c885sm2814535e87.11.2026.05.17.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:26:59 -0700 (PDT)
Date: Sun, 17 May 2026 21:26:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
Message-ID: <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
 <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfX0Wwn0eyqA9Ke
 ptmTt3rxOBcyKFr8Nu48ZOCiNFRgmhC/6CFdsvaZC4nbeiOdhB5V+pA2UE+oGyVtGJr/qCnsPxD
 abvN8lFPoxhATGMayQs3bdAZIqeQaY35cKAeYWW3syBSbYBnvVfGgWOg6fj+eIkJsEaqXxR3Sa4
 L4csW590WltTZKn3+DrnNiGoiNn7F5oTktD4n+X6HMZjayaXDs4hNZNDsEkhdRmHpxxL4eSWUCb
 uwx4/gCDtFVQSme35bxk1GJd2k9IPVqbt4aTywe54651cLhqT5lh8Suq69/CZt66F8MPwUucIf+
 1z3Da7U14gE5NY6t+t2XEeunRSFxQ6Cbq6GK0B3oiUUw+R/aH0AlqOj6HBjHKvVTf4pqL796D+F
 z3+4TaKi9ri7Zz0ruwkbDLgeRFH1YYOT40MGPQDILZf1POqnmWTrkPZPzb10lYnXqWvawC+22/q
 3tqA4NK6gTcaY1aGuIA==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0a0877 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yUhn81BH2gEySD1AKRsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: w1EVdVx_LodJ6YKOCNVrCXdQO7bkA7EP
X-Proofpoint-GUID: w1EVdVx_LodJ6YKOCNVrCXdQO7bkA7EP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170198

On Thu, May 14, 2026 at 12:17:54PM +0530, Gaurav Kohli wrote:
> 
> 
> On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> > On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
> > > From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > 
> > > Unlike the CPU, the GPU does not throttle its speed automatically when it
> > > reaches high temperatures.
> > > 
> > > Set up GPU cooling by throttling the GPU speed
> > > when reaching 105°C.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
> > >   1 file changed, 135 insertions(+), 30 deletions(-)
> > > 
> > > +
> > >   			thermal-sensors = <&tsens5 0>;
> > >   			trips {
> > > -				gpuss-0-hot {
> > > -					temperature = <120000>;
> > > +				gpuss_0_alert0: gpuss-0-alert0 {
> > > +					temperature = <105000>;
> > >   					hysteresis = <5000>;
> > > -					type = "hot";
> > > +					type = "passive";
> > >   				};
> > 
> > Why don't we keep both passive and hot trip points?
> > 
> 
> Need guidance here, we are keeping passive at low temp so still hot trip is
> needed for such cases.

I think we are saying the same. Keep both passive and hot trip points.

> 
> > >   				gpuss-0-critical {
> > > 
> > 
> 

-- 
With best wishes
Dmitry
