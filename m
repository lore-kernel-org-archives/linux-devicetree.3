Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9F2EEE73
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345723; cv=none; b=cv/2kseM9T1Lszx05ryHzIksTlFy+Jkt0FK9Udl5X5x1rJ0IUiRlP4wNyjYuUPgJh1v5mvwYFC/fvTOQyn4zd6BixPLYwGW7p+zEVafiZjPbaGOzL50vEu5qHpKswd47xbEbSh1H8irzxzGAqvOmbLijYFBVyWlVV3r6FFeewNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345723; c=relaxed/simple;
	bh=8OROlYXRbrpzH6vJbohoRtZFL6ExMq0gugpmMioQgOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsqI4ePBZOA+mrd3pGJQ5XcUt153CsbNAlD17mbS5EDCyrL73dIv0j31BVeRKSOex2HOfwiTByiw/jf+knOGTiphH957ikB2zH7OveUkoanWlTFSjpcHwogdlgou3pFGYwFw9jynEYL/MpxY/pr02Io6MU8cGIQtsoE8zh8uF00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ot5IHOor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IA41cOCu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ot5IHOor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IA41cOCu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJlf369083
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nZt0YV3IbF/vrCP/UsToBBUQATNpfFQK/SKVJfqvgA=; b=Ot5IHOoraIc6IFRL
	Yr6Pl0Tn+B3get/892w0e2C3twDlVt/SaeEtAhRsESkjP5YT+3fN9FXQjM4dRQLe
	BjCDpJwYJ/0DOlt6CIkXjdBo7cHXvamLVVOhAE+Ucbdazvz2qwCd9YHTkH/tlvwP
	OvtjZ0bXV+mnpZqcRKqG3b31Hu3+nhI6EpKS1ZkZizz5ZgdnAq8yHXMT/hwdHeeu
	77/UomJhhKh2w3etQ2rduTow2CEvvPBH/RoxQLYv/zets2r828m5UL1GKpS7Oe/F
	GKlCJyduxYsGBfJLT9Bf0fRiLSPUcTKaYeY+ahfMLKU09BNYBJ56J4ztkni1dA2r
	C9wjvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99c9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:48:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d3261c5cso261966485a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345721; x=1783950521; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0nZt0YV3IbF/vrCP/UsToBBUQATNpfFQK/SKVJfqvgA=;
        b=IA41cOCug1VTbcTYYFqSOUdW87BkOiIo/CJW/FoChGiUp/HDCFMFqjNVIjWs8YKm8H
         IydUUN1hcnZs/r3XiOyLsvrYdz3KPeusyLyghgZlE+CIkKAmJdOlFhyBVRnG9OHwo6kx
         uuk68X15GnqJ9CsTF29/h+k4Yb43zTPL8vjHIXENv+wMBhpMQ5nRsiHS5FDmlbZe3c65
         5N88Sj85IBhy2B8RGdREhLbLWAEsggL4N9ym89Q0MqG4/vtsTxbenMBCeyfaZBteef6T
         SnZqJDGFffwoxfOq5nMqzhfOLTuZR7SugTZpLo8C8UM5Vvtk4P5v4qPb9vrzkba/WNJP
         d80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345721; x=1783950521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nZt0YV3IbF/vrCP/UsToBBUQATNpfFQK/SKVJfqvgA=;
        b=GwIjlXIqk/AfBJ4axjgo2el4yoZ+ON//aGCvgYIHRl63MJFUKqYluIu7tq3FBpecKh
         Rl6WNFQyS/WWCUo6A3zddQ2nKHuvr0HQo5XTrb5yZ7JuyA10HaoVmIo5hp+cm/cGQWPu
         /P7aXipf+YxAOoCrsXx8cC2uL+7WrU+S/c+gae0b+fRgk2XCtnylMpzgpffhkgtyJefr
         pbjUFrdShY6kru/j1L61z4MqknKsJ8rv8K8mgsGX8SqWDFYndPIraGasHtYAcCjVD1ne
         iSaYQpoGMDIeV1uUKKOz9iXhy5NZzWpWlJHwJwacrvJlvmk+3DKOZeXFK9f3yhPVzw4L
         7jZw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4263S446xAdnJGd7WAZvNyBydw51oso4R5IEZomQqva+4J7Z4ByD/3DcpdPKfBkBgtdglPf3/eMqJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwW59BLrXA8lVB7SkhusaCZp7ho7gqcWwZ79hz21n/nCINhsLI2
	MsHQcZSqcWT6O3XFd89dZ/2VtU3G5xrTOYxWnPJR5olivhLL43lWGQoHlXxY+JB3MqWiIvp3lYy
	MbQkcrfBXE5XjqCo8Z97cMXldm+CBbn/IREeW/K0mClPrhdG57ZlvgSX+a3kW/PGx
