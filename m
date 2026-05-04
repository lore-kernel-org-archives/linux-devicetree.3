Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CE3A3E80
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890649; cv=none; b=GT5/fvz+LTOaqMB5d73YEfBrTiuniUaeK7lekRkofVrqyw56DzsVtVpaQxr7wr+rB1EjzntxXeBf6kuoz9Dld+R4nfSHYCesZYYHqF3fh/d7CYX9oM7yJAN/a80V+rlBeVa44e1lda/o/2saoGiBeix2rKPFqeAcprB8SJFme/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890649; c=relaxed/simple;
	bh=GsIA1tBOaYjSRQPiH7D58fVd4oz0IuPjT//erx8zcvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMhgi+wsUN26u63xV+39E4iit2ELwLAlAK0IANGHCZ06GhPbTuG86B5NoumxB2XdQ8dbEanXrbNWvk54IBc91Mg0pgZQnwYIixecOtlANoPxMLmaxH3mhmzYi/SYK/Ky832YOiG0kRdXgAstgjkZY+SZUpl9+HmJULQbJggiO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHC3EA8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kg3ioTBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHC3EA8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kg3ioTBT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fSm02539184
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7JbsYUpWbTn5m/nngg/89OFXbjoJ0rgw5VVZpJ379s=; b=nHC3EA8zvyO6Fi6t
	iAwlenewnghQdAD012xcKnhaO83nWj+9O6Q8CqH6y9wST+KC7uJmjO/wHGkBP2iu
	QfBQ97Ekf72DRWXqbeZzjhqAzozJhz2vWUl6jVESOniCZSbdzZ6CaGEi8FWFoRL+
	mzZYahZC8smi0p/xX6HS4moeWyT/ZpJhCsVdxmKNYq7EaVLzgjp7pMdUmzA12iSt
	1i4Qpr07oNrZigG3wYTDP8aSy/YaAqp1YxrconTxGRsW97nuNrIhflFnFxSXQtMl
	gNq/KNxB1L51EEG04RmdS3H8UH2gZknQov4eEADjgjEdH9aUjeMaUSjHrB2WsZll
	/0mODA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1b4vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:30:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50df4c130dbso115709641cf.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777890646; x=1778495446; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W7JbsYUpWbTn5m/nngg/89OFXbjoJ0rgw5VVZpJ379s=;
        b=kg3ioTBTfX/1DavoG4EwXRYV9niAREgEJb+LQzMHTk671tNNexq2/I+jajAg/7gU4r
         t5hz7Q+yko6y8La1DFzOiqniu2tYrtQQCJAhJfYtktcKTQLvrP30019iLDiR2pUJRosa
         9FmTQBFmBH9WbfSN52cwBNvgiur9khIKeJMMzov5PTEuO4Velvkj4Q6m+f7HASIevrZu
         14Yi4pjLI646ipW48XBNzW79mKJ5Qjc6H2mQWDv1XfNoYm6vwPODdqnbObXwRa+++ZGE
         qWQFZZr+MCq4K93LOYIIeTwMHAYIIM43R0j1HauyWHgmzPmIcryEFZZG9h34N7wGb3sL
         mpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890646; x=1778495446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7JbsYUpWbTn5m/nngg/89OFXbjoJ0rgw5VVZpJ379s=;
        b=WYEL/BfU95rG2VKDD3EneoFo4+S1snSlbKZ7dXjY5ldc8x+3zIDPSw3RqLCugYUHuc
         oeeNB1HAQhnnhiOisVY3qbnhdyVI2P0BN6n4cJJ7HKkH6IijTxjLnwy7iqS6+lGTNgxO
         WJk6IQWv6ysUx53WDkytW/t+q7TN7To+JKrcSM/Hrpzoi73MvAl08472kAOt223q8a3K
         zt1fu+Kq+dTpCC5hJEJnbIe5ftKgxr56DRIyvV6DQUJCRdWW6XzJvtcRXi52pUvBMPRW
         YCezWXq3gYsjgVY/4fzxUGPn3q+mAE6hTmtfq35OGIVpH8Cdj4duFWGTyo+2abdAyDMZ
         HP/g==
