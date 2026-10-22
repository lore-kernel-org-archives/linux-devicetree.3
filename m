Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653752;
	b=k2/bpP32PfiskTY5mV8Z7t34l5YhPPqFTsSKsI898mRPNHp1/sEFlSNT4lGRJ9dUYGOq
	 9fStMG/061QUAj1EhZuVKPH8SeWgRkG5OURqXF/DVU5Lm8hskgDAqYRRQBotMrys6AXCp
	 bQulEposjj/pAqIMO1jhC4zBpzuMEnXV5wpZt7Wn1U5GJXDwlYp6r5Q7Td8RhBYmwcEDX
	 cR9eqit9u6illMwsYXjaQk49e6PA+x592Kk4OY4ij0wgE7WiFXpVXLnUuyo5MdLxO7AkT
	 bigruKJ12LF1q17z8hPCU3vscgq2ZS4+Xitk/uvJAjN0s4rQc3A7uk89sJgf14ArNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
	b=XX9o/gNWt1Iqftz49vTgWZN42PHUkONXAutha4vl4F5stWR6kcb/H5HwtiiVjsi4+wfe
	 0XT4xpwxhT+Kb+lZLYg+XZleymhPQZhF1zOrRNROEhHvrMp2l4KE5XGKb5Q+CbwL53aZj
	 xlPJDoaimuXKBJLOXmLg4z5aiugMzS9DtzIOCQjLcZYwH/3IQgH9KsFMkc8IlqEtQgqGH
	 12XZ/tj3RtzCe4u/n8FtW9Jw8BLSwNTKIw9em6C4zroWyaz43Rbsgz8hYqcQhgWmaCXsW
	 auc3KlSzAcvmstZuPFzObz+Kc4AB3wOswaa667ZWuvy0e2v8R8Dbj6BPmtUivk0ZOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ihgv/q3G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPubOZCR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAA606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ihgv/q3G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPubOZCR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705TU4110632
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=; b=Ihgv/q3G57uNVXCw
	80iLuQi0Sg1ExxGXzcaxYUxHWIj4JYmi/3xXoDzfYN0VxU7u1hxeKtNkVWvpwsOV
	ynM2+Q7N0zEjljMGsMg1L0Co3OmZp93hQayYb2snGv8sqHnoXT4ZmQ0ceGjuX8Kj
	J/zPd3fYkZaCk6CbCygkxzpnzE2HRDgmkDKHb8F31TKU56gWvFteFr/vyJuRPmOS
	2wJ7VAFbLzGJo2YjqdFfA8rywdG5wCJnRrWgC3IZhs8mpdGz0MhkHf9lVdsBLauO
	UJx+Gog8qKH53Fbut9RaZr4pN2Ufe/OCKcGjZYu6XjUBrcB/hmQrAW3aPoZnWzZ6
	qsIjbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ah7ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:22:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso46168985a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792653750; x=1793258550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=UPubOZCRJPF+Ck6OVbeQJrQkMXKWKRmOZhC8zyJrVxmvj9DEUd0AXpXeLj2AZshleJ
         9IrZG7xuQv1XrYltIt8/xiKcP2q7VTAmI4zPZ9ZvoKNNqr76igDZMLyzqTc4RnOtWJVJ
         72xgwZpjnbqHHNhEH0NLcN9GiQsFpeGEvRsxOkI7KVQM2vnXOsKvYxUK+BKUYqV1iBXx
         h1ATerG+iqRgVe4ItLbixZOm/ukzMk42zAFCa3SpQmlJhFkhCFmAcqrYVpspySw9ElKd
         3eJEjTPXW0KlOCCOoC786VKnqW/ULg3kOhMAeyuutMC39IYBmBo0QXEap8VnxvQvcat8
         JnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653750; x=1793258550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=HU5S7+3cspc2G/PyBGTqV+R4LcykgfGDvRsiH7w9BgWqTPVinq315JaJwzoSlhmvn4
         zA4GBVHxYSvB3EFL3qsfEZE8t035f2R6lEMtwfXGhvc1ZDCukconZvMK3IQhcoYXiSw2
         qyxvMZ/Acn4vFgkJawtu67Hdl37lZo+8zqbU32IiUVhWxdE3+t6rh1HaMEF2L2Yjq4Wu
         df3R/80WqjchGcnKKu7erpbLRA0uFZ1AP8KbH6pgAKbAdmdMQrXAKH0At8IINzppF+YG
         Mxi35hyvEgRLqbFsM3Tn42xvUPhKTPLvYH2rz1Zcqk+/aqxJjOfnDYOBDj6n4W3l8uX4
         lAQA==
X-Forwarded-Encrypted: i=1; AKwUvBxPYRVdohmY+dI0s76jBOKi/uNTBWBVrITynbPaj2s21YymF4bIJ2xTaR6sHwDeSlEexs6HOnAvuSed@vger.kernel.org
X-Gm-Message-State: AFq9FYL1L74DeNNhwGuz5UNFZi+WFV6hxaa/oEUMi41e7NKL5HUrrTXS
	Mc+yx2wEpERt0jXPu1kQWfGR3xu3mT4ZAqeY1hD1uHk2kqYZvBscS5SGIt5eeC0/sR/qegywPNk
	88qYL7KVc8Zc4ZpmWNWG7jQmLW+EEIh4ONEZLsGxX3uzd6iS46OBaSi3vuox16YJR
