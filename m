Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A3641CB20
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556056; cv=none; b=r3P6TkhdYQUACs/AHZruEcAke15Ao6xgAFgr/j96b98s79PFo1+dlU+8yMSgzLaKQmgCIXBk0rIvRe55F1WVRSdwpskcD/a7E/VpnnB+dg5eeVphQw392zOIbaN0OqV+FOFeTKGdwiWa1mOTVLpiiHPqQFQR++f2dGZNG2NaeFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556056; c=relaxed/simple;
	bh=ars068aHZ1zh6r3O6lVpEYUVNtKxsXYVCmqzKpHYpXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfFYeeRIdDhKYKsNpRxNr3clfbzvdfkGl5pD6ebcCaobGPreWAw0fKwhqWaVX6AzHtsWUjwznMeuegmGwT1xBC6J5IugFDGGtcm11KOTxFLihIam/HBTwkoX3rJiybc8iHtuyA9cndOzLB76UdX73BnvpNikvbi3xyvd7LZ8ZA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN5JDXm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTtUOjSQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN5JDXm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTtUOjSQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrP4e2880148
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fEZu2O1SGmwVg7wnNzlMQJn6
	s9vJAsCWIlk1lovELsc=; b=IN5JDXm0gn7aUWNX+Ve+odkyQbafQdowEygyYYOn
	pxzrMbHownBEMfkaIDEO39iHHRtMmbHj1dnxja59lCNK7PsL5UzHgURD68ePvsP8
	uev/ZklUqUwPTqY715T9kjB9HRdA9hmk32Z3FCAfjDSzBd7KlCTq/21WwXoc1puV
	UWigTwtBZ/bQ9rLXVQuH6LCuANLtG9dEHFHct1ayl/MPAO0O9xAlYDo/f7MQYJ15
	+fQAqaE9YkuNeTaoQUSiEf9UEmDl2hwoWYy3uVyIl7woQvmBht7aGs0nAu6WsOId
	9hhMJ0XSVxJMoDoNC+hDhpk567sQwmXGjf3d+u2Bb0vr8Q==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0ksrp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:00:49 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4488f192768so11412142fac.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556049; x=1785160849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fEZu2O1SGmwVg7wnNzlMQJn6s9vJAsCWIlk1lovELsc=;
        b=WTtUOjSQ6xxjKlQuFKqIMzoRT7DOybEV7siMTZ+M1DyV07mNE0yTL+4LwvUOZuGj3b
         7SIFjr6Kr5WP4Z7h8hJL/0uls5+VeYMAt5X48nB7cgyoSeJRlhrrHxC8b/xZmm4pYKYh
         Jta5KmyA5BmOgCQ1hH/B4/27UM9YZqun/I/QXWAyoe21r3LI2SymeWeT+ua6x7Zif28y
         ZxS23n7ZiAuRlZBNSk3beYaN6U7pLXQaXEPwB6X/ctpZdsylZPNsPjI3SGvZ/yLEOH0y
         UAtlB1k7yQmKUbWg/n7rZiP7wtO4bfMoaUfza1aLadL8zpwxBh7CLIxtZKZvxyUmtG2I
         5NuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556049; x=1785160849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEZu2O1SGmwVg7wnNzlMQJn6s9vJAsCWIlk1lovELsc=;
        b=GmIclkO5SkOzYxDP5K0zyPADbVICpRx1dLKyU1PCoRIcLBrNkyyzBvMg6GSH/dZhPs
         xWBpE0xY6lfA1tJYwOmUOwg2vJX0cSg/lVpzrzTakh069n5RGiThOmiPHF7PujrUY60J
         S5ro+KBd1KCHFs2ZpQ8TO3ifyljBnK2aBuBcjR5qmrX8ewTLRHPrMEiI2oN+0eHYWd1o
         wef1tdQlk5NONLLadeV4A7npJr7tKjiPZw/FEnXGF3nOe6vKT36zV09ztf/2U4MCdJoY
         Z6l6pXk16aX0wDeWMs/70NHSAzfiDKZnKfckSA4Bc74xC2WMU0CQSkebfmzE5AHZs8rI
         YL9w==
X-Forwarded-Encrypted: i=1; AHgh+RrfjHekP0D1c64b7UVIZHw2VHsqXa62P/mcngr52+TGYxDSfET3nSv1qMgncNJchZFl9tIZxRDyTJNx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/R/s5V2dHmUV6XrtpVvSqQqz4JL1EHX1/YLAzW6X+fW7RKma
	aNy1pZu8WxXmk6sNBRA/9m88AaFfRoHEoYP7XBEa5aV71nu21zNM1KCuzuJCY1goec96SmxFrqO
	l7ta6ssFnvjcnoJsQRPr5EwvhRGOfcL7ivfPJNH/0iKgU28ROX/n9RjyK41ETuEKp
