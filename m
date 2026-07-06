Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EF4329E5D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366480; cv=none; b=DE4Pf/c6ID14MH9+tq5VW+cYVB0wBgRe8OH/NyZ3GkNoVLkxAu54xui3B+CoybkxLHIQ+3x3embZh0rDh6hzfWYy8UiGAR0eVGYdF7pWwxRXXUCfeWzufZoautkizFzn+AXv2IfXReu/n0y9rZPSNQidfNOeY7AgVcJVBozNl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366480; c=relaxed/simple;
	bh=G5bzsqL7CD6Jj6kiG9Oe7kbdaoiW/kRUDknhNrluwK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjEgobEUc+2Z+F8tlbSQ7S0wXk5Yhq742DK9vKs9K3cvfOe8+rSfuKpInAX/4T2Y8/mKVWT0vTF/nJNqOQmJTwlVIIBnLSr5lLvhUu/fmOs5eicFr3TYlj2z2Ki2BHBwb0rMTqIdNuhAgnnHOTlWNM7MO/4jv9feDpgyMV13YHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtDnMNsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvoITfgN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtDnMNsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvoITfgN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFC1j972278
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 19:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6DHjZemGZbGTGMEMZvfJ4XTU
	0d57xnMw3yNqcpZYiWM=; b=DtDnMNsBzHzC0TD4SHYPpX48Eo/CijmqywYKbORt
	vnFqEQUjKUySGwVuaSb5s/rwLCbjhpvJ5mkLUG8yaHWJ+8rMX6JhQvmji6K33H7G
	rNe5eDeQL5l6fsGjTLT/4htEzkKJj79G8cQHMKDD0XtuTrJLaOXcrwXNVD+r7Uvk
	FSqeeeqO86TZIxTnOxFHaKRXIBABkkhQkI9imCDPkIerqLKJCwgvny/HCoLX/owG
	3uySDKT+8nvXyKA44v/2FeUXwvvjDyHb7V06WmewVVRq64CN7T2IsdOsDTZFfACW
	ZNeJrRT9BCkqRAuLx1bI1xmdFRN2BQaVjGI9/JvYHw9VRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2hys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 19:34:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso360988285a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366477; x=1783971277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DHjZemGZbGTGMEMZvfJ4XTU0d57xnMw3yNqcpZYiWM=;
        b=XvoITfgNBDYYrbRyB4XXXMficpoMSqgqSJ0FYVZTxtvC8ZMTSjH9n2uiTqJws/F8kl
         /ppgtVzFhTeOm4yM4UzchyqacCbCSzG4Gg8q+Obut30KoVhNtAVb5BfnUdqUuNnfmivO
         r4TwNkhFL96EO9DtweC1uNLNddde8EgUyvM+RaRBoo/ntyuF3mx1+gG6Q63FgAyZhejy
         FxcHfHbTt4MyAAHyM3EHagmlY6B2jGv1leTy50+y/gDzzBI9BKpGEbUN4ob0/JgYCKAX
         4t18kmClfJKER2iS0dRfTths1Lf8eIqtfiesdaW1awvuvwamnbGeIX0jc0AcEkfqbNH6
         SzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366477; x=1783971277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DHjZemGZbGTGMEMZvfJ4XTU0d57xnMw3yNqcpZYiWM=;
        b=AcrWR3ITINYd4T6MaZZnCk4ZzfYbFhu9ihSoHDCLO8AmwWiZBk7hLZ0JhqQsff9iVY
         Utd6xtyJox1RcOuOCwFjAwGq0/IQovLzxCbS0gF7oSbctFrnEaZHUgeiVwNE7ksXVO33
         uKaOonKNGHMwgXer+zQeg03DAioqdMKI4CiP7pdPpA+t52hP7qHX5ug8II5i8e9RbXbH
         tjCClUcuirCOpHJj+gyIGUlP5p0eS0coJ/9lrwWIp9IhCfi1DjOBHe9VL9QBn4/QbazT
         ASZBsdFGjMoNyeuprg5/P1fQcsPKiR4c9rfXjikly6uDb7ebVLUa8Ob9WGccW+slZY+U
         8WWA==
X-Forwarded-Encrypted: i=1; AHgh+RqIwWo17jw5yIB8KSJg5gr8o3i6DENnmXVbbLEwCnEOb9ix/fMeiuoA7Etfw09LE1f1fE5ygijA8G6C@vger.kernel.org
X-Gm-Message-State: AOJu0YxBtZ3Tl1JpqBfuNdrNhoduw60OW+sL0xFRxEFs/IyAnbcUUmu/
	Et+A9DPT2K2T3BVK73xysl08kVBnnJBdMBer5JuXHkSIREbjwPehqmIQC1wtIAd5s2jcn78BjzE
	tUmrQ/bQvpf1lbOPpA0TOTuGZhpP0/T9+XYK+PsACPlOrpN2typB68Kue4oxDMN2v
