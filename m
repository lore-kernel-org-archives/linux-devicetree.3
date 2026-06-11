Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D473CCFC4
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174391; cv=none; b=UFDS8W6llhR8J9tWayEyoiEufXYqkWzNuXab6V1GAYxWlDtwD5O53N8fS6iYO4f7A0lm3Gp1b/jOW5MH7j92WZbhu4tevO+DSXvpE+xr9l8PJiS+VHSYodc8SzcueoVF8xHbmLY+NM5/iNHG4nk9fy4+vQ1zzCJ/oIjpDsitd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174391; c=relaxed/simple;
	bh=nkgay7hRGOR1whwbuzJRnzKBSyfDpBe/79l8q3FKOVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEdhzd9pl1/vSTztgn7JSAUVrgwX28ttRLqSdDbnF+DAcllVcZggQz7UEIaFmmaEQ8KPqpfUgdIsuU/TdPQOtkBlPrW0mV7o1rbwC6vG2R1ysuTVpAWNtS6SQvhM3jCPqWnld0BAO/6fN+3YXkbTWY+pQJ1c+pVpnd8vLPGScPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJSXMf5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeVZqbeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJSXMf5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeVZqbeD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xpuD214474
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmGt7JFBXRq8q3sZZr+m6Uul68lrJESQFFfzp79mWes=; b=SJSXMf5XkipBxAHX
	E5lCsW29gKqHeMun8+gAKY2hqBTkVizRlhKeCHUuReKhfQ64nvZjv5rxFq14rDBZ
	dY+CptxUClJ9QgfIz00lGISx4rLpjVhOxQtN+tLcl518xTbGvnp0zrFRgAoj0TQU
	qpEWTB8R6g1YdnXyjNStgEpsVTsT07gjhuEbtqsH39R1oVpZj/YoGWyPx46ioW7v
	e4gX7CJQhbJzkNwXY+iFQNqkiMtI2qEB8375otms4z9zDd+PbvQSNIPYxR/NJI//
	ySA/eE/XfVeTZdC1DOuG4d6K1NiMNhj5A1NSFNr7pzFEI3+3wXIqqPJ6lmD7/i9+
	ah1s0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk22r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:39:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178a632a12so21185241cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174389; x=1781779189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmGt7JFBXRq8q3sZZr+m6Uul68lrJESQFFfzp79mWes=;
        b=VeVZqbeDrn9g57ZC1DfSSyBp6rvBbNgrqkfUG1vQMdAYRNhLcyKjvStEVUGjo/vHnn
         YTySv8jX/qgYJ3xDTE/NG4vQr79CpvzxhJdc0HwQfFUMCV8ktefwB593EtRpr2AexrYo
         VEcHirKJoe4holY69Kp4IbX5rs8TS7rW/Ml0UXcpWm2eG1AAp2YbmL8aUwtByb2I8P3n
         w5Xn7YKmUnXtEPmGOHIH/9vtQNs23PBXHEJKedOuoUsRAn9WYJ+mTd7RfpwW2oLYb5/c
         tGi7zJb4vRkj6NSiVDgvDgVsazJSZHKln58bLZ37jDsp3ySuyw5mPvYTxZ7q4prcNdhu
         blcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174389; x=1781779189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmGt7JFBXRq8q3sZZr+m6Uul68lrJESQFFfzp79mWes=;
        b=MAt/R6SlElaXlPUp0qVXcBlI4z9b3hR1uW91gPbz5pYa7Ns94+ALTArAP6TVpypYC7
         jPp8zutH49cNhCxiK3LUvFOajdJ4OX2UNQd2mYgJqAS6XDpuAn9ZuzIXXYWe5rkpJEVH
         +45b7gUt/PsH7LBPgSK1vuFXG1HEjb7TVkNTg89yKKnA3DivFoS77CMY7DuUdRg7ZkP1
         l6kFBa51IurzWDVw6wwK/jaYE4/oHmAh2mMECCdXQlTkf1/Jcv0P7Q6kbwHohlv+dCDu
         /4pww4lwPs7pg0lrvFw7dXFWyyASNOsr6QpDzlRI635ulZgg1oYtncmzXbjGuD2H1SwE
         RDiA==
X-Forwarded-Encrypted: i=1; AFNElJ+B5pXMCRRCuQiY/SianQpjGIr9T48UgBaELUXSMAUzdiW4HStWTZ3KtX8sLOi5rDVxwZ7m+xIhT/Gu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wYIb0QMpjxwZ7ZMRxwTk9mD5sVDZBiGmwJ9x+ZDiZh7flFx/
	B7KrVlQe8ayXUYNJ0CMRdAlF0+JOlD+vQltVHvamLxRuoCuLH56cKs+qkYf/C3BNntaFbOcjODu
	2/8YL1XkhOsekRSgovxNtT6VpdSvvIbOf18RDocFsQz+5nEyaqgfZ7upfMkENZWtB
