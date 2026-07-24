Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C223BF68E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910589; cv=none; b=oF5jyg/iO1n88r5KQlV93ddA0JARBinitzroMNciWDZEyoweaC5StmuYZ7PvcTYvnuGeUbR1DyPdcI1y6zZHsPfHZ+GYsy6XZulAhPuQ4iT2ws5ngOVzjwUjNsYyEVZbxho+420bY9C95eLtc1WfrelurGGXgQ1wAfyuiD3iEZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910589; c=relaxed/simple;
	bh=519jXsEOx2nmWF6tQf42pw3IycBl4FPwWx2Sr4UsdfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+b+4Bll3T4quI3if5A7zVbN5uq46tOCcyVHQK8+RJzwYap0scUe1satcPdTRCy2vL8ZGLJ7Q13MMbooaVK3KzVaV4mRwawRzPf6VqBDIyBeUvia1zJvDv8QCb60y0opR6MqVR8LPunWuXnICNrhSFGdLxp/tpiqO380d6+wIpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwFCVUG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUKMZO5G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwFCVUG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUKMZO5G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OEHTkV3467898
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LLcN47DbXTezK++pGJvoRjhYXt0+3r2c+iWJU0RjDto=; b=MwFCVUG4ip4G/YrO
	tr8iopJZ+2tR3DFWW3FOW+h/ns1lLINT46/Z3E5gT1aafx7wOvc77PZeL+W+i5TW
	TQNOywn/W7pV4Gd+nzUcsetrYj5pZS1UCu+wU6NDaRUOy4tkiCAt3RGlq2CazqBn
	S1ogl0lQYQkzbOkQO9/gWZ3numjq9oAsW4cDhGYPF08aKJdgraU07YuO33fSg085
	g9zaZ9vU5fasJ0IgVl+px+aNrac0uLQNrDHJKWxAHhj12kDTQnBZLNp5cRnn+2uM
	F+CtKDoJmJQ7GY40NbF+elDFasJtFoSPs/3jVJ4nIMmpje4YFcXjUW6/UTFt/QOm
	cdyHoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm9pd0g0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:29:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so10878641cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784910586; x=1785515386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLcN47DbXTezK++pGJvoRjhYXt0+3r2c+iWJU0RjDto=;
        b=VUKMZO5GoYPn+++5+aFZKmwUQ47dpCy7TluAHjd+EgeS6rcJW/OKpoSxspBxVk0oyE
         9JCUrw4QBZzyPFMRAP28PMWymaE1J2zbR8Jdn9UtqNF1nP2jufdCHIA1AERLFooy0RvI
         K1vSTXlbR0cMHVEob8ZZbl3iN9yxayGCG/xl+7qryuMCy8hLLt710Owhg7hlmQIo7E9S
         vZoZiU6e9LOefMNT/7u7Zsxuo15eMk6ks0+Fx2gdHrki02gMD4Q5RvNiLUtnI4GB+pUI
         P8iikO6MbGNgLXGXy0GmGN2IORRoKf9L6czjeYihlAHBOp/TdkSaK6srkF4P9PfRqF2w
         h6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910586; x=1785515386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLcN47DbXTezK++pGJvoRjhYXt0+3r2c+iWJU0RjDto=;
        b=XeVw0v9LRLI5m+wELz+B4shSuauuwEjRBB+xp98EgvgC/+o+WAU117KQhY0h9yumBW
         UGTIVkClb9rY0Zadk2yQoIHugRjqXnkBwHNjCOzyrcwPuiUepoUexAB9HgdE6VcKPbvx
         I9L/lvToctmehahxpOo+y68DedBVhqCy01mUkaPPTronnex1YOS/9JDpBfl7B3KynKHw
         YQbCodDc+PHXo87KULogu3/gcegnflXNGxFuexNpvQy0vXUFG4O8de0PcjxfcUHSktyp
         pibKr5k6hzbn81r4b4WE5p83DnYj9kxI60zz5J+lh8xIoQxJNnv6x6DkaiJdkDa7o5kn
         3ztQ==
X-Forwarded-Encrypted: i=1; AHgh+RownAKxMdWSfjdJ3u/8+DjPy672dEFXBbicBKwxRkzcUqb/kREMkXCxpRP9WdiBoSG0Ab5+FAImpsfM@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbfCopcoFuDaSSdM+ZEFs/6PTkdpSAdiTUvBcuzH+S/T3EVGe
	FpluSJamJ2SzBbQ52lEj5+/YEPt7rrVpI95RrbJbGsdJR6j+AcO0wx7apGm0TYgUppygiiy8lnT
	E3oSpymxKr4AmUCQQL/P+vVmG1OvdLTM1ZMekMznV2u2+duYhA38GM88q8rSro4Ff
X-Gm-Gg: AR+sD12bxeyqGsbWvP+J7LcIUN/PQ0uz/D/Pv8t5Uzic4z0DpSbs+v4JAw3hA9VvnDw
	GZyVqLGV/Yby+lfh/fsNV3h3zgLqkqc2rtiG2y7rkiVJN2TFuuOOYN0EM1agcrDyE/vBIw97n8b
	Usp2YKm/lBq2o8ZRInD5vacTtPE1bzmf62NGNh/eub7nf6WHYkiMuQ2uJjg99X8RLt5aJD0L3S7
	K7fX70fD3rnFKbzfxXPpjntenwGcU+kpLzU/rXyYVF5J4OaAXkfZGvOe9MoXm0chtC8hgvhffmu
	iYNNd9p2b7G4SXt99LnTsJoUFAMgd8P79mOF/zMAdAY+RAum+sH2h8XYa6rnpPAkgqfHqE34qwx
	neqt6NaZbiDNdUJuZu1g2UPXTkgw=
