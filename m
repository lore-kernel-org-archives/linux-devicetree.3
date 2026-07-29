Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E418438FF3
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327485; cv=none; b=KNurE2JXCcYY3KJepwzohNNdDQWiI+pHu1C7HL4yKRMZQikv8Gw2LZ2sKveft1F8xpETHNtcCuY8fE96CFfjYhEotEMY8iR0rlWrccnQ7P9no/6GRankw/J4W/iKB7ZWNm1G6CT2Kq86NITvKUMfd6+r2vwlydF00Z0OI75cb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327485; c=relaxed/simple;
	bh=XFNOQjyXquiXGVIZ0XLx3c2mZBrHIE1tP9VygcQlH4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHv+aUn64k9JwH/QjbkAKFlnFr2/2rZlWOiQXPF2pSiGf8QU+pHRDxtARJwQkNf/i9Xsr3A1SdOoQcmFwAVDSeuAZ0ZExF6SgbJfgKZO6/5PBoxSK0aljnd3u7m507tbltHMNTmZHR98PzxbCsesTno0WiECXXFH6XBEV3UVUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Czg0D2cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXJpMAQm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Czg0D2cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXJpMAQm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXWJQ1218111
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcALPi8e1umwIbUkcXXCGQ1MbABqonpV8qqtdSQE76U=; b=Czg0D2cp9xhRJ5i4
	5/GMq4mw1j+Hnt9AQkfI9Ymt2PX8SjSQB2HeDHRnCsVLRZ7Gzv4vU9NP68mdxigY
	55o0MXJl1xySP2us6+V0Hg+RXTikEyAmDAfkig+eJ65jv9MorcTnHjsfH90xYslZ
	lA37r0l0V8buCqOaVzj/VI2I3lEnN7VIggKLFj8AnjQ1AgDhKSIZSv5TlYBEbB3X
	wEx2++xqjLi5kaAc+10UHAxoeMI4DFHTaiTOR+ZJZIBsXFDHyCzUxP834n3hL3np
	C7rw34D6Ym5HFVqaQ8qpPimJiUtOsx/jpHvH91xvpK9TpIlR+RWJn0wLElcglSCB
	qaGiRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj05wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:18:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso13509561cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327482; x=1785932282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcALPi8e1umwIbUkcXXCGQ1MbABqonpV8qqtdSQE76U=;
        b=QXJpMAQmkiWR7otCcl3YcvVQkDFFFtrXiJxW1hQ9P8DULzODB/oqfX+kr4ejlbymqg
         fGGF6eOIzmbW99lGyTE4uvyBpir8KW+FzQwgDa4BiGnrP218HiatsZZtWR2lUJdy7VNv
         lxuC/Rj67VZ5UJky5QewJ6HM1KBiaWfpyduFCfZFdRapW6nc2B4oFRIRcQV4rSK97VF5
         ssOAeWboR2FIPyDcIttwIutRRo27Eme3bq2XAui/0CMj56IU+zNr7s/ZHZsCVcqqbH0b
         0nwsThiWpO0EkgHCQTGc03A+L6ViwwZi32CAx7Qyhxv22V4YvWhgAnNYUEvC8zfScYPf
         kfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327482; x=1785932282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcALPi8e1umwIbUkcXXCGQ1MbABqonpV8qqtdSQE76U=;
        b=k25w8Ppg5Rs1p+qGT3/jlnrCNurW1wnN90cfupR4YeapEMlpDMYrLhXHCrdFRzX2P1
         TN5YQGJEswqLFOkV1nY61n1a76FQqxz1hnIXlSi7ebvvGgESlFJdpsx1Q5z5C1lBRops
         fpJ2aS6PqQHbrUuQ7tFfSeJAXyJuAwlXW30aPMRMZtt8kukIP7zgOA7Hp2X9Adg4wwhm
         akpBsY/A0ZC8wQvBnh5fZSCyaoJbjLL5BWL0FPKY6aidJdhZ/kh4ut/nDPmpwTcBUMrw
         9RlNYyOAAjJeFfTDJForyIki5Y7oH0DjypZZnj5cS52M7qU7RZBh5tittpHYRh/XzJ4h
         QM3w==
X-Forwarded-Encrypted: i=1; AHgh+RqLcHpkbIKYm9AD+9cqKFgoxTXzahOE1fe6Qp64lASd97DSBjLkoo3Zd8HXflih+ZADvdVQ8GUxk++C@vger.kernel.org
X-Gm-Message-State: AOJu0YyINKI/b962xXH7ppEBi+3QgZgA4IcbUl/5W2lL/bigtbP3HLzV
	1U08L8U+LH+ZbOyrcNVCtAhf24FrCVxF78BkwlkhqBnR5Gj8wNlWwTPFnTtJYHs4Slf4RaFIgYE
	exiNivsUWpCDevReEoFaHHYwrq34QpYAKysPWjC8CSPf92fcLox9ZI3VxxDhnDMFD