X-Gm-Gg: Acq92OHh9I7rqWGxpXG6FrKKrX1TpibtASI1b8v3Kmw2+RjzXcLMpLSEvovRMj1hvIJ
	y5JndzQjHVkHKeOEeFzL+5A3/ECDHkNnlYyXXyuGOOGU9ZGjfVuoKoQH+XhbCjJh0AuuTbLXztb
	3uqiRoK6uCeLQV5eZTRZs14fUp5Z4SN0nwD75zDTRfO7A58sr0vOpiuhsS4zRq5hTEweKPNPpw1
	f+QVRmELbfWq2qWP0H/bCpt0R8FNqQpbmYSYXefUESJ5v8P1Fjr+Yy0jEpfoViksgv+cxVIX+P2
	9uP8tZpB9hCb7OIAWAVPhGNAxcK0UNeE9ajih+Djq7eMMdVeGE1S4pBRK7AkD5wEMRq84LYGNhQ
	r1z6BczjNkqu6mSBcljyy1CbziTwIyd7oi7/5iCdQvCXeNN6N6JytiBhz
X-Received: by 2002:a05:622a:a06:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517edcda9bamr20986781cf.2.1781174388893;
        Thu, 11 Jun 2026 03:39:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517edcda9bamr20986591cf.2.1781174388555;
        Thu, 11 Jun 2026 03:39:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1608a71sm48817066b.21.2026.06.11.03.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:39:47 -0700 (PDT)
Message-ID: <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:39:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        github.com@herrie.org, me@herrie.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
 <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a9075 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=cTwmTnRGAAAA:8 a=vFWkIUYBD8dAITECdtoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-ORIG-GUID: TTZU4CD-Rr_-bc2R6yTbDyvhJTEP-QZE
X-Proofpoint-GUID: TTZU4CD-Rr_-bc2R6yTbDyvhJTEP-QZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX5ej6vra7Anv+
 3jC0gHq0JhMSZtmQyuxmfEABV6nOO+knPg/tHn2mHiYTlxxk59Lyxhn7Cs88okJ9/RiuvctiWXH
 hCJzPMNEFRSx/jFIDgyQ5yMlfgrJ1oYUS7blRWRJluLcb6Ep4Bk96yo1D87Tj95uBI/EDq1GTbj
 IP8leceBsGZtBgAQmihrPvVZ9Bk55VM2JvP4QqK/04fLL4smAEp00CrZf2V2ZyiUFO6CNRy6kza
 EGkZFtaD9dR8u7rMWOpNY5YmC88djkti08WOYJ2MQC9LlN7YUI9io1rUDhhkHtG65fjv3q4rpJt
 JxrQniN3oufHXfrHfEkuRpYwuNGCIxow0QRTCL36DCFl/jLA8tT2SUJ8JBLEhKaxBkeSYcnnFHs
 UC+8Eo7Qo1v44dlZCYfNmNDHU1X8/sClKARtc1mJsOUJ1xb7QaOC9zEIP6vqkYViz14uzzBqiEn
 /Oi3ybAVFmYaT3y3BZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX9Le/m61f10Vf
 3qBx9y/OAI4DQBb2/R/DBuqdAQVQqLpuvLAMq3iyHSWp6yODMGXHZ+pifWQQlVwRVSorc/Q4WaV
 WRdjIsVZzRh7picK0rw4ewFVnmYrCeU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110107

On 6/4/26 1:02 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
>> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
>>> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
>>>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
>>>> (address, value) pairs that are written after PHY reset.
>>>>
>>>> Unlike the existing "qcom,init-seq" property, the address field is
>>>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
>>>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
>>>> class hardware needs this range to programme pre-emphasis, HS driver
>>>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
>>>> via platform data.
>>>
>>> Are those register writes specific to the device or to the whole
>>> platform? In the latter case please extend the driver to write them.
>>
>> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
>> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
>> devices), the writes split into two groups:
>>
>> Platform-level (same across all MSM8x60 hardware):
>>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
>>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
>>
>> Board-specific:
>>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
>>    devices use 1. This clearly depends on board layout (trace length,
>>    connector loading, etc.).
>>
>> So the platform-level writes should move unconditionally into the driver
>> behind a match-data flag for the MSM8x60-class compatible, and only the
>> HS driver slope value belongs in DT.
> 
> Looks like it. Please hardcode the value for your platform in the driver
> (with the comment), meanwhile we can try looking up the actual values.

Do we have the values for a MTP/QRD (or whatever they used to be called
back then..), like we would usually put in there?

Konrad
