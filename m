Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C2427FA1
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068567; cv=none; b=aRnj3Um5RXz8MTm2WnlrE5pXKKIvprMKcIyytvyCLq35FhfEEZDUmTqiMNPR6PcM7SgtS88DrlCjpxcDcLNKPt6h/Z2sU6141JJh5WEvo6/JYYNvhLiy1pnlFkLpFth/H1xCNi7H38fLRYhe+6L1yO+1PThj746EWPv79j4q4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068567; c=relaxed/simple;
	bh=vhjjJAmdsiKIqHSAwahnD8GDow9iAXud7Teqy48MxJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpFy13G/5+t3skFVEkg3UYJzgyLZeBpviBoTGfEAquzrg6+iztHebMxh7C1VVb4dEzyGSfDzxXQWBLBgayGr3EVNV+8bjchUM1oYpP7BDilsCtVpemY/t+I5AZ16LW7pz/PCeiQ6vOkXFPiIe3l8a3p2BnhJwKWQLAYlcGBcalM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpRB4FyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNatSO18; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpRB4FyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNatSO18"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0mV01502748
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSXU498YLwU49LDjGaRtSbr3kZR9SBDeN5sP7C1mZwM=; b=IpRB4FyNF9N0P/nu
	AB3j3hAslFX/7+fh0nljUNnhiz3yX/bz87zt2+dA+m9QC30+R2HScOiVbWv1Aeut
	T6W6EAOAX4OPb5WnbFc3hoBjjvnw5KwBkvcEfrFaU8iKVdqtT1qyxinruGZrLUXz
	BAt8/e9UMsFtHxTxH5YKe3AFmtgBqtYoazoTFx9KHhW4khANH/mxtgGOW68/unl4
	nPzu26k6QtrKjjJJafcSNvJIDpWT9A7xqyWoCPD0uJOGT0OFHWeAEiBNaJWsJA5r
	hMvAv4lyxBC0z8WUW2IBrDRJfvQfl8mcyrM7sJ58sxLUebOQomKMZNKomnW6CnPF
	GHuhQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4prn17ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:56:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d7ef17031so2816411cf.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068564; x=1787673364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSXU498YLwU49LDjGaRtSbr3kZR9SBDeN5sP7C1mZwM=;
        b=WNatSO187y3D7TbqrM73iUzbXug3y5yJoF4r4CIa0Xo4zjccbivedERDHsmB6IoZbJ
         ndEITTNdotw5u601WzspzLvradUY9pGYwmHMP7SA6Ema3LUGNDfvpRfaLzQDYopwTcvk
         7MV05P9/i8m63zJVQfB34rCMrl0n/uAgFg9n2rNaBM3pw5D1o/l/7/F3Zm6QpI9g7IiI
         3pKBw3oEDI6meWLkI2A5JlUMWo+wf9cs5v+6lRAH6B6j/6fPxskXm9D0hF+82FnVPoBn
         LOlNllSFaM/CIVp3XioYg/xFcE1lhQ/7Qpr/oX1juzQ4uhAz5BFZrTerusUg+zxeKCJ9
         TLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068564; x=1787673364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSXU498YLwU49LDjGaRtSbr3kZR9SBDeN5sP7C1mZwM=;
        b=rM0NjPyl6Amh8MYXx33T04SfOPIcSGB4+EW9aM1PzRTjU7+1hiPeHOPTdeCWTfSfc5
         DNntheqfDgDpYCGW0IxpXtQitnhywElrECu0DgRXGAfSJ2AnTAwVYu2vuPF+s4qI4F6Y
         spH7FvKBE5yvxGuj4KacwrFoedDqq3yk6wUStmoMXZPpn+Oszs6st3F0/ImmjIwbjULR
         Tfjxu4D1TwAeoIh04TDNVz2UirffQrX8ElJVRp68kof/h9GyQEaaK3hPnhlLhUQlmfYD
         SrTqesQLOr/yybPArISfVfSaQuoLO5sEVOi/z1dS0NMMqYvC4WfESvFmTjTPhFb0m2aQ
         csVA==
X-Forwarded-Encrypted: i=1; AHgh+Rpus8+hb2bwx+esXfbjHMV9Ay82rMu/451qPLxZBwY3d8kD6P4PamQ5t5bW2MEXmOmr/Gwe8yoZ8D50@vger.kernel.org
X-Gm-Message-State: AOJu0Ywowct36wO03f2Rb6s+3piV67JQ6eO479kbocw6wb4R8LGBUePg
	iT4aPml/DyipHFI5jjCWAuuBKpr8OrxasciFl/nPB39/AerhrJAhkPv3/WYpTlIR+WACWv1dkml
	hEdvVgJnvxruhcsi1TOpEZKMG27R2jJ6UvNxeAE3LJaUoDCzA1Jn1eGv89Ku/Sgh1
