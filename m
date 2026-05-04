Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723D38E5DF
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889226; cv=none; b=uJGOqYmk7sqMMd4SxEviM+ZbNz9uSDqbwLmaG3DBRflL/BfEpZh/cF6sXDotTig4VFvMYFSToZLg772gyxQvZifbdrWX4LhgzCBTMMyGlUjdbrkMOYoQdhoQCUdrA3oM+QfpEycFP4rFAoY4xs1WrsvBK483q2L3KMrTV7cYOK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889226; c=relaxed/simple;
	bh=m4u5RP8z/VNBBI2aGqp4lSMkp4CmLcfjlrmCx0dJb0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfRGq8bWc9g6c8fZ7CUMkZ5DcL/L6j2eO3rC85iWjYis4un4j0PJURQL2piiMQgN6pEvpUU7fw4WonaLbbjo8of+i1ncQRlRRRhhuxlLQrThJSl3SeWjqZxicWKf8P6AWi1cOZpXctGI2dNAnqdwZ9J3JfxWEOUL1QkF+jUQHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luhOo5YJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQQ8x7Wj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luhOo5YJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQQ8x7Wj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fMVD327100
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SS/LRHdKuv5gOfX9bsctMLkVp60IIsb493O2lALLVVg=; b=luhOo5YJ4O51VOdY
	ZtpBENMFp6UDsHRNrT+7CmnoVkQw8SSBANvek+/tpx3AzvumEQ2VwMd4zhHf/igl
	2IJEMscL9K7MOLA1n+3q5ypZBShQGUNIRKGa0kO/7UqFTdhFuYNTjyWVFgvL7r1+
	gSpmhYgUYuU8Y9CuAulEhHzjoVZQUeLmznwzj1T9ItHt/qn3x3VtBv4VnX22z1/V
	SxW2vVYQDUCCB/jUa1Iw4HkPZeCxkpU5BF0jQmxP8PXhBA1zC/Hmq1FEnGU2gQWi
	dRKwbg7C8cMCsrIG8swy12R8H2qE6Z84nkDSAbjkmxVX8AEMOa1p1oDUOZhSrBWf
	m1IpKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8d4q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:07:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso91116801cf.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889220; x=1778494020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SS/LRHdKuv5gOfX9bsctMLkVp60IIsb493O2lALLVVg=;
        b=EQQ8x7WjmdbvZXBABDi4qOMeBNi3FIy7T3tKTJOIMa4SoXwPI5sJ/KUuNt+YZgfHQ1
         ZCJtFO1MTbSyNNr/PqAbe0gx8c35uRCcgQUb4aG7L+sJSwPV2XOhkv/DPjz3KZpSnRhi
         ucXTUfs69c9X6TJhE61yNV7LLGmbMpqoLE+zGibPNdTQ0uulirKSB1+96rYEZ3mpM/D7
         B//s2Hq+Kttf21g0MWhY5G/hBUHaAP8PSnQGiOB11NylWLWYGzVpApzhnsJdWLeXHLxS
         rbolkMtUNnkNrFK53rzYbQEmEd1VYaAQAdElv9IT9gXAWoBYW1pdEzwNQwv+oTaIlmzt
         eFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889220; x=1778494020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS/LRHdKuv5gOfX9bsctMLkVp60IIsb493O2lALLVVg=;
        b=g+LBU9axWYtM9hvx04ZlMEydsG3L58dQCNbESbMTZ0qfEAIW54MTUZ3SxPWd9cehNo
         cHeMDiChVr3lpsW4tgefg2xmpBi3a6mILrKqWh93hVKndNrbu2/zfhuRp3/6JGBmbS8q
         DpNWaayteZ9WLu5dwv1XoLsxeZS+t2FDsFT2Eh90goNRd4iGQVZyzwyQy0OiS9C2JXJx
         mNLZTM9fF9clBcsWi3KEBBsy9icQb0f1H2wX1EqDyhmzh+fM2mgyAdqGJ1BBUoIKOexg
         BmTCoeIrP4wd1X7a6aIkSwI+dEqvJZq2TlPoJlwB0cjd6wHcX6Vgo10nem9wKZt9jxpg
         mYFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MCSzdGCRlwSCEcHMCzuwZ+Sv7eIRY2lMlHEYOvjqG5FuPQEIq3XzdRe5XGaxGTqgigzYf4r44l5xd@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRbc4aotjdIdTbaACMk6NR9o5F7cZikfanAolLVR+OijMKD27
	03AACsZTSgTbj0K4elCY01e+W4woa7JJKTkqscyHRNfsBktZnMBTZ/sfC+EJ+nSUxzmkLeWbQwQ
	aqCCDZqyeY3gTbNQuWuelFKOyBjabPN5WcQF4oDCW+L/mqIfofp3567s8JFuf/gL5
