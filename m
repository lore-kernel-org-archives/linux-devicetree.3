Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A737FF41
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781232732; cv=none; b=BYNxBrDSJ5Esdjzjf96WZ7z/Rp0Mc7OVLlURINmNCpJOx12y/djR7V9/2nNY1r4LLI51iS4e03iUi3oLTOvzn226OAKTPn7D76ydCF3O8v/Ty3IZtPtgiW+iF/pGvDsrM8kYnxwawkqF6kBjyEDTvifNu9SVNqDBdM+Z/KC704Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781232732; c=relaxed/simple;
	bh=AZBmiFwEYN8MILgwH+elWqScj1FxDbcgZ4kVT/EpJ/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZevow20BdSGBHCevqoHV76p0Y0snm4JpxUXTidfQqo782qguQrD7o0qcShnrlOAd8pOU//8c0ThL3vbFcVg1a1+dT765E26zTiPEwmQ7Otz1g2Pe75TcQuwWGv/+P4EP24MHj6ycvXPnENmjalcx4WeGKIl+5+Dy13lwsRGvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjD2lmjN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CojK7K2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjD2lmjN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CojK7K2i"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVcUF1819925
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcNplGJ1Sabq2Y9bKw3Y1rXhSqvMVBj3TrS26bNA4I4=; b=IjD2lmjNZmmDXdv+
	p4QquYHJ/ZNFRBtM0g9IbixMcmiJdhV00hJe66eVTyBhFhluUynHrHy8WfUIFMID
	KTIQK3k0Rw0ZhddiNBOPmLOAl/Paf9K4VXIr5sisYVhDcj039Yq5zUzf8Dgo3RAD
	ELdEHLfNrXETVaSs3kSzRpWAehVGzY9jpFKOphRyTbh5so8EZrqOZUdt/82CEeQt
	/dfQH2EkWJw4lu4vr8Ozk70I18S3Ggdf0XsQL5R6iqgLIpgaGG+AAlu6CQqeCNh0
	lFBFNIv/z9JxT9G/AuexlRQtn/cMTXaQyS6D61N3IjsKvdCSDkPCvY3G+jcG3pLw
	vox9DA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g9bmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:52:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422f987f2eso894068b3a.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781232729; x=1781837529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcNplGJ1Sabq2Y9bKw3Y1rXhSqvMVBj3TrS26bNA4I4=;
        b=CojK7K2iEeSffVHfjVbwW07ryySFLGlGKPCP0/Ay1OyOm/SrQrhFq3dXtiCtGkoyRp
         MtB+HLfYVUacQ3bzt+q5aud62i2hkdIMQH22YnQlIhCEtfqVZjVjV2Z+VYDdpgJUKgm7
         gz2BeMxjhQfiC1Un8KHwXc/PCvl8ig8dRx3zqXSMSBaJCcshSXngbey7DNNrYzkRjYV/
         z7+CbvKVMkEPZzKTthV/E09g8TCWOzWrL1BMydQ1YVsfd4VoN7lbHvai9gcfyHsC5RpJ
         c7gsaQR1GDpS2bD433hR2iP8/iQl/QuCt3bxzOi+uz5/zXLXBX+nSAOaCnda41b2IOFN
         oAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781232729; x=1781837529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcNplGJ1Sabq2Y9bKw3Y1rXhSqvMVBj3TrS26bNA4I4=;
        b=XXznxbufr1DLDhpfXx4vlCu93sO3S+A5Qd6Z3rtD+roHw+PXe7I0ZTDh3Zdx9ROvE0
         Lmi0R6R76NFG7q+4fa3MUQjT9hzkDlxhE5nqJ4RwJWMzJOi4CSxN+J8OWin//tnxQ5j0
         IN/RsM39yUQlrp9Q/SKXZatYPyN+luE1ndrzIQR81jfcX91W7hJeGbcyEsJK/XtDxiBm
         JemfVBZIPVlXzbgKZq7qDM/8CzAjT0M5olBk992y8cHo469TybofTHAh0I9fr8upDN34
         xvufxZqcrxo/Gs2nSbVP+cyP8NHibS4F1Zi0L0/+6nbsYSZggvHyNtLwf84hkFizQK8+
         JM8w==
X-Forwarded-Encrypted: i=1; AFNElJ/Zd8IvRPh+wu4y+kV5634sGXGZOmcG1vdhHB13V371jS8rQr8NEuYLaTwnlmaAHNhByVNbRBaF9iZO@vger.kernel.org
X-Gm-Message-State: AOJu0YwePbo9G4eRNQP5zhr3n/flZxMEgGnc89uLkiv2IN8QRspnqk2e
	etN657lXhYJq19HS6YCh9NNvkYnNsjI3ZUF4TLOkyC7wwfoFBJuQynAZtuLu0MP3jSB8jFuGK1z
	kxZlKiEHHn5z4HwkFSH9LFt/YTEPPd2l/4JMSAubaz7bQ2KmCeutZjYCaSWgecRRf
