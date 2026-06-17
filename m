Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADFE3F0AA4
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699551; cv=none; b=gdNbQPPJSaudDXusxE0iSA55+7sO5FPzBoufUHW0sBwWLhpZPpSsxn7IZajc7lDPB0WcIK5iHOB4/i4cZdnXUCkfCoVa9WFZ5wtGQztfjRUrLCNgp3OqbffI1OXp26mxwT7R062syzNZyh2V05eJg8OGwDkhjIdSpG7yI0gteDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699551; c=relaxed/simple;
	bh=eImam8Oulaaub6runznnBN0u0zV1LYUj7oObPpei2uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTTJcExzvLJTp+EUw+zIX5FdHzTdjqD3bPbKMjS3S24lEoUQP/9+s+Yykun/MNY5s3+8IMVo1vm1IJhhmMt0htdOxvsn+TEjvrhnXIU5Nxr2i+NJQXEg2LvSR9hC+NitHwIPJI9wE6U3nj/XKWhd1xchLJOy/3UA3oB2DPmBj/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9pl7CED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkUhbifj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9pl7CED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkUhbifj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V7uC2291388
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5iNzxVd33WkrbtRaqNOqht3QFH5J10MzySisKluWjQ=; b=V9pl7CEDHUG+gqsz
	pBQ6DkR/9/2Pt4Pv/aVkQmnPE4LbLqdEb50YNmjq6H1Tn5JvG+f4GmX+ZhWLtNg8
	0MZGFymJ7oG1sS4wyfLjomZ1G3iXLGzaG9jSPPbdGquXQ+SW6hG0Bz2jd8E9D0wW
	YFjcA1SFJktbPuDr8Aa1H7EXQbyIBkGh4sEaa1VNQ7eqeIae48ue2+N2sz0fXP6e
	GjDKOQ2mAvcrRN20CfEmoa3h/AjC9UiVCtfsKzGzqvZD9y4997JQnJtIWwnwB2au
	h34lAn98jUnU3C9ESoHljHnquz5F+VRlx/Gp0xNb2a34ZHlIY8MpdaN4Yjew5upn
	6Mrzdg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevk5j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:32:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c981dc39bdso301718137.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781699548; x=1782304348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5iNzxVd33WkrbtRaqNOqht3QFH5J10MzySisKluWjQ=;
        b=BkUhbifjs7duvvmQEVb10liu9INJvF6Hi6YYbVeU0AX+yBOTx36QkOg8RsiDLRvsTU
         Dr2MsKSFDnNz2e4cAZ5YsNnE6LDy017XBMBcX17C39c2792spt6zxygsyrcqAzeSdFyi
         gKH8rSh5zLSld9yXKjhmId1UbSibAkXwZAjUD2JPmHH2jAMBY0cYR8+Jssow0F7PRcVL
         0MuPKyi6yVK2OAt0XZ+V6TnHiRta/IWkvNLh1Fwj9wKoOlt5vfzggrgL6+8WA+/WRciS
         x7hehD4rjnaHntAilpRAgBgxUt+TyKF1z/5HOezCqhakQmuu4hxHGU7TeRd0DS8kxarx
         5p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699548; x=1782304348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5iNzxVd33WkrbtRaqNOqht3QFH5J10MzySisKluWjQ=;
        b=Hp8norosMhyE9pqOOwkr5IZtB7XJPkCNGJ2jW7ZINY3d0q8V9PlxiWJCTMLvL967mZ
         JIIGpd7SvVXTxvP1b+bZ0sJVgeEMd0pNxOha9h3YHUwZa4aLso6IBceBk5e+ieAQenzo
         cmk1NQ5aEkWwr4QvQGRbbY35LYFWkh63CovMmTdyynorKDNa2wBULjECebMhrB+HWx9x
         Frpn36ilZci/X08/z2VoHAmvn4Iszyu7juvjVreOF+FAfTI2TFDNyViN7OcTBB7BvcdG
         5Tlg+evssXi7Yu20K2h7Ya2o5hBplKa0Id4Rd0K+1kShr0He3saM4V88OORfUo5Cssyk
         LG0w==
X-Forwarded-Encrypted: i=1; AFNElJ/IPANbufxSMKBXIlt85rzsBcoDQjI5G3hAkPNJTJUfEDxjvjvNTzEZbKEWML11+nlXwzgn3JTyhn4M@vger.kernel.org
X-Gm-Message-State: AOJu0YxWsywG7aDWTh4Fq9/fdRStBwZm+8JOY49VRFXnz3oK4fqFZPb9
	rUnAf5PJbmhppvEmiPtFbcLtuCGkLT1HzHgS1iwKb7HqjsdbHocKxBfrepXODnJ+FMmHlKNjEqq
	NTItxMMIgj67QKnj0LeNKCstXA76R/n8MconX/cspOeLkZLDzHA6GUPSXKs8Fb0mZ
