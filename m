Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C40C41168F
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687187; cv=none; b=mTGEdhXaodJKnb39+uxFN2aUwyjzKecZj0CON778Wu8TQf6ngkgpYCT7SfFQWqusgbuwgxXV4VezNMl7BLN5JO/HnEI7xpRjDBmkDH5MIeNHfqqLlvfv7VLINkS/I1q/4J1QWocyiUfugAqnnS/n9AGfIz/rmyQsCa8t9nqJlHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687187; c=relaxed/simple;
	bh=yv4vyEzhqyD0fyzec18PVIDdtQdUC2k8Cxa4DnzfS0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyj5yZigzuVEQDiSB2E2wjQOjIzfnMB1d8opJKrKYgo5Qnueeg+MMw+vHGHSpfRpXz++uYoRAVx0Uk+mH1uVKACGtepnO6fQM47x4DwMLIRgbCDFgjKpADhyWRK4KKWutXE7B/H8/KP/QhBhwRRnOZ83kKRjwpO1IrvgNz8ScPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohYG6GKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d31KKnR4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohYG6GKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d31KKnR4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnGK0619643
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEJSvKz7ZDVyv0BFKFyL7CpinebZzLXWdvkWTvwvQYQ=; b=ohYG6GKg9OBURWb/
	HXIyWkS17P/usfLwVzP5BSHljAtW5LP7nrN5MdQS1W2rwj8khWqdoFc6r/gECRWF
	qPaINKdhAjOchPrciJik/89sSsN9WnUZR8WfmpYB+MhPhTt834GKE4xauZ8W7QRY
	96G4S/wPaMxQ6pa5oks9smIMMH2TN25dEek/c69IJcM7ieP9swb4LxbvYo9Jbo7A
	DSkpOG5UCFaJeroGQU0Nxf79QBWwEk56szHyrur/sa/VrTj9A0l1yRxCbEFhYSo6
	y3CxbFtMawGPcDEfUtmHzldBucWzHpaQCQwrk0jWX4AL7IqahdeEs/kB3ZHN8hIC
	ZXcVIQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0d6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:39:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e7890eceso342853137.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687185; x=1784291985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEJSvKz7ZDVyv0BFKFyL7CpinebZzLXWdvkWTvwvQYQ=;
        b=d31KKnR4HjZcn4xNFUCoMP7v3tj8DQbMmCBnhT3C4U0U+Q2YOc7pioZ4+Z02cXbE2j
         ZhT4+elAa9LqUr06Y43oLMr2s3GJhbNWpsQ/bl3NMMb2J9knCpqwssiZ/D5V0S3vtDcF
         FyYorzD0I+iXTVN9l4ctiQLP1ubQdBMv2wQ1LVbpKo/TFwprFNMJipnTESs2k3ZAwFlH
         43i8vjPyuQTJawN5q2jSkRBd2uwdIww87rBBToLvU79qNZeZJshjPb/UB62sBCAK7U/1
         Ze/ftse8vqgShy4+CaD9k1P/EhutyF096OWcJYRAKhmZ8tk7kLGfFyhwjGU/NqodMPKd
         DM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687185; x=1784291985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tEJSvKz7ZDVyv0BFKFyL7CpinebZzLXWdvkWTvwvQYQ=;
        b=SKtPTTGTbpWcJryN2vncwJSo49v4/okK1LjY2hhCG2R7RTTowhSpTynncRmzn+92Yw
         gujNpJhIr32LDDcpcHjCG9JgeFi71tyu1oZxi51yOJsxGJb5Z2GjbeibvBMR423qus9u
         cDWJsuT70AnaXbdBHRusX5PNIKBCYz1M8SryUKsQ4yN+hP1/PlAdO3WtLoPJ1HJXMn0p
         CGuSM3EDXgzG6AA9RwFM9IZfQg9rx80pvglodd/7V71IqLdpIZBC5rYjcNe4+g3DulTw
         WRQy4Xe0Fy7Of2zCmtMUBKQxLB2B7/Q/SpMiKJZj6lLoAJnqWHU2WqdwUOaNLa5p9F2C
         31bw==
X-Forwarded-Encrypted: i=1; AHgh+RoebjjFjtkcNoJD8SjzJ2EADZe3+pCTO7phc6T1nwUlRD8MQP/7WqhV/hJKALKW6MbC9mPcNDiRhvNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxC9hn6bUycltSQQqiOOBVdAkwvDVc1EhtmCxRP8aPB01RU8loT
	3NwHrPCHdbyEsen4mXyy3c3tAbaV0TUoU8CiEgaAaj9aZnt+4lmEADcvel2FDO9gG/P14zbfNbV
	H7a9Bp1Ux7CGZklS990GViwzlMo5LHebHmc89/g+NgKkE9vMPUHCUTdZGrW/l6FNW
