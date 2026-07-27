Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97423B6C15
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175936; cv=none; b=E7hAb6jCSQ7vXZxKPbtSIPTbAT86mgSb8a8RKVvo9Z/JIRbDIWX4Z8HL1zze5p/2mkbbGIN1gNENFdLnw7P2W1ID0OwsXO/tRDawHFjiT1ag4dIsjjPXeig9gnrxxAMW+6NhophiTA6dbWnuH3dfyRPyVEfdjaRuqAkvfVkoATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175936; c=relaxed/simple;
	bh=gLMEKqEEwV/fRvQQ1VmFy+8sHppbwdhNA9c9SfGg1oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6YpVPnXf1hh4A4NOQCE7jep3hz8sP25GHi2G+x2VACcP5/MWsvQBnmz/SuVA0tZ8K0AQ4XeR/53ib/v/1uPu9rEA0bnguJTOVl0yRGgXdPkb2W5SpIEehOPDkwGlwPPyrA5fOvEDMQP1FSyROO6D+eDquAoyNCTUnymAww7Yvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZRh8Cae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQtdhh9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZRh8Cae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQtdhh9T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC1hL4028804
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P051N9m9fNC2s4r4wBi5jlim
	x4aHj3hNeJV9vNXg7lI=; b=eZRh8CaeF3/j1iPYpyGsjLL74xlFpNPLjI8DBjfZ
	YuP+5UfxtyrZ6TnDXvtl/gSfsDXb1kW0PEwBkPqSDlWswy+9v0KRDw9v84xUxYtE
	aEsWmbLGN0sli3fQXtEbfwqCkzYHvt/mdp1BrBmpJCdB8RJLIZdSEdBXkSA9NWSM
	o8HkgzBFW2yIqXuGxRAmBUBT/woaGFhf7D0x4F9xbnT5x1eJxvi2LmVhmOiqbJxX
	jL+3gJ175OItl8z+gFoX0i+FSSkKi1Wk97GRoG0+L7DmMCe1E/3kKfTQxSobEuDn
	MHWqcSFP2FEp0U20ZAhrglGR1gVadmd+11oEohyrpVtH2w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v6a7u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:12:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so145648a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785175932; x=1785780732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P051N9m9fNC2s4r4wBi5jlimx4aHj3hNeJV9vNXg7lI=;
        b=ZQtdhh9ToVInDvH5dtmwruZXvBQo3AFMbKvvhWlzx0rjtp0GGE9aVvN5x2EQkELLlm
         qYctBexSf3g9WcUyGV/Unpr8lXSTrX7zSW2rhGyw7WDXU2VAhmfsHxW1ffeB7+OLK+oQ
         y0LVZqJcbSAKyMIXQ3O0zaumlfFshpbsZ0MJVPUGTQuj7iB6VDeSmhra5IzbFswzP/SB
         MvsaYxvPv1cp05qbl93uwSCeo/O+kObZ+Rs89/v9VSbf6mOHZk8ZqT21W3cWoZCy2Vui
         SxYRoT/yX0CAENBUAjPiTQNjjlDGmHjmn2cGB3incE65eijbBjN34NSDzwwlLxohXFrB
         HhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785175932; x=1785780732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P051N9m9fNC2s4r4wBi5jlimx4aHj3hNeJV9vNXg7lI=;
        b=Hxz840duU1CWj6FP4Q7SwzeGDiyBemg1ebemQM9L37Rm2gdWntuTi/15OAP06ha42I
         BPgUwNrHVW66iCQe9m6sqvyPyeuzA8WS7b6TcMxH4I7tywVWwYIq9IqDNVvon61GN6oP
         46SEsJfJ8dNbxuW5J1FiR5w9TNqE7QsSg1Cjyc5AghqfT2LeEzpv073deHsQ8F7IxJZU
         j1O4AKsfl/b/pH7PKxjvDd/hESQX9pMq4Zg7vzku45eGPQqhl6jfPNCa7lmUdQcOO/4m
         FMoUOyOIv84IMj4mxZAbKu0LQQu+dYvxVpdAGIw4z948kgiWy1hoWGTN0P1xnFVwHAoR
         AyTA==
X-Forwarded-Encrypted: i=1; AHgh+RqJXjxTqBU6oP+oRGHRJys2Vw0nbYm2zVHZkynHieTNfuzmiQ5zVHl5siSoWMpkbMByaQKLb51STPdr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo9VNPyNkc9nRlFm9pbPfsTZ+Kj/G6E7VC5W4pHMV7lrxN0D0/
	rfmJT1754uIpx60wUomjC/dhBgbLd67sQ3rUnfPKG2lbabUroZubFYQPQ0kde49Uw7Pou/bHFqa
	GkjLArvv+qNjsRisyn9xYgHATfcN1tmZNuhtwS2zJjgSoP0Uvx1ESTWnrKpYg2weEzj8f9GSg
