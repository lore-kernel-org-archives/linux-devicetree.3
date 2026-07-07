Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871CF3E5568
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419949; cv=none; b=IMMuNbl3YKkKlZZ/Q1dslPNbZ+ZPyHbd25BIh1iQjhC5yvqimlxfXUuMCDAGG22Jdd/LsVlZ64p1Qi4y9crCPnwgCB+LnMP6qPAXyuVMYiyV6Vd5z0hZ5s8Yu2DpUGE2udeaONUdgGpA1HCYDmOataU8cDhiX64KgeMkrG50oVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419949; c=relaxed/simple;
	bh=enrhIw6VUqzjOJdsvB8tYAkfj8nD93Ge1HcbjHE/C0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBLC+Pl6/4WBDPqbduDnxbsy+nejj9bi2Fif78CoKEbGBTQdKu1dS2AYbU27qd4O51MukpQiiHL19GHoN/89ca5b7lzRvfnylbZDEOX7zM2yAUof2TrirvxdyB7QxTCUxIHwAVFSzb5JVsRaBOWlSKC0WGuohjTvvkF5RJ/sSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJpWpVRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikf9hyJV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJpWpVRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikf9hyJV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DgSw3050446
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qeaD8wc815Qj+RilTlDae/cpdONzOxPD0KBYyhtTgLo=; b=lJpWpVRlER8o5qKr
	UX90TVwm+6/lAFFlUjrPpQsYwHHksOqZmWIO4JYM2TVCL+gRf92qOnFp7FIy5AJc
	DRa+8mfw+nROxf8lT3UGDKFnpiwH9RQuecKHGd1yAHrWd5hqQ6/NA1GRGhJAwTXH
	sxZKibAXXPlXucHVc1XyDCvZo6Shroyj4hANFKJ8I0Jgl9VBwdpmafsLUMotxKyX
	lr93ijJhIjV2E/HkafjVojTgUhpkEeh0rclbVcB7lWzjGC79m2PrldRWVjJgz0mi
	aWpmf5JtlxuRttfLNQ2yLquxByEyazsE4fL038gOzxl7h2oN4lBAr0WwwfwuHJzV
	uso+LQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8q53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:25:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so9210671cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419944; x=1784024744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeaD8wc815Qj+RilTlDae/cpdONzOxPD0KBYyhtTgLo=;
        b=ikf9hyJV18dcyr7W4Oonr5/w7xxSSHoI7V4MPEwEeLQ0aUuhWqM29wNouH9AmaMjrl
         EEc4SkneNVr0iymS/XHa23++q/GnFRtn5fjI5exU6W18G2ysQjl3Afnv3ulAaDXX50Uj
         qs1WCTDfgf4ebld8/EjRHacGXpnHcfq0ZoRQdEt8XG4wXTrfTrNTVwLtDriI+wnhuQhg
         qYmLq6OCh4HdrnpY7dfVvHwD6fBmuIulNaE4lzq5bEDjiuDoEXvcYjn1Yg9DXOW6SbAx
         vvqTaguhSalMjJs08vx69vM1cAG1SlyMjP+EhUf4UzsHHmkWmB0DQWC5MK6o+bxMGxd3
         +NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419944; x=1784024744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeaD8wc815Qj+RilTlDae/cpdONzOxPD0KBYyhtTgLo=;
        b=Sv0CJ9IuVqbm7sUJdlO7p11RJBs+XgY9bmzIX43tPUxrKL118dXsQW7qJuFUMN+6pf
         P+58KEWg0+WHVqPe60elqYyY1eY+60nNdOUOn2qEv5t8oLsXMNxhzlfbT4j/hpF6uJop
         UaPDP1PwXLmja6hNKMsbfnmWBrYVp0BaDTmh80slEo6bvHUwF75nnqvhgOFoRGMHZ72D
         n9efKRaH4jGPxTN/7a79rfbxrtvjlQj7HkHMqpaEt9yQQSQBZPNsb+pw3IKvnotncG36
         GPUOsR8s/+H0pR4QKbS3/eBxRNAByHOz9Hj4HDDpCma1MeL1Q0mNqVh0VGBnDb/JpJxC
         rukg==
