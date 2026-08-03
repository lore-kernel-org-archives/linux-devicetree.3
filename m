Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1602520E702
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785729369; cv=none; b=KL/wt0L0jvPooyE0aEzDSsI0JlY/MWfChF9lVA6iFk5kDNjPfMQ8V4v+iIXl1C0a84wPBlIqRwG/QkGGPUcGuhLRO7dBqJo2oHevkP7oMfnaah0ZmwH5BAZOj2M5fi0XgJROlZ+vcebpEW/gOsDFnCb7Vn8qUuOCipC8DNpkV88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785729369; c=relaxed/simple;
	bh=/Eoz7vU2wfsdAolZp0Y8jBTmzTEbk+50HfeQwGhoUJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrAn9Bog2ydOKORfqk1Kf6kejHS8apAni4d28XJ2h5fzSnrHOsBNvPb1nXycwgSZWmb++uVI5HP9vJxZNw9cdri9BealGrf321Y3Uc04ETJno92N8xKgymsKH8vCX824pgd2zD1J/ASlMT356nzbA07gOKrAaBbU4+OnFvkdNeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzbELG2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2rgbkhH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzbELG2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2rgbkhH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LW0ft2877803
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 03:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoY2ueuQiLJte0sg+KN1+inWQsLupX6YWwGsumzJd+g=; b=RzbELG2Vp84Baimg
	HzHgqHp56UOWUNRMBPImD5tDHemApYcgojP4aULAE+/1V1h4JaAJ+p5zeWY8lVxw
	kc6U8izSlwvPtj3urmA83IHaWE44kEcgBFKgPsd26Fhm1Yr4EK5qwnMporp7mPCC
	pZud6igOLGXAZP8/hGjbBgmH3CoMI/5mt7a34VwqcalF+lxYx5dDuPAn8CADcmfM
	kMJXFH8tKIUA+5mc4yAmzJTt2du4TAYrEFbfN1nE9sqwgjz8MfIyOAo956dV91jH
	4WWpAoR4y2ul/S+esm7y3KQxo/kmp/p3t5Meam1hw5ii8wFLvNseeSpZzi7LiEg6
	hOr8FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vtcfdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:56:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6823efcso25492455ad.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 20:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785729364; x=1786334164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoY2ueuQiLJte0sg+KN1+inWQsLupX6YWwGsumzJd+g=;
        b=C2rgbkhHJ9g4f/5BDEG63NKPVtXiItjB7QDv7UtI/W2VQeTA87n8K1MkfM8v4Fd2l1
         JCMi4JinRm93Xvw2yWgGUdabkxs9Kg+091Ck6yMFa07jh0mptf+bXtXNyTI6kOkziv05
         sIqRQMoQnt/ARAEh4wrNXtW/vJGi2gtfN9ELg2JyH8FZBHw72FpiCkLb2m499E5qEN13
         ON1u56hXwOOc7PA2pXqrQaNVmB/G98r5ZZ0zIOaQ1XGF0ErK56O4u2wUI3Z9z3BFEk5r
         gTxJgwLe1/c6FkuyduXklbrhV1qHsCFl112lGqn21MBlzzuKkoIiY0hMWxWnTJNZovTj
         3LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785729364; x=1786334164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoY2ueuQiLJte0sg+KN1+inWQsLupX6YWwGsumzJd+g=;
        b=btwmSzy+MeevlijtYXzJzaOTHh8qrgj4rnUfUJxx0p3/oO8f7s7LVNBeMqXpIS+ggY
         5/fbzoh3b6lGzCUGvO/5RnV5JMUWBcilPOzg5Jm3HKQu0MZxUWcCsVgC6+q0hOpP7TG4
         yJ9Para4EwYmfmC/GG3OCLJv47eteQ4fKE1MnIR3Ag5ls1KYEmF+oBg+rS1iydJLbTz2
         8MNaYpHnUDL7Xs7p+1oNG8hwStyckG4xBRa33EkFMxEgjn2BjzGl+wUxP8EdLzoh8zCu
         iA7s8r0gVkLedgSqWsZ4r8SvHgazSgS2b5ZWHC5TD0FYRytWeDDguqQRs+yJwHMAEhu6
         xesQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzdVlAJAuOgtxzRUZ5TwnF3yDalr3njSsWyVrfeGBAWyykBiWMVr+Ts7JqEqe2s77jmkycF+MGOSvx@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXCBBlplRP/bOfhl7JPLg2dTfMs0Z8garBOkfXU5URwDqoNr2
	CqQgi9pk5GAbe4E0wjJSvA1aO+HI0YyxW40gQnTzvMxrkd7dqXlfVpITm2l/NCfIMUCTlSdG6m0
	/QNuQPqsoXMS73rnbfy26x/IhTHpZiu2R9dSl7eToIfqIDJE/tmA0LQtLzS/1+X3W
X-Gm-Gg: AR+sD10A8JWLWSlmbShtcdeH0EIJzQUZGtNgbQdHBuls6FNJ7zoanLh7a/h9laGNNOO
	0f3/GkKJzaIjk6Vuj6L6c5EKEFRJFU4mIG/TlDRDge+tdY/SeAyN3vs4Oh6bpN5C95nb6zAXkgm
	XAUEmc893a0mugPPUeGzUz+xMG3Ivc9X32C38rvGbsRc4S3chV52kRhaT0erzlLbgA6+isNciq6
	1qmhB/0+6w/cL90frfHhxwECw/KdLFiec2wxXB7uiYaTbBsB5fKcwc0Ct2B6fB6Rc/+XGYiJduz
	RxquQPpLrj1KoV0OEwPLaYOzLnaasBkmrPcrahksuJEIJf8LBmFiiYeFIWdgSQOpcTLyxUAbz4R
	Imj7PvVA5iLGCT8BhmC9ujM3WKmPNdjUW
