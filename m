Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FFC3E5EF8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326514; cv=none; b=a2UrPXv2/0aG3034nAjL8xax7qGYyHGwYnLN5SeEQNy4OFOFQ4csD6cndVc+JEmdYbZl1xV1zt4sUXbbmAJVVNvEMnMzxPcMISBzsWLe4886wfFEUEVWKBF4fRIHl2lPz+aMpyMknUG0p0qM4aOJqUtu/bo12+425D7T/lWfvgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326514; c=relaxed/simple;
	bh=mPKd+dOcaM/hRkXKnBke5UZDJ3qEGEfIyRISqg7wB6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bl8pQjpsSD9B5+/0HMJgFXhCFWL8/cQj6ouU/Ntb2HmsK2/J4iUspcKKwkbRnOFT2CkFWX74QSXe5e+9wXUZ+i30mXW0KGuNmmI2IMIMHS74o3eTpLJWtkF+9Dtyho7c4YkRPBF3n1nQEED2vLjKvvfAyzixYlawvbvfUxtC5ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gErI7nHo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2cBb8l8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gErI7nHo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2cBb8l8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641aA13623938
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mob80sObnBOQjmZYIt894rRAtWKr1ikClaLVZFEtMLI=; b=gErI7nHoDO647b4z
	r4DSFtCfSOrX8VUQsx5UNXnI1yQMl/ork4gmWNq7JYH+rWCXna3v5WTSdvmIDfiq
	tOWOyEO1jhVgIK2yUaVMkbTj6Sl6artmPe3PPsi04a7s1y9JQ05t5AKvwHd5nyRW
	JpD7NyTS0UlvTpzgf0Z0YXGBJuTi0Fpba1KgtNuv6poQA028vk0rvtdBsYqUBVJJ
	w38cza6GxWVqB9DjPYewvDafo0x58LNzM96Uji4fePH2YmUF8Sgv/lb9iJz2hXwx
	Vob4P6z7MUE6PlwTzxuHnWaY0Pgy+wNhxw76uDg+FpZaH2/Um/OGQLQHJFycZ8Hy
	jlA0ug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swdrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:28:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eb5f54b6dso2827085a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326499; x=1783931299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mob80sObnBOQjmZYIt894rRAtWKr1ikClaLVZFEtMLI=;
        b=j2cBb8l8AugnQosH+Mx1y81sODjHSRsB//MofBUWrfchPEAVYLZ5WHlxRc4AS0Y+z8
         8+d6Dcqcjsy6QVXC50Tbfh7iCH+PJbepaNgnwimjLhPToNoPHx/t2WlzuddKhnnW+3KW
         BrCAYe410UQ3YIdGekehxCRvVGZVxUlFdLkWU8qL/NfRBDvXCouWBY11Zzyae3vgSaNZ
         ykBe87MT/tlTko//9qdzgXgOTfKmeZiWade/f3mKQrixe5lShmG/f7E/ixTmzWy2Ddwd
         x42WV+vtonA2AO0X8BCiLgjTN7Tj2xYv9CPPjMVXj7Mvp66t3yKUuQfFFWpFzPaBnHO3
         L+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326499; x=1783931299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mob80sObnBOQjmZYIt894rRAtWKr1ikClaLVZFEtMLI=;
        b=bzgbteVVPjXQSfyVUR86CWj97uFba11BXiWew5vhTNvGss+NtV4XFm4CgAf1vBPhqs
         0aLe3iswhy4+v1JvH8cW3DhKzIokDwiAnowFEddzeV1MxkAGKeqI1MfknezKs4Kx4xts
         qUk05ozzQ558cvqEbKO2hOWPw1/V5SBpvxEld4O51OoNQzNTVMrfGTW/hdg2QfyhKOtq
         Beq+4xkoLndiVTPxjbRfQMjFtklBjXbyRm53Qc86R6C5Mu9JCwx1n6V1xAt46fLRdwlo
         tJPU7wbvieciw/cniJ4XHiyLEnSMVvqtMT44Z4/puXQlULteAdPY2Lbw5tcPBF/Ezuir
         sRrg==
