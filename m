Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D01048C3E3
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997146; cv=none; b=cuhTN+Kx9UUbqKKYWpfeLqtnbA3oCMhAgu4kLI/TKYBrKr0hrDX7P5Yr8X7gkmoa68xfBCysI2+1W5O9cT0p2kXBFIfuH+6sSQ+4PqBBICHBTP8tpen9kXlxEJWPMizTPvdjeGMY+/2+Fdqi3jcN4LY0y4K//8f3xDhShn7Ckyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997146; c=relaxed/simple;
	bh=LIGjXBZuRHkVpvUJmypQdCVF+ROfFstWqZ+VH8w+9P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAFsoXWC8o4FzsArlbbcgPE6DO197yT+MEy7PrbMQ3qrVb1CFGvN2/EI/HROomGcw/jmEKwrAvJpKbyN2VW03JvUB4AUZcv5y42/FuyHLmwoLxiccsVk0EDHzHwmuRi2c9lZyoBi7wWI4vGboBoDTdKkzwNlRKXC7J2mPBKSFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZqFBJoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e42glqek; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZqFBJoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e42glqek"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662CjmSP483761
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XWvfanexks3bEkJvHtrjoEDO
	23i1+dyqL/VN09pDErU=; b=HZqFBJoKGGJMtyz3q+QSb4V2Ww3AgyQXw0ky3FjO
	NQrs9zoJpwcZqoDbADV5SbuMkvKyI/vqwJR+bV7fdM/10NdjN109XOzqf3IhmsUl
	PJ9oodZDKMXuhdeiMD2XyRUesbakLBKNZbwCwgJHQFQoA0GYlZgceoZn2oVVQ3vE
	mglCp83JLEzOnQuKZ6jwg5WzTwFpIKF8zkbrVhmUjaGOdVUDoCSjmqLEYFr95qnC
	iQ4fEcXB+MexKsD+qJjHj5TgHl5Yy5uof6KAy9EyQgGpkRIocXWnxCtHDBSuSTYl
	+EXrUPGXUj0BwMeQMkt1rlGtoiKp3OjMKzRv57OQEGOWRg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc08kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:59:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-967973f71fcso600460241.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782997144; x=1783601944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XWvfanexks3bEkJvHtrjoEDO23i1+dyqL/VN09pDErU=;
        b=e42glqekuhAQH/4/ouonH7zmqUSy0X3XFmNg8KsPc58PKXuiqPb2Xxt69Pncw3IkfM
         K6ElOzhSZCQsXn7Bl2uwjRR/fS+b/ejomdGiO9snYlClHjfiIzMU8OAZYTd4vuYDm5eo
         rmKuN+4Zb19n7bU6DPBi5yrBL90IkYap4ag36N7AGWFkLz3OoSF6FPC1b64HAPsvLRYD
         RbodTjXVBGLZJRj4e7F97ooaC7n8Se37wDVXjzMl5P/nH+4cWdQs58ufMKwiWOsUFU3k
         ZAk8+VZg9si1gRxONxvjMyneJ7imvDB1Hp/NAlpRtEx3lhKckce5G82oF+VbMkG8sWAl
         HALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997144; x=1783601944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWvfanexks3bEkJvHtrjoEDO23i1+dyqL/VN09pDErU=;
        b=NpcRUlG1WD8PoKjkGj/xpX+CvFbSH/lonwwJRrPnil1Zk0WXTNaV4Jw+pa6wkq3cUf
         RSqq35Y5jPIf5m5vziWmWGAATPFLa3I2T6fgBHgqsyKzsqkZxCetXJtovZmmqUjuic69
         OGtGi1xzl6zGKWsdJPgdXeY6QUuq89qIzPkLm7VhjoyiJL7O0d27Ox44kdEKMJmbKja/
         7LgmC+YA7E3qG9BNcRj37QoEP5jZmISY1Fa8EWAWIrcZeKkTrUEcVCMDqnQMN3clDF+W
         VB3OrgcaB5Y1hqQu+xXaay3uT8MhNAwZZenTwQjLLiDL0YZdpr6lkJbq6dijqaSAPfto
         awow==
X-Forwarded-Encrypted: i=1; AHgh+RoZrcPywcCBpumSEM7G8JmXOsR3/YqbuydKiiVZUgghizMMfLFNL3I/jomn30Xno5qrrgTYrCfytrHO@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcOQsYyeaQaYOypPDPlPHxmGR+LJIPtY0zbz9JozfuHtboufG
	bYG72qG+jel/Y/apmFfcv94swlECQs9yOyjqZZ5TulHw8722Pm+d5KzZJKp5+G+BQ5VgFOQiqD+
	MLsOrR1BXqsgwxyQsjXpAYNgcUepUbWMV5tcknh7uhLHXc6GR8JLn/Mwwl3kpsgJn6W2rh2+Q
X-Gm-Gg: AfdE7clj8w8obxdsBQv3PbMFzxLNpldYTQIdznBHmF5io2x/usuzvTxG8qTYN9gy0jR
	i01AM+6FahYWoTlihaED9jAxbVK2tFOs2V7rE4GPwlXzITpqXIKc0tsMA4ShI3UXXWHg7GZBtt2
	ojgdAVrlCNb7nPRzc5LdeSzJhxPR+U30jUtvpm5L7Vh+XHL9LwkdyKcXDOmveTpH6ZKYG3GnXru
	JlDXDMq+mqh4iErMAUQF+1N2zUO3lO4i4hONQ5BuJXrwnivtVVtOIvQmOXN5jDjMJqqNbcfVE+h
	HVenpr4bGW9ZbbiO2bdvxJVpR4ki+7Bd4HyDL8HkjeRE8X56xc4bbnND8c9Hzaj8QU1k87lhJ8t
	WcZYohRXrO82ChP2L5gxgi/x21sffJRvf1ueWpJjWOOaSd8yhr7iIcfWloS54y2nKBowrVcyh0s
	+FuknUreZXd8RB3kWKzAcFULxy
X-Received: by 2002:a05:6102:33d9:b0:739:4fa1:50af with SMTP id ada2fe7eead31-73da7254acemr1784330137.2.1782997143667;
        Thu, 02 Jul 2026 05:59:03 -0700 (PDT)
X-Received: by 2002:a05:6102:33d9:b0:739:4fa1:50af with SMTP id ada2fe7eead31-73da7254acemr1784317137.2.1782997143195;
        Thu, 02 Jul 2026 05:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d526csm656180e87.43.2026.07.02.05.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:59:02 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:59:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Message-ID: <tdzwu6vvj6md2akfq27xrz6alzxdmo3zfgvwg2m4b4e2opwkww@yriwb7gkbchd>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
 <20260701103435.D6DEA1F000E9@smtp.kernel.org>
 <20260702075442.tc4kbudjbfg75oom@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702075442.tc4kbudjbfg75oom@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: p-2hr4HfvYqM2lpUWJ5QXX7c52ZW9YHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfX3Kr8GW4XpYhy
 0EoobmQqD7tVlU87HF7bBMtigvPThYauynZ9O4gzhxxRYQm4TjrgHahGy39IvmxbovcpiiqRiE1
 jpRMRFldyK6IICVw++8O+MkuVhj+9rhjbCv4tKwnpxTJfW2THsFfcjqbbMxnfU6IJLw76ThxYBt
 hQNaOaOlKkI/ZUe/64XZyrdhC1bNl5WlbwBNsSgv1V0iA4elTjBJIRG5rXZKaBuy+6LytDkx2VY
 xveDepABpjh5rO7AaEgNKL+bOVhlnzeXqFRRXnUgsW5piEyOX+VEdZ6E6r6tES9QZJ4GEJWKByz
 DEtxHF/TjN5TDLp0rBU7/aUIeWRFI4RsfeCwK9RGwa6gL+uh4wQWbtv8Zyw+sZ5izYpAODKtEfz
 FNbN3V8sbeRZiTr9jKWFobkYlYkE5bZRvjhxWYaGfsutx3SpVaYSLLykHzOp37y57EDEPbf5LFv
 Ine9+ZEKdZ9Zxu64cfw==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a466098 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lmjr-25jFlC-zAT2i-UA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: p-2hr4HfvYqM2lpUWJ5QXX7c52ZW9YHW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfX1t8yWcpsMUc1
 ZmPzjXsVkLwQoJIpX6bQ2lVGl+fOyjbQPTGkmyZt2t3kssFk62VMeH+Y8ACTq5ud3hmebFQYmRW
 hW/xO7hvftLO24ApTVYEkBvr7Xm3K8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020136

On Thu, Jul 02, 2026 at 01:24:42PM +0530, Rakesh Kota wrote:
> On Wed, Jul 01, 2026 at 10:34:35AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] The macro `PM4125_VBOOST_CFG` is defined twice with conflicting values (`0x52` and `0x56`), causing the voltage selector to write to the wrong register and corrupt the OTG configuration.
> > --
> > 
> > commit 3778477cc88a05791ed34dc272e50cbdb4893643
> > Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > 
> > regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
> > 
> > The PM4125 PMIC uses a different register layout for USB VBUS control
> > compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> > at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> > a current-limit selector. Introduce per-compatible regulator descriptor
> > data to accommodate these differences.
> > 
> > > diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> > > index cd94ed67621fe..40e7e5589d5b4 100644
> > > --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> > > +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> > > @@ -20,10 +20,35 @@
> > >  #define OTG_CFG				0x53
> > >  #define OTG_EN_SRC_CFG			BIT(1)
> > >  
> > > +#define PM4125_VBOOST_EN		0x50
> > > +#define PM4125_VBOOST_CFG		0x52
> > > +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> > > +#define PM4125_VBOOST_CFG		0x56
> > 
> > [Severity: High]
> > Will this redefine PM4125_VBOOST_CFG to 0x56 and silently override the
> > intended 0x52 offset?
> > 
> > When pm4125_data.vsel_reg is assigned PM4125_VBOOST_CFG, it appears the
> > regulator core will write to 0x56 instead of the 0x52 VBOOST selector
> > register.
> > 
> > Should the 0x56 definition be named PM4125_OTG_CFG instead?
> >
> Yes, you're correct, I will fix in the next patch by splitting the
> defines:
> 
> #define PM4125_VBOOST_OTG_CFG   0x50
> #define PM4125_VBOOST_SEL       0x52
> #define PM4125_VBOOST_CFG_MASK  GENMASK(1, 0)
> #define PM4125_VBOOST_CFG       0x56

With the defines being fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
