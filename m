Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4047ECF8
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989444; cv=none; b=hpJV6EiwUjZlBWShKvUx4e14w8nnOyf49pAuWSHMW5T6fxKR6kfRftqVBOPQPJ+LJMP+yH/SIWlJsTReZfE9gfTsgF5zP1JglJIu9kuIAcU7l4kK0HCuDMgxLhMYKvsVL86A70fFNApknE2PXpE/Nng04EWKosqQcpAzDPmMp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989444; c=relaxed/simple;
	bh=CZSj9ZWmQ5ooC/B9lWFk7QyttBbZH8/ZO1PvhsGrAXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiFZFj+Bb2nTVm6tKhtVKI957DXws7fMvMKCuhLo3099yLbDRkS9EmtLIJXX2ftVKzVZ4q6kZjiwIQdw/xUtMSDDrSqzvhT0OjnGRF8Kq4WmCnstSR3xlAIKc8lLjZAF+WP/7aF/DV6F1DATR01KW7Qv4eNvRVxynnmmYf+K3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tn8GXoMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUAXNznE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tn8GXoMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUAXNznE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Do4dB3475814
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 13:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0RVLE/qSnm/P09xzKEIzQY2p15aCFp93vrBJQ6M7zY=; b=Tn8GXoMj4m7fmcnO
	OWBAUFznqkPVw0GeGafLrUbyX4O7fAFIKI/nRzmorbY2qwT0+3l3gOtOZ67jl1n2
	C5u2nYtv+V47IfR67l9Xkk5YqGfHJmCC9hdL+JdmsFNqRnBHvEB7CL6C/isw6zPE
	N5qN5+AqpxPDu4GfL43OwtlajZwGlRdjgVije1mrexJ9IIrXkDcpXEtY+kwd0n15
	7sGrinXE5k6yySahlNSBDE8/Dkbx5LDRVnZO8C9NSzEDW4SRtffy60itHVH6tWd7
	XM5MqkeoCCOwJLbUB2wiU0ClRqDA7pXMmFSwMoSQVBpIMpeOY60oPsZAup2IxqyZ
	leXscA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgr0yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:57:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so3921666eec.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777989441; x=1778594241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0RVLE/qSnm/P09xzKEIzQY2p15aCFp93vrBJQ6M7zY=;
        b=YUAXNznE3XvOaoyHdEfM9puS/jEaLrIPoopjylmQCsQEZh7Vqs6SUdVMikJsXFOHYA
         uW3+8bsvCjQlZAADpKqKkEYVTap0a9ckJT7FpjrKKkoQWfLkPqZ+9K0CifGrZ5C20rpV
         qmSq5t7P1tPPNsnXlfp6e+bNBExo4q+1vRFfefgx+E1r2uBt5AWFn1yHEnM/+ELO9QPk
         B6802DFkGT4fvkdZ7ENREjTv6FbiGjhiD2UlQohvqGvPRK6WwqQwjVfm3DmQhO3t729D
         GH2MEg9CHq8d1kyqzXYQXSNQjdTusPM1fzTndDlo8Yp94O8ikKFzQ1XsmMJOJ2k1dMPI
         48UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989441; x=1778594241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0RVLE/qSnm/P09xzKEIzQY2p15aCFp93vrBJQ6M7zY=;
        b=suzDliw9E3mhkXkkObWzC2bJa6f4EbVzcJSaj6eISkgFUXrgM4uRMDBHaeDPmZZ2Rz
         8Nyhn9Lvx8k446HhebWDVI3qtF5+RtI9+lEpuInaYhQjnK+tMIVFolI9PpBmdHmjg2ud
         xFgA9W2mOQhJAbbsX2M3Qy1mHAHSzwur1Js0MR/GJTMAwQwlJ7UCrmqnPRAWZSDPZT/I
         NFQu7scESDuTpQ+MQXAyiEh5SylXi2fqYV9xIhpKiS2PWBqMkhjNFbxf+Sxd/SsaWn6q
         Y17daaR5ReF6fpMHZF+G8ELzKOpBptrLXvrvhdlr/bBjB6rMmITlCcXNzB3CuXiLXpE6
         cYIw==
