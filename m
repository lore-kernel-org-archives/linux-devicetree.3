Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D63C1401
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780145155; cv=none; b=NfD9or/iF8Z9lXw8HdOsW4vT3MqmF/bS90Kgrunx23HQ+DBGCCTRr0jmkKKjXWpVeS7nDIIZOAzqJ4wH+bQizUtxm5Z0xbBixATH445ovtfYdOxvdOT6WHmsk+QDJ/hKpWHhsffZJA9S7W1S/sj7XocCTd7BYACPztuRKa3ELRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780145155; c=relaxed/simple;
	bh=qLHdRRkUwqBxCpPW0Ntu4msdUcCpKXvE/Ks1icjXsPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6RqGpELtzMDMBxZ2nvF0Ol9hvvWbKS6yrUClwO+mrWNw+9ut/JXzjyoQHjOb8vt0GmhV8D7TJEBHs1LRUtXZ7xrakU7wjagWxTHYDzzPkF4O1I6r0YlOxkAXtjN7g3yYo8MplFM9JQN4v4ansl49aL/4FYDER4ppGbtySNnlfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miv3gCRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFQcXiOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miv3gCRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFQcXiOl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U3PuRS1399279
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 12:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=; b=miv3gCRaRoUeDlx4
	OD4Yfrm+nG9seA4EnIU3oyzrx1uJQ+nnIM5V/WIDWiLMl6+Gu+Y5hT2PFqrmegKE
	XI+YQ5ooCXc3necMfA1qaCBakIp09err41Ut4jvpHwj/BRf14Hr6BK5+bKJZ/sfJ
	RA7Q6K+OU9wKifPgd5ZXfXBWBQ11FcByjkb7o9LILN9XF2cDbZZvyENjGZvAraga
	ak0SVrS9ABLaxJ3tgkDfhjSceupxqeBkPUoNw0s8dpxShf5TvjYZM4IOHJq1Buz3
	4UncoICJyfDZm4JWlEsQGyZcnhx/BOL/9Z3dpLVJ0leVmZ7UptkpwPRsFT1jy22n
	L84Wiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyurxn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 12:45:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd6aeb3637so329773575ad.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780145146; x=1780749946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=;
        b=HFQcXiOlZFpMOMqbd1UYKsxl3nwYfnckMKMd6ISkmT2rC5iN4JeUBF8MH7Z86QGa+7
         PxBNJ0qPQZEQdBOIBoJM5NVXVwiVwidaEp+uqNyzn2AaR5DUgSHplQzWlrlRHzJrK29s
         UmWcvx0hJLFmcOtxT9di9QHTqtF72/GiDwPRuetkIfQmaLEpYMo2mpDIiezOFtQUX9Bu
         XE33/GgeHxrFLiSNLvzLpj+9GIOwhN6qhgeusr6l3nSm0xHK3HWSb9j+TVVFyl1aR5wF
         x2vVnhQPU0GSDYPbsTmvdXAPF7RQEefuUq/BJ5oIAO/5xXbeo52BfP+IdarSP7gOWWkx
         kklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780145146; x=1780749946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=;
        b=q9Yo+6Vk5FPSpLWUlycUbCcsYTCrQTf6iigXlwEZYpu/sP4SbuKhQV8SbPLyj/q9aC
         QLnkgdlD6ApqC9gxVyXmcvlXzwIv8ftD7rN3Fw8SJTZxeW8RKFAVp9IOcHRUrGuOTXnJ
         c4srLPLBEMepJnQB3vN7y7eCS1tIj7AII7AE+e1XSPQctGuQmzYt897QSXYGTqKYbnKx
         ttVjYF68KJGF5s4+MULw+oU9fY+UwvYIwwrBYXS8a1LQ4pqdT/RtmrM7Rl13gg2EdiQ8
         Vg6fkqEeqOqx6oUWztusgM3C+Mn2Gd9lliAf73YrwVArKsK9hgT9nAMrWG4LjyKO1AfB
         7kmA==
X-Forwarded-Encrypted: i=1; AFNElJ83CgEYIltp+3qtuY5xGN9gSALxLhMWMQ5+w193lMOphmlyYiwXDCJESoUMuuOCRzhlLCMNwWkSXvmy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnyj+jQYub3PdOhvRPWJst3KKShQiTedoFyG4LfdavVUVuls0L
	4GyIR284D1fmZX6HtfxGzvXWDw1JkPJr6XnZuWRp+uwQqXvmn1438QpxkWCxOJFBbBg6HNI5StY
	Phu3OkZKbt/gC/d/ys33vy2XhJCLN0mZruntHXrgbcRXvDeqjZipKhxX+3iTqRHZh
X-Gm-Gg: Acq92OGsZlN3s5W/f6l0oOFOA3iDJoWacO9gogw5+9F+MsbtKsUKxM+MAsKc2lMUD8y
	1EqzxlqSeEpn68FNM678rK58ZIfkRyUEBDnmHE/g6tafcNnOsULRC42VhLrHJZ4I+tQIl2ifjY5
	mraH7Mku0sNQonb3/S8Ce4uY7qhL38nOaEIIQhPFmf69BDvYGQegWeCou7sGqPgYJ9HsCoO0W+9
	wH6Ily1M66lK6fDkDLUPqyFViAetn466fbOgVU2wVgfWg78xnfBHWBDwwMCo5GyPBPE0eBdVARi
	oB/djCjjfBDqVPg2HJs1Zmd6MNq02zCWPsaHZK87XOlkPzChNA0sINQnrxjeti8lO4ojLjWP4q9
	Ij0nz2p/3cvclYpGQ+ILq5GpsYH5BNy89AXxeqqZDRfGuve8KQYlyTdw1zxjukM3NGeN8pZDQpC
	o8MD3NzA5JH/OLJn/3LwUZ