X-Gm-Gg: Acq92OG2RIIk1rmBi2gAsza3zWM2iZm7Dk6w1VCDXFn7Ok5wwA3CwrJChqKq0IGFAES
	s47XhvlN36SGqPLd5sCmpRBZgXChZDiOR7Vjii+Mj2i1r3R0Wts8AKytNlYtEUuKDEZ9X3MX2cw
	eogk8YPQ7ZGUaxpXO3JEf4gCfNaeOloYjRl1z8gtRiS2dxolhNO2ba9yMRZg8h9QOsYFjWDpUYT
	B/nQvfsan3dlUW+rk+GFk94JAqGTwW/trzsMh3pQIEV6KiUwFMH5ryQaO1k+qvsCchJ+lLc6tJm
	nqnscBqXxR84LI4LvS0qrLs/60wum8+in9mYyMbfyNWYjHdA8EH9HrLLPylf7DO6og7vPCGq/vN
	xk+InwAAj82bfWJ/Vh2GLhW4KPFsg88hXawRiLayqJJAAFDg+pSOsJssmSQTOVTA=
X-Received: by 2002:a05:6a00:4c1b:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-8434ce4377dmr875962b3a.22.1781232728605;
        Thu, 11 Jun 2026 19:52:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1b:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-8434ce4377dmr875916b3a.22.1781232728108;
        Thu, 11 Jun 2026 19:52:08 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0226acsm511841b3a.48.2026.06.11.19.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 19:52:07 -0700 (PDT)
Message-ID: <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 08:22:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAyNCBTYWx0ZWRfX+6ge2F3ZSCO0
 yULMGapEWijT+g9AgbMM2souNvuCKlZ01OtWFVcibrCYqu91WOnyFqV1KTY0ncz6ZykQN0lXoS2
 9ASTqS9bqqiFIs4aYeoI+m0MhQQ3boc=
X-Proofpoint-GUID: 8L9l9WVw00MDmllRkW5X1kCLwbwBf56I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAyNCBTYWx0ZWRfX+L2uCSatzuTM
 EsF3y/QExtnpTThZVEYGjDJEBMLFq+RJ3tRdbdyI7MarRPI6UP3/WcYE2WpdUE3L+acUKRjaqVb
 XL4Hlrs2IJl9c/sKnn9LTor4GyhRT51y+xWe3+XVWS2f6SbV22/330hOm6k90ahHDx/aeksJlXU
 twAcY6vIuQGpQbVYrhTVX0/lJYh0fac+P8Bz9NQXuO7FALYqfDTT0/Zny4QZvBMPx6SVgdIiBdU
 XQanf6aBoyTYLyZF60cG4+V8TNjnYG1w3BEUsm8Wsji5bG74rdRd419aaEvLc0n033O7ocntGSd
 iyILzs3lDiEha0NHy/3nZfKt3qYITepsTXvqZJe//N4Uj/57L5OjKMWdb8XLWRFzRni/PuhStwM
 xmOk2fZFmFuLOR1aSCwxe+b2q9wH+qy1xdncaIClIG82fCI9Np7oGxi2f1LmIICiU5ypWRLFNeJ
 unRtoTVB/43W1oKLUNQ==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2b7459 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DXo_hcG_KxK6dTS-Z9kA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8L9l9WVw00MDmllRkW5X1kCLwbwBf56I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120024


On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>>>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>>>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>>>> supply.
>>>>
>>>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>>>> refgen regulator supply.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>>>    1 file changed, 220 insertions(+)
>>>>
>>>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>>>    	"vdda-phy", "vdda-pll",
>>>>    };
>>>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>>>> +	"refgen",
>>>> +};
>>> Now vdda-phy / vdda-pll supplies?
>> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
>> which supplies fixed voltage to the PHYs. It is enabled upon system power on
>> and no SW intervention is required.
> What is it being powered by? MX? CX?

It is driven by CX.

>> regulator-fixed doesn't take the resource 'reg'. May be should I create
>> another regulator driver which accepts 'reg', something similar to the
>> qcom-refgen-regulator? Please advise.
> If it doesn't require control, there is no need for a separate driver or
> separate supply. For example, the refgen is being references only by
> those devices which require software votes.

Thanks. Then let me respin this series on top of phy-next so that Vinod 
can pick it up.

>
>>>> +
>>>>    static const char * const sm8550_qmp_phy_vreg_l[] = {
>>>>    	"vdda-phy", "vdda-pll", "vdda-qref",
>>>>    };
