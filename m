Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927F53CF671
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298700; cv=none; b=VcyVqwe2tdam6IARBDDUYh8c6vdeCqLooICwC5w+UOwUmVTEvkWCefCakLRiC14VmxiVNZyekbbRNLTOYof3rG2Lu28IdIcvnk7+RrpBt7XQuen16m4zJMhHWhaGaMXo1WlN22yjU0tnAdRU3ZmhxMjwhb7TjxixAe/eLxaekQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298700; c=relaxed/simple;
	bh=rnKDWblutbaVRN4OQavnvyRCkTcs5zBrEO+FDHjzCm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qELHzbz8DIv37mg7wQqyEqLpa4KWmslzOS4e/KXITHp3Smnj70YXKFDcpgQC4E8D+owLe9mcMlX1Rt3T0/uguN5d9rfumyqVWWVMErktl6fFW2z0iAaXWM3Th072A6P/wLf8OsqeHo7ObNt9FuPnnSNu5vnfgmBTBjQnjjmXXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNo9xzCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDEBECdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNo9xzCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDEBECdK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtgZb241408
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=; b=nNo9xzCHqOdmO6+E
	9k18vL8QVbVC7uMwRJ1zadVdJisrlU51Bq7lDBs5BNKi79grrpoYv2u3kMzlAePD
	pGSJ/Rhhz7U28HdYMmJDu3EkqZTpmDhkkpFGDTVi4I9vrIxmWZyT7OVhFI78ZC1r
	Sulv5KAoVNw+VwYLTSIC8e8ANVG9clEiWp8Ss2Mpb0gb7plySfi+/EpINXk5P8eZ
	0Alkd5fQXExM61QxvvwIjKQuiCIIQhyo+68K0TsgmNIQpK00+A7WIQbJrCMpMor9
	6gFJG9OO2vaQLDQlJi0KL4jK5DcHU56yxTRq7s9sEIsHxMdH42lwMNWi4e+lN2wT
	QeTTUw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946r18v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:04:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-61060ad8deeso586617137.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298697; x=1777903497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=;
        b=UDEBECdKLakFV+9ZjOa2WAvzJP6v+ni4/maCnONT6ygNpck3cDn0QH9M6m5chA3mxj
         koDAn1O3YPVJTIobWkHY8yws5xmK0rqYhYMuF1YFjJ2YZzIz2qhN9WUlRcSrdIAXjKT2
         BPJtJyZDd6RSdbR0oRxPDDwdDZ3X1t7YlcNVa4KGOUbAolNoNMeMokdcyQDQb/iJd0N0
         /B8UcDr2mNyWebMdb1hQonF4bOKwHT/egxPk/2cI2ate8aakCAsDrlXePRDfjVSgxwm1
         Ug+RYv0VBvLeQwMMaCExcDbU0B01cPStvY0KeJ2iRBxq8S/8aR7XHg4s6l/3X6tcmVu5
         bV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298697; x=1777903497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=;
        b=IYv80jBM5Z3rIQBe0S9SKfS3b2pJ/rF1d1YRYzzYhJF5iZ0g8BDGFPEZq+VgFkxUEQ
         2hHBBmW2Zw/kn2A+UNrc5miubCmGDa0+TYMuDWSsiodp5ytVPQDLuQ2soi+OoMCnHikn
         fZ4jqW9aoM9SnHffp5jxBNGUR8xzL4nlboKs2wV819FuLVifvG0T/+uJVSWmxHb5DqRb
         fGg6e/Me3yEUoRTv2CYOJeLXzS18I0jcRBYX9cgDkk5w/8oBTsZLfDuwDqyjTtg3c7Xj
         hJzjgYnfCpuV5OeKpGME4yF9PAY+p7YUCxRPlmck33w9mNdhQhks8Zvufo8Wt3LAFlfi
         fgzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ON22RfCL8TtPMmph1d1JBTpLuzyC8iuT3mRQLlO5+LydiLww6w+sWTiqBIbP3wKudmH/NGMY7CMnB@vger.kernel.org
X-Gm-Message-State: AOJu0YzyfBQ1F/MjJ0nkIjQGmwUZ0F2biW1j6o9d8uR7vC8Y83OIQFew
	glb3JkBNPFjXiBi1rZxEa3ArDNPfmU/hPs3U/4lGGKgoOAOJbFIN13Na4lwcrr+uZw7lGB8uoPT
	BCPUqrFUznIxwxS/glSlJhSg43v+Lgr34cQIxfsm1F+Ke+CpnPUCJD3/xvIvNEpfi
