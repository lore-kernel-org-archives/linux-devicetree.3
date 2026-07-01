Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349F48123B
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909550; cv=none; b=VMIu8k1E3QQDsBpvnRAWzyfHdMVZUTPMd02F1vVvTGzALjphjhdX4WFI7ldTMaxnGaVXI+QbeLl8ZsfwJhLjAfj5z1uIzVIwpwjwnM/81bCzlxvcC6l4D74DVT5QzTw4pt7Lm9gPhQoEVbAdJq15gcVvf/V/HBnk4NygirieUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909550; c=relaxed/simple;
	bh=0ENwD7I9GShtPzLW/n5zRTNevETKuJp0EKy/3Cy5E4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqnS5MgHPGqBu2VUyvMMKDE60smL9TEd4m41uD5ErHPjcKkjCctQfbLgoOHFR+fsPmp7231ruYzbPKds04ZLxmIxGEQ++FJxsOrqInIO8XeLQsSrxTSjhTMXCIm4ENqQsZpKksbQTYTQvHyZ8VspC+7AYSNKYJmFHD/1dJMtJPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBlKanGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7VFp8PF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBlKanGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7VFp8PF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8vkF753533
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 12:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RElYUFyhVFU8ab/xOJ7WvztVwr6ToVtrUcAveEyodLc=; b=dBlKanGctWPIE2EP
	3xXkBKy/tSiYDpB+182tQ8OUA32fJ/34hGqIBcmQfiPqqv6dFNkqjOtEBHycEw1u
	Emoluvp6tKi3e8+M7C+ELCL//56kX/sjAPbTsSBfw8xB0YwcZi/yO3Go/puu4k43
	1kBLrbDCCoHY3pxPMFMpbrWe8z3mLFPFcKdghaKsv8PK/8Zhb/kG8PAecXqbw+xY
	HrKw1bK5AAjNq+EXJ4L5tQ1X+gJlFjeh4WhsiX+hAcoke/zPvWG2Dw3n68PwSclA
	u7utZUFdhAm/PnJMxqcfFloReOq5xLKr4Hj+COmLGwAeWOTB2Qdt92LfgNITuBAS
	M/oQ4Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy2r6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 12:39:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139f5f5eae7so2831967c88.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782909546; x=1783514346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RElYUFyhVFU8ab/xOJ7WvztVwr6ToVtrUcAveEyodLc=;
        b=H7VFp8PFZSlMA+ANPM0c79idH3+hHXIXmnbnVfgbsIzkDwVBHAkXFvLaTANa4Bve5P
         /WQau6W6Idv2COLmdESu2OJliaojUspPjL33+d7W07knJg3rxEM10Yme0itkIah/njMi
         igtT8orYep1RSpEuO+rCkJmNUvPCXlz8K1iUpYBacV9u74nmb6WbMlPTu4l9ZQzxo0H/
         4olkbTE1zRYCTbwcYFssXgU9FrNrjdZNy4LdvZe8332HrcbnYq1BXqUNdT8XraPtJDQY
         CfqOCi+DRWDXOosmT32mAsDN/4OUr+dwL7q2AVj2KNRapeb5xWwWOVThY1WqSbGvC9CO
         J21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909546; x=1783514346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RElYUFyhVFU8ab/xOJ7WvztVwr6ToVtrUcAveEyodLc=;
        b=PFmLooTOtUfDqecWEO2C74+ZWlldqhE20BJiCUhgxxP2rBm7RYNHlful7KqLJsILxM
         3pcheovYs5T9mgYjzDazonnsklLAWkeVf7een+eZhxnYch0hMu8mWZKqK2D8F+VRRGjD
         5ihpBvG9/YCeYffucAFeU/0zfsx0paaf1NdfByYoikxZvP2CA6JC6TYKjxaub0jL76cM
         71XyUaAOiSZqEZkB46yv9czi9Vv+c/Nw3ZErM/Qtd+ZN+yaKa295SZZx5gkMh0/jAli2
         xpfyykJUuseacWKkD/Bsd6O8QsaEzzk1qfRNK0daLu386vZuGQYotyAs2G1vDpE/dIv+
         wlFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w4w+uiqDcNoZULyGI2h9sxbZRf7c328i5Gkp00isLszUNT8cRPpvGMXHSZe+PIFdc8yKjraHGSZSw@vger.kernel.org
X-Gm-Message-State: AOJu0YwtTzzFWaGCkuUIzVbPj5kPTKg0MZ9FKCuUmMRQBrODHEThN5wY
	rhtJ4JnifE/EcNkbZdif87dIiYblS8oV0lqK0CqVZgsplUorwKn6TGbnADzDyFKG7bIFVMmZ0jW
	W8FB8YOjbyuOl0Hatn0wB/LGuyDHDX8FdnOboIUZHbFVnFpiWJ8DTrf3MJThXB9v9
