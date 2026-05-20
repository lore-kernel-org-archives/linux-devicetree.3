Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550D3A4F55
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264359; cv=none; b=MsUS0vkEbOf1aUQ7ZsfFX7QEItVsNLF7my3hfJ4ns3nQa1CvE9Bf389IKUVlDyiT78BnDrNYld5jtFOXIv/37xZAofkiNu58w3sg2niK5aGmW5RsZCVB8m1ke5fCS5Zg6X/prj8Ub9TVks5FD+aEWR0GgCZxRm1v1zho5GOITyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264359; c=relaxed/simple;
	bh=KUaCdDomY2qU9nG60VsZNCEO7wba/w9qv4eRI81YKo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiX5Rlx5o6IEPiM8zJV6xnElcMsGFp25T+FZbOWjAjCcfP6+J3soaHLpQfPFy20hgscM+RTnSIKNoMd4jNThiWgMP2PNUuiV9ZjbGiTNho6lkjvYuIlfwCI1yie07aTJDao8k8y0/CH07hhKdZnLqubeEX9lcVp85Ao9eVQHqys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaRSheFu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuBL/fce; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaRSheFu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuBL/fce"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6f79A2868052
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=; b=ZaRSheFuPELGrHrU
	5bq5fVMfyqResKiQ70JQ9GcmVcwVO++BNdtAGa8VE2RcuXKOS1fdXMzwTJtDbph5
	Kdz4noyWWRWd6d23UxPQMSbSlVPYhaCaEpU8/dR7MIrPBCAKu4u2eeLWD7A9h8Ru
	U3reVb2kI1+5mBFvP29oQxg4eDYm25BSrQS33OCcAsX2dxLWXMzwkxEAzAllr/T5
	SbMuaMtk4zoKuAm4QahqJUCu0TasoEKPmouhj+BzAYKQPlph23Nquuv+5EWqtMuO
	plY7E2DXbNgLQ53IfLC/cnaAcIDD30ZwYB/zcqQY/p+D8n8MDMmrXgdUON6gqfI7
	uk+kjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3wbqs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:05:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c829366cf25so7021172a12.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264354; x=1779869154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=VuBL/fceh5Ece1PXQOSfa42Xn/BfhtInYmw1tzmg/mCFuIR9AvRBemthybBkBYGyuT
         l1aN5WXvh/d1k9HifM5Q5KHjfjV8E2xSd2hqkUutdob6AoDWrgxahqbhd3fwaS6pniEA
         fmZ4dcf02QzSLtPZi1F1u77S5mKvhzlK4KoUnNbCd6whLfmZTqRNECZYZNIXz3MRrAzT
         ZDMkZ8Q028IMCiGRuYTbyqGur6/QHEMBy+K6M6ZGywlRKv7PXdHfUnhowyhsklEHU6+f
         3mj/+9y3LZIDcROOWc7NWK1I3X0rEZOYiuuKLZTwRRh0brbizGc0stzt0spH53XN5NHD
         TzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264354; x=1779869154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=mvwVC4MtxcJSDatTSCgBHOLaEyjjYlvNpiCe/tdl1B6hBSUaQyVl07ygzUmwXuo4el
         n+fgk4wybMO7eTasxRhez/8m9gsJA0ODBbZZgYuvYn9zMfR4yjDS+mpGFoEWKopaC7cJ
         duGalKzB3jqMFe05w0BkzD0kHrHbtkhuzUA7k/zEd3FnOfCzHM8o/uu7PFv2Ht0DU96o
         LJDvb1N+rhP27+blZ8xewqlOmmea2J7/ELHtWkSEm8LpPo/tCbRa+SC67cTNDbJBtBvT
         r2Vhq84WDcoLsZsn0MhgzXAvUUgXDSxNNe4yPuzHa1708dwyGKqrxeA8Hx/OgDyiOCEV
         x0tQ==
X-Forwarded-Encrypted: i=1; AFNElJ//5MGDRsVx0zdF+CGWpeGEgOFL2sRVT5pabOBpjGiiNsSymO4GhO318FfA8M5slYwoV3IiRZXA66Fx@vger.kernel.org
X-Gm-Message-State: AOJu0YzWj7rYtsHjf0AnEybrNcTgwxMzlrHseoJ31Zf4MXd4SJ2d5YKt
	buElKJC5ho9aMiqW/eTAhre6BSxrO4+t/QPEDIYAho41tIqyh7vHcpU6Yg/HvBS8GpmigkqaHqE
	b96wK1yWNBaVXESUCs057UPZ6XK0vN/aHRZhpaMqN1HHgHPBMd7M6i218mQvKwXUf
