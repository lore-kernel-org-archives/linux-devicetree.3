Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C03A16AE
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739111; cv=none; b=O8XmaL8XiSBvp4SC5GrK9tcV40XCMbfeQTnh2NDzWfwyNOziGFFRUK72QEMIhxJCRYkmEPiKlf6DH2g+UeFaKt/LZy06eBQbb335mmilly+z6JhcCu9M1MUDO726nGq2R19+J438Cil8/SXRnez65CeTOZJHZ7w8ZqVjj+IpEgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739111; c=relaxed/simple;
	bh=vLpX4ZuPzLEP67c+cuTJnZelof862na1s4JOb2xUtbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hU4wzLqkGEgh/Ah1TaOmuQjCj56a3AGPtS8UfpMah5uIjIeHf/luOtj6SvIV0PQvQoHSCYSqLXu0jD3STa09+42z4PhcbKYIQcXInMeaFZ4978dTIwkRdYZrHMREU9dUTqSqN4vhsU2S582x1Y7My5BVsDZWVKbnErf9XPAH7L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvyZziJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9fkJ/x7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvyZziJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9fkJ/x7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LYGYR2597958
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 06:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAzrxc2hNI6I+qi7h96XH364pbhlv27NAt6ncX0XJyA=; b=bvyZziJGJa1fnsDR
	Udsh/FxIwL07LTkBqGzvFBdMCltRBIululm74y68vew/Alm8cxP+UMZrHd/Sy0oZ
	nLGsGcdc0XnzElu7WMQIhX8jBPHOq2Itjvsskkhob3AQ/lPIwmkbGtt/fmdx7OPT
	l7wLqt/jxu+FWbL195B0JyvHJVUrC3GkEmD195D/AgJZtx/6jSQoh0bNoysDrLUA
	C08oFXnrMPhY2KqEucjyuVgRLbPLzkOsFdgDUFZfFosVUnCnxflOL/rok6ypkI/z
	Qm698Eruzn8WWpOSuZquuGUGaWiz5ptZN2Svh0AqIeiJTW/4V97wNy6F/hAffL3v
	qHK+7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs966ctwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:38:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso29916611cf.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 23:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785739108; x=1786343908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAzrxc2hNI6I+qi7h96XH364pbhlv27NAt6ncX0XJyA=;
        b=j9fkJ/x7pYeFKxew+UpLFzKtBDbigtHmUGam8WHrwAkIU4n3syWzN5FvmtPnBB3noa
         CImDUMPfOcpHelZT7IlH62VEpqNCWysdsXCXFJyh0tsWtr6RfzKaZrk1xPuxwj0Qc0nv
         IztIYqWnEDCAp3BRJAfQD3BifOmWtSs1/G0aGiZDJhsAUq8DbrqkFZmv0VJZazh5RzgU
         KR99uO+QXgnTTkbgcypXUkT/15bUUUvVLMb7vHgzPiD9/2kgqjxlCuJqR1ypic7/bq9P
         5h7d12uNXvz7IdIOD9yiC8EAyDvBxTwy0QFOMrYOmjjfQbILzFuokOAEPbekL5rgYHkj
         yVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785739108; x=1786343908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAzrxc2hNI6I+qi7h96XH364pbhlv27NAt6ncX0XJyA=;
        b=BhFS1npmo8YqGpdn41lhWpCplVgt4/LF9QmzolDDocIQr84YtXDMrXU2HOygCjqNfW
         Enw6QvtTNdmoDE6J/JZixjDn7AM/VBKIxBz9Mr2Seo5V88UYYCgHmU2faZoDcxajsmrr
         O/skP4FMunDlPAAX6AcDhw2VnMqhI7Lmo8cVupY2D2aBYUnf4mL12IidozpBtYjI5kgr
         kEddqmIycILGkcV6oQpiChOh7HAsJOPLqJaPlePekrQ/rrOXNA36y/VqmxsLa95+r++u
         oqibkrx0BxpUS6si4oqMLuAIGJGcrN82wAeg4M+Oe90L8gQEAKhyyaE5guU2xy7EMWg2
         ohig==
X-Forwarded-Encrypted: i=1; AHgh+RqtzWARBl4/NENSr1V8LgjpUArmSF/0ySN8u7owjKA/P53nFcJqPEiBz5JnzG579fxXtg5FyLcTx7Ny@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKX374v6EIC1aUi06quwtcDt4xJChap1oukpEEUdntMRioAHk
	pPz4jFw818ksC2bHo31iizcGIjGtjpHRdsYHcpwFW+HTLEIn3lIFLgSpkY4+6DVdnhtS7z0VoeH
	A+F195PGqpMfY2/8S2mqX+dPCGv7BKdXr46NM1K8E+CEvCoeIXu0SKRH/3Ui/Bezt
