Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD7C3C3C08
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868517; cv=none; b=raO7VCP5n1jWklArgAHFN80AXF2YMJ+ZIv9V1kQ0KkWZh8tlGGMWFS8NUCXDT/sI6kw5NJQl2d6OIfDqJeR01eRZt2u4xHlp8RreU8HMhowjlhuDursthpRRWROXqCsWbhMArt9B+wvzsrtYDBfzud+dNQyWBBIUxd0zHOMfcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868517; c=relaxed/simple;
	bh=JhX5rtqRn0zw887+TlMkThcQSYcYMgZwqDsQkvLSQQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKc4z98my+TtCWyYvJiBsPAMiEpYsECCZ8JCCMtMY0vxVG5db5e1TlAz2CcNPwM/4AkRZGEs7uShyezkle8d+AmO6L7mKXuAv1qevIN3Q56qRaA71zWRXWiEBCN58qlBCw0DhWwxIr4ztkz04SUd5kTsRiXwGi5owz9w1Qce0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kw75iW8f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgUKmmgj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kw75iW8f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgUKmmgj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAkYu42137081
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OcrOxpagqgIZFiiEbE/bG/+W
	/OFVReH6QhEatRKtg5I=; b=Kw75iW8fCfnQhqX0NBuVd4sl0KI/SLH6N88LUizx
	LmESFnUunZdwEZqset173cQ9YPw2uIka5/cOZPPqRhTAuv0kLTTmxMg6Z4OKz7NJ
	qb/dArHEcGU02gwRLVttX2QmuK/il80202xLGeKpUpF9z918bUSc2Wx7K/xxxz+U
	yBdGkKEKX8pYH44dmdjY6Lp9xwdsOqdw3eDFrtAOwQI/G3bkvEOJ4Q8lMOLIflFE
	0WelgXbNqPLyLIkdLCeFUfaT1jg8DOlNGs3X3r+HOrMiRaiAWThJK2HRD4Oitt2Q
	nozqbI/P1b9KUR9GdRrxsIVlseFAGImporKDnKwoI/nsEw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkwq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:49 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56cf69b5091so3167602e0c.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868509; x=1775473309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcrOxpagqgIZFiiEbE/bG/+W/OFVReH6QhEatRKtg5I=;
        b=IgUKmmgjEh9amFnoB/IlI7cTJL3bwsv1vxgVP64KgaQqcvDzzawf8dnbV5rVuqhpT+
         MaZYFCCNox3B5zi/TjPXnBjp8OR0uUQu+gRLuiTlLmARYWOBfeGTVk2KDIovbERL3EqQ
         HUORgXucu55cnGuWkYasy+XWo2jTIhd0tqoOjPWlwy+2yiWoXSYJg16f7ly9qpGkPoLh
         bKPg8YNAgDa1xNxy3tXFMapQQjGHw92DAQqMjLK1wFSA9w7dvWVZxUFia1hsvS4GczXS
         EVsvUzA6AaJ/IUZ5kao9OcI3vBngsyNKmyWcpO8TZ1VpP1CDZ4LGmWSwlgiDbUOprr0v
         MkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868509; x=1775473309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcrOxpagqgIZFiiEbE/bG/+W/OFVReH6QhEatRKtg5I=;
        b=bjgycObsmypSNUZepVWHEb8L1ha4YJEYBGYy6hYHGyyxbpD0rXuQk7AWJhwpDJE8cC
         vRTQwDDB8NvsRwn4W7URV2111dBZMPRBRiHzScCt41HsyEsJX0X8yBrk+44vH517kKez
         rECHHIrqOa0bJkP40wpfZamGdbbngjn2Ntlg6aewuqejR5Etk6yRY2qcgawOEv1B3tbd
         EheRQD8/bFmK5NZ95UozCk3mlXCplJeXr/otymJz76DtcLmKNhtCnw8juHN9FphPqhTj
         uJ+NG88/q9MQktmTCh+FXPKmbvqyuTplMjIMwK1jnLw1cgU4Tro+HQXDJ1OcXbEyjWGy
         uiQA==
X-Forwarded-Encrypted: i=1; AJvYcCVGtVq3I23OhHrsXk1niUVmheTfD4GpR/lrumhoQMlNp93jA23DN/w7ofMBYD0T0CNTVkCO6I/OGTn6@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUeZhwmS/+/H9rFj6tdriGUMXKrKDMbZ2epxLkxmoFuFRc7Oa
	rg20uV52/R5apwU3FwleuKV9LjYmS7lcwwQv/63wljLPUUGlmcAilOkJkvev3egaelr0sV/0bsJ
	jGePHaxMS0Shp9uhmXzAXZmzMGBWI9/5gIgU1rJVfQveq/oCzXoKuSFiQ8sZ+JxmQ