X-Gm-Gg: AeBDietokdRiZXf1vpbaA+MCLD3cigAVqUuecHOu6LK8toFd5eXiV7iGnhKZlOtxsoR
	aYyo8JCkVsi/XuxyNNWBUNlhXkJtjklW1XOCSLe6tMV3NVkTmnCS6pkEXkFLEB6RAG+qhYPwD3b
	SmPFgoYAjvR11rOFFrxRonYDGcriL/LLbFBCbxytaYoAgke4ScKL2Q5/ssphr5oOlBpUjnFil9d
	swBOUtTAxZIS6eA69BOF6W2zs9x3BfJNMgcwTjoH1jW9iQnV8KZ1G/ZBMf+f0ImX/zO1GvQe7bb
	pWfd1Z7PfZwaP6+86x9k8maEFA3jE3aRcex+9AWYRmxEOE7uRBhbWZKQL0IxWyWnovVzLlXrGHy
	JDlm4GWderDvZYYxpVswzqiJwN+qEOOocmo8H0daMFqUD+g0=
X-Received: by 2002:a05:622a:1791:b0:50f:bb01:985e with SMTP id d75a77b69052e-5104bf5260fmr123922201cf.48.1777889220086;
        Mon, 04 May 2026 03:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:50f:bb01:985e with SMTP id d75a77b69052e-5104bf5260fmr123921701cf.48.1777889219509;
        Mon, 04 May 2026 03:06:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm559626795e9.2.2026.05.04.03.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:06:58 -0700 (PDT)
Date: Mon, 4 May 2026 13:06:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Message-ID: <duuley53qaykn3m7nb3k7mfnwsmdzfq6qs6zkek4iyymil55dp@azjudm4quspv>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
 <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
 <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
 <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
 <3886cbd8-be29-4aa4-8331-f5b9a2e2497e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3886cbd8-be29-4aa4-8331-f5b9a2e2497e@oss.qualcomm.com>
X-Proofpoint-GUID: etLbW2hrgxaJ6cDj3q3ua_eMIx68yCeU
X-Proofpoint-ORIG-GUID: etLbW2hrgxaJ6cDj3q3ua_eMIx68yCeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNyBTYWx0ZWRfX9EKP7LIPGTLG
 yhYdl/NFYFOl/gxzK5kRAnbJZA6OcqN9vJhA4XOGwuyUznqROVRLPHDPUBWh7+IPiSt2ybYUY4H
 pXq3n3hYuaeYNCt09ECCFr5UGOegt6kKg9bx+F/pVCamMZSvLxVpc3opyXnjulk2dbgYiSlKlM4
 xoZ32pDSAIecuOsM5nxPV4nDJKPZnRJ2mpVTSxmYzBPRbS3LYp8b8ttlaZwQbPmAnrRux2ZvctE
 xUFqqefgV3qwLSy8efu7hKp49aehJrdT68I/H7ZocGDFD3V7t3j3y8FVY8P27TxEBzDdzITVYu2
 E2ewfAKpo7L0yb1nlJNdPvOo7Atcr8tpLs06QHgnRG1/YadIVrYAlXy3oYkB0Zhd4MSm6RB8Sls
 rmp+0Q3M1XtnTBO23PhS89DW7Lu8DlGPBaWACLjvBvpF84wRJGl60SjM/HM06uEQH6YCBh5IqoY
 xp8bc6qiYa0BX+Z6MLQ==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f86fc4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cvdK-d9LoktiBtjlPlsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040107