X-Gm-Gg: AR+sD10O3U44+g9RYMrhsZwVvMhrEYtbqoFJs0pWicnpn0nkMwV5HCblnQFH3bM1U9B
	/yiV/FfCQspZbTyCP8xxTAprgSTm/uP2CH7gaTlinzDSADrZNBexJTQEzJx6qOHBHAZwn4AY4YQ
	00hBaKRvNyIbuT1FhI97JojLqZIZRBIWuCIRNuNdAwcCevw+IbVz0h+WHfzCTSbOjeFIYSXXggt
	XgTggBGTbvRfSWjOpdSYQ1IJcegV/R8/9697cGWyU63Japyi7sMCZlDcqxYJRUYvaCbq2g1JZ8T
	ZQEhh5JnXIOiiReVHDfUBfxXQPX2R44iomkoH1YvylgYUlVYLA4phE9kUJ7EdQedcfw5vHOMTdH
	xdQNecPITG1Os6+JjOjoJM3pttBLWKACZK/c0+kGw/fQ=
X-Received: by 2002:a05:687c:235b:10b0:456:b3d9:336d with SMTP id 586e51a60fabf-456b3d9398dmr3529615fac.20.1784556048204;
        Mon, 20 Jul 2026 07:00:48 -0700 (PDT)
X-Received: by 2002:a05:687c:235b:10b0:456:b3d9:336d with SMTP id 586e51a60fabf-456b3d9398dmr3529568fac.20.1784556047507;
        Mon, 20 Jul 2026 07:00:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e6a92f5sm8537588fac.15.2026.07.20.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:00:46 -0700 (PDT)
Date: Mon, 20 Jul 2026 22:00:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
Message-ID: <al4qB8gIyLSjPBGS@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
 <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
 <al2iDH2b_YxdHfLO@QCOM-aGQu4IUr3Y>
 <d5240c7c-6450-489a-97a3-c774deb129b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5240c7c-6450-489a-97a3-c774deb129b5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kAiviZ3l8aFxsMGwrKsw80Ul_RGNWhKn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfX77ZY6rjp4nyg
 bnKgLfdJJ/fnYMxiGIayXlg9kiLTOitguShoVZAD3BDNTXwUFIWk5raltrpR5A2WDU8OQlvRi3d
 eloInhcy2uCDngz71Ekb8JrS2NRuuTQ=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5e2a11 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gi19r5wPGwIhDG2GCIMA:9 a=CjuIK1q_8ugA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfX4mjM5Dcx25K8
 tm6zuQqsA9RMv3/6f7VM4OIdeZEBZaWto0/ZXlRQFTpw7eAquT0/Nq/gGa/vXboPX0p1l9YRI02
 KKG5vM88GJneqPWhONTENHxqpUES1srunAbJ0giHBZZhHy6dINll+FGK4qkpv6LK4mw14D05uT1
 PGywGtswwnclIEYRv+1hJrpvhyDruW6JFMOQ0zCOrgMphYviKT1KRol5PvYsW/SEn1R6kPlPiOe
 ELrNoDAvuZkRHQyDHf2/c3LYCkIY8OEdyVkaULtTAlVmhbpMux8ZDh90m30F7vhLjxGVORjL49Q
 xuX9L42T6TfJk9vgtOwXb2G80JouvyJPVsNZMDrtJObw71RGkros943NYP4gTHJdpE5vHxbENtc
 O9PXPH29OiLBz281QetMpQPo0okgWg==
X-Proofpoint-GUID: kAiviZ3l8aFxsMGwrKsw80Ul_RGNWhKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200155

On Mon, Jul 20, 2026 at 10:40:09AM +0200, Konrad Dybcio wrote:
> On 7/20/26 6:20 AM, Shawn Guo wrote:
> > On Thu, Jul 16, 2026 at 07:14:56PM +0200, Konrad Dybcio wrote:
> >> On 7/16/26 4:26 PM, Shawn Guo wrote:
> >>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>>
> >>> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> >>> which is built on Nord GearVM variant.
> 
> [...]
> 
> >>> +&scmi15 {
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&scmi23 {
> >>> +	status = "okay";
> >>> +};
> >>
> >> Why only these ones? Can all of the SCMI servers be enabled?
> > 
> > These are the ones that have actual/enabled client/consumer devices,
> > e.g. scmi3 for ufs, scmi11 for uart, scmi23 for thermal sensors.
> 
> We normally refrain from enabling resources in the DT only because the
> OS (really just Linux) doesn't have the necessary support to cope with
> the ""complete"" system description. In this case, there's a firmware
> layer drives everything and handles on/off requests gracefully
> (hopefully).
> 
> > We can enable all the SCMI servers, but I'm afraid that cause kernel
> > to map shared memory and issue SMC calls to discover protocols (like
> > power domains, DVFS, resets) that have no consumers, which might waste
> > a small amount of memory and boot time.
> 
> Please give it a shot and see if there's any immediate
> problems.

Sorry! I have to take "We can enable all the SCMI servers" back. I just
tested. It seems that NHLOS ABL doesn't like the idea, and it
fails/refuses to boot Linux Kernel when we enable all SCMI instances in
DT.

I can try to figure out the cause by working with Auto/firmware team
internally, but that likely takes some time. Can we address this later
as a separate topic, so that the whole series doesn't get blocked
for v7.3 merge window?

Shawn
