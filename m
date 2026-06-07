Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E318314A8D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867278; cv=none; b=Vy5feb0vaC+7UUiiMN+uf7DY/zK4WJV9UKczLqXuDa1U66qZ+zJ2I0/4L6MmdjXwmL3qshw+2U6H90REwxTenhBSaSSQuDy5y8DWBvys2kJfqLqZZFBBv89v2XO6l2ykYTxqn1qF1189wmbLOjsHoQwoeQRACAUP2yyRAzaOOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867278; c=relaxed/simple;
	bh=fVzbXV1sJy1UmP1P9U7A4Ziv9bNeyp5SHeVOnyh3NSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMfDXoOgN8LU1s5THri6cxeAru94xH8WYtnI1MRYaCr0QWp0XgvUmrjRoQKiVjnYR5E729U+HTXkCJ9N6rW+l81A7gBagjsYUk9p3nxs5Fycx43itslfQCxxwbzqcXLAz4KfOL7KNMu8G8lauY24K+Ng7kXflx+4U138CNGk3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoBYGD2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHZ4fN9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PoBYGD2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHZ4fN9J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElIO5375677
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RjXOnittLSMDSz2P7pBPezWxIO+sHJ7OAZbuYVjtW0=; b=PoBYGD2+IlZ3hjS4
	+rnDZ9vnHL5KSAKs4bqQG16TfJvxSqp9dGqUGrHXGVHbLn4nmTjXoeLUaMh7Qdyb
	m57i2FVDuGS4ZdzfW6OHUf62aqoJqVke8iWPNA4S29imjAJEgFb4qQTnNTKU5LIl
	xOU21xBOIPjR3SnR6dVJr+ULMwQOBMbQVQbtGtq1/L8mb0FWdSJzlSO79wQrOR4Q
	+EZ81WXeSPqJNW0ykmg/aFbuHmjMPQP+gYldOoKAngvet5cJkacemy5s6wZmBGsb
	m1o/CTJVLL3iwZCo/hLjW4TldesTcWjB3kPLthnrF0X5dRHbWCGnJFNWvtvwc3xs
	c5wwOg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvh4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:21:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51776d4355cso115758311cf.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867275; x=1781472075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RjXOnittLSMDSz2P7pBPezWxIO+sHJ7OAZbuYVjtW0=;
        b=gHZ4fN9J8Ymc+exGy3ilOsanOl37BCTko5baNJf6kR1sE6dEK15KG/A5r9eDJWcp4N
         oVR9LBtJE54h4W1R6LXyuLwcSW/Nv6dXucZAh4cvvjXeTsxbxygc/Je0EKDWOkFr0pBG
         by7cXaOVCx8hrJ0PSSwsU7MU7EiEAFoMNKKVFdK7GxdnUXoL/UtdCNozZ/xDRj668yLw
         iGN1utajEsQi5Jty7KYUlp3cX2frWpv69H0irgsKrYd2cUfgad7RCxQAv077qZml8iOu
         Eud5VdJAc37Ezgk+jnJCNajncmqrbn+QRTd7csyU+daE9XpAzIrHLEAT3TiaO5ttxyBG
         pThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867275; x=1781472075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RjXOnittLSMDSz2P7pBPezWxIO+sHJ7OAZbuYVjtW0=;
        b=Vnse/G7IgJni/zo1cBqwxtNXwL47R2i4/KuiuDCxqMj1LtT1Mj0xCuh/cXCfCtUD4f
         oPl3KBxnFJMmtD4bmOjQSsfBUkQrSGy/zPNSf/BNDXhGr6M2Xls3DqI5ve0qWc6eXs19
         NNL3rMzS2MEn3YcekVIcW3MhAsj9t4TmHl+/SgQz9kToydAmuRl/zTpoPldUSRGMYjP6
         aicJMtZ/aZOxKyagd4H9r04gDeG4IszpULn0r83VPW1cBLgH9d01QbdokJq9Bdr8DkkD
         vSMuktAnLqu6BAQFUSi1NZiI8jbQ4JqqTdmVgDYVI7xftfcDhrndcUcsV/SMfMbi68Tz
         +C/g==
X-Forwarded-Encrypted: i=1; AFNElJ/z4MaXkINs3a4j3F3I/an9ufEaZER6BR/ffzbVqRQE2FKCwPfe1bJMEk04xhUxwPDgAy6enEnU8Lj2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7If37R9HdDO5Y5ZERD74aswyri/+QGusOpvclXLk8rvKYk5gp
	mWUBGvLoB6qPKubx8Bw+ps8ygRsP5/NVhknDXNaOhcJMNMklfvqxFS5MpEOT9emkhPFfE0In2J2
	EcE2ZfOoEb4RGIRRGsGGebqIkqn7BHZgD/ri01Fk/AYzD80cY51AR40vekJEO63qq
