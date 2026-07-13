Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417C8400E0C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944881; cv=none; b=onCLPbf5en3WAen6Gjr2HFUP8iSnnE4dgZsRzMSBSHmfkO4/9vUZ4/UuvAWBgjU7tYjwHlw/whW1tJoY1d0sPhPGTVqJLTLhLxRclkhW/PeRjjkFumH+oDZfctx8h3/5sUQsoe10uLa5bwZiYm+0n/S18tEMLVl0lfwrAexKPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944881; c=relaxed/simple;
	bh=nsI8T4STqsmeEuiGAOxbYxuJO6hrXOyetkh9eq6Zjwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcCEWjDxvnQR+mm2N/yuOs5JLfliuWS6MiueTnqyIQiB4G2Kvtdxu3u9Pzqtk7/qcm3m6FzNCK9gfIdbg8P2UI7afZkhev0vVhUHOr0B3ND0wLvOjAGEuPDRgrSHkqXdBbbSVFIK1jkHXA0YCbbEZyQxqUPXVjzNrrq7WQljQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIZqpuaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMrR9LnH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIZqpuaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMrR9LnH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEMvs1333558
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=; b=PIZqpuaU+dcN2cYl
	K7OG79yORlwqF+yS3McM1y2kI/lDMjYUmLFLiIPJ6JEu7iwlt5Y1mY7nw5m0KW2z
	K4f/Ogtn2kEloNL9btXjk2rKGCjHHDmSNdFfQuO5sZ8xSbbi6xnGB4GitPzAQiSC
	L3k47FPtVDrgy2IHsSaIHPu9/kI/yEsudc2NxZhmV2FMB2crUFQP7gn6ZIAc7As/
	ZHD5swctvnyvRq4licOfVoCFNqfq/qpBmApvLgiSOiMTkxJTzR3Dnll0cAJzJiXC
	xWReY8uJgUT6lDyrKnc41xax3hpq65biHKXaEOVZIW9UrnQkhH0pvp5FMfC07hdq
	qUFBuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8hdrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-901fdbfc3abso18662746d6.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944872; x=1784549672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=;
        b=kMrR9LnHJWgEtg3W8ExNqwgYxhESYNok/6zwHgCI6O29Vd1E9SY10awPWTv+a3cH//
         ko8vQTIlzXnEkMpFmQ3QcPT+v4zNPBTVNlnsyhX4x9GkonWLta2vt52jI6seoCFHcIYI
         AAtKAZZ0SE0HFPJZy8ZgoWoZQr9BJ9F9viWwoPRwmIvEGyStv9APUkvGmhzIH352K7oD
         rJmvBKZQS3h92FgHjrS2u9mUZe5ylj4zoOpK+b2DnRFJ5iWCm0pyuQUA8DWgI74gZy+q
         klTO4fy21n/yGNhzzK4yWGIeFl+IMjuYj2j5Vhh+SLLRfinroNw914ClnF+4MIb5tQio
         t+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944872; x=1784549672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrPKA0Oj1Y4loPQt0pufsQoLaVHckgT9fOh151W7dnk=;
        b=dXctXgtOpIn0zT+1sYRupqnQg1nbDEqJHXOzOLwyaUlnAGh04J0ndzhIOMurNKqCCA
         d5XvkdKh25nXjosX49pdJEJFlaBXroawuqIqTFYgxYJCvlVsxfLllYYiNYMaoI0wCGuc
         1Wsqwqn+9OmHMYlwO/A6P+hl7pyZMWMS5BlFR8N0aJPTu4J+VgBUDtROPArFAgigZJ8R
         9G/zRA2GIoGgMOwCf0CdUDhFcc4PDTDNZbVT5oZgGdvsYSIH7sDLfHj8r8FXoDFl/NFO
         Hj5HKhKsp247m7he4NPCxF41tY6zXtYU9y+g2fcRniyktsOUOMy1MGxEeG89yXlUaN6q
         pjzQ==
