Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06744FB9BA
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858604; cv=none; b=h6GitsAkJ1nYBkthq4ANlmEFG4t/ZBf9tShTIjsPduHYLJAyCYzn722uMaS6Q0nVejJ+aU8ghnOOyCxadi73Exn6/YmH2Z8DmogXlKxl9mhkI3gh/hccwGaaclQTnQBs2Gi0562xwqfYwpMS9JN3V5cvVHfh3HCrNRiBSz7oVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858604; c=relaxed/simple;
	bh=0lbcg30VfbDEHabWYRQfygaolUEEcg4i8tSmHoWaMJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPsX9Sr++2XFts+c9nPxaRcQr1/MzzRqKJdP5XMtSjdLw8+Hw4eRsjQfx4oGJwCx0Pmp56+sbctVnmib0ScwJGSY2Z2tnGVjacuCEmElAqT/5TwB/YFra1kPimwC+T4DPL9My++uC6MssAJ0bPYohj2PjvHbidYNpZJJbZ3rDKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdV7IlSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAroz1Ek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdV7IlSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAroz1Ek"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M5WT2363340
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 09:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66IdAPMFdrF+3AsnysbQZd4DS6/AZH+7mP7W5M9PJSU=; b=PdV7IlSwPCmo0l4S
	lwhkgzdU3x4ysNJvqdFp8ZbOspWe8r80dj7MrHr6TaZbNkgj5X6/0b6/B9P2P7Wy
	JCxZwq6i//pyAUmYGFQZcfAwINc3XEshKOs5BMvqY2u9c2RpBBsnzJ6APCU/06ye
	hUiaEt1wabfdgIeSq0XP/0pj66yCNo/Hjkn63K688GteAgfDsn4fcN8GR6l1BF1n
	MH+FVmoKYyHdYAh87Wtmvkd2t5pmbJiviAz8D0DJb8Gbm6MYaKbY0lcxV0kBY57F
	dF5w56mxtP3d/x8ZmDqMtbObgJV/27+CSMzagfKN9w0GGKzLEK3WKT7norFpyvfP
	FapYPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjaguh7tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:10:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939694871aaso696563685a.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788858601; x=1789463401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66IdAPMFdrF+3AsnysbQZd4DS6/AZH+7mP7W5M9PJSU=;
        b=TAroz1EkcpBHufYIBoFetkWySIia7GRa9JfnjM/n/vyfY5DQQmWZ5iUWXDfFEOVnNp
         RYmWTDv+LDSpwxj4vkBhMX2wYaOGsNWQU2mWYz/DWY4lNRDUEmQrGRrABy7IXkKLZMx9
         cvtccGkkDU5vm2TD3cZVRjzWpMj8kZrvwpk+mvV6jAmOPx0J3F8j8WF0Gk62y2PVQy2f
         MS58fG2Zy7H0n84crCSOSQ0nK2AjmEOF0EHLPPZUnyFTeUSsNghFRFhsNzivZ4oIM18i
         wf4bfInKABeHCPZPYCicuBqzKZ/dzn8voyDeBTKjhCCkwTMnuCRFlLGLmp9dwR5owGJa
         i5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858601; x=1789463401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66IdAPMFdrF+3AsnysbQZd4DS6/AZH+7mP7W5M9PJSU=;
        b=OOhjX/okRJIaMVGEtUUyOaqvejV5rNsNJ9zJuNmi6HKQwy9IaAvQIKhEI0ff4paR9T
         UEn2DUI8NntgWoA5rDB4nMCQXq78fb9zJW2rfNugeG156lOnDotZS13H+LtwlQ/7tU+9
         /FuTCZstIUY43lbOYTxfcJF4PTqkAfkUcaSLq8/UYfrQ9exS89Nl6uen/28C+1mwSKOC
         5Zd6nQzXLx2+og4ObbvX4hXivQMVzfgqTAEreF+G9il6u734sos46holT+9ePZoO71T0
         9JRuC4q1FYsnqLJpEemEQZx32nxIIDQqWJ3YSG0CTeACflkJkIu7b8RHffzI5P7U7ld8
         F0Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwDUQGELm7GolxXwy6Y6vKOiUFm5kLBzCwXNEPRr2N7KbDE/46S4SqSETO9u9DnBrPKkwS9lP3xorFX@vger.kernel.org
X-Gm-Message-State: AFuF++kV8ZuAkiXa7AdVCHzbnwRVUySe4SVut8D/7b2wntIk/zqh3rOK
	pBUDFMmdAvatKKSOhgLR+DBgkdghOkWhdS8m3AipPg5MlK+5l+RHV1HmR/b4bWogmFZ2WJrHOmu
	EJdI+b02LN/aWbP9/GzPqmpPUWMwPC3uNulclb0vY1f9Lu6EcKqZKEDUD/RrBHBBh