X-Gm-Gg: AfdE7cnXfmIHBjtSyY1t/jW7phgIAkHB8G41BtOhT0K2dQ+gTxAzJl7POuGZJLQAmuw
	Iqh1JY/Etn0ZQD3aeteItRyh+lsBVueulDhoMRqgbkqM+sUCNSTLg18x9YVJk6IYBRyeqEJ/ZmY
	tqzZlyTO+cyuOxXQiA9osDyz5BjgfacyId+UlfOI+5H9mEtRwLTs4C+2DzQRk2QX5TOvQPowKYC
	cdvNUVSMYah9urppU2sB8T9MRnpf1et+YQ5VDqVBdKfzGXDN31fpOYMbrQX/oVtQ2yhKX3yi5x6
	ClVvkmWVa3inVbK+2+V0DBr09K0yDR2K8PPWj69H3pYK7HDmrAOk8hJ6KABWkmX9OAjbYdDIZSa
	KjuC4mOAFCJRGxHn3W0sDGCVxVj8Cgt5M7bA=
X-Received: by 2002:a05:6102:a50:b0:632:5db8:f656 with SMTP id ada2fe7eead31-7246c894f83mr620496137.4.1781699548530;
        Wed, 17 Jun 2026 05:32:28 -0700 (PDT)
X-Received: by 2002:a05:6102:a50:b0:632:5db8:f656 with SMTP id ada2fe7eead31-7246c894f83mr620470137.4.1781699548137;
        Wed, 17 Jun 2026 05:32:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c06607d10f7sm63121766b.10.2026.06.17.05.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:32:27 -0700 (PDT)
Message-ID: <285a7d06-cabc-405a-9414-dac0dfa1736a@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:32:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
 <93e7251c-c75d-4e43-9ae2-bf485af58de3@oss.qualcomm.com>
 <mp2hl67rupxrssa43dcy36m3dwatlxsu7n27l7qdqsguo5i3bp@bo6sdzxglxt2>
 <dcdfe9f4-aeec-4d85-92a1-a42592fe11c8@oss.qualcomm.com>
 <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX4wmhlcpzrelr
 nNduDyebL7y+VPanO8WNOFxM6CeF/1p8f5mYstxhq3iE/r4sa0J57hcym680dATi+tphSaQskZu
 FgO/jylE0es3VGjCSMsBeNJ5uOOYPu5dXujCNlMZBzVAIRGGJ4b+PW6abi05OzZ23CdOOpn36+G
 kvr4BevTGEioOG/NH0XSlay4VlOAn4RGxBfhXJhwB3mbue6x7+leNZQAQFd5rp0Qmi3Hj3elzgd
 u3jYJe57a9JAaI0lqEoD8w16pYIuubsoin39ZMCWYzm8j+gDA/lU6ZZCxa+mSFQ3yyyK+XP/hwy
 iewbs6LztP2zCNxI5anxZX9PYa2TISJqB/EpSlbH1rfPkzykh3NF9TDk6mi8RUFLVWTuoZwqAxi
 UL/4FJHq6gN1vr3xEZV8Y7PkF2m/OV2lcueWEHBrkFn4SBKbNx8B2q9E1s5zoBQtvLYr+yz/UMn
 zwDaslvTyHIyDysPYJg==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a3293dd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bGR7GFRD2bAmefyIwN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: W-OonxlopRHRf2S4BTkt0uXqzmUwnj5m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX+QNu2Y1bQOFd
 +n1nZXTcoEp0kedsktXnv5SagWTdEmJw+yEfoihC32CwKXR2EbZweS330O9r6qWI5Svb8VZIcYP
 kYz6WsL5xB1NykJ7JgyEpoaA3Dx9iqk=
X-Proofpoint-ORIG-GUID: W-OonxlopRHRf2S4BTkt0uXqzmUwnj5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170119

On 6/16/26 12:15 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 05:33:15PM +0200, Daniel Lezcano wrote:
>>
>>
>> Le 15/06/2026 à 17:14, Dmitry Baryshkov a écrit :
>>> On Mon, Jun 15, 2026 at 04:33:38PM +0200, Daniel Lezcano wrote:

[...]

>>> I was thinking about something like:
>>>
>>> #define QCOM_TMD_DSP	0
>>> #define QCOM_TMD_PA	1
>>
>> Ah ok, it is correct if:
>>
>> tmd-names = "dsp", "pa"
>>
>> Or
>>
>> #define QCOM_TMD_PA	0
>> #define QCOM_TMD_DSP	1
>>
>> tmd-names = "pa", "dsp"
> 
> I was more inclined about having the standard indices for the standard
> mitigations.
> 
> BTW, I checked, which mitigations are being returned by the DSPs. Few
> examples, just to provide some context.
> 
> SC8280XP, X13s:
> 
> TMD service: instance=0x01 (adsp) node=5 port=9
>   1 mitigation device(s):
>     [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x53 (slpi) node=9 port=9
>   1 mitigation device(s):
>     [ 0] cpuv_restriction_cold    max_mitigation_level=1

So, are we converging towards something like:

-- include/dt-bindings/...
/* Common indices for all devices */
#define QCOM_TMD_FOO		0
#define QCOM_TMD_BAR		1

-- qcom_tmd.c
static const char * const mitigation_map[] = {
	[QCOM_TMD_FOO] = "mmw_skin1_dsc",
	[QCOM_TMD_BAR] = "cpuv_restriction_cold",
};

...

static int qcom_tmd_retrieve_avail_mitigations(...) {
	data = qmi_get_data(...);

	while (data.tmd_list++) {
		// mark available on this rproc
	}
}
?

Perhaps split from a global index space to DSP-specific indices
given Dmitry's list that reveals there's a lot of variability?

Konrad