X-Gm-Gg: AfdE7ckht/iJtCszcG4uQQFuuvt0HA7NXNshwlI46YADOyE2rtFYxeybpxo+h7TCo4u
	6cS7gesdZEPOEia64FkL799SqZwRB+lDz8GfGv8O+Nfh+GVhrNBghbKAITG8tijcOg8nb5ZC5T3
	Yw66ZZZ/kK/wOd4o9dyAUA6KL4mR8m1wSBG2oDbrPB3KJJYoezdF0o9GXEaJWNnT7ivVgGmXfw0
	ChMHCp2saBPMkB96rgRciFKT2tQE+ham+jsNnf1J9WZBv6m0xL47AegFWj5ce6NEcdQM48u5ygw
	vLY+ji5it9DTd6Y2etSKAl0RkwIKiGurZ3H+4SnfHVUNXzI1lhHiMNE3RGiELH+z/9DzcRnEM2+
	SezRDagHtvGUpqW3ao2H1k/EgrT4xoqrPAe8fLXOFcXKU/yku+XZtQ2CESt9XkXcmsAye1gwVO2
	rtpVNVMwHQqAOT3mVMqGH8QKre
X-Received: by 2002:a05:620a:4041:b0:92b:6805:9197 with SMTP id af79cd13be357-92ebb59fbb5mr84327085a.63.1783345721047;
        Mon, 06 Jul 2026 06:48:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:92b:6805:9197 with SMTP id af79cd13be357-92ebb59fbb5mr84323185a.63.1783345720542;
        Mon, 06 Jul 2026 06:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5e87sm19579811fa.22.2026.07.06.06.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:48:39 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:48:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <qb554wbejeqjdzv4lyrmjuco3bfvbb3cb775sbftybhwcyc4fj@uczxvdc7ppec>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <7815e3ac-30c7-4564-9a7a-6a1ecb9278c8@kernel.org>
 <52b7ee6e-bd99-4555-8a49-6cdde1331714@oss.qualcomm.com>
 <23580f8f-ba25-4dd7-a2d3-f2df9bc7303d@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23580f8f-ba25-4dd7-a2d3-f2df9bc7303d@kernel.org>
X-Proofpoint-ORIG-GUID: eIJeRT5mqCMNmy3psLT16R83Yi-PDZjA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX0kQ9XOmTo9ke
 gCc0wt7Uo/5njzdqCjnnIqBR3LnvwqmEwHURS2S58TFZQpTMWxYtEOUoXWDZftEFUejuhLWCI0b
 FiXL95XLTIRCZaQG7YVUz/uNZDK8f6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfXyGBPd4dB1k6S
 wu3DpStAD/ql6H5mr/sQmDR+7tgsGzKaZxZFLZQM5rt1SJneRp3+Q5LxCCJg/UqfMU18B21Li4Z
 eZpbT70dA1ksnaplss4IGNJ78iG9sZFzGVIifhARn4Sha7ra3FgeBDZibBAkn0qTlj9vQc51QDk
 2EQBxGRYj8unWHuf0CTvOH+3KEe7Cd4SzLuP94FLGM15rfybTYDQKPtJY+DhmgXVwWmHei+0ztJ
 rq3HSurFgRR5LgXQmzm159dimG+XHKX7sbFc5nWjM0gTj7DbMt4QeUntxTruIHHMqWiMzXGnxLV
 m7ePONlooPjqmwFDyOVd5tIDF7T8vvJ574/UfV0WBIF2hC+3KFfFr564vDIq5T7wA6X6X5Lpn6R
 KoaWmmFJKsDrTs7hOkaJOBTIz7ayLHCYhNXE5J6TU0H6Z3Rf2XDGS9RZPXRMBb5Q1WXT5PfK7uS
 KuB9GJBrZgJ124ACFWQ==
X-Proofpoint-GUID: eIJeRT5mqCMNmy3psLT16R83Yi-PDZjA
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bb239 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=fzYDJ1lVqJHfsV3C4UMA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141

On Mon, Jul 06, 2026 at 11:19:59AM +0200, Krzysztof Kozlowski wrote:
> On 06/07/2026 10:52, Arpit Saini wrote:
> > Hi Krzyszto,
> > 
> > On 7/6/2026 12:03 PM, Krzysztof Kozlowski wrote:
> >> On 06/07/2026 08:04, Nabige Aala wrote:
> >>> +	lcd_bias: regulator-lcd-bias {
> >>> +		compatible = "regulator-fixed";
> >>> +		regulator-name = "lcd_bias";
> >>> +		vin-supply = <&vph_pwr>;
> >>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
> >>> +		enable-active-high;
> >>> +		pinctrl-0 = <&lcd_bias_en>;
> >>> +		pinctrl-names = "default";
> >>> +	};
> >>> +
> >>> +	vph_pwr: vph-pwr-regulator {
> >> Why so inconsistent names?
> >>
> >> Anyway, drop the node, not used and not controllable.
> > 
> > As per the schematics of LCD display Bias driver , vph_pwr is used as 
> > vin for that.
> > 
> > So I created vph_pwr , if you want , I can drop that in next patchset.
> 
> But vph_pwr gets its own supply from main power, which gets from socket,
> which gets from building wiring, which gets from a power plant... Drop
> the node, as I said, it is redundant in DTS.

Just for my understanding. Is it fine if it gets used as an input to
PMICs?

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
