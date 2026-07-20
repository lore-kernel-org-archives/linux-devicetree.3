Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4744420E74
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552793; cv=none; b=BGufD5lD6XzUErIc5KCdHXDtYQE8FhOYWyU8LY2UChySBg9oE3M25TZTTQe4AmHxIGsP7A+mY8Yh2SEJNrxPhhm23ipMklWTzTjWwbFbApDs6O4mWWaRVDCAZjpCQ+xWaCdN87xGeG8TPbXwcRopKspn2quaJyuYBxxmZz6e9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552793; c=relaxed/simple;
	bh=zmrNpY9Fa8mlxLmLiWa+bP69gc+UK/rSjksdNWb2nO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZkRwWicYqY+M9pNOwTFAPhRgoAOCdY3vh1CTIqDIVHljr6PoU5ZwkQQOYYeq5fHVq9+yUSlQsjI8IM5fzH3Sg2s4n83miKOvSLU6mcqJfBJ6JHxu9PNo0n7T6I6kYZp/QSX4qSoAzEHzCEAd1GikzUpk2H2aAfUjxdTDpccuRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6wdjYFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVncjUdp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6wdjYFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVncjUdp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvUwL2277523
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Wpb01KOGj78z0Du9MyVdmB2
	W3xVBzOaHfRWYUnJVjY=; b=n6wdjYFiyvoEqOzMI/TiYnNn05bkqS5Y9aIuGFmv
	rmS6Twx5WHo38TNMUXs6rNdWXrLr42APNdT9UkWQG+fuQsrpR2z/v6pN1ySJIUl0
	3K/EQ5Ox/qgbWCd6e9YlSIXtMz7nOoLDiUSCErYPpSTijpZovsEe6XplHF5qNGaL
	k67UIZTe1xnvVe12sU7cRGBmeGhIW6YU3XJYrGgeXvPb+CmXw9DKUTpPOr7WZ3kR
	06q68XFiepNrFsEf8JdtSsvZr6JzcxTDAWz/rKwzkrE5EVjDz0nIULj21oplFkYj
	TiJxKYBQ2Kb3MPM6g37/72Rz7hLpZfFIDRhFyUeRTDMuog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c1jqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:06:21 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7c11611so2133738241.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784552781; x=1785157581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Wpb01KOGj78z0Du9MyVdmB2W3xVBzOaHfRWYUnJVjY=;
        b=UVncjUdpTN7UjqE8AnoJUIFB6B/dNvb/gv1E/OFxoClGI654XSbQGIrk+RRziUWmAo
         YqICiRrTRGr6oWMZ4kihP5mRV2Sd5dVnJ6Qvvkdqykyxlo0SnRgonnIfrcnzlRkPLxm0
         iE8Dzx0zuDYJ8s9gB/hpfpE7F7LKlxVbEGiObVdOsHraTHhPIFHT84lw2QPArU16+wmw
         FphgvwDeYNi7xgbWV42sxjooTAhUL9FSmEyNNEDkmY4826wFWxgCL4fiWaDuSE7y72bL
         OxI7cTY+pBUWnB3ER4a+KNF0COwAC7OOmMT7VNPaeYqn6ekEzbH8PM7pKt8N4Ic8cVg7
         LTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552781; x=1785157581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Wpb01KOGj78z0Du9MyVdmB2W3xVBzOaHfRWYUnJVjY=;
        b=CWWL43mqApiwbE6sH3uf0kDpsPQocjM5C9wM8KYfNasvUPBVl5gBLIm3LUzLygfdgo
         BO44GNSSIgkJfzVlx/eNXMIz7N9ubp+cbC3BTfrF/FsI4RR5A51NcYGNzzwqL2iTAQwp
         EMs2EYeMPg0a7B9M+JMcBvgf0LSKBjiSZu5rBJH62aUkCm2sQ5WV37RfHro4++4uRg6N
         YyeEnma0wNZXL7wgRjW+r+iURprgDQtcaQxzwEKMIm0VRWEXkhUpC7ZKKcdt//XlAQoG
         bCF5DX4w8v8fZNLcR7saOTDgeyIjsJqc6PSjPxsf2y4UJBwidA/Feqg1W+hk17l5dosG
         PprQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+lj6GLwG2l65+h0RWjOEkK6f2sKRmbaLTUXpQ8rvyPs0PWQ6OXZTqNtfZXF5PzCooY0TBilIw3sF1@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkZQkau88uxWXCF97GX3ViuwwAK72Zr7JL57kvyDVMPUDSYrA
	8Z+WCp7m9ml3jiXjC1i9M4OMTDd7f+0y8NH6NRt53k1KHGPe5GSNNcQQfHbwYHzNB+IzbaW/E78
	sClc+MGfXIzEJ+PYjpuMWZ2yGySVg2/mrll4W7vblFzLsRSH5c4aRSiq6GXu6g8rfGr8uv7tZ