X-Gm-Gg: Acq92OErUjGQQBRVmNTsEaLx1R+u0LCXOcQTv/7FFEb43Rwy0ORNwBfUYTJ8h/KQyhS
	O07n7fGehmPymJegkTQBUyuiaxx71qBDNDAjQ1d1h8JJImrsHjp4OYnxRufO4goM+BTm1NcR4Pr
	kz3SVRIhu08d+nBi9IopumzerFPBg4DDwca0Ps0k3vkAxKIoHXl3sOcQ6EhsWzgUQYeUK2fDyMr
	2TK9k5kcS82oz7//4FVGiRhZb28qDC7UZ6LEvN8733/l+7iMb4QqJPuR2HzENJBCfUZv3sTb40f
	kOsLWAqAv1EvyMQw3WqCD/hDVwx4CneFB5IzCKBd40hU6gHivKQnBNCIyrl5LfwbQ/YLW0gkTwQ
	FlVpxePWdo4QzDT7+9ilut+X/7YAOLRkuhkn0ZLqm6Eeno+4SIGmmojaHhgVSo5labXAfaVtdSD
	+hUV42bbJPJRz+IXHL+3UxDS8OrYLnl3WQBJYwKJuwvQiNZA==
X-Received: by 2002:a05:622a:4d88:b0:516:ed2c:9c75 with SMTP id d75a77b69052e-51798708bd9mr128205301cf.16.1780867275497;
        Sun, 07 Jun 2026 14:21:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4d88:b0:516:ed2c:9c75 with SMTP id d75a77b69052e-51798708bd9mr128204941cf.16.1780867275013;
        Sun, 07 Jun 2026 14:21:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091b23sm41529891fa.17.2026.06.07.14.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:21:12 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:21:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Message-ID: <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25e0cc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=I5036ZPCcDZR90z1f1kA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KqxsKkPVYlNRUADDG-LIWwufVWFsei41
X-Proofpoint-ORIG-GUID: KqxsKkPVYlNRUADDG-LIWwufVWFsei41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNSBTYWx0ZWRfX71DNk7ogeK7q
 ZfE1CvWywqY+axZvYgZbtMf2MoG3QvLz62c4Htuguz5kci6k822mjuziagS6rORZNDtPYN91Cbw
 Wheag8/rw83iZ5YmTEf4k8KaSn6RLRpTp7QSMlclMT6aGicOCQpHmJFjKNur9GR9DGL9OizJWdg
 HxEH2sUtSi2J7KxK/ost5LGq+zOPYMsWMDvfyR2lSNqA0KYv5PunSKaKx2vfHhQjhkMzO43NZUD
 RA6WGWakTTKgljRlrF5TCIXwFTOsEO7nk93lO/Ise+1N6iiWqRav8SBHF1LnYURjm4se6i0aEKj
 JmThNaflnmQhohPxnUEQMtuwDBgOmxeYq/OnYmROtKKY6xo9z0k4Ga0O/itTrDPvgXExUHpUVkJ
 U6y4l5JfRb6uU/3RIBh9RzskRyODArhCGhB9NXDYuEIlutTR5NS6dAJ7f4KRjMBgodWVudObtnn
 j6OMyMIofEE1yjRIEGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070215

On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
> 
> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
> > 
> > On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
> > > On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
> > > > Currently, the RPMH driver only allows child devices of the RPMH
> > > > controller to issue commands, as it assumes dev->parent points to the
> > > > RSC device.
> > > > 
> > > > There is a possibility that certain devices which are not children of
> > > > the RPMH controller want to send commands for special control at the
> > > > RPMH side. For example, in PMH0101 PMICs, there are bidirectional
> > > > level shifter (LS) peripherals, and each LS works with a pair of PMIC
> > > > GPIOs. The control of the LS, which is combined with the GPIO
> > > > configuration, is handled by RPMH firmware for sharing the resource
> > > > between different subsystems. From a hardware point of view, the LS
> > > > functionality is tied to a pair of PMIC GPIOs, so its control is more
> > > > suitable to be added in the pinctrl-spmi-gpio driver by adding the
> > > > level-shifter function. However, the pinctrl-spmi-gpio device is a
> > > > child device of the SPMI controller, not the RPMH controller.
> > > This replicates the story of the PMIC regulators. There are two drivers,
> > > one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
> > > driver targeting only those paired GPIOs (and we don't even need to
> > > represent them as a pair, it might be just one pin).
> > 
> > Thanks for the suggestion.
> > 
> > I agree that adding a separate, RPMh-based GPIO driver would be more
> > straightforward from RPMh control perspective. It makes the new device
> > as a child of the RSC device then it can naturally use the APIs for RPMh
> > commands. The main challenge here is, we need to make the level-shifter
> > mutually exclusive with other GPIO functions when the GPIO pairs are
> > used in level-shifter function, which means we need to write SPMI
> > commands to disable the associated GPIO modules. I am not sure if AOP
> > already handles this; as far as I know, AOP only manages the
> > BIDIR_LVL_SHIFTER module registers. Let me double check on this
> > internally, if the GPIO modules could be controlled along
> > with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
> > 
> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
> registers, it doesn't disable the associated GPIO modules. Also, I still
> have no idea how could we make the "level-shifter" function to be mutually
> exclusive with other GPIO functions after moved it into a separate driver.
> Do you have further suggestions?

So, for my understanding, we still need to write SPMI registers to
configure the pins and only then AOP can handle the level shifter?

I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
being used by the normal SPMI driver.

-- 
With best wishes
Dmitry
