Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D6366823
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368279; cv=none; b=OmvwgkoZxuM46TyT9OymhRG1osXrBvwNRj4MUHZxp9+jrss60xltHk7L5VjRB2/y2tD/tdDQjJ4ky5gw0gWkhO99tKLBZ7wSEONE2KAkNwKbHeb8BXqPrs7VqLT4JQHs3rmg7ckc5YGE/xYOHX2DJnSQSEq4OU+G7SWlCFf5V0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368279; c=relaxed/simple;
	bh=K02qgo8d1fMESxrOvwX721ppxGuFk5m9mQZgyzySaZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSPedmqp/G0uuQqs6wTeoBpvqEBnOBn+Rdfp2WH1omMrvKn6crNAAbJHncuGjYTr9k2UELlBMDoXW/BrIXijai032OWVQWKUX1B+CyJCt+rbhgVCamxK4yirwEu1Jg/iYq+u1eBaVh7kUI0iyt2Jl+WPMyTpajKGdOLjp4oaQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7sYQKUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7wwG2/P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7sYQKUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7wwG2/P"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4E6gk2112680
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILNdkU/zc5d9HD36Q3aYsILIiYMVQQRjtnKiJ3i/SJo=; b=p7sYQKUBdf1X+ho7
	HxABY69Nkef6k6+GAkXfJmqqTjcOLrmBOSQQFI4Acc24DJhcwtTbqfGIlZKKVb0D
	m9c2VO30FwH31UVD46AXfK9Z/unSGkJNpXGbL8dBhm8Zt8GHiUEVUoivJC4TAIui
	M17OrTRRkNFhF+hPv1PX2jg0JCXpEdFRmTPu8JEUjME5T7Xo8tyg5MIn0WGN30xY
	KiFb9HQ26ldrqIWVhPH5OA1MYB5ZXbGqByjLqvrh8cC6xNBA6EdiMtyt0WuOAJfC
	Tt6bFKXgzVdaI4+8fBZm++NT7LBrARVLesACys8dITNDq/dALI3dmHRhGFxXXH+b
	Ju6+pQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbju15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:24:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb6880430dso262255085a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368276; x=1777973076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILNdkU/zc5d9HD36Q3aYsILIiYMVQQRjtnKiJ3i/SJo=;
        b=M7wwG2/P5qBzdeQ2JFdKkJRHfeHHB/0M+W2Frhzn3Aja0g5NK8H/Ty61nxcQp/Ga9v
         sagQdRfZSr/QCrLuMc1A1/fVSW7146Ua+yUtxsR9OgBFr3fLmrUnKW3SDC9ZGNZ6aVr7
         dx/BPqUIEzgDkGYrjPXO70QPqdLvo5ktwLSaf12C22GkztVZHSdZ383sqfSkyrnQEv6j
         th2g0vR1coKnnV72VBfYY27xTxJFT3Yps+uJTPET6OdhEJkvT2Qd9wyP9pjF4sYNSbyu
         LA+Yy53KKzBm5BBTYcMO075uINX/7eQVGv8LcWjcw81ldr4p96Cfcfij9hSSn5xhDqHZ
         W5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368276; x=1777973076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILNdkU/zc5d9HD36Q3aYsILIiYMVQQRjtnKiJ3i/SJo=;
        b=ZMMPwKGA3gtihKysk54CE1uJXwKEQcL+79BhYrCHGRPBd6hnasXRpT/FeYuhPhF2f4
         1TRUqG/31oiwDphZ3RTRwBMud9QGr9BPqq6dDGL+qBHS8NrkfAP6ndSHgNOg4QAJKzR+
         e7qjRi5An4hxz1sXz/RV71WxZk+i5zNsCpFFpxITHPaQDJBpyBfH65YL0irEDUaF3nP8
         RBIuQQgDgq11BBMZAo3cl7XTux2DifMJqGZwnFI3hUPCV1lFzj02RU5DAeEpCfmcS2k7
         pQ78BNhrk8Jf8pPUmIZeuhRvzTWtLuA7hpmih4v0F6sQ9L+z2p4VELwlQ2o3d1XXhc71
         Wa7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ayGKRe29/EZVqjzGEUCux9js/BR2iV+DowEifBru+uvds8khWpRIfYkalPK/k04DJuqu3Ob5COktT@vger.kernel.org
X-Gm-Message-State: AOJu0YxXGfFFbD0zIeIsqqoeschVPpNppt9NOgWx6uAwnf6PdUmA950z
	MWcqB4P6LF/tMa7puyaMFflFZsXTcRCBJuGvYA5CVw8iYucKwfR2aMSz4H8W1byLSsKs2jMIUk6
	Avg2k5bVzvx2WgjN/Jap2IJ5QHJDnx+iJV1/20IV/hW2jQMLvCh2nVjzzg9c2VSiD
X-Gm-Gg: AeBDiesFy/+EVRLP8m/7Xw/PMLCIIINS/B76tqzyENpDwe/LCrnOzy0+zLhIvFdlIFi
	SyXP7+gRL60DR7eta3BoyUR2luH/QXDflySNoW6UF7ajmBnZY8vqfmMhoBJTIFctQlWOeVGyPnc
	SMqVR6IZUvysuMY9OJjsx5KzyhkYlj83UqI16749R8BIy+uomDkBapfxn4CFMpBxyuMNsyh/djo
	3QLprLKdl4C4EgFBcEa4QqtsqOOjTUsC05ukrqpxPK8FLS54+FKz1MehuAK8l7SCFVhwFzfetDG
	YMijjxArUe/ElHKsZ43gZpjAdWveL8I91es/x9wkTuS/PduwHW2jAIesOXsJ9saJHK5pw6VRiMQ
	avpk+kO138/5S1k11QGWTvntg12RalcEV/fyddm6GclgwKuAs2clFIxXhRgd4aMUNDwIBTaJCwv
	pIri5YpTJCYYMzkw==
