Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378853EB104
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428237; cv=none; b=tFf28AVW+Sm9PJXKAD+rNCZx3u3O6ZL58A24F2/o9amevEDvamt2hpIJLhuNIFsGv1Op0oTP6meJEaA+ln14GiMzy0KFqxjlE5QRQCl7FUCMQtMWC+6Fdp0b3q7d1E+8ZZW3o6mCC6uOF43maWBG/guuzzDnF5QBzVCYUVp/xZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428237; c=relaxed/simple;
	bh=QpG7V4cc8txqVY7a1oeiMelRONahCr6NiamaOuy/I/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UyBSwIHCfJTaXCsIHn71ZlNoUAwDotxhtU/qvcnJr9VFdfniOcPLSCmhKKSxGugtp6X2xaoYDg/brS0bcIg4NDQ7KKj3vlNY48GilAk1cBfnAnGRkNqybN/X6PFDTw/itKwBiViEIykDjP3IFxZl7cXWrmFcWN+w2bEDmr4alA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6nkF6Hf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQV9Mquy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6nkF6Hf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQV9Mquy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392vSO269141
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzWqbZMIo4osgHzhiKJA6eNCvt7He3vUmWl4Cvox+No=; b=e6nkF6HfJ+0Ttk0W
	J4km7vF022ADRlQ4caHB1p8xLGLwrxgvO6U/IWrAp0QIh7qp2GQKYYMll8xnajaK
	DbbzBHU0CwIS4sYy3+Ltu3S+UkTzTu/5Ee4eo6ZCFpOAWOIuzYsHXutjahe0Ozl1
	Co3HQifLcTC93KwMYBjNrXII+YF+btephEKd0iT40L7Etrf+uko1LwPWOhOiK3OX
	nioQ9AghDMcw2UtfgZQ4HX5NMe/Fn9E94SQLTfvDTHaAukFoJE3gRLVSGsOSr1Wo
	LxdiWs9z9wPR8DjKcgMhQ0KS8xrdITqvXQY/vMVlB4AEM0LezQlnETMYrgd5vGnK
	PqvCvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhcgta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:37:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso48754085a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788428234; x=1789033034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzWqbZMIo4osgHzhiKJA6eNCvt7He3vUmWl4Cvox+No=;
        b=EQV9MquytSmSv3gZEYBiV63R1QkCncYgBQAmMQOhWymn7iZL5ggj5oQzzJDV9Y5078
         fo4ePSiSEPIfx/QyeQJuDlyLpybwc4xe20CBQyWI1M2Rv1804+AtP/T7fEKpq/mk6txA
         ECjmwPBPRbDKmzBdzMs6J8XgOwUWBzkdO+o58xR3F+fhQOLHA2JlGTSxawLsWvJhenIR
         z5sW/tQEdGuUBWFZAVqOMcOHEh4CvaQyBfxL/2TSF9KkVxF9CuP/nvZW97CVXi74LxQm
         4z8e742yxOcrobDRFbB/SYfIdZ4RBaCBivBNOlsbXUz9qXQ9/39C47vABMyfnOnIAefm
         CTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428234; x=1789033034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzWqbZMIo4osgHzhiKJA6eNCvt7He3vUmWl4Cvox+No=;
        b=UQFsH7vyBUPAh0UMFlMrDdST43nWfjgiVxtOqeHHbuegspb87sF7xt26d7CqdrF+/w
         P/lf4ko9JaEpIMDAdxzGMKAY4DUgaPtitlGMkOwkbR5jaBZNYJjdrAaDZ1OThk8I1hVz
         3u2SwW1WOYsMIyDmFmgNCu1IEtzL5fpMzn/MBc1iW7zd/mvHU11g+Lu5I7yJIUJhY0wI
         d4BTxdZHbqa1dRZzkjFmMvktiMvJE3ePablxN8Egyv32kG7rN4f0POG8UEihwg2yuw8N
         2yDswiClN6/tF4ouj2q68Ox6RotFcDKHPyKtgo2AydADkO7xJkV9r2VWZMOUjWMFre+v
         6n7A==
X-Forwarded-Encrypted: i=1; AKwUvByH4mnahmO1OAn/6VdDX0mwcgs7hqacNbN9whZCYqev2pOtxs/OaESdKZ/1B5siCzwiLne0PlieAUkG@vger.kernel.org
X-Gm-Message-State: AFuF++miGGzzlbwMuM8Ls8UbSsyXOHghJEYYenjtTSw06Xp28aE+pXRs
	k+dA3h8ooWgA4g04N+MxaBMVYR2AdTAzfAsIGiCAtpvxUP5T+diWLnaG0UtvHulAy/E7hnIdd7J
	yOQwkumq+h4/pnu1H08igj/QQHXdnVYTnpeuSdoV4nC8eaZYlrSPiswMw1YK7eEBO