X-Gm-Gg: AR+sD13sbea0XSCvAqr8HWuRKDkC4/1ww91ql/9GOGi4+W5a3s2XlNaAgH/cGeWjn4m
	T+z7gGZD71dt+g+rNJ7aLgolkVJL0VjmnNkFw0ut41YdGeQ1GlkKyk/4w9RvALByBxbq3n0YHEe
	HUb3LkvTQox+GseGpMdGGCvEMD/sFzBJTNKzCzKj0ME3Gcb9iSt9Vrpq4pdhFzbkkE6uLcFEGSY
	apGdt1aqvnEWDKKLVaaRIpElbMg/eCzRwzMqYVxH2TXgnS08mq1XWTNe4L0sYFoJWxKBaSOOsnP
	yOPK8TCjR2PFKXmSY/6PS5FJ/vyOYzV2hMxBcCkdxOOhi6MrDidR9OlNoZkxJajwPLnZvSvtLWL
	zMVHw15+KST2fZBRqEyp2Yf1BOkw=
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr56815751cf.57.1785327481779;
        Wed, 29 Jul 2026 05:18:01 -0700 (PDT)
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr56815511cf.57.1785327481270;
        Wed, 29 Jul 2026 05:18:01 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49764d77970sm56598785e9.5.2026.07.29.05.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:18:00 -0700 (PDT)
Message-ID: <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:17:59 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax
 <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a69ef7b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=9ySP6EWktxY0XWfVt14A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-ORIG-GUID: MGGhVG437GYyY9vwwc6Vmy7pDRhYm93i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX/JdVt4+fUMb7
 NKz5HA19E8Q+BumdnoZsj9NfEpg4G6YoNq0oZAuPiHG88TP5khs43U8L+bHG74Vd5G/I7nWqKZR
 3OB6yRIPb4PAH9ShpuhA/Kg3LqWfhxqng+v305jFpG5Gc1pbSTdasx9N5qWg7UtXKbzQaG2SYhi
 jQnldCTooIqTAAJEwt/vjA3IigdG/a6qnxInoCKQQidY4IJsf1wToX1QBXsLiKXl0xzeUDnHJ7D
 YTcsHN+1yLIUQhYaGEE0CY2U2yAm3QxIXAZXYmLBCrpS5t6r/JDRUxiPnqj407kbRU5HlBo8rET
 uXj8S9SYVhe8ZM0NT804/GMfu3aEfc7y/vZRosX3O/g//eNrole4Z74hCNSdEcAmgDTf5oTTtWQ
 76/hBzj2bqgXYR7qiiZaRN/zS9o5nD7TjC/WHezdr7Ms5qrs23RqDjxd059rOfY6o789+vQyGKw
 Gpgf5vbu6va5ghNGfJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfXzwanixDVqrcg
 WKt1JeVuuVy2tdcgaKoK90d75Rz4tqClmtlUkcTzPPdcW/kyOfCZFyqKjSvFbYVJgG4esfibSE6
 Vzufqa0FWT3hFsZLKSHtARQUKcpz3zA=
X-Proofpoint-GUID: MGGhVG437GYyY9vwwc6Vmy7pDRhYm93i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290102

On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>> mic capture and jack detection via the SimpleJack SDCA function type.
>>
>> WCD9378 codec can be wired up in 2 different modes.
>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>> each of which has dedicated control and data lines.
>> "compute mode" on compute platforms such as Glymur is enumerated as
>> single standard MIPI SDCA class device.
>>
>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>> live on the SoundWire slave node in compute mode and are forbidden in
>> mobile mode (owned by the top-level codec parent there).
>>
>> Assisted-by: Claude:claude-opus-4-7
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>  1 file changed, 200 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> new file mode 100644
>> index 000000000000..2ed4ad92958e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> @@ -0,0 +1,200 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoundWire Slave devices on WCD9378
>> +
>> +maintainers:
>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>> +  class ID sdw20217011000 in both operating modes:
>> +
>> +    * mobile mode -- two slave instances sit on separate SoundWire
>> +      masters carrying data only.  A separate top-level codec node
>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>> +
>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>> +      master and carries both control and data.  There is no separate
>> +      top-level codec node, so the SoundWire slave node itself owns
>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>> +      marked with qcom,compute-mode.
>> +
>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>> +  decide which mode to serve; the presence or absence of this property
>> +  also gates whether the supply and mic-bias properties on this node
>> +  are required or forbidden.
>> +
>> +properties:
>> +  compatible:
>> +    const: sdw20217011000
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,compute-mode:
>> +    description: |
>> +      Marks this SoundWire slave as the single aggregated slave that
>> +      implements the codec in SDCA / compute mode.  Only present when
>> +      the codec has no separate top-level codec parent; in that case
>> +      this slave node also owns the codec's supplies, reset GPIO and
>> +      mic-bias voltage configuration.  Absent in mobile mode.
> 
> I doubt there is really "compute" or "mobile" mode, so you just wrote to
> match use case, but that does not match hardware.
> 
This is hardware fuse setting, its not just usecase based but it changes
complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
devices representing tx and rx side of wcd9378 however in compute mode
it only has one soundwire device dealing with both tx and rx. compute
mode is sdca class compliant device.


> I think there should be no separate top-level codec parent in the first
> place, thus this property is not needed. You always list here all resources.
There is no top level aggregated device when the codec is fused in
compute mode.

--srini
> 
> Best regards,
> Krzysztof