X-Received: by 2002:a17:902:cf12:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2bf367d0043mr46268675ad.16.1780145146406;
        Sat, 30 May 2026 05:45:46 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2bf367d0043mr46268355ad.16.1780145145817;
        Sat, 30 May 2026 05:45:45 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6f57sm49204365ad.13.2026.05.30.05.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 05:45:45 -0700 (PDT)
Message-ID: <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
Date: Sat, 30 May 2026 20:45:27 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org,
        linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Zhaoming Luo <zhml@posteo.com>,
        Ram Kumar Dwivedi
 <quic_rdwivedi@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260529113338.984301-1-can.guo@oss.qualcomm.com>
 <20260529113338.984301-2-can.guo@oss.qualcomm.com>
 <20260529-neat-bright-shellfish-eab5e8@quoll>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <20260529-neat-bright-shellfish-eab5e8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDEzNyBTYWx0ZWRfX2y/+ZgTFEzjT
 BD+OToyqmGMwwoPwm709Cvk4zzCNtCBd91wYY4q8Bxx4ELoPaIpGNMtXbKQm52+HW9ysYsl2XHn
 rQHlO45aii5jTklTKPGlRT3o8a8fk43AmxIWOCcfLNZ2aP+MwIx04p1xsQzLNM3IEpQ0gVh8wGh
 A0FHUByx8fMOC1nh9Ntid1QKt8ebOWe6rDF8MVlGDTwt21n2TY2DmiC1cSa7U5TxehOukx8l6kw
 J0XKnPVudNDS8JG2nuMjW5/HWKcGVOI5XTW1LXaED6U/r/PaQV6RDtulB+ImNflyE5SOLAmIAuS
 +N4LhaRJ/7UIfBKxa3CpSG/kuKZWQIzBD3rJBdQjyA6TJEsG6/q/0dMvKJO+kPS6Yhj5Weg27KE
 flttIYhXqKN2MjOmjI+rajCCGD+KmNDARx2NN0iTnmg8bBjvKcOsnCQzrxXntuEdu2A8za3gcVW
 PbTdaCOTH8EqJkKWgeg==
X-Proofpoint-ORIG-GUID: L7SUTn3pH1_N_sFK73nhDYzdJsRrmMzB
X-Proofpoint-GUID: L7SUTn3pH1_N_sFK73nhDYzdJsRrmMzB
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1adbfb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=pYZB3BhZI7Cztb0yzh8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300137



On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
>> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
>> Speed Gears (not only HS-G6) to compensate channel loss and improve signal
>> integrity at high speed operation.
>>
>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>> required depending on channel characteristics.
>>
>> Add vendor-neutral DT properties:
>>
>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>> - fixed property tx-precode-enable-g6
>>
>> Each property is a uint32 array of per-lane tuples:
>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>
>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis values
>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>
>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/ufs/ufs-common.yaml   | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> index ed97f5682509..d90cf25adfa5 100644
>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> @@ -105,6 +105,51 @@ properties:
>>         Restricts the UFS controller to rate-a or rate-b for both TX and
>>         RX directions.
>>   
>> +  tx-precode-enable-g6:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    oneOf:
>> +      - minItems: 2
>> +        maxItems: 2
>> +      - minItems: 4
>> +        maxItems: 4
>> +    items:
>> +      enum: [0, 1]
>> +    description: |
>> +      Static TX Precode enable values for HS-G6 only.
>> +      Values are specified as per-lane tuples:
>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
> You need to include them in any of applicable examples, otherwise
> nothing here is validated.
Hi Krzysztof,

Thanks for the review.

Since no UFS5-capable SoC binding exists upstream yet (the target SoC is
still pre-CS), there is no vendor-specific YAML to attach the example to.

Is a synthetic example directly in ufs-common.yaml OK to you?
>
> Why values cannot be on or off? Or even better: why you cannot just list
> all the lanes which has it enabled, assuming disabled is by default?
Thanks for the suggestions.

For the "just list enabled lanes" suggestion: precode must be configured
independently for the Host-side TX and Device-side TX transceivers within
the same physical lane. A lane index list alone cannot capture this
two-dimensional per-lane state. The tuple format <Host_LaneN Device_LaneN>
is the minimal encoding that covers both.

For the "on/off" suggestion: the on/off string pattern is used with
single-value properties (e.g. LED default-state) read via
of_property_read_string(). I am not aware of precedent for on/off as a
string array for per-lane tuples.
>
>> +
>> +patternProperties:
>> +  "^txeq-preshoot-g[1-6]$":
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    oneOf:
>> +      - minItems: 2
>> +        maxItems: 2
>> +      - minItems: 4
>> +        maxItems: 4
>> +    items:
>> +      minimum: 0
>> +      maximum: 7
> What is the meaning of values? Nothing here refers to the spec, so is
> this driver specific?
These are not driver-specific. PreShoot and DeEmphasis are standard
features of the MIPI M-PHY / UniPro stack. The range [0, 7] is defined
in the UniPro specification for the relevant PA layer attributes, and each
value maps to a specific dB level as defined in the M-PHY specification.
I will add the value-to-dB mapping table to the property descriptions in v7.

Thanks,
Can Guo.
>
> Best regards,
> Krzysztof
>