X-Received: by 2002:ac8:610d:0:b0:51c:7b12:5ff5 with SMTP id d75a77b69052e-5283dfea897mr79954041cf.81.1784910586413;
        Fri, 24 Jul 2026 09:29:46 -0700 (PDT)
X-Received: by 2002:ac8:610d:0:b0:51c:7b12:5ff5 with SMTP id d75a77b69052e-5283dfea897mr79953671cf.81.1784910585797;
        Fri, 24 Jul 2026 09:29:45 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b486cbc7sm2053125e9.12.2026.07.24.09.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 09:29:44 -0700 (PDT)
Message-ID: <28811194-255d-41e1-a952-1c10c03f669d@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:29:44 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
 <amNcM0AxYAe4bU95@opensource.cirrus.com>
 <6d1870c1-7fff-4569-8de2-bb45b83cde25@oss.qualcomm.com>
 <amOHgSiSfm2MgQqB@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <amOHgSiSfm2MgQqB@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pTwOcSY2XnzuVs7yYw5vlD_f5i1dtQBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0NyBTYWx0ZWRfX9I0wZZOkqeu4
 /uQKUpRxD0AY3k9LZev26lvvwVfks86Znh/w3fgrLHG8ocUY99IFFCXtBqPRGoLwp7C//1ymFYI
 X+UVbgjJ603Ly1uQhymM9vIq91Nt+jyX+wmdQR/pbTbMRVf3rzR3y+a4YipPu8iSDPQG8oMrVQQ
 fqPBw3rIYie23k9UOZ9pA2vW1chVaYbOsciA4dLCtxCTy4f4bXlbNXXC+/TyqIsrGtIpCtLKNet
 vWYCipi1ZHFlgAZ9B12cxfyZdQ+1r0aZa+EFazitgaPhcjU00CZ3iBgrepDNqktwDqyph1WBBGY
 1zQyO8ABmcD2VSowrq5JbM9xOgIpcyv2/58HntMSdAuZ4L4dCWMCYpuKLVdwjEZcgITBTFz30QO
 lU65pDoJpt3aU1xSuJtroH2jCLY2kIKnKr+K8xYuypsmvireRA6l6Pylclw92rbPRLwdpWeSScb
 yIkdH6BXjhC0DxCcBOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0NyBTYWx0ZWRfXw1ErMUYuQdWc
 EM2YYeoJGhZqYY7jzEGd1FLlH67qV1Dawl5dAIRMQGG94SY1AFzaHPMc5vP23xSBCupBr6F/9DM
 ZPTBG8qW8Jm5pZvQUCnu0wFOFHMGf1M=
X-Authority-Analysis: v=2.4 cv=DLW/JSNb c=1 sm=1 tr=0 ts=6a6392fb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=RbUyBYV5fK3iINMusi0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pTwOcSY2XnzuVs7yYw5vlD_f5i1dtQBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240147

On 7/24/26 4:40 PM, Charles Keepax wrote:
> On Fri, Jul 24, 2026 at 03:31:51PM +0100, Srinivas Kandagatla wrote:
>> On 7/24/26 1:36 PM, Charles Keepax wrote:
>>> On Thu, Jul 23, 2026 at 02:24:19PM +0100, Srinivas Kandagatla wrote:
>>>> Thanks Charles, for the feedback.
>>>> On 7/23/26 11:17 AM, Charles Keepax wrote:
>>>>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
>>> Yeah agree be good to get the DT guys thoughts on this. It seems
>>> like a misstep to me to insist that the SDCA spec implements a
>>> completely different system of storing information for DT. SDCA
>>> is what SDCA is now, and supporting two different parsers seems
>>> like work no one needs when the one parser we have would work
>>> fine for both.
>> Am not sure I understood the two parser concern, what we are
>> representing in the table is something that sdca core already does after
>> parsing acpi tables. So we are reusing the same structures. Its like
>> result of already parsed acpi tables.
>>
>> I did try
> 
> Apologies for not being clear. It wasn't strictly a review
> comment on the code in the series. It was a wider point that at
> some point the world likely will want to put SDCA data in DT,
> when that happens there are basically two choices:
> 
> 1) Use the "same" representation as ACPI, in this case we can
> share all the parsing code we have now. But some of the things
> might be a little unusual for DT.
> 
> 2) Do something more idiomatic for DT, which would likely end
> up looking very different. But this would require a whole new
> parser and lengthy standardisation process.
> 
I'm inclined to go with this approach as well, provided the Device Tree
maintainers are satisfied with the initialization sequences. The rest of
the topology bindings appears solid.

This decision would also establish a precedent for handling other
DisCo-based devices in Device Trees.

> Mostly what I am interested in here is getting at what the end
> goal is. The impression I got was that really everyone from
> Plumbers was really more aligned to 2). I am not sure I agree
> that is the right choice, although willing to be convinced here.
> 
>>> That said I don't totally object to the idea of an option to
>>> supply a static block of information as you are in the series. It
>>> could be useful for transitional and work around situations. But
>>> it doesn't seem like a good choice for SDCA on DT going forward,
>>> it is basically going back to the board files that DT was saving
>>> us from.
>>
>> Either we have this at driver level or at dt level, both of them have
>> pros and cons.
>>
>> If we decide to go with dt, this how the dt entries will look like, this
>> should give fair bit of idea to DT maintianers for discussion.
> 
> Thank you so much for mocking this up, that is very helpful.
> 
> Are there additional constraints from your side pushing you
> one way or another on this? Or are you happy to do either? I am
> thinking things like DT needing to be flashed onto systems that
> have now shipped or something.
No restrictions as such, its just consensuses with DT maintainers.

--srini
> 
> Thanks,
> Charles

