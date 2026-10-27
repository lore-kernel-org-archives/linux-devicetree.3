Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080104;
	b=keCOZbwQ2nL0Ml4pEt491uuaoqiQyxP9nzUg2YPsavrK6oheDHvYxl6NIBDrGdiVB8V4
	 4Bc03qE9f3p0qDPPpHXGkDa243C0rzv5phs4rUtBnMwnZF04cuJjWRFGpuGz7OH7lCmgd
	 jYgPYdvObPGDXfnEYL0b4Q+VzX2PG7isMwgvOQjgvTiAUpOaSKG94v2KPX1aVW6w4U9QX
	 clbVrgHQq72zuvfGQSkAw7OnhGyOsU2EClLWe5rrWI9kd7OSdvFUUfK6PI/xHx+H/oMMX
	 jRdTjlGl9oInRgd+Oq/OVQSx5+Ly25HKnGgE3PgZwkxav39WISOX6TFzj28Ya1qaEjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
	b=xYRivSio5WupvG09mP5aDkRkNNW8Sn4C3+lyoWQkIF+tTkpl0GmxlQMG8T7wDly/SUlY
	 RgBHWmwSbbbiBXcL31OFmBtJ5qUJEh32EEIZ3l9ctjjhjuAIWEicEB4j5wTOFdYtY8MFE
	 jzZ4sUcs377ipmozrwjaOXdzLJ1j50okjmVY/JHftMqldUxQXl/pKTp3HLs7kybT5fA9K
	 slH096snz4oQsKRTJ0iXw0hovL/1RCn39Yhg6tj3AskkRLtF8/hAA1UMG79q5ofRJ0jCX
	 34e+/RQpYsZmZk0Xkir9zmnnARFrbUb4i7KDnOOlHYXnu8TUxIjDIY5nNC6iRtJLQ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kw6X+lgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KEk/h1jQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E9606A329
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 744E9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kw6X+lgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KEk/h1jQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YvFP752072
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=; b=Kw6X+lgnXrRlD6sO
	n0LqdwhzK5HQiwnbjJVucUMo8QaixvlobbRKcKuB5pkg/xYhJBo+Zz3J1GPRaNRl
	LjsmBsg0vGlNlgM48M1V14ZVU+BQmSSSD4Hv6iuB/a8VvZq2ESN3eYRUhhNLj4bO
	Fu51VRgld6cYq2dsueb7rHbfvduZ3zetGi8ruxs4Waieyh79rovR8X3KbTA3Fq8+
	cTGnLCg+EXDT/Z4yHF9noV3xsn8d0pchmPpH1sTZ+QC/qeRdMweDMYDy5uOkS1Iy
	57JsmbSZChlZOV/UKfbiV9WtFMh9ywogZfkrHf4MJBKDTExx29+WCFWykGlqOoD5
	1tjAzA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmma3yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:48:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7922418eec.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 22:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080103; x=1793684903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=KEk/h1jQDSrlQb3o57wFVjGo5SwPXwpOp2/AA1Hd5HCpQDWjemFsk/+VV1cMp5y8P0
         jArGDPAdeoTsGKOu0GdaSzPLOnvfAAT70X7Wmpt+Hi6UznjFop3yTVZwHcLdZMC75my1
         EWiUKO4wqpPmKFiu006fXeo9QenYu+NNm6FJqSvZ/iTOmyCMgusedFGfKOEc7Vcv3/Ko
         h70m0P9o2MUfn33stWz54YLHXFNG4yPuFirPynuV5vM/NjmrTRucMIZzgHfDcUmppbGd
         p+gfegDQrvGNQ3cNdr/xKbQS3pVNC9huMxppFCgHqaZnV4grP9VanVj9fUzEWy4JeXjP
         F0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080103; x=1793684903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=n7QUaDqasXUcma2rK6vkM3hYYUZjvdjwol7LMg2bH2aGWAGcA3irXlcO4kxjQg50Nk
         V/Va7+o9F6oGNEM1Yz+DS10ZFJnV1ox2mV2RFfOG/W6mfm7nbh5v6Or3j1v3ofpPixm2
         ssmNsaqP27JUvEuD2CDiie9HtpSucSmCLkXJwK5CTFr+Hw62Uvv8TWiwDs2y0a56K68F
         BNfvfhkvtF2CAV6pSo3NJxjvcMEEpq5fa9ezG5FeLYWsBTIcA1/iwqcvwSmihQ/FiII8
         POsHnoVXPJu1DsqbqPBT3S1OjFLlySo8Vgc/PGaisgNH55WQv7tU/vpNvtOQr/Czdrw2
         DyXw==
