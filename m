Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA94C33DE
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057926; cv=none; b=Ev9SRC9guVu35Raycuae+r92CcqfMQEvpkUCeawEKoZnyjvlm/AKbwuO0b4LieLalRUT76gPSp46cAzm/S9lsfdYZ5QJHax+xg8hnVflAX8EkuX4oJlwtXscZnWzGRyc/yYM2LuEJArlI6hayPfb5yQQWR3BI8E0d33pq/0afpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057926; c=relaxed/simple;
	bh=uQY8EI8B9VP6hLXMRt+43e+JuXSg+j2byiOVsiFsDlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpwrUZBBMeeeXKIm8k6/Z1LMT+am713c6SKxMmFuzG3b285pw1ciUr96uula/bE8coOPu9i5rP1KXzCzDdko8Uk4kCZN3rSYfr7+iLcPt/Db+uFPnbDOKtQSssLXXiCsYl+FLzD7ivpKJgclOM+hqibLh8oS77dKbOtkzeW6224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YINz0niC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vhz4yC9Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YINz0niC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vhz4yC9Y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0F5va3186661
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OMbJHWaOZ8N0DGS4btDo8Qd3
	3M/+POi18Q0KPwlERwk=; b=YINz0niC/fjn/a8BnR3sreQWry/Yl+RnOtpPNcSA
	BhdSRN3oWOrqFnkjgFugKU5RTxUPvOPTMN/ahBo3hC4tfJsJMvmS9ssO/8UqjXpI
	PRfjxqpyAk43Bs9LASJsH1ZxEnlXgZ8IefLsfeNT0VhZ0P2rJR1I3garLNffYSl5
	S35+JtpksHu1E6v3HI7DrzwTb8d5TEwwIFSCULrlkaGle4ALcO0mAgJdU8T1SGTG
	PfO+c9Srmv3JfEnfSV45weS+pPgIVtprQIDxyiYWOnbAN+Dpq9MtA7hfO2ZQCI9U
	SdYd6h3+i4vMWY/M0DR1WE4GId8t4idGh10mj1V2SeNiHA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybh43j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:18:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so6717983a91.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057922; x=1790662722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OMbJHWaOZ8N0DGS4btDo8Qd33M/+POi18Q0KPwlERwk=;
        b=Vhz4yC9YA4M9CmVKtOUAyfg4JCkSLObrJot1yfHr78XTkJzOZilrnq48E90AQ5ZTsM
         fcEEnKKsMHqGoolvL9p93TXXHA2GV00NQH7WDkmqzoWGua63GatsdAJu9JsQeJFlrAdW
         5rJzNSEalpCwr0nNPCMBv3+qn40X0jkSJXd/8Tkx8mfkR4C0ac1aYtsTMteFAAHFjaR5
         QW4FOicVDL5DwoEtJsJHjdJT/rAYZ2kQKyvBvq9krCGo7WFRRwE4lYSinT+rxekU9/C8
         JUkjPJlXmlnkULEVzwLyuKydrFP6Za0RPjXc5IrNv9ju3JjqplqP6y6geWCW91BGz1iN
         NNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057922; x=1790662722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMbJHWaOZ8N0DGS4btDo8Qd33M/+POi18Q0KPwlERwk=;
        b=HGS9f2skUv12L7kiqy3BXQqiT+D++S1o1aTYXq6jRNv68KQ4boLzwwWt0Ri1jnzjtn
         rJ66chn2aUff224/gICPBjwbb+E7BFWCAf4etfuqeI2a2/bw8YxTE1fld4mV2lzn+q0b
         +47NNSezsiswg8HqoPavAYG7iIdTn/gHoSrKdMr4v30ha4PHCR+Al6S0CUZ0cdoPiJiY
         lpme0aQTzyeF1LALdja4D1wwMEYtlF6bqmaw9QrZ0B3klSwD+JtIjKqRlRLUo6/5rx5/
         nnYYuXtq6Z71rXf+qMvJlGALpgGJsKi5RE4oqcIhOsFNG2HDxCejI9u/1L7vbAPf+tTj
         oupQ==