X-Forwarded-Encrypted: i=1; AFNElJ+wWb6KmoSIHb0HzU/HxMRsZfq3Byy05S7d0Eqh/iOQpDp4YAdraymx8WpxL0L5GsqbxY7l0UBSrQqb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9+gpUBSTxH7jOU8D6IEXLkXLPRauwCO2NEkP2wTwMwc4cgzPn
	V8Ee/tqoCpRIZjaJ3wVYl//nTBw3BOD3U9Y1knyjWetjgmkXzA8l08HcT2QrV6FHonHBw3okqGO
	iAfeJ1dP03ICmAPnhjtRX2HFrr95hW+4/1lHeN4G2poCmuYpWBi3BCct5Co10CHna
X-Gm-Gg: AeBDiesOX+aiFCFo5p1Wb/iK3szhI5qwo2+Xb9HsoWKDqzU9FuPH/PKWGKXvPhQScTQ
	INsnTNNFlLOKfDjY2+bT8EE17qcDiBvSkHNIVTvwZOqDjkqPMwYvmJMw4S/xB9+FLLK3WUiHOHr
	3nSZPGmdMAY2jIa8vdKFOTI2Nau4Iq8gvlBME5Un07mo9Xhf1MX1YTyjnCPh0Hh0PLEolOlBMaW
	PGzPUQB3SmiThyC/3aWJQO8Q1N5/m5zdp80n1S8Tzo0WNplpUdgGYEMysIgJ+SfbKBVEieoFqfL
	S4v0m2B6zgZHUhkxVEy9302UM2UQzPB0IjVhHQWzvVQANCYTmD19y1fTXtVwR/C1lEQL4dH4okN
	rMrercMbPdCioJJ4kNPzh9mxY/z+at2ABKdeJD4yTteg1CX8=
X-Received: by 2002:a05:622a:8c09:b0:50d:9c1b:941f with SMTP id d75a77b69052e-5102d099d89mr187573791cf.8.1777890646307;
        Mon, 04 May 2026 03:30:46 -0700 (PDT)
X-Received: by 2002:a05:622a:8c09:b0:50d:9c1b:941f with SMTP id d75a77b69052e-5102d099d89mr187573061cf.8.1777890645532;
        Mon, 04 May 2026 03:30:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822be902sm344136275e9.6.2026.05.04.03.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:30:44 -0700 (PDT)
Date: Mon, 4 May 2026 13:30:42 +0300
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
Message-ID: <hhw7xdtqxx2lywi57wod6kir5e2jg47whcfqozxfrp4mziab6l@qwk5w7qg24we>
References: <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
 <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
 <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
 <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
 <3886cbd8-be29-4aa4-8331-f5b9a2e2497e@oss.qualcomm.com>
 <duuley53qaykn3m7nb3k7mfnwsmdzfq6qs6zkek4iyymil55dp@azjudm4quspv>
 <364faec0-7d71-49e6-b214-ac59785bb25c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <364faec0-7d71-49e6-b214-ac59785bb25c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfX/eXhWDPiJhXT
 mx7uVS4vBmgCbBrGzSaLGFIqv33kQWHisg1b0aa2jGaHykOJiA0IayHJQa5Vgy6CGzVZApVdeoc
 9KWt6ZkNrDqjAHoOMs/8kw5J0P4E/ZOimRp1E9n+SE8WaFCABjZu41dLzJ9GDNm5OkISi3oJmL3
 DQ1g0z/zpQCVy42H1aYJNCgnPaVatBsOPVOPKy6mHzk82ej5tpCTzCYGLFv7Qt9ezAIK8By/V6d
 wSZy1/6+QoIIIP9aqXjWJYZx7DIe0ZSaQA0L4FHpi27A8J1uFy7QTI4kvyVIKN8rK5Q37XvJ1Eo
 QCfx+Li335tzX4aIrl0Jo0Qzs0B4QueGHk6F7SkI7cH4S6SuPB+PaHMOpyCvhabOG42AEVaFQLF
 pN84hIV90fpHkanL7yFK6ogYUjF+S+qc6vfQxwZS3btDDjBldD508FDUv74mM7O+eOqPHdL/rtC
 00rid79meoNDjtjOhGg==
X-Proofpoint-GUID: HUbCFQo_OhNRPIvn4Mkwl_FqZ9zrV6Dq
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f87557 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VGrQ4E7dmVZjdPGQD-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: HUbCFQo_OhNRPIvn4Mkwl_FqZ9zrV6Dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112