X-Received: by 2002:a17:90b:3d47:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-38fbc0c70f7mr6890204a91.0.1785729364477;
        Sun, 02 Aug 2026 20:56:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3d47:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-38fbc0c70f7mr6890190a91.0.1785729364030;
        Sun, 02 Aug 2026 20:56:04 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm42786803eec.16.2026.08.02.20.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 20:56:03 -0700 (PDT)
Message-ID: <b7db4ab2-da87-45f9-a4c1-a8ae5ca2d0c4@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:25:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] arm64: dts: qcom: eliza-evk: Enable PCIe0 and
 PCIe1 with M.2 and TC9563 switch
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260730-eliza_evk-v7-0-7ac7b66a3e6d@oss.qualcomm.com>
 <am6_-E6qSKY1C1dN@baldur>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <am6_-E6qSKY1C1dN@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAzMCBTYWx0ZWRfX8cloULajieQ6
 9RuykmG9rNnR1b/rgFoMOyMBVwbA7mifP5PDn/iAssRuQM5dCceBCQB7zT/Fggi9FNdjxmnQM9r
 mcR47bxSkFoDUfR0+XKfdudaL0/Zfyw=
X-Proofpoint-ORIG-GUID: ilTuP5ZLBpfopBLhNbc2bwuva_ZFOkLc
X-Proofpoint-GUID: ilTuP5ZLBpfopBLhNbc2bwuva_ZFOkLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAzMCBTYWx0ZWRfX3+dL0bdc5JDk
 iGrHb7EkUGM6bzuYbjaeDI4B3silA4ZaPsmPU0KMkr2NMbYcT4HSstufAB66m7M3ZuyFzE/w4Uk
 YAbClS+c1cGfIej5ZnZWNXrenWr361DrJnXXzcIW86h2zKRPRZ5F2rN9MH0JlDR1+cpbba5ziXV
 U3t/R5VWfrI/K65EsIx31Mc424SoDNhoSG/nDUKcGWnXjcoRU4p7d3ga4wecnSRuqBP+jGb5alT
 BNuIy4e2SUaeVspaEDwtkZcighHOzkIbEiMMFXvcpjoUmwT8f2AEdy/toyDmhUvPlw4fSKQZT+Y
 lL0xW9GkS+ntijYQ/ULiaWEzPoBwOSuwkmOAa+tOY3XoI0pKrQLUItdzbTGKFFDha2PXXh+SN7z
 sD2uBLxKE/SYY4W5xi5t9PoWw8ToxdcTWmNn/Hm1Snv/vnZppqGw0S7C+pMxx1D1XuNzAZsVzzK
 IB0NqF+qyVdiHPo3sBA==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a701155 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=S9C_1OU2GNB-TOzQ3fYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030030



On 8/2/2026 9:27 AM, Bjorn Andersson wrote:
> On Thu, Jul 30, 2026 at 05:30:15PM +0530, Krishna Chaitanya Chundru wrote:
>> This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).
>>
>> The Eliza EVK exposes two PCIe ports:
>>
>> - PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
>>   via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
>>   (connected over PCIe) and a Bluetooth device (connected over UART5),
>>   modelled with the pcie-m2-e-connector binding.
>>
>> - PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
>>   management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
>>   PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
>>   the RESX# pin. The iommu-map covers all downstream switch ports
>>   (SID range 0x1400-0x1408).
>>
>> The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
>> entry is added to the M.2 power sequencer so the serdev node for the BT
>> UART interface is created on PCI enumeration.
>>
>> This seris Depends-on:
>>   https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
>>   https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/
> As far as I can tell these where merged 3 weeks ago, please help me
> understand what dependencies we're missing.
Sorry, I missed checking this part. As these are already merged there are no
dependencies for this series.

- Krishna Chaitanya.
>
> Regards,
> Bjorn
>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Changes in v7:
>> - Change the pcie sub nodes under dsp3 from pci to ethernet (Sashiko).
>> - Update the iommu-map to 2 cells from 1 cell (Mani).
>> - Link to v6: https://patch.msgid.link/20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com
>>
>> Changes in v6:
>> - change 0 to 0x0 & remove num-lanes property (Mani)
>> - Link to v5: https://patch.msgid.link/20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com
>>
>> Changes in v5:
>> - change from pci to pcie for subnode names (konrad)
>> - Link to v4: https://patch.msgid.link/20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com
>>
>> Changes in v4:
>> - Added new line and used pcie port names as pcieN_portM (Konrad).
>> - Link to v3: https://patch.msgid.link/20260721-eliza_evk-v3-0-92b10038f13d@oss.qualcomm.com
>>
>> Changes in v3:
>> - Clubbed pcie nodes to this series (Bjorn A)
>>   (https://lore.kernel.org/all/20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com/)
>> - Added comment for PERST (Mani).
>> - Extended ranges property for pcie1 (Konrad).
>> - Link to v2: https://patch.msgid.link/20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com
>>
>> Changes in v2:
>> - Drop patch 3, as this is already applied
>> - Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
>>   and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
>>   pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
>> - Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com
>>
>> ---
>> Krishna Chaitanya Chundru (3):
>>       arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes
>>       arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
>>       arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch
>>
>>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 221 +++++++++++++++++
>>  arch/arm64/boot/dts/qcom/eliza.dtsi     | 413 +++++++++++++++++++++++++++++++-
>>  2 files changed, 632 insertions(+), 2 deletions(-)
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260629-eliza_evk-6f30686b161f
>> prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
>> prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
>> prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
>> prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
>> prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53
>>
>> Best regards,
>> --  
>> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>

