Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE495349D0
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999104; cv=none; b=ifd1Zk8EMVUjIzd+XuCORR0XSXS46Kl+pFIIyJfqOzxaYZgGSD7xzGmVV8hwF5Pgs9/AL4pIo/aMuZpJjbMtvgRJlDd+El7nS3yllDX+7ExIo5XpJEgnEoeUY5Bwt4aF5VrzzXZWLdkv/PRbm6CQYt9NYIATDSQ1AXjlP3dt1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999104; c=relaxed/simple;
	bh=121EF6tgvtQmCI553ZeF6I+UbkvEWY/a0feXoJuQ+5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXc2Dnes1dYKL5c3X38mNpYn32JtqbrEy+h4McYstbLl9RGm5xjPU+J0LO8RsARU6h1ww0RbH+uTZ1KcfBdSwnBvK7FUAOtgUyucoogmvrG+j2Czdb2ZA7sEjNdgnSIZXYFnGmk5Rb+SbM88x86lw38FIBu/tJFx2zMPRJRSBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARxqgK2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYYzCE8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARxqgK2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYYzCE8n"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbMkR152717
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lkj6WmLM94TLi7LkJSNtIzaP
	frHo6K3hQ/enHwG6gPU=; b=ARxqgK2zwJNKzaI+JAXUrYvIyxi3iBuILGUfZu5o
	adNmbIs8cWR5bF1mcjdLC0X2gN9qfEbH5rtrGqt/iiKhw8PLlCev2O7dmQfnMqtW
	pgEsyddaZngCo70WOSYUMQNnAaZ583vLR46QT1445VfJPw9lY4T7uiejGi1miA8E
	w2d08GyguICu3r0vPDwOT11FmEp0dlWkJNcqXBdU/5DC57wcZWisTRkKL+fk3vQY
	mfDam/3cu1JN0F2NWJ7PsquCMfR51cnlosF3wy72BN6NsSGBrZaHHdY9GRs5W8F5
	7qbtWK6e9GOeVJn9BoOdgtVz9Y19ujsO4RSKLLg3NxuYLg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aehvws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:31:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b529a8610so13285296d6.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791999083; x=1792603883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=gYYzCE8nAazUmgO668F6jwWgghVWX5J3kT9opv1/prfq6uVx7Fjs+CXjHBTmV6/D3K
         TvDC/PbtpL4ugo41EmmswzmX+WHNxLzY8zuU027oNhD1YUDPBDs60hdLkZGtKobLj410
         bOYEvEtBxsiWwLA7F03W4bXi2pU8oDdwcgaTrpu8tV3a5AhhZjg+V7hQ3aBGqS1GuqJ/
         wGOVbRcWnEe16vsPRFVzZhZ04ooaXkwr/W+rGBahVVY9Wml8EVgWEAPQhQ5EtLHACctv
         wsSbxrVinUvFLEwvfwVuyi3xweTZWdbzW1lTsEO7aBO0MMyWXbRLfasL9vOITz1oYVYg
         8ATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999083; x=1792603883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=n/mh1ho0UHWOdkJnuOrDWsfPsKm4+aAfK7aEVhjCTKChf4sM0jVTYtNe6g1yEkhOsJ
         fYOkp+1flD24AdYwvyO9N+R+mNo0JnVXkwRd7TjJBA1N6NIHrzosgLt0Kirbuuc7dxcO
         sI7A24HaoPk13TTmo2kE00L56kck9J0PcZmu6NNq4t0U+6Cw26jlXemDp8aMjMyp3XJC
         mccBwJvhHV++lJJqtxd9RQSwpsJxRCxRGCidvvgXaO4C/JAuxImQpiH43iLLtivSdQHN
         F7bNBIjlSpKOu6sDJiXhbBx40EDNhV4irTmTRoYKJplprnfN+43j+msUyBmf/bNaQC1H
         2OuA==
X-Forwarded-Encrypted: i=1; AKwUvBxWY/Gej2gBZWAfDnvpat/JDbF07tlz0wFl6wt8h4IpMdRwHAZFFOAPgt6kDhZ7pj4J5pxxevz1yYM1@vger.kernel.org
X-Gm-Message-State: AFq9FYJRBigy9qvk7AY7Rb/XyZvo6Zo3TPA5fCq++LqNiDXvM2oGEkw3
	3cLIsodfLbjvlzWmjuMIwPVlfsIAvnzd5nAcpx2BWqYEhzj+/LaikksE1i1Ie70/YW05G5xJU+l
	2yXgrRU0DrJac2pnqSe3P+YLRKDeTvgKamXDQbQ07RTZRwtq1Q2nw0/S5/9tF3188
X-Gm-Gg: AYBFou0DSg4/jiTimqFRVSKont6J8SGFDq4+C5a8asFRI3lTWTFOguORdil8LNHPRRZ
	34nshz90m/JO6dDpLOSjHXJe2uRRR48OaHZ4Zz+mP7KX0GWsH2OKAiIJ4GGbSSGW+9d52la2HdF
	4T9yNAetiWzywQjwqI2KHr1zTapE87SQ57HNHV5FaBlRlFZCtpQU5NcqpVUaAXDSlIryy7WVHrg
	+z4oI38rOlrj+t+BCPQutrHPtXWdEhABq0Qd1cUMe83Q4Bgkf2zwboidKUiONv7m3A0GXxScG1V
	Zt/a4S22msNHEM800y/84tKiB1pXnW5oNhymoAChjtk7vgRrNpAEnbSrhYI5oxSh2YkMqis4krQ
	EexdR9GvqF08C+Iib6Vn5sS4qsKD/OrBi7kM7akEmQ8Fs94dgDRheWZQSyxxY+XaPtIOq4xT7C4
	ZXCSxhbgj/jv8m
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719649385a.47.1791999082159;
        Wed, 14 Oct 2026 10:31:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719640685a.47.1791999081425;
        Wed, 14 Oct 2026 10:31:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93de0sm789552e87.67.2026.10.14.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:31:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 20:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