X-Gm-Gg: AfdE7cn8l3WQFxRW2zoT06JwamNw0mfY29WDj9Q1j88LpSTXTU20971UXQsvPMt5w3l
	1wsaUzdacGcpgm1QNF6RtOAjfhS3jntyREe6AD0QX4+6890h2uLBlkcgU77K46epXJTYCjkPDGO
	3EvKb9ulhaLp1LSKIvPBrvOaYY4zTrINLoTBImlzzz8Js77ve0kzAu73Ev9HnDtmhKvwqT2uQfZ
	5NBbCgGdSaSb3P1/XKJCLyhaT6ZGZ6ZS2iAkaIPdyA04wuyDgHaox8CkH2pcNseGO7Sl7lpPBAn
	C5gaQn72zahHWxaAdjI7Q8IBZExjZwI3XcG1ZMpDVRXr1VRgc8e70+4i20yvjZPdvw1f5IXnU08
	7n7s4VIE+tPGer8KeF7obN9/HDa/iufQz4QZzDdI7+tfwdn9WnxT/trDt2r4okpp0TL/uaMcKrP
	PPh+TmRQYPW7jQCpw0JqB5uPN7
X-Received: by 2002:a05:6102:580a:b0:740:1df0:6ce1 with SMTP id ada2fe7eead31-744dfed34f0mr6277789137.2.1783687184700;
        Fri, 10 Jul 2026 05:39:44 -0700 (PDT)
X-Received: by 2002:a05:6102:580a:b0:740:1df0:6ce1 with SMTP id ada2fe7eead31-744dfed34f0mr6277775137.2.1783687184201;
        Fri, 10 Jul 2026 05:39:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b83a93sm9981421fa.24.2026.07.10.05.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:39:43 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:39:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfXx+kYiPMpvwbb
 e/OL3OZAUX2wZTK63XZFFO98qfFxGgCziZ4ieOEoaVkcTJ2SHy1VtG3lxCYoiOFHqceCsFCqKtg
 qvAz5KUNuwRW6edyhxQv6paQSlsTBTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfX6YUm9iGRHJ9T
 AJQUv8+QdZMMq1j8v8nEyqdOm3wdkqDkIsPf7eVbRcoRmn3FAzTNV9nIpJ4dLD+YlUtxbQJ07zw
 AXNCaVYqO12ESuKaLn+JiX+g+rKicc9htOfxfD8XA8JyqWHmHxKURUxAD6rHQv+ctKdAalk+fXN
 qGJ/38i1fU1xpD/nMaWjQXLachgckTWbiy6WIu3ZknWV+C5MXrnq3H3NJqZvaZ/9j54Bk5o2fMJ
 NYBpKgKKyzvtkqbHgDgyEqv32ARrkwwFiSIlnCzTcaE3rRrQU4/icXpK4SvatDb1v6bHEkhoi+B
 c2ZuEvORaDlL1nctAM0DThr6suuEPrO8Nvj4Ztw/WHEl95FI0ws/qit1565QNix5HqrBWc+oKy9
 TGaS1iXj0gd9StX0QROsAnBbDLgenovswcVTxdOKErbRkxEb7sSC6rPeVljmP2hyJJf/jGHHNeW
 g3KTjp2Z4jL0Nac9Rag==
X-Proofpoint-GUID: eVuoM7y-esC_mPaHEqczb8MOfc6IB3-7
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50e811 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=XgB7ONbkh5Cc0Rj1ql0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: eVuoM7y-esC_mPaHEqczb8MOfc6IB3-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100125

On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
> Hi Konrad,
> 
> On 7/10/2026 2:31 PM, Arpit Saini wrote:
> > Hi Konrad,
> > 
> > On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
> > > On 7/6/26 8:04 AM, Nabige Aala wrote:
> > > > From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > > 
> > > > Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> > > > board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> > > > to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> > > > 
> > > > Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > > ---
> > > [...]
> > > 
> > > > +    panel_bl_en: panel-bl-en-state {
> > > > +        pins = "gpio91";
> > > > +        function = "gpio";
> > > > +        drive-strength = <2>;
> > > > +        bias-disable;
> > > > +        output-high;
> > > > +    };
> > > > +
> > > > +    panel_bl_en_suspend: panel-bl-en-suspend-state {
> > > > +        pins = "gpio91";
> > > > +        function = "gpio";
> > > > +        drive-strength = <2>;
> > > > +        bias-pull-down;
> > > > +        output-low;
> > > > +    };
> > > output-foo isn't necessary, the panel driver will assert it as
> > > necessary
> > > 
> > > Konrad
> > 
> > Ack, thanks for pointing out.
> > 
> > Arpit
> > 
> I just checked,
> 
> Normally the backlight EN pin is controlled by a backlight driver.
> 
> However, this panel uses MIPI DCS based backlight control with no
> 
> separate backlight driver. Since there is no driver to assert gpio91,
> 
> we control it via the panel's pinctrl default state..
> 
> So this is platform specific pin , we need this to enable/disable
> 
> the backlight.

Handle it from the panel driver. Also please fix your editor to prevent
it from inserting extra empty lines.

-- 
With best wishes
Dmitry