X-Gm-Gg: Acq92OE2Bf228XDvxgucldjwaY3WuTU1uKn7tsR2sOTtILEBunKufWh3rWK+nh1OuoV
	PmHreAIzaU/bt7DEE4XcsnvwJYIBb7BTOrl+Pm3wMXKoJZCCUTXOYYYNiJKf4CadR3/A2xFkLXI
	SIKd1e6QkSNvGciQGJ+j47+98ootNE+zRTgKskrhHovia2e+zBdyKYgKaweCDg5MLVnxZFCGY1r
	1zV2ppRosoSMKhJ8rrGNbu9n8GD5C/2qYpMx0gv280gwVj+MbRL8m/jd9/UKImGiDOOQPXwxJU8
	R9EQgwN+XdVDABLrWdITVX8FFvm8TEM5cu3E+jHYARq7lhfFgsa9Vy92DT46IfXbxjplhbytLY+
	osgPe68RTUbWFI4WazVluzTNgVI4mYQGZa8h1KgneDGJwj1DGpIPZqRFy3RYsuSKCkTQ=
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955124637.50.1779264353650;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955066637.50.1779264353199;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb11683fsm18637582a12.26.2026.05.20.01.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:05:52 -0700 (PDT)
Message-ID: <11b91838-9b24-4a62-8760-fdeb3703afc4@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:35:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Rob Herring <robh@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
 <20260506221915.GA3290640-robh@kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260506221915.GA3290640-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX7OWygnazeEyD
 klFldhFK8k5utPshLI1xFD2HDg3b0TbuqVmJ5mpKK33FU7qPYF+gwgSGi5CzR7QgWCgRiLg0Imx
 rQJNn71ljaLq23rdEm3jv/0XfFRo5tg7TbE1HFUo7R1Syrb95N076Tgbe6EN/0BdpxnOtuyTx/g
 u/TNJ7mGE6mew/ehg5LuNfxzjzSFh/kqIJT0NnO0Ar3i82CPVUpYHKa5Be/NfA36e8QZ06n7bC3
 3e1gJIgNttJaaIDUMlHCXTUN2xv60NofpF50/Vt/uQW7AmSsFZMoiXmYUIbzyHFUI5XmRLkwZIL
 S8weHWi42qYLyDn5B2gYoQ6+mbpNukLk09OftLRBomeVY3HXiXqcXw6otzwuFGnJwMY/lTwwbK3
 Rsq0i3a3IljsmM0vVhPOnrTUy1LrSYt2ic5JMtFWyj7ab5vrZQIkN/qlZv/CweKtpRHBvJ8SdRX
 N2KgSvNP3U1hdiTHQPA==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0d6b62 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zmrd7r8un3QtD10oEDQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: r9CJiXAxeJ9xPIPDUaK-tc9bDszJYLw6
X-Proofpoint-ORIG-GUID: r9CJiXAxeJ9xPIPDUaK-tc9bDszJYLw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200076



On 5/7/2026 3:49 AM, Rob Herring wrote:
> On Fri, Apr 24, 2026 at 11:26:07AM +0530, Vijayanand Jitta wrote:
>> So far our parsing of {iommu,msi}-map properties has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use[1] in being able to map at least
>> single input IDs to multi-cell output specifiers (and properly support
>> 0-cell outputs as well), add support for properly parsing and using the
>> target nodes' #cells values, albeit with the unfortunate complication of
>> still having to work around expectations of the old behaviour too.
>> 							-- Robin.
>>
>> Unlike single #{}-cell, it is complex to establish a linear relation
>> between input 'id' and output specifier for multi-cell properties, thus
>> it is always expected that len never going to be > 1.
>>
>> These changes have been tested on QEMU for the arm64 architecture.
>>
>> Since, this would also need update in dt-schema, raised PR[2] for the
>> same.
> 
> Sashiko has some thoughts on the series:
> 
> https://sashiko.dev/#/patchset/20260424-parse_iommu_cells-v14-0-fd02f11b6c38%40oss.qualcomm.com
> 
> Rob

Thanks for the feedback, I have Posted v15 addressing comments from Sashiko.

v15: https://lore.kernel.org/all/20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com/

Thanks,
Vijay
