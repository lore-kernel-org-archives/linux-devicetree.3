Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87C5331ECC
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782399439; cv=none; b=klHzHgQbTpI5CTN92XPaNo3PImYcQZZE23VWo13wnuh1G531Kbhmpd0CoUx0vWC5OEn1/9xzmYtYhDB6iXmkn1T54suR6VHyKGi2gY/acTaBe6yTHQyEuu6AsCd7qeyq7OLVcUCczCLiT1KwpEWPBFbAJqAD6ITBq88OZp2r240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782399439; c=relaxed/simple;
	bh=065h536r2fXHOQA0ZoGye62/IvaA9zuk5pQhKdLD4cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCosFoQpWiJ0B5CHDuI2ouXb3nclDntWoN+MVJSDkQDhjOl+1MVb47dyef6SU3qjxHpKJvIL7tTMLDRTiwPWnWEm9+wa8Zgbdlo3iMHKsWMAirs2R+AJeYxzqQdxbi7KPnRYB5iyCU94Ztcll0sADF973k7X2vaK2n+ltRlZnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+ZrwLga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdgyZ7kR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+ZrwLga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdgyZ7kR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kE7l1948648
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKWgD0sBMNUtkFFE4sZvGRi1NDevsu9SawQvBGWT1vs=; b=A+ZrwLga1JQAcf3a
	tXoM7WKfE5gowj1geHsrAklZ8vFrVpD23OHdk+MOvWVDiSvfGZFbsVUOL8wU9iq5
	vrrwpdPIF4y3Jn/dt4+hpCU5EtCW2y4Za96QAbPUhmKIMhc5wKi0LPt+p6vZiNqJ
	Qzn/V7JeiIFIk09rh3seG/rdiJQAuGidfsIP/45n6Z+O9gjT8A+YwKitRoU0LKz5
	xrzQQjueZjQ7W+VdPZl9yvRmUNM/WdBe8d6VZr9uafVufdiMn6XmmMTuUaaJKR0b
	MAFdOloKEA0dDKPtE+TtJQZQPfSdcIAkTwGwR/sLkhI8yImId66fmj1XDw0kfXQX
	0ixsFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8svf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:57:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9254309dfd4so416569585a.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782399437; x=1783004237; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iKWgD0sBMNUtkFFE4sZvGRi1NDevsu9SawQvBGWT1vs=;
        b=LdgyZ7kRmwCeI7BnuxHEIrN++OQOcXp8plNBCFH/StooZPN0DSWgQz4m06HNS0n60p
         lszmJ2uTP0qFUwODdIOJ7XKUTubbf9SEIAgiK8VAZANgZudbHFpmltzMrWWvAZ7kf1aY
         EY8Qx5I9EKhNztMR7Mr+5Ny25UZvKlYnPwRHslIO4PEdZ7kl+BV3SDJrG1fN8fp74QDl
         ue7W0CvwnuKBlP+ntqiiaHfbt96ltBIPgy8hbluL11yuR5HZbMHyl64BE6g2ZOTRuxWJ
         0corFA5zXDcdA5MrotF9sCG1iGxGMmgs4GpeNjQATg47YQ2SC8Pi2ws9CtDqyYx8/eEi
         Jf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782399437; x=1783004237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKWgD0sBMNUtkFFE4sZvGRi1NDevsu9SawQvBGWT1vs=;
        b=OVUah8zfrHUV78z7c9cO/UtLjXxrgjii9l42kFKx7jsd5WxfI87ulmjrTCGCBUorew
         0q1erKBixSz+pF8gADaahomYQzwaagqlVSGzNho7AtHX66Q4AmGFd5T1CGdYcZvFFjyQ
         MTTBwlqQPP761b8ucKeba8hEjEcXstLJz7xaFfx2Ack8hBONj6W2ZOmD63+DnkpVKGNy
         oRWodNRO+Nr3AD7THx5Jlxo2+G9ranXTkG6qYm5O0B0nk1mDWcHp/EqabAByq4ZJMR1/
         0Blc9YYlaLzSGto3EyEyzPJcRMyTXl0qGYOm5rswP22zxiodQBqs9onawEo4N0rcgS2Z
         NmRw==
X-Forwarded-Encrypted: i=1; AFNElJ/NFc6+4/DOwVRaYm9pkdCzG1O3PlDJn97/bBfDpp+9hw+wVr0lSTQeR3+ZftjRNsgURFe1uS1+MPx2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6SWS4eOhEhUXndi0CO+RvHR8yUEudIpAav41sexaAWpEGXRdd
	rDWcc0AvTy9N7zk0lEjh4NhoQu8zlagH07M31odtyMtxJr2vOAq7eVSrSMVH+r5ytDQCzM9SN4A
	A65z7jpr/VzWKXPPp+M9Fjm5AXGMcPt3fl9GmFIinnmO80CNVXBF0DCjBoUDpeys1
X-Gm-Gg: AfdE7cnMTz/Dvjazt0f1ze9id8Q6+jzYzeih/nfDU7VL6tqRCFd60TXBc1QXH+vv7Mk
	NOTi5NC/RKA4CdlSk9O4OAyvDSjqNVDZtNpypazVeweD3xY07stGvkQsCwVXrr3w23QAf8Wl3pW
	oSbAeptkxtU3UM8iUYseZJA6ZlwwwZXhcU35iIHZq74s2SJtj7MCxtrXQCLLaRiDaq48Yrrtio0
	d8okR0daCITmVHTryVnOGkz23BoNxZbW8RyQF51gvkxwhhMkZf2kh8gCmnXERxGgmreQ36ino4E
	UY+Zh7L8K9S7BuXmojjCwXQz368Pho2pVEr7ZVboCC4oH/HLgYnt/8VIo+kAXDW+tO71iHvyDTk
	gCHYGIaalEV6j2QsLXWCbeHbq63p/qSDKdVhXQ13Wpo5ShXYQsG6pUgh90H6me5v9AFdindB2VU
	PGfCrUWu+ld2whRFpdkW4iZsXh
