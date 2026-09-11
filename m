Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D7387371
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103809; cv=none; b=I+etAn0jXJuHzuTcFfRVmwPGnZVFQBXArMofDHMzzQFJQnhT5hH0+NTeTUJyb4l2pzQKjLJPR8wd0Omsy1gm/G1Oe+X7nVg/+ze2AgaMxNcu9JIz1BRKsuP9Jb9f/Cc5TMSd884B8VwPIk1b5+r42NrnHufV+E/tokWZfJzkxjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103809; c=relaxed/simple;
	bh=IJGxG11SedgJafHP0v6s+rYFOYfVyhevS6Ux1lKx16s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkUJh6X30uzoP4qDiJYvtIz6J6ePWxfFzGlLj/7hIKQomHmUdD1xsNk6iIyn8Sqg/vrUPHSIYSp+2J971Sht1XFHYN5UaPd2LtWo5j8fM6ctOPZq1m4+zYTSVoihFULahK084hPlibAhKg7i5dzQCHmJfMvuzrXeNtLbIVZcsfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY8P70yt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z17zcFlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY8P70yt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z17zcFlg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vhXj043255
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ldCwAmi62bta0bScl7eF2OOX
	IpIyCV8KCS8Mw/m2xj8=; b=MY8P70ytevYKZRTZKipeZaYfAlEgnquIQ7yvefr7
	qQ1AnZ+R6+/o3G6EnARX2+xXjtR3JczsmpQbMNX7YkygXNVRaAxtOVViG1NJY443
	Hjsz4w4r/ZqYSJrNrJX/L0ZLW46+66FGGmltRqsCiSvlPve99Lwjt5j1FYi5WH+q
	X2JOSSCD/GSdd22hYsCKt9zCGnaTB6K/ZZ6LTX/6/BR1ePcUCOj/s9hXHfHHVR9B
	HQ48mlHZDF+daGMHrGmvLccXoJxN+MWFKmW7S4JjX87Rou5MyjDkHlxgWRa6RIH4
	lux1Hx+L4qZ0fe5pggjrhen4FRxwEAy+9OnFxAwXqLPU3A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxnvb5vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:16:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1031069a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 22:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789103806; x=1789708606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldCwAmi62bta0bScl7eF2OOXIpIyCV8KCS8Mw/m2xj8=;
        b=Z17zcFlggG9b09UusmnF3dVdVMxD4P5BCYONgvFg5C6iwMlF9yW2vJEu/PUC5lhuHC
         RjovVS58TOIMDBTrlTZ3KbkyXPFCMeSqCNK1tgrtwBb3YLRkvy5uruYziHO79lliEtZ6
         5ZmkZmkVnmeUS7panLPrQT5fXlhOhIZhlyOURh6sw3a/QiUXajjrbJE0K7Qir2VBiE81
         3paVAM1s70+aXGBU3EQhUJSnVizzC+SmKqYgIPDiGZGUtIruO/AlEDJ4Q9SNMwZIGY5t
         wba164omzh9WBMVU4hMjfqYYBNkuu6yJrmRIYz5feRZvSN/a5AuOFagAL+jZlCrzCT4J
         6kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103806; x=1789708606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldCwAmi62bta0bScl7eF2OOXIpIyCV8KCS8Mw/m2xj8=;
        b=iSkHOMsZ76BVVEH8beLDzRjLAyfrywMcvWs3q6/WCO3JnhFnL1V9LF2wqiCjSQQJo2
         5qGJJJEEvJb95G0jm5laJAgt+4EoPO/sO48h6ydqicTW8cx1njGM1B4k+Bom58/35x0k
         szOL2KYtm8yhVjaBkrjtgejKU5T7gesk6ERlnguR/v+kgT1YMApEnop9t7FsbwlUzpbr
         Nch8/TSxoE6L85Rk4Dv91CulGi0Q1mS5uZGpZgSJtmmSz31NT78MueH1ksamFHcyydnH
         NPffAwYDK5nKiS7LqM1kMOJMVqAggbG4rQEQmWtGvGNXczdGd8qXJPxgN4cHt0iRtwt1
         jriA==
X-Forwarded-Encrypted: i=1; AKwUvBzaXBDyAckOd6JJ7Y778q81nQycjw8OslpvpNmm48v2xt9Sxwye+nLByq2wMXiG5Hn09WeKKVhj4VpQ@vger.kernel.org
X-Gm-Message-State: AFuF++nf0XkS92T7w4VN7T04IdhOweSfJ+8QstSguYB77Xs3WdKissas
	pjS5PJpdszoI13PFTxbDFIG+t2DaSNmOD1/QcQG7xRQH4FSJw6jEguAbFOOqgfRrKlQvixbApi/
	HdbvqP5xEr1JmHjUaT9ZK1Eb3Chrv9BWOzYtVkut3nIm20AmaKzAvZ/YGfDgg/OVD
