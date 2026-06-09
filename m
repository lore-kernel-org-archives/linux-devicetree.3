Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6373EB7E8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991569; cv=none; b=DEHYKDxLbMcviCQGuoUIwaO8hJswHHSrswCmOUGhS/5DpOyzqFpOQTWiJ/tOzooD/HaxYBZ5FBthWks09PR/71VjjOfdd/SumiG5h6zGv73xVDSUkOsdcBd/bRcy3WHuUvQO7I0IutcPBNrsDl020iBsQl0fuKxIL6WgWQNrhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991569; c=relaxed/simple;
	bh=az+zpCRnr38vmPuK2q43gKmU5L1LhMy3JC6M8/Khonw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9yBwGhxYdpqSVZoEoYH9TWriipfMRUx1nb4rG/OdsexGam7Z2HmpioK5rgoYmdETGfn0W3xjAD4sdsmRuQBDouHqNAiJnC4raWWk18XMtr51sdQoi3Vw2CJ6hLIHhLA+3GoTgPppKJDuFgENIbITLkB6AysHWcdXTYU7iwBraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct6gBRAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMohSA36; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct6gBRAq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMohSA36"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597PApS1859716
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgxXX2hS8aG2JxwC+zyGcbB4
	dqKygStbIyRootZ5ISk=; b=ct6gBRAqo5x+AOIkv/RQvh9d55tSPazqtB7C/a6J
	kaxu/CHnZ6WRsfqHq5JSTaW4PuqTW/DsSbAa12+bH3seoxPTuLH1RuEk25NDvM3o
	0Y875S3nRF+L9wIdMqrgQxiTZ36HxgVrOdVCUlZchxhG8ZCJXTyrMtN83IyLQyKO
	kCieWCMS9DK/rkMRSJ2aIiXleTBk4FTQkNavP3J2kPlKVETOTNZ1HUopIWtx+4ux
	Z5vOnmmjPrcJ7Sx8tm6jONfQboGpaIYKpA023Sq7VPF4hRNvegfiFQ70VM7IvCbl
	Q+zbbgO5grqHRou0O/NaBt4kALcfTC98TKpJ9i7rVpZ8fA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4g3em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:52:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bf6904a6so75249875ad.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991565; x=1781596365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JgxXX2hS8aG2JxwC+zyGcbB4dqKygStbIyRootZ5ISk=;
        b=cMohSA36+wTsHbqL0301jZCBpdA9iQJLMDLHOzgl/+guJyaHoXhgsc5dECcYQ2v2d/
         m5GKysVx3ZIlLj2aLulCh2CjxIaNb3P6EYJP+aF6ysvHyCrb1ywryKy3c+1BweFvKcHP
         iWGE5U42H2BYcal7vgqG20Iri8PYWyi716YiO8g39JT67zt95lxgBQbIhtY5YRKBvmcC
         fm1XoRxIigRfRq9zFSoXTNgc2sywTAcuRVf8ebQjPvlqyWgvo958bZu6RTK4qjrBaBCx
         DVu1D/jDzgqNMMjHCLa8K/aVyJpZNFkfYa1gKpDGQgzVcHt6tlXBXGUPEIAW6FNk9ZLi
         UCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991565; x=1781596365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgxXX2hS8aG2JxwC+zyGcbB4dqKygStbIyRootZ5ISk=;
        b=HGN1bkhFubcDUfzuroWQEIril7Oo1LlwFGf8muvt5vB/kzCwS2cvhlLfM+fqE4zQox
         cMzlCM6iZ4d3Tz/dAGHUWMi4UihOrrod70xLJWqnYfy1HQJ57B2jSyK0J8NjRz6YC/im
         gmrsLxpfE/XH6zko6vZLl4uc2K9DP2F3ZYoaBggt/S/+mMw0YeRI5+C08p5ijNzdm12Y
         aVXRKGxH6gxovx950uJ5uzo0iSA8Fz2h2ojoqjMP4k7fBFCH137KE6t/o3MWTQl43Utc
         KRmiTaC0x4su1xHYvAdoywzhSz2ljQEsEkeJ4Knvz+5025VSY+ufefpUSlOkjb+umIHG
         ahOw==