X-Forwarded-Encrypted: i=1; AKwUvBwP0YFS3w+rWoAqt76/3J79tpG3VjuQbLBnhqXPRc5rTVqj9WC08K/UMgXwlcpj7xW2s0DHCBJfRWqY@vger.kernel.org
X-Gm-Message-State: AFq9FYIZWn1upNumK6jCQWVjYaLuRr+PMF1sW4gPVBcSozos9KVAsGOs
	FsL+Z/1qYI0/3jTd/qiwT2hZIGJ+jNx/+btN8LPxzv2+AqtHvtbKbf1LrrECKcYsvnA1bLW0urM
	bPjDI3mWO/OUPY0K+9KbV863w+T361fzABvA2LAF2PX1wanZGDQAYlv7udey7zx34
X-Gm-Gg: AYBFou0rWtUrLa890JNhMkIv99Nl5X4tgxxO9FT9jOGcz2l7VSif9EpkXOWOLlN0IOe
	XNiqi49lN/SIW5Q1bsA1sy28QAKIr5TP5BD7A0xgMFyN8dPwraj8OjAR9XIh/jB6vZiZdgyN2Rq
	aTBzE9xwp0znd0cIApSVFPsTN3tMrOSDauPP+FZORA2MDfxO2AzAIMWC3wsXLx5KJEa8h53DOQu
	J6KZwyOCQGKkHEcGf8l1A9E2Dq5FKGeitohr8kfQGLugPCImfabJ2yXPvzDJ2p6al0z+OnKTURO
	4I5xSFK+Rn0pClQLF0g3KWSR6a8c9CZ70olZAPPlralDrnj6K7AZykGNyzz0PrwWFrvNBbR6D/o
	danO93PSOT+NovnyPMXW4Gki7EQ==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11695255eec.11.1793080102897;
        Mon, 26 Oct 2026 22:48:22 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11694676eec.11.1793080091301;
        Mon, 26 Oct 2026 22:48:11 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm39226087eec.28.2026.10.26.22.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:48:10 -0700 (PDT)
Message-ID: <9387d067-cc44-40e8-8d60-d547d222522c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:18:02 +0530
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
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
 <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXxp9AjQHv1iyw
 onIn4t1OMAYf14xnrGjkVqH+MFp2SKuMC+f5GlgkM4TwGClpIMliFiO/mMZAuDYPZ2i5ctme/0s
 wH0Tlm31fAlNh2c3CeFcG6sQX36fJAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX7GAr8ZcBPe5C
 Kq8LJdkAUTZIUoZN+gVQmwBlEz2iBb4RfiwmwDzm+pr97z31Bzxw9C2gmmK6s+CMNzEIRfo5FEy
 qpZvsyt3EQPIgAFMlhCB3az60zpGKjB3DziRgEX/+ZsE8PBKfyhL62pnqzprUqrldMpjfI4RTad
 cDFRU1DAYxBjdcBifvxmhLvUw5ll66O2BmJdM2VMmDCKRwoE0nIpi0V9y+IuGlDWaP4bdoAf2y3
 PlMZT3AxSc1kVX0CrRJJ8yuk/FDMHVa414DSDRVDocWyrkuTX3PKLdImBnT8mMBXQ7rmnzUnceK
 5Dw5p/g0t9FARyB1RJp2vWIa1AywlrknpAaNuZII6vJ65DfTkfZnBLnO5C/+fzPYNSu6Rf+db4p
 ZGlyhcQipkwuaNEg3jqYmHJYbqJuFa29GzkGhuFd63lZMNX8+pCktBuQtKkjiy/9b8v+lId1J4w
 uirUS0+YObKlJcTXxhQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae03b27 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EBxl5K2b24NMC96zZi4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: BluLzRdlV-XJzTszCXQdEnFZ_i4bItHL
X-Proofpoint-GUID: BluLzRdlV-XJzTszCXQdEnFZ_i4bItHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270022

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> Patch 1 introduced it!

It was done to enable LPMs in Shikra without depending upon MPM changes. However I get
the confusion, I will combine both into a single DT change and send revised series.

Thanks,
Sneh