X-Gm-Gg: AR+sD12u3Vfwtkt83tR0icuSk7O3Lmu7dA6N4DaeREdauw16uhOfAYlmBoFieHjjZGv
	Os03vlXsL3HKz0JfXkEIvZoxUT7QDduf9gLPwSyIJdNaG57f3YChf2WOjWSVPZG3FyzFk3MiFGD
	nWPz9bD//KNkKmPNPnVr0s0tUivk+ItrnrXSpHX9S0GzyeI1bQc7ssdILZifYj9LULtCUHGBmuS
	0QPJnIVLlYrFC+gHtjIArcuPKDDFUQbsmG6aUK7ZyTisHb6/hrBqF8qStrVjVlmlorEG46/PHYh
	GnnoNi2Iz+gWh66XreD8A63KJExS8mv+41h7brcJfo9GE3NgtRYt29VG3bLCTwgtugeJCPM42Nz
	4U/+syqlVabtoUDe/6EqlpXXireQKEvQ2OtFNUOc159nMS6WUFBeVWkGO8eXprcXgIB6yfS9v
X-Received: by 2002:a05:622a:e0dc:10b0:52b:6543:d8b with SMTP id d75a77b69052e-52b654316b5mr81525961cf.12.1785739107718;
        Sun, 02 Aug 2026 23:38:27 -0700 (PDT)
X-Received: by 2002:a05:622a:e0dc:10b0:52b:6543:d8b with SMTP id d75a77b69052e-52b654316b5mr81525721cf.12.1785739107190;
        Sun, 02 Aug 2026 23:38:27 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm4652514a12.27.2026.08.02.23.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:38:26 -0700 (PDT)
Message-ID: <fc2eff99-22aa-496a-8ea6-dc9a856819b6@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:38:23 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PssA9c0ZWLqLGLFtWYADdfUQhroIek2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1NiBTYWx0ZWRfX0wWmquC7HcX4
 fO9tdRIGCWwbQn0OFU3lGnolX47b7LQCkoks9SygQhD9e5Ss012kNr6I6hKp2eTQQjU7CGNWwWx
 BgwkE9kx3Pm/VWRpBGm12M+OIZqvLegIG3ErGtRFPvwcGiidiUZmMQal9TgYspQkMt8QWd/yz4Z
 jSzkHnHcnjcWOcmjmgBbfir0baCLeC+TlYSBWUnhfZDZ9XdjQeFQT5Gv5+cnIG+uZoeMMpUEiFM
 KU8D/Sr5zaPRWVpDDrZoefMill7cnwi5e4RFKsV9hjMsecvWoPYCS9FjF6GjbtPVT1VZCuL6gXD
 JxumH+HlC4cWmKBLmdB9lcsclfSldZ4K7L5R+vtpvzSKRInNyU9vlQhbBmrppEVFDPh9T2u5qNE
 oJrdexdovo5dVrywGG3ZqxBoM753Xi+/v9fbjwgSYBzgGFB3rvJ0OB1J1EKEyEg6VisnXDMM/8M
 T8Pp7uqoyBbIkg94w6Q==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a703764 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=cLrG_rAEkySFN_cCsHIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: PssA9c0ZWLqLGLFtWYADdfUQhroIek2y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1NiBTYWx0ZWRfX3aJvy02LwCyF
 7Ltd4p/VOD4JdaRqN26jH0V/3SgViQi6ii+6Bft6aA5xIVDYzgwJGfILhu6dqHMiW+P0qTEVQiO
 TGTe6faUeWLJ52B5N2RTazeeOGCOxsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030056


Hi Bryan,

On 8/1/2026 1:04 PM, Bryan O'Donoghue wrote:
> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
>>>> please drop separate mmcx vote here and let it come through the
>>>> titan_top (it might require camcc driver and node modifications).
>>>>
>>> The change was requested by Brian, most likely in connection with
>>> upcoming migrations. I think he would be able to explain the exact
>>> reasons. As far as the facts are concerned, this is not currently
>>> necessary for the driver to be functional.
>> In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
>> However Bryan request to ad MMCX and MX.
>> As i can see same is for csiphy. Maybe is better to sync with Bryan.
> 
> Check hamoa - I believe it is the case there's a separate vote required 
> for MMCX/MXA.
> 
> I'm prefectly fine if all that is required on kona is titan_top_gdsc 
> but, basically I'm asking _you_ to go verify the difference and come 
> back with an answer.
> 
> "Not required for Kona we checked" - its not about being asked its about 
> checking what's actually required, I'm highlighting this because sm8550 
> perhaps and hamoa definitely are different.
> 
> All of this is in the power-tree documentation. Please find the place 
> where the power-rails are stipulated for venus/iris and then check to 
> see what's required for the titan block and represent all of the 
> necessary rails in the jpeg@{} such that jpeg@{} can run standalone 
> without any of the rest of the block switched on.
> 
> I'll trust your diligence in that.

Understood. We will check that thanks for the clarification.

~Gjorgji