X-Forwarded-Encrypted: i=1; AHgh+RonJoSZ/bLzKYqphyis6mM/z7Ql/f02OpjoOxSG+QDl72u3Y+w/jzhATjjQnB+rLLwxI4g6ehlqlMbc@vger.kernel.org
X-Gm-Message-State: AOJu0YziwxW8cfAPQGA2UDuyV8cjvJtrbfbsCt3MFSAGMi/kYW7/owlX
	YMhpyO6SurJsxewg2VevLbsCdlDN7F7nHWt2YG6tMA+VlzPIbWwtQ5gwICuHvQMs5CA9KVQ9guA
	lsaYYVN1Ti+D3kholNNZ9XtG+0vT5t5oZA2yfd83Ji/pKs0JP8G+7MybdOEp224Jm
X-Gm-Gg: AfdE7cm3Q03v9hbqnL439kB5KfzezWQsyHf96asBqWWX1fR3ib9O6h7qYc+/5ONvGBs
	saxs2HJT5meFCFX81OT9BV7K/a8os74HW4CkGDWQ1MdycM3cyTiwerdr8A/Vzi5knd+On54tjD/
	vWHO3zUbjO+/pGcRlrMmrAxUA+nw9XvYvKR0TyNEpWbEBc4+LsppD0rNk16qj2dRYiBhKHYRTiL
	jGV1UAqCApZu4H1QU/k7PqRHY6TwqwOyuT6zBG+my7y1NglM4Vsclxux9o+f3YxJlSWGicgrTU6
	WO9ssHcRiFNggwqm9E+1iKdiBxJnWfkFW9hvVxOV24E8nj2+2VUf8K62JcyqPHzWza0n3iNanTV
	M/T7NIi/WOdQ9s6tjIq3LDKBcbO9wFHgHaGE=
X-Received: by 2002:a05:620a:2983:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92e99f6b749mr838790485a.2.1783326499436;
        Mon, 06 Jul 2026 01:28:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92e99f6b749mr838789085a.2.1783326498940;
        Mon, 06 Jul 2026 01:28:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm692575666b.9.2026.07.06.01.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:17 -0700 (PDT)
Message-ID: <d67703cb-83e0-4598-88a7-29a69c17a2eb@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
 <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXxt8bV5PafdXM
 SzRZBCWFVIFqXViK1Z2tut9iBAnhGZ5yh2KpbEZr6rfH9fIQ5iacTh31OMaOjXjICgiWtQ6JmcO
 sjXFQMQOyIHFF403pbjO8kyTFiQ7Tyc=
X-Proofpoint-ORIG-GUID: lkINeCHNFk97zjkGwcIFUudj6vXwJnHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX22UnwDVENEDd
 MPiBIARoX9hkawSNRAhaTeKz+3RBJ4rbteR/qYh+XfdqmHbmxzFwkbh/IIxX/Xtd768i+4oZB7E
 1Fc4oLoht0ZGVqsvMjxn076cf0TwQIN0bj2sgpULmmnAuxVa8r5r/sGBFPKppQMwQ9Qe1Bg3TOQ
 9BBQTkZ+1KpBX7J1T6oy9ZfJo2lqgpTk8QR3BGrAqNoPsnIDpp/D0eXvol8Ob7nKWCOqaEssouy
 tyDcD+soQX54scdEbmfJTqYF7SKTkT5cU5p3ww3qG7+4oLWILzpzV7eU70mCBCM8+FADsm5EI7z
 R2oM7zuKH+7gSCIDhvHfmpZGEFaPnkHvAo/mE/Ide651keJujdEhDjReRhj6Fj6HLSlag+2mHwD
 07S7QsXw6UayqN/XTBOoXUKXTS4Vb/N7ZKTuuqHazAaZxdnE+EPBYSPpBqGX5hmHSwjT1n1ORs9
 kErlLduKlCcbLet9OIA==
X-Proofpoint-GUID: lkINeCHNFk97zjkGwcIFUudj6vXwJnHI
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b6724 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M7nLEK1OKNC5V3jzK1UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

On 7/6/26 7:22 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/3/2026 8:39 PM, Konrad Dybcio wrote:
>> On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
>>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>>
>>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>>
>>> Override the base iommu-map with the expanded set covering all the
>>> switch's downstream ports (0x1400-0x1408 SID range).
>>>
>>> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
>>> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
>>> from the PCIe controller.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +&pcie1 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&pcie1_default_state>;
>> flipped order
>>
>> [...]
>>
>>> +&pcie1port0 {
>> This port should also get the compatible
> for pcie1 it is not required, only for m.2 connector we need the compatible.

It will be required once someone else makes a board where this
PCIe slot is routed

Replying back and forth took more time than fixing the issue

Konrad