X-Forwarded-Encrypted: i=1; AHgh+RoWUn2/DUAA5AyWM2L1qQZ0P/gS8BuTkXC+2EwWwiQYGIbozB6pBEZdlkwPLbrlTi6VbdE55QUupEnq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb2nxFmTdaBCYGL+owdCBIyZdFwrjJpoKLmMttTJlTjGt3EGy8
	1dUXfOcWvIJ6AZbcZrUQKbbrcrx2+3xRDeybUZsGWM5pght3fn9Xmzka5nMJtga5PxqSUQomVev
	up4aZ8XG1Wi9egVcC7+XjFCsgAoIFlWdGRh5XZgu73KsImGm/8vcrVhScEjuDDRSA
X-Gm-Gg: AfdE7cnxMYLZ41+tOXJrNLNIW6qZpb30/KqVw0zNzkpUwT03+tmqxAxKRGKjkdHddCL
	aEDXt/N4ERbXheOwRaBWkqCzNZ0MRs0qLCPhP9P+P//amTGbTirnZajkF3Vn9Um/MgaWOMeZPsO
	mm6BOYuejbadnI+mfiYDsVb1njbZF4iq+fHwLqewZVJ7t7KvgokCb+d9dd6G+kLOpIWkVcTwYHM
	HptbazLoJhBXI/Ov4HXVO7IVHlJEdRVHu353CZcw5UCE4/19ZIBSNkJlLygaE/wVO0QcqVWPpPC
	eIZ390PMRW5pva7asFlRIOBJWcqhDhbZsmiTdaAlo3Yj5x30cNybJ+zIT1orO/C8EElDUk9IjCy
	stiTQGqu0OyONHPgyVxhiqKo+Jb/4oH26peo=
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr129277851cf.9.1783419944236;
        Tue, 07 Jul 2026 03:25:44 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr129277701cf.9.1783419943606;
        Tue, 07 Jul 2026 03:25:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15b1a1011fsm79906966b.58.2026.07.07.03.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:25:42 -0700 (PDT)
Message-ID: <9448e854-d64f-4316-8fdd-4e1e3dcc9ce0@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:25:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
 <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
 <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX45thqIzT2PSR
 xMqgBNkElNxr25oiOJf3LvmZXyuBsBQcgE8bZWJV6TvSlaCb7TDy/Ggx+FanDCVHabMS8oRx7zs
 ZAtfQtYDBhxeG56mdg/3UEr/yni+WKg=
X-Proofpoint-GUID: JxUY7S5UroXIjylGHEUBWGtriYXexKEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX1YOT+ErtBNXz
 BxONsyMabbs8nSOL6hwfGCKmQ/rOSr18nwEOamtXYhDwDO8QHegMm/Z/l8oYqM89IV85bbgBDg8
 MlDRf66gHRgJAZFrO0X9Dn4M+Jx8vnPQuMiJ+CvXYpQOFhUXg15PkzXoWg19wKaUchnkrmJtXop
 3jK/kxurE8I0uz6tIYzJtjzNz8e0Z2gX8HzLSbSIm9/Uzs6e/zulw0cHCnGn84b0tHjdAXNaJcc
 NuipRdobfOYwm0SNSYZ0lkNWsaCK6zQHpT3e16tcSmolrQoDPa0QSphL7wLyqaLXuUReUA6QJox
 nG9EPOha2Rvspxuy0OiSxD0PufTNPdTZX3mRhFT0d4ZWk0AL1f70UkQuVR73PUSabmlKZ2xMiGs
 /jmOceOuXKd/MkI0Wau2ZrTxuQlCUoAHgV7/GGzDeEVQR2FW04qQv6uFDTXo5ptC6trB+DIPN3p
 0RBdEFPhXOLEoei4HJg==
X-Proofpoint-ORIG-GUID: JxUY7S5UroXIjylGHEUBWGtriYXexKEF
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cd428 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_qhDSAx7fSPv64GxxyMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100

On 6/26/26 5:15 PM, Abel Vesa wrote:
> On 26-06-26 09:46:03, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 6/25/2026 3:42 PM, Abel Vesa wrote:
>>> On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
>>>> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
>>>> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
>>>> the GCC clock references to use the newly added PHY nodes instead of
>>>> placeholder zeros.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---

[...]

>>> No pinctrl states?
>> As we are adding perst & wake gpio's in board specific file, it is better to
>> add the pincntrl also
>> there only.
> 
> I'll let Bjorn and Konrad reply, but most of the sm8*50.dtsi have
> them. Though some of the newer platforms moved them in the board dts.

Some folks argue (I believe purely ideologically) that the pin states
should be defined in the board DTSI, but I don't think we have a single
example of non-default routing in the many many years of linux-arm-msm,
so I think the reasonable decision is to keep them in the SoC DTSI.

Konrad
