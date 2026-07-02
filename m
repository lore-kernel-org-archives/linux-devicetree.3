Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C22E451047
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992983; cv=none; b=a7N7M3V8tZ1yCwSEGGXO7+6CYo2i+uBpdXIoiCxogaWdzQFDoF2PUgi/Sz8FsKGg6lt2bXXoJb6sRAmgL9VjsrjUx1iBJViUGszTWLxqvcn+icraw6++Dn2aiT7W3e7MdfqROEC8yjFhM7zsoT6aJWELDvlJsk1BOoMKLON8TrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992983; c=relaxed/simple;
	bh=rpKAe8dPCwr4VAmvOu6roGpeUIvUI+iDbjBX67nG+NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDSYAVW4cv4bEbtdJ5604WsjRfo1O5WGJ10UgLmKjTcPJXXrgnz5SXPSDnTQcmMyErnaRtVtnPrrxgAFeQUNcCbs1Ia0s+LKTkIaaY+xoHfzTwPH9uSAP7L4UMl23WSPzCjs/+8mQ66Wni6xREwRupiohxo0hHh8lmmfMlBIm7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErUM/L6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVHra4xO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErUM/L6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVHra4xO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sTgn4172791
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 11:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upmYTcdh4plyAwPWdRv+6/jBs6VO3B/KEZnt0DeG4kA=; b=ErUM/L6mdqprqKRQ
	cQs3FUY/IofhUKWUVx2eovT1TJZT2iGFcebOwUBXSvWXnO26vw9CVo58V5VOeMJF
	wq+k4fP/eraS9R+IP4IZivcgVRrWcGSA3UKPKfaz83Bdsn7IwNaDfG4e3OABPXOp
	4iJKrE/Lkf7ixp3zBcqPw8qJY0urUFTcxcbnspu9x+6c0bIj6XCfAEDpDapH0pBR
	FuP0ws1k+xDugiylOSIFG12xRCrl128Q986KWdEY+6spIxOtPTz17koeWskWsUEb
	RlC5iXYLj3a/M9mdPCHlqdvhRJEbKpjDrnCnAadqqd3mkdDz24BbBbaaKkA5aqTM
	7dw7/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwrn66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:49:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so224063685a.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992981; x=1783597781; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=upmYTcdh4plyAwPWdRv+6/jBs6VO3B/KEZnt0DeG4kA=;
        b=CVHra4xOmo1kgnMN56rIShQYjH+PYPBdY4opkUWMGjonyv+DVpP4nX1JaLFlzPHNYL
         2IIweEknGTKlziGZbXXnQlUL+K7p/2e768Jgjx90zCxdUcleAyCgdyEigllk2jY/5tB1
         SGD/MfnUMKI0IcRKAagFq8xSvx8fLMnarjEzmQpRNhryMXqHS8xDJB9uRiUcUQUhV5AS
         X9JF/3IRR5xHDfyLb59Lsf7wQkxKGANxkwEexKSZw3nB7vIMNX/enzC4i/ko8pTT7N7r
         M1EtcV95gOrbv/n707H1r8sSsszIwzQBrhdcaDy52ls4sUQQmkf80S+M/zSgpI/YjCao
         aEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992981; x=1783597781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upmYTcdh4plyAwPWdRv+6/jBs6VO3B/KEZnt0DeG4kA=;
        b=GVX4yBR+C71BrdFBWLaplLIA7UiNioOi638z69IOAhwrQdSGSpLsK310hz6G4SZPaD
         eFR0DuHf54ZF2M7bD1giaU5qweeism9Bb7wFQ09d0NdfgtttlEGwpqOCRU44Ywp+JBEb
         DiK1Npt+yJ7trkzvc7FJBB3QAi8+xkAIZaORZdfAi6dtQpmDjepZ82X+/+OB7muv4Jj4
         6C2mi0/qVQFyBlRmqPJ3kJq4ie4WG+HScgqLyiHgned/379AXU4rzDwXqA9WO++0B93S
         as8gcr/dQTG7cf1hO/xD++gf9apQr415s0wJGs1mYaCObZhxb7nTufZ/fz0wGnOErSad
         Jj4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+nR7sw+Z2VHeeIVAuuLCQeHVWV+FwfQReFkuJQCHZw4vR4w6j5CVnuY/XR05vF9f3JUTnMsLgSWYgm@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnKpZpCo6UZkuAHs2BZXwmR1Btqzxe/1BVnRUC6iKcVSm8245
	YTwjs1sHfegWJoxg5chWL1ic9OlDGCi12zCnMasn6XTCuTFE5Y9XP/BkorG+YY+zKHgT2XZReSu
	p1PM6gGmQQM3doD/zvanxbu0EUAszXN/4nwriB47oocltLG8wVLiBXUp/pzv3Mwur4k6n6egK
X-Gm-Gg: AfdE7clVnxJroP9TgnNblxq0ABQ/v9gXiRcF/R0nOVImTBZ8b+0js697L6wISdN2ehI
	9TPA/DhOfPIe+C3no44lZUWm1SiapPvQmlJgWHuxCsNgRy0+PmQJgqFHJ5uKIoQm3vjsA7Jn/t2
	Xa0BLK/hHZREDrLyD2xSPmuaJCbkEfAEpmvxjGqtZiqYU5XlRphYtzIpx+mHOHzAKOZe//79g4X
	ZGob520GHG0RDnIZ3uvD0zoRDbj1UsnCZkHtsgXclAyR+usMPIKcr0w74ANK5WMvx0v2oWoZVqu
	/Z3JS2S7MVFE0B5W689WkMTPgm2R5gXSbETZ9DmQmCtz+rp0rFnq7fMVY3VAI+chwWfe80QEmyG
	+NPP80Sd4drTiLiS+Q9lCjn60R5QXYrGhwJYKHW4JHZmvIokcBOEBRoy7LpYl60esJdXM8WHHcm
	3xt5m5Onjvv8a/o2guR6myTkkb