X-Gm-Gg: AYBFou33NNxKawTA4Z/te2l7cP0KaHuQ3embwZxzksYe1ShAtIuwqJi515c6QXjN496
	6DN0XIcoB2sikQ/GHP2k0oMxSWqLWBawFMyyEIRmK9mGAbIpSg69x9OI40HmVm9uoeraGOo9fyi
	25aHDFYQsidnI0Le0eUKTVKtWYODUOJTonSjYZV08rvw84c8OM7BqtF3c0r5Vf8n/9gGGw4YUkb
	KVDgeo0yyw3JMY1Mozc7RQUgOviZl146Z5RfvpuvlWvkTj3guABB9Zc8L20ghqA+8owxHMw9d0I
	QK7DhmU17t/GcAgiZwtA1qq+VtsTPuarv6eucCJ9hC+LmcL4EVtlen+wpqaMSzNu3bxggXWTMGo
	OY3Bz3ntnKJaM9nOxS+feaCzL81Q=
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2996919785a.36.1788858601044;
        Tue, 08 Sep 2026 02:10:01 -0700 (PDT)
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2996914585a.36.1788858600581;
        Tue, 08 Sep 2026 02:10:00 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm523030366b.4.2026.09.08.02.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:09:59 -0700 (PDT)
Message-ID: <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:09:58 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fd0e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=RmElXddC3YRLYRTwZzMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _mp0Jx4aFeLogq0dIu66haHpqWRQiI2g
X-Proofpoint-ORIG-GUID: _mp0Jx4aFeLogq0dIu66haHpqWRQiI2g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5NSBTYWx0ZWRfX001U/jS/vISg
 BCSGa7oXltpj2MI/jwqDDvlr0D8lvNEFD5IqoW3SCBd0Ao5/20IaxXisN9z4QCRJ1AI216M45lH
 q90/OWCOVxmXcVM9UXh8hpDbFsDThAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5NSBTYWx0ZWRfX0GCoB/chl5vR
 jkIvbw4iar3/8urMfwTWZkB2hQHV/xHtg77N6RSZqMsIuxIUxtSp+Q0+lk7TFoQPVhs/uEx6Z3K
 ch1/+GgnJRlVQ+52h9IzbEtQhTn5yGfyiXJ7Or0IZBuo4UEe2eLZT4bIoGOSv2Wz+MkvAeea+dQ
 H6Fq1wx/EYfeLf1B82ICkBmjoK/E43NWKov+9pN9vHNLfhrI1l9Hw87hrTyyQkyVwtK7Wc8ZgEH
 LlHOZ91XYqtfobruKKiJ12ux3Vsy6bDm2Jt/mOsp8OCb4Uj8j+SyIGXzHFT1KOjQTFOAWof4BaM
 IIxybCq6qCgWzH8bu2Ygp9hRlefP8K26VYg1R+JxBKbhJtGp/Jft1LQpsjDAC3pjJfRfNTk/O0M
 Oh3e4YDs3MS9L4tA8MsinP9Iv1vyon1JXjkHEd8j7iZvjXsH2HJ6eX9i1nZuKRn+2dj3NYjz11N
 LSxqmpkTxq0HFggj+MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080095

On 9/8/26 9:49 AM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
>>> My take is that rather than encode all properties in C, it's probably
>>> worth exploring a DT representation of the concepts that *can* be used
>>> fairly easily and make the life of codec vendors easier - not as a> literal translation of ACPI.
>>
>> I agree a DT expression of the *concepts*  not a literal DisCo
>> mirror would be a better A.  I want to bring that back to LPC 2026
>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
>> feedback rather than re-litigating it inline on this series.  Because
>> B stays put, switching A later is a change inside populate_function,
>> not an ABI break. so landing this series does not close the door on
>> the representation you're asking for.
> 
> I am still not sure I really see what the value is in a
> completely different DT representation of the DisCo information,
> all it does is give us potential issues with future spec versions
> and create a whole bunch of new code than needs maintained. The
> ACPI representation translates perfectly well to DT, should work
> perfectly fine using the existing code.

I totally agree with both of your comments, there is no way we can
replicate MiPi spec into an different DT representation, this brings
both maintenance overhead and is fragile. This a very big effort.

Either we represent full ACPI into DT or use some know representation
that linux understands and is maintained along with ACPI which is the C
structure.

> 
> However, that said if people want to work on doing so I am not
> going to stand in the way. It does have the advantage it might
> unblock things with the DT maintainers, since we can focus on
> doing stuff in a more traditional DT style.

This is really going to be a very very long shot, but as of today the
need for this is slim, unless we see some platforms which have SDCA
compliant codecs without a reference ACPI fw entires.

> 
> I would also agree that this is reasonable as a half way house,
> it seems like a good fallback mechanism to have for emergency
> work arounds as well. If we can't reuse the existing parser then
> there is a lot of work to define a new representation for DT.
+1

> Ideally that would be worked through with the MIPI group as well
> to avoid future specs causing catastrophic issues. But all that
> will take significant time so we probably need an interim
> solution.
> 

--srini
> Thanks,
> Charles