X-Gm-Gg: AfdE7cns15utZdxcKItTuTWYmLWS2d7rDRF+h4r55A2jw19Et59iL6TgRFKZ86zRb03
	aq+IbvkpxZYqVssXpqOZel1c6JzZF8SZdwYqJJuhq0bf4O+Yu5SyA6j3rFB3IaXhXBxa/XEkZNa
	5AyCfMkHXOuZz8oIdiSJUrQYsQXuHwGqX7dFHP+jYnn11E68ObTGSxw/DGyzEYCJRIIhqZY4syD
	owUgJbF4DmagiKDpP+jkdTGq30ORJxyb0VbDNAwaHBqiS9nG5HBgx8f7bu0Vj7qqAo3tsobDs4Y
	4Iz0QHulpsjZnLi59PyxdYZvXQh1Fzg9Rt35JvvJeQtna+LwgFQ+vnh9ZEdkXkOzIlGZMYdUXYX
	IbtrV6omjyadHh1Lwo7+g89QnZe/akZva0MlfPZz5HPyz497TNLDK2mFaa8zCIJbXPxJqGJR43H
	GzGhn4KYqfeWNmGQ==
X-Received: by 2002:a05:6102:f95:b0:631:26f6:701a with SMTP id ada2fe7eead31-7475377fcc6mr3439901137.29.1784552780777;
        Mon, 20 Jul 2026 06:06:20 -0700 (PDT)
X-Received: by 2002:a05:6102:f95:b0:631:26f6:701a with SMTP id ada2fe7eead31-7475377fcc6mr3439869137.29.1784552780253;
        Mon, 20 Jul 2026 06:06:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eba9b25ecsm13615221fa.11.2026.07.20.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:06:17 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:06:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <t5sz65mxp2m25ktyysn5qpueewiyrnguksf6jeu4k6i6o2sbev@khnyjt2ijnog>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
 <cdeffa46-3f9f-4956-8548-bdd158720307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdeffa46-3f9f-4956-8548-bdd158720307@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5e1d4d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6hNVS0SBqI56LPJAG9QA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: wIvGlaq129BAXmJi3CBUT4nREYQqWoXA
X-Proofpoint-ORIG-GUID: wIvGlaq129BAXmJi3CBUT4nREYQqWoXA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NiBTYWx0ZWRfX+50vAXoettSF
 v6wuCtfCwD6LP+K2OueRLMWqIVaYE/r/x+dIBgRqUjWbbMyy3VQ1f3H+9XPBOfFYX9COZdvt/6L
 mBc62CAgnJtBouwOfLEwmosTpKvFt94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NiBTYWx0ZWRfX7SsDjgBvHPmU
 YOWB51ajVHq3QzHsXmwMHGkeMXilkDSb0qy0b3bQBipnYLaNvB+Uz/W3ev9XLnJ7fJdWVDTCMaC
 sZOBhIBhC4EPvVi9TsK2ySyKukAy7plmMSw6A6Z/o5BmFMoGYWIibFA5Z3mCFt29ynZ1vDuwpHk
 us+KYf9Fk3AFmQto/wEVs/3w2g8ZnXXKzzioagza6VV6QJrKS3KOHzlI2cSHQcbEXXyX9SEWRoM
 IMU820TnzWd3dFTA6RtDKdJjBSs7cUeYbhKKHsp5EcjrqxjPIfOg1lxxH2qnt82J/e2i3b1FSvz
 yD8MAGUpO3XwuexEkOp7I33T+brnGdof0Qa/uwDnwHiWysyf68wuKE2ub3y/OcKnRyj6PxvBSkq
 mLSQL/VruTCVDnrygOwxURREv3xN4dgwrtVb9sLKbG+yFOwOEi5XyPFcnPGIZHhtRvM606NjDS9
 yr/VzBWOL8gphdncTQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200146

On Fri, Jul 10, 2026 at 06:36:10PM +0530, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 7/10/2026 6:19 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 11:34:42AM +0530, Nabige Aala wrote:
> > > From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > 
> > > Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> > > board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> > > to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> > > 
> > > Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
> > >   1 file changed, 126 insertions(+)
> > > +
> > > +	panel_bl_en: panel-bl-en-state {
> > > +		pins = "gpio91";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-disable;
> > > +		output-high;
> > > +	};
> > > +
> > > +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> > > +		pins = "gpio91";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-pull-down;
> > > +		output-low;
> > > +	};
> > Is it an actual GPIO going to the panel or is it a regulator on one of
> > the daughter / whatever cards?
> 
> This GPIO is part of the daughter card, it is not going to the panel.

Then it's not related to the panel too.

-- 
With best wishes
Dmitry