On 26-04-29 11:45:10, Konrad Dybcio wrote:
> On 4/29/26 3:57 AM, Krishna Kurapati PSSNV wrote:
> > On Tue, Apr 28, 2026 at 2:54 PM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
> >>> On Wed, Apr 22, 2026 at 3:55 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 26-04-22 12:09:31, Konrad Dybcio wrote:
> >>>>> On 4/22/26 11:41 AM, Abel Vesa wrote:
> >>>>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
> >>>>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
> >>>>>>>> Describe the ADSP remoteproc node along with its dependencies, including
> >>>>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> >>>>>>>>
> >>>>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> >>>>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>
> >>>>>>> [...]
> >>>>>>>
> >>>>>>>> +         usb_hsphy: phy@88e3000 {
> >>>>>>>> +                 compatible = "qcom,eliza-snps-eusb2-phy",
> >>>>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
> >>>>>>>> +                 reg = <0x0 0x088e3000 0x0 0x154>;
> >>>>>>>> +                 #phy-cells = <0>;
> >>>>>>>> +
> >>>>>>>> +                 clocks = <&rpmhcc RPMH_CXO_CLK>;
> >>>>>>>
> >>>>>>> This is TCSR_USB2_CLKREF_EN
> >>>>>>
> >>>>>> Good point. Will fix.
> >>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>> +         usb: usb@a600000 {
> >>>>>>>> +                 compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
> >>>>>>>
> >>>>>>> Does the device suspend and resume successfully?
> >>>>>>
> >>>>>> Well, tested with pm_test devices and it does suspend and resume
> >>>>>> successfully, but there is this:
> >>>>>>
> >>>>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> >>>>>>
> >>>>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
> >>>>>> all platforms that have them.
> >>>>>
> >>>>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
> >>>>> some DWC quirk in the list, although it seems pretty long already. Perhaps
> >>>>> Wesley would know more.
> >>>>
> >>>> + Wesley
> >>>>
> >>>
> >>> As per HPG and downstream, this is what needs to be done while entering suspend:
> >>>
> >>> 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
> >>> 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
> >>> 3. Set the following bits in the pwr_evnt_irq_stat_reg:
> >>>  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
> >>
> >> In case that's related, most platforms (including this one), set
> >> snps,dis_enblslpm_quirk which prevents the first bit from being set
> >>
> >> Likewise, snps,dis_u2_susphy_quirk for the second one
> >>
> >> (although it looks like setting these bits is currently
> >> unconditional upon suspend in HOST mode?)
> >>
> >>
> >> As for the sequence you mentioned, I believe the diff below should be
> >> OK - although it _really_ just adds some delay vs the current state,
> >> since the bits are cleared in the resume call
> >>
> >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> >> index f43f73ac36ff..e7b1775b7207 100644
> >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >> @@ -12,6 +12,7 @@
> >>  #include <linux/module.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/interconnect.h>
> >> +#include <linux/iopoll.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/phy/phy.h>
> >>  #include <linux/usb/of.h>
> >> @@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> >>                 return 0;
> >>
> >>         for (i = 0; i < qcom->num_ports; i++) {
> >> -               val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> >> -               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
> >> +               /* Wait for the PHYs to go into L2 */
> >> +               ret = readl_poll_timeout(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i],
> >> +                                        val, val & PWR_EVNT_LPM_IN_L2_MASK,
> >> +                                        10, 3 * USEC_PER_MSEC);
> >> +
> >> +               if (ret == -ETIMEDOUT)
> >>                         dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
> >>         }
> >> +
> > 
> > 
> > I think its best to set the DWC3_GUSB2PHYCFG_ENBLSLPM and
> > DWC3_GUSB2PHYCFG_SUSPHY here as well based on quirks before polling
> > for the irq_stat register.
> 
> Hm, it seems like the dwc3 core layer only does so in the suspend
> path if dr_mode = "host"?

OK, so I guess the quirk list is complete then, right ?

Lets unblock this.