X-Received: by 2002:a05:620a:1a26:b0:915:cb40:f76a with SMTP id af79cd13be357-92e782c44c1mr840351685a.39.1782992980765;
        Thu, 02 Jul 2026 04:49:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a26:b0:915:cb40:f76a with SMTP id af79cd13be357-92e782c44c1mr840346585a.39.1782992980234;
        Thu, 02 Jul 2026 04:49:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d52ccsm623900e87.40.2026.07.02.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:49:39 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:49:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <dqe3ntmtmjqixp2l5n7qm6zpcwh4sizr7jd5g3cl3tzpvl6tvo@casnjg3orldd>
References: <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
 <20260525120139.dyfnm6nwfzuoxd7p@hu-kotarake-hyd.qualcomm.com>
 <20260702113010.zjrk4kr7fpjp6asj@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702113010.zjrk4kr7fpjp6asj@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-GUID: MT-tNKjeGg52RB3Yve-aJ7jyuh6-X5I5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX3cftOIZRs072
 Dde/Q57s/My2qX6ZCOISYFnhdg3roiaXj7j9EV1oFbozV/0FAwlyHBahWyTuNheDdEXjlsCtcI/
 rUIS7TwX8IQazc4HKRfTR0eoWBU5ag6sD6VNNf0qoYpIp/3VzgQIu/Ilkjh3HwxQjuODi7XqBPL
 WJ6+3ALCw3vs7LY218w0VBFEyjcYOXcgsSyWiG2rKkof/Zo6qKk6ky5j5rz1dUWQk5fOBCZhi60
 leVTTovKZQGzLVg3ievdgQRXlaTHK3bwv73J4ild73vp6jXAeP1B0Kx1gvVRqOn8PnMwACQRVpq
 Q8haJKdgbK/qM/znZ+MCwKQ42QazjPiXwSNE1NjO0FWbXEjsnN0e1CpcITTZeSd4y5tSqHKzSxw
 Sq9v7d40s86uy8UM24O0yPNFP28LrIA6cpARJ1LusKCG1Rp+Jqut/o27nAL7NJiHnxmztQMBXu0
 VsRI8JAapz2CzOnsvxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX2BeAaItlJ8nc
 0bPIv/4gSNBH3bayPxSqw87CAsA01srCi1i2hgIQt/NGgrvm0ZeGbU4sui2xeeOQwK/rMgdQLEV
 xH3RazAc5sMN0CKP7RwDpZgSQyhb2Lg=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a465055 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=s3MLSL2Rv04tJSLU0-0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MT-tNKjeGg52RB3Yve-aJ7jyuh6-X5I5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123

On Thu, Jul 02, 2026 at 05:00:10PM +0530, Rakesh Kota wrote:
> On Mon, May 25, 2026 at 05:31:39PM +0530, Rakesh Kota wrote:
> > On Fri, May 22, 2026 at 11:24:19AM +0200, Konrad Dybcio wrote:
> > > On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> > > > On 21/05/2026 10:46, Konrad Dybcio wrote:
> > > >> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
> > > >>>> Since firmware does not have a way to dynamically tell if it on a
> > > >>>> debug-board powered device or a DCIN powered device, We are required to
> > > >>>> add this new DT property.
> > > >>>
> > > >>> Neither debug-board powered device nor battery-less will have
> > > >>> monitored-battery, thus again, why lack of that property cannot tell you
> > > >>> what you need?
> > > >>
> > > >> A device with a battery will not have a monitored-battery either
> > > > But why? If for such device property "no battery" is suitable, then for
> > > > me "monitored-battery" is suitable as well. IOW, if you say that having
> > > > a property describing batter is not a accurate hardware property here,
> > > > then neither saying "no battery" is, because no batter is basically some
> > > > sort of battery (just like empty set is still a set, empty array is
> > > > still an array).
> > > 
> > > The battmgr service running on one of the remoteprocs already has all
> > > the information about the battery and it also handles all the type-c,
> > > PD and charger configuration, only letting the OS know about the
> > > results.
> > > 
> > > Hence, unless there's some other hardware at play (e.g. for custom
> > > 200 W charging), which wasn't fully implemented in the QC firmware,
> > > there is no reason to describe a battery separately, since the OS
> > > can't do anything useful with that information
> > > 
> > > In some abstract way, perhaps monitored_battery = <&pmic_glink> could
> > > be thought of as valid (since that's the data source the OS gets to
> > > see)
> > 
> > Should we use monitored-battery = <&pmic_glink>; If so, would it be
> > incorrect to mark pmic_glink as simple-battery, as that may cause the
> > schema validation to fail?
> 
> Hi @Konrad Dybcio, @Krzysztof Kozlowski , 
> 
> Following up on the earlier discussion — is monitored-battery =
> <&pmic_glink>; a valid pattern? And if so, would marking pmic_glink as
> simple-battery cause DT schema validation failures?

I'd say, no, monitored-battery should be pointing to the battery device.
Please fix this on the firmware side, so that the firmware can report
having no battery at all.

-- 
With best wishes
Dmitry