X-Gm-Gg: AYBFou1LboW6AoieOh6vm8/NL+Mo/rlHHHPoYLMpEDR+Rwwjc1s1LNbOX/7R7CJvnYY
	drFxsbUMV3rQX85h5pl/6pTXlzzRWmZR42c47JKQCI6IAzrWYuDnxINLWFvvvalJGdcN4Yrwpk/
	4VCDQcm/rsdX412jUMjwRpxO3W2QcUdehBELKH7ku1MrTtaCHp238IJU5/Srs1Z+QaBF3mvruqM
	hS6vZAdunWVUQqGuEBwYKodg3j+sUMFVEBwqiYIlcVvpuxHsqNL+xvGQ+4SShMPsUYYZ5bIqXfq
	jHvE8ywg9BFpzZyfafZlJsuYHOzwI4i4J1X5wV4h8RvQgKn5UGa/AFriNHcmkXuYvB1XGZb+yLb
	n2bqVpr7ll9AZByKM0wmEGkIYATYRuWKr60H0
X-Received: by 2002:a17:90b:2549:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39d9c227fc1mr3807644a91.17.1789103805690;
        Thu, 10 Sep 2026 22:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2549:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39d9c227fc1mr3807597a91.17.1789103805142;
        Thu, 10 Sep 2026 22:16:45 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm3419325eec.16.2026.09.10.22.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:16:44 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:46:37 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Message-ID: <aqOOtRE/FMYpZYvD@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
 <20260907-ensnare-wanted-e86eeaf770b0@spud>
 <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>
 <20260907-showroom-elevation-ba1a0792b7f7@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-showroom-elevation-ba1a0792b7f7@spud>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA3MSBTYWx0ZWRfX+5DWl9C7K/nn
 wlcZsIxMroXZXNirMH4yEIcbhX9GyzZ11gDOZZa/8HxX8T8zWaG18J+pYitGfC0YQcFLVhgrBVL
 V+K70YHryeTKkbH5tocyPb0LTlSGJ09gk9rb0vuzt0heddZzdek1B2dg7OU4WQREeGFnKA/IuR4
 vmzOTh88WE/kkujj5DK+Lm+L60tA3ulRbue7cegntGRl3FMasIEgJ1/2a92biEI1LAVu9kuG+9M
 4MAq77VrdFzuCxkwTKLl0VCEq1lMJR5O+csegmb8NhQzGs857kTbDCqp15mhZ9x5gOcsID49kBo
 7tPpelTufbMdODxHD1hFxa31YfmHbcqHzpkDD3wRZRGQcCH8mjbgKQh53UPwJbpZYpyg69buZ9p
 OwOPTX2uYv1jqbHevlyq+8cgWAqUd4WH0vAXgXYBwK8cW/KsSAjvArvfqov7R0eOmQ8PKFPK/A1
 SOB9kc9Nd5sAT7FyCBA==
X-Authority-Analysis: v=2.4 cv=RsxQvymK c=1 sm=1 tr=0 ts=6aa38ebf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=oNE1GLUy8bkFCx8mVIwA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: mlWfreDXUjwB3a2EpUp7KlxALhR-gbpM
X-Proofpoint-ORIG-GUID: mlWfreDXUjwB3a2EpUp7KlxALhR-gbpM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA3MSBTYWx0ZWRfX/oZwKrp1M+CM
 +ajAW0+Pa1pFN4bMFH1u/Xoh9iKuQPgBjgzCWYcwcmEDCnbfMd0d4p1MxSB73TTF12s17HfUdfc
 AOINvETxYLC8NpJ9IofAhnMnngLvA0k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110071

On Mon, Sep 07, 2026 at 07:04:21PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 06:09:57PM +0100, Mark Brown wrote:
> > On Mon, Sep 07, 2026 at 06:06:24PM +0100, Conor Dooley wrote:
> > > On Mon, Sep 07, 2026 at 11:16:08AM +0530, Shashank Maurya wrote:
> > 
> > > > +	vcc = devm_regulator_get(&i2c->dev, "vcc");
> > > > +	if (IS_ERR(vcc))
> > > > +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> > > > +				     "Failed to get vcc supply\n");
> > 
> > > This needs to be optional, because without it you'll break existing
> > > devicetrees. Unless you can explain how all existing users are
> > > nonfunctional (e.g. nothing ever enabled the supply, which seems
> > > doubtful given this surely worked when it was added) this must remain
> > > optional.
> > 
> > The core will stub in a dummy regulator for mandatory supplies that
> > don't have anything mapped by firmware, otherwise essentially all
> > regualtors would be optional and our error handling would be a disaster
> > zone.
> 
> I always forget how this works. Thanks for the reminder.
> 
> 

Thanks Mark and Conor for the clarification.

To summarize: the binding marks vcc-supply as required 
(since the hardware genuinely needs this rail), and the driver uses 
devm_regulator_get() which lets the regulator core provide a dummy 
stub for existing devicetrees that don't specify the supply. 
This keeps backward compatibility intact.

Is the series good to go as-is, or is there anything else you'd like 
me to address in a v3?