X-Gm-Gg: AR+sD10Z5RLDbMnOXXKjTiPGweUDlvxHv5ZFQrCo5Q4Cl27GQnZWFsq2ehmpnygcxwN
	k5u6DbwYEE6KqrS3X1nRV2Bba6qGyhwJr/7XyiqY/birybgaod3CDwMk027TunLDGcwZKom9NDy
	/qDAvUjKSUVlz/z0d4EAKuxzvUo8elVATKS/1orVwIe0r1Tr7Kroeg+Z3HRSlmQpLi0YtQVTeop
	qFiDqk6GwSPLxfkJbVvsUz7uC00+Q7/4WtZf4k36MIG/cQ0uwB65yU3oMVyMgkbhIVeQLyOvV/Q
	Tj3pU+Lf2W0/dz/NXucTPizt7tAMAKI2U+isD4qz0zfO4aJ5Gbb3hXvac1qjILwWSCCiVZ6QPuN
	de0n5GeUaR4NZqoJ/DvSrNCHj
X-Received: by 2002:a05:622a:1310:b0:528:3722:a372 with SMTP id d75a77b69052e-52d854d54f9mr237812991cf.4.1787068564041;
        Tue, 18 Aug 2026 08:56:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1310:b0:528:3722:a372 with SMTP id d75a77b69052e-52d854d54f9mr237812341cf.4.1787068563403;
        Tue, 18 Aug 2026 08:56:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187d269dbsm161593066b.7.2026.08.18.08.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 08:56:02 -0700 (PDT)
Message-ID: <8b837959-0a9c-4980-8a56-2c3150383598@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 17:56:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
 <dgvdvug7zeoommfh6iszybwzpcm6f5vz3pwkpamtezjxenx4ua@ew5xgoc5reqd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dgvdvug7zeoommfh6iszybwzpcm6f5vz3pwkpamtezjxenx4ua@ew5xgoc5reqd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX4VrO252JeIIv
 lDxCZeSlP+Y7sh03eBRa+X6cVjLpNgKZ5UmvZuDuOagx2dF/3Hy8BpJDwGSK+CbDKvM740e6x4H
 b+ReNb+zUOiJ3FJOiXtZb+UwPvQUm5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfXw2rZ/FF3psUl
 pD8nJ1qBc7KJFmnV8YgVg5RhWtOOui9aNWsuLB4hmdr7AIQ6DHivFTKYa1pKysy7UBnDvqBqTTh
 LhPfyTPlqIwEUI2gjl93uKQhRTsRcDTSEbl/7aWrReXhKGERjCuBKGvkRXKMF3J9Cwq6H6lGsvG
 jO9mUcBQK4dfJYLGURrQpu9lwsDqsGMGnd/NbDwg4umhUc2WB9F11FQk53e93HAEaSez6d6wUZc
 cnfxEquH5aP21zmPxnb5JZjgZ2PqttX+6O3GJvHBc+wLQ/JhBi+gJmAAZufRkMpQ8fe2d4uZx0v
 6VIO62p5tzrRIE4eaev/PvAaN8a0g7ZHUXZAmiW4vBVqFnRSOIbAUMGv17llzDf6XE3plhdkdqs
 RylacdN6yMFX1qxLLC02mBYqHdoPPtWyXVhKQ+pTvQA2cSvKJAAudT/z2BTlismeJI/j7uV7Ntd
 OYH/vo+C7VnV8FvuuMQ==
X-Proofpoint-ORIG-GUID: PI3080EZ6LYxpFDUESD-WT0w62ytYSXj
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=6a848095 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=645x-19ulo7_aJH2oRwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: PI3080EZ6LYxpFDUESD-WT0w62ytYSXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

On 8/7/26 2:48 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 30, 2026 at 04:19:15PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>> and DP signal processing capabilities. In that architecture, USB3 and
>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>> The DP part is roughly the same as on the instances without USB4.

[...]

>> +static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new_mode)
>> +{
>> +	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mode %d to %d\n",
>> +		qmp->qmpphy_mode, new_mode);
>> +
> 
> Looks like a downstream debug leftover.

No, that's an upstream debug non-leftover.. the downstream one was
definitely not _dbg-suffixed

This is present in the code before this patch, just in a different
place
> 
>> +	if (qmp->usb_init_count || qmp->usb4phy_init_count)
>> +		qmp_combo_usb_power_off(qmp->usb_phy);
>> +
>> +	if (qmp->dp_init_count)
>> +		writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +
>> +	qmp_combo_com_exit(qmp, true);
>> +
> 
> No delay required between power off/on?

Correct

Konrad