Message-ID: <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
 <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pIhL988Q8ph-pdmPNJw9oJZjxPztSsLA
X-Proofpoint-GUID: pIhL988Q8ph-pdmPNJw9oJZjxPztSsLA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX1RU9DnoX487W
 HF8YFW99j7QSx1OK2zhFWhOsEvgNOXzdxvYqn4R04KTB9KAAZbD3gmwxZNKBisaqeqKuB1JzgP2
 PgCiW+iLwBcrhnuhe7dupLkOIZk1onc=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acfbc6b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qblbxwZfGeKRjrM4MhMA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX4eBlPczsma//
 lf91VdrzwqqkY6YFohVm5NubJP+avFyL23VBR1cVj75B1LSi9DRXX5vUp86drONEgdo5NzCcXfO
 frBnMJHufQgzdByCVTJdW4D9cCkOQIZcxeDyflp/6s/4lKi9wJwbvtM1JUbocKCzUEwX/n1gaAj
 Hd9nujxbL6HFgaAyaiGqAfgF428vQAPnvm0LDxvGw14/KbvgBIkmgM9zO967iBuLTdbl9Y1GSfv
 mFS1skeXJ27VhgBVKZl4nd2zTAHV9tC1osHZoGBlxIfm0R72AinBXwa7YxXFdurwXqJw0L7lFx6
 vJgtWmiVVoyKTEcYpCBjoXZo7ENFrghrg30xuaHU5SxL2ua3yY/EpCVpPyZpe1jK41cL2mdDH5R
 bP4cQSuSDZOUYwlipcNumTfcyar5PlKvHlWosCR+APoAJzx/1IzLAgRjciXZUct6+AsUiHGpTGl
 /QuwpE7VXFhbp8/Sitw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140069

On Wed, Oct 14, 2026 at 06:45:46PM +0200, Konrad Dybcio wrote:
> On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Clocks on Qualcomm SoCs need a minimum power rail performance state to
> >>>> operate at a given frequency. We currently leave this to clock
> >>>> consumers, so a driver has to know which power domains supply both the
> >>>> clock and its parents. This ties knowledge of the clock tree to
> >>>> individual consumers and doesn't protect other users that prepare or
> >>>> change the same clock without making those power requests.
> >>>
> >>> Why would they prepare or change the same clock without making power
> >>> requests? If it's a legitimate user of the clock, it should have an OPP
> >>> table. If it's not, it should have a separate API to set the clock via a
> >>> legitimate user / aggregator.
> >>
> >> That's the entire problem that motivated this series. The consumer
> >> doesn't know what it needs on Qualcomm platforms. The power
> >> requirements are that of the clock controller's, not of that device's.
> > 
> > I'd still say that the consumers know that they need a certain
> > frequency, which demands a certain voltage / power / etc.
> 
> Right, but the meaningful difference here is that the consumers
> only know they need a certain frequency. The required power votes
> from that don't stem from the consumer's requirements. They stem
> from the clock controller's inner workings that are necessary to
> fulfill the consumer's demand.

Doesn't Iris core also have "we need this power to work on this
frequency" kind of requirements? My assumption has always been that
those are just folded into the clock requrements.

> 
> [...]
> 
> >> The Qualcomm case is easy - RPMH is *always* reachable, so the
> >> pmdomain provider needs no clocks itself. For the other cases,
> >> "patches welcome".
> > 
> > Ok. There is a promise that I2C PMICs will never ever be involved in the
> > clock / power tables.
> 
> Or at least that someone who needs them will contribute a
> solution to this problem.

I meant actual I2C PMICs, like PM8008.

> 
> > 
> >>
> >> [...]
> >>
> >>>> +static unsigned int
> >>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
> >>>> +{
> >>>> +	struct qcom_clk_dvfs_vote *vote;
> >>>> +	unsigned int level = 0;
> >>>> +
> >>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
> >>>> +		level = max(level, vote->level);
> >>>> +
> >>>> +	return max(level, rail_voter->safety_floor_level);
> >>>
> >>> I guess you want to avoid having too many voters, but would it be
> >>> possible to have one voter per 'signficant' clock and let GenPD itself
> >>> aggregate all the votes?
> >>
> >> What does "significant" mean here?
> > 
> > I'd define it as "using a different power domain or requiring a
> > different corner".
> 
> I still don't get it

When the consumer votes for a frequency A / domain BX / level cc, usually
the parent clock (at the corresponding frquency nA) also has domain BX
and level cc. Sometimes (like in the case of PLLs) it's not the case.
The domain might change or the level might change. In those cases that
clock must have an explicit voting (I'd still prefer OPP).

-- 
With best wishes
Dmitry