X-Gm-Gg: AfdE7clAlAceLRMcw627oJgJW0cBgJZ4ORl6wYxXM/TxqrSlEPDdEpEv+S+a9qQjjCb
	YBkuSP/OeoU+B3a3TOzUIboSt3sDNYT28ZLJ+0PzqUNiTs5wneecdkPpGP6pCP8eYByNYf6i9ws
	1g94FK/pyRX3ZCXB5G1/rTklZpAw40cvzm7YZIIFiSagonDBZGc6CGHRNfVeLpep+ay1EFZQ/VN
	c2el50l27Y4RcvDx3lrN5y6nsEab97kK0rhWsYy4c6gexztvzq5gKWfycdtGAm+VgjWmtZEKcjc
	8qgpc5CGG5t/TRnSjSXNT8KElkmucWLu00AF0hSzqzjel4N2Om0wkbYOVrl8VYHGkW5+5BuzW+y
	8CPuSi6VUHH8TwmG8FojY8DepIA617jOIpM4k1A==
X-Received: by 2002:a05:7022:260b:b0:139:ed5d:1b59 with SMTP id a92af1059eb24-13b36dd71ddmr1367947c88.39.1782909546425;
        Wed, 01 Jul 2026 05:39:06 -0700 (PDT)
X-Received: by 2002:a05:7022:260b:b0:139:ed5d:1b59 with SMTP id a92af1059eb24-13b36dd71ddmr1367914c88.39.1782909545720;
        Wed, 01 Jul 2026 05:39:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm17305784c88.3.2026.07.01.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:39:05 -0700 (PDT)
Date: Wed, 1 Jul 2026 18:08:58 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260701123858.4grcpqlv25k3r7mp@hu-mojha-hyd.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
 <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
 <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
 <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
 <174009b9-8be6-48e0-847f-a85c224fb817@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174009b9-8be6-48e0-847f-a85c224fb817@oss.qualcomm.com>
X-Proofpoint-GUID: vXyJhJ-tckylts4v0mqqQTN9jvyRUmjn
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a450a6b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VSszjrxEkVDZzJrrQw0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfX/5w6TWwLy3iW
 6duSMhL9NhRJekuvru3pynqSCVqZ88GtDp6JiDfTKNcku3zgMaa4tyv9/joww311sWFMSs9w+dS
 NlT8tWzC4X4TeIq3P0m6Ob+gjF/+pPnMtZszgaYuFQTIc6xePA2Td+afflCJJhN+G0qC5IVW468
 cOYl0H4ykRGmAFAsOFtAAfpiygeclewOIBaeAbG3EgvTKlMdyuU7HTKNFAx1uOkXgryWwtTJOlb
 pCZ8MKOVqD/ROG55E2m5kyAO2nlDnwIOlLEq6ybKN+7ZRmhkWfDi84wE/wGgtvCkwSwtUX5UwD2
 oVPmdUiT1rUgoUJli3EtymLh2bFNpuVscNkkyaYlj/opG1gGOyTVcC7afWcISd5PUpVz3NaN9kX
 iagGSzGLsp/Sj5egPclzy/10hhnBfAdwJcDxkEDguhlNZETYKNsg9TrCcANez2dyQdkXB5Q4v0p
 KQfRwMu45J4ioMfeUOg==
X-Proofpoint-ORIG-GUID: vXyJhJ-tckylts4v0mqqQTN9jvyRUmjn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfXwcVDpHI9zNTK
 zpvH/lz1yXAeZ/r/bWg1pgIMNHdzlTA8TM4Y4VJwSbwAzPlC5g7L6ioXy28BqwCev5wiJk/iI3Z
 veycFlTYo5xYMSzGJLVyWSGjY6kGxrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010134

On Wed, Jul 01, 2026 at 02:26:11PM +0200, Konrad Dybcio wrote:
> On 6/30/26 8:30 AM, Mukesh Ojha wrote:
> > On Mon, Jun 29, 2026 at 04:08:26PM +0200, Konrad Dybcio wrote:
> >> On 6/29/26 2:22 PM, Mukesh Ojha wrote:
> >>> On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
> >>>> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> >>>>>
> >>>>>
> >>>>> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> >>>>>> All the existing variants Kodiak boards are using Gunyah hypervisor
> >>>>>> which means that, so far, Linux-based OS could only boot in EL1 on those
> >>>>>> devices.  However, it is possible for us to boot Linux at EL2 on these
> >>>>>> devices [1].
> >>>>
> >>>> [...]
> >>>>
> >>>>> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> >>>>> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
> >>>>
> >>>> Is there a good reason non-chrome devices never defined that region in
> >>>> the first place?
> >>>
> >>> This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
> >>> control, maps it for WPSS during boot up while Linux at EL2 needs
> >>> to map it for WPSS in Gunyah's absence.
> >>
> >> Right, I'm asking about it usefulness on devices *with* Gunyah
> > 
> > Ideally, it does not need to be mentioned in the OS device tree when
> > Gunyah is present as there is no user in OS..
> 
> But it's also reserved (in the UEFI map), right?

This is device memory and not a normal memory.

-- 
-Mukesh Ojha