X-Gm-Gg: ATEYQzxqDyRB+M/8xB0GS0KBSX4oJL3SCZ6jn1/LWhMbYUhZ9+xjQpJnK+WZcOeeyLh
	zwMVKWbl9vWp7Fs25Iwu11gkyE9yWgMY7twMMty9eOfMaLcbCx1VtHFPro59I9boV9BbEq9VAvC
	iPhhNi0zhQjf9NrHch+nEHJ9hoMchvU4X/ZO4JW41xi/5kSaiPUeHVJvAHymd0JiE4lRnlYlCVk
	3swKQfcla7KB0j8kdD499amcCyGJ2JyO32sTrLpOQX7ybl4jOXvMEbH2MWUlxt7lZWl+oT+th2t
	SE+CM1G+/ML0u0zjXa+8wB/CwwLHnldpduUNh0h8sd8r8gLFOBGfBwTj1UCjmKqUOS5lvMz8hB4
	8WMbYpJe5b6UquJJRCatVsdG5kiU4qmFnA4N5Z7LDgqOJ9mq7OfUeYmsMJl0lM9QpczIg4VhYDS
	Q/RYqZM0MlvJHH4T2J5WAylFzM7ALESRUemSo=
X-Received: by 2002:a05:6122:2517:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-56d4a52942fmr4219737e0c.6.1774868508937;
        Mon, 30 Mar 2026 04:01:48 -0700 (PDT)
X-Received: by 2002:a05:6122:2517:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-56d4a52942fmr4219656e0c.6.1774868508449;
        Mon, 30 Mar 2026 04:01:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cb6sm1576295e87.27.2026.03.30.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:01:47 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:01:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
Message-ID: <bpujn5bccpbljrosebos4hspddtzoyq5n5mw7ybzffqtj24rmv@tcmedafm5lai>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
 <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
 <eacea84c-ce3a-41eb-835c-7da55d130d88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eacea84c-ce3a-41eb-835c-7da55d130d88@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NiBTYWx0ZWRfX6Q+YAAgZ7kEa
 AKUuC6BBBxVE1vBKAeWATk+WMU9wIoGHdxFQPb9mMDMdR6teXfQqrV14DfRZ0TfFNegO1LFusFH
 /0pMyCxil95EwfOOEzGWZMX/ygn20aaeNX0miFOMohdLzVjFsynRm1lPHIcP5qn9gz9YJ5+Xo72
 /ln6rJ0p9Sze8UkF8+027EBLo0HegZo9HOaUzvWR7+v7y1qjhDscheXKvbl+eLn9xZXfj6Mh4RA
 kuqXGQSNneUWaooiFiqFQWFwcE+zocU6D1XaUuD482GIjEntGBFNwdserlt4/NwR+fGzcati5M/
 lC96kI36qJq1wQX/QwKgWLD0BCVrj3lbvbW37bxArwvL1qdOjxExLRLQq1KQFmYjKkPf2rn22vz
 F7tMf1GOEjHlYb42XPruIpThlkkoqbuv8i5B8fy1nGBS4IwitVLyh2KTDxhyy6rbji84N+XxeEJ
 tQIbKSOR3L7IstQWtuA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca581d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HZZgv3tumfGS_1V8ACwA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: uO5NzVMSxDdl4ZIRNLqKmsWvsCwLWnO8
X-Proofpoint-GUID: uO5NzVMSxDdl4ZIRNLqKmsWvsCwLWnO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300086

On Sun, Mar 29, 2026 at 11:45:48PM +0530, Krishna Kurapati wrote:
> 
> 
> On 3/29/2026 11:37 PM, Dmitry Baryshkov wrote:
> > On Sun, Mar 29, 2026 at 11:22:49PM +0530, Krishna Kurapati wrote:
> > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > 
> > > Enable USB support on Kaanapali QRD variant. Enable USB controller in
> > > device mode till glink node is added.
> > 
> > Why can't it be added as a part of this patchset?
> > 
> 
> Hi Dmitry,
> 
>  SoCCP changes are not yet acked. Hence I wanted to get the base changes in.

=> commit message or cover letter, please.

> 
> Regards,
> Krishna,
> 
> > > 
> > > Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> > > index 6a7eb7f4050a..1929ea273a4f 100644
> > > --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> > > @@ -80,6 +80,11 @@ key-volume-up {
> > >   			wakeup-source;
> > >   		};
> > >   	};
> > > +
> > > +	pmih0108_e1_eusb2_repeater {
> > > +		vdd18-supply = <&vreg_l15b_1p8>;
> > > +		vdd3-supply = <&vreg_l5b_3p1>;
> > > +	};
> > >   };
> > >   &apps_rsc {
> > > @@ -821,3 +826,25 @@ &ufs_mem_phy {
> > >   	status = "okay";
> > >   };
> > > +
> > > +&usb {
> > > +	dr_mode = "peripheral";
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_hsphy {
> > > +	vdd-supply = <&vreg_l4f_0p8>;
> > > +	vdda12-supply = <&vreg_l1d_1p2>;
> > > +
> > > +	phys = <&pmih0108_e1_eusb2_repeater>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_dp_qmpphy {
> > > +	vdda-phy-supply = <&vreg_l1d_1p2>;
> > > +	vdda-pll-supply = <&vreg_l4f_0p8>;
> > > +
> > > +	status = "okay";
> > > +};
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
