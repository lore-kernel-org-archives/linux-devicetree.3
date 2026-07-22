Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E081732
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724510; cv=none; b=h/lxtzuR5r/yuShRrBXJnMEwCDkYaYz56LTef0cec9LSqWB9AkZ7UBcP4rF5Rk4BJgA2GlytbJRA1qKjxEj59y/4Ol0Y7CPFSPvEPELlkQFDrri+7gEVRe4icWNv4K7sHmnl646RGICOsOlRLhDw7x9gFI2QzyRabADxHzU1N38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724510; c=relaxed/simple;
	bh=PBg1/uz5NmZePsIAqZCx26evxAU2B2WDw14xUSgAb+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g26OJVxUC7OE4/mCHVIfso1RTZHWtVxm1ELRzU5fMIDtJTAJtopICiOydNojuOT93c+eejqslBS5YZaj+ZI1oszAVYCTuxf8j/FwL1gFfEZ6eVtCiz2ZcTmMqJU0zhjvGEz3YrvYAh/fluKpoarHoYoWK2mY/yO6PoaaeCh0xYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj+wgzi+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKbskOUR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hj+wgzi+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKbskOUR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xcQk4018682
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uao9eg2tbakTNOT1eWdc7s6w1BztDTxAH9QBWYzc79I=; b=hj+wgzi+moJDVCjy
	n9YoF0H/pw67O58WyTTR1bfV1c0ZgUlm29Q9sYGWvP8ufJlIBcyrBh6XI3zlUduF
	cw3iSkV3phNagi/P5SwOAGmNhIjOrbXOLB7R6n7NwwRU/0oW3/2tm1ZC2M14fn8q
	wx5Y1k1fJoPOf1VwgrllecsnIi+2+TFzB3yFk5paY+r+DeoNTPqEhVAuUGXQ54NH
	5RJZMSoHaD9PRBH5ZRn9+vVDBib1Lt63uMBOvOjF6cMxgNQQ22ykyzoLbKsggi7J
	c2DUR0u37ZcFjHzrvnueY6ZdsbHLDczARn3quY4KBsYGJRTJPI0Br4qtJeRkq5m2
	BAL4Ig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fv3j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:48:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so218444511cf.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784724507; x=1785329307; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uao9eg2tbakTNOT1eWdc7s6w1BztDTxAH9QBWYzc79I=;
        b=CKbskOURnfCkkyVVwsaYTIU930RVIU2oGhOIOTMhRtRLilY/hIqy3KKjQR8nzpfdny
         /Wf07fAsk3dBLpPmopaVxPXQpEUZ55gIj0iICNW0wQTBgt60rFSS6ZoFLNtws7h23Y+D
         wBbn2Q/2GBI8RJOYAkPVmvRPCOGmehpdMhrCWw5JWQhngvZBXFw9NEB4yhGmbXShdEzT
         Z1foWbI+DjF0/sINENcP0Zd9DYPKU6zYDpOVOz3Drt1d/jw7K4xbb/wRlposHp6j5omb
         TU8eosFyAJ/ROKCKzLqw5TfnFQ9jrV/z7Ovd06YqAG2Wdr5e+6ydeqh4gpqxq1PT9tpF
         UY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724507; x=1785329307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uao9eg2tbakTNOT1eWdc7s6w1BztDTxAH9QBWYzc79I=;
        b=elrGdun0IfvX2Nz0hpuD4DQmrFtKXzw5ueL9P9Z52koYXc2FBK3LPz5ZlZyFIGbCHC
         fY1qNkpotUYcPPQa/9HPdicEgjWZgzgl42Pm9l3ijewv9DjdnmTw2loWJCiUPRGRwtZM
         7w8MJO6re/GZMLTYE4hEMPskSMs0BggdLf9dclh/C5en4yPjgRiJ8bRBeD6N9GHzIatd
         7X0zkYFJg5tDFCorDsHNqJdOX/mNRhwH1JQvbPG3GdhK6C3pyoRrts/QkwL44wW9Tqtr
         3k5uCnQQZ9CxKM1g3F5/yUb6hzizkwO3+yXxvPBwDD4qbDURHff2lRRzyeQ4QUd05fr0
         SR4g==
X-Forwarded-Encrypted: i=1; AHgh+RryWlzAnPGx0nne6ivl/fzGJ+jfsEo75h4FwbmpWPFVd0YCnHOJm87etrzY3mnsw+ajFWamSxVRmgPd@vger.kernel.org
X-Gm-Message-State: AOJu0YxX5xsUeZAUf9f9BFGFb5rSUdM4R/umpgwppzcc220jSW9pIENw
	zDhsSdmrVVCfnN5sPBEQFedkl/dhvdq6rOyJFexEyBjkfWLdIq8bT+qfWHteczEGD4T/mntx1Dh
	z0/83vbNtrJa3M6ujJC7nOqDGko2b2ybZ15/hE1Ke4qntlG+wlSfefWVjGgs0GyfT
X-Gm-Gg: AR+sD12Rv6gfDpXir6faHkVb1cyvjb18UJtTWtCqD6T4yOO3nDgDzOczjdqvo/ROiHY
	IH0rBVx/P2XxTRrO5LPZGp1+IRz2gWZ6tLh4jxszBKcnjY7AASBHHywmze1KqHa7KlHuSzfy+Mi
	CuDMUYRpDBZ3zFRwQA8ar9FGLNDCQ0uv2ypWQpkM5g0049NBe2dnZapS97GajVNGG/aSgzoqESd
	F6aRmOzLxo58w7JT8Sbz7AqMaAQFKK4xzgouTAIN9gSTPajn5cC6b4KUQmioO/LWvuKKinhKQEg
	mAEKBwEUZrQEzsPOWxbY87eOdzVlsY4R9uz5yxoTMyV4PoUFV2a/D5QsOTjhnorMr+BMmea5jjs
	6Q7oWG2WuZOW5gqKBCi7QXE4BjvM/ZL1rqdDqUFyzfWwBqjqGN6WD+QGOcz5mPlGhEJiDxmObTg
	yqhGgnbXJgIEfkBw==