X-Forwarded-Encrypted: i=1; AFNElJ89PWUeVCO4cKtXhqAJOVoiXFGeW0uStf7bVS3LXXiLvCH8dTwy8Gf0jXPD1uYymk53/GeyV3d723Is@vger.kernel.org
X-Gm-Message-State: AOJu0YyDsk9OvxXAsQWYEUaUpAF9u4RlMz4Jc7GH2kLKEdd1CJfiEZrO
	/U5yr8OLHj6VWZ20sOGhaxofpNkoRzHX0r5AWTLG5awy4lClXBfsxcwljFW9EvVOaqzFi1Afr4W
	WOsSMrgo8UQDaGpBkCFyvmQvohzQCxgknSMZp6weTxuTQ6vVO6Vl47vclui5T2upn
X-Gm-Gg: Acq92OGo+5yvjkPBepgmV/18Wzs5CPzCbT8DsSNEDFyyBom1f6xbDxV0Z4an1xWONXs
	mGUsfxskoJAxSdHuM1EbvA810CkTJFhL6FJOxERxQdaK/DWF0iCVBfBG37shAjrPdFN1Er+EZhp
	O6HhvBXjRj0JjSFtOE+KGNaUnmk977iyg/uSSjsPvMHD8toEipAYzTXO6lvGQkKIqO2SOM1t5l0
	lo7ibQhnRj2a/NshHp47645NHJCrJT+w5D31uNwpINSGOwtsimuBStm6kJU24LDMpXu772dJH7N
	9Nk/+enEAY2QZldq1LnjKL5ZtYa4ZSjGwjkR0Y6BUckuCYXj/g2dMuPO0gb7EfoMukWOLgqAvBI
	ZWDV3gQPfhVWM8OIpq1SyUXLBDMnVjEmEZWSOZ4MB3GcWhYsqmxYYdd0esdXo98vneRaX2+1uNP
	re8fRNKlQBf6r86PCMF6Rm7JAyROhaak7lB/55ya99g6fjS+55NSRDwCP4yfrwBQ==
X-Received: by 2002:a17:902:bd0a:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2c1e85aad5emr150943795ad.27.1780991565568;
        Tue, 09 Jun 2026 00:52:45 -0700 (PDT)
X-Received: by 2002:a17:902:bd0a:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2c1e85aad5emr150943605ad.27.1780991565164;
        Tue, 09 Jun 2026 00:52:45 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm206121665ad.24.2026.06.09.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:52:44 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:22:37 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Message-ID: <aifGReQQ12BdgCMb@hu-varada-blr.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
 <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
 <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27c64e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iXUmG0lFcv0RUynX9scA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -3kZKE5XI-tZeh0mOqsFEU3emRunpL08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfXzlkn4/bi/T6G
 UeZOiCsGFaTpyHKqv+85N6PCwb+CinlMgd0RuMjqEP2QoccdR1al8TFYNauQypfgF/GFskDJi4m
 YMIK9GdQvALjQTaDwfBpNkaXbbr90FiMdFLjNYxHopX5yRRZKMDGD/TSpyURGElkNRQHHQm/y8X
 G+a4JqxfRRQIlDzEULfjgn6vVQWHgybAbouBA9rc9pQNWYt/64eoog/lVrwYXHQRHDKn0RPnl6d
 LyGPSgnjnPT1AVr7BTfZH06fAQfLgag/jtvC/uWHJgwv9clN/9siS0VCUrJxQ8LVJiYIfC/LMi9
 +J5ca4y36dAlRJlkH0WqO2UEBEOkSJhLolcJ0QOFLeSyxHkJnJLPEvnyTpUqbPoh4+L9sFCqhcG
 6DYJe6Kts/+w2/kSw06PA4nOc2IoAlbkl6uHDbSWujxdBxNADg/eSx3EluBM8A2LswFC52Am9KO
 NLEEXyczqurroTBXecQ==
X-Proofpoint-ORIG-GUID: -3kZKE5XI-tZeh0mOqsFEU3emRunpL08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090073

On Mon, Jun 08, 2026 at 11:44:56AM +0200, Konrad Dybcio wrote:
> On 6/4/26 1:28 PM, Varadarajan Narayanan wrote:
> > On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
> >> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
> >>> Add DT entries to enable the PCIe controllers found in ipq5210.
> >>>
> >>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> >>> ---
>
> [...]
>
> >>> +
> >>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> >>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> >>> +			reset-names = "phy", "common";
> >>> +
> >>> +			#clock-cells = <0>;
> >>> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
> >>
> >> Having a gcc_ prefix here smells fishy..
> >
> > Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.
>
> What is the name of the PHY's output in the clock plan? I would assume
> it doesn't have gcc_, but it may end in _src..

In the clock plan it is called as gcc_pcie0_pipe_clk_src and
gcc_pcie1_pipe_clk_src.

-Varada

