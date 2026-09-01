Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3817220687
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265215; cv=none; b=PsplE4PSn6OvvJGuYDqzQM4qHLtjMj1LsNk12JIUWCTQHDrdRugH9lEXDPzcxzGkLye/cQL+gXqexx9s8NxDT1p4x3E01+8dwPpDcPfbKYpeyNVaDolnrSaZGTrv3sibAM9IBWWcpLxqwHH4EQqldbyBBIwFp0SI6ZeB6nYLEIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265215; c=relaxed/simple;
	bh=qXg8sssEt9Q9EeWhnCnsQ6Z9yvVpjqAAzFP2DSeudrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hc0SYPdguUlar+/S/5sXSNKa+L754xL+Us1dcHdYgmM1J7Olqf9m+k/Khu2+S0zpbAf+fC3LBu95k2jJc56hyD05zIG7PnrtSTARpncgEeQZ2odcywDZ8yPvOspmahEoqpJDsgoh1W4POE5emNkFksx7QGqfcKoom748Fpn57nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWqn8avk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRcOQcf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWqn8avk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRcOQcf7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJPQl2993727
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 12:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=; b=lWqn8avknas80M0G
	+rPK9sTcfUabALhvPkswOLG5U4wgEa/xDpbFr4/OSbbYdm1/sdLbJ+PWAYYHXcdC
	LOVA/ADi8OIEXBfoNmGYPRKy8VouuGJqcINCVxuWGoJURicmBa0DTMGUSOm1ZE+1
	V8wnst+7Qg1T2CX+em6qE3TIabME1mBGSQB4szoe8PYVbDcTQ0ObMT1KUx9sMax/
	Ez+WD1ampzDU3z2QrLSH2VJEFiMHqN4kk0oVwx0w2EJSGJs5N0SonGfS+4iju9AB
	UnAINYs+ZRqJGKDKayoum7aJiXLQEI/ICffGTVK2YXL6ZxAbSS7w+AfX47YgeoM2
	hA+GfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3cbfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 12:20:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9310484c005so72303285a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788265213; x=1788870013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=;
        b=ZRcOQcf7byOjReIBQtpzjFZXIaSxr6TUTj+mhwh14Y3yuSnNnvOduZrp6xQglaSnyG
         3IgIxFxYd880ogejdXlUZ5UYI5K6VTtCVZ81ck2v1vhANNmebLgeY/toDBKxM8haFwcd
         dXDVkKoYOpLTpXOUkb0F3tSMnDPsXhiTODfO83jj9NlPBNYLnqg1XxzAq8s4X4bzK+WN
         RvSy6yhe6OlTQ9w4pxMmD0ucNveY0eXbRqTfbUNboTyU+7iLmP9tQe0x/nlr+D1atiTk
         VbIlyyDS/C1k25dqj/7DHelMdijmMrvqlc2VUwrMV+GLMyxTrmVX1C4WPlYmI5xASltS
         djeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265213; x=1788870013;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=;
        b=ds3mIQEvF0TyqRVEiZdjKwtnOhMO6ntJI45iEOdCTSA3JcAgCXTpsy6O6kXXAn9y72
         8DDehF6Hz0VRo9IJFXcfxh29OZ/kOoE3t0XmE4SW901IL1hWHj0wL2QnHUPU7UeENRn4
         rUCjYsVSGsSzyczYffMifA3xMquvl/WpvO4L9TIlzr6yixOrhl7l1gL4uPpHn1oJl7py
         mOzxuWJEaoeGRUS/33vXikfigIIWeSGgS+5Pu6IAffz3pJizZFAU3k1WNq0uKPeQxYgX
         AqGd0GPBtFaXI4KMdrPGBgUX0oAXbf+7zBiRS5vbuSCrAiyTecsnz7O6IRG8j2R389Jz
         /cnw==