X-Gm-Gg: AYBFou2dtiPc7Nsnk3z+I3Qf6MRIn3IODPYf4CMIl5FueKUygPsu570Y5ZYojZvqpFK
	RFZpFnWfT6f/IEpP3cUV/JV7w6gJwbyOI2//mEoJnn3rbd4caDhfzilecm9EfpbgqWHGIQy1Yn3
	dz+1I/PIE0tPxhcNIaROIyjCpQYjYkxtxVVzQU8YbnJ3XmIc3XZiCaimovXAlu7YsiowKw1yUFe
	IGuuu5uXER9W/DDDXMWtIq74nzEyF56f+FcK8jlyihAGZZ9AB9LImWBWluTTuHujCZUcGemJPVm
	6EA+M9oCgaA7Qc4OK9FeMooueUZLGaWX/YJ3dAgdsAjVIMIqui3qfDvjoNP2evmZ9soOnDhtni/
	s+0NoMGF7hSANRGGd8MVczQ==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923298885a.2.1792653749738;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923292885a.2.1792653749300;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f29aesm77548366b.11.2026.10.22.00.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:22:26 -0700 (PDT)
Message-ID: <11d992ca-f666-4a4b-a511-ec12335e6960@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:22:23 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
 <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
 <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfX8e68gWjhlGkz
 b0P4egyTZyjf0dgnrpdfBEMs+DWZQw2X3Dtc7fw6fzkoY9GOYd+J2PT6HoG/qgGPuABzhmmyADN
 LE50SgxY28Xsx6+ikHOvkE/dAOQmi0UbeM9Q5KTbznvMOEo3mDC7nLvlXdYmhOeR4haLsC3dmmG
 +SBBO/LeSoNiidzW1/zRbY9KKxWpQGAHxYz+Ui+1dR7k6pKIPlIU7dhYqHaQWaurPqSLpz96W4F
 xLBpjMM9aYlabjqJoMpoQlE0eVotBGSNRl+pg4olyjS2Voca5JiBOu5UlufJFBZJICqo5M9yn//
 D6/gdSmcX9DgVejUnoSGwUMdtg0Jyfu5XLPOsKNFSYv0vh6dn2rhBAbXVc4FXFn437fHdmD6kLP
 v66aZz3A5ZswzHFJWM8jCiCZEFwj9U2kv/odxnLBPndPNZhoTsqD/DBHSsvsOX9QdZGezYRjap4
 YjSXIPtzmxHR5OEQZIg==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9b9b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NNcpZA-_c-qG0gzoYGoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FOt6wBP7IVWO2cmSaEoTVp0fhC41uKHT
X-Proofpoint-GUID: FOt6wBP7IVWO2cmSaEoTVp0fhC41uKHT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfX5TjMLShnez2V
 lh7lqZ1aWejAnjygjSu1ggjvvY0VFZwv59ZQ/QS5Zr3vjoGGdhSCQxPkfuibX/16xodRCQfzlZJ
 nVUZLpjv3TlPdnHXsTXru08x8tRDNT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220029

On 10/14/26 6:32 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 06:14:43PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> A failed OPP transition need not leave the clock at the last successful
>>>> OPP's frequency. If hardware changed before the error, the default
>>>> single-clock path can subsequently skip a necessary retry because its
>>>
>>> What is a necessary retry? Shouldn't it be: try, rollback if it fails?
>>
>> The failure scenario is:
>>
>> opp-table {
>> 	opp-400000000 {
>> 		// low
>> 	};
>>
>> 	opp-1000000000 {
>> 		// high
>> 	};
>> }';
>>
>> 1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
>> 2. A driver requests High.
>> - OPP raises the voltage to 0.95 V.
>> - clk_set_rate(..., 1 GHz) changes the clock, but returns an error
> 
> I thought that your previous patches actively target this. I.e. if there
> is an error, CCF should retract the changes for as much as it can
> (assuming that there is no extra error on the reverting of the clocks).

Right, that's at the CCF layer. OPP also has the same problem and
needs a similar solution. Perhaps once all consumers are migrated
to clk-dvfs this won't be a problem anymore, but that's Qualcomm
only.


>> - Assume clk_get_rate() can report the resulting 1 GHz rate.
>> 3. The transition returns an error, so current_opp still points to Low.
>> 4. The caller tries to recover by requesting Low again.
>>
>> Perhaps I should have included that in the commit message.
> 
> I think, if something changes the state, but returns an error, it's more
> or less... an error. Or a bug.

As we've chatted offline.. you can try to unroll.. but if you error
out while unrolling you have to unroll the unroll. And if you error
out during unrolling of the unrolling...

Konrad