On 26-05-04 12:25:36, Konrad Dybcio wrote:
> On 5/4/26 12:06 PM, Abel Vesa wrote:
> > On 26-04-29 11:45:10, Konrad Dybcio wrote:
> >> On 4/29/26 3:57 AM, Krishna Kurapati PSSNV wrote:
> >>> On Tue, Apr 28, 2026 at 2:54 PM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
> >>>>> On Wed, Apr 22, 2026 at 3:55 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> On 26-04-22 12:09:31, Konrad Dybcio wrote:
> >>>>>>> On 4/22/26 11:41 AM, Abel Vesa wrote:
> >>>>>>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
> >>>>>>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
> >>>>>>>>>> Describe the ADSP remoteproc node along with its dependencies, including
> >>>>>>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> >>>>>>>>>>
> >>>>>>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> >>>>>>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>>>>>> ---
> >>>>>>>>>
> >>>>>>>>> [...]
> >>>>>>>>>
> >>>>>>>>>> +         usb_hsphy: phy@88e3000 {
> >>>>>>>>>> +                 compatible = "qcom,eliza-snps-eusb2-phy",
> >>>>>>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
> >>>>>>>>>> +                 reg = <0x0 0x088e3000 0x0 0x154>;
> >>>>>>>>>> +                 #phy-cells = <0>;
> >>>>>>>>>> +
> >>>>>>>>>> +                 clocks = <&rpmhcc RPMH_CXO_CLK>;
> >>>>>>>>>
> >>>>>>>>> This is TCSR_USB2_CLKREF_EN
> >>>>>>>>
> >>>>>>>> Good point. Will fix.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> +         usb: usb@a600000 {
> >>>>>>>>>> +                 compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
> >>>>>>>>>
> >>>>>>>>> Does the device suspend and resume successfully?
> >>>>>>>>
> >>>>>>>> Well, tested with pm_test devices and it does suspend and resume
> >>>>>>>> successfully, but there is this:
> >>>>>>>>
> >>>>>>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> >>>>>>>>
> >>>>>>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
> >>>>>>>> all platforms that have them.
> >>>>>>>
> >>>>>>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
> >>>>>>> some DWC quirk in the list, although it seems pretty long already. Perhaps
> >>>>>>> Wesley would know more.
> >>>>>>
> >>>>>> + Wesley
> >>>>>>
> >>>>>
> >>>>> As per HPG and downstream, this is what needs to be done while entering suspend:
> >>>>>
> >>>>> 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
> >>>>> 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
> >>>>> 3. Set the following bits in the pwr_evnt_irq_stat_reg:
> >>>>>  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
> >>>>
> >>>> In case that's related, most platforms (including this one), set
> >>>> snps,dis_enblslpm_quirk which prevents the first bit from being set
> >>>>
> >>>> Likewise, snps,dis_u2_susphy_quirk for the second one
> >>>>
> >>>> (although it looks like setting these bits is currently
> >>>> unconditional upon suspend in HOST mode?)
> >>>>
> >>>>
> >>>> As for the sequence you mentioned, I believe the diff below should be
> >>>> OK - although it _really_ just adds some delay vs the current state,
> >>>> since the bits are cleared in the resume call
> >>>>
> >>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> >>>> index f43f73ac36ff..e7b1775b7207 100644
> >>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
> >>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >>>> @@ -12,6 +12,7 @@
> >>>>  #include <linux/module.h>
> >>>>  #include <linux/kernel.h>
> >>>>  #include <linux/interconnect.h>
> >>>> +#include <linux/iopoll.h>
> >>>>  #include <linux/platform_device.h>
> >>>>  #include <linux/phy/phy.h>
> >>>>  #include <linux/usb/of.h>
> >>>> @@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> >>>>                 return 0;
> >>>>
> >>>>         for (i = 0; i < qcom->num_ports; i++) {
> >>>> -               val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> >>>> -               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
> >>>> +               /* Wait for the PHYs to go into L2 */
> >>>> +               ret = readl_poll_timeout(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i],
> >>>> +                                        val, val & PWR_EVNT_LPM_IN_L2_MASK,
> >>>> +                                        10, 3 * USEC_PER_MSEC);
> >>>> +
> >>>> +               if (ret == -ETIMEDOUT)
> >>>>                         dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
> >>>>         }
> >>>> +
> >>>
> >>>
> >>> I think its best to set the DWC3_GUSB2PHYCFG_ENBLSLPM and
> >>> DWC3_GUSB2PHYCFG_SUSPHY here as well based on quirks before polling
> >>> for the irq_stat register.
> >>
> >> Hm, it seems like the dwc3 core layer only does so in the suspend
> >> path if dr_mode = "host"?
> > 
> > OK, so I guess the quirk list is complete then, right ?
> 
> Yeah, seems that way

Ok, will respin with your other comment addressed.

Thanks.