X-Received: by 2002:a05:620a:284a:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-8f7b5a9e599mr252556985a.8.1777368276230;
        Tue, 28 Apr 2026 02:24:36 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-8f7b5a9e599mr252555285a.8.1777368275737;
        Tue, 28 Apr 2026 02:24:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b685f5a9sm504990a12.26.2026.04.28.02.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:24:34 -0700 (PDT)
Message-ID: <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:24:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
 <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ve6gz6i6zfMrUBqystLjKYV_b97_sFuZ
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f07cd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HraIJQmpyVBdKkQOmRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ve6gz6i6zfMrUBqystLjKYV_b97_sFuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX/YrtFOscFsds
 XIt/QNRCIZaOVUzqfdHOwC/jmCOU68rkI7Nt5gIyOfzy7I20Qv2lt0MA+OPmcE4jA8JW+zsZ9h1
 OoQUYGWW/lGnLQD9gxNPGUaMkXDitHAV9l1AJ7WRV8/kmvuy+iXmrGe/xvJtD6DkcEMBl34i6n+
 n6ZoZACSQIxHQP7UBzD3sETUEMELw9c+Fosq0U6rfIp/4zaHOy0XfPLaeggS36baD5ivJpkDEfh
 F6MnQ3GwQID4Ldp0BU8Crz6a9C93VqVRO9MKyOApEmBiYvwnO7nRs3EY8KsV2rEDkH88cmrpwVI
 eSwL0cvq0mIOtMJjwvZQahY0NPeB+5MIHCGNdOD1dt5pQdL0JgvDiuBXzz5lz20Enq2tCpEL9+q
 5LcZhAOR7yTFvjkSqJl/0gxxvI0FR+kJzYp2gwTJs0w/CNYeahR00TjvE9hNYT1Fj6AQPkkoIZv
 Jpxs+0gmIQIGP6ihwrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082

On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
> On Wed, Apr 22, 2026 at 3:55 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>
>> On 26-04-22 12:09:31, Konrad Dybcio wrote:
>>> On 4/22/26 11:41 AM, Abel Vesa wrote:
>>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
>>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
>>>>>> Describe the ADSP remoteproc node along with its dependencies, including
>>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
>>>>>>
>>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
>>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
>>>>>>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +         usb_hsphy: phy@88e3000 {
>>>>>> +                 compatible = "qcom,eliza-snps-eusb2-phy",
>>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
>>>>>> +                 reg = <0x0 0x088e3000 0x0 0x154>;
>>>>>> +                 #phy-cells = <0>;
>>>>>> +
>>>>>> +                 clocks = <&rpmhcc RPMH_CXO_CLK>;
>>>>>
>>>>> This is TCSR_USB2_CLKREF_EN
>>>>
>>>> Good point. Will fix.
>>>>
>>>>>
>>>>>
>>>>>> +         usb: usb@a600000 {
>>>>>> +                 compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
>>>>>
>>>>> Does the device suspend and resume successfully?
>>>>
>>>> Well, tested with pm_test devices and it does suspend and resume
>>>> successfully, but there is this:
>>>>
>>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
>>>>
>>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
>>>> all platforms that have them.
>>>
>>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
>>> some DWC quirk in the list, although it seems pretty long already. Perhaps
>>> Wesley would know more.
>>
>> + Wesley
>>
> 
> As per HPG and downstream, this is what needs to be done while entering suspend:
> 
> 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
> 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
> 3. Set the following bits in the pwr_evnt_irq_stat_reg:
>  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY

In case that's related, most platforms (including this one), set
snps,dis_enblslpm_quirk which prevents the first bit from being set

Likewise, snps,dis_u2_susphy_quirk for the second one

(although it looks like setting these bits is currently
unconditional upon suspend in HOST mode?)


As for the sequence you mentioned, I believe the diff below should be
OK - although it _really_ just adds some delay vs the current state,
since the bits are cleared in the resume call

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..e7b1775b7207 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
+#include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
@@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
                return 0;
 
        for (i = 0; i < qcom->num_ports; i++) {
-               val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
+               /* Wait for the PHYs to go into L2 */
+               ret = readl_poll_timeout(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i],
+                                        val, val & PWR_EVNT_LPM_IN_L2_MASK,
+                                        10, 3 * USEC_PER_MSEC);
+
+               if (ret == -ETIMEDOUT)
                        dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
        }
+
+       /* Clear L2 event bit */
+       writel(PWR_EVNT_LPM_IN_L2_MASK, qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
+
        clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
        ret = dwc3_qcom_interconnect_disable(qcom);
@@ -752,6 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
        bool wakeup = device_may_wakeup(dev);
        int ret;
 
+       /* Clear previous L2 events */
+       for (int i = 0; i < qcom->num_ports; i++) {
+               writel(PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK,
+                      qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
+       }
+
        ret = dwc3_pm_suspend(&qcom->dwc);
        if (ret)
                return ret;


Konrad