X-Received: by 2002:ac8:5805:0:b0:51b:ec6c:766c with SMTP id d75a77b69052e-5213c8e2baamr212831371cf.12.1784724507131;
        Wed, 22 Jul 2026 05:48:27 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:51b:ec6c:766c with SMTP id d75a77b69052e-5213c8e2baamr212830801cf.12.1784724506429;
        Wed, 22 Jul 2026 05:48:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c0a9sm471449e87.17.2026.07.22.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:48:25 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:48:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Message-ID: <k3mm24aumrljzuazzndb2fre4gz3bbjjqdzyfkuzq62tjo7ife@loghlls6mtlb>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-1-60ca47031b50@oss.qualcomm.com>
 <asayt7nocnvfcukrjkkycbsxkgaqxyoqzefejvhbiqgzdaw5iy@vb3t5juxml6i>
 <20260722111428.lfxslgf3fpjggila@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722111428.lfxslgf3fpjggila@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-GUID: p9K5R9WeDtQNrwW6Qn6p4RoX6QKiUVJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyNSBTYWx0ZWRfX2hAYHxHW8I0h
 7tRp8LGgtZlM7kcgW2vtuK0yO6ZH8uuZB3TbJ/Ks9cLD/CHppafuCZoT8fg2dhWblK0TUl78Gf6
 lfZUUj5VBu1yaO7zyowxdEkalrHinZ6HnX/v4ItQU4RZAJzL3bcnRQ7CWvZq+FddYZ05Vp4Yz8z
 mMaymR91dnD+lNxqvaNMRPp24plNJ40dvN2Ttc8nsgZO3MA1OdgyXREcNeon6/2OUgg0lWYVEsX
 OtI/4ulBMTSWRlIuPY6G1t39EZ+h2wsR7ifiR7y6vHebIP9FmuGE2W8qwEi5LQGMPsJiOHKO9fk
 HD0cTslUJr4S1PdW8uFvmRadCEaT9GCFo12QmldiuTHks1tbVNcnSneprKRC0yc5w117kr6uqPh
 35iCOugIgs7qnPSwKmnfPSzZDTgHn6YDGtqCijvCJ4RYvO7s/MfP3DsO5Bd8w5phXHrKg6Jjc9X
 tY3OjH8kFGkBMujj21Q==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a60bc1c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=AfVdJ5UIT5WOFTGFtl0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: p9K5R9WeDtQNrwW6Qn6p4RoX6QKiUVJp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyNSBTYWx0ZWRfXy2rBsj+NoKM0
 wQ33OXfaYfI3Y/u5s32/bdEW3ZH9GuVWPHpGGDmGCOIwOgNPVDSClO7HgbmC5Ir1YS6S53fiZSB
 QnfGOevQozDqJ8QyBKdvBvFHejTftBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220125

On Wed, Jul 22, 2026 at 04:44:28PM +0530, Rakesh Kota wrote:
> On Tue, Jul 21, 2026 at 03:31:11PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Jul 20, 2026 at 04:25:04PM +0530, Rakesh Kota wrote:
> > > The rpm_pm2250_regulators table hardcodes supply parent name strings
> > > in the regulator descriptor, causing the Linux regulator framework to
> > > look up and vote on parent supplies from APPS. This is both unnecessary
> > > and incorrect for RPM-managed regulators.
> > > 
> > > On RPM-based platforms, the parent-child supply relationships are
> > > managed entirely by the RPM firmware. The RPM ensures that parent
> > > rails are maintained at the correct voltage with appropriate headroom,
> > > based on all active child rail votes across all subsystems. No explicit
> > > parent supply vote from APPS is required.
> > > 
> > > Furthermore, the supply rail connections to PMIC pins are fixed in
> > > hardware. The previously hardcoded supply name strings were inaccurate
> > > and did not reflect the actual physical pin connections on PM2250-based
> > > platforms. The correct supply relationships are to be described in the
> > > Device Tree, not hardcoded in the driver.
> > 
> > Last phrase is incorrect. The driver can hardcode parent supplies (and
> > it has been doing it correctly for all other PMICs).
> 
> Acknowledged, will rephrase.
> > 
> > > 
> > > To avoid unnecessary APPS-side parent supply access while still
> > > allowing correct hardware topology to be described in DT, set the
> > > supply name field to NULL in the regulator descriptor.
> > 
> > Why is this touching only PM2250? Should we drop all parent votes?
> >
> 
> The fix is conceptually valid for all SMD-managed regulators, but this
> series is scoped to PM2250/PM4125 which are the only platforms I have
> tested (Agatti, Shikra). Happy to extend it to all entries in a
> follow-on series, or do it all at once if preferred — please let me know.

At least mention that in the commit message. But if it is applicable to
_all_ SMD RPM platforms, would it be easier to just mass-remove the
rpm_regulator_data::supply field? It is relatively easy to test this on
devices up to MSM8916. If the stars are aligned, I should be able to
test it on APQ8074 too.

> 
> regards
> Rakesh kota
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