X-Forwarded-Encrypted: i=1; AHgh+RrZUbQu8uZ9OSNqNP+zd+vMK/efBc+4ovp/dX7mbEN3cLozcf9AblAWHDgsqc88jsYDgMEdym+mn//w@vger.kernel.org
X-Gm-Message-State: AFuF++lBc/xwEPOdKpE7rUe1fLsTJjdUjc+rM1WNzvfsCPXFpRahyNgk
	haJqKuhulvYvlj16DrGfqs0A7+p4EBgDEP9EMYMdcIVkUJYrvq+75Vsq0qfaBU63tUIpIyRnv2N
	CdDFmDU8V3U2iNgmZcgH7Ud4m21D5mtl9a6OXxUenjTit55Mx+hwkdxEOk+ejOsWU
X-Gm-Gg: AR+sD12cHFAg64UwwVfJoIiG7VSrqFpV9lJjv2hWybxqVxO75QtN1UZKJ/VP6rJPbyA
	C1QnpqcQhRSi+pKzF+7a7AAaleNmbPC4x20IFHxbHKoutu2mKvUtq94k+c305TwqeFfw6tYqi/X
	EE2XMUw6LOjAoaSlRMcvdDQQV0h74S0hwJYtWvTzWegOpI0aaZKMnJgDloGG0XBn0C1iE7ORoV8
	VRnI/FhrxbxbudqKiLFCSnYwslGJkqYA9apUD0D2/bkCMTO3oujUS+ndGtUasj9HOpR1lF/vXbH
	HGdsdgwe4uX8RQxPcDTNFEAXT2RLlpQRWAPSbC6P1f5Qr6UmuL6f7zm6KWj5AeWaUPRsUwCJjpU
	/OUn3bhQCoKppU/zsFa+aTA==
X-Received: by 2002:a05:620a:46a3:b0:931:23a:83ca with SMTP id af79cd13be357-939287bdc55mr1477161085a.4.1788265212329;
        Tue, 01 Sep 2026 05:20:12 -0700 (PDT)
X-Received: by 2002:a05:620a:46a3:b0:931:23a:83ca with SMTP id af79cd13be357-939287bdc55mr1477151785a.4.1788265211504;
        Tue, 01 Sep 2026 05:20:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2872dsm590060666b.15.2026.09.01.05.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:20:10 -0700 (PDT)
Message-ID: <b4dc8702-212e-452d-b0a9-c9816b545066@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:20:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwOSBTYWx0ZWRfX6A6hLwn2YFZB
 aHjmzUwsWDAQFpJCNtrUP6Iz+xAgaXlR302XUrV9nt4qvfQaGN1SM1g8abURM2K+Yezu/ntpcc+
 uOswP1AOWhKeaQ2dh2OyUAu8MB/CS9dMrmro9In5xvSJXPSNQeoAsXhAgpqEFd4LFelnKmG03m6
 5IQzk4jGMUxxUIQBPRTlSdcR6Tqz3OqbE3IEmquZg4nSCMDNeHUvCcueatXRYtV0lxpePPGi2ti
 b7G2FFWuc2sslDrXZdzvcSoc33K1PdHmcGSx40ngeKgZFIWD5nU5JE1pknFAJ3u23m3k2840sVe
 icl6gp0W60XZzmqqCoBynNYU2DbSoHR2QNVTNpaZFBaO9HZNHXjMcECHFlzm2meV3XbbXLsz4vA
 ViWDjdqTTb4w+LV58MA6A/It8NFX0ueMqsra29L54ufRKYhh1UPl7C/AjX+p1E/cGBx4yynTYZa
 YzIR8WoSMbteGdZhiRw==
X-Proofpoint-GUID: i1uOlUYlQ11PYHRGF-tkESHktLrrbm04
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwOSBTYWx0ZWRfX8vzrWe3hI6K5
 wJ2liq9vPC132vCl+A4KMuZK5xd4w9GrWdiNa9R9izZwwyRqt+ktuvaV9wlrwjmCcXGTNge6rss
 WbuWrDyHy21hLD757GMJAkY8idSiOWU=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96c2fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: i1uOlUYlQ11PYHRGF-tkESHktLrrbm04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010109

On 9/1/26 12:27 PM, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
