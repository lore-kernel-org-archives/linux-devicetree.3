Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BCE4FE2C7
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687870; cv=none; b=RlxAHQvJihdMOfpyanCuLhwOIckwJq+LBXPMaCALdMvtdILp2imaO5boVl9UBW+JZSj1aOo0BfcMe6mfyyPVJPXZ5M79rQvxYIeIX0yoZWDJ5FrIO2C4qawYCI8aZosBHft7KeOf/Wq4Pxm43/Ld0JQGbmPpekakEFkb7RrBJPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687870; c=relaxed/simple;
	bh=9uITES1c+z1LwEDwwhjcHSvT6lcopxRkz7KYTY2wSgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+8O9Ymc/3NWJOik8eMIWCLgP5gXmh8sqn7/6k04Dve+LdJVDarzXN6lG90osUHhgiYHiY8iSe0gUvD8ehn+mIWKenxIXV/Gxjy7suLxmYmwFjSnI9YSs/ib5BNybaGzZ4N+TbM1ukq/2pZO5kF+eqoL84N+hUO37rUnGpgq8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMfaLW/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN8GO+B8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMfaLW/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN8GO+B8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw8M53301599
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hOM6D8WYiBBJwNCJU5OIk+JD
	Q8hRCCk2RfwO7zCPqXg=; b=PMfaLW/YrGuBxy1SB7cio23SoWepq8x6J0tt4O/I
	0Qmp4rots+8j4MIA1GQ1qw3ECR6GcRyMMOqqY4FX7leyLzHoGUHcj3XhbAuNMkQy
	X5lhfjXcy/JnTgdlyTfaG17rz0Bs6bzCXTR1vaZy8yU0LiYEaaJ0YGvwYl9CiWLF
	QsJK7zowDZgO8CMzrvT4fdu1OOICh9R88sj9cA57GzA/o4Ud4Xo5uCVpZzi1Fei4
	SgUK2tu6wyoaVfSZDSQTa68pW0IxF84egKFdmeYpVS1TXopbjQAGhyvs6eiLotS1
	BI4DnZz6kWOu/H25YV2+JEdDDtK1Q8yycEsvslSD3eHHAQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx03av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:17:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b86e46a9e4so285872137.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687867; x=1791292667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=BN8GO+B8n38ORXombr3H7CSiJ98HK10OKxQa0OuySxKFNVidD9VyhmvMUDCpPtDkCI
         2Fkd7O9wfX6S8+LnT3KlSwxpvSiZTu7MIVV+EACZIBMoa1hi2OMkczJVNfMdsQCYauYZ
         FAk4qL6i4t7OmEIEHU8uxWWcwOCZ9mg1IspZmKDPmDk4osBddwggaUoZhtLEhOSeKj5Q
         JVttBMeUQRmnndZXtjpRRxGdTIXC9VDgJkz3Bo9b04WK7RrusDPuCrFkEhmGIceXOJU2
         WB+BmDJbkQpW2/UHSVqMNpMKOmSfBTestIoXL78F1uLXA0W+jpXqKfxbbXfVXgCuu5cn
         SIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687867; x=1791292667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=NsGhLiwhit/2QX5i7yJ52JIIgKuSxD7nbqBPjoccoq1Efs5AFCUUJLbtfSJBFyogAV
         1yptNNR0oAhKlhiuIGS7CslmevYjLez4Ppkx2rRhMtG50rjaGrVZfSVDggswF4DZ7zhE
         UyVustbu8LsZwWlMO2LmpGRcwT387UTIRvejqo5zbamzGMnsJaHGMhaCdD/hOAe/tWd5
         afUAlag+ZztulQaUN11bwHMwNo8FX5/IyH1lLLOC1V/ybzmRTT+PJrRhCaLEhBDYIBG4
         T+C9xmNuKg5fYJUttFeE7quU9+hoHnFcFhEV7+QfzWs70mwXOGVwbHO6juDN2rnAday4
         FmYw==