X-Gm-Gg: AYBFou0fSv22qWyPfiWrzDL459cHQ88oF5i/naiK0jEbHWzxsf8eHegCnIRQ+O9fzun
	1cX/on7RuY7MHbRqe7nTgiWr6wpIZevShn7ulwLsN2T+xa+uOSTvJVEHX4xPcCn/a7XWpBfcU1L
	gvkU1huPe+XAsmmeSDwPVi83yF9VOZqjZB6R1qX647IcfKgRVNi29C65rr3UWJlQNNj0VnyVm7+
	yEN98wUYWRGxCZR9CL0wu6k95BtK3gour4ZAk4MMjEObLm8knmzNHfsBcV5SF5VIXGv4PB00LNu
	V6GPkd6Ok/BUjI1aJRRU/5Mgwneo3vx8ONXHundX3kD+KJXxbTW+MZBs0x0ZS3Zw//3Iv+x3K0b
	nJ/m8UPxBo8JIgKemsWwyRw==
X-Received: by 2002:a05:620a:489c:b0:939:6c63:a7da with SMTP id af79cd13be357-9396c63c202mr504118285a.0.1788428234113;
        Thu, 03 Sep 2026 02:37:14 -0700 (PDT)
X-Received: by 2002:a05:620a:489c:b0:939:6c63:a7da with SMTP id af79cd13be357-9396c63c202mr504115385a.0.1788428233634;
        Thu, 03 Sep 2026 02:37:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f424528esm72013266b.59.2026.09.03.02.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:37:12 -0700 (PDT)
Message-ID: <c909e82d-a94a-4e56-976c-ace85080133d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:37:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
 <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
 <vjgskn34g563t3hre3ypg7ocueywzt66o6zusohqnzetowfwik@nn6yaq25jono>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vjgskn34g563t3hre3ypg7ocueywzt66o6zusohqnzetowfwik@nn6yaq25jono>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IKW7sNZjFaerXaRdHXsDQZDF-36ySG02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX2vTanK78L8Xc
 rp4OnC4qbKBATSIdYcuYNrMVARbxT10i2VkkAN8OUKMwEwChtgCbaj18rMcSPEq7VEYnrdy2gcE
 lbTT49CchvAaJq6cuRms3mbowoDGMWKPVcKdcS413fZH8qRw/0asBPX76u8pZjvppv4WGYImAVF
 qWr+mUorEm0SKb7Ucz0aNaxZAxPhLyYgXnqAqHS2wr7jsUdTnawbRD2VCYnUK6k+pMrICboRObc
 D+oVx+dVeztEfTVTMjz6UZLALXVk9TGissWyXFgDkO6KmhYRH7Wvi0jACUxU+2FB2IuMYAj5Cbe
 2IYPWULPDKVxrqW8ebXHTZhookZMGsc3m6/JAYbgQ5/klHKnkD1Q79n2pIGpD1O077tA724VuAQ
 PxOxyieVLuK+TK2ySjq/ik+QiZpoqahh67SMtzJe/Ldil3hI+iKVWCw3Dm+zHh3zwfyBGBqFiNc
 b9zKQPlOJ4W0XhhwW0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfXyMFBFXgq/Wpy
 tkeVMTMPQPYNQvINMmYbQjTP3F36yrgVQO3ubjDlEvDMhTql5/9zpghjmru+xkhzT2tpmlkgM/0
 CX6ioQTiEKO4WhbdU2jmAtrUxtniaDA=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a993fca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ox6tuOH3-mkVs-antacA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IKW7sNZjFaerXaRdHXsDQZDF-36ySG02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030083

On 9/3/26 11:29 AM, Abel Vesa wrote:
> On 26-09-03 11:16:20, Konrad Dybcio wrote:
>> On 9/3/26 10:34 AM, Abel Vesa wrote:
>>> On 26-09-02 17:53:23, Konrad Dybcio wrote:
>>>> On 9/1/26 10:06 AM, Abel Vesa wrote:
>>>>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
>>>>>
>>>>> On some devices, toggling the embedded controller reset line makes the
>>>>> device not power up at all, unless the battery is unplugged.
>>>>
>>>> Have you confirmed that behavior on the CRD?
>>>
>>> Toggling it does nothing observable.
>>>
>>> However, the documentation says this GPIO is actually tied to EC reset.
>>>
>>> I still think we should reserve it, just to be safe.
>>>
>>> What do you think?
>>
>> I believe that contradicts the reasoning you gave in the commit
>> message then..
> 
> Yep, will rephrase it for this platform as:
> 
> While toggling it from linux doesn't seem to have any observable impact,
> since documentation does confrm it is connected to EC reset, lets reserve
> it just to be on the safe side.

Have you toggled the pin into the correct polarity? The EC FW seems not
to be handling that pin at all, so I'm guessing it should be just a dumb
chip reset

Konrad