X-Forwarded-Encrypted: i=1; AFNElJ/rA99dAfWvPaTts30KFcmVHB7y9HF96LDbfyGBCe8sWtibpJRLS2dsQkZ3QxhB3UhSXlaxp/ECQDOK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk6nxGnfHCVPCgk3E2DCTM3P2BU7iC8h/tdDMyWlRuUJ0KMZfh
	nlKrZTSTWMs8/UfTtmeVMcJaaJQT3Yobup65dhjplxdSJXuT0Eytw/h/78vSzBWE1PhuqrXFlnO
	FVQ8miaxyCPQXriA0/MOeicWbXmrG1LrnjeBd8Z1w2SOchm9JIHABHEW8ezwfpySH
X-Gm-Gg: AeBDietdnknU7ighk5MEHX4+Evb9LM57wasb1N7mEHCpG7uLrJd/qwiqdFFgeKTaIDJ
	n8dwS2T1v8CeQy5NKHrdWvIIETV9j9fbtMI9+RgfzxduCyWh4OxJWVsOhOgKEz0Nt+Dm+yittdc
	QYWTXgB2TGoALFNg8Tu/4dvD5yqPb4azsY0MGO3651zDB+I1z4UUaIIhlwekHInC2OYcpIsBMl+
	XN1fZQiLZSaKZzUL3gAw+Q9wCv5FAd5nUiWJ4JvkEpAqXYEQutpQAsqxrUqme5ljTwtqaviP5Kp
	w1m+IUgIkKnjWXQggQcX5jkd+Z1mVIl9e9g9gh2qEBh2VfWP8kkbLQIzdF0wROvIDB3hsOylkiX
	3/PQBnmKvu/+QWnLuFvF/6Kg1XL2NJAUS/eYhOsrpgEM2wekAWMQgPWtX5Ahh60wiiT/y38rOXS
	9+e4alAfe9AGP+uKS2wbUGd3rO
X-Received: by 2002:a05:7301:2a05:b0:2ed:e17:d50c with SMTP id 5a478bee46e88-2efba7b5047mr7274278eec.31.1777989440931;
        Tue, 05 May 2026 06:57:20 -0700 (PDT)
X-Received: by 2002:a05:7301:2a05:b0:2ed:e17:d50c with SMTP id 5a478bee46e88-2efba7b5047mr7274258eec.31.1777989440393;
        Tue, 05 May 2026 06:57:20 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.242.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm23836987eec.26.2026.05.05.06.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:57:20 -0700 (PDT)
Message-ID: <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
Date: Tue, 5 May 2026 19:27:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kmNOeVcOyHCocWrxMsyysippdyxmDpSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzMyBTYWx0ZWRfX8r5AuwUqQDP1
 qzTf4F4yuxDQwc1SmFpI/KIlnc3+JQYM/1HjsqnfFjlIE2+MU8dTwgkc0ytgk/uHFtCN8SHqtmZ
 +qkVDoFRv3bXt7TN9/MtjFDHU1Hz25EHfrOm29kNwAsl4alXlLKdTLjoaPFyDvrd6lQh2ay0I3P
 ctTH65JUu6rlwMClJG1zKbb1hQpVSD9adq5cNYR+/n89+JHKn8K6zX9SmgADrJX13BBdz4fWRMg
 X/TsMGZMIGi+mHHmE6d+fvAlpokr7XoOsM4E6+78jiae4SyxWfjKdidaKVwjN/65NoT+ikBT/1L
 2Z/l+dNrYbfoagRMDm3H3SUBnHcv6TsU3NVqJLIeoj1xxjDPCXxknaPVGQOq/fMVsc3HWvGdFMK
 rGGQ7OsofNQe70/TDbrimujXLV7GtQH3vCkOBQdfE3v5KBzgkbfOZLAqP9O426ElzSbSPBzOyFM
 OlWIbWGcWu9a0jqGrhg==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69f9f741 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=1ETSEvoV01wl5CnlN8iVEw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kvxTIm3NsnwSdPV13ywA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: kmNOeVcOyHCocWrxMsyysippdyxmDpSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050133



On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>
>>
>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>
>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>> compatible. If not, explain what is not compatible.
>>>
>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>
>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>
>> Hence, I didn't use a fallback compatible.
> 
> This still explains nothing. How different clock makes interface for SW
> incompatible exactly?
> 
So I went by the naming. AUX vs COM_AUX.

Can I use a fallback compatible and in DT vote for "COM_AUX" clock with 
clock-names mentioning "aux" ?

Regards,
Krishna,