X-Forwarded-Encrypted: i=1; AKwUvBwzGP57qzSh3iW4zhNj73IGlFZJ97JBfMApx4ucuQ0+OolCrAT8OnHeHpWwxoMBQo7/dWy9OoMeD5Ak@vger.kernel.org
X-Gm-Message-State: AFq9FYJRcB93+5ikFamR7LwiDJXzEFVosUjs9jkPKTsNdZCYi6Lom22T
	8fT0ybsbISkdsRXbkcmY2CEd93EOtEwTUL5k0t0D2InmR/Ct0oWnKCF6zHwdaTuEH5yNNdiuma9
	m/sTrUl/WbDR0BM4A4W4TPHsmpOEtny9QaHVHhlU3vd06/rusIHNYbtFggJfVoJDD
X-Gm-Gg: AYBFou3zukyrwCUPWinCHnM17PZMqY/0iSbwudQ/cAUTADBE5ApfzVUsSHWGHjfWumg
	Pcm85RQKCPU4TCHYdGumFbi5xp2dw94NPCCxbp8tox5LCmFmJQ26gMgsa2xDeVxMYQzrz1sAlPI
	KYy/4bdI63lqD237QIHjNbRLg4yL3eR4dY+OqFS6UBnXPZMdJwVj1KjXNVHPJVsGpF65EVyCmHb
	+DEZBZM3uV2220MwHBxzsqlxtKOXN2A4iI0mxmEhvUfo0YoYyRGVLeWNblbKCO7Nf424uS5cQu1
	BrQcJVnEiRPqbxu19tK8CxaLyZ3/X3Vbp7A7tpsVgVQZLkRc3MtsEBwUdv4YJUT6Xq5Fb1Kbarx
	v8NNiuy09xZ0au/E=
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743123137.19.1790687866867;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743103137.19.1790687866208;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm76923395e9.5.2026.09.29.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:45 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Message-ID: <nqpxb3zpvlpzw5ots6otyr7v662q6ql2dk2sies5w64fvrfbhh@5xd2nixnjnii>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXz9PVdvVverQk
 Lp6RGLTG0o1CAYCgXQMxeNZBPHut1MGeYANPxam4NF8hIcXMr3rlINDvYK5mfDd4MMFXcO0jTyr
 lUYlO8xeZ5tfQtSwzGtMHnYhQXe1NkxKjdtyAllF37EWZ+FWC8WJ0OS6gz9mUQLdbgVFpapiiqb
 1Lvg7j4+aRKsHjIx/X+n8RMd7861fHUNjxmCJTkHVYEF1MC37u/rZIQD8zDR1ARx9i7eMgu1lVz
 WeZ2Qj/aRDOIFBHvEFimS5jM39dRD6b1Y2F/PzOGrlsewu+79oP6tknzL6gsu1TnI27AdwuX10U
 oy9s7uKxL8wjeoBsz3XdVKONctPTpZwLocddDnQcfz2p44l4Nc0woOR1x3dyGpIt2PADa/TImcr
 MXnOpuXdpsZSV3gYV5wn7/RvGnKQAYAhE7Aw8chJfFeY/j6H6+wzrB5IlD7jilC6877nd9h/qvG
 jX8cDuQtuxn5WoIetBQ==
X-Proofpoint-ORIG-GUID: RGThwkjJ7_oOrEEIpA9nIfb2psnGfNo8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXxXMpyCkmhxFH
 iA98BI1gNxPGQ6haExUXUJvUrEuow07upvoxZ0IzpTj0Pcu57cagqNXFJnS5N5cfbY/NE2Fqv9J
 ycGEUczju9ErvErNnGQrSEJsDN8Yak8=
X-Proofpoint-GUID: RGThwkjJ7_oOrEEIpA9nIfb2psnGfNo8
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbba7c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:36, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