X-Received: by 2002:a05:620a:1b91:b0:928:a304:b568 with SMTP id af79cd13be357-9293abaf9b1mr422683585a.18.1782399436606;
        Thu, 25 Jun 2026 07:57:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1b91:b0:928:a304:b568 with SMTP id af79cd13be357-9293abaf9b1mr422678385a.18.1782399436138;
        Thu, 25 Jun 2026 07:57:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ae9cb1156asm1775632e87.54.2026.06.25.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 07:57:14 -0700 (PDT)
Date: Thu, 25 Jun 2026 17:57:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sunyun Yang <syyang@lontium.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, mripard@kernel.org,
        Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v6 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <tpqutwzasfwhraxzymorkiot7uryef4l2n32fyo3i3fp337sak@fugghdkcqfrj>
References: <20260508134009.4582-1-syyang@lontium.com>
 <20260508134009.4582-3-syyang@lontium.com>
 <3188f63f-5358-48d7-b934-af20a8f95c6f@kernel.org>
 <CAFQXuNbKBfyeQL3N3P5QY=6BWoD3O6DSbXN-WMA1rRG9vCs3Kg@mail.gmail.com>
 <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org>
 <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEyOCBTYWx0ZWRfXyLOnRh5tVa9u
 b6V4dXxrte3dRfFjdOlokENoHWqqC+Vmj9qxQO5ilWugcH8d5z+5g05oYc+W+3ggyoEba9ekhKN
 LL+r75dM6QFFk4h66tFLRz2Dn0qzVxY=
X-Proofpoint-GUID: KQ95O80JSsfiB9WDHkMDJkNOdSco2uAz
X-Proofpoint-ORIG-GUID: KQ95O80JSsfiB9WDHkMDJkNOdSco2uAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEyOCBTYWx0ZWRfX2AukOoy+me1L
 A1j3p1b9+5ntE201UW2XPbnPLSId4PR4afTkWmFeiNTNrKD4mtt/8Zmwiad/aVfLAOKCkbZxSo/
 VVDT8ZEVavwW/qaRTxQzA+z1iF+/IkvWhm/kO2ssv96BTbhY2AUO/16o6tf0sx4CpPZHZBaPEzK
 pZYCAd5vo9uoha73/OW7ltHIObt2IJogRn/D7+bPVIXqZFIdGC4Sa4D5jIUopMvhsqis+Hh/Txu
 j/ZRGmEhDnbePdWwVoZCLw0hPrTqQ92WGOpjqzh+VNQKQv6zdhyI5v3xJ+McFXSgH3Ch2hLGYvh
 ndIsXyZclWdeDsUXsW6tEVbzFGyWtZPWb/SkQM9RsmeAzW6wm5hYFO7LlYVymjew4/U5/6qVIqj
 3W3lQRnyO0il9g6u8XNXnVFYWxW/fHSkt9XNBt1iJZ/cNkH6L2cTjNrIpEdEzAgF3J3K9AY3A2V
 2Q72stZ8ZN4OmfLhJdA==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3d41cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=Kz8-B0t5AAAA:8 a=bzQWwWhvmsQFf1HMtL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250128

On Thu, Jun 25, 2026 at 09:26:47PM +0800, Sunyun Yang wrote:
> Krzysztof Kozlowski <krzk@kernel.org> 于2026年6月25日周四 21:17写道：
> >
> > On 25/06/2026 15:14, Sunyun Yang wrote:
> > > Krzysztof Kozlowski <krzk@kernel.org> 于2026年6月25日周四 20:54写道：
> > >>
> > >> On 08/05/2026 15:40, syyang@lontium.com wrote:
> > >>> +
> > >>> +static void lt9611c_reset(struct lt9611c *lt9611c)
> > >>> +{
> > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > >>> +     msleep(20);
> > >>> +
> > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > >>> +     msleep(20);
> > >>> +
> > >>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > >>
> > >> This is just plain wrong. Why do you assert, then de-assert and then
> > >> finally assert AGAIN the reset leaving the device in powerdown stage?
> > >>
> > > I am using software to emulate the hardware RESET button on our EVB.
> > > When the hardware RESET button is pressed while our chip is running,
> > > the signal level changes from HIGH to LOW and then back to HIGH.
> > >
> > > Of course, we can also use the following:
> > > static void lt9611c_reset(struct lt9611c *lt9611c)
> > > {
> > >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > >     msleep(50);
> > >     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > >     msleep(20);
> > > }
> >
> > Makes no sense either and you just did not get the point and did not
> > answer my question. I asked WHY you leave asserted. Answer "we emulate"
> > is just plain wrong.
> >
> > So again please answer:
> >
> > Why do you leave device with reset asserted?
> >
> 
>  devicetree:   reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;

It should be GPIO_ACTIVE_LOW, if the pin as active-low.

> 
> GPIO_ACTIVE_HIGH:
> 
> gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   ------   reset pin
> is Low level : Clear the register configuration in the chip to stop
> the chip from working.
> 
> gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   ------  reset pin
> is high level:  The chip resumes operation.
> 
> 
> 
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry
