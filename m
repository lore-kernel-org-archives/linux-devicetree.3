Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED43FC5AF
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724907; cv=none; b=tt0pD9wioRcR5dZ8C/yn4GC0/Wo9SU0EGAWhjioD3A28AJPHQcRTdYKUx1biw8cce40UAqJlxDVUxH6IoSTBsi/WwHghhBTCVZIDMrxoj+AufBCukSemCHgmcDlKyQfoQ7OnUrUL9ywsTaQbfVKP8HkSuIN3dj0WKiwasIa1Xr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724907; c=relaxed/simple;
	bh=tEXdytwln3SqyuvYYX3Y04VgOf7AzAU5hyB3sLNR4xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suEM1fV0TPR2DnTh/oxas8vXtr0bMB9LgEx0Qk/mewFqn8YkvMQliFxFPlQ5kn2WcRkt9cNra6PK8EVbGIMJSAd+wvJUQydaesThivq8KV/XpFcXuNewFc0EF53zWcxStfkqQ8YMaZB+BKKYCqpmSfQEwv3C5VdZRNoYe8vsI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gILl2WvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABk99JrD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gILl2WvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABk99JrD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OO5w2349158
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLDCIDvWiMtamq06GaZ8B9EiMhANn7gwMnT2WeVy/c0=; b=gILl2WvUe8GeJrsC
	6MbaDGsDZo7RyhRKQ18LjtvKhGl+0pocnpbs2QpXcs1rq0ndE99Vl3q6U9VB23/2
	9k/gnSjLUfQV56jKVjgaRfoxsBI7bb5xU/npa8h64nlVbOKKG/1GUac8MwWfRQvk
	zPZmvblblXeVxDzg4hXOrrRByR0B0Dc/pkMhwgSzvAsEOSSLadlx7LdzovYurWSk
	HiwXpOYpD2+2NgUKJSp1SayzhAHC79qpIQ0gyk9gS4DI8wHovRwMUkVLJWMmsarN
	d9o/+o1WE8LDTSSAZySbJIJIw+5+VraEf9kfV1al97eojCmTY6BdngId4AjkcIin
	g8GmKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s08rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:21:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf599c27cso391211cf.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724904; x=1783329704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLDCIDvWiMtamq06GaZ8B9EiMhANn7gwMnT2WeVy/c0=;
        b=ABk99JrD663eQDlnoKUzAE2jNio47xOlZhCmD7L+oHrOdzk36T4Xupn7fmpMlXu5Yj
         GEBxsU5vuLriUOLLq22QAmuhKs5FYk9n+h2pBmSUsnx+CcMeLTsFxlgb2fRh6wmS4Fxy
         1tMjPhDGeehDgxZwzSH9v/RxIOVzXYriSkZFg491PYEfp6T/zkt1ymTjDUqrcwD4nQr0
         5uSKvw5io4G6chptsluvQF7dUWkHZe/W9CUe869IrDamlTkhvwPKYuou7HL74luYSBQK
         05DDdZOfIG0JoyF8sCi8V9KWagcnGMB7G2jfdXc1cGwUmvUUj3t/ZAOI3aZ6q2FFgTiy
         E8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724904; x=1783329704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLDCIDvWiMtamq06GaZ8B9EiMhANn7gwMnT2WeVy/c0=;
        b=UIz57Zxo80pzzTm+QRDZOiTPTl0D7kMWXgUf1ruiu2a21PiN/wrf8uD7d8OCmpzWbl
         WIQonG+LYze6mztefuKPPeQ+GtKyq7X0aIrdXTIXfyDhMWa0fPRRgUfql6+VOrayersI
         C6BNU/8R1sUuo66g7tAihkSsxMKRloY8cl508RHFhgEWgmZJN480fO3GobdsYUaLCsb9
         6fey8cvQxZ+CqU5ZX/aH1vBAcaWaFMF510XzbZUZpNWm7XxWGZPu/IV+ZX7eaTUzjQ34
         6s3wnOJPsDXReSiHTmGtMH6EPzgzGKYjb9MzyW3ZkduLr9+VHMISlY2oe1zWziYNXKbv
         nkng==
X-Forwarded-Encrypted: i=1; AFNElJ8tgQ76y4w99XycsjYeUjQAslM6zNDBBekIy2++DQBGBRg1pITSE7irjy/d73oklCrPdyyVbFwKyI5s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01DbLCmuGYZt00Z/NSi+V85UJgf10QCIrPUTPCSUgg2Th/9fg
	8ZkxxnNEjiGsp/I+db8M5VHskSkG/2H5rXJ6Xz5cxAfsY0LBzKPaezBDD0zbQ1KO8tGw9x/Ckfd
	aPx8nH1u5ARGNVE7HtWBnfqRcfoLcT9DxSlaznQd0PPBkFCTm+8WY+FGAIHi+LV/I
X-Gm-Gg: AfdE7cn5/IWHSZebGNzOKbcsQTGyzc7cRGpBF3LGylQpCOGVzMNlAFoIqnGQg4jLIvd
	vIFkdKthPYJEs6+ufWy5+//6ejYuPMqeFzU3Wdf0j/+e0aObusbKwoNH4M0oHYpej1SLlFdEbtv
	LPUu9Z1m0jcSHBTjwT529NNLZPHiUPLZETOuJ7cCzdh6+WRx66veka33dVsRLKgVuVrFjK1bjO1
	gqHIle5JleUvXHuPr3DbSthX/Z3TgdlumeoAngKflc2fAj8iZI8uV52iN22hotGEi/j8T1DCMRh
	+RG8ffT2a1wCHVu9D58KJX7zmXpp7uDvj/BEYG3oMDCa6PmsX/+P2Wm0IgpQXzwFDb1ko3+Hk3q
	HACrgP4pdd8/kMsasc3qa5zhEyzM8eeWW1LQ=
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr155230951cf.6.1782724904301;
        Mon, 29 Jun 2026 02:21:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr155230661cf.6.1782724903818;
        Mon, 29 Jun 2026 02:21:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c127b7619afsm29219266b.4.2026.06.29.02.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:21:43 -0700 (PDT)
Message-ID: <8fbbe66a-839e-4099-991c-f5b2868f03bf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:21:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
 <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
 <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
 <akII/X8OWO5XN9Gw@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akII/X8OWO5XN9Gw@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5lr5KFJVqbgo
 LDW97T8ZXlTM3S5KHQONYJKvtgNF50p18E/Sz5mLPC6Z2UA5cSY53M4UWuzFaa+9oixzWGCVNyG
 j3B6pyrgJXYj0tDS2BOn5zIwLe/k0Y8=
X-Proofpoint-ORIG-GUID: J7nJfQmsW77xNPZdKIe9G6DGioajJceM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5ltC5YTsEZdw
 spGneXY/RekGDzrNQp4GJo2grvoF+9tLMZsjBE8ioVzu9FJk8952MuO2zvgipCXD40wduhIuK89
 oK/RDBIvPSR3SMG2JzP7+HQSRrgu/ziqSDXAu7JAWjaFBp1W5CBIAV8DQL3io3IKQ3c/fVMOGxv
 1bVIoVV2OHMLqoWUOZojYNSvrlYGi6xbzSfY8s+8nADqWWZrIgIRX7TB1eOoZCvp0CBKtbWIMBn
 xAhHdRzzhC+jVDjw+O6LiOAhf7yv3GFReAGQcBzDh5t2Pt/9IVJVyj3tagjWU9b5pstLNicYhPc
 B+mR+EW4TcoLKCFrH4aNmAhNMA28+2ppAiNvYOKPnSR7XtvgYXLSH2dX2RXExqOJHmAGFyuWtHJ
 ReNxU/OFV+O1t1g790QdtNc2iKLhtFAhVzse6vP0dJwZDVlzNuQylYOPekW6de7T4Ktg7x3b/7i
 5ZvmeHlDdHmC7i5tMqw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423929 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OXfuQhhJyhkMGnq2POkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: J7nJfQmsW77xNPZdKIe9G6DGioajJceM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074

On 6/29/26 7:56 AM, Qiang Yu wrote:
> On Tue, Jun 16, 2026 at 04:05:43PM +0200, Konrad Dybcio wrote:
>> On 5/29/26 9:02 AM, Qiang Yu wrote:
>>> On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
>>>> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
>>>>> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
>>>>>>> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
>>>>>>> under a single DT node, each requiring its own pipe clock registration and
>>>>>>> DT resource mapping. The current helpers are tightly coupled to a single
>>>>>>> qmp_pcie instance, which prevents reuse across sub-PHY instances.
>>>>>>>
>>>>>>> Refactor __phy_pipe_clk_register() as a generic helper and reduce
>>>>>>> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
>>>>>>> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
>>>>>>> mapping and pipe-clock setup that will be shared between sub-PHY instances,
>>>>>>> with pipe clock names parameterised per instance.
>>>>>>>
>>>>>>> This is a preparatory step before adding multi-PHY support. No functional
>>>>>>> change for existing platforms.
>>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
>>>>>>>  1 file changed, 44 insertions(+), 32 deletions(-)
>>>>>>
>>>>>> I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
>>>>>> end up having too many single-platform, single-device specifics which
>>>>>> don't apply to other platforms.
>>>>>>
>>>>>
>>>>> I don't think that's really needed. This shared PHY concept is going to be
>>>>> applicable to upcoming SoCs as well. And moreover, the split won't be clean
>>>>> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
>>>>> driver and may only end up keeping very minimal code in
>>>>> 'phy-qcom-qmp-pcie-glymur'.
>>>>
>>>> Then splitting makes even more sense. Let's not clutter the existing
>>>> driver with too many conditions and options.
>>>>
>>>>>
>>>>> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
>>>>> move the SoC specific 'cfg' structs into a separate file as that's what
>>>>> occupying majority of the space.
>>>>
>>>> No, it's really the 'shared' part.
>>>>
>>>
>>> To confirm, are you okay with some code duplication between the new
>>> Glymur-specific driver and phy-qcom-qmp-pcie driver.
>>
>> That's a necessity, to some degree. See e.g. qmp-combo and qmp-usbc 
>>
> I've already prototyped a separate Glymur driver, and it turned out better
> than expected — there's actually not much duplication. The parts that do
> overlap aren't fully identical either; they tend to diverge once the
> Glymur-specific handling is factored in.
> 
> Currently, I meet an issue when tesing the patch, and will post it after
> fixing the issue.

Good, thank you!

Konrad