X-Forwarded-Encrypted: i=1; AKwUvBznM8c12ujUyBVKmBXcM0dyc4ueGXrIca2Xb9o7Q6WyjGXI5Trur15msa9XytDDb3/fEP9j2ilbRwKo@vger.kernel.org
X-Gm-Message-State: AFuF++lznFhSj+rvnF49Tj+RQru3X8I3DKlH9rpMtoHZzHg9PMCseEiT
	7AcJ2w07G8PPzQgZWspDkV5Jai/NflzKR/Zifwcr3HcXZT9tG3+l5R+LYJ1zm6UcLBJbarsRi8B
	6NalSrKFS/Ll3yiCc/qOjQ7BVSLiGr8KX9XbuAMnHiN+Pcr/fA6GqQPHsl2SzAA3d
X-Gm-Gg: AYBFou0EQWIQAk0AqQkwL0TLifiYriNsB2GfAsgWAIKKEzF5/M/ZvXUAdBRNdGu5ilg
	tuWSLGUZiMy+92GO+qfsjilptN9cP1kmFNEU4Zujinf0FN1jBL1J5NSc+lncLIGW6GcN1/o9EKI
	QJIG7cC9SxKTctSOGXNgT4xqIo5GMI+TdptnRYzI6a3Cto9NJa2TW6xO3UVGipprJh6TBWD3wFP
	hA9Wya/KfAc+KkgPH8Z1B9MFzeOFwLYQ3cXwpOCGFsg3lZuy/5k5X2+5qAMA1QJP7NWd7KAVoUZ
	rAIw/CSqQayVkGtnRaIdhWiwlXVo6QAWuWaDxwRxJ2GeT13Zhkb9g+f2cTD35JwPDUGfQex9eMM
	dFe4gXK1jnSejlQfBLz5JPb5qmS7ZQ66+YDc=
X-Received: by 2002:a17:90a:c2cc:b0:39e:6a7f:eeed with SMTP id 98e67ed59e1d1-3a0731ee972mr133596a91.18.1790057922042;
        Mon, 21 Sep 2026 23:18:42 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cc:b0:39e:6a7f:eeed with SMTP id 98e67ed59e1d1-3a0731ee972mr133570a91.18.1790057921573;
        Mon, 21 Sep 2026 23:18:41 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29dc903sm2383833c88.3.2026.09.21.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:18:41 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:48:34 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <arIduhGIo8OlOVI9@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <c2f3ae91-4f0f-40ad-b03a-6d6340ec6244@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2f3ae91-4f0f-40ad-b03a-6d6340ec6244@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab21dc3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sxflmpJIHql8OXV1FfcA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LBQinwp9xK4q1jRkJQ1rgXKuWCP9t9it
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXw9VohvDskpTk
 B1XBIU0prc6Gum/TPHINorcmhNhqxbx27r59nuWdShHdkzJ1fN9mA5+5xh1MVin7vEJkGfcs+Tl
 EiP6y5B9zXare6E7u0iUZlVs4UeT9XSCnp0Sh/ZFlkY5Rr7/d6XENAheXnUHg7D5fuTHw/guAbG
 iBtVihBnCv0NAAaFEJnTmKrMC3RgeTgIRAbY7+QOWiXmZoDsudml3ISai34hFNhFKrGQet3jNU2
 N5A8DkKhIVuEp+3Xs/XAE0SWrh3E67BPeE9WAE0GWWpqNm+lPlk0CSZxsUaKrLULxovAPnjbWlH
 cQs44X+h6nEJvPFWpV+ceMwRPoSIyovznhwM4aLjRAiGjcCSklCDID6HfPUDtc2wrs4bPvNky/K
 8QT+c/LOacQjNweYqm6F49dkYSLlcsug5rNCyy8WmVwvw7Occo2I93vTdS6SpEyHqQYl9p7fbuV
 7Y7sIB4Q1AT27EkTsdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX6gu5eYgldr4a
 hNuU1i4MROl0GP6eogL27/FBNgd31+kNOGdwN5L7Nh7k3wjEM0E1GknVh+5HB5vE2Q/B2yfpElR
 xxGsntJr0BVkeIcgbN83ssdSTJwnTmI=
X-Proofpoint-GUID: LBQinwp9xK4q1jRkJQ1rgXKuWCP9t9it
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088

On Wed, Sep 09, 2026 at 04:50:40PM +0200, Konrad Dybcio wrote:
> On 9/7/26 8:33 AM, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&i2c8 {
> > +	qcom,load-firmware;
> > +	qcom,xfer-mode = <1>;
> 
> This property is undocumented and unconsumed
> 
> Konrad

We will remove this in next revision.