X-Gm-Gg: AR+sD10dtCb739fskpP0PzZOoe/tz+Nmh8NOqZcK5Gjujhegsr9nyUoGJG1NatjTFnR
	huuP+r6UN8z7o6wnk/rTf/GIpHBXMXDh4ClgXu5A0zKlHltdINg/+Bd7IkyGkNFAY3bNmPVfIsH
	Su6va8IFPoWBvJ2Av0vke8eZ0b2noLnuHJF6DLhXWO4OQ46ckf8c2cp07Xtfoxgoy7sacWSQMcU
	+fYyHNTayplbb74Y9qrHJVMz4uAiNdUw83OSI9708RQeXpruUb9O8pO3xFDOn1IgewZ20saa9Nh
	831WNNr9RLOruQbV9bRxSMLOdjQGMDpGc9TRIH5b888wxCFWhLeO3m8mIYlivY1tTHgJSXHYooM
	I6RCTTDbrjASstf9DUcmwr6nDJA==
X-Received: by 2002:a17:90b:5625:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-38f644f8641mr451028a91.20.1785175932471;
        Mon, 27 Jul 2026 11:12:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5625:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-38f644f8641mr451004a91.20.1785175931937;
        Mon, 27 Jul 2026 11:12:11 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2d1d0d1esm33096048c88.0.2026.07.27.11.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:12:11 -0700 (PDT)
Date: Mon, 27 Jul 2026 23:42:04 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <amefdKQOfyRgeWn9@hu-mdsor-hyd.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
 <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
 <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
 <hmqt3rwlcx23lndkeky3ykk6or6ibfm7si7gh27utexeonxzqj@67yvhyey6oje>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hmqt3rwlcx23lndkeky3ykk6or6ibfm7si7gh27utexeonxzqj@67yvhyey6oje>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2OCBTYWx0ZWRfX0T1SHZDzbLpf
 zH3+1Fh1s3RP3Pl3FPx7DNNMmd2tCkVuB0xNOypejVJNo3ZEoHK38sK3djLzV9jf2O8e8vhqErx
 uFjWuYA4OVJAK5XEqJGSbI66mZazzDs=
X-Proofpoint-GUID: 2E88ia5t31gbByFr_7LYXPpARXWRFPg9
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a679f7d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5IGsX73iB-lTh6suV3gA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 2E88ia5t31gbByFr_7LYXPpARXWRFPg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2OCBTYWx0ZWRfX/J/807/C1SBd
 rdY4NVHJl8tBbw1qIWOKbtyz6VVfLL7poLY9PFcK3SHVa6fNbXn0+LU5npE22Hg1JeyEeTCTzMZ
 CDIGYht5+YZAtvAuzu/yphKFtuJPYj6iio5D3DPWv8qJihJvc46la7q+jDYAQhgKVzyFjqDZwAe
 Zk1djY7q6jqzd2zHtmS/rPVJf7aT3BIx0ah+DRi79OokJMx8tF5um1qmZF9jdNFeOABidXI9+xM
 JFdnvTP4DBtDX5CGT47CIYlrpMJce8552+KLnFjQZVjKI6h25CxFPHgyeRm2jqYw2sLGvUhiTdS
 +IyCUZkwlm4fB8VvVhQX+5pwya6Q4EdZKOpPINNd7b+tSf+EHh1GgKvH5GEFY1hmXqQab2gWCNS
 h5pv3rnMrpm4Q29yus3VjQFZbeHlYAjvroPcwvCiRle1CnuqO7+u3zLYsRvilssPpmD2JiZNEUd
 7Xf6RAtiK22hg+W18Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270168

On Wed, Jul 22, 2026 at 04:49:45PM +0300, Dmitry Baryshkov wrote:
> On Sat, Jul 18, 2026 at 04:54:07PM +0530, Mohit Dsor wrote:
> > On Fri, Jul 17, 2026 at 11:17:10AM +0200, Konrad Dybcio wrote:
> > > On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> > > > From: Mohit Dsor <mdsor@oss.qualcomm.com>
> > > > 
> > > > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > > > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > > > 
> > > > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > > > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > > > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > > > 
> > > > The bridge receives DSI output from MDSS and drives an HDMI-A
> > > > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > > > 
> > > > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > > > ---
> > > 
> > > Does the other EVK not have this same hardware?
> > Yes other variants have this hardware but only IQS variant has
> > DS-HDMI as default, others have DLC panel as default.
> 
> By 'default' do you mean some DIP switches? If so, please consider
> providing overlays for the bridge to be used on other variants of the
> EVK.
There are separate daughter cards for DLC Panel and DSI-HDMI, at a time
only one of them can be connected.
We are planning to submit a separate patch series covering all overlays together, if that is Ok
DLC panel overlay for the IQ variant
DSI-to-HDMI overlays for the CQ and CM variants
> 
> > > 
> > > [...]
> > > 
> > > > +&pm8150_l11 {
> > > > +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
> > > 
> > > This comment is superfluous
> > This comment will be removed in next revision.
> > > 
> > > Konrad
> 
> -- 
> With best wishes
> Dmitry