X-Forwarded-Encrypted: i=1; AHgh+RocbxDtfYQg7V6QHrIOYD+7aDL0pYWz27meYiGXgwUeI31Omk6wZHgi0x5Xa419dgHptDOCoYStXbws@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyXgVlzzy3LxhDjci7WMPx9l365PikfRv3EGJtuZ1scbJTRPa
	y/49H2kthqBDR5t32T6Hjsc2cVQ0W5N8MRvKQi5cJH1JZAzJ67m2Hxq5ilZsVy55HqTDpzqiY17
	zHGfjRyooYp+MEw4+c9cBmn783l/Jmai6WDthresrGMkogpsqa9L0kdzn0uFpXw5b
X-Gm-Gg: AfdE7ckxH8KcLZqXxLO25wjQd9oQVb8BdTf/VBevJaJayL8P5PCo8VAzqfgh8bFJ8dM
	6AC47GSL7aUt6AWscMs4Jh8JPbjiTQBgmPTvR+rNPRNRoQEmwEqMzjqtFD6f9AgiAtbgCNOBPQQ
	2b0D8GRbbsgCW+bNpw6/4mxAVnOTGLcCIToIqOFjq4Eftyub98q+tKACCRJP+I0foMWTWEsiZ8f
	33t6TskKNrsBfRCJI0llfz1KArYXmJZ62OY2g1aJZF9YqZcHplSUBr3QU5WEzyQLI8vlSU17gmx
	/idr/nWshTQFf04CKvstpvF/QX5IauXh5mrUM754Tb9EGD1+EjLTUjoe4YTh5OOh5icP6oP8Rxx
	9F9ITeLJJcMakK7ZyTAcud38Gv2Gkv8hgQWA=
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr77529246d6.1.1783944872338;
        Mon, 13 Jul 2026 05:14:32 -0700 (PDT)
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr77528786d6.1.1783944871941;
        Mon, 13 Jul 2026 05:14:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm15075398a12.12.2026.07.13.05.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:31 -0700 (PDT)
Message-ID: <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:14:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MVTWFGGeQpCbXpczBGET0une6UL-GB5v
X-Proofpoint-ORIG-GUID: MVTWFGGeQpCbXpczBGET0une6UL-GB5v
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54d6a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AMBhOB7pGyomvzLA2OYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX2fB+2G8XUjAE
 xAe04ZjNIYZ2+ySxDBe7F9r0zkv+O9LfHKPIC7Vm4ykmyEYSHoWGfnQAJZZAy7resG4CGnnRMs5
 WcJZmCh1P7f45S0zMdRKJR5XQvLjklE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX6BNvKlXsc9TP
 DtCl8z+F1u7FdOSU+5cxD/LErQUuEa38vwrqKsvDlE9OQRxi8KWMvOakppsl63/wIlxEBiINJwz
 xLgmuzpx6OASYfYQxdlDWE1BlYCxndgV2kytZpOeaAL0BhHDS9zS6pH1r+afQLG1DdNwZDZ1DSe
 9D5G16x7JQ+pImzxBDu9vJymz4u3tZj6bkmmrwUNcKGc9db2po8K19dhIR1LjkLvI6fOa/YPqqD
 0e7VRg801f1PrikZJkRSIrRr9FIudD9RVZPUEofsLzPAMQY0+hDcEGOHk7NWwo6ZKsm/WQ9Wf6r
 c8hRzNOhduRNjnzuUNKiIGFdZf1f6qCnDD+ehcuoawy9qvSQ977z3kj2bePBhdWLrfByapWpXwI
 qQiddDyXdUKRnNRdBWd3G5dyzwMjETDcl/L8683bKX8Yp42sbEtccgnhMd9iuY0pkLoMW0RBQe/
 n6MXYX6KcX5yOJBByoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128

On 7/13/26 2:07 PM, Imran Shaik wrote:
> 
> 
> On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
>> On 7/8/26 8:25 PM, Imran Shaik wrote:
>>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>>> differs across Shikra variants based on Audio subsystem enablement as
>>> follows:
>>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>>> are required to be supported on HLOS.
>>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>>> handled on Modem, so from HLOS only resets are needed.
>>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>
>> For the sake of simplification, can the resets be enabled
>> globally by default?
>>
> 
> By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.

What does enabling the provider node have to do with changing the
state of the resources?

FWIW there's nothing like reset_sync_state

Konrad