X-Gm-Gg: AeBDievwuJ5CCagKUiPIX5zysZemH+d5zC2O4gmrMbX1e+fORSZBjEsqX1rK90zeftX
	SQf4I9ImLGblip8Z5g4iuZ8oKUx3EBRCwiWJ0y3TjuZnnAtlI9vbbEvt7mc6RcwEchaHiUTI99w
	zUBTr7gx7wr+syvpp5bHCXB18NPgTUhTJ8+Vei35L2/WGWIGjEqy588kjxczqLcoUyrYLjhetp1
	x2WtcqnVyvIXZzCeL+4UT/Q/mTRxQnGnpxpLFjk3P7TDD56YnWJ4PhAGSBwqjtyRCcikVzksIPo
	df8OyBPvNU2yda5+wS7l1KHcSvWKuvy2cEOTCNDxQnocJhEgvHOFizT9lIMeAgDm5H5pJYKg2dX
	LgD2hn1fyfzMMKlz3rXl5FjQaU1O77vRCke027eukenvvGQdk3bm7U52pF4/HUE35sU08rLaf9q
	gz0+8wqxW1O9K/FQ==
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1167776137.1.1777298695366;
        Mon, 27 Apr 2026 07:04:55 -0700 (PDT)
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1167625137.1.1777298693398;
        Mon, 27 Apr 2026 07:04:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm1100136866b.63.2026.04.27.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:04:52 -0700 (PDT)
Message-ID: <c145efc2-9285-4e2f-a9e9-73c4faadf15e@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:04:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef6d09 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s_dpPsJcIKQ2JMW1VggA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: OUWlHkXtUt_opmP2fXJ4FXWyM4DKdWci
X-Proofpoint-ORIG-GUID: OUWlHkXtUt_opmP2fXJ4FXWyM4DKdWci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX32VSUTu7vCLF
 AsSHLNqLRL5PWd3+jWfY/JrprPKGx1IjH2Ajsflqjz3/lU6MVKCTJEEs8zHlxC8Z+jUyZS4kxLv
 Cdfj0zH44hM3FFzdm2L95H1JSlkIPNaG4e+yB1Pel/5SN8SwtOOd0f8NsdbDRgm5c8s9FM1aJuQ
 HI18HE01Xx0jZ8OfhqCv8rOP3tGT8WNoJ80OZS9ELjnB/46GNgiQ/OwgegW6JgEaE98KhRyra+S
 kNX1OJbvMuGrnO5fTjEMriK1vsFWvkdhyXewZfn7yRNxwNZHPaQFT2GZ2+suwW6Ce3Sriwi81Tn
 2I60PYUzP8Xqki/WRAIv35yEJqPCkN8aJixkIbe8C6XCEQJRP8yB4ojdwl1YgoYNTULqGRJ6GmO
 jl1O+hKZyGGSei1wBUfeJl6Buka/qR6eUAEgAP1KpUwVRSOi/BE9RPB5QuR/SJbXYFyoirx3FEF
 LWMVRC4o1XpvgxpVqsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270149

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
> 
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
> these clocks are automatically enabled whenever a child node becomes
> active.
> 
> This avoids the need for each subdevice to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, OPE, and other
> CAMSS blocks.
> 
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
> 
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i++) {
> +		const struct camss_pm_clk *entry = &camss->res->pm_clks[i];
> +		struct clk *clk;
> +
> +		clk = clk_get(dev, entry->name);
> +		if (IS_ERR(clk)) {
> +			dev_warn(dev, "failed to get pm_clk %s: %pe\n",
> +				 entry->name, clk);
> +			continue;
> +		}
> +
> +		if (entry->rate) {
> +			ret = clk_set_rate(clk, entry->rate);
> +			if (ret)
> +				dev_warn(dev, "failed to set rate for pm_clk %s: %d\n",
> +					 entry->name, ret);
> +		}

So this makes a couple fragile assumptions:

* there's only one "on/operational" rate
* no OPP votes

I would imagine that in the camss-is-the-bus model, the top-level
device would house an OPP table.. but we have two somewhat independent
clocks that may possibly have separate RPMH requirements for their M/N
number of rates, which could result in M*N-long opp table

Konrad