X-Gm-Gg: AfdE7cn3Mmyyz8L3bTEe54qeD/FfZ1NBBpmY7MFfGlBVfTqXZsgFphRPE7gTs8ApHjs
	B8JGtXTh2caTcytffAyRZJ8cpATrtrpk48ovEkFKWVOTAGKTQUXkytGvUsPBl+9KLKmQAiO5ee2
	BE98E+Nk9mAOlqEscyvUMcTJC8xZ5gBw1h1B8x9HAmzUycocpbompa+2pPE6BbPmxGTy7Jlac//
	kDhCiHIx80ewCrWUKZtzl22BS4DsvdfXsMbtbF6KcsV7pNdN54BLf5AHuuafRVUDbNNVc46bNpV
	hSB36xnUlCpET6DTlIuUellUZ9/KQmHmSJLkGY2Q1VSzVluHnYw7r+1Yl3g2w5ifi1rzUSd8ejU
	kelscLYCUaTlgpj/QY+NUP15K6meals2rMAFlBKia80svxzBp9fB/uMumjm0iNDmSGyYmWBeH1D
	LMbCBa71jU/MTBo+9/Mg6URxFs
X-Received: by 2002:a05:620a:6011:b0:92e:59b0:df08 with SMTP id af79cd13be357-92ebb4c1058mr311312385a.3.1783366476764;
        Mon, 06 Jul 2026 12:34:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:92e:59b0:df08 with SMTP id af79cd13be357-92ebb4c1058mr311304285a.3.1783366475990;
        Mon, 06 Jul 2026 12:34:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c63ce4e57sm1325031fa.31.2026.07.06.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:34:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX4La2Zz56Gmn8
 nWAyrNGpRSeaMJnUyfHTejREKVX8hviH3VOIpvtzugOlWZTBoH/2UXaZ9mxf3lGHE7n5Qpc3BeM
 LiW6cUQcpYyULg8qgF6hxkF4UvBsSzFKGVxkTXLTHdsjaZPf9MLRH9AuN5OpGIMOvvaktAKUsvK
 Q2cdE8/ECHfA6sWuWeHSNjHTNX5bbiWTThb1hlaEsx0DtCqwOhufGDTWa+jtFtXIx83rK1/iyKT
 WS7pada/UQUmc2hGc27PDyb+C3+pTigVSpSE3YMnasL/3vlnfBAJboK047TLKkgdIbJvP8s/g5B
 KhYP6ZqUBRFAp/VSvtHUmQOeGdnKzVz4wgOSu7KfN7TUAm7E4C3ZKa1siHT9KqXuHwkWbt6axHp
 gs5vd0DvvkcW6f/EB4Q8Cj/+URUYWcKtNwNUwBssXULpRtsbY/OrGDbW1XmOuaVamZp/9acef8V
 pMoJeji3WkT9jL/pMoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX5/awOUhlohyr
 L78D4WkYDRFcz2j6kys+2nYMByfLuZsHJ5t1c1qqzNNte4Lmu5Bqi0RhCa7m2wg1C1nHDh1GMTb
 OSip55KfM3V8AKnYerM7LHN49wbdhGs=
X-Proofpoint-GUID: bvG5kpvKU9id1-ZQGn2ExplOBXndct9o
X-Proofpoint-ORIG-GUID: bvG5kpvKU9id1-ZQGn2ExplOBXndct9o
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c034d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=AjCqL75dquvNJiF6hoMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060197

On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
> On 7/6/26 19:47, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> > > On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > > > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > > > 
> > > > > 
> > > > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > > > 
> > > > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > > > through QMI. These endpoints can be registered with the thermal
> > > > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > > > 
> > > > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > > > 
> > > > > > >      <&phandle device_id min_state max_state>
> > > > > > > 
> > > > > > > Define common TMD device index constants shared across currently
> > > > > > > supported platforms. If a future target requires a different mapping,
> > > > > > > additional target-specific constants can be introduced while preserving
> > > > > > > existing DT ABI.
> > > > > > > 
> > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> [ ... ]
> 
> > > > Why are you using only those TMD devices?
> > > > 
> > > > > More constants can be added as needed.
> > > > 
> > > > Kodiak is one of the supported platforms.
> > > 
> > > What would be the benefit of having more than thirteen cooling devices
> > > declared in the thermal framework and having only a couple of them mapped in
> > > a thermal zone ?
> > > 
> > > I agree there are more TMDs but if they are unused for the moment, why do we
> > > need to add them ? Can we do that incrementally ?
> > 
> > That's what I am trying to understand: why the implementation uses only
> > the selected two devices, if the modem on Kodiak supports others. How
> > can we find out, which TMDs to use on other devices.
> 
> My understanding is that is an initial thermal setup. Gaurav will add them
> step by step while setting up all the thermal zones instead of sending a big
> patchset. And TBH, that will be much easier to review.

In such a case it should be noted in the commit message and/or cover
letter.


-- 
With best wishes
Dmitry
